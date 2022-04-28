// SPDX-License-Identifier: Unlicense

// File: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/introspection/IERC165.sol


// OpenZeppelin Contracts v4.4.1 (utils/introspection/IERC165.sol)

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

// File: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol


// OpenZeppelin Contracts v4.4.1 (token/ERC721/IERC721.sol)

pragma solidity ^0.8.0;


/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);
}

// File: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol


// OpenZeppelin Contracts v4.4.1 (utils/math/SafeMath.sol)

pragma solidity ^0.8.0;

// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

// File: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Context.sol


// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

// File: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol


// OpenZeppelin Contracts v4.4.1 (access/Ownable.sol)

pragma solidity ^0.8.0;


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

// File: nftMarketplace.sol

interface IWordsNFT is IERC721{

    // DONOT REMOVE THIS INTERFACE!

}

contract WordNFTMarketplace is Ownable {
    using SafeMath for uint256;

    address payable marketplaceFeeWallet;

    uint8 public marketplacePercentage;
    uint8 public minterPercentage;

    uint8 public minimumBidIncreasePercentage;

    uint256 public startingBid;
    uint256 public bidExpiryTime;
    uint256 public bumpBidExpiryTime;

    struct CurrentBid {
        address payable currentBidder;
        uint256 currentBidAmount;
    }

    struct Bid {
        address payable bidder;
        uint256 bidAmount;
    }

    struct WordInfo {
        address payable minter;
        uint256 mintTime;
        uint256 expiryTime;
    }

    mapping(uint256 => WordInfo) public tokenIdForWordInfo;
    mapping(uint256 => mapping(uint256 => Bid)) public tokenIdForAllBids;
    mapping(uint256 => uint256) public lengthForAllBids;
    mapping(uint256 => CurrentBid) public tokenIdForCurrentBid;

    IWordsNFT wordsNFT;

    // Events

    event ChangedFeePercentages (
        uint8 _marketplacePercentage,
        uint8 _minterPercentage
    );

    event ChangedMarketplaceFeeWallet (
        address indexed _marketplaceFeeWallet
    );

    event ChangedWordsNFTAddress (
        address indexed _wordsNFTAddress
    );

    event BidMade (
        address indexed _bidder,
        uint256 _amount,
        uint256 _tokenId
    );

    event BidCancelled (
        address indexed _bidder,
        uint256 _amount,
        uint256 _tokenId
    );

    event ClaimedAndTransferred (
        address indexed _bidder,
        address indexed _minter,
        uint256 _amount,
        uint256 _tokenId
    );

    event Expired (
        address indexed _minter,
        uint256 _tokenId
    );

    // Constructor

    constructor() {
        marketplaceFeeWallet = payable(0x0000000000000000000000000000000000000000); // TODO

        marketplacePercentage = 50;
        minterPercentage = 50;

        minimumBidIncreasePercentage = 1;
        
        startingBid = 0.01 ether;
        bidExpiryTime = 2 minutes;
        bumpBidExpiryTime = 1 minutes;
    }

    // setters

    function setWordsNFTAddress(address _originContract) public onlyOwner {
        wordsNFT = IWordsNFT(_originContract);

        emit ChangedWordsNFTAddress(address(wordsNFT));
    }

    function setMarketplaceFeeWallet(address payable _marketplaceFeeWallet) public onlyOwner {
        marketplaceFeeWallet = _marketplaceFeeWallet;

        emit ChangedMarketplaceFeeWallet(_marketplaceFeeWallet);
    }

    function setFeePercentages(uint8 _marketplacePercentage) external onlyOwner {
        require(_marketplacePercentage < 100, "setFeePercentages::The owner cut should be less then 100%");

        marketplacePercentage = _marketplacePercentage;
        minterPercentage = 100 - marketplacePercentage;

        emit ChangedFeePercentages(marketplacePercentage, minterPercentage);
    }

    function setMinimumBidIncreasePercentage(uint8 _percentage) external onlyOwner {
        minimumBidIncreasePercentage = _percentage;
    }

    // getters

    function getWordsNFTAddress() public view onlyOwner returns(address) {
        return address(wordsNFT);
    }

    function getMarketplaceFeeWallet() public view onlyOwner returns(address payable) {
        return marketplaceFeeWallet;
    }

    // functions

    function setOnAuction(address payable _minter, uint256 _tokenId) external onlyContract {
        tokenIdForWordInfo[_tokenId] = WordInfo(_minter, block.timestamp, block.timestamp + bidExpiryTime);
    }

    function bid(uint256 _newBid, uint256 _tokenId) external payable {
        // (address payable tempMinter, uint256 tempMintTime, uint256 tempExpiryTime) = wordNFT.getWordInfo(_tokenId);
        WordInfo memory tempWordInfo = tokenIdForWordInfo[_tokenId];
        uint256 currentHighestBid = tokenIdForCurrentBid[_tokenId].currentBidAmount;
        
        require(_newBid != 0, "bid::Bid cannot be 0 Wei");
        if (currentHighestBid == 0) {
            currentHighestBid = startingBid;
            tokenIdForAllBids[_tokenId][lengthForAllBids[_tokenId]] = Bid(payable(0x0), 0.01 ether);
            lengthForAllBids[_tokenId]++;
        }
        require(_newBid > currentHighestBid.add(currentHighestBid.mul(minimumBidIncreasePercentage).div(100)), "bid::Bid must be higher than 1% of current highest bid");
        require(msg.sender != tempWordInfo.minter, "bid::Minter cannot bid");
        require(msg.value != 0, "bid::Value sent must not be 0 Wei");
        require(msg.value >= _newBid, "bid::Value sent must be greater than or equal to the bid amount");
        // require(block.timestamp <= tempExpiryTime, "bid::Bidding time for this NFT has expired");


        if (block.timestamp > tempWordInfo.expiryTime) {
            wordsNFT.transferFrom(address(this), tempWordInfo.minter, _tokenId);

            emit Expired(tempWordInfo.minter, _tokenId);
        }
        else {
            tokenIdForAllBids[_tokenId][lengthForAllBids[_tokenId]] = Bid(payable(msg.sender), _newBid);
            lengthForAllBids[_tokenId]++;
            tokenIdForCurrentBid[_tokenId] = CurrentBid(payable(msg.sender), _newBid);

            tempWordInfo.expiryTime += bumpBidExpiryTime;
            tokenIdForWordInfo[_tokenId] = WordInfo(tempWordInfo.minter, tempWordInfo.mintTime, tempWordInfo.expiryTime);

            emit BidMade(msg.sender, _newBid, _tokenId);
        }
    }

    function cancelBid(address _bidder, uint256 _bidAmount, uint256 _tokenId) external {
        // (address payable tempMinter, , uint256 tempExpiryTime) = wordNFT.getWordInfo(_tokenId);
        // require(block.timestamp <= tempExpiryTime, "bid::Bidding time for this NFT has expired");

        address payable tempBidder = tokenIdForAllBids[_tokenId][lengthForAllBids[_tokenId]].bidder;
        uint256 tempBidAmount = tokenIdForAllBids[_tokenId][lengthForAllBids[_tokenId]].bidAmount;

        sendValue(tempBidder, tempBidAmount);
        
        if (tokenIdForAllBids[_tokenId][lengthForAllBids[_tokenId] - 1].bidder == _bidder && 
        tokenIdForAllBids[_tokenId][lengthForAllBids[_tokenId] - 1].bidAmount == _bidAmount) {
            tokenIdForAllBids[_tokenId][lengthForAllBids[_tokenId] - 1] = Bid(payable(0x0), 0 ether);
            tokenIdForCurrentBid[_tokenId].currentBidder = tokenIdForAllBids[_tokenId][lengthForAllBids[_tokenId] - 2].bidder;
            tokenIdForCurrentBid[_tokenId].currentBidAmount = tokenIdForAllBids[_tokenId][lengthForAllBids[_tokenId] - 2].bidAmount;
            lengthForAllBids[_tokenId]--;
        }
        else {
            for (uint256 i = 0 ; i < lengthForAllBids[_tokenId] ; i++) {
                if (tokenIdForAllBids[_tokenId][i].bidder == _bidder && tokenIdForAllBids[_tokenId][i].bidAmount == _bidAmount) {
                    tokenIdForAllBids[_tokenId][i] = Bid(payable(0x0), 0 ether);
                }
            }
        }
        
        emit BidCancelled(tempBidder, tempBidAmount, _tokenId);
    }

    function claim(uint256 _tokenId) external payable {
        // (address payable tempMinter, , uint256 tempExpiryTime) = wordNFT.getWordInfo(_tokenId);
        WordInfo memory tempWordInfo = tokenIdForWordInfo[_tokenId];
        uint256 tempBidAmount = tokenIdForCurrentBid[_tokenId].currentBidAmount;
        address payable tempBidder = tokenIdForCurrentBid[_tokenId].currentBidder;
        require(msg.value == tempBidAmount, "claim::Insufficient funds provided to claim this NFT");
        require(tempWordInfo.minter != tempBidder, "claim::Minter cannot claim the NFT");
        // require(block.timestamp >= tempExpiryTime, "claim::NFT can be claimed once bidding time has expired");

        if (block.timestamp > tempWordInfo.expiryTime) {
            wordsNFT.transferFrom(address(this), tempWordInfo.minter, _tokenId);

            emit Expired(tempWordInfo.minter, _tokenId);
        }
        else {
            if (tokenIdForCurrentBid[_tokenId].currentBidAmount == 0.01 ether) {
                wordsNFT.transferFrom(address(this), tempWordInfo.minter, _tokenId);
            }
            else {
                wordsNFT.transferFrom(address(this), tempBidder, _tokenId);

                uint256 dividend = 100;
                dividend = dividend.div(marketplacePercentage);
                uint256 marketplaceShare = tempBidAmount.div(dividend);
                uint256 minterShare = tempBidAmount.sub(marketplaceShare);
                require(marketplaceShare + minterShare == tempBidAmount, "bid::Div error checker failed");
                sendValue(marketplaceFeeWallet, marketplaceShare);
                sendValue(tempWordInfo.minter, minterShare);
            }

            revertAllOtherBids(_tokenId);

            emit ClaimedAndTransferred(tempBidder, tempWordInfo.minter, tempBidAmount, _tokenId);
        }
    }

    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "sendValue: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "sendValue: unable to send value, recipient may have reverted");
    }

    function revertAllOtherBids(uint256 _tokenId) internal {
        for (uint256 i = 0 ; i < lengthForAllBids[_tokenId] - 1 ; i++) {
            if (tokenIdForAllBids[_tokenId][i].bidAmount > 0 ether) {
                sendValue(tokenIdForAllBids[_tokenId][i].bidder, tokenIdForAllBids[_tokenId][i].bidAmount);
            }
        }

    }
    
    receive() external payable {}

    modifier onlyContract {
        require(msg.sender == address(wordsNFT), "onlyContract::Only WordsNFT Contract can call this function");
        _;
    }

    // TODO WETH for bidding
    // TODO store previous bids
    // TODO cancelBid structure and logic to be confirmed and then deployed
    
    // TODO how to check when expiry time has been reached to execute functions or events
    // TODO transfer to OpenSea on expiry if no bid has been made
    // TODO transfer to OpenSea once claimed
    // function checkExpiry();
    // function transferOnExpiry();
    // function transferOnClaim();
}