### 1. Where are they stored? 
The method to which structs, arrays and mappings are stored depends on whether they are called as **state** or **local** **variables**

**Storage:** When a struct or array is declared outside a function which is called a state variables, they are stored on the blockchain, while mappings are permanently stored on the blockchain because they are not stored contigiously instead each key value pair is stored at a location computed using the keccak256 hash of the key and the mapping position in storage. Data stored in storage costs gas and is permanently stored on the blockchain.

**Memory:** When a struct aor arrays is declared inside a function which is called a local variables, structs and arrays  are stored in memory because structs and arrays are stored in contiguous memory locations, meaning all elements are placed next to each other in a block of memory. Data stored in memory is wiped clean after the function completes.

**Mapping Exception:** Mappings can **only** exist in storage. You cannot create a local mapping in memory beacuse they are abstracted and they cannot hold data in memory like they do in storage.

### 2. How do they behave when executed?
**Cost:** Writing to  storage  costs significant **gas** (money). Using  memory  is much cheaper.
**Persistence:** Changes to  storage  update the blockchain state. Changes to  memory  are lost once execution ends.
**Reference Types:** Structs and arrays are **reference types**.
    *   If you assign a storage variable to a local variable, you create a **pointer**. Modifying the local variable **will modify** the original storage data.
    *   To copy the data instead of the reference, you must explicitly create a new instance in memory.

### 3. Why don't you need  memory  or  storage  with mappings?
You don't specify the location because **mappings have no choice.

*   **Technical Limitation:** Mappings are hash tables that calculate storage slots using  keccak256 . They do not have a defined length or contiguous layout, which is required for  memory  allocation.
*   **Implicit Storage:** Since a mapping *must* be a state variable to function, it is implicitly  storage . Writing  mapping(uint => uint) storage myMap;  is redundant, and  mapping(uint => uint) memory myMap;  is illegal.