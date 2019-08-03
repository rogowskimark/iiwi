# iiwi



[![CI Status](https://img.shields.io/travis/rogowskimark/iiwi.svg?style=flat)](https://travis-ci.org/rogowskimark/iiwi)

[![Version](https://img.shields.io/cocoapods/v/iiwi.svg?style=flat)](https://cocoapods.org/pods/iiwi)

[![License](https://img.shields.io/cocoapods/l/iiwi.svg?style=flat)](https://cocoapods.org/pods/iiwi)

[![Platform](https://img.shields.io/cocoapods/p/iiwi.svg?style=flat)](https://cocoapods.org/pods/iiwi)


__iiwi__ makes setting up __Core Data__ stack (NSPersistentContainer) very easy.
In your app you will have to create Core Data model and subclass `iiwiAccess` with your own repositories. 
Each repository is responsible for __creating__, __fetching__ and __deleting__ one type of entity from your model. Every repository should have function for creating entity with set of arguments needed to fill all mandatory and optional properties. 
There is possibility query based on __primary key__. Its definition is achieved by implementing generic protocol.

## Example



To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation



iiwi is available through [CocoaPods](https://cocoapods.org). To install

it, simply add the following line to your Podfile:



```ruby
pod 'iiwi'
```

## Usage

First step in would be to add `import iiwi` statement

Then we need to initialize model by specifying its __name__ and __bundle__ where it can be found. 
`iiwi.initialize(model: "iiwi", inBundle: .main)`

There are also initializers which accept __bundle identifier__ (when model is in Framework) or __URL__.

### Repository
Accessing entities should be done via __repositories__. Their job is to __create__, __fetch__ and __delete__ entities. 

Repository is generic class which requires specifying __type__ of entity from model and __primary key query__.

```
class Repository<T: NSManagedObject, Q: PrimaryKeyQuery>
```

#### Creating entities
Creating entities is done via `Creator<T>` class. Creator is generic class which specifies type of entity it will create. 

In order to create entity you have to call `func create()`.

#### Primary key query
When entity has primary key we could simply describe how to fetch entity based on its name and type. 

``` swift
public protocol PrimaryKeyQuery {
    associatedtype EntityType: NSManagedObject
    associatedtype KeyIndexType

    var key: String { get }
    var keyPredicateFormat: String { get }
    var query: Query<EntityType> { get }
    func entity(with: KeyIndexType) -> EntityType?
}
```

As example here is implementation how to query entities based on id (INT64).

```swift
public class IdInt64Querable<T: NSManagedObject>: PrimaryKeyQuery {

    public typealias EntityType = T
    public typealias KeyIndexType = Int64

    public let key = "id"
    public let keyPredicateFormat = "id = %i"
    public let query: Query<T>

    init(context: NSManagedObjectContext) {
        self.query = Query<T>(context: context)
    }

}
```

In order to avoid implementing `func  entity(with:  KeyIndexType)  ->  EntityType?` there is extension you could use.

```swift
extension PrimaryKeyQuery {

    public func entity(with key: KeyIndexType) -> EntityType? {
        return query.entities(with: NSPredicate(format: keyPredicateFormat, argumentArray: [key]), fetchLimit: 1, sortDescriptors: nil)?.first
    }

}
```


In case where entity __does not have__ primary key we should use `NoPrimaryKeyQuerable` query description.

#### Deleting entities
Deleting entities is done via `Deletor<T>` class. We could either delete one entity `func delete(entity: T)` or delete all entities `func deleteAll()`.

### iiwiAccess
All repositories for your model entities should be defined and initialized in your subclass of `iiwiAccess`. This class will be responsible for __saving__ and __performing operations on context__ (_NSManagedObjectContext_).

#### Example of iiwiAccess subclass

```swift
import CoreData
import iiwi

public class DatabaseAccess: iiwiAccess {
    let bookshelfs: BookshelfRepository
    let authors: AuthorRepository
    let books: BookRepository

    override init(withContext context: NSManagedObjectContext)     {
        self.bookshelfs = BookshelfRepository(context: context)
        self.authors = AuthorRepository(context: context)
        self.books = BookRepository(context: context)

        super.init(withContext: context)
    }

    public static let view: DatabaseAccess = {
        return  DatabaseAccess(withContext: iiwi.viewContext)
    }()

    static var newBackground: DatabaseAccess {
        return DatabaseAccess(withContext: iiwi.newBackgroundContext())
    }

}
```

### Additional access

`iiwi` class provides public access to `viewContext: NSManagedObjectContext` so that it could be adjusted to your needs. 
Also there is function to create new background context `func newBackgroundContext() -> NSManagedObjectContext`.


## Author



rogowskimark, rogowski.mark@gmail.com



## License



iiwi is available under the MIT license. See the LICENSE file for more info.
