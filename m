Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E8A208BE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 18:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706295077; cv=none; b=e1VazjLZRyZklmzCrW1AE9quqHsZqCVklRKK2NFx1DctpuibOG2lmFRhn3lncMjGFNQMweAa22pFa/fco1LF/IclT+1hLoYcMI5EdzOg5KCUK7HvKNhBR5AOX5V+EFpoyiOEfO3sF9erkOTIAvstJvA3724GCMa4gA0bYHdi3ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706295077; c=relaxed/simple;
	bh=jCzGa1UYZBugtHn/37mxH6G8bS1RA1tRmAH6ecUQPfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JAdD5BXKfxX0VX0BeMeJKd8gc5rasEDlff8MjfL6bYzseShHNNWJ7WOSUgUlsaGzaairqqObsGmdfqbFgleOXWHdrhUoPCw3nqQY/lf6ekHYpKj5P7/2Z/IhCl+ytcUsP/Mop193R0lkSyRgnnayblNELDjL+YNRFUjJE1MQaXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHFyoHRY; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHFyoHRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706295075; x=1737831075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jCzGa1UYZBugtHn/37mxH6G8bS1RA1tRmAH6ecUQPfg=;
  b=aHFyoHRYVDQ0LgypYuxDoBXAFQQJdGS0lq2c7JHDNwrPycV6XldvUaK7
   dX2t+KjwaujgMuSmZPXiR8eSeKIREiFUSteTA14xP7t8Du6chsld0Dc8R
   AvblgZFsreyT9CRRrqNSZ5QNpAreRzSQ0ofKaT+RmqWwiO4IC0Pbk6jZN
   1WorV17xACxsVhffoonsPM3Rp1KQSF3aJ1ThglyowlG7D2ASqyWw6pEYX
   ta0MMwa9n6lM/5aFAO+Y5PlAuPTLmFUOULlj/JcYULa3wrtGX+xhJ+rZa
   8s3//n4JxNdp2xqrSgpsaBTZiiDHznF7PFQv5tXQpVE/BiN99LhcvrXU5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="392979889"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="392979889"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 10:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="960282690"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="960282690"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jan 2024 10:51:13 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTRIE-0001HC-1u;
	Fri, 26 Jan 2024 18:51:10 +0000
Date: Sat, 27 Jan 2024 02:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 80/80] fs/xfs/xfs_zone_alloc.c:920:34: warning:
 unused variable 'mp'
Message-ID: <202401270217.Y1tjo75q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   9fc0addd2e44d48f96a00113084dfcab9b9df8f8
commit: 9fc0addd2e44d48f96a00113084dfcab9b9df8f8 [80/80] xfs: implement a new low-level GC mechanism
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240127/202401270217.Y1tjo75q-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270217.Y1tjo75q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270217.Y1tjo75q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_gc_query_cb':
>> fs/xfs/xfs_zone_alloc.c:920:34: warning: unused variable 'mp' [-Wunused-variable]
     920 |         struct xfs_mount        *mp = cur->bc_mp;
         |                                  ^~
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_gc_allocate':
>> fs/xfs/xfs_zone_alloc.c:1044:33: warning: variable 'error' set but not used [-Wunused-but-set-variable]
    1044 |         int                     error;
         |                                 ^~~~~
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_gc_write_chunk':
>> fs/xfs/xfs_zone_alloc.c:1192:33: warning: variable 'added' set but not used [-Wunused-but-set-variable]
    1192 |         unsigned int            added;
         |                                 ^~~~~


vim +/mp +920 fs/xfs/xfs_zone_alloc.c

