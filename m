Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883AF538F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcBiid/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698822919; x=1730358919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BlcVHsQfyIZUVIpw7am4ECT4FiMGRLaQl/qBvUXpenw=;
  b=kcBiid/bCAxGrohrAz3IIr2nmTdvfkiAjUi6/CeaYC7H5HDF/lzlC98T
   /lgw1BL5+VuGnxJrA58V5I65oRFClyXTDCJeutleBaukDrXz26Ojn5zFP
   wi645m+hCEbotsTQAC0azTW3l8e4EXFumcYgRmXyYTiZ6RG7lY/SziYHF
   xvZiFqGSega+7AjZZ0KWJTD1OvLFgOFw1jiZLSlSpDDF85lshJKPxsh47
   PrUlSD2kKrazM6nOoqcTe5w8UKX57GFytT0Pm00minCSqy+g0y71/RGxx
   AC7l4MfAzEwR4zgzu7c5WoVUoNvLYG+MKsOHDu8guvxj7Oe87zixHaqIY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="7075742"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="7075742"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 00:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="831280518"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="831280518"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2023 00:15:16 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy5Ra-0000f5-0s;
	Wed, 01 Nov 2023 07:15:14 +0000
Date: Wed, 1 Nov 2023 15:15:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 48/48] fs/xfs/xfs_zone_alloc.c:72:9: error:
 implicit declaration of function 'trace_xfs_zone_emptied'; did you mean
 'xfs_zone_emptied'?
