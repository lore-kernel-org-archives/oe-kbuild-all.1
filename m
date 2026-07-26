Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EFB3033D6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jul 2026 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785058078; cv=none; b=XNFkK6cs4VPGLkQqpP5zNJytf8nOHXwxI8eeWid2B1NjqxK4NOgOkgnWQ9k2flmynok0NuT757z8FSbCbkXK1HzkP3IAW+A+yoqtxL6bYEpw6s7La1Hlg+H830H8r9HnSXm5JEFg15PPRDbxNOd74VXzXF1SNRd/1h5r3YdUXaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785058078; c=relaxed/simple;
	bh=nPDUvyKUn4IjAInGXjEFu+tfUJ0j7BmKA1BHApD/fig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c01pI4/tpeI25uwTPFLfeAxHBe2ucn/DFQR/TZlMyJ3Z/L0ZCavj4jWZXxfuFDJwKpPWZzIVWKpTRGt2ZAV+RBnv/gb7Qp9pZ5o4OMi85WFmjcO+DGGDylrqgcKn18QA8ZivrHvEv5X6dC2mGXq8Ow6EVtfZp9WKmT02kCJD+w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tuxs8S2f; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tuxs8S2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785058076; x=1816594076;
  h=date:from:to:cc:subject:message-id;
  bh=nPDUvyKUn4IjAInGXjEFu+tfUJ0j7BmKA1BHApD/fig=;
  b=Tuxs8S2fbbv00xk3AXrf8yjwGOsGpz1xzGyzzcgoiNG96FbV+GjSSNXk
   UdE/eRhP0de5sS6j2ZneyYUfdxYZ9gYjUsqSgq5yrOzJyc7/QMHNHXQlD
   qNzRa867fKoNkfoFj63mGR74WKyrRcx+lMJriN0cih77m3zWZ3xeynC/s
   dtfSkzG15LfYjHUb+qFzZIINXBr+xUsMPYhh1Ck+rZvyEeLTvHUcKNbZT
   LWnreMkcxnrMBJNew/KfPbSyOZrYukHoyrh9DlAiVM5DyvFnE7PLtVDR5
   Xnn+HCvEGMGaMbbzY0Y2oQUBTmVnUmYVLkrdW3UOBmwBWyohlTNniugsk
   A==;
X-CSE-ConnectionGUID: 5wqWAfOZR1GJ2sc79R9+fA==
X-CSE-MsgGUID: 7zk2ZV8/TZ2aVB6prACzTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="73195057"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="73195057"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 02:27:55 -0700
X-CSE-ConnectionGUID: N0/WTEwuQnG3nimffl10+Q==
X-CSE-MsgGUID: WOvmwT8xRW+sadV+rBfmXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="264130402"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jul 2026 02:27:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnv96-00000000cRa-0StL;
	Sun, 26 Jul 2026 09:27:46 +0000
Date: Sun, 26 Jul 2026 17:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-fixes 4/4]
 fs/netfs/rolling_buffer.c:30:7: error: call to undeclared function
 'mempool_alloc'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202607261746.irnXvTHK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   f30eb942050fff68206625e9a9d2e84d0eb77a48
commit: f30eb942050fff68206625e9a9d2e84d0eb77a48 [4/4] netfs: Fix folio_queue ENOMEM in writeback by adding a mempool
config: i386-randconfig-141-20260726 (https://download.01.org/0day-ci/archive/20260726/202607261746.irnXvTHK-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260726/202607261746.irnXvTHK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607261746.irnXvTHK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/rolling_buffer.c:30:7: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      30 |         fq = mempool_alloc(&netfs_folioq_pool, gfp);
         |              ^
>> fs/netfs/rolling_buffer.c:30:5: error: incompatible integer to pointer conversion assigning to 'struct folio_queue *' from 'int' [-Wint-conversion]
      30 |         fq = mempool_alloc(&netfs_folioq_pool, gfp);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/rolling_buffer.c:53:2: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      53 |         mempool_free(folioq, &netfs_folioq_pool);
         |         ^
   3 errors generated.


vim +/mempool_alloc +30 fs/netfs/rolling_buffer.c

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
  > 30		fq = mempool_alloc(&netfs_folioq_pool, gfp);
    31		if (fq) {
    32			netfs_stat(&netfs_n_folioq);
    33			folioq_init(fq, rreq_id);
    34			fq->debug_id = atomic_inc_return(&debug_ids);
    35			trace_netfs_folioq(fq, trace);
    36		}
    37		return fq;
    38	}
    39	EXPORT_SYMBOL(netfs_folioq_alloc);
    40	
    41	/**
    42	 * netfs_folioq_free - Free a folio_queue struct
    43	 * @folioq: The object to free
    44	 * @trace: Trace tag to indicate which free
    45	 *
    46	 * Free and unaccount the folio_queue struct.
    47	 */
    48	void netfs_folioq_free(struct folio_queue *folioq,
    49			       unsigned int /*enum netfs_trace_folioq*/ trace)
    50	{
    51		trace_netfs_folioq(folioq, trace);
    52		netfs_stat_d(&netfs_n_folioq);
  > 53		mempool_free(folioq, &netfs_folioq_pool);
    54	}
    55	EXPORT_SYMBOL(netfs_folioq_free);
    56	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
