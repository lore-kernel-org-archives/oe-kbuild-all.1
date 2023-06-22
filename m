Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D074021085
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 23:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687478092; x=1719014092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6MsklrtOHUgySh5raTjqSn5BQs0DNLf8Llkwo3vAv8k=;
  b=Wcbc6Jg+QhQdXzQfzJN9rUZLmqkK/WeGyP83O/6Imlzv2pQcXbIOB5PY
   dCUfKDJGwQrc6KdtFWxXWM5vAAUtnTLdUr+xT3GvwDUOpw4x9IVzTrHnf
   PQe6M26sNvo2nvlhZLR4vJU3nNe7dbj+MPVXZDnFAUsFpIuIwHZmXm763
   VYarty00gGxcicfwAlMUsu6pimkZzFl0ah4FQnJUmxB8WagX6X1uQv9LE
   daY7BNtOUvhk5LbfY0jGlj4rhrAog807kp4ocy44cSyRv9UC9jzwTfKtc
   KSK1rYnJhr8kgZcwIV79zpeAQpIW3/sxGWhVNmpRx2hiZpHm2KLeHRwyk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="360672109"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="360672109"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 16:54:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="839248043"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="839248043"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Jun 2023 16:54:49 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCU8X-0007pr-0b;
	Thu, 22 Jun 2023 23:54:49 +0000
Date: Fri, 23 Jun 2023 07:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime.2 17/30] fs/udf/inode.c:1514:40: error: lvalue
 required as unary '&' operand
Message-ID: <202306230758.AUrmnzLj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime.2
head:   5b9567fb85f565a8040b60442ba1ab492f90f555
commit: 67217f6c6c4f65612918ab1ceb0b4fa127a1b454 [17/30] JUMBO
config: microblaze-randconfig-r033-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230758.AUrmnzLj-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230758.AUrmnzLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230758.AUrmnzLj-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/udf/inode.c: In function 'udf_read_inode':
>> fs/udf/inode.c:1514:40: error: lvalue required as unary '&' operand
    1514 |                 udf_disk_stamp_to_time(&inode_get_ctime(inode), fe->attrTime);
         |                                        ^
   fs/udf/inode.c:1529:40: error: lvalue required as unary '&' operand
    1529 |                 udf_disk_stamp_to_time(&inode_get_ctime(inode), efe->attrTime);
         |                                        ^
--
   fs/udf/namei.c: In function 'udf_rmdir':
>> fs/udf/namei.c:530:30: error: lvalue required as left operand of assignment
     530 |         inode_get_ctime(dir) = dir->i_mtime = inode_set_ctime_current(inode);
         |                              ^
   fs/udf/namei.c: In function 'udf_unlink':
   fs/udf/namei.c:565:32: error: lvalue required as left operand of assignment
     565 |         inode_get_ctime(inode) = inode_get_ctime(dir);
         |                                ^
--
   fs/isofs/rock.c: In function 'parse_rock_ridge_inode_internal':
>> fs/isofs/rock.c:535:48: error: lvalue required as left operand of assignment
     535 |                         inode_get_ctime(inode) = inode_get_ctime(reloc);
         |                                                ^
--
   fs/zonefs/super.c: In function 'zonefs_get_file_inode':
>> fs/zonefs/super.c:661:32: error: lvalue required as left operand of assignment
     661 |         inode_get_ctime(inode) = inode->i_mtime = inode->i_atime = inode_get_ctime(dir);
         |                                ^
   fs/zonefs/super.c: In function 'zonefs_get_zgroup_inode':
   fs/zonefs/super.c:697:32: error: lvalue required as left operand of assignment
     697 |         inode_get_ctime(inode) = inode->i_mtime = inode->i_atime = inode_get_ctime(root);
         |                                ^
--
   fs/ntfs3/namei.c: In function 'ntfs_link':
>> fs/ntfs3/namei.c:159:55: error: lvalue required as left operand of assignment
     159 |                 dir->i_mtime = inode_get_ctime(inode) = inode_set_ctime_current(dir);
         |                                                       ^
   fs/ntfs3/namei.c: In function 'ntfs_rename':
   fs/ntfs3/namei.c:326:40: error: lvalue required as left operand of assignment
     326 |                 inode_get_ctime(inode) = dir->i_mtime = inode_set_ctime_current(dir);
         |                                        ^
   fs/ntfs3/namei.c:330:69: error: lvalue required as left operand of assignment
     330 |                         new_dir->i_mtime = inode_get_ctime(new_dir) = inode_get_ctime(dir);
         |                                                                     ^
--
   fs/ntfs3/frecord.c: In function 'ni_write_inode':
>> fs/ntfs3/frecord.c:3279:40: error: lvalue required as unary '&' operand
    3279 |                 dup.c_time = kernel2nt(&inode_get_ctime(inode));
         |                                        ^
--
   fs/jfs/namei.c: In function 'jfs_unlink':
>> fs/jfs/namei.c:515:30: error: lvalue required as left operand of assignment
     515 |         inode_get_ctime(dip) = dip->i_mtime = inode_set_ctime_current(ip);
         |                              ^
--
   fs/ufs/namei.c: In function 'ufs_unlink':
>> fs/ufs/namei.c:223:32: error: lvalue required as left operand of assignment
     223 |         inode_get_ctime(inode) = inode_get_ctime(dir);
         |                                ^
--
   fs/minix/namei.c: In function 'minix_unlink':
>> fs/minix/namei.c:157:32: error: lvalue required as left operand of assignment
     157 |         inode_get_ctime(inode) = inode_get_ctime(dir);
         |                                ^
--
   fs/nilfs2/namei.c: In function 'nilfs_do_unlink':
>> fs/nilfs2/namei.c:286:32: error: lvalue required as left operand of assignment
     286 |         inode_get_ctime(inode) = inode_get_ctime(dir);
         |                                ^
--
   fs/overlayfs/file.c: In function 'ovl_file_accessed':