9fc0addd2e44d48 Christoph Hellwig 2024-01-21   913  
171a28db673ea7b Christoph Hellwig 2023-12-07   914  static int
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   915  xfs_zone_gc_query_cb(
171a28db673ea7b Christoph Hellwig 2023-12-07   916  	struct xfs_btree_cur	*cur,
171a28db673ea7b Christoph Hellwig 2023-12-07   917  	const struct xfs_rmap_irec *irec,
171a28db673ea7b Christoph Hellwig 2023-12-07   918  	void			*private)
171a28db673ea7b Christoph Hellwig 2023-12-07   919  {
6bffaa3a8300cad Hans Holmberg     2023-12-20  @920  	struct xfs_mount	*mp = cur->bc_mp;
171a28db673ea7b Christoph Hellwig 2023-12-07   921  	struct xfs_zone_gc_data	*data = private;
171a28db673ea7b Christoph Hellwig 2023-12-07   922  
171a28db673ea7b Christoph Hellwig 2023-12-07   923  	ASSERT(!XFS_RMAP_NON_INODE_OWNER(irec->rm_owner));
6bffaa3a8300cad Hans Holmberg     2023-12-20   924  	ASSERT(!xfs_internal_inum(mp, irec->rm_owner));
171a28db673ea7b Christoph Hellwig 2023-12-07   925  	ASSERT(!(irec->rm_flags & (XFS_RMAP_ATTR_FORK | XFS_RMAP_BMBT_BLOCK)));
171a28db673ea7b Christoph Hellwig 2023-12-07   926  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   927  	data->recs[data->rec_count] = *irec;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   928  	if (++data->rec_count == XFS_ZONE_GC_RECS) {
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   929  		data->next_startblock =
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   930  			irec->rm_startblock + irec->rm_blockcount;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   931  		return 1;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   932  	}
171a28db673ea7b Christoph Hellwig 2023-12-07   933  	return 0;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   934  }
171a28db673ea7b Christoph Hellwig 2023-12-07   935  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   936  static int
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   937  xfs_zone_gc_query(
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   938  	struct xfs_rtgroup	*rtg,
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   939  	struct xfs_zone_gc_data	*data)
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   940  {
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   941  	struct xfs_mount	*mp = rtg->rtg_mount;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   942  	struct xfs_rmap_irec	ri_low = { };
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   943  	struct xfs_rmap_irec	ri_high;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   944  	struct xfs_btree_cur	*cur;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   945  	struct xfs_trans	*tp;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   946  	int			error;
ea09e168e2d08d2 Christoph Hellwig 2024-01-16   947  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   948  	ASSERT(data->next_startblock <= rtg->rtg_blockcount);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   949  	if (data->next_startblock == rtg->rtg_blockcount) {
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   950  		data->done = true;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   951  		return 0;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   952  	}
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   953  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   954  	ASSERT(data->next_startblock < rtg->rtg_blockcount);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   955  	ri_low.rm_startblock = data->next_startblock;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   956  	memset(&ri_high, 0xFF, sizeof(ri_high));
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   957  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   958  	data->rec_idx = 0;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   959  	data->rec_count = 0;
6bffaa3a8300cad Hans Holmberg     2023-12-20   960  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   961  	error = xfs_trans_alloc_empty(mp, &tp);
171a28db673ea7b Christoph Hellwig 2023-12-07   962  	if (error)
171a28db673ea7b Christoph Hellwig 2023-12-07   963  		return error;
171a28db673ea7b Christoph Hellwig 2023-12-07   964  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   965  	xfs_rtgroup_lock(tp, rtg, XFS_RTGLOCK_RMAP);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   966  	cur = xfs_rtrmapbt_init_cursor(mp, tp, rtg, rtg->rtg_rmapip);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   967  	cur->bc_ino.flags = 0;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   968  	error = xfs_rmap_query_range(cur, &ri_low, &ri_high,
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   969  			xfs_zone_gc_query_cb, data);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   970  	xfs_btree_del_cursor(cur, error < 0 ? error : 0);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   971  	xfs_trans_cancel(tp);
171a28db673ea7b Christoph Hellwig 2023-12-07   972  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   973  	if (error < 0)
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   974  		return error;
6bffaa3a8300cad Hans Holmberg     2023-12-20   975  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   976  	if (error == 0) {
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   977  		/*
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   978  		 * We finished iterating through the zone.
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   979  		 */
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   980  		data->next_startblock = rtg->rtg_blockcount;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   981  		if (data->rec_count == 0)
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   982  			data->done = true;
6bffaa3a8300cad Hans Holmberg     2023-12-20   983  	}
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   984  
171a28db673ea7b Christoph Hellwig 2023-12-07   985  	return 0;
171a28db673ea7b Christoph Hellwig 2023-12-07   986  }
171a28db673ea7b Christoph Hellwig 2023-12-07   987  
171a28db673ea7b Christoph Hellwig 2023-12-07   988  static int
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   989  xfs_zone_gc_iter(
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   990  	struct xfs_rtgroup	*rtg,
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   991  	struct xfs_zone_gc_data	*data,
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   992  	struct xfs_rmap_irec	*chunk_rec,
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   993  	struct xfs_inode	**ipp,
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   994  	xfs_extlen_t		maxlen_fsb)
171a28db673ea7b Christoph Hellwig 2023-12-07   995  {
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   996  	struct xfs_mount	*mp = rtg->rtg_mount;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   997  	struct xfs_rmap_irec	*irec;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21   998  	int			error;
171a28db673ea7b Christoph Hellwig 2023-12-07   999  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1000  	if (data->rec_idx == data->rec_count) {
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1001  retry:
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1002  		error = xfs_zone_gc_query(rtg, data);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1003  		if (error || data->done)
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1004  			return error;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1005  	}
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1006  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1007  	irec = &data->recs[data->rec_idx];
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1008  	error = xfs_iget(mp, NULL, irec->rm_owner, XFS_IGET_NORETRY |
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1009  			XFS_IGET_UNTRUSTED | XFS_IGET_DONTCACHE, 0, ipp);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1010  	if (error == -EAGAIN || error == -ENOENT) {
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1011  		data->next_startblock = irec->rm_startblock;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1012  		goto retry;
171a28db673ea7b Christoph Hellwig 2023-12-07  1013  	}
171a28db673ea7b Christoph Hellwig 2023-12-07  1014  
171a28db673ea7b Christoph Hellwig 2023-12-07  1015  	if (error)
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1016  		return error;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1017  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1018  	if (!S_ISREG(VFS_I(*ipp)->i_mode)) {
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1019  		data->next_startblock = irec->rm_startblock;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1020  		xfs_irele(*ipp);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1021  		goto retry;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1022  	}
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1023  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1024  	*chunk_rec = *irec;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1025  	chunk_rec->rm_blockcount = min(irec->rm_blockcount, maxlen_fsb);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1026  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1027  	irec->rm_offset += chunk_rec->rm_blockcount;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1028  	irec->rm_startblock += chunk_rec->rm_blockcount;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1029  	irec->rm_blockcount -= chunk_rec->rm_blockcount;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1030  	if (!irec->rm_blockcount)
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1031  		data->rec_idx++;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1032  	return 0;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1033  }
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1034  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1035  static xfs_fsblock_t
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1036  xfs_zone_gc_allocate(
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1037  	struct xfs_zone_gc_data	*data,
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1038  	xfs_extlen_t		count_fsb,
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1039  	bool			*is_seq)
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1040  {
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1041  	struct xfs_rtgroup	*rtg = data->target_rtg;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1042  	struct xfs_mount	*mp = rtg->rtg_mount;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1043  	xfs_rgblock_t		rgbno = 0;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21 @1044  	int			error;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1045  	xfs_fsblock_t		bno;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1046  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1047  	/* the caller must have ensured there is enough space */
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1048  	ASSERT(rtg->rtg_blockcount - rtg->rtg_write_pointer >= count_fsb);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1049  	error = xfs_mod_freecounter(mp, FREE_RTEXTENTS,
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1050  			-((long)xfs_rtb_to_rtx(mp, count_fsb)), true);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1051  	ASSERT(!error);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1052  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1053  	*is_seq = test_bit(RTG_F_SEQUENTIAL, &rtg->rtg_flags);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1054  	if (!*is_seq)
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1055  		rgbno = rtg->rtg_write_pointer;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1056  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1057  	bno = xfs_rgbno_to_rtb(mp, rtg->rtg_rgno, rgbno);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1058  	rtg->rtg_write_pointer += count_fsb;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1059  	if (rtg->rtg_write_pointer == rtg->rtg_blockcount) {
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1060  		xfs_rtgroup_rele(rtg);
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1061  		data->target_rtg = NULL;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1062  	}
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1063  
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1064  	return bno;
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1065  }
9fc0addd2e44d48 Christoph Hellwig 2024-01-21  1066  

:::::: The code at line 920 was first introduced by commit
:::::: 6bffaa3a8300cada23fe468a6436bd7743faa37d xfs: chunk up gc rewrites in smaller bits

:::::: TO: Hans Holmberg <Hans.Holmberg@wdc.com>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
