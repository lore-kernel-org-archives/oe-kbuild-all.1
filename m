Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF4C158DD4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 16:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748105420; cv=none; b=IGTXwZ4n5/iToWb5S0Smv8bce4eWjXRrPdhU9jsdbPBC/AFCpJjj+1qcDffcS6uQ//3kyzlTtP61xfWyzJPiVJnEURFmRd70H5rrZC9wq+FfrHyp2QkJHbFNtdhDZqmepOxJcOvgQZ8ins2djEq7w5NLz2qLULuROa/onrdrNT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748105420; c=relaxed/simple;
	bh=ZYn8VHgFj/+RL6vwUfzRAhVaKmxWi6ouZeZo13u9zC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qHFgLEH8ACmoNyx6mIGVNt29R962CBNTwciTGPTRsg6eXv0EV6YVBVQIblvtGam+gINieDV0/Q122Ru90plnzR1ARaYH0whX+tj7gJTmD58g9Ln+wzmcyMZHkCmztLJJjrpvXVPfieuFf+BUiCYfxI618eclSLMLjpPw4LafBDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bY/ZTw1N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bY/ZTw1N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748105418; x=1779641418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZYn8VHgFj/+RL6vwUfzRAhVaKmxWi6ouZeZo13u9zC4=;
  b=bY/ZTw1NGMk7eaZ/1S0Y+ho5NKGgQbiaVeyQkd3MQ9MwNgA9SdSu9Yjp
   NVqK5iidwy1zDyfSIF3mNzeW16WxQYPB36xQ3Pv3Lhtra283cD9CizVM7
   PzmmxEsGxGBJNFIH0Wjz7NOBIYgRH1y0F7U4gSZPSJf1EesUq01UdFsDk
   hmEfmW/0fShUNkvK72eW2PWxivzmksPa0ZamoObrq/35M3Oj1R4uAK2iP
   HJT9Ahy2NIo2l6EzkdW+4L4QWI/UTnn6sYIOeH6NVu/IDmI/CVgfuysMG
   ndnwh1iNp/Te2c8le090lUKKswNFZz9RlZc7pQ9ieUV445CCjrUEXpEf+
   w==;
X-CSE-ConnectionGUID: s7YOihnlSPW37H6esUKgMA==
X-CSE-MsgGUID: x8GRbAnVTYGyLEl58tMzmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="61542144"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="61542144"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 09:50:16 -0700
X-CSE-ConnectionGUID: kM1GbSL8RzCKs48IAOmiaA==
X-CSE-MsgGUID: GDhSGSLsR5GQkCwYJXzoKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146337251"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 May 2025 09:50:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIs4a-000RKc-2o;
	Sat, 24 May 2025 16:50:12 +0000
Date: Sun, 25 May 2025 00:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: William Kucharski <william.kucharski@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	=?iso-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>,
	Sharath Srinivasan <sharah.srinivasan@oracle.com>
Subject: [jlayton:uek-localio 1918/2262] net/rds/ib_rdma.c:845:22: warning:
 variable 'unmap_mr_cpu' set but not used
Message-ID: <202505250026.QHnoN2aO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: a668e620900fdd054bcf52ef66a0725c5c59fe83 [1918/2262] rds: Remove RDS FMR Code
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250525/202505250026.QHnoN2aO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250026.QHnoN2aO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505250026.QHnoN2aO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/rds/ib_rdma.c: In function 'rds_ib_alloc_ibmr':
>> net/rds/ib_rdma.c:845:22: warning: variable 'unmap_mr_cpu' set but not used [-Wunused-but-set-variable]
     845 |         unsigned int unmap_mr_cpu = 0;
         |                      ^~~~~~~~~~~~
   net/rds/ib_rdma.c: In function 'rds_frwr_clean':
   net/rds/ib_rdma.c:1038:22: warning: variable 'drop_cnt' set but not used [-Wunused-but-set-variable]
    1038 |         u32 cnt = 0, drop_cnt = 0;
         |                      ^~~~~~~~


vim +/unmap_mr_cpu +845 net/rds/ib_rdma.c

   839	
   840	static struct rds_ib_mr *rds_ib_alloc_ibmr(struct rds_ib_device *rds_ibdev,
   841						   int npages)
   842	{
   843		struct rds_ib_mr_pool *pool;
   844		struct rds_ib_mr *ibmr = NULL;
 > 845		unsigned int unmap_mr_cpu = 0;
   846		int err = 0;
   847	
   848		if (npages <= RDS_MR_8K_MSG_SIZE)
   849			pool = rds_ibdev->mr_8k_pool;
   850		else
   851			pool = rds_ibdev->mr_1m_pool;
   852	
   853		unmap_mr_cpu = rds_ib_sysctl_disable_unmap_mr_cpu ?
   854			WORK_CPU_UNBOUND : pool->unmap_mr_cpu;
   855	
   856		ibmr = rds_ib_reuse_mr(pool);
   857		if (ibmr)
   858			return ibmr;
   859	
   860		/* No clean MRs - now we have the choice of either
   861		 * allocating a fresh MR up to the limit imposed by the
   862		 * driver, or flush any dirty unused MRs.
   863		 * We try to avoid stalling in the send path if possible,
   864		 * so we allocate as long as we're allowed to.
   865		 *
   866		 * We're fussy with enforcing the MR pool limit, though. If the driver
   867		 * tells us we can't use more than N MRs, we shouldn't start
   868		 * arguing with it
   869		 */
   870		if (atomic_inc_return(&pool->item_count) > pool->max_items) {
   871			atomic_dec(&pool->item_count);
   872	
   873			/* FRWR MR goes directly to the clean list.  If the limit is
   874			 * already reached, return an error.
   875			 */
   876			if (pool->pool_type == RDS_IB_MR_8K_POOL)
   877				rds_ib_stats_inc(s_ib_rdma_mr_8k_pool_depleted);
   878			else
   879				rds_ib_stats_inc(s_ib_rdma_mr_1m_pool_depleted);
   880			return ERR_PTR(-EAGAIN);
   881		}
   882	
   883		ibmr = kzalloc(sizeof(*ibmr), GFP_KERNEL);
   884		if (!ibmr) {
   885			err = -ENOMEM;
   886			goto out_no_cigar;
   887		}
   888	
   889		err = rds_ib_init_fastreg_mr(rds_ibdev, pool, ibmr);
   890	
   891		if (err) {
   892			/* encourage caller to retry if out of memory */
   893			if (err == -ENOMEM)
   894				err = -EAGAIN;
   895	
   896			goto out_no_cigar;
   897		}
   898	
   899		INIT_LIST_HEAD(&ibmr->pool_list);
   900		spin_lock_bh(&pool->busy_lock);
   901		list_add(&ibmr->pool_list, &pool->busy_list);
   902		spin_unlock_bh(&pool->busy_lock);
   903	
   904		init_completion(&ibmr->wr_comp);
   905	
   906		/* ibmr->fr_state is already MR_IS_INVALID due to kzalloc */
   907	
   908		ibmr->pool = pool;
   909		if (pool->pool_type == RDS_IB_MR_8K_POOL)
   910			rds_ib_stats_inc(s_ib_rdma_mr_8k_alloc);
   911		else
   912			rds_ib_stats_inc(s_ib_rdma_mr_1m_alloc);
   913	
   914		return ibmr;
   915	
   916	out_no_cigar:
   917		if (ibmr)
   918			kfree(ibmr);
   919		atomic_dec(&pool->item_count);
   920		return ERR_PTR(err);
   921	}
   922	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
