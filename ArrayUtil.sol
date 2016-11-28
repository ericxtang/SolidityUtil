library ArrayUtil {

  /** Finds the index of a given value in an array. */
  function IndexOf(uint[] values, uint value) returns(uint) {
    uint i = 0;
    while (values[i] != value) {
      i++;
    }
    return i;
  }

  /** Removes the given value in an array. */
  function RemoveByValue(uint[] values, uint value) {
    uint i = IndexOf(value);
    RemoveByIndex(i);
  }

  /** Removes the value at the given index in an array. */
  function RemoveByIndex(uint[] values, uint i) {
    while (i<values.length-1) {
      values[i] = values[i+1];
      i++;
    }
    values.length--;
  }
}