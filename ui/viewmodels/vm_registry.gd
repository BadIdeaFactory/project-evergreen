extends Node
class_name ViewModelRegistry

enum Keys { TIMER }
static var registry = {}

static func register(key: Keys, view_model: ViewModelBase):
	registry[key] = view_model
	
static func retrieve(key: Keys) -> ViewModelBase:
	return registry.get(key)
