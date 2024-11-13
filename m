Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482B58248D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 03:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731467789; cv=none; b=iwuIyTY3F5rc5YOx0Cw71PPQRLl6foKsWqgGuQxbjezii9GrGhxjd4CKQZhahpr2Xbv07K4G16mI7B4Ftro6kq3EPMedsAnyMIZrz+0WiWsflTzXB1/4wuyDnyCDMCyPUTeH2GPoTeC6dnszQ1p4AyoBZV6bxI+wCDe6DNB1IlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731467789; c=relaxed/simple;
	bh=tmBmBKrpRGyeDeuCYNjdAEsEyEx1SHBc2GRkKk524h4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qI3sxNxZNvMb2JUnVk099kgoqGEZJOA/Q2WisP7BG2xepqF9x6qVAUck3+puIqwSeNTTScUwzXDBgk8fsTYGYSybmWOeooHNBq3HYz5fMfIC8K1fnRASp/YgLNDQN0p8e5LGYXo6uHljFkiJXqkVe/ra/eSwutMs7X37NReSDek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ep4/9umE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ep4/9umE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731467787; x=1763003787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tmBmBKrpRGyeDeuCYNjdAEsEyEx1SHBc2GRkKk524h4=;
  b=Ep4/9umE9FGdv8OchlrKzF65mZ/n0LLM6sP3BrBpqeHJ7Q9PTSIa4dyz
   o1zWg59uwrPdZNCRxFCiqJ8uHVbLofHsOKIpZHl7NFmcr3PeS+3TyUrk7
   cSKQtopb5qjCUaVHoch7uGeR6uyBvNVQOmMB0ULeYMXQeyaqWCvppRy+3
   ZtKOXjLZOvYPTD8QDKlIfit+1evK7igEBepak+Xa9eJ+MVZy5kdPZwkp9
   YorCyOjEXpHuW+XrgPJlB0+HeBqSFzrQAWhISu+jD3s51TWFbpqn2VaFE
   oOj0yXmyQVdHUy0u0Rk6oYGOeznIXdWeE01+IloAUko4pjNVQJEY07sHb
   g==;
X-CSE-ConnectionGUID: MS1ThXiJSw6/TuLGAyO1LA==
X-CSE-MsgGUID: 958B7rJUSfmlSTbiy6IsAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48793857"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48793857"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 19:16:26 -0800
X-CSE-ConnectionGUID: XvhPkE1uSjua/DDooqxe7g==
X-CSE-MsgGUID: 7yVzZWM3R5maxuIMynpJ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="125249487"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Nov 2024 19:16:24 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB3ri-0001yZ-1J;
	Wed, 13 Nov 2024 03:16:22 +0000
Date: Wed, 13 Nov 2024 11:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-meta-btree 2/2] fs/xfs/scrub/inode_repair.c:1397:3:
 warning: variable 'dfork_min' is used uninitialized whenever switch default
 is taken
Message-ID: <202411131137.gwygOBxb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-meta-btree
head:   b6e4506f219333c1012b8e4a69cc8cc2e3c59783
commit: b6e4506f219333c1012b8e4a69cc8cc2e3c59783 [2/2] xfs: use a single inode fork format for metadata btree inodes
config: i386-buildonly-randconfig-001-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131137.gwygOBxb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131137.gwygOBxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131137.gwygOBxb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/scrub/inode_repair.c:6:
   In file included from fs/xfs/xfs.h:26:
   In file included from fs/xfs/xfs_linux.h:25:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/xfs/scrub/inode_repair.c:1397:3: warning: variable 'dfork_min' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    1397 |                 default:
         |                 ^~~~~~~
   fs/xfs/scrub/inode_repair.c:1411:22: note: uninitialized use occurs here
    1411 |         dfork_min = roundup(dfork_min, 8);
         |                             ^~~~~~~~~
   include/linux/math.h:62:5: note: expanded from macro 'roundup'
      62 |         (((x) + (__y - 1)) / __y) * __y;                \
         |            ^
   fs/xfs/scrub/inode_repair.c:1285:36: note: initialize the variable 'dfork_min' to silence this warning
    1285 |         unsigned int            afork_min, dfork_min;
         |                                                     ^
         |                                                      = 0
   2 warnings generated.


vim +/dfork_min +1397 fs/xfs/scrub/inode_repair.c

  1270	
  1271	/* Make sure the fork offset is a sensible value. */
  1272	STATIC void
  1273	xrep_dinode_ensure_forkoff(
  1274		struct xrep_inode	*ri,
  1275		struct xfs_dinode	*dip,
  1276		uint16_t		mode)
  1277	{
  1278		struct xfs_bmdr_block	*bmdr;
  1279		struct xfs_rtrmap_root	*rmdr;
  1280		struct xfs_rtrefcount_root *rcdr;
  1281		struct xfs_scrub	*sc = ri->sc;
  1282		xfs_extnum_t		attr_extents, data_extents;
  1283		size_t			bmdr_minsz = xfs_bmdr_space_calc(1);
  1284		unsigned int		lit_sz = XFS_LITINO(sc->mp);
  1285		unsigned int		afork_min, dfork_min;
  1286	
  1287		trace_xrep_dinode_ensure_forkoff(sc, dip);
  1288	
  1289		/*
  1290		 * Before calling this function, xrep_dinode_core ensured that both
  1291		 * forks actually fit inside their respective literal areas.  If this
  1292		 * was not the case, the fork was reset to FMT_EXTENTS with zero
  1293		 * records.  If the rmapbt scan found attr or data fork blocks, this
  1294		 * will be noted in the dinode_stats, and we must leave enough room
  1295		 * for the bmap repair code to reconstruct the mapping structure.
  1296		 *
  1297		 * First, compute the minimum space required for the attr fork.
  1298		 */
  1299		switch (dip->di_aformat) {
  1300		case XFS_DINODE_FMT_LOCAL:
  1301			/*
  1302			 * If we still have a shortform xattr structure at all, that
  1303			 * means the attr fork area was exactly large enough to fit
  1304			 * the sf structure.
  1305			 */
  1306			afork_min = XFS_DFORK_SIZE(dip, sc->mp, XFS_ATTR_FORK);
  1307			break;
  1308		case XFS_DINODE_FMT_EXTENTS:
  1309			attr_extents = xfs_dfork_attr_extents(dip);
  1310			if (attr_extents) {
  1311				/*
  1312				 * We must maintain sufficient space to hold the entire
  1313				 * extent map array in the data fork.  Note that we
  1314				 * previously zapped the fork if it had no chance of
  1315				 * fitting in the inode.
  1316				 */
  1317				afork_min = sizeof(struct xfs_bmbt_rec) * attr_extents;
  1318			} else if (ri->attr_extents > 0) {
  1319				/*
  1320				 * The attr fork thinks it has zero extents, but we
  1321				 * found some xattr extents.  We need to leave enough
  1322				 * empty space here so that the incore attr fork will
  1323				 * get created (and hence trigger the attr fork bmap
  1324				 * repairer).
  1325				 */
  1326				afork_min = bmdr_minsz;
  1327			} else {
  1328				/* No extents on disk or found in rmapbt. */
  1329				afork_min = 0;
  1330			}
  1331			break;
  1332		case XFS_DINODE_FMT_BTREE:
  1333			/* Must have space for btree header and key/pointers. */
  1334			bmdr = XFS_DFORK_PTR(dip, XFS_ATTR_FORK);
  1335			afork_min = xfs_bmap_broot_space(sc->mp, bmdr);
  1336			break;
  1337		default:
  1338			/* We should never see any other formats. */
  1339			afork_min = 0;
  1340			break;
  1341		}
  1342	
  1343		/* Compute the minimum space required for the data fork. */
  1344		switch (dip->di_format) {
  1345		case XFS_DINODE_FMT_DEV:
  1346			dfork_min = sizeof(__be32);
  1347			break;
  1348		case XFS_DINODE_FMT_UUID:
  1349			dfork_min = sizeof(uuid_t);
  1350			break;
  1351		case XFS_DINODE_FMT_LOCAL:
  1352			/*
  1353			 * If we still have a shortform data fork at all, that means
  1354			 * the data fork area was large enough to fit whatever was in
  1355			 * there.
  1356			 */
  1357			dfork_min = be64_to_cpu(dip->di_size);
  1358			break;
  1359		case XFS_DINODE_FMT_EXTENTS:
  1360			data_extents = xfs_dfork_data_extents(dip);
  1361			if (data_extents) {
  1362				/*
  1363				 * We must maintain sufficient space to hold the entire
  1364				 * extent map array in the data fork.  Note that we
  1365				 * previously zapped the fork if it had no chance of
  1366				 * fitting in the inode.
  1367				 */
  1368				dfork_min = sizeof(struct xfs_bmbt_rec) * data_extents;
  1369			} else if (ri->data_extents > 0 || ri->rt_extents > 0) {
  1370				/*
  1371				 * The data fork thinks it has zero extents, but we
  1372				 * found some data extents.  We need to leave enough
  1373				 * empty space here so that the data fork bmap repair
  1374				 * will recover the mappings.
  1375				 */
  1376				dfork_min = bmdr_minsz;
  1377			} else {
  1378				/* No extents on disk or found in rmapbt. */
  1379				dfork_min = 0;
  1380			}
  1381			break;
  1382		case XFS_DINODE_FMT_BTREE:
  1383			/* Must have space for btree header and key/pointers. */
  1384			bmdr = XFS_DFORK_PTR(dip, XFS_DATA_FORK);
  1385			dfork_min = xfs_bmap_broot_space(sc->mp, bmdr);
  1386			break;
  1387		case XFS_DINODE_FMT_META_BTREE:
  1388			switch (be16_to_cpu(dip->di_metatype)) {
  1389			case XFS_METAFILE_RTRMAP:
  1390				rmdr = XFS_DFORK_PTR(dip, XFS_DATA_FORK);
  1391				dfork_min = xfs_rtrmap_broot_space(sc->mp, rmdr);
  1392				break;
  1393			case XFS_METAFILE_RTREFCOUNT:
  1394				rcdr = XFS_DFORK_PTR(dip, XFS_DATA_FORK);
  1395				dfork_min = xfs_rtrefcount_broot_space(sc->mp, rcdr);
  1396				break;
> 1397			default:
  1398				break;
  1399			}
  1400			break;
  1401		default:
  1402			dfork_min = 0;
  1403			break;
  1404		}
  1405	
  1406		/*
  1407		 * Round all values up to the nearest 8 bytes, because that is the
  1408		 * precision of di_forkoff.
  1409		 */
  1410		afork_min = roundup(afork_min, 8);
  1411		dfork_min = roundup(dfork_min, 8);
  1412		bmdr_minsz = roundup(bmdr_minsz, 8);
  1413	
  1414		ASSERT(dfork_min <= lit_sz);
  1415		ASSERT(afork_min <= lit_sz);
  1416	
  1417		/*
  1418		 * If the data fork was zapped and we don't have enough space for the
  1419		 * recovery fork, move the attr fork up.
  1420		 */
  1421		if (dip->di_format == XFS_DINODE_FMT_EXTENTS &&
  1422		    xfs_dfork_data_extents(dip) == 0 &&
  1423		    (ri->data_extents > 0 || ri->rt_extents > 0) &&
  1424		    bmdr_minsz > XFS_DFORK_DSIZE(dip, sc->mp)) {
  1425			if (bmdr_minsz + afork_min > lit_sz) {
  1426				/*
  1427				 * The attr for and the stub fork we need to recover
  1428				 * the data fork won't both fit.  Zap the attr fork.
  1429				 */
  1430				xrep_dinode_zap_afork(ri, dip, mode);
  1431				afork_min = bmdr_minsz;
  1432			} else {
  1433				void	*before, *after;
  1434	
  1435				/* Otherwise, just slide the attr fork up. */
  1436				before = XFS_DFORK_APTR(dip);
  1437				dip->di_forkoff = bmdr_minsz >> 3;
  1438				after = XFS_DFORK_APTR(dip);
  1439				memmove(after, before, XFS_DFORK_ASIZE(dip, sc->mp));
  1440			}
  1441		}
  1442	
  1443		/*
  1444		 * If the attr fork was zapped and we don't have enough space for the
  1445		 * recovery fork, move the attr fork down.
  1446		 */
  1447		if (dip->di_aformat == XFS_DINODE_FMT_EXTENTS &&
  1448		    xfs_dfork_attr_extents(dip) == 0 &&
  1449		    ri->attr_extents > 0 &&
  1450		    bmdr_minsz > XFS_DFORK_ASIZE(dip, sc->mp)) {
  1451			if (dip->di_format == XFS_DINODE_FMT_BTREE) {
  1452				/*
  1453				 * If the data fork is in btree format then we can't
  1454				 * adjust forkoff because that runs the risk of
  1455				 * violating the extents/btree format transition rules.
  1456				 */
  1457			} else if (bmdr_minsz + dfork_min > lit_sz) {
  1458				/*
  1459				 * If we can't move the attr fork, too bad, we lose the
  1460				 * attr fork and leak its blocks.
  1461				 */
  1462				xrep_dinode_zap_afork(ri, dip, mode);
  1463			} else {
  1464				/*
  1465				 * Otherwise, just slide the attr fork down.  The attr
  1466				 * fork is empty, so we don't have any old contents to
  1467				 * move here.
  1468				 */
  1469				dip->di_forkoff = (lit_sz - bmdr_minsz) >> 3;
  1470			}
  1471		}
  1472	}
  1473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
