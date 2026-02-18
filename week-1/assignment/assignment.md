### 1. Where are they stored? 
It depends on whether they are **state variables** or **local variables**.

**Storage (Permanent):** If declared outside a function (state variables), structs ,  arrays , and  mappings  are stored on the blockchain. This data is permanently stored on the blockchain.
**Memory (Temporary):** If declared inside a function (local variables), structs and arrays  are stored in memory. This data is wiped clean after the function completes.
**Mapping Exception:** Mappings can **only** exist in storage . You cannot create a local mapping in memory.

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