>> fs/overlayfs/file.c:236:32: error: lvalue required as unary '&' operand
     236 |              !timespec64_equal(&inode_get_ctime(inode), &inode_get_ctime(upperinode)))) {
         |                                ^
   fs/overlayfs/file.c:236:57: error: lvalue required as unary '&' operand
     236 |              !timespec64_equal(&inode_get_ctime(inode), &inode_get_ctime(upperinode)))) {
         |                                                         ^
>> fs/overlayfs/file.c:238:40: error: lvalue required as left operand of assignment
     238 |                 inode_get_ctime(inode) = inode_get_ctime(upperinode);
         |                                        ^
..


vim +1514 fs/udf/inode.c

  1321	
  1322	static int udf_read_inode(struct inode *inode, bool hidden_inode)
  1323	{
  1324		struct buffer_head *bh = NULL;
  1325		struct fileEntry *fe;
  1326		struct extendedFileEntry *efe;
  1327		uint16_t ident;
  1328		struct udf_inode_info *iinfo = UDF_I(inode);
  1329		struct udf_sb_info *sbi = UDF_SB(inode->i_sb);
  1330		struct kernel_lb_addr *iloc = &iinfo->i_location;
  1331		unsigned int link_count;
  1332		unsigned int indirections = 0;
  1333		int bs = inode->i_sb->s_blocksize;
  1334		int ret = -EIO;
  1335		uint32_t uid, gid;
  1336	
  1337	reread:
  1338		if (iloc->partitionReferenceNum >= sbi->s_partitions) {
  1339			udf_debug("partition reference: %u > logical volume partitions: %u\n",
  1340				  iloc->partitionReferenceNum, sbi->s_partitions);
  1341			return -EIO;
  1342		}
  1343	
  1344		if (iloc->logicalBlockNum >=
  1345		    sbi->s_partmaps[iloc->partitionReferenceNum].s_partition_len) {
  1346			udf_debug("block=%u, partition=%u out of range\n",
  1347				  iloc->logicalBlockNum, iloc->partitionReferenceNum);
  1348			return -EIO;
  1349		}
  1350	
  1351		/*
  1352		 * Set defaults, but the inode is still incomplete!
  1353		 * Note: get_new_inode() sets the following on a new inode:
  1354		 *      i_sb = sb
  1355		 *      i_no = ino
  1356		 *      i_flags = sb->s_flags
  1357		 *      i_state = 0
  1358		 * clean_inode(): zero fills and sets
  1359		 *      i_count = 1
  1360		 *      i_nlink = 1
  1361		 *      i_op = NULL;
  1362		 */
  1363		bh = udf_read_ptagged(inode->i_sb, iloc, 0, &ident);
  1364		if (!bh) {
  1365			udf_err(inode->i_sb, "(ino %lu) failed !bh\n", inode->i_ino);
  1366			return -EIO;
  1367		}
  1368	
  1369		if (ident != TAG_IDENT_FE && ident != TAG_IDENT_EFE &&
  1370		    ident != TAG_IDENT_USE) {
  1371			udf_err(inode->i_sb, "(ino %lu) failed ident=%u\n",
  1372				inode->i_ino, ident);
  1373			goto out;
  1374		}
  1375	
  1376		fe = (struct fileEntry *)bh->b_data;
  1377		efe = (struct extendedFileEntry *)bh->b_data;
  1378	
  1379		if (fe->icbTag.strategyType == cpu_to_le16(4096)) {
  1380			struct buffer_head *ibh;
  1381	
  1382			ibh = udf_read_ptagged(inode->i_sb, iloc, 1, &ident);
  1383			if (ident == TAG_IDENT_IE && ibh) {
  1384				struct kernel_lb_addr loc;
  1385				struct indirectEntry *ie;
  1386	
  1387				ie = (struct indirectEntry *)ibh->b_data;
  1388				loc = lelb_to_cpu(ie->indirectICB.extLocation);
  1389	
  1390				if (ie->indirectICB.extLength) {
  1391					brelse(ibh);
  1392					memcpy(&iinfo->i_location, &loc,
  1393					       sizeof(struct kernel_lb_addr));
  1394					if (++indirections > UDF_MAX_ICB_NESTING) {
  1395						udf_err(inode->i_sb,
  1396							"too many ICBs in ICB hierarchy"
  1397							" (max %d supported)\n",
  1398							UDF_MAX_ICB_NESTING);
  1399						goto out;
  1400					}
  1401					brelse(bh);
  1402					goto reread;
  1403				}
  1404			}
  1405			brelse(ibh);
  1406		} else if (fe->icbTag.strategyType != cpu_to_le16(4)) {
  1407			udf_err(inode->i_sb, "unsupported strategy type: %u\n",
  1408				le16_to_cpu(fe->icbTag.strategyType));
  1409			goto out;
  1410		}
  1411		if (fe->icbTag.strategyType == cpu_to_le16(4))
  1412			iinfo->i_strat4096 = 0;
  1413		else /* if (fe->icbTag.strategyType == cpu_to_le16(4096)) */
  1414			iinfo->i_strat4096 = 1;
  1415	
  1416		iinfo->i_alloc_type = le16_to_cpu(fe->icbTag.flags) &
  1417								ICBTAG_FLAG_AD_MASK;
  1418		if (iinfo->i_alloc_type != ICBTAG_FLAG_AD_SHORT &&
  1419		    iinfo->i_alloc_type != ICBTAG_FLAG_AD_LONG &&
  1420		    iinfo->i_alloc_type != ICBTAG_FLAG_AD_IN_ICB) {
  1421			ret = -EIO;
  1422			goto out;
  1423		}
  1424		iinfo->i_hidden = hidden_inode;
  1425		iinfo->i_unique = 0;
  1426		iinfo->i_lenEAttr = 0;
  1427		iinfo->i_lenExtents = 0;
  1428		iinfo->i_lenAlloc = 0;
  1429		iinfo->i_next_alloc_block = 0;
  1430		iinfo->i_next_alloc_goal = 0;
  1431		if (fe->descTag.tagIdent == cpu_to_le16(TAG_IDENT_EFE)) {
  1432			iinfo->i_efe = 1;
  1433			iinfo->i_use = 0;
  1434			ret = udf_alloc_i_data(inode, bs -
  1435						sizeof(struct extendedFileEntry));
  1436			if (ret)
  1437				goto out;
  1438			memcpy(iinfo->i_data,
  1439			       bh->b_data + sizeof(struct extendedFileEntry),
  1440			       bs - sizeof(struct extendedFileEntry));
  1441		} else if (fe->descTag.tagIdent == cpu_to_le16(TAG_IDENT_FE)) {
  1442			iinfo->i_efe = 0;
  1443			iinfo->i_use = 0;
  1444			ret = udf_alloc_i_data(inode, bs - sizeof(struct fileEntry));
  1445			if (ret)
  1446				goto out;
  1447			memcpy(iinfo->i_data,
  1448			       bh->b_data + sizeof(struct fileEntry),
  1449			       bs - sizeof(struct fileEntry));
  1450		} else if (fe->descTag.tagIdent == cpu_to_le16(TAG_IDENT_USE)) {
  1451			iinfo->i_efe = 0;
  1452			iinfo->i_use = 1;
  1453			iinfo->i_lenAlloc = le32_to_cpu(
  1454					((struct unallocSpaceEntry *)bh->b_data)->
  1455					 lengthAllocDescs);
  1456			ret = udf_alloc_i_data(inode, bs -
  1457						sizeof(struct unallocSpaceEntry));
  1458			if (ret)
  1459				goto out;
  1460			memcpy(iinfo->i_data,
  1461			       bh->b_data + sizeof(struct unallocSpaceEntry),
  1462			       bs - sizeof(struct unallocSpaceEntry));
  1463			return 0;
  1464		}
  1465	
  1466		ret = -EIO;
  1467		read_lock(&sbi->s_cred_lock);
  1468		uid = le32_to_cpu(fe->uid);
  1469		if (uid == UDF_INVALID_ID ||
  1470		    UDF_QUERY_FLAG(inode->i_sb, UDF_FLAG_UID_SET))
  1471			inode->i_uid = sbi->s_uid;
  1472		else
  1473			i_uid_write(inode, uid);
  1474	
  1475		gid = le32_to_cpu(fe->gid);
  1476		if (gid == UDF_INVALID_ID ||
  1477		    UDF_QUERY_FLAG(inode->i_sb, UDF_FLAG_GID_SET))
  1478			inode->i_gid = sbi->s_gid;
  1479		else
  1480			i_gid_write(inode, gid);
  1481	
  1482		if (fe->icbTag.fileType != ICBTAG_FILE_TYPE_DIRECTORY &&
  1483				sbi->s_fmode != UDF_INVALID_MODE)
  1484			inode->i_mode = sbi->s_fmode;
  1485		else if (fe->icbTag.fileType == ICBTAG_FILE_TYPE_DIRECTORY &&
  1486				sbi->s_dmode != UDF_INVALID_MODE)
  1487			inode->i_mode = sbi->s_dmode;
  1488		else
  1489			inode->i_mode = udf_convert_permissions(fe);
  1490		inode->i_mode &= ~sbi->s_umask;
  1491		iinfo->i_extraPerms = le32_to_cpu(fe->permissions) & ~FE_MAPPED_PERMS;
  1492	
  1493		read_unlock(&sbi->s_cred_lock);
  1494	
  1495		link_count = le16_to_cpu(fe->fileLinkCount);
  1496		if (!link_count) {
  1497			if (!hidden_inode) {
  1498				ret = -ESTALE;
  1499				goto out;
  1500			}
  1501			link_count = 1;
  1502		}
  1503		set_nlink(inode, link_count);
  1504	
  1505		inode->i_size = le64_to_cpu(fe->informationLength);
  1506		iinfo->i_lenExtents = inode->i_size;
  1507	
  1508		if (iinfo->i_efe == 0) {
  1509			inode->i_blocks = le64_to_cpu(fe->logicalBlocksRecorded) <<
  1510				(inode->i_sb->s_blocksize_bits - 9);
  1511	
  1512			udf_disk_stamp_to_time(&inode->i_atime, fe->accessTime);
  1513			udf_disk_stamp_to_time(&inode->i_mtime, fe->modificationTime);
> 1514			udf_disk_stamp_to_time(&inode_get_ctime(inode), fe->attrTime);
  1515	
  1516			iinfo->i_unique = le64_to_cpu(fe->uniqueID);
  1517			iinfo->i_lenEAttr = le32_to_cpu(fe->lengthExtendedAttr);
  1518			iinfo->i_lenAlloc = le32_to_cpu(fe->lengthAllocDescs);
  1519			iinfo->i_checkpoint = le32_to_cpu(fe->checkpoint);
  1520			iinfo->i_streamdir = 0;
  1521			iinfo->i_lenStreams = 0;
  1522		} else {
  1523			inode->i_blocks = le64_to_cpu(efe->logicalBlocksRecorded) <<
  1524			    (inode->i_sb->s_blocksize_bits - 9);
  1525	
  1526			udf_disk_stamp_to_time(&inode->i_atime, efe->accessTime);
  1527			udf_disk_stamp_to_time(&inode->i_mtime, efe->modificationTime);
  1528			udf_disk_stamp_to_time(&iinfo->i_crtime, efe->createTime);
  1529			udf_disk_stamp_to_time(&inode_get_ctime(inode), efe->attrTime);
  1530	
  1531			iinfo->i_unique = le64_to_cpu(efe->uniqueID);
  1532			iinfo->i_lenEAttr = le32_to_cpu(efe->lengthExtendedAttr);
  1533			iinfo->i_lenAlloc = le32_to_cpu(efe->lengthAllocDescs);
  1534			iinfo->i_checkpoint = le32_to_cpu(efe->checkpoint);
  1535	
  1536			/* Named streams */
  1537			iinfo->i_streamdir = (efe->streamDirectoryICB.extLength != 0);
  1538			iinfo->i_locStreamdir =
  1539				lelb_to_cpu(efe->streamDirectoryICB.extLocation);
  1540			iinfo->i_lenStreams = le64_to_cpu(efe->objectSize);
  1541			if (iinfo->i_lenStreams >= inode->i_size)
  1542				iinfo->i_lenStreams -= inode->i_size;
  1543			else
  1544				iinfo->i_lenStreams = 0;
  1545		}
  1546		inode->i_generation = iinfo->i_unique;
  1547	
  1548		/*
  1549		 * Sanity check length of allocation descriptors and extended attrs to
  1550		 * avoid integer overflows
  1551		 */
  1552		if (iinfo->i_lenEAttr > bs || iinfo->i_lenAlloc > bs)
  1553			goto out;
  1554		/* Now do exact checks */
  1555		if (udf_file_entry_alloc_offset(inode) + iinfo->i_lenAlloc > bs)
  1556			goto out;
  1557		/* Sanity checks for files in ICB so that we don't get confused later */
  1558		if (iinfo->i_alloc_type == ICBTAG_FLAG_AD_IN_ICB) {
  1559			/*
  1560			 * For file in ICB data is stored in allocation descriptor
  1561			 * so sizes should match
  1562			 */
  1563			if (iinfo->i_lenAlloc != inode->i_size)
  1564				goto out;
  1565			/* File in ICB has to fit in there... */
  1566			if (inode->i_size > bs - udf_file_entry_alloc_offset(inode))
  1567				goto out;
  1568		}
  1569	
  1570		switch (fe->icbTag.fileType) {
  1571		case ICBTAG_FILE_TYPE_DIRECTORY:
  1572			inode->i_op = &udf_dir_inode_operations;
  1573			inode->i_fop = &udf_dir_operations;
  1574			inode->i_mode |= S_IFDIR;
  1575			inc_nlink(inode);
  1576			break;
  1577		case ICBTAG_FILE_TYPE_REALTIME:
  1578		case ICBTAG_FILE_TYPE_REGULAR:
  1579		case ICBTAG_FILE_TYPE_UNDEF:
  1580		case ICBTAG_FILE_TYPE_VAT20:
  1581			inode->i_data.a_ops = &udf_aops;
  1582			inode->i_op = &udf_file_inode_operations;
  1583			inode->i_fop = &udf_file_operations;
  1584			inode->i_mode |= S_IFREG;
  1585			break;
  1586		case ICBTAG_FILE_TYPE_BLOCK:
  1587			inode->i_mode |= S_IFBLK;
  1588			break;
  1589		case ICBTAG_FILE_TYPE_CHAR:
  1590			inode->i_mode |= S_IFCHR;
  1591			break;
  1592		case ICBTAG_FILE_TYPE_FIFO:
  1593			init_special_inode(inode, inode->i_mode | S_IFIFO, 0);
  1594			break;
  1595		case ICBTAG_FILE_TYPE_SOCKET:
  1596			init_special_inode(inode, inode->i_mode | S_IFSOCK, 0);
  1597			break;
  1598		case ICBTAG_FILE_TYPE_SYMLINK:
  1599			inode->i_data.a_ops = &udf_symlink_aops;
  1600			inode->i_op = &udf_symlink_inode_operations;
  1601			inode_nohighmem(inode);
  1602			inode->i_mode = S_IFLNK | 0777;
  1603			break;
  1604		case ICBTAG_FILE_TYPE_MAIN:
  1605			udf_debug("METADATA FILE-----\n");
  1606			break;
  1607		case ICBTAG_FILE_TYPE_MIRROR:
  1608			udf_debug("METADATA MIRROR FILE-----\n");
  1609			break;
  1610		case ICBTAG_FILE_TYPE_BITMAP:
  1611			udf_debug("METADATA BITMAP FILE-----\n");
  1612			break;
  1613		default:
  1614			udf_err(inode->i_sb, "(ino %lu) failed unknown file type=%u\n",
  1615				inode->i_ino, fe->icbTag.fileType);
  1616			goto out;
  1617		}
  1618		if (S_ISCHR(inode->i_mode) || S_ISBLK(inode->i_mode)) {
  1619			struct deviceSpec *dsea =
  1620				(struct deviceSpec *)udf_get_extendedattr(inode, 12, 1);
  1621			if (dsea) {
  1622				init_special_inode(inode, inode->i_mode,
  1623					MKDEV(le32_to_cpu(dsea->majorDeviceIdent),
  1624					      le32_to_cpu(dsea->minorDeviceIdent)));
  1625				/* Developer ID ??? */
  1626			} else
  1627				goto out;
  1628		}
  1629		ret = 0;
  1630	out:
  1631		brelse(bh);
  1632		return ret;
  1633	}
  1634	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
