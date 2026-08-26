Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7502035F19D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735128; cv=none; b=ZVMMAzj9aOtvSV3ZOloaObIKlU3jE1D4dprEnOLLqYLIFok24Iu+wZcQCj2h/KDDGFTo0atZRLAe8f6Bp+Wiq3toILikSXPd2m0+kqOwXGQsJ3MYzNic0olO8xsahxmuqS8oKBOOWccCvW4YSTczII8varK/qoR25jCnSgNPkPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735128; c=relaxed/simple;
	bh=JgdON8awXQfTd/C0Mkfl9HBQxjc5zWCjsV68/aM6GSw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XuhVsJIMDtTRoCgH2IGkfr+ByvzSzN01AyYmjqp7Hmwfo2DrJYJTL7OD+8T/0sPMAQWRYnFouUO6ez84nlA6Wm/4qMZRliu1bDJKUOHfcPDq+wO+zgG1UvFRHB/XplRVSD18VdlRGd50HnwOg30VJ4QRbsayx6HLqGJJG7O56EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqrOR+rB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqrOR+rB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787735127; x=1819271127;
  h=date:from:to:cc:subject:message-id;
  bh=JgdON8awXQfTd/C0Mkfl9HBQxjc5zWCjsV68/aM6GSw=;
  b=dqrOR+rBJjh/9e1YMjGwZcHQN7nxscKCVIvFgrIK/EFp8AQdKIqkEHAg
   Mv5oSPRkg4eX9jEd5unVwTY1kGpPWNvslfxJUKJyJaA/87tUjTx0au8hT
   VL4IVGTi5WUyy+MwAzKYH6Vp3bshwH9UnW7w7GzLOqitnaid/V3pMlbpZ
   3cFkqtnujPe6oFAt86GtCzZBt2/i5cJcSgreOt+C0IJgpmJiRFLpJuQHW
   s1xt/pP6ychJnN0EFByzciYe+M3p9HtJLx0IKOcZALRBMdX5dNHZXwrO1
   nY7d/z8PvkOi24xmHbhiGrtVfeZwwoMdAfdhgxG2pOF1wkYCoZhflOfDc
   A==;
X-CSE-ConnectionGUID: fYnez1QUT7KmjS+E24btEA==
X-CSE-MsgGUID: HpPbsNkeSLGsmds1J+PZfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88132257"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88132257"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 02:05:26 -0700
X-CSE-ConnectionGUID: pr331+4dQQe5rYU1R2TU/A==
X-CSE-MsgGUID: 9Paq1lMtSnCH8NQ7TaK/6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="271021720"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Aug 2026 02:05:25 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wz9ZR-000000007E0-3bzi;
	Wed, 26 Aug 2026 09:05:22 +0000
Date: Wed, 26 Aug 2026 17:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 33/36]
 fs/netfs/write_collect.c:204:25: error: implicit declaration of function
 'mempool_free'
Message-ID: <202608261704.9BeQhK3r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8f0e78ba82ccca8613b01c5f0215f8ce7c7c5cf3
commit: e09967cf018fd9ee7f1324d6ccea2d0a5f6b0f46 [33/36] netfs: Rework writeback to use a separate list of regions to be unlocked
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260826/202608261704.9BeQhK3r-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608261704.9BeQhK3r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261704.9BeQhK3r-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/netfs/write_collect.c: In function 'netfs_writeback_unlock_folios':
>> fs/netfs/write_collect.c:204:25: error: implicit declaration of function 'mempool_free' [-Wimplicit-function-declaration]
     204 |                         mempool_free(wback, &netfs_bvecq_pool);
         |                         ^~~~~~~~~~~~
--
   fs/netfs/write_issue.c: In function 'netfs_writeback_folio':
>> fs/netfs/write_issue.c:795:25: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Wimplicit-function-declaration]
     795 |                 wback = mempool_alloc(&netfs_writeback_pool, wreq->gfp);
         |                         ^~~~~~~~~~~~~
         |                         mm_alloc
>> fs/netfs/write_issue.c:795:23: error: assignment to 'struct netfs_writeback *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     795 |                 wback = mempool_alloc(&netfs_writeback_pool, wreq->gfp);
         |                       ^


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
