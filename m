Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2043AA87
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 23:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687475571; x=1719011571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OWGjVAgA8BhWblP+kXvi43qMUC/gIAsGAin/vOPxr6w=;
  b=WlwjFJLbtE3kUooMx0ii7V8qF12LAQRMZahqePxbZLQA2RfwbrIGaHuW
   qsIoS4w7no3FqBwauWsIB1yNULDjf1u/LDJ6F0QId2rhYbQVtF0qnPlDM
   QnrUy0VnFOxt5hWLE6N1ozrFpKqENhA7PsFEdIw9XoQwm5br1rTm1wd20
   zDspXiboMvJ19nFd1CkRcEJN9n/uEVpfif2oGre1zfkwiG+CyBAuFqWAL
   cX1doXl3nXvVoZEX25LjkQ6PKKgZYBokaXRvAO48AEfnb1TfKTPQa0rjj
   DUJ+YH1cPBSGnPLrWig3F4nSZJELJqnFJ5IwZrhHqWyqyEJsbTNqJwxut
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="340976492"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="340976492"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 16:12:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="889261770"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="889261770"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Jun 2023 16:12:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCTTr-0007o9-2F;
	Thu, 22 Jun 2023 23:12:47 +0000
Date: Fri, 23 Jun 2023 07:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime.2 17/30] fs/ntfs/inode.c:1222:33: error: lvalue
 required as left operand of assignment
Message-ID: <202306230742.ztL7KI5w-lkp@intel.com>
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
config: sh-randconfig-r031-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230742.ztL7KI5w-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230742.ztL7KI5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230742.ztL7KI5w-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ntfs/inode.c: In function 'ntfs_read_locked_attr_inode':
>> fs/ntfs/inode.c:1222:33: error: lvalue required as left operand of assignment
    1222 |         inode_get_ctime(vi)     = inode_get_ctime(base_vi);
         |                                 ^
   fs/ntfs/inode.c: In function 'ntfs_read_locked_index_inode':
   fs/ntfs/inode.c:1488:33: error: lvalue required as left operand of assignment
    1488 |         inode_get_ctime(vi)     = inode_get_ctime(base_vi);
         |                                 ^
   fs/ntfs/inode.c: In function 'ntfs_truncate':
>> fs/ntfs/inode.c:2811:39: error: lvalue required as unary '&' operand
    2811 |                     !timespec64_equal(&inode_get_ctime(VFS_I(base_ni)), &now))
         |                                       ^
   fs/ntfs/inode.c: In function 'ntfs_setattr':
   fs/ntfs/inode.c:2931:37: error: lvalue required as left operand of assignment
    2931 |                 inode_get_ctime(vi) = attr->ia_ctime;
         |                                     ^


vim +1222 fs/ntfs/inode.c

  1178	
  1179	/**
  1180	 * ntfs_read_locked_attr_inode - read an attribute inode from its base inode
  1181	 * @base_vi:	base inode
  1182	 * @vi:		attribute inode to read
  1183	 *
  1184	 * ntfs_read_locked_attr_inode() is called from ntfs_attr_iget() to read the
  1185	 * attribute inode described by @vi into memory from the base mft record
  1186	 * described by @base_ni.
  1187	 *
  1188	 * ntfs_read_locked_attr_inode() maps, pins and locks the base inode for
  1189	 * reading and looks up the attribute described by @vi before setting up the
  1190	 * necessary fields in @vi as well as initializing the ntfs inode.
  1191	 *
  1192	 * Q: What locks are held when the function is called?
  1193	 * A: i_state has I_NEW set, hence the inode is locked, also
  1194	 *    i_count is set to 1, so it is not going to go away
  1195	 *
  1196	 * Return 0 on success and -errno on error.  In the error case, the inode will
  1197	 * have had make_bad_inode() executed on it.
  1198	 *
  1199	 * Note this cannot be called for AT_INDEX_ALLOCATION.
  1200	 */
  1201	static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
  1202	{
  1203		ntfs_volume *vol = NTFS_SB(vi->i_sb);
  1204		ntfs_inode *ni, *base_ni;
  1205		MFT_RECORD *m;
  1206		ATTR_RECORD *a;
  1207		ntfs_attr_search_ctx *ctx;
  1208		int err = 0;
  1209	
  1210		ntfs_debug("Entering for i_ino 0x%lx.", vi->i_ino);
  1211	
  1212		ntfs_init_big_inode(vi);
  1213	
  1214		ni	= NTFS_I(vi);
  1215		base_ni = NTFS_I(base_vi);
  1216	
  1217		/* Just mirror the values from the base inode. */
  1218		vi->i_uid	= base_vi->i_uid;
  1219		vi->i_gid	= base_vi->i_gid;
  1220		set_nlink(vi, base_vi->i_nlink);
  1221		vi->i_mtime	= base_vi->i_mtime;
> 1222		inode_get_ctime(vi)	= inode_get_ctime(base_vi);
  1223		vi->i_atime	= base_vi->i_atime;
  1224		vi->i_generation = ni->seq_no = base_ni->seq_no;
  1225	
  1226		/* Set inode type to zero but preserve permissions. */
  1227		vi->i_mode	= base_vi->i_mode & ~S_IFMT;
  1228	
  1229		m = map_mft_record(base_ni);
  1230		if (IS_ERR(m)) {
  1231			err = PTR_ERR(m);
  1232			goto err_out;
  1233		}
  1234		ctx = ntfs_attr_get_search_ctx(base_ni, m);
  1235		if (!ctx) {
  1236			err = -ENOMEM;
  1237			goto unm_err_out;
  1238		}
  1239		/* Find the attribute. */
  1240		err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
  1241				CASE_SENSITIVE, 0, NULL, 0, ctx);
  1242		if (unlikely(err))
  1243			goto unm_err_out;
  1244		a = ctx->attr;
  1245		if (a->flags & (ATTR_COMPRESSION_MASK | ATTR_IS_SPARSE)) {
  1246			if (a->flags & ATTR_COMPRESSION_MASK) {
  1247				NInoSetCompressed(ni);
  1248				if ((ni->type != AT_DATA) || (ni->type == AT_DATA &&
  1249						ni->name_len)) {
  1250					ntfs_error(vi->i_sb, "Found compressed "
  1251							"non-data or named data "
  1252							"attribute.  Please report "
  1253							"you saw this message to "
  1254							"linux-ntfs-dev@lists."
  1255							"sourceforge.net");
  1256					goto unm_err_out;
  1257				}
  1258				if (vol->cluster_size > 4096) {
  1259					ntfs_error(vi->i_sb, "Found compressed "
  1260							"attribute but compression is "
  1261							"disabled due to cluster size "
  1262							"(%i) > 4kiB.",
  1263							vol->cluster_size);
  1264					goto unm_err_out;
  1265				}
  1266				if ((a->flags & ATTR_COMPRESSION_MASK) !=
  1267						ATTR_IS_COMPRESSED) {
  1268					ntfs_error(vi->i_sb, "Found unknown "
  1269							"compression method.");
  1270					goto unm_err_out;
  1271				}
  1272			}
  1273			/*
  1274			 * The compressed/sparse flag set in an index root just means
  1275			 * to compress all files.
  1276			 */
  1277			if (NInoMstProtected(ni) && ni->type != AT_INDEX_ROOT) {
  1278				ntfs_error(vi->i_sb, "Found mst protected attribute "
  1279						"but the attribute is %s.  Please "
  1280						"report you saw this message to "
  1281						"linux-ntfs-dev@lists.sourceforge.net",
  1282						NInoCompressed(ni) ? "compressed" :
  1283						"sparse");
  1284				goto unm_err_out;
  1285			}
  1286			if (a->flags & ATTR_IS_SPARSE)
  1287				NInoSetSparse(ni);
  1288		}
  1289		if (a->flags & ATTR_IS_ENCRYPTED) {
  1290			if (NInoCompressed(ni)) {
  1291				ntfs_error(vi->i_sb, "Found encrypted and compressed "
  1292						"data.");
  1293				goto unm_err_out;
  1294			}
  1295			/*
  1296			 * The encryption flag set in an index root just means to
  1297			 * encrypt all files.
  1298			 */
  1299			if (NInoMstProtected(ni) && ni->type != AT_INDEX_ROOT) {
  1300				ntfs_error(vi->i_sb, "Found mst protected attribute "
  1301						"but the attribute is encrypted.  "
  1302						"Please report you saw this message "
  1303						"to linux-ntfs-dev@lists.sourceforge."
  1304						"net");
  1305				goto unm_err_out;
  1306			}
  1307			if (ni->type != AT_DATA) {
  1308				ntfs_error(vi->i_sb, "Found encrypted non-data "
  1309						"attribute.");
  1310				goto unm_err_out;
  1311			}
  1312			NInoSetEncrypted(ni);
  1313		}
  1314		if (!a->non_resident) {
  1315			/* Ensure the attribute name is placed before the value. */
  1316			if (unlikely(a->name_length && (le16_to_cpu(a->name_offset) >=
  1317					le16_to_cpu(a->data.resident.value_offset)))) {
  1318				ntfs_error(vol->sb, "Attribute name is placed after "
  1319						"the attribute value.");
  1320				goto unm_err_out;
  1321			}
  1322			if (NInoMstProtected(ni)) {
  1323				ntfs_error(vi->i_sb, "Found mst protected attribute "
  1324						"but the attribute is resident.  "
  1325						"Please report you saw this message to "
  1326						"linux-ntfs-dev@lists.sourceforge.net");
  1327				goto unm_err_out;
  1328			}
  1329			vi->i_size = ni->initialized_size = le32_to_cpu(
  1330					a->data.resident.value_length);
  1331			ni->allocated_size = le32_to_cpu(a->length) -
  1332					le16_to_cpu(a->data.resident.value_offset);
  1333			if (vi->i_size > ni->allocated_size) {
  1334				ntfs_error(vi->i_sb, "Resident attribute is corrupt "
  1335						"(size exceeds allocation).");
  1336				goto unm_err_out;
  1337			}
  1338		} else {
  1339			NInoSetNonResident(ni);
  1340			/*
  1341			 * Ensure the attribute name is placed before the mapping pairs
  1342			 * array.
  1343			 */
  1344			if (unlikely(a->name_length && (le16_to_cpu(a->name_offset) >=
  1345					le16_to_cpu(
  1346					a->data.non_resident.mapping_pairs_offset)))) {
  1347				ntfs_error(vol->sb, "Attribute name is placed after "
  1348						"the mapping pairs array.");
  1349				goto unm_err_out;
  1350			}
  1351			if (NInoCompressed(ni) || NInoSparse(ni)) {
  1352				if (NInoCompressed(ni) && a->data.non_resident.
  1353						compression_unit != 4) {
  1354					ntfs_error(vi->i_sb, "Found non-standard "
  1355							"compression unit (%u instead "
  1356							"of 4).  Cannot handle this.",
  1357							a->data.non_resident.
  1358							compression_unit);
  1359					err = -EOPNOTSUPP;
  1360					goto unm_err_out;
  1361				}
  1362				if (a->data.non_resident.compression_unit) {
  1363					ni->itype.compressed.block_size = 1U <<
  1364							(a->data.non_resident.
  1365							compression_unit +
  1366							vol->cluster_size_bits);
  1367					ni->itype.compressed.block_size_bits =
  1368							ffs(ni->itype.compressed.
  1369							block_size) - 1;
  1370					ni->itype.compressed.block_clusters = 1U <<
  1371							a->data.non_resident.
  1372							compression_unit;
  1373				} else {
  1374					ni->itype.compressed.block_size = 0;
  1375					ni->itype.compressed.block_size_bits = 0;
  1376					ni->itype.compressed.block_clusters = 0;
  1377				}
  1378				ni->itype.compressed.size = sle64_to_cpu(
  1379						a->data.non_resident.compressed_size);
  1380			}
  1381			if (a->data.non_resident.lowest_vcn) {
  1382				ntfs_error(vi->i_sb, "First extent of attribute has "
  1383						"non-zero lowest_vcn.");
  1384				goto unm_err_out;
  1385			}
  1386			vi->i_size = sle64_to_cpu(a->data.non_resident.data_size);
  1387			ni->initialized_size = sle64_to_cpu(
  1388					a->data.non_resident.initialized_size);
  1389			ni->allocated_size = sle64_to_cpu(
  1390					a->data.non_resident.allocated_size);
  1391		}
  1392		vi->i_mapping->a_ops = &ntfs_normal_aops;
  1393		if (NInoMstProtected(ni))
  1394			vi->i_mapping->a_ops = &ntfs_mst_aops;
  1395		else if (NInoCompressed(ni))
  1396			vi->i_mapping->a_ops = &ntfs_compressed_aops;
  1397		if ((NInoCompressed(ni) || NInoSparse(ni)) && ni->type != AT_INDEX_ROOT)
  1398			vi->i_blocks = ni->itype.compressed.size >> 9;
  1399		else
  1400			vi->i_blocks = ni->allocated_size >> 9;
  1401		/*
  1402		 * Make sure the base inode does not go away and attach it to the
  1403		 * attribute inode.
  1404		 */
  1405		igrab(base_vi);
  1406		ni->ext.base_ntfs_ino = base_ni;
  1407		ni->nr_extents = -1;
  1408	
  1409		ntfs_attr_put_search_ctx(ctx);
  1410		unmap_mft_record(base_ni);
  1411	
  1412		ntfs_debug("Done.");
  1413		return 0;
  1414	
  1415	unm_err_out:
  1416		if (!err)
  1417			err = -EIO;
  1418		if (ctx)
  1419			ntfs_attr_put_search_ctx(ctx);
  1420		unmap_mft_record(base_ni);
  1421	err_out:
  1422		ntfs_error(vol->sb, "Failed with error code %i while reading attribute "
  1423				"inode (mft_no 0x%lx, type 0x%x, name_len %i).  "
  1424				"Marking corrupt inode and base inode 0x%lx as bad.  "
  1425				"Run chkdsk.", err, vi->i_ino, ni->type, ni->name_len,
  1426				base_vi->i_ino);
  1427		make_bad_inode(vi);
  1428		if (err != -ENOMEM)
  1429			NVolSetErrors(vol);
  1430		return err;
  1431	}
  1432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
