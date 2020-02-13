module Functions
  class FindNode < Base
    argument :uuid, GraphQL::ID_TYPE
    def initialize
      @type = GraphQL::Types::Relay::Node
    end

    def call(obj, args, ctx)
      type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(args.uuid)
      Object.const_get(type_name).find(item_id)
    end
  end
end

