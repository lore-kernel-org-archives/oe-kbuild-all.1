Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E9F357D11
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 05:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846301; cv=none; b=nJWkW+WB3W4P59urN9L9C+7lcKlOY5H1NRbIsio0z1d2GfWUfteR/VYLp7JEWl4mRRCNn05dpr81zAMjpLEWt4rcS8lV29sgufHTRTVIo6Cexr7BGG/jlqyRxizcGY7s3qw5pQdyrHdrpisOwPgSnrXsyG797D89UNiDrPzpyc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846301; c=relaxed/simple;
	bh=Smihmrpz3PpiJl/3k9Ok0SOlfGmvYXxKSdqgg6pXQZY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jKBwZ5MIJweXqtjYThFv6HmOjxVm/MUuq/aho3PVzJtHSnnPrwsnyPIu0KQjC/HB/rdKCdBRM3a2ic3kgY91/+mijqtXRCidvfQPOpOulAGc2O+UBCj2MoN+UP+ha0/tqf6QDHHZdnIpZVjmLbdlC7CM3FxzOXo04ZhxiHfjAMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFdznTG3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFdznTG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788846299; x=1820382299;
  h=date:from:to:cc:subject:message-id;
  bh=Smihmrpz3PpiJl/3k9Ok0SOlfGmvYXxKSdqgg6pXQZY=;
  b=FFdznTG3ytdoCelBl3xU8UruYKOBkgGDhbc+IkG+P7+RndPlXH+07WGi
   +MMbM2+awNz4vf8QHhogjt6xFhR3BHAHX4q7Gs85foUjelPXrEKKx0ZBP
   AiNMclw0h/09gqLQDUDgY4uNA6sGpC99M2JBJ0tGvdYd4MAK6akNmtQVg
   WZzvpoDcbq5RiDmWnYO2FSJFC4a8SHt7fdKxW7Q9p494jx4h7hzD/TGAm
   ys5YOS0X6rkkW1PBWtKUv+FjceNfQKuBpJkuTiOUkjaGvuYxyI6jVbYX7
   t2MWibck31Tz/bQbTAyVJoBqDcuGNwSejMgNX7o/2NHPQWMLQZg4eD/ki
   A==;
X-CSE-ConnectionGUID: JCTIf0s1QyuJDHp8vO/7HA==
X-CSE-MsgGUID: sR8LswpqQAWhriXRfG97vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89255825"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89255825"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 22:44:58 -0700
X-CSE-ConnectionGUID: eJW9IDJDQGCK/e+qtfPqfQ==
X-CSE-MsgGUID: fb6MCXYOTSCB+vdaSlFIxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="276150290"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Sep 2026 22:44:57 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3oda-000000001ir-1mGE;
	Tue, 08 Sep 2026 05:44:54 +0000
Date: Tue, 08 Sep 2026 13:43:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 20/39] fs/netfs/bvecq.c:75:20:
 warning: assignment to 'struct bvecq *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202609081315.Ji6LYtpB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   269568d526a993d695379e3c37d599f758d032e6
commit: 5493956349036df3fb03d1a5b0215d82ceeb7b05 [20/39] netfs: Make mempool available for bvecq
config: x86_64-randconfig-r134-20260908 (https://download.01.org/0day-ci/archive/20260908/202609081315.Ji6LYtpB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081315.Ji6LYtpB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081315.Ji6LYtpB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/netfs/bvecq.c: In function 'bvecq_alloc_one':
   fs/netfs/bvecq.c:75:22: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
      75 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                      ^~~~~~~~~~~~~
         |                      mm_alloc
>> fs/netfs/bvecq.c:75:20: warning: assignment to 'struct bvecq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      75 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                    ^
   fs/netfs/bvecq.c: In function 'bvecq_put':
   fs/netfs/bvecq.c:273:25: error: implicit declaration of function 'mempool_free' [-Werror=implicit-function-declaration]
     273 |                         mempool_free(bq, &netfs_bvecq_pool);
         |                         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +75 fs/netfs/bvecq.c

    38	
    39	/**
    40	 * bvecq_alloc_one - Allocate a single bvecq node with unpopulated slots
    41	 * @nr_slots: Number of slots to allocate
    42	 * @gfp: The allocation constraints.
    43	 * @for_writeback: True if allocating for writeback
    44	 *
    45	 * Allocate a single bvecq node and initialise the header.  A number of inline
    46	 * slots are also allocated, rounded up to fit after the header in a power-of-2
    47	 * slab object of up to 512 bytes (up to 29 slots on a 64-bit cpu).  The caller
    48	 * should be aware that the number of slots allocated may be more or less than
    49	 * the number requested.  The slot array is not initialised.
    50	 *
    51	 * Return: The node pointer or NULL on allocation failure.
    52	 */
    53	struct bvecq *bvecq_alloc_one(size_t nr_slots, gfp_t gfp, bool for_writeback)
    54	{
    55		struct bvecq *bq;
    56		const size_t max_size = 512;
    57		const size_t max_slots = (max_size - sizeof(*bq)) / sizeof(bq->__bv[0]);
    58		size_t part = min(nr_slots, max_slots);
    59		size_t size = roundup_pow_of_two(struct_size(bq, __bv, part));
    60		bool from_pool = false;
    61	
    62		gfp &= ~(GFP_ZONEMASK | __GFP_THISNODE);
    63	
    64		if (for_writeback) {
    65			if (size != BVECQ_STD_SIZE) {
    66				gfp_t gfp_temp = gfp;
    67	
    68				gfp_temp |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN;
    69				gfp_temp &= ~(__GFP_DIRECT_RECLAIM | __GFP_IO);
    70				bq = kmalloc(size, gfp_temp);
    71				if (bq)
    72					goto success;
    73			}
    74	
  > 75			bq = mempool_alloc(&netfs_bvecq_pool, gfp);
    76			if (!bq)
    77				return bq;
    78			from_pool = true;
    79			size = BVECQ_STD_SIZE;
    80		} else {
    81			bq = kmalloc(size, gfp);
    82			if (!bq)
    83				return bq;
    84		}
    85	
    86	success:
    87		*bq = (struct bvecq) {
    88			.ref		= REFCOUNT_INIT(1),
    89			.bv		= bq->__bv,
    90			.inline_bv	= true,
    91			.max_slots	= (size - sizeof(*bq)) / sizeof(bq->__bv[0]),
    92			.from_pool	= from_pool,
    93		};
    94		netfs_stat(&netfs_n_bvecq);
    95		return bq;
    96	}
    97	EXPORT_SYMBOL(bvecq_alloc_one);
    98	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
