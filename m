Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792885876;
	b=LDXWyMak6BVC2M2jgvvLDMKVa4XLBwHO3i140UX8/yOtspoX+/RzyUh7yV+a1I4YAohJ
	 LfHhLO4tmhGKMUtGVqg/ob4lCbBgXLZM8dhUNq6V85xSOX0QzNdF8z/jPHEJDsiLnh4hp
	 Xb5ilaMzUBGlO9v+cuJOfYJTLZmQOGDgxBPbBWJjJdJPeLRSouDe5BqkotySroDI4EdRY
	 UGb0I2u3nP9C5qipqJBZO42HqBICYajyXh5HW5xJHRGoyEGCcK0ZdcAgi7S6BVS3PlZWG
	 N5xROnorsKZeHhEnM2xs9EGP+ziyIcKyKJnqfg00lIWUw/M4mw3MYTFY4fbkfBqdK0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792885876;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UB2OZWEQ3yVjIjp6pj/CkgcZd1Hhrx0XbuM5RLP4cOs=;
	b=1AsODqlcQBl8F3hFV41vWcT2ovnEsc73EJhDX3rSCWBa0744X4h8i/mB1Ff7yZpuTOT8
	 x3hxOuwmq4SWxUtzJmK+GGXEHsfyN10HtufDU7LKfx8fJSvfZcA9U4UtwvyS/4DryWvyA
	 5SGcgglFZALEn2CSPyXU6jUKhrJ5nIx/Yrk52VIBQWh+86+PTZqOO33oZRcDZDoE0sBDV
	 DvE5M/Ilpm5qI5oN11bMV4t21xK1E0Py1wUb+MS1XPuxggiSqdgjRnYpRsU5r/Wg/cc/a
	 JdadRg3tGx0L118Zssdkll/A4oyBgO2pbvs0KSAxwPDXJXbPe+rWZRmsHFNKvFQI5dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j2NJkHF9;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542D1606A31B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 23:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 542D1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j2NJkHF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792885874; x=1824421874;
  h=date:from:to:cc:subject:message-id;
  bh=OvdtbMo6UpUTPMISVlMYDBTLwurg5r4WVwqY+7sLSh4=;
  b=j2NJkHF9V3iHuwsX+/ttse4pcal/GJ51WZceoOqHwpmkO61UpGD0I2W+
   XdnC5P97lhP9PpVtvjydAp4Liv4nPenji2GB2ce3JXXdGOJMYtO+dFT7Z
   1KevVfihYqsDBJLN4m+R3abuBfVCkL7Sbsr7AoHEg+xi5Gmjdp840gS2d
   AuqOLwYFzpdPBfdFbfK/igAU5sc1kNalmRzeJdUrNplRLKExK+q78BdK5
   LWjEPdaMwTolcaclXddKjJ6V7uPkOcN57cyppe4Lh9lKOhwpHG8JzMlL8
   8r0uVFuDR1+U1YmAtsjIdey/iJSh9LTkoRPJA6BnXhv1+b76GAX2KctQx
   w==;
X-CSE-ConnectionGUID: ttgOJps4TG6B9DCi8ZUujA==
X-CSE-MsgGUID: 7tWwH/mpQIW+r4zzYAEEVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1623968"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1623968"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 16:51:14 -0700
X-CSE-ConnectionGUID: o/vuky8vTqqzrlDdcnTMww==
X-CSE-MsgGUID: YysRHCQDQbaW56ZXxSJ83Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="4271676"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Oct 2026 16:51:11 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKlW0-00000000UMc-2J5v;
	Sat, 24 Oct 2026 23:51:08 +0000
Date: Sun, 25 Oct 2026 07:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Paulo Alcantara <pc@manguebit.org>
Subject: [brauner-github:vfs-7.4.netfs.2 3/11] fs/netfs/bvecq.c:79:6:
 warning: assignment to 'struct bvecq *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202610250748.YIDt7Zvo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/brauner/linux.git vfs-7.4.netfs.2
