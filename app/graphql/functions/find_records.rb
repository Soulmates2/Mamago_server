module Functions
  class FindRecords < Base
    def initialize(model:, type:)
      @model = model
      @type = type
    end

    def call(obj, args, ctx)
      #@model.where(args.to_h)
      o = apply_filter(@model, args)
    end

    def apply_filter(model, args)
      date_filter_args = args.to_h.select{ |k, v| args.send(k).class ==  ::Types::Inputs::DateFilterInputType }
      date_time_filter_args = args.to_h.select{ |k,v| args.send(k).class == ::Types::Inputs::DateTimeFilterInputType }
      normal_args = args.to_h.reject{ |k, v| args.send(k).class ==  ::Types::Inputs::DateFilterInputType || args.send(k).class == ::Types::Inputs::DateTimeFilterInputType }
      o = model.where(normal_args)
      date_filter_args.each do |k, v|
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
