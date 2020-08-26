class SightingsController < ApplicationController
  
  def index
  sightings = Sighting.all
  render json: SightingSerializer.new(sightings)
end
  
  
  # Setting these relationships up is necessary for the second step. Now that we have included relationships connecting the SightingSerializer to :bird and :location, to include attributes from those objects, the recommended method is to pass in a second options parameter to the serializer indicating that we want to include those objects:
  
  def show
  sighting = Sighting.find_by(id: params[:id])
  options = {
    include: [:bird, :location]
  }
  render json: SightingSerializer.new(sighting, options)
end

end

# The result:

# {
#   "data": {
#     "id": "2",
#     "type": "sighting",
#     "attributes": {
#       "created_at": "2019-05-14T16:39:37.011Z"
#     },
#     "relationships": {
#       "bird": {
#         "data": {
#           "id": "2",
#           "type": "bird"
#         }
#       },
#       "location": {
#         "data": {
#           "id": "2",
#           "type": "location"
#         }
#       }
#     }
#   },
#   "included": [{
#       "id": "2",
#       "type": "bird",
#       "attributes": {
#         "name": "Grackle",
#         "species": "Quiscalus Quiscula"
#       }
#     },
#     {
#       "id": "2",
#       "type": "location",
#       "attributes": {
#         "latitude": 30.26715,
#         "longitude": -97.74306
#       }
#     }
#   ]
# }