head:   0c7a920f6b8c5cdd7e5c86f5d9ac1195295ff53f
commit: 96adfb795d392d2bf40db295c6796052ec73bce9 [3/11] netfs: Add some tools for managing bvecq chains
config: nios2-randconfig-1001-20261025 (https://download.01.org/0day-ci/archive/20261025/202610250748.YIDt7Zvo-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610250748.YIDt7Zvo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610250748.YIDt7Zvo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/netfs/bvecq.c: In function 'bvecq_alloc_one':
   fs/netfs/bvecq.c:79:8: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
      79 |   bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |        ^~~~~~~~~~~~~
         |        mm_alloc
>> fs/netfs/bvecq.c:79:6: warning: assignment to 'struct bvecq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      79 |   bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |      ^
   fs/netfs/bvecq.c: In function 'bvecq_put':
   fs/netfs/bvecq.c:275:4: error: implicit declaration of function 'mempool_free' [-Werror=implicit-function-declaration]
     275 |    mempool_free(bq, &netfs_bvecq_pool);
         |    ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +79 fs/netfs/bvecq.c

    38	
    39	/**
    40	 * bvecq_alloc_one - Allocate a single bvecq node with unpopulated slots
    41	 * @nr_slots: Number of slots to allocate
    42	 * @gfp: The allocation constraints.
    43	 * @for_writeback: True if allocating for writeback
    44	 *
    45	 * Allocate a single bvecq node and initialise the header.  The allocation is
    46	 * rounded up to the size of the smallest slab granule that will accommodate it
    47	 * and all the remaining space is set as an inline slot array with max_slots
    48	 * set to the number of slots.  The slot array is not initialised.
    49	 *
    50	 * If @for_writeback is set, then the emergency mempool may be used for
    51	 * allocation.  If it does allocate from that pool, the maximum number of slots
    52	 * available will be BVECQ_POOL_SLOTS which may be less than requested.  Also,
    53	 * if @for_writeback is set, the function will not fail - though it may have to
    54	 * wait.
    55	 *
    56	 * Return: The node pointer or NULL on allocation failure.
    57	 */
    58	struct bvecq *bvecq_alloc_one(size_t nr_slots, gfp_t gfp, bool for_writeback)
    59	{
    60		struct bvecq *bq;
    61		const size_t pool_size = struct_size_t(struct bvecq, __bv, BVECQ_POOL_SLOTS);
    62		size_t size;
    63		bool from_pool = false;
    64	
    65		size = kmalloc_size_roundup(struct_size(bq, __bv, nr_slots));
    66		gfp &= ~(GFP_ZONEMASK | __GFP_THISNODE);
    67	
    68		if (for_writeback) {
    69			if (size != pool_size) {
    70				gfp_t gfp_temp = gfp;
    71	
    72				gfp_temp |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN;
    73				gfp_temp &= ~(__GFP_DIRECT_RECLAIM | __GFP_IO);
    74				bq = kmalloc(size, gfp_temp);
    75				if (bq)
    76					goto success;
    77			}
    78	
  > 79			bq = mempool_alloc(&netfs_bvecq_pool, gfp);
    80			if (!bq)
    81				return bq;
    82			from_pool = true;
    83			size = pool_size;
    84		} else {
    85			bq = kmalloc(size, gfp);
    86			if (!bq)
    87				return bq;
    88		}
    89	
    90	success:
    91		*bq = (struct bvecq) {
    92			.ref		= REFCOUNT_INIT(1),
    93			.bv		= bq->__bv,
    94			.inline_bv	= true,
    95			.max_slots	= (size - sizeof(*bq)) / sizeof(bq->__bv[0]),
    96			.from_pool	= from_pool,
    97		};
    98		netfs_stat(&netfs_n_bvecq);
    99		return bq;
   100	}
   101	EXPORT_SYMBOL(bvecq_alloc_one);
   102	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
