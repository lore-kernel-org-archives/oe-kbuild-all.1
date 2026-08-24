Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED8412276
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572525; cv=none; b=kdrO4tMW+GHg8kI6dTJDshS/vCexAcXmcaygqgvxO+kB9tfPqPWdvPqY8tyCXWUP6Sukk4UjTs2gYwqiz7+UbWDax4bXOIRX+oWAaD7XS31+RD2c3tLmdPmnHDqrdwdDZK73OS2CbHjJWVeGd3lHDpduqtAHaxfaL2XO/sx/PfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572525; c=relaxed/simple;
	bh=iqQvrgkrSHwiBntZdIjryxbyQ/mRkY0r5eKVr2MgM3w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lqxg/m7fPtqYKOM3bzBQSDQpiWjqh/HXSNa6ebptIlo78a9LSXict6Lvh63xqTZnZHOcEIloQc9f38McH2NI+itP13aFJX70i+uoNwxOgBv3mQMdDNt1MPdwOuINUTqDcsGl7ElGoanUL+xLWvbhiKXXRJBxy2eEYR454DuwmDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxUW5uC2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxUW5uC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787572523; x=1819108523;
  h=date:from:to:cc:subject:message-id;
  bh=iqQvrgkrSHwiBntZdIjryxbyQ/mRkY0r5eKVr2MgM3w=;
  b=UxUW5uC2oAwoR4uP/xEw0NYNtCQUc+Cq3S7e7KWuWq6eLxE9v77yA1J3
   Elm+TRs8iGiyB++SOgTJzfdaf0MlF2+9OaH59fVOw0Yl0GdVVlAeckSQS
   yigVxJykaEp1gqOtmzupo0xNC54hmpv/6lsw7DWp/15Z9PTnVDaUzr1oj
   iaWgSP1zhUg6OQUOeJOfNnAxZ0rypZgN76qfLxT2xJLHrH9Dv7I4i4CZC
   Kkq9Q2xkeCHkkw1svXHU9Fr3b+M/iA58kx/wtyS6jfevoUJPsccXp7ZdG
   e11U6rKhUNAODcZgNvkXjIlH2u2do/5ikpzMWlfp9VUYezwzkVjEI/daB
   Q==;
X-CSE-ConnectionGUID: REUK2iK2T7CSEkycGxznCw==
X-CSE-MsgGUID: P/RVv+2MSEC/glt7/3qZkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="99181048"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="99181048"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 04:55:22 -0700
X-CSE-ConnectionGUID: Wn0LRgwYSe20La+OS5tGxw==
X-CSE-MsgGUID: KXPdgAiURv6MxgY0vC93uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="263258008"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Aug 2026 04:55:20 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyTGi-000000002vT-0PQU;
	Mon, 24 Aug 2026 11:55:13 +0000
Date: Mon, 24 Aug 2026 19:54:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 11/28] fs/netfs/bvecq.c:77:20:
 error: assignment to 'struct bvecq *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202608241902.wjOA7zyh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   3ae015ad2054541c8e406c9dc3e838849bacbabc
commit: 46ffbdd7331ff70da4b75f9275ce7115db637cf0 [11/28] netfs: Make mempool available for bvecq
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260824/202608241902.wjOA7zyh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608241902.wjOA7zyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608241902.wjOA7zyh-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/netfs/bvecq.c: In function 'bvecq_alloc_one':
   fs/netfs/bvecq.c:77:22: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Wimplicit-function-declaration]
      77 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                      ^~~~~~~~~~~~~
         |                      mm_alloc
>> fs/netfs/bvecq.c:77:20: error: assignment to 'struct bvecq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      77 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                    ^
   fs/netfs/bvecq.c: In function 'bvecq_put':
   fs/netfs/bvecq.c:275:25: error: implicit declaration of function 'mempool_free' [-Wimplicit-function-declaration]
     275 |                         mempool_free(bq, &netfs_bvecq_pool);
         |                         ^~~~~~~~~~~~


vim +77 fs/netfs/bvecq.c

    40	
    41	/**
    42	 * bvecq_alloc_one - Allocate a single bvecq node with unpopulated slots
    43	 * @nr_slots: Number of slots to allocate
    44	 * @gfp: The allocation constraints.
    45	 * @for_writeback: True if allocating for writeback
    46	 *
    47	 * Allocate a single bvecq node and initialise the header.  A number of inline
    48	 * slots are also allocated, rounded up to fit after the header in a power-of-2
    49	 * slab object of up to 512 bytes (up to 29 slots on a 64-bit cpu).  The caller
    50	 * should be aware that the number of slots allocated may be more or less than
    51	 * the number requested.  The slot array is not initialised.
    52	 *
    53	 * Return: The node pointer or NULL on allocation failure.
    54	 */
    55	struct bvecq *bvecq_alloc_one(size_t nr_slots, gfp_t gfp, bool for_writeback)
    56	{
    57		struct bvecq *bq;
    58		const size_t max_size = 512;
    59		const size_t max_slots = (max_size - sizeof(*bq)) / sizeof(bq->__bv[0]);
    60		size_t part = min(nr_slots, max_slots);
    61		size_t size = roundup_pow_of_two(struct_size(bq, __bv, part));
    62		bool from_pool = false;
    63	
    64		gfp &= ~(GFP_ZONEMASK | __GFP_THISNODE);
    65	
    66		if (for_writeback) {
    67			if (size != BVECQ_STD_SIZE) {
    68				gfp_t gfp_temp = gfp;
    69	
    70				gfp_temp |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN;
    71				gfp_temp &= ~(__GFP_DIRECT_RECLAIM | __GFP_IO);
    72				bq = kmalloc(size, gfp_temp);
    73				if (bq)
    74					goto success;
    75			}
    76	
  > 77			bq = mempool_alloc(&netfs_bvecq_pool, gfp);
    78			if (!bq)
    79				return bq;
    80			from_pool = true;
    81			size = BVECQ_STD_SIZE;
    82		} else {
    83			bq = kmalloc(size, gfp);
    84			if (!bq)
    85				return bq;
    86		}
    87	
    88	success:
    89		*bq = (struct bvecq) {
    90			.ref		= REFCOUNT_INIT(1),
    91			.bv		= bq->__bv,
    92			.inline_bv	= true,
    93			.max_slots	= (size - sizeof(*bq)) / sizeof(bq->__bv[0]),
    94			.from_pool	= from_pool,
    95		};
    96		netfs_stat(&netfs_n_bvecq);
    97		return bq;
    98	}
    99	EXPORT_SYMBOL(bvecq_alloc_one);
   100	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
