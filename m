Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B88A3C1E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 21:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693777604; x=1725313604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=USAzBEm3bvPGgkf4HAFjvyXsnAzbfcIJMyCJe32csvY=;
  b=UhNYzOTzQZ3wyMk/mHMFy/5+ZzQum4a7sSLXvAoatrx02UEjT10ttNlw
   HCnZDhRSGZHyeVQE/RryYuX9/kS1QwvSnveWkd0wptsXqSGXyBRmP1Ewc
   624imhQ/GRVmL4K4ZM5N6JCYya1WQl6txI8cd+HbJcU2d1ZrQ0jl5nMWO
   oDdUnNHzX0nGiDYeeCx9Rj4D+eicChtzYnnyHRK+XU22GqBiZI0zcPWGE
   HT7TeZxOvoCgmdjK1vXxILGkhd3DhWn2IN2MY0kvA7nxNgj2PsaFontDK
   qQc7jKMlE/7vsuuJUpBbojcZz1k3wd/g1eG1e+irUsPYHec7jN+TN0k0j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="407477850"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="407477850"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 14:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="806042425"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="806042425"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Sep 2023 14:46:41 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcuvV-0003R1-2j;
	Sun, 03 Sep 2023 21:46:37 +0000
Date: Mon, 4 Sep 2023 05:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fix-larp-requirements-6.6 15/16] fs/xfs/xfs_qm.c:1327:9:
 error: implicit declaration of function 'xfs_set_quotacheck_running'; did
 you mean 'xfs_is_quotacheck_running'?
Message-ID: <202309040554.Gd1PpsG3-lkp@intel.com>
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
config: i386-randconfig-r001-20230904 (https://download.01.org/0day-ci/archive/20230904/202309040554.Gd1PpsG3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309040554.Gd1PpsG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309040554.Gd1PpsG3-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_qm.c: In function 'xfs_qm_quotacheck':
>> fs/xfs/xfs_qm.c:1327:9: error: implicit declaration of function 'xfs_set_quotacheck_running'; did you mean 'xfs_is_quotacheck_running'? [-Werror=implicit-function-declaration]
    1327 |         xfs_set_quotacheck_running(mp);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_is_quotacheck_running
>> fs/xfs/xfs_qm.c:1330:9: error: implicit declaration of function 'xfs_clear_quotacheck_running'; did you mean 'xfs_is_quotacheck_running'? [-Werror=implicit-function-declaration]
    1330 |         xfs_clear_quotacheck_running(mp);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_is_quotacheck_running
   cc1: some warnings being treated as errors


vim +1327 fs/xfs/xfs_qm.c

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
