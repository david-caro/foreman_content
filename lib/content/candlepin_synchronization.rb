module Content
  class CandlepinSynchronization
    ActiveSupport::Notifications.subscribe('content.product.create') do |name, start, stop, tid, payload|
      CandlepinAmqp.publish(
          {"entity" => "product",
           "operation" => "create",
           "value" => payload[:entity]}.to_json(:root => false).to_s)
    end

    ActiveSupport::Notifications.subscribe('content.product.update') do |name, start, stop, tid, payload|
      # noop
    end

    ActiveSupport::Notifications.subscribe('content.product.destroy') do |name, start, stop, tid, payload|
      # noop
    end
  end
end