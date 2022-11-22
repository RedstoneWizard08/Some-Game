tool
extends StaticBody


# The shape for the physics object and the mesh.
export var shape: Shape

# The material to use for the mesh.
export var material: Material

# Our objects
var collider: CollisionShape
var mesh: MeshInstance
var mesh_shape: PrimitiveMesh

func _get_mesh_shape():
	if self.shape is BoxShape:
		return CubeMesh.new()
	elif self.shape is CapsuleShape:
		return CapsuleMesh.new()
	elif self.shape is CylinderShape:
		return CylinderMesh.new()
	elif self.shape is PlaneShape:
		return PlaneMesh.new()
	elif self.shape is SphereShape:
		return SphereMesh.new()
	else:
		assert(false, "ERROR: Unknown mesh shape!")

func _set_shape_size():
	if self.mesh_shape is CubeMesh:
		var tmp_mesh: CubeMesh = self.mesh_shape
		var tmp_shape: BoxShape = self.shape
		
		tmp_mesh.size = Vector3(
			tmp_shape.extents.x * 2,
			tmp_shape.extents.y * 2,
			tmp_shape.extents.z * 2
		)

		self.mesh_shape = tmp_mesh
	elif self.mesh_shape is CapsuleMesh:
		var tmp_mesh: CapsuleMesh = self.mesh_shape
		var tmp_shape: CapsuleShape = self.shape
		
		tmp_mesh.size = Vector3(
			tmp_shape.extents.x * 2,
			tmp_shape.extents.y * 2,
			tmp_shape.extents.z * 2
		)

		self.mesh_shape = tmp_mesh
	elif self.mesh_shape is CylinderMesh:
		var tmp_mesh: CylinderMesh = self.mesh_shape
		var tmp_shape: CylinderShape = self.shape
		
		tmp_mesh.size = Vector3(
			tmp_shape.extents.x * 2,
			tmp_shape.extents.y * 2,
			tmp_shape.extents.z * 2
		)

		self.mesh_shape = tmp_mesh
	elif self.mesh_shape is PlaneMesh:
		var tmp_mesh: PlaneMesh = self.mesh_shape
		var tmp_shape: PlaneShape = self.shape
		
		tmp_mesh.size = Vector2(
			tmp_shape.extents.x * 2,
			tmp_shape.extents.y * 2
		)

		self.mesh_shape = tmp_mesh
	elif self.mesh_shape is SphereMesh:
		var tmp_mesh: SphereMesh = self.mesh_shape
		var tmp_shape: SphereShape = self.shape
		
		tmp_mesh.size = Vector3(
			tmp_shape.extents.x * 2,
			tmp_shape.extents.y * 2,
			tmp_shape.extents.z * 2
		)

		self.mesh_shape = tmp_mesh
	
	pass

func _finish_setup():
	self.mesh_shape.material = self.material
	self._set_shape_size()
	
	self.mesh.mesh = self.mesh_shape
	self.collider.shape = self.shape

func _ready():
	self.mesh_shape = self._get_mesh_shape()
	
	self.collider = self.get_child(0)
	self.mesh = self.collider.get_child(0)
	
	self.mesh.skin = Skin.new()
	self.mesh.skeleton = self.collider.get_path()
	
	self._finish_setup()
	
	pass

func _process(delta):
	self._finish_setup()
