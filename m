Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055D680C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 03:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696132354; x=1727668354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o2JJzeh8vEpMwVkLTTVXwxSiVnneLAWAz4v12Y11dc0=;
  b=BfIjrlVB7VHyGg9bzgPaxvBdm9b/pYOP7dPU9t3A2FJyMyJFfZQ29+aU
   Xx4o5kRSeXWsxXTlzslnSve9iRPwDGZiToo8jYJdAEdleB68mbJnhRSko
   csTI9LU7PgmkOsElYHeLuZhuR/rxE5c/N+7LSMD/yqajt5riQ+2UywxEe
   0SkfzgscHiYWH6Ofobqi8ta8e5o/7WRf2DgUSz65NBtK1EtBE+usk2Chp
   HEe4DC2SGfzSZxcultfi7VDxNXv4G5wsQq7djkizbEJrN4hBBqQnEyr9S
   px8Lq6n37lsXCQJytVNEjEHCHywLfcnBrIJLcVh8DgcuvCl+d46yilVXT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="1081714"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="1081714"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 20:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="1200482"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2023 20:51:53 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmnVN-0004jF-1G;
	Sun, 01 Oct 2023 03:52:29 +0000
Date: Sun, 1 Oct 2023 11:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:amtime 57/89] fs/ntfs3/inode.c:1666:1: error: version
 control conflict marker in file
Message-ID: <202310011149.qDYRoPW8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git amtime
head:   d3f5e7afc35dce37213dc35f1d329f078d689834
commit: 25ddea97858e021209e5511df79a01ab95b627bf [57/89] ntfs3: convert to new timestamp accessors
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20231001/202310011149.qDYRoPW8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310011149.qDYRoPW8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310011149.qDYRoPW8-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ntfs3/inode.c: In function 'ntfs_create_inode':
>> fs/ntfs3/inode.c:1666:1: error: version control conflict marker in file
    1666 | <<<<<<< HEAD
         | ^~~~~~~
   fs/ntfs3/inode.c:1670:1: error: version control conflict marker in file
    1670 | =======
         | ^~~~~~~
   fs/ntfs3/inode.c:1674:1: error: version control conflict marker in file
    1674 | >>>>>>> c93949aae9cd (fs: convert core infrastructure to new {a,m}time accessors)
         | ^~~~~~~


