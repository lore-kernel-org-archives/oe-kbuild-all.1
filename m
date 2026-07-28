Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8F83AFD17
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 12:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240688; cv=none; b=K/g0r2WekisHRuo/p/793/hjK4rTSIyNk7Y9yUpGjh2pcAAr1QPrjif8zq4PgXWWZzxgqGGys2GoYZBc8PXCa8OnwNhxG0qH4+QTg1kpREWYJbYgzKzIFPhAbd6tCf92zFoQj5EyXnEaYAXrICX7tsEUcsp6dFxVQMQzjWdyVAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240688; c=relaxed/simple;
	bh=8r5lkMKWDBlmyJ+uAdo1N6sRGDeSudWsIz8OOPhRitc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o+FBHmSMeFJCH917dqRXtNaC8rPumkl1yYIAemBjsSqI1/ybWzwLnJqbAYWhOXkaGym1sEOV0Gawn0IuzDYwsuP4GzBqgVpUs2c36Ew5pCti27h4lCc6f/+1YscJIZqP9fz2ChEPsiA9VyJ2pmN4Anm5tWvLjI9kld0bc1ngFys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSpaz+2U; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSpaz+2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785240685; x=1816776685;
  h=date:from:to:cc:subject:message-id;
  bh=8r5lkMKWDBlmyJ+uAdo1N6sRGDeSudWsIz8OOPhRitc=;
  b=VSpaz+2U3l0PpH7dcqeMm907GITpmDY8pBZsyQv65FG3K/TB+nsZTIYQ
   hPNPQeftsyVKTUpx/oLj+KEHiCjnoWjsrB6lKa824a9OtmZMR5Xc+twxg
   f4QfWp0OPV2GLTUVN66Ft31yK1EAHfGr+ZM0nEv1qYJ2u7tJTOncOYBtH
   ndTVguj8aKn0MghgGwjKrQ1F+SrGdAoO6CPiJ8W5gkusVeBwd0cTpo3OK
   gkTQfgykRQhvbXOM3WzOWYZvjofZtDEL6I/5P4oa9XAdkJceSPYlfQe3g
   LDyClU7NtyGKaB3ehiq/+p4HyHhvdcjgvxoWAeGAw5exAFR7YcLQGGrpi
   g==;
X-CSE-ConnectionGUID: pj5s7rvYRraZ//UZRGDRJg==
X-CSE-MsgGUID: A5HUJ9TTSlKMtovERVj8dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="89492054"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="89492054"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 05:11:25 -0700
X-CSE-ConnectionGUID: g7gof4xMQ2+2BAoVbxP8iQ==
X-CSE-MsgGUID: XIbzFL9oQXe0GXpt/bGNjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="297917269"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Jul 2026 05:11:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wogeX-00000000eJz-2zSu;
	Tue, 28 Jul 2026 12:11:21 +0000
Date: Tue, 28 Jul 2026 20:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-fixes 4/4]
 fs/netfs/rolling_buffer.c:31:25: error: incomplete definition of type
 'mempool_t' (aka 'struct mempool')
Message-ID: <202607281939.mhmJ2cnE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   6836db8d3babf7ae82597d516f89848e5652b957
commit: 6836db8d3babf7ae82597d516f89848e5652b957 [4/4] netfs: Fix folio_queue ENOMEM in writeback by adding a mempool
config: i386-randconfig-141-20260728 (https://download.01.org/0day-ci/archive/20260728/202607281939.mhmJ2cnE-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281939.mhmJ2cnE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281939.mhmJ2cnE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/rolling_buffer.c:31:25: error: incomplete definition of type 'mempool_t' (aka 'struct mempool')
      31 |                 fq = netfs_folioq_pool.alloc(gfp, netfs_folioq_pool.pool_data);
         |                      ~~~~~~~~~~~~~~~~~^
   include/linux/netfs.h:24:16: note: forward declaration of 'struct mempool'
      24 | typedef struct mempool mempool_t;
         |                ^
   fs/netfs/rolling_buffer.c:31:54: error: incomplete definition of type 'mempool_t' (aka 'struct mempool')
      31 |                 fq = netfs_folioq_pool.alloc(gfp, netfs_folioq_pool.pool_data);
         |                                                   ~~~~~~~~~~~~~~~~~^
   include/linux/netfs.h:24:16: note: forward declaration of 'struct mempool'
      24 | typedef struct mempool mempool_t;
         |                ^
   fs/netfs/rolling_buffer.c:33:8: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      33 |                 fq = mempool_alloc(&netfs_folioq_pool, gfp);
         |                      ^
   fs/netfs/rolling_buffer.c:33:6: error: incompatible integer to pointer conversion assigning to 'struct folio_queue *' from 'int' [-Wint-conversion]
      33 |                 fq = mempool_alloc(&netfs_folioq_pool, gfp);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/rolling_buffer.c:56:2: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      56 |         mempool_free(folioq, &netfs_folioq_pool);
         |         ^
   5 errors generated.


vim +31 fs/netfs/rolling_buffer.c

    15	
    16	/**
    17	 * netfs_folioq_alloc - Allocate a folio_queue struct
    18	 * @rreq_id: Associated debugging ID for tracing purposes
    19	 * @gfp: Allocation constraints
    20	 * @trace: Trace tag to indicate the purpose of the allocation
    21	 *
    22	 * Allocate, initialise and account the folio_queue struct and log a trace line
    23	 * to mark the allocation.
    24	 */
    25	struct folio_queue *netfs_folioq_alloc(unsigned int rreq_id, gfp_t gfp,
    26					       unsigned int /*enum netfs_folioq_trace*/ trace)
    27	{
    28		struct folio_queue *fq;
    29	
    30		if (gfp == GFP_KERNEL)
  > 31			fq = netfs_folioq_pool.alloc(gfp, netfs_folioq_pool.pool_data);
    32		else
    33			fq = mempool_alloc(&netfs_folioq_pool, gfp);
    34		if (fq) {
    35			netfs_stat(&netfs_n_folioq);
    36			folioq_init(fq, rreq_id);
    37			fq->debug_id = atomic_inc_return(&debug_ids);
    38			trace_netfs_folioq(fq, trace);
    39		}
    40		return fq;
    41	}
    42	EXPORT_SYMBOL(netfs_folioq_alloc);
    43	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
