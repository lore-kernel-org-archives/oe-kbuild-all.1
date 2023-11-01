Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E273B10A3F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbKpjSNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698838125; x=1730374125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3DeVnuQgfc4gvmxKAI+Xa5iKq08kWwyVBDdb8t1kj3Y=;
  b=AbKpjSNONzUbvzBasly9uW67wd6vws0Pi6yai2AyQ+Ol/6Sdghhdt1tP
   2Bfxbgi8QwyPtavqqDnqQsxJkGBsTNdQ+0Nk/gSgPuMpP7sGbTHChSI3y
   J9Cp1//iXGmBgQQ7v5SA/ciNPqYS0RfemjMrkpX63SEspQl1A5mNUj067
   usSfCm74wsypmFbSg35dhvhSceb9oXTDAZYn/YKybLfAW5TgT7dAGwsc0
   pr26d3EiJYcqnGAhJiAo/F/JaYJGr12oCAdJ6ilH72f51bpiBP3o8zPVa
   Z06fMU/xIe1LeM11lVdZVMelmaa877kQ/NE6dLYZ7IWlmcrPSeISu+EXp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="388296456"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="388296456"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 04:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="851548048"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="851548048"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2023 04:28:43 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy9Or-0000m4-1q;
	Wed, 01 Nov 2023 11:28:41 +0000
Date: Wed, 1 Nov 2023 19:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 48/48] fs/xfs/xfs_zone_alloc.c:1197:25: error:
 implicit declaration of function 'blkdev_report_zones'; did you mean
 'bdev_nr_zones'?
