Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAFD3BB9FD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 06:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221184; cv=none; b=UpsyGp7RQj2UkbulbDrrsV11bEQM9ciqbGW/eExPycgSu9166FhBYU0qLgwFkhbdiILprCCmbiaDEacUGekH77nyplU32y+1ZaP93O5rI5omtAS42yN2KfU052ZkuvKKSNB5dlupZmDCs8D3v32LqvavAXj+FMmMcucNtzm8Ll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221184; c=relaxed/simple;
	bh=p6Nay+zVk7C5JerG0ja6HR8OGmqOoQ3L0zdak2sgpDA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rd+cHVIR5j3s4LUf92+ryAk1dtB+j2igTjdmIz50YTz+/0gKOadv1kYLHK7nn7ypnwTx6WI8mOm1u/lh6g3xnsuD6YnBZcJwRqyO8gVxUcTetuuz+UpOmxf0F8WgJxNSC4KTERqmdE0SQa7NhBX21yoZkzTMNqvQHX/H/Dh1nzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Stsl/2rg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Stsl/2rg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785221180; x=1816757180;
  h=date:from:to:cc:subject:message-id;
  bh=p6Nay+zVk7C5JerG0ja6HR8OGmqOoQ3L0zdak2sgpDA=;
  b=Stsl/2rgPr027dMnxpA57qWrZwQdzgfW0i+WtO8OxFK4EETwvjjJh2ED
   yTJvlkpGgnyVOSJeza0LqXXm0SFmC1Oq13DDBIMDBp/5BI177JJJY9RKl
   8VZlymSFutWbtTaY9MQIRl4huu9ltePziO27efAMTnYSGQkPpFyMCMeOe
   lkEi+cUvG1O+ogBhjpVHvncHKEZxLYAgCu3VEhidl0su65c2gq4u3OTBK
   Pw4iXlouMOLFZsa08fdLnMiE7FqVJdm2wzEAr6TTdMP2bz+DmSXfVtECH
   GRFIu4LKd7mg6g2s6leJNgbA0XGOfDa0SrVGfbuCW+vqgRZtNnVYfkZaj
   Q==;
X-CSE-ConnectionGUID: CtPbZcvST32gKZvxfFEEug==
X-CSE-MsgGUID: hBfNrhqUR/KC2ro4OC7igA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96385059"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="96385059"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 23:46:19 -0700
X-CSE-ConnectionGUID: y0x5ECAUR6OL4BxqvUuBXA==
X-CSE-MsgGUID: eSCXpDEJS9+n7UMKme3Z1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="284158624"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jul 2026 23:46:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wobZk-00000000e55-39Ka;
	Tue, 28 Jul 2026 06:46:07 +0000
Date: Tue, 28 Jul 2026 14:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-fixes 4/4]
 fs/netfs/rolling_buffer.c:31:39: error: invalid use of incomplete typedef
 'mempool_t' {aka 'struct mempool'}
Message-ID: <202607281451.u5OgPCP3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   6836db8d3babf7ae82597d516f89848e5652b957
commit: 6836db8d3babf7ae82597d516f89848e5652b957 [4/4] netfs: Fix folio_queue ENOMEM in writeback by adding a mempool
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260728/202607281451.u5OgPCP3-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281451.u5OgPCP3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281451.u5OgPCP3-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/netfs/rolling_buffer.c: In function 'netfs_folioq_alloc':
>> fs/netfs/rolling_buffer.c:31:39: error: invalid use of incomplete typedef 'mempool_t' {aka 'struct mempool'}
      31 |                 fq = netfs_folioq_pool.alloc(gfp, netfs_folioq_pool.pool_data);
         |                                       ^
   fs/netfs/rolling_buffer.c:31:68: error: invalid use of incomplete typedef 'mempool_t' {aka 'struct mempool'}
      31 |                 fq = netfs_folioq_pool.alloc(gfp, netfs_folioq_pool.pool_data);
         |                                                                    ^
   fs/netfs/rolling_buffer.c:33:22: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Wimplicit-function-declaration]
      33 |                 fq = mempool_alloc(&netfs_folioq_pool, gfp);
         |                      ^~~~~~~~~~~~~
         |                      mm_alloc
   fs/netfs/rolling_buffer.c:33:20: error: assignment to 'struct folio_queue *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      33 |                 fq = mempool_alloc(&netfs_folioq_pool, gfp);
         |                    ^
   fs/netfs/rolling_buffer.c: In function 'netfs_folioq_free':
   fs/netfs/rolling_buffer.c:56:9: error: implicit declaration of function 'mempool_free' [-Wimplicit-function-declaration]
      56 |         mempool_free(folioq, &netfs_folioq_pool);
         |         ^~~~~~~~~~~~


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
