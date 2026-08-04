Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D0333C192
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 04:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817972; cv=none; b=uM2J+2eB6nSHTumGX7/Uijy/18vhREAx1Kodj/Pm3SHyfIiXDCsITwls6Dbd+NoSAO+emNxVTB2Rfr0Q8gV5O0cWRRg95YkU7wgNkrx7r2Lb5cnpNCu4Hfv/+cmA7SGrnpMOdqiffHKbeeWWwyP5QOpMOApuJ1Z6mHkKjY0F/oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817972; c=relaxed/simple;
	bh=Yyj5zTq1ny+0BIsOJBnpTzNeioio2Fq6FzUP8X86vvE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=luPltbfbGVcK4Mclqq29IngcZOR7vd3fJpKHEuaSNbvkcCCUXeRim2sLrI0ecAJgP9fhyE/cvsGIblgKEq40nROuFwPdJddyVGElmnXJCt8+4CbJLeAJ8HOxn/iWROZW2ALO102PnbWuq62o56So95HdUV7VIW/dA6mjXdYK2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUUiPYNc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUUiPYNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785817971; x=1817353971;
  h=date:from:to:cc:subject:message-id;
  bh=Yyj5zTq1ny+0BIsOJBnpTzNeioio2Fq6FzUP8X86vvE=;
  b=XUUiPYNcdRPnNYWvS/T+83LhxV7WBZFCgZoPDU78+nKVvKPYjiWORDGE
   2NI7rRsWd/KvupOXxQ4oHB+brrQ1ul6Pvi9RTirITz7CgAwS1OOm+1JYU
   Am1KufNFXXwNM8NP4whqzmVC8jk7CBtz5bHB4bgQ5FUrgWmbn0Qp0VrHf
   Lto5cQFc+Mn2kSwjLd1G+JTwwTj4HiemT7Cq9DuG/f0k/KFrhvvHAIdmL
   tU8w8mdwBc4tsRLCkpyuBKmNbGPB6JbFc3J2DtgGy+BtxDaGQatuid8On
   0vTUD2NzykuWo3hvozNB6VTIGCjAptLTYixp9JcEiSkCoxOedf7+wo2ZM
   w==;
X-CSE-ConnectionGUID: bwbHiw+hTRG4OtOUAvPUGw==
X-CSE-MsgGUID: h0FApffdTh+TbkvYjK+kzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86129906"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="86129906"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 21:32:48 -0700
X-CSE-ConnectionGUID: mHumKoRSSTOSQFA4UGqvOw==
X-CSE-MsgGUID: FSau4gJGSf+SXhxdGp2zCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="258737199"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Aug 2026 21:32:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr6pY-000000008wR-0Pmi;
	Tue, 04 Aug 2026 04:32:44 +0000
Date: Tue, 04 Aug 2026 12:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 7/25] fs/netfs/bvecq.c:71:6:
 warning: assignment to 'struct bvecq *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202608041257.gq0v52fy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   aaa4a525c627a60047b4d6b0d90ae8ea6a4bbdd4
commit: 2839f517bfb007fbfccafb1e6ac2b7d858e72fb4 [7/25] netfs: Make mempool available for bvecq
config: csky-randconfig-001-20260804 (https://download.01.org/0day-ci/archive/20260804/202608041257.gq0v52fy-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041257.gq0v52fy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041257.gq0v52fy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/netfs/bvecq.c: In function 'bvecq_alloc_one':
   fs/netfs/bvecq.c:67:24: error: invalid use of incomplete typedef 'mempool_t' {aka 'struct mempool'}
      67 |   bq = netfs_bvecq_pool.alloc(gfp, netfs_bvecq_pool.pool_data);
         |                        ^
   fs/netfs/bvecq.c:67:52: error: invalid use of incomplete typedef 'mempool_t' {aka 'struct mempool'}
      67 |   bq = netfs_bvecq_pool.alloc(gfp, netfs_bvecq_pool.pool_data);
         |                                                    ^
   fs/netfs/bvecq.c:71:8: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
      71 |   bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |        ^~~~~~~~~~~~~
         |        mm_alloc
>> fs/netfs/bvecq.c:71:6: warning: assignment to 'struct bvecq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      71 |   bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |      ^
   fs/netfs/bvecq.c: In function 'bvecq_put':
   fs/netfs/bvecq.c:260:4: error: implicit declaration of function 'mempool_free' [-Werror=implicit-function-declaration]
     260 |    mempool_free(bq, &netfs_bvecq_pool);
         |    ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +71 fs/netfs/bvecq.c

    40	
    41	/**
    42	 * bvecq_alloc_one - Allocate a single bvecq node with unpopulated slots
    43	 * @nr_slots: Number of slots to allocate
    44	 * @gfp: The allocation constraints.
    45	 *
    46	 * Allocate a single bvecq node and initialise the header.  A number of inline
    47	 * slots are also allocated, rounded up to fit after the header in a power-of-2
    48	 * slab object of up to 512 bytes (up to 29 slots on a 64-bit cpu).  The caller
    49	 * should be aware that the number of slots allocated may be more or less than
    50	 * the number requested.  The slot array is not initialised.
    51	 *
    52	 * Return: The node pointer or NULL on allocation failure.
    53	 */
    54	struct bvecq *bvecq_alloc_one(size_t nr_slots, gfp_t gfp)
    55	{
    56		struct bvecq *bq;
    57		const size_t max_size = 512;
    58		const size_t max_slots = (max_size - sizeof(*bq)) / sizeof(bq->__bv[0]);
    59		size_t part = umin(nr_slots, max_slots);
    60		size_t size = roundup_pow_of_two(struct_size(bq, __bv, part));
    61		bool from_pool = false;
    62	
    63		gfp &= ~GFP_ZONEMASK;
    64		if (size != BVECQ_STD_SIZE) {
    65			bq = kmalloc(size, gfp);
    66		} else {
    67			bq = netfs_bvecq_pool.alloc(gfp, netfs_bvecq_pool.pool_data);
    68			from_pool = true;
    69		}
    70		if (!bq && gfp != GFP_KERNEL) {
  > 71			bq = mempool_alloc(&netfs_bvecq_pool, gfp);
    72			from_pool = true;
    73			size = BVECQ_STD_SIZE;
    74		}
    75		if (bq) {
    76			*bq = (struct bvecq) {
    77				.ref		= REFCOUNT_INIT(1),
    78				.bv		= bq->__bv,
    79				.inline_bv	= true,
    80				.max_slots	= (size - sizeof(*bq)) / sizeof(bq->__bv[0]),
    81				.from_pool	= from_pool,
    82			};
    83			netfs_stat(&netfs_n_bvecq);
    84		}
    85		return bq;
    86	}
    87	EXPORT_SYMBOL(bvecq_alloc_one);
    88	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
