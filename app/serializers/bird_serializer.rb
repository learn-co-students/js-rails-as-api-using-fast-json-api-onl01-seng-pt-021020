class BirdSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :species 
end



#When rendering JSON directly, controllers will render all attributes available by default. These serializers work the other way around - we must always specify what attributes we want to include. In our example, birds have name and species attributes and locations have latitude and longitude attributes, so to include these we would update both serializers. For sightings, we could include the created_at attribute: