Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9DEEDB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 16:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694018804; x=1725554804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3UJk2UUvNJc3PLTTQwJUiQ3IZHMS6Rg8w5hIYqjj9u0=;
  b=l6ltUvE24OACnXrbKGxYgG7t22y50kKnMsy8+LSkcw7C6zD5VzC4O6Ke
   ppE1nqWCX9lLScoQbgDjqZIJAScTXiqa6WpSvYPB1sdMcthjDBBUJCyAd
   m0E/rFhM1wAw1+w+K6/BDgfhybLGNgtz3jWmbRx4Eyq6D8NF8sMx1QNth
   kex+sEWmzJAmvQFyklMf/NW18jstd25ni2lMBa1OzNiVJgxwEvqQAzv7t
   WOV1PPusLy9lW05juAZd9sU9YAJoG9rEVrWIojj/Ho9bzU2ESv+Ko/dGY
   PHXSTeASKOPTKgo4dCJkDJJ2hybHeU+R4+uRPh8ZAmq9+lfiLOR1JwRtO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="377031843"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="377031843"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 09:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="718328866"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="718328866"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Sep 2023 09:46:40 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdvfo-0000PP-2y;
	Wed, 06 Sep 2023 16:46:36 +0000
Date: Thu, 7 Sep 2023 00:46:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fix-larp-requirements-6.6 15/16] fs/xfs/xfs_qm.c:1327:2:
 error: implicit declaration of function 'xfs_set_quotacheck_running' is
 invalid in C99
Message-ID: <202309070058.disG5Tpc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fix-larp-requirements-6.6
head:   a74281779cc1e023dda2faa836e190a79b58f332
commit: 9efe678bf13a9719c6938e0b6945cb2a69cbc1c7 [15/16] xfs: make inode unlinked bucket recovery work with quotacheck
config: hexagon-randconfig-002-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070058.disG5Tpc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070058.disG5Tpc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070058.disG5Tpc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_qm.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/xfs/xfs_qm.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/xfs/xfs_qm.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> fs/xfs/xfs_qm.c:1327:2: error: implicit declaration of function 'xfs_set_quotacheck_running' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           xfs_set_quotacheck_running(mp);
           ^
>> fs/xfs/xfs_qm.c:1330:2: error: implicit declaration of function 'xfs_clear_quotacheck_running' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           xfs_clear_quotacheck_running(mp);
           ^
   fs/xfs/xfs_qm.c:1330:2: note: did you mean 'xfs_set_quotacheck_running'?
   fs/xfs/xfs_qm.c:1327:2: note: 'xfs_set_quotacheck_running' declared here
           xfs_set_quotacheck_running(mp);
           ^
   6 warnings and 2 errors generated.


vim +/xfs_set_quotacheck_running +1327 fs/xfs/xfs_qm.c

  1275	
  1276	/*
  1277	 * Walk thru all the filesystem inodes and construct a consistent view
  1278	 * of the disk quota world. If the quotacheck fails, disable quotas.
  1279	 */
  1280	STATIC int
  1281	xfs_qm_quotacheck(
  1282		xfs_mount_t	*mp)
  1283	{
  1284		int			error, error2;
  1285		uint			flags;
  1286		LIST_HEAD		(buffer_list);
  1287		struct xfs_inode	*uip = mp->m_quotainfo->qi_uquotaip;
  1288		struct xfs_inode	*gip = mp->m_quotainfo->qi_gquotaip;
  1289		struct xfs_inode	*pip = mp->m_quotainfo->qi_pquotaip;
  1290	
  1291		flags = 0;
  1292	
  1293		ASSERT(uip || gip || pip);
  1294		ASSERT(XFS_IS_QUOTA_ON(mp));
  1295	
  1296		xfs_notice(mp, "Quotacheck needed: Please wait.");
  1297	
  1298		/*
  1299		 * First we go thru all the dquots on disk, USR and GRP/PRJ, and reset
  1300		 * their counters to zero. We need a clean slate.
  1301		 * We don't log our changes till later.
  1302		 */
  1303		if (uip) {
  1304			error = xfs_qm_reset_dqcounts_buf(mp, uip, XFS_DQTYPE_USER,
  1305						 &buffer_list);
  1306			if (error)
  1307				goto error_return;
  1308			flags |= XFS_UQUOTA_CHKD;
  1309		}
  1310	
  1311		if (gip) {
  1312			error = xfs_qm_reset_dqcounts_buf(mp, gip, XFS_DQTYPE_GROUP,
  1313						 &buffer_list);
  1314			if (error)
  1315				goto error_return;
  1316			flags |= XFS_GQUOTA_CHKD;
  1317		}
  1318	
  1319		if (pip) {
  1320			error = xfs_qm_reset_dqcounts_buf(mp, pip, XFS_DQTYPE_PROJ,
  1321						 &buffer_list);
  1322			if (error)
  1323				goto error_return;
  1324			flags |= XFS_PQUOTA_CHKD;
  1325		}
  1326	
> 1327		xfs_set_quotacheck_running(mp);
  1328		error = xfs_iwalk_threaded(mp, 0, 0, xfs_qm_dqusage_adjust, 0, true,
  1329				NULL);
> 1330		xfs_clear_quotacheck_running(mp);
  1331	
  1332		/*
  1333		 * On error, the inode walk may have partially populated the dquot
  1334		 * caches.  We must purge them before disabling quota and tearing down
  1335		 * the quotainfo, or else the dquots will leak.
  1336		 */
  1337		if (error)
  1338			goto error_purge;
  1339	
  1340		/*
  1341		 * We've made all the changes that we need to make incore.  Flush them
  1342		 * down to disk buffers if everything was updated successfully.
  1343		 */
  1344		if (XFS_IS_UQUOTA_ON(mp)) {
  1345			error = xfs_qm_dquot_walk(mp, XFS_DQTYPE_USER, xfs_qm_flush_one,
  1346						  &buffer_list);
  1347		}
  1348		if (XFS_IS_GQUOTA_ON(mp)) {
  1349			error2 = xfs_qm_dquot_walk(mp, XFS_DQTYPE_GROUP, xfs_qm_flush_one,
  1350						   &buffer_list);
  1351			if (!error)
  1352				error = error2;
  1353		}
  1354		if (XFS_IS_PQUOTA_ON(mp)) {
  1355			error2 = xfs_qm_dquot_walk(mp, XFS_DQTYPE_PROJ, xfs_qm_flush_one,
  1356						   &buffer_list);
  1357			if (!error)
  1358				error = error2;
  1359		}
  1360	
  1361		error2 = xfs_buf_delwri_submit(&buffer_list);
  1362		if (!error)
  1363			error = error2;
  1364	
  1365		/*
  1366		 * We can get this error if we couldn't do a dquot allocation inside
  1367		 * xfs_qm_dqusage_adjust (via bulkstat). We don't care about the
  1368		 * dirty dquots that might be cached, we just want to get rid of them
  1369		 * and turn quotaoff. The dquots won't be attached to any of the inodes
  1370		 * at this point (because we intentionally didn't in dqget_noattach).
  1371		 */
  1372		if (error)
  1373			goto error_purge;
  1374	
  1375		/*
  1376		 * If one type of quotas is off, then it will lose its
  1377		 * quotachecked status, since we won't be doing accounting for
  1378		 * that type anymore.
  1379		 */
  1380		mp->m_qflags &= ~XFS_ALL_QUOTA_CHKD;
  1381		mp->m_qflags |= flags;
  1382	
  1383	error_return:
  1384		xfs_buf_delwri_cancel(&buffer_list);
  1385	
  1386		if (error) {
  1387			xfs_warn(mp,
  1388		"Quotacheck: Unsuccessful (Error %d): Disabling quotas.",
  1389				error);
  1390			/*
  1391			 * We must turn off quotas.
  1392			 */
  1393			ASSERT(mp->m_quotainfo != NULL);
  1394			xfs_qm_destroy_quotainfo(mp);
  1395			if (xfs_mount_reset_sbqflags(mp)) {
  1396				xfs_warn(mp,
  1397					"Quotacheck: Failed to reset quota flags.");
  1398			}
  1399		} else
  1400			xfs_notice(mp, "Quotacheck: Done.");
  1401		return error;
  1402	
  1403	error_purge:
  1404		/*
  1405		 * On error, we may have inodes queued for inactivation. This may try
  1406		 * to attach dquots to the inode before running cleanup operations on
  1407		 * the inode and this can race with the xfs_qm_destroy_quotainfo() call
  1408		 * below that frees mp->m_quotainfo. To avoid this race, flush all the
  1409		 * pending inodegc operations before we purge the dquots from memory,
  1410		 * ensuring that background inactivation is idle whilst we turn off
  1411		 * quotas.
  1412		 */
  1413		xfs_inodegc_flush(mp);
  1414		xfs_qm_dqpurge_all(mp);
  1415		goto error_return;
  1416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
