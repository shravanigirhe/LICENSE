# Simple Interest Calculator
# Formula: SI = (P × R × T) / 100

# Function to check if input is a valid number
is_number() {
  [[ $1 =~ ^[0-9]+([.][0-9]+)?$ ]]
}

# Get inputs from user if not provided as arguments
if [ $# -eq 3 ]; then
  principal=$1
  rate=$2
  time=$3
else
  echo "Enter Principal Amount:"
  read principal

  echo "Enter Rate of Interest (in %):"
  read rate

  echo "Enter Time (in years):"
  read time
fi

# Input validation
if ! is_number "$principal" || ! is_number "$rate" || ! is_number "$time"; then
  echo "❌ Error: All inputs must be numeric values."
  exit 1
fi

# Calculate simple interest
si=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Output result
echo "------------------------------------"
echo "Principal:       $principal"
echo "Rate of Interest: $rate%"
echo "Time:             $time years"
echo "Simple Interest:  ₹$si"
echo "------------------------------------"
