Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534BA223DFF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787748402; cv=none; b=Z6yILLgnga6PHPGw+K3ZGebXTd6yNUP+F3e6MJRmkkqSV4RbxgdQzNjouG+eGRZvOV82mUrmU4d45HiP6VY545ZCedJ8rDMjFBiNNCk4/EbwRRAjOHWW+EgS6IKU/5BHGJJRLLftF8Ea+ANzZgTigaxYYYaeS+NaTq6sKYZ8/dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787748402; c=relaxed/simple;
	bh=gFKOIgDjg5ILja8dI71SbSAaTTllUY293jAA7jxMoQ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e24USKeTp1YeJavcGdCsON8YDtc+Qi/rQSK3Lkg1KNgBMCVu0h4U0vkGdoytZfJnIvZMLD1QbUA+JKaHzRVx6cJk9e43QjgiIcNzUZo9enH+D7DGPWJjPZOPNfJM5BgsbNqV1M3c281uBXKSBAfpt7oaqeX61xQmjmby4Sgsslw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USYqzN6M; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USYqzN6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787748399; x=1819284399;
  h=date:from:to:cc:subject:message-id;
  bh=gFKOIgDjg5ILja8dI71SbSAaTTllUY293jAA7jxMoQ4=;
  b=USYqzN6M+vDNP7ts1cEdy9r/12U7PFYMuUdDELFG+cEoSaPEqEelf6/t
   nOZ1qHhdb6qEeSzY2sKLP9b5qpFSDlGfnof6JJc/hi9MhCA/QwuaoBNrw
   DOjW1wrNZvHMcJyWgwRSQKDR7FREcYpby3jmqa7KAVR3OivUPAH/DhXMv
   JC40deA1uHfT14T8Lyq7/eabOiXScmNIOZ2PdU2GJKV+Ll1ST8B9hcDzW
   naIdLjr7nzZG4374jhUs4UV395VcqWEhnbxi6bThq56MbkfdBbK070WIw
   tMk51ghv/AaMeRAJjY8YG1CL8ElWz59P3VZ9pjXb/tfqRRBCHEzrxBOMe
   w==;
X-CSE-ConnectionGUID: uMCvLhhuSAaEGVfzG8sv/Q==
X-CSE-MsgGUID: YrrTeuE5TBSgVTiJiuWHNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98562716"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="98562716"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 05:46:39 -0700
X-CSE-ConnectionGUID: ffivhU6iQbGfBxWvOaNodw==
X-CSE-MsgGUID: Hk0mq8cQQRq7ADgQ5NN9XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="272816576"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Aug 2026 05:46:37 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzD1W-000000007Sn-3Ndd;
	Wed, 26 Aug 2026 12:46:34 +0000
Date: Wed, 26 Aug 2026 20:46:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 33/36]
 fs/netfs/write_collect.c:204:4: error: call to undeclared function
 'mempool_free'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608262032.92jwr12F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8f0e78ba82ccca8613b01c5f0215f8ce7c7c5cf3
commit: e09967cf018fd9ee7f1324d6ccea2d0a5f6b0f46 [33/36] netfs: Rework writeback to use a separate list of regions to be unlocked
config: i386-randconfig-141-20260826 (https://download.01.org/0day-ci/archive/20260826/202608262032.92jwr12F-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608262032.92jwr12F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262032.92jwr12F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/write_collect.c:204:4: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     204 |                         mempool_free(wback, &netfs_bvecq_pool);
         |                         ^
   1 error generated.
--
>> fs/netfs/write_issue.c:795:11: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     795 |                 wback = mempool_alloc(&netfs_writeback_pool, wreq->gfp);
         |                         ^
>> fs/netfs/write_issue.c:795:9: error: incompatible integer to pointer conversion assigning to 'struct netfs_writeback *' from 'int' [-Wint-conversion]
     795 |                 wback = mempool_alloc(&netfs_writeback_pool, wreq->gfp);
         |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/mempool_free +204 fs/netfs/write_collect.c

   163	
   164	/*
   165	 * Unlock any folios we've finished with.
   166	 */
   167	static void netfs_writeback_unlock_folios(struct netfs_io_request *wreq,
   168						  unsigned int *notes)
   169	{
   170		struct netfs_writeback *wback, *next;
   171	
   172		if (wreq->origin == NETFS_PGPRIV2_COPY_TO_CACHE) {
   173			if (netfs_pgpriv2_unlock_copied_folios(wreq))
   174				*notes |= MADE_PROGRESS;
   175			return;
   176		}
   177	
   178		wback = wreq->writebacks;
   179	
   180		for (;;) {
   181			uoff_t stop_at;
   182			size_t len;
   183	
   184			/* Jump over discontiguities. */
   185			if (wreq->cleaned_to < wback->start)
   186				wreq->cleaned_to = wback->start;
   187	
   188			if (wreq->collected_to <= wreq->cleaned_to)
   189				break;
   190	
   191			/* Order read of region length before reading folios. */
   192			len = smp_load_acquire(&wback->len);
   193	
   194			if (wreq->cleaned_to >= wback->start + len) {
   195				/* Order read of next before recheck length. */
   196				next = smp_load_acquire(&wback->next);
   197				if (!next)
   198					break; /* We don't remove the tail writeback. */
   199	
   200				/* Order read of region length before reading folios. */
   201				if (len != smp_load_acquire(&wback->len))
   202					continue; /* len/next update race. */
   203	
 > 204				mempool_free(wback, &netfs_bvecq_pool);
   205				wreq->writebacks = next;
   206				wback = next;
   207				continue;
   208			}
   209	
   210			stop_at = min(wreq->collected_to, wback->start + len);
   211	
   212			trace_netfs_collect_folios(wreq, wback->start, len);
   213			if (!folio_end_writeback_range(wreq->mapping, &wreq->cleaned_to, stop_at,
   214						       netfs_folio_written_back, wreq))
   215				break;
   216			*notes |= MADE_PROGRESS;
   217		}
   218	}
   219	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