vim +1666 fs/ntfs3/inode.c

  1189	
  1190	/*
  1191	 * ntfs_create_inode
  1192	 *
  1193	 * Helper function for:
  1194	 * - ntfs_create
  1195	 * - ntfs_mknod
  1196	 * - ntfs_symlink
  1197	 * - ntfs_mkdir
  1198	 * - ntfs_atomic_open
  1199	 *
  1200	 * NOTE: if fnd != NULL (ntfs_atomic_open) then @dir is locked
  1201	 */
  1202	struct inode *ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
  1203					struct dentry *dentry,
  1204					const struct cpu_str *uni, umode_t mode,
  1205					dev_t dev, const char *symname, u32 size,
  1206					struct ntfs_fnd *fnd)
  1207	{
  1208		int err;
  1209		struct super_block *sb = dir->i_sb;
  1210		struct ntfs_sb_info *sbi = sb->s_fs_info;
  1211		const struct qstr *name = &dentry->d_name;
  1212		CLST ino = 0;
  1213		struct ntfs_inode *dir_ni = ntfs_i(dir);
  1214		struct ntfs_inode *ni = NULL;
  1215		struct inode *inode = NULL;
  1216		struct ATTRIB *attr;
  1217		struct ATTR_STD_INFO5 *std5;
  1218		struct ATTR_FILE_NAME *fname;
  1219		struct MFT_REC *rec;
  1220		u32 asize, dsize, sd_size;
  1221		enum FILE_ATTRIBUTE fa;
  1222		__le32 security_id = SECURITY_ID_INVALID;
  1223		CLST vcn;
  1224		const void *sd;
  1225		u16 t16, nsize = 0, aid = 0;
  1226		struct INDEX_ROOT *root, *dir_root;
  1227		struct NTFS_DE *e, *new_de = NULL;
  1228		struct REPARSE_DATA_BUFFER *rp = NULL;
  1229		bool rp_inserted = false;
  1230	
  1231		if (!fnd)
  1232			ni_lock_dir(dir_ni);
  1233	
  1234		dir_root = indx_get_root(&dir_ni->dir, dir_ni, NULL, NULL);
  1235		if (!dir_root) {
  1236			err = -EINVAL;
  1237			goto out1;
  1238		}
  1239	
  1240		if (S_ISDIR(mode)) {
  1241			/* Use parent's directory attributes. */
  1242			fa = dir_ni->std_fa | FILE_ATTRIBUTE_DIRECTORY |
  1243			     FILE_ATTRIBUTE_ARCHIVE;
  1244			/*
  1245			 * By default child directory inherits parent attributes.
  1246			 * Root directory is hidden + system.
  1247			 * Make an exception for children in root.
  1248			 */
  1249			if (dir->i_ino == MFT_REC_ROOT)
  1250				fa &= ~(FILE_ATTRIBUTE_HIDDEN | FILE_ATTRIBUTE_SYSTEM);
  1251		} else if (S_ISLNK(mode)) {
  1252			/* It is good idea that link should be the same type (file/dir) as target */
  1253			fa = FILE_ATTRIBUTE_REPARSE_POINT;
  1254	
  1255			/*
  1256			 * Linux: there are dir/file/symlink and so on.
  1257			 * NTFS: symlinks are "dir + reparse" or "file + reparse"
  1258			 * It is good idea to create:
  1259			 * dir + reparse if 'symname' points to directory
  1260			 * or
  1261			 * file + reparse if 'symname' points to file
  1262			 * Unfortunately kern_path hangs if symname contains 'dir'.
  1263			 */
  1264	
  1265			/*
  1266			 *	struct path path;
  1267			 *
  1268			 *	if (!kern_path(symname, LOOKUP_FOLLOW, &path)){
  1269			 *		struct inode *target = d_inode(path.dentry);
  1270			 *
  1271			 *		if (S_ISDIR(target->i_mode))
  1272			 *			fa |= FILE_ATTRIBUTE_DIRECTORY;
  1273			 *		// if ( target->i_sb == sb ){
  1274			 *		//	use relative path?
  1275			 *		// }
  1276			 *		path_put(&path);
  1277			 *	}
  1278			 */
  1279		} else if (S_ISREG(mode)) {
  1280			if (sbi->options->sparse) {
  1281				/* Sparsed regular file, cause option 'sparse'. */
  1282				fa = FILE_ATTRIBUTE_SPARSE_FILE |
  1283				     FILE_ATTRIBUTE_ARCHIVE;
  1284			} else if (dir_ni->std_fa & FILE_ATTRIBUTE_COMPRESSED) {
  1285				/* Compressed regular file, if parent is compressed. */
  1286				fa = FILE_ATTRIBUTE_COMPRESSED | FILE_ATTRIBUTE_ARCHIVE;
  1287			} else {
  1288				/* Regular file, default attributes. */
  1289				fa = FILE_ATTRIBUTE_ARCHIVE;
  1290			}
  1291		} else {
  1292			fa = FILE_ATTRIBUTE_ARCHIVE;
  1293		}
  1294	
  1295		/* If option "hide_dot_files" then set hidden attribute for dot files. */
  1296		if (sbi->options->hide_dot_files && name->name[0] == '.')
  1297			fa |= FILE_ATTRIBUTE_HIDDEN;
  1298	
  1299		if (!(mode & 0222))
  1300			fa |= FILE_ATTRIBUTE_READONLY;
  1301	
  1302		/* Allocate PATH_MAX bytes. */
  1303		new_de = __getname();
  1304		if (!new_de) {
  1305			err = -ENOMEM;
  1306			goto out1;
  1307		}
  1308	
  1309		/* Mark rw ntfs as dirty. it will be cleared at umount. */
  1310		ntfs_set_state(sbi, NTFS_DIRTY_DIRTY);
  1311	
  1312		/* Step 1: allocate and fill new mft record. */
  1313		err = ntfs_look_free_mft(sbi, &ino, false, NULL, NULL);
  1314		if (err)
  1315			goto out2;
  1316	
  1317		ni = ntfs_new_inode(sbi, ino, S_ISDIR(mode) ? RECORD_FLAG_DIR : 0);
  1318		if (IS_ERR(ni)) {
  1319			err = PTR_ERR(ni);
  1320			ni = NULL;
  1321			goto out3;
  1322		}
  1323		inode = &ni->vfs_inode;
  1324		inode_init_owner(idmap, inode, dir, mode);
  1325		mode = inode->i_mode;
  1326	
  1327		ni->i_crtime = current_time(inode);
  1328	
  1329		rec = ni->mi.mrec;
  1330		rec->hard_links = cpu_to_le16(1);
  1331		attr = Add2Ptr(rec, le16_to_cpu(rec->attr_off));
  1332	
  1333		/* Get default security id. */
  1334		sd = s_default_security;
  1335		sd_size = sizeof(s_default_security);
  1336	
  1337		if (is_ntfs3(sbi)) {
  1338			security_id = dir_ni->std_security_id;
  1339			if (le32_to_cpu(security_id) < SECURITY_ID_FIRST) {
  1340				security_id = sbi->security.def_security_id;
  1341	
  1342				if (security_id == SECURITY_ID_INVALID &&
  1343				    !ntfs_insert_security(sbi, sd, sd_size,
  1344							  &security_id, NULL))
  1345					sbi->security.def_security_id = security_id;
  1346			}
  1347		}
  1348	
  1349		/* Insert standard info. */
  1350		std5 = Add2Ptr(attr, SIZEOF_RESIDENT);
  1351	
  1352		if (security_id == SECURITY_ID_INVALID) {
  1353			dsize = sizeof(struct ATTR_STD_INFO);
  1354		} else {
  1355			dsize = sizeof(struct ATTR_STD_INFO5);
  1356			std5->security_id = security_id;
  1357			ni->std_security_id = security_id;
  1358		}
  1359		asize = SIZEOF_RESIDENT + dsize;
  1360	
  1361		attr->type = ATTR_STD;
  1362		attr->size = cpu_to_le32(asize);
  1363		attr->id = cpu_to_le16(aid++);
  1364		attr->res.data_off = SIZEOF_RESIDENT_LE;
  1365		attr->res.data_size = cpu_to_le32(dsize);
  1366	
  1367		std5->cr_time = std5->m_time = std5->c_time = std5->a_time =
  1368			kernel2nt(&ni->i_crtime);
  1369	
  1370		std5->fa = ni->std_fa = fa;
  1371	
  1372		attr = Add2Ptr(attr, asize);
  1373	
  1374		/* Insert file name. */
  1375		err = fill_name_de(sbi, new_de, name, uni);
  1376		if (err)
  1377			goto out4;
  1378	
  1379		mi_get_ref(&ni->mi, &new_de->ref);
  1380	
  1381		fname = (struct ATTR_FILE_NAME *)(new_de + 1);
  1382	
  1383		if (sbi->options->windows_names &&
  1384		    !valid_windows_name(sbi, (struct le_str *)&fname->name_len)) {
  1385			err = -EINVAL;
  1386			goto out4;
  1387		}
  1388	
  1389		mi_get_ref(&dir_ni->mi, &fname->home);
  1390		fname->dup.cr_time = fname->dup.m_time = fname->dup.c_time =
  1391			fname->dup.a_time = std5->cr_time;
  1392		fname->dup.alloc_size = fname->dup.data_size = 0;
  1393		fname->dup.fa = std5->fa;
  1394		fname->dup.ea_size = fname->dup.reparse = 0;
  1395	
  1396		dsize = le16_to_cpu(new_de->key_size);
  1397		asize = ALIGN(SIZEOF_RESIDENT + dsize, 8);
  1398	
  1399		attr->type = ATTR_NAME;
  1400		attr->size = cpu_to_le32(asize);
  1401		attr->res.data_off = SIZEOF_RESIDENT_LE;
  1402		attr->res.flags = RESIDENT_FLAG_INDEXED;
  1403		attr->id = cpu_to_le16(aid++);
  1404		attr->res.data_size = cpu_to_le32(dsize);
  1405		memcpy(Add2Ptr(attr, SIZEOF_RESIDENT), fname, dsize);
  1406	
  1407		attr = Add2Ptr(attr, asize);
  1408	
  1409		if (security_id == SECURITY_ID_INVALID) {
  1410			/* Insert security attribute. */
  1411			asize = SIZEOF_RESIDENT + ALIGN(sd_size, 8);
  1412	
  1413			attr->type = ATTR_SECURE;
  1414			attr->size = cpu_to_le32(asize);
  1415			attr->id = cpu_to_le16(aid++);
  1416			attr->res.data_off = SIZEOF_RESIDENT_LE;
  1417			attr->res.data_size = cpu_to_le32(sd_size);
  1418			memcpy(Add2Ptr(attr, SIZEOF_RESIDENT), sd, sd_size);
  1419	
  1420			attr = Add2Ptr(attr, asize);
  1421		}
  1422	
  1423		attr->id = cpu_to_le16(aid++);
  1424		if (fa & FILE_ATTRIBUTE_DIRECTORY) {
  1425			/*
  1426			 * Regular directory or symlink to directory.
  1427			 * Create root attribute.
  1428			 */
  1429			dsize = sizeof(struct INDEX_ROOT) + sizeof(struct NTFS_DE);
  1430			asize = sizeof(I30_NAME) + SIZEOF_RESIDENT + dsize;
  1431	
  1432			attr->type = ATTR_ROOT;
  1433			attr->size = cpu_to_le32(asize);
  1434	
  1435			attr->name_len = ARRAY_SIZE(I30_NAME);
  1436			attr->name_off = SIZEOF_RESIDENT_LE;
  1437			attr->res.data_off =
  1438				cpu_to_le16(sizeof(I30_NAME) + SIZEOF_RESIDENT);
  1439			attr->res.data_size = cpu_to_le32(dsize);
  1440			memcpy(Add2Ptr(attr, SIZEOF_RESIDENT), I30_NAME,
  1441			       sizeof(I30_NAME));
  1442	
  1443			root = Add2Ptr(attr, sizeof(I30_NAME) + SIZEOF_RESIDENT);
  1444			memcpy(root, dir_root, offsetof(struct INDEX_ROOT, ihdr));
  1445			root->ihdr.de_off = cpu_to_le32(sizeof(struct INDEX_HDR));
  1446			root->ihdr.used = cpu_to_le32(sizeof(struct INDEX_HDR) +
  1447						      sizeof(struct NTFS_DE));
  1448			root->ihdr.total = root->ihdr.used;
  1449	
  1450			e = Add2Ptr(root, sizeof(struct INDEX_ROOT));
  1451			e->size = cpu_to_le16(sizeof(struct NTFS_DE));
  1452			e->flags = NTFS_IE_LAST;
  1453		} else if (S_ISLNK(mode)) {
  1454			/*
  1455			 * Symlink to file.
  1456			 * Create empty resident data attribute.
  1457			 */
  1458			asize = SIZEOF_RESIDENT;
  1459	
  1460			/* Insert empty ATTR_DATA */
  1461			attr->type = ATTR_DATA;
  1462			attr->size = cpu_to_le32(SIZEOF_RESIDENT);
  1463			attr->name_off = SIZEOF_RESIDENT_LE;
  1464			attr->res.data_off = SIZEOF_RESIDENT_LE;
  1465		} else if (S_ISREG(mode)) {
  1466			/*
  1467			 * Regular file. Create empty non resident data attribute.
  1468			 */
  1469			attr->type = ATTR_DATA;
  1470			attr->non_res = 1;
  1471			attr->nres.evcn = cpu_to_le64(-1ll);
  1472			if (fa & FILE_ATTRIBUTE_SPARSE_FILE) {
  1473				attr->size = cpu_to_le32(SIZEOF_NONRESIDENT_EX + 8);
  1474				attr->name_off = SIZEOF_NONRESIDENT_EX_LE;
  1475				attr->flags = ATTR_FLAG_SPARSED;
  1476				asize = SIZEOF_NONRESIDENT_EX + 8;
  1477			} else if (fa & FILE_ATTRIBUTE_COMPRESSED) {
  1478				attr->size = cpu_to_le32(SIZEOF_NONRESIDENT_EX + 8);
  1479				attr->name_off = SIZEOF_NONRESIDENT_EX_LE;
  1480				attr->flags = ATTR_FLAG_COMPRESSED;
  1481				attr->nres.c_unit = COMPRESSION_UNIT;
  1482				asize = SIZEOF_NONRESIDENT_EX + 8;
  1483			} else {
  1484				attr->size = cpu_to_le32(SIZEOF_NONRESIDENT + 8);
  1485				attr->name_off = SIZEOF_NONRESIDENT_LE;
  1486				asize = SIZEOF_NONRESIDENT + 8;
  1487			}
  1488			attr->nres.run_off = attr->name_off;
  1489		} else {
  1490			/*
  1491			 * Node. Create empty resident data attribute.
  1492			 */
  1493			attr->type = ATTR_DATA;
  1494			attr->size = cpu_to_le32(SIZEOF_RESIDENT);
  1495			attr->name_off = SIZEOF_RESIDENT_LE;
  1496			if (fa & FILE_ATTRIBUTE_SPARSE_FILE)
  1497				attr->flags = ATTR_FLAG_SPARSED;
  1498			else if (fa & FILE_ATTRIBUTE_COMPRESSED)
  1499				attr->flags = ATTR_FLAG_COMPRESSED;
  1500			attr->res.data_off = SIZEOF_RESIDENT_LE;
  1501			asize = SIZEOF_RESIDENT;
  1502			ni->ni_flags |= NI_FLAG_RESIDENT;
  1503		}
  1504	
  1505		if (S_ISDIR(mode)) {
  1506			ni->ni_flags |= NI_FLAG_DIR;
  1507			err = indx_init(&ni->dir, sbi, attr, INDEX_MUTEX_I30);
  1508			if (err)
  1509				goto out4;
  1510		} else if (S_ISLNK(mode)) {
  1511			rp = ntfs_create_reparse_buffer(sbi, symname, size, &nsize);
  1512	
  1513			if (IS_ERR(rp)) {
  1514				err = PTR_ERR(rp);
  1515				rp = NULL;
  1516				goto out4;
  1517			}
  1518	
  1519			/*
  1520			 * Insert ATTR_REPARSE.
  1521			 */
  1522			attr = Add2Ptr(attr, asize);
  1523			attr->type = ATTR_REPARSE;
  1524			attr->id = cpu_to_le16(aid++);
  1525	
  1526			/* Resident or non resident? */
  1527			asize = ALIGN(SIZEOF_RESIDENT + nsize, 8);
  1528			t16 = PtrOffset(rec, attr);
  1529	
  1530			/*
  1531			 * Below function 'ntfs_save_wsl_perm' requires 0x78 bytes.
  1532			 * It is good idea to keep extened attributes resident.
  1533			 */
  1534			if (asize + t16 + 0x78 + 8 > sbi->record_size) {
  1535				CLST alen;
  1536				CLST clst = bytes_to_cluster(sbi, nsize);
  1537	
  1538				/* Bytes per runs. */
  1539				t16 = sbi->record_size - t16 - SIZEOF_NONRESIDENT;
  1540	
  1541				attr->non_res = 1;
  1542				attr->nres.evcn = cpu_to_le64(clst - 1);
  1543				attr->name_off = SIZEOF_NONRESIDENT_LE;
  1544				attr->nres.run_off = attr->name_off;
  1545				attr->nres.data_size = cpu_to_le64(nsize);
  1546				attr->nres.valid_size = attr->nres.data_size;
  1547				attr->nres.alloc_size =
  1548					cpu_to_le64(ntfs_up_cluster(sbi, nsize));
  1549	
  1550				err = attr_allocate_clusters(sbi, &ni->file.run, 0, 0,
  1551							     clst, NULL, ALLOCATE_DEF,
  1552							     &alen, 0, NULL, NULL);
  1553				if (err)
  1554					goto out5;
  1555	
  1556				err = run_pack(&ni->file.run, 0, clst,
  1557					       Add2Ptr(attr, SIZEOF_NONRESIDENT), t16,
  1558					       &vcn);
  1559				if (err < 0)
  1560					goto out5;
  1561	
  1562				if (vcn != clst) {
  1563					err = -EINVAL;
  1564					goto out5;
  1565				}
  1566	
  1567				asize = SIZEOF_NONRESIDENT + ALIGN(err, 8);
  1568				/* Write non resident data. */
  1569				err = ntfs_sb_write_run(sbi, &ni->file.run, 0, rp,
  1570							nsize, 0);
  1571				if (err)
  1572					goto out5;
  1573			} else {
  1574				attr->res.data_off = SIZEOF_RESIDENT_LE;
  1575				attr->res.data_size = cpu_to_le32(nsize);
  1576				memcpy(Add2Ptr(attr, SIZEOF_RESIDENT), rp, nsize);
  1577			}
  1578			/* Size of symlink equals the length of input string. */
  1579			inode->i_size = size;
  1580	
  1581			attr->size = cpu_to_le32(asize);
  1582	
  1583			err = ntfs_insert_reparse(sbi, IO_REPARSE_TAG_SYMLINK,
  1584						  &new_de->ref);
  1585			if (err)
  1586				goto out5;
  1587	
  1588			rp_inserted = true;
  1589		}
  1590	
  1591		attr = Add2Ptr(attr, asize);
  1592		attr->type = ATTR_END;
  1593	
  1594		rec->used = cpu_to_le32(PtrOffset(rec, attr) + 8);
  1595		rec->next_attr_id = cpu_to_le16(aid);
  1596	
  1597		inode->i_generation = le16_to_cpu(rec->seq);
  1598	
  1599		if (S_ISDIR(mode)) {
  1600			inode->i_op = &ntfs_dir_inode_operations;
  1601			inode->i_fop = &ntfs_dir_operations;
  1602		} else if (S_ISLNK(mode)) {
  1603			inode->i_op = &ntfs_link_inode_operations;
  1604			inode->i_fop = NULL;
  1605			inode->i_mapping->a_ops = &ntfs_aops;
  1606			inode->i_size = size;
  1607			inode_nohighmem(inode);
  1608		} else if (S_ISREG(mode)) {
  1609			inode->i_op = &ntfs_file_inode_operations;
  1610			inode->i_fop = &ntfs_file_operations;
  1611			inode->i_mapping->a_ops = is_compressed(ni) ? &ntfs_aops_cmpr :
  1612								      &ntfs_aops;
  1613			init_rwsem(&ni->file.run_lock);
  1614		} else {
  1615			inode->i_op = &ntfs_special_inode_operations;
  1616			init_special_inode(inode, mode, dev);
  1617		}
  1618	
  1619	#ifdef CONFIG_NTFS3_FS_POSIX_ACL
  1620		if (!S_ISLNK(mode) && (sb->s_flags & SB_POSIXACL)) {
  1621			err = ntfs_init_acl(idmap, inode, dir);
  1622			if (err)
  1623				goto out5;
  1624		} else
  1625	#endif
  1626		{
  1627			inode->i_flags |= S_NOSEC;
  1628		}
  1629	
  1630		/*
  1631		 * ntfs_init_acl and ntfs_save_wsl_perm update extended attribute.
  1632		 * The packed size of extended attribute is stored in direntry too.
  1633		 * 'fname' here points to inside new_de.
  1634		 */
  1635		ntfs_save_wsl_perm(inode, &fname->dup.ea_size);
  1636	
  1637		/*
  1638		 * update ea_size in file_name attribute too.
  1639		 * Use ni_find_attr cause layout of MFT record may be changed
  1640		 * in ntfs_init_acl and ntfs_save_wsl_perm.
  1641		 */
  1642		attr = ni_find_attr(ni, NULL, NULL, ATTR_NAME, NULL, 0, NULL, NULL);
  1643		if (attr) {
  1644			struct ATTR_FILE_NAME *fn;
  1645	
  1646			fn = resident_data_ex(attr, SIZEOF_ATTRIBUTE_FILENAME);
  1647			if (fn)
  1648				fn->dup.ea_size = fname->dup.ea_size;
  1649		}
  1650	
  1651		/* We do not need to update parent directory later */
  1652		ni->ni_flags &= ~NI_FLAG_UPDATE_PARENT;
  1653	
  1654		/* Step 2: Add new name in index. */
  1655		err = indx_insert_entry(&dir_ni->dir, dir_ni, new_de, sbi, fnd, 0);
  1656		if (err)
  1657			goto out6;
  1658	
  1659		/*
  1660		 * Call 'd_instantiate' after inode->i_op is set
  1661		 * but before finish_open.
  1662		 */
  1663		d_instantiate(dentry, inode);
  1664	
  1665		/* Set original time. inode times (i_ctime) may be changed in ntfs_init_acl. */
> 1666	<<<<<<< HEAD
  1667		inode->i_atime = inode->i_mtime =
  1668			inode_set_ctime_to_ts(inode, ni->i_crtime);
  1669		dir->i_mtime = inode_set_ctime_to_ts(dir, ni->i_crtime);
  1670	=======
  1671		inode_set_mtime_to_ts(inode,
  1672				      inode_set_atime_to_ts(inode, inode_set_ctime_to_ts(inode, ni->i_crtime)));
  1673		inode_set_mtime_to_ts(dir, inode_set_ctime_to_ts(dir, ni->i_crtime));
  1674	>>>>>>> c93949aae9cd (fs: convert core infrastructure to new {a,m}time accessors)
  1675	
  1676		mark_inode_dirty(dir);
  1677		mark_inode_dirty(inode);
  1678	
  1679		/* Normal exit. */
  1680		goto out2;
  1681	
  1682	out6:
  1683		if (rp_inserted)
  1684			ntfs_remove_reparse(sbi, IO_REPARSE_TAG_SYMLINK, &new_de->ref);
  1685	
  1686	out5:
  1687		if (!S_ISDIR(mode))
  1688			run_deallocate(sbi, &ni->file.run, false);
  1689	
  1690	out4:
  1691		clear_rec_inuse(rec);
  1692		clear_nlink(inode);
  1693		ni->mi.dirty = false;
  1694		discard_new_inode(inode);
  1695	out3:
  1696		ntfs_mark_rec_free(sbi, ino, false);
  1697	
  1698	out2:
  1699		__putname(new_de);
  1700		kfree(rp);
  1701	
  1702	out1:
  1703		if (!fnd)
  1704			ni_unlock(dir_ni);
  1705	
  1706		if (err)
  1707			return ERR_PTR(err);
  1708	
  1709		unlock_new_inode(inode);
  1710	
  1711		return inode;
  1712	}
  1713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
