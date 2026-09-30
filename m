Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F9E4FD269
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773164; cv=none; b=JL9cVoCjpfpYdGIqKV/kRUZk12Ds16D4UfiPoCzpPCQ75LMNdnt2iuxRTkY+68myQX7NNJSCNGk5UgSJKT39cdDl9xj2R0aw2JmffN4T0sp3Tma12wjc7FjFmLeg5YPokd5Eq4+Pqm62fGY0dvTkjWy/msT0oxLoYtEfVOOoCWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773164; c=relaxed/simple;
	bh=m2mcbdhM9+pEwGnD6CSs872xx5eFVdbk55xNt1pVzqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a+6yPx6ckaKjr+AG3hVEX9JBr5cr9hsLJaoFPQ7SAPvD36ZwjDMG6oazLWQWRzCMlm758OM9lbAQehvHMioFSUs67UI8Xj+S5bZVhbaBy+3gVdrRy9BVeUSBk+cQygF1pGDO6AgFKmktW68ZVMY8OatvUqmDO8ZOM61IyyV3tEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mk3GvgKK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mk3GvgKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790773157; x=1822309157;
  h=date:from:to:cc:subject:message-id;
  bh=m2mcbdhM9+pEwGnD6CSs872xx5eFVdbk55xNt1pVzqA=;
  b=Mk3GvgKKEKk4fFN47FnJzymReSY6G0v1xj1qySPjWjethdRiTr2hKkrV
   112TtIXlDxL5nt72Dk/GH+fxXqYIEjYpFM7EipduXtUeEdm1BDdvuJwmJ
   Skzq4UNIPjY6zHQi6TuO6e5Q52nhicVU5aomrgy9exDySbkrmxLAIwgin
   hXVgymIAZON6RhO/9HhQxxWGMXmkItuyRXcxI3rXTMVm1iLQ8nP0tbzwu
   9l8Ong5h7ACGAuIgYJl9u1iyJWSVHMTVSvrROIlV+yaAjGy1Ua0dCaNwW
   ZnpURQO+D34ruIYLBe+dooBhrnL3LQybbxEorX/sqoDYwbXCNItYLiWN8
   A==;
X-CSE-ConnectionGUID: 6NTSJrtYRkC3j317+hAFOA==
X-CSE-MsgGUID: in0ksNpWRfSpXJLuSsqtyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95318923"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="95318923"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 05:59:13 -0700
X-CSE-ConnectionGUID: Pi3fpwffSCijWegVo4tbNQ==
X-CSE-MsgGUID: 4aWlIjOdQfGYwhFpIiNITw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2026 05:59:11 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBtts-000000001sF-3PVP;
	Wed, 30 Sep 2026 12:59:08 +0000
Date: Wed, 30 Sep 2026 14:59:04 +0200
From: kernel test robot <lkp@intel.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ivan Kokshaysky <ink@unseen.parts>
Subject: arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse:
 cast from non-scalar
Message-ID: <202609301402.L4Se7GUE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   551c722f40809618230001baccf219193e22fc5a
commit: dd5712f3379cfe760267cdd28ff957d9ab4e51c7 alpha: fix user-space corruption during memory compaction
date:   8 months ago
config: alpha-randconfig-r2300-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301402.L4Se7GUE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301402.L4Se7GUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dd5712f3379c ("alpha: fix user-space corruption during memory compaction")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301402.L4Se7GUE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/mprotect.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, include/linux/pagewalk.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
   include/linux/pgtable.h:354:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
--
   mm/mremap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/mremap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/mremap.c:313:18: sparse: sparse: context imbalance in 'move_ptes' - unexpected unlock
--
   mm/userfaultfd.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c:238:9: sparse: sparse: context imbalance in 'mfill_atomic_install_pte' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c:380:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_zeropage' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c:462:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_poison' - different lock contexts for basic block
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c:1506:26: sparse: sparse: context imbalance in 'move_pages_ptes' - unexpected unlock
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
--
   mm/vmalloc.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/vmalloc.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/vmalloc.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/vmalloc.c:1128:25: sparse: sparse: context imbalance in 'find_vmap_area_exceed_addr_lock' - wrong count at exit
   mm/vmalloc.c:4671:28: sparse: sparse: context imbalance in 'vread_iter' - unexpected unlock
--
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'folio_referenced_one' - unexpected unlock
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'try_to_unmap_one' - unexpected unlock
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'try_to_migrate_one' - unexpected unlock
--
   mm/memory.c:165:15: sparse: sparse: symbol 'zero_pfn' was not declared. Should it be static?
   mm/memory.c:876:38: sparse: sparse: cast to non-scalar
   mm/memory.c:876:38: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:361:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:361:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:1331:9: sparse: sparse: context imbalance in 'copy_pte_range' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:2220:16: sparse: sparse: context imbalance in '__get_locked_pte' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:2326:9: sparse: sparse: context imbalance in 'insert_page' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:2611:9: sparse: sparse: context imbalance in 'insert_pfn' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:3193:17: sparse: sparse: context imbalance in 'apply_to_pte_range' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c:3826:42: sparse: sparse: context imbalance in 'wp_page_copy' - different lock contexts for basic block
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:3865:19: sparse: sparse: context imbalance in 'finish_mkwrite_fault' - different lock contexts for basic block
   mm/memory.c:3896:17: sparse: sparse: context imbalance in 'wp_pfn_shared' - unexpected unlock
   mm/memory.c:3922:17: sparse: sparse: context imbalance in 'wp_page_shared' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4088:19: sparse: sparse: context imbalance in 'do_wp_page' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4350:9: sparse: sparse: context imbalance in 'remove_device_exclusive_entry' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4376:19: sparse: sparse: context imbalance in 'pte_marker_clear' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4621:12: sparse: sparse: context imbalance in 'do_swap_page' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:5280:9: sparse: sparse: context imbalance in 'do_anonymous_page' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:5512:12: sparse: sparse: context imbalance in 'finish_fault' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:5896:9: sparse: sparse: context imbalance in 'do_fault' - different lock contexts for basic block
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:6025:17: sparse: sparse: context imbalance in 'do_numa_page' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:6301:9: sparse: sparse: context imbalance in 'handle_pte_fault' - unexpected unlock
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:361:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:361:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:6743:5: sparse: sparse: context imbalance in 'follow_pfnmap_start' - different lock contexts for basic block
   mm/memory.c:6829:28: sparse: sparse: context imbalance in 'follow_pfnmap_end' - unexpected unlock

vim +278 arch/alpha/include/asm/pgtable.h

   273	
   274	static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
   275						unsigned long address,
   276						pte_t *ptep)
   277	{
 > 278		pte_t pte = READ_ONCE(*ptep);
   279	
   280		pte_clear(mm, address, ptep);
   281		return pte;
   282	}
   283	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
