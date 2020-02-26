from web3 import Web3
from solcx import compile_files, link_code

w3 = Web3(Web3.HTTPProvider("https://localhost:8545"))

contracts = compile_files(['test.sol'])

main_contract = contracts.pop("test.sol:userRecords")
# use this if using outside library. stringUtils depreciated,
# solidity now has strings
# library_link = contracts.pop("stringUtils.sol:StringUtils")

def deploy_contract(contract_interface):
	contract = w3.eth.contract(
		abi=contract_interface['abi'],
		bytecode=contract_interface['bin']
	)
	tx_hash = contract.constructor().transact()
	tx_receipt = w3.eth.waitForTransactionReceipt(tx_hash)
	return tx_receipt['contractAddress']

# same as above with library_link. not needed just for future reference
# library_adress = {
# 	"stringUtils.sol:StringUtils": deploy_contract(library_link)
# }
library_address = {}

main_contract['bin'] = link_code(
	main_contract['bin'], library_address
)

contract_adress = deploy_contract(main_contract)




