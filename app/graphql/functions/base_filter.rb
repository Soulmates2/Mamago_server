module Functions
  class BaseFilter < Base
    def initialize(type:)
      @type = type
    end

    def call(obj, args, ctx)
      o = obj.send(ctx.key)
      o = apply_filter(o, args) if args.present?
      o
    end

    def apply_filter(obj, args)
      o = obj
      date_filter_args = args.to_h.select{ |k, v| args.send(k).class ==  ::Types::Inputs::DateFilterInputType }
      date_time_filter_args = args.to_h.select{ |k,v| args.send(k).class == ::Types::Inputs::DateTimeFilterInputType }
      normal_args = args.to_h.reject{ |k, v| args.send(k).class ==  ::Types::Inputs::DateFilterInputType || args.send(k).class == ::Types::Inputs::DateTimeFilterInputType }
      date_filter_args.each do |k, v|
        if v[:eq]
          o = o.where("Date(#{k}) = ?", v[:eq])
        else
          if v[:lt]
            o = o.where("Date(#{k}) < ?", v[:lt])
          elsif v[:le]
            o = o.where("Date(#{k}) <= ?", v[:le])
          end
          if v[:gt]
            o = o.where("Date(#{k}) > ?", v[:gt])
          elsif v[:ge]
            o = o.where("Date(#{k}) >= ?", v[:ge])
          end
        end
      end
      date_time_filter_args.each do |k, v|
        if v[:eq]
          o = o.where("#{k} = ?", v[:eq])
        else
          if v[:lt]
            o = o.where("#{k} < ?", v[:lt])
          elsif v[:le]
            o = o.where("#{k} <= ?", v[:le])
          end
          if v[:gt]
            o = o.where("#{k} > ?", v[:gt])
          elsif v[:ge]
            o = o.where("#{k} >= ?", v[:ge])
          end
        end
      end
      o = o.where(normal_args)
      o
    end
  end
end
