Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792973462;
	b=lRHuwcEPuRI7wCsQGUUvA8sDAKslubqpyPL0Alr1hrMlmM/oqIbvyF0AWWjc/bwf3hCL
	 ycTybLxI01V8fcnQlDuHS0XaSJjI2OzQkiTpxpsK5H5e1w0W8zSuU+qtnN+Jw7MIUaY6+
	 PsQHR8t7JvrjPco29bZio2BaFnOSCniKHnPW/W9Xui8LQYmI38m+KbrduONHzG/3PcMbe
	 ocja91v6SaGOsK2b0JTt6Z1y2t8HZI6LuvQgu+YeE6uNTD+hx4fnj3sbKBTqT5GH7Daup
	 Nbe1+J+iBLzNUilcRKb68ksl+jCZBAIQD99uQfdNBBuJPfrbekRyliOVHkpDixNBNng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792973462;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ozbBcQyIdBGbmL2rBz3QxXwVSHoqODmdETa/KRMvXpQ=;
	b=Rb8Nm/a86jKT9kelo8t2ukhLG816NS16OkyFDwZrdhtmxrsAYjSLoLSRbgGBGxE06j0N
	 uAPuWVIdWGultzcGehK27hWq68Ds6kywrIdFqwBthYKRo8t6UfAecr1GdahzxtIurAiMt
	 Ngk6QuTpGfL2YizyCULnPQmOxFoRUfC8JuQ2e1+Jk2e9qAEm76Fh/ZfytX8Xu2V/P3Ysn
	 GeZhZONWvBsAt06ctjfxZNiJHCfbEbtfAt1cXEfJgzl0W+hfsWDloKjfW73abdeKHNCrE
	 q/LixDgQTv/+3hnXE2pNHrPh3zkbrgEuiOmk/2WipEtydY455KxIGErgM9KfcRajgWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GHUTGNO5;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A12606A320
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 00:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93A12606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GHUTGNO5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792973460; x=1824509460;
  h=date:from:to:cc:subject:message-id;
  bh=tQYdNn0baDVGeuZDQKD8od1jKrgMegkfoQHibbw3tmk=;
  b=GHUTGNO5kKvaMkOelXBuPg7SniMpW9dl/E7UE6bbJ66/jE8Re9yf0bqp
   +VE/CR1wNV51p4iB+abYdrp19p5SJ9TIjC5eSOznfd38BotlZhSo01lEj
   kDUdHkHXiJ7x46rArAQVdcqqXBg5Cdgn6g4x/AENnbdqbCDLxMNXM/1Ss
   IBsDGaMiOfhLeXzBQ85YgB5tA3AmzOiQaSEyZl2R+Yi+xHHf4qWoVW9wJ
   Uz4VN9qOGYfPtjGbttO2DlajTjJQ99ywDiQOCOkkgYH3yNRVkWqEznpgq
   I7Fk0GosNIJ1Yh3h3Mpv+prEzAJgcol0m1AnFVs//B6wvGeEk+y/IpPmS
   w==;
X-CSE-ConnectionGUID: 750CUjK/S2u8jfdE6veDpQ==
X-CSE-MsgGUID: 43TCIuIVQIqCR22Irz9e2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1519610"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1519610"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 17:11:00 -0700
X-CSE-ConnectionGUID: 96aextt0T9K3jvHGdcXmzQ==
X-CSE-MsgGUID: mupkf1YgSiSGN3UoPyPcDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="5954394"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 25 Oct 2026 17:10:52 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL8Ic-000000003tL-2wdP;
	Mon, 26 Oct 2026 00:10:50 +0000
Date: Mon, 26 Oct 2026 01:10:20 +0100
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Paulo Alcantara <pc@manguebit.org>
Subject: [brauner-vfs:vfs-7.4.netfs.2 3/11] fs/netfs/bvecq.c:79:20:
 error: assignment to 'struct bvecq *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202610260138.cMdqeLvj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7.4.netfs.2
head:   0c7a920f6b8c5cdd7e5c86f5d9ac1195295ff53f
commit: 96adfb795d392d2bf40db295c6796052ec73bce9 [3/11] netfs: Add some tools for managing bvecq chains
config: sh-randconfig-2000-20261025 (https://download.01.org/0day-ci/archive/20261026/202610260138.cMdqeLvj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610260138.cMdqeLvj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610260138.cMdqeLvj-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/netfs/bvecq.c: In function 'bvecq_alloc_one':
   fs/netfs/bvecq.c:79:22: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Wimplicit-function-declaration]
      79 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                      ^~~~~~~~~~~~~
         |                      mm_alloc
>> fs/netfs/bvecq.c:79:20: error: assignment to 'struct bvecq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      79 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                    ^
   fs/netfs/bvecq.c: In function 'bvecq_put':
   fs/netfs/bvecq.c:275:25: error: implicit declaration of function 'mempool_free' [-Wimplicit-function-declaration]
     275 |                         mempool_free(bq, &netfs_bvecq_pool);
         |                         ^~~~~~~~~~~~


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