Message-ID: <202311011903.8P42h2Va-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   c4f7071632b671933d29f8b9cdb202a6c1c43dd4
commit: c4f7071632b671933d29f8b9cdb202a6c1c43dd4 [48/48] xfs: support zoned RT devices
config: s390-randconfig-002-20231101 (https://download.01.org/0day-ci/archive/20231101/202311011903.8P42h2Va-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011903.8P42h2Va-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011903.8P42h2Va-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_emptied':
   fs/xfs/xfs_zone_alloc.c:72:9: error: implicit declaration of function 'trace_xfs_zone_emptied'; did you mean 'xfs_zone_emptied'? [-Werror=implicit-function-declaration]
      72 |         trace_xfs_zone_emptied(rtg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         xfs_zone_emptied
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_mark_full':
   fs/xfs/xfs_zone_alloc.c:90:9: error: implicit declaration of function 'trace_xfs_zone_full'; did you mean 'trace_xfs_trans_roll'? [-Werror=implicit-function-declaration]
      90 |         trace_xfs_zone_full(rtg);
         |         ^~~~~~~~~~~~~~~~~~~
         |         trace_xfs_trans_roll
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_record_blocks':
   fs/xfs/xfs_zone_alloc.c:127:9: error: implicit declaration of function 'trace_xfs_zone_record_blocks'; did you mean 'xfs_zone_record_blocks'? [-Werror=implicit-function-declaration]
     127 |         trace_xfs_zone_record_blocks(rtg, rgbno, len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_zone_record_blocks
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_free_blocks':
   fs/xfs/xfs_zone_alloc.c:174:9: error: implicit declaration of function 'trace_xfs_zone_free_blocks'; did you mean 'trace_xfs_btree_free_block'? [-Werror=implicit-function-declaration]
     174 |         trace_xfs_zone_free_blocks(rtg, rgbno, len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         trace_xfs_btree_free_block
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_activate':
   fs/xfs/xfs_zone_alloc.c:249:9: error: implicit declaration of function 'trace_xfs_zone_activate'; did you mean 'xfs_zone_activate'? [-Werror=implicit-function-declaration]
     249 |         trace_xfs_zone_activate(rtg);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_zone_activate
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_finish':
   fs/xfs/xfs_zone_alloc.c:443:9: error: implicit declaration of function 'trace_xfs_zone_pad'; did you mean 'trace_xfs_dqread'? [-Werror=implicit-function-declaration]
     443 |         trace_xfs_zone_pad(rtg);
         |         ^~~~~~~~~~~~~~~~~~
         |         trace_xfs_dqread
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_alloc_blocks_rtg':
   fs/xfs/xfs_zone_alloc.c:518:9: error: implicit declaration of function 'trace_xfs_zone_alloc_blocks'; did you mean 'trace_xfs_btree_alloc_block'? [-Werror=implicit-function-declaration]
     518 |         trace_xfs_zone_alloc_blocks(rtg, rgbno, count_fsb);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         trace_xfs_btree_alloc_block
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_rewind_blocks':
   fs/xfs/xfs_zone_alloc.c:596:9: error: implicit declaration of function 'trace_xfs_zone_rewind_blocks'; did you mean 'xfs_zone_rewind_blocks'? [-Werror=implicit-function-declaration]
     596 |         trace_xfs_zone_rewind_blocks(rtg, 0, len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_zone_rewind_blocks
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_reset':
   fs/xfs/xfs_zone_alloc.c:650:9: error: implicit declaration of function 'trace_xfs_zone_reset'; did you mean 'trace_xfs_agfl_reset'? [-Werror=implicit-function-declaration]
     650 |         trace_xfs_zone_reset(rtg);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         trace_xfs_agfl_reset
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_reclaim':
   fs/xfs/xfs_zone_alloc.c:845:9: error: implicit declaration of function 'trace_xfs_zone_reclaim'; did you mean 'xfs_zone_reclaim'? [-Werror=implicit-function-declaration]
     845 |         trace_xfs_zone_reclaim(rtg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         xfs_zone_reclaim
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_mount_zones':
>> fs/xfs/xfs_zone_alloc.c:1197:25: error: implicit declaration of function 'blkdev_report_zones'; did you mean 'bdev_nr_zones'? [-Werror=implicit-function-declaration]
    1197 |                 error = blkdev_report_zones(bt->bt_bdev, 0, mp->m_sb.sb_rgcount,
         |                         ^~~~~~~~~~~~~~~~~~~
         |                         bdev_nr_zones
   cc1: some warnings being treated as errors


vim +1197 fs/xfs/xfs_zone_alloc.c

  1152	
  1153	int
  1154	xfs_mount_zones(
  1155		struct xfs_mount	*mp)
  1156	{
  1157		struct xfs_buftarg	*bt = mp->m_rtdev_targp;
  1158		struct xfs_rtgroup	*rtg;
  1159		xfs_rgnumber_t		rgno;
  1160		int			error;
  1161		int64_t			freeblocks = 0;
  1162	
  1163		if (!bt) {
  1164			xfs_notice(mp, "RT device missing.");
  1165			return -EINVAL;
  1166		}
  1167	
  1168		if (!xfs_has_rtgroups(mp) || !xfs_has_rmapbt(mp)) {
  1169			xfs_notice(mp, "invalid flag combination.");
  1170			return -EFSCORRUPTED;
  1171		}
  1172		if (mp->m_sb.sb_rextsize != 1) {
  1173			xfs_notice(mp, "zoned file systems do not support rextsize.");
  1174			return -EFSCORRUPTED;
  1175		}
  1176	
  1177		INIT_LIST_HEAD(&mp->m_free_zones);
  1178		INIT_LIST_HEAD(&mp->m_active_zones);
  1179		INIT_LIST_HEAD(&mp->m_emptied_zones);
  1180		spin_lock_init(&mp->m_zone_list_lock);
  1181		INIT_WORK(&mp->m_zone_reset_work, xfs_zone_reset_work);
  1182		init_waitqueue_head(&mp->m_zone_wait);
  1183		init_waitqueue_head(&mp->m_zone_gc_wait);
  1184	
  1185		xfs_info(mp, "%u zones of %u blocks size (%d active)",
  1186			 mp->m_sb.sb_rgcount, mp->m_sb.sb_rgblocks,
  1187			 xfs_max_active_zones(mp));
  1188	
  1189		mp->m_zone_pad = folio_alloc(GFP_KERNEL | __GFP_ZERO, MAX_PAGECACHE_ORDER);
  1190		if (!mp->m_zone_pad)
  1191			return -ENOMEM;
  1192	
  1193		/*
  1194		 * Sync our own information with the hardware zone state.
  1195		 */
  1196		if (bdev_is_zoned(bt->bt_bdev)) {
> 1197			error = blkdev_report_zones(bt->bt_bdev, 0, mp->m_sb.sb_rgcount,
  1198						    xfs_get_zone_info_cb, mp);
  1199			if (error < 0)
  1200				goto out_free_zone_pad;
  1201		}
  1202	
  1203		spin_lock(&mp->m_zone_list_lock);
  1204		for_each_rtgroup(mp, rgno, rtg) {
  1205			if (!test_bit(RTG_F_SEQUENTIAL, &rtg->rtg_flags))
  1206				rtg->rtg_write_pointer = *xfs_zone_last_written(rtg);
  1207	
  1208			rtg->rtg_written = rtg->rtg_write_pointer;
  1209	
  1210			if (rtg->rtg_write_pointer == 0) {
  1211				xfs_zone_add_to_free_list(rtg);
  1212			} else if (rtg->rtg_write_pointer < rtg->rtg_blockcount) {
  1213				mp->m_nr_active_zones++;
  1214				list_add(&rtg->rtg_entry, &mp->m_active_zones);
  1215			}
  1216			freeblocks +=
  1217				(rtg->rtg_blockcount - *xfs_zone_used_counter(rtg));
  1218		}
  1219		spin_unlock(&mp->m_zone_list_lock);
  1220	
  1221		/*
  1222		 * XXX: this can happen if we were shutdown during GC.  In this case
  1223		 * we should grab the active zone with the smallest write pointer and
  1224		 * expedite GC into it.
  1225		 */
  1226		if (WARN_ON_ONCE(!mp->m_gc_zone)) {
  1227			error = -EINVAL;
  1228			goto out_free_zone_pad;
  1229		}
  1230	
  1231		percpu_counter_set(&mp->m_free[FREE_RTEXTENTS],
  1232				xfs_rtb_to_rtxt(mp, freeblocks));
  1233	
  1234		/*
  1235		 * Reserve the size of two zones for GC.  This is a little conservative.
  1236		 */
  1237		error = xfs_reserve_blocks(mp, FREE_RTEXTENTS,
  1238				xfs_freecounter_unavailable(mp, FREE_RTEXTENTS));
  1239		if (error)
  1240			xfs_warn(mp,
  1241		"Unable to allocate RT reserve blocks. Continuing without GC pool.");
  1242	
  1243		mp->m_zone_gc_thread = kthread_create(xfs_zone_gcd, mp, "xfs-zone-gc/%s",
  1244					mp->m_super->s_id);
  1245		if (IS_ERR(mp->m_zone_gc_thread)) {
  1246			error = PTR_ERR(mp->m_zone_gc_thread);
  1247			goto out_free_zone_pad;
  1248		}
  1249		return 0;
  1250	
  1251	out_free_zone_pad:
  1252		folio_put(mp->m_zone_pad);
  1253		return error;
  1254	}
  1255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