Message-ID: <202311011559.LSzcmnjK-lkp@intel.com>
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
config: csky-randconfig-002-20231101 (https://download.01.org/0day-ci/archive/20231101/202311011559.LSzcmnjK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011559.LSzcmnjK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011559.LSzcmnjK-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_emptied':
>> fs/xfs/xfs_zone_alloc.c:72:9: error: implicit declaration of function 'trace_xfs_zone_emptied'; did you mean 'xfs_zone_emptied'? [-Werror=implicit-function-declaration]
      72 |         trace_xfs_zone_emptied(rtg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         xfs_zone_emptied
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_mark_full':
>> fs/xfs/xfs_zone_alloc.c:90:9: error: implicit declaration of function 'trace_xfs_zone_full'; did you mean 'trace_xfs_trans_roll'? [-Werror=implicit-function-declaration]
      90 |         trace_xfs_zone_full(rtg);
         |         ^~~~~~~~~~~~~~~~~~~
         |         trace_xfs_trans_roll
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_record_blocks':
>> fs/xfs/xfs_zone_alloc.c:127:9: error: implicit declaration of function 'trace_xfs_zone_record_blocks'; did you mean 'xfs_zone_record_blocks'? [-Werror=implicit-function-declaration]
     127 |         trace_xfs_zone_record_blocks(rtg, rgbno, len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_zone_record_blocks
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_free_blocks':
>> fs/xfs/xfs_zone_alloc.c:174:9: error: implicit declaration of function 'trace_xfs_zone_free_blocks'; did you mean 'trace_xfs_btree_free_block'? [-Werror=implicit-function-declaration]
     174 |         trace_xfs_zone_free_blocks(rtg, rgbno, len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         trace_xfs_btree_free_block
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_activate':
>> fs/xfs/xfs_zone_alloc.c:249:9: error: implicit declaration of function 'trace_xfs_zone_activate'; did you mean 'xfs_zone_activate'? [-Werror=implicit-function-declaration]
     249 |         trace_xfs_zone_activate(rtg);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_zone_activate
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_finish':
>> fs/xfs/xfs_zone_alloc.c:443:9: error: implicit declaration of function 'trace_xfs_zone_pad'; did you mean 'trace_xfs_dqread'? [-Werror=implicit-function-declaration]
     443 |         trace_xfs_zone_pad(rtg);
         |         ^~~~~~~~~~~~~~~~~~
         |         trace_xfs_dqread
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_alloc_blocks_rtg':
>> fs/xfs/xfs_zone_alloc.c:518:9: error: implicit declaration of function 'trace_xfs_zone_alloc_blocks'; did you mean 'trace_xfs_btree_alloc_block'? [-Werror=implicit-function-declaration]
     518 |         trace_xfs_zone_alloc_blocks(rtg, rgbno, count_fsb);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         trace_xfs_btree_alloc_block
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_rewind_blocks':
>> fs/xfs/xfs_zone_alloc.c:596:9: error: implicit declaration of function 'trace_xfs_zone_rewind_blocks'; did you mean 'xfs_zone_rewind_blocks'? [-Werror=implicit-function-declaration]
     596 |         trace_xfs_zone_rewind_blocks(rtg, 0, len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         xfs_zone_rewind_blocks
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_reset':
>> fs/xfs/xfs_zone_alloc.c:650:9: error: implicit declaration of function 'trace_xfs_zone_reset'; did you mean 'trace_xfs_agfl_reset'? [-Werror=implicit-function-declaration]
     650 |         trace_xfs_zone_reset(rtg);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         trace_xfs_agfl_reset
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_reclaim':
>> fs/xfs/xfs_zone_alloc.c:845:9: error: implicit declaration of function 'trace_xfs_zone_reclaim'; did you mean 'xfs_zone_reclaim'? [-Werror=implicit-function-declaration]
     845 |         trace_xfs_zone_reclaim(rtg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         xfs_zone_reclaim
   cc1: some warnings being treated as errors


vim +72 fs/xfs/xfs_zone_alloc.c

    65	
    66	static void
    67	xfs_zone_emptied(
    68		struct xfs_rtgroup	*rtg)
    69	{
    70		struct xfs_mount	*mp = rtg->rtg_mount;
    71	
  > 72		trace_xfs_zone_emptied(rtg);
    73	
    74		xa_clear_mark(&mp->m_rtgroups, rtg->rtg_rgno, XFS_RTG_RECLAIMABLE);
    75	
    76		spin_lock(&mp->m_zone_list_lock);
    77		ASSERT(list_empty(&rtg->rtg_entry));
    78		list_add_tail(&rtg->rtg_entry, &mp->m_emptied_zones);
    79		spin_unlock(&mp->m_zone_list_lock);
    80	
    81		queue_work(xfs_discard_wq, &mp->m_zone_reset_work);
    82	}
    83	
    84	static void
    85	xfs_zone_mark_full(
    86		struct xfs_rtgroup	*rtg)
    87	{
    88		struct xfs_mount	*mp = rtg->rtg_mount;
    89	
  > 90		trace_xfs_zone_full(rtg);
    91	
    92		spin_lock(&mp->m_zone_list_lock);
    93		if (rtg == mp->m_gc_zone) {
    94			mp->m_gc_zone = NULL;
    95		} else {
    96			mp->m_nr_active_zones--;
    97			list_del_init(&rtg->rtg_entry);
    98		}
    99		spin_unlock(&mp->m_zone_list_lock);
   100	
   101		wake_up(&mp->m_zone_wait);
   102		if (*xfs_zone_used_counter(rtg) < rtg->rtg_blockcount)
   103			xa_set_mark(&mp->m_rtgroups, rtg->rtg_rgno,
   104				    XFS_RTG_RECLAIMABLE);
   105	}
   106	
   107	/*
   108	 * Record data blocks as having been written to.
   109	 *
   110	 * This is called from the write completion handler and records blocks as
   111	 * actually used.  For zoned devices all this is purely an in-memory
   112	 * exercise to manage the active zones, but if we run on a conventional
   113	 * device we also have to record the last written block as the write pointer
   114	 * approximation.
   115	 */
   116	int
   117	xfs_zone_record_blocks(
   118		struct xfs_trans	*tp,
   119		xfs_fsblock_t		fsbno,
   120		xfs_filblks_t		len)
   121	{
   122		struct xfs_mount	*mp = tp->t_mountp;
   123		xfs_rgnumber_t		rgno;
   124		xfs_rgblock_t		rgbno = xfs_rtb_to_rgbno(mp, fsbno, &rgno);
   125		struct xfs_rtgroup	*rtg = xfs_rtgroup_get(mp, rgno);
   126	
 > 127		trace_xfs_zone_record_blocks(rtg, rgbno, len);
   128	
   129		if (!rtg)
   130			return -EIO;
   131	
   132		xfs_ilock(rtg->rtg_rmapip, XFS_ILOCK_EXCL);
   133		xfs_trans_ijoin(tp, rtg->rtg_rmapip, XFS_ILOCK_EXCL);
   134	
   135		*xfs_zone_used_counter(rtg) += len;
   136		ASSERT(*xfs_zone_used_counter(rtg) <= rtg->rtg_blockcount);
   137	
   138		if (rgbno + len > *xfs_zone_last_written(rtg))
   139			*xfs_zone_last_written(rtg) = rgbno + len;
   140	
   141		rtg->rtg_written += len;
   142		if (rtg->rtg_written == rtg->rtg_blockcount)
   143			xfs_zone_mark_full(rtg);
   144	
   145		xfs_trans_log_inode(tp, rtg->rtg_rmapip, XFS_ILOG_CORE);
   146	
   147		xfs_rtgroup_put(rtg);
   148		return 0;
   149	}
   150	
   151	/*
   152	 * "Free" blocks alloated in a zone.
   153	 *
   154	 * This normally doesn't actually free anything, but instead just decrements the
   155	 * used blocks counter.  As an optimization we kick of a zone reset if the usage
   156	 * counter hits zero.
   157	 */
   158	int
   159	xfs_zone_free_blocks(
   160		struct xfs_trans	*tp,
   161		struct xfs_rtgroup	*rtg,
   162		xfs_fsblock_t		fsbno,
   163		xfs_filblks_t		len)
   164	{
   165		struct xfs_mount	*mp = tp->t_mountp;
   166		xfs_rgnumber_t		rgno;
   167		xfs_rgblock_t		rgbno = xfs_rtb_to_rgbno(mp, fsbno, &rgno);
   168		uint64_t		*used = xfs_zone_used_counter(rtg);
   169	
   170		ASSERT(xfs_isilocked(rtg->rtg_rmapip, XFS_ILOCK_EXCL));
   171		ASSERT(len <= *used);
   172	
   173		/* XXX: we only need the rgbno for tracing :( */
 > 174		trace_xfs_zone_free_blocks(rtg, rgbno, len);
   175	
   176		*used -= len;
   177		xfs_mod_frextents(mp, xfs_rtb_to_rtxt(mp, len));
   178	
   179		if (rtg->rtg_written == rtg->rtg_blockcount) {
   180			if (*used == 0)
   181				xfs_zone_emptied(rtg);
   182			else
   183				xa_set_mark(&mp->m_rtgroups, rtg->rtg_rgno,
   184					    XFS_RTG_RECLAIMABLE);
   185		}
   186		xfs_trans_log_inode(tp, rtg->rtg_rmapip, XFS_ILOG_CORE);
   187	
   188		return 0;
   189	}
   190	
   191	/*
   192	 * Check if the zone containing the data just before the offset we are
   193	 * writing to is still active and has space.
   194	 */
   195	static struct xfs_rtgroup *
   196	xfs_last_used_zone(
   197		struct xfs_inode	*ip,
   198		xfs_fileoff_t		offset_fsb)
   199	{
   200		struct xfs_mount	*mp = ip->i_mount;
   201		struct xfs_rtgroup	*rtg = NULL;
   202		struct xfs_iext_cursor	icur;
   203		struct xfs_bmbt_irec	got;
   204	
   205		xfs_ilock(ip, XFS_ILOCK_SHARED);
   206		if (!xfs_iext_lookup_extent_before(ip, &ip->i_df, &offset_fsb,
   207					&icur, &got))
   208			goto out_unlock;
   209		ASSERT(!isnullstartblock(got.br_startblock));
   210		rtg = xfs_rtgroup_grab(mp, xfs_rtb_to_rgno(mp, got.br_startblock));
   211		if (rtg && rtg->rtg_write_pointer == rtg->rtg_blockcount) {
   212			xfs_rtgroup_rele(rtg);
   213			rtg = NULL;
   214		}
   215		if (rtg)
   216			atomic_inc(&rtg->rtg_writers);
   217	out_unlock:
   218		xfs_iunlock(ip, XFS_ILOCK_SHARED);
   219		return rtg;
   220	}
   221	
   222	static unsigned int
   223	xfs_max_active_zones(
   224		struct xfs_mount	*mp)
   225	{
   226		unsigned int		max_active;
   227	
   228		max_active = bdev_max_active_zones(mp->m_rtdev_targp->bt_bdev);
   229		if (!max_active)
   230			max_active = 8; /* XXX: random number */
   231	//		max_active = 2; /* stress test */
   232	
   233		/* account for the GC zone */
   234		return max_active - 1;
   235	}
   236	
   237	/*
   238	 * Activate a free zone.
   239	 *
   240	 * This just does the accounting and allows to find the zone on the active
   241	 * zones list.  Don't bother with an explicit open command, we'll just open it
   242	 * implicitly with the first write to it.
   243	 */
   244	static struct xfs_rtgroup *
   245	xfs_zone_activate(
   246		struct xfs_mount	*mp,
   247		struct xfs_rtgroup	*rtg)
   248	{
 > 249		trace_xfs_zone_activate(rtg);
   250	
   251		list_move_tail(&rtg->rtg_entry, &mp->m_active_zones);
   252		mp->m_nr_free_zones--;
   253		mp->m_nr_active_zones++;
   254	
   255		/* XXX: this is a little verbose, but let's keep it during development */
   256		xfs_info(mp, "using zone %u (%d/%d)",
   257			 rtg->rtg_rgno,
   258			 mp->m_nr_active_zones, xfs_max_active_zones(mp));
   259		return rtg;
   260	}
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
