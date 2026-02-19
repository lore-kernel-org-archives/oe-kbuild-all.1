Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9380733A713
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 12:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771505798; cv=none; b=bEHHaeDEAXvppAhDxak87cX2ubfb+x+/b7DJLRzA/lrU6mmIUL9uYcQEIZApNoDZhyGE4YlUd+6bT7403NDxDHdmo98g9Nyafqy68j5MXTFG4ZRELwWAqDMq9f3kq5PgG2Aa8p92xE1lRmkoqTtCojy1pU2YQUDSXabm9Csv3mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771505798; c=relaxed/simple;
	bh=gTR2le4v3tGhooRWWasg0QCwFD6WZWZRKR8oh6ut/C0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sfQxD3/8rTImIl3s2rgmrd50d40ZUPjs3AFHDyfKSY1PHnldT6P2oBT6pFblXqjJRhyL3y0QrIYJmpxNqW9lWheOWcp1RghtlmXWqXQK+T2kBM4+r8DE/o0tICXtIiTmwhhgS/eNIbXgNwyrx0WlZ/CIZwV+gj7a9kTOJ4h9w9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQYHeggV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQYHeggV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771505795; x=1803041795;
  h=date:from:to:cc:subject:message-id;
  bh=gTR2le4v3tGhooRWWasg0QCwFD6WZWZRKR8oh6ut/C0=;
  b=KQYHeggVVodMyi+XCUbDWG8v0zb6fY2T+4aoZtUq7wqURBsG3k9eC3Q4
   gXO3iGFNbd/16NGtCNyDVjLh64FrgI7HLYJRVrsL7w5sHyLIBWiddjlOv
   I7nbwq4sPcgGZkPegesVqLTx41WgSnQcqnQ9BrCso08daLWq1rBa9gcxc
   oLlQBDVp/kEmbaV0/M4TkQBl05o5rf0issa8OxCoEJU62gdGsEgVtos5h
   Si5T1oJhgUmPIX1xgN8lpPtFRt+51o3wpcFRD5RI4+P2iR2zbkCJJf3fs
   naKAPFM6IwZOrn09iYMbFkjg4W0JuPNszPTszsGGYg19nbGeVG31FnSBV
   A==;
X-CSE-ConnectionGUID: gQF5qY8LRFan0P3kmxjoFg==
X-CSE-MsgGUID: B066Mq/XR2SWx5BV3ekP6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72293683"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72293683"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 04:56:34 -0800
X-CSE-ConnectionGUID: KVX7P26pRausyNyFxETxXw==
X-CSE-MsgGUID: 9MC+Bw+dQDyZoV3XGME7vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="214613332"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Feb 2026 04:56:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vt3a1-000000013CO-3Hmi;
	Thu, 19 Feb 2026 12:56:29 +0000
Date: Thu, 19 Feb 2026 20:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ivan Kokshaysky <ink@unseen.parts>
Subject: arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse:
 cast to non-scalar
Message-ID: <202602192031.nhgvoxLf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b7a25df823dc7d8f56f8ce7c2d2dac391cea9c2
commit: dd5712f3379cfe760267cdd28ff957d9ab4e51c7 alpha: fix user-space corruption during memory compaction
date:   4 weeks ago
config: alpha-randconfig-r111-20260219 (https://download.01.org/0day-ci/archive/20260219/202602192031.nhgvoxLf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602192031.nhgvoxLf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602192031.nhgvoxLf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/mprotect.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, include/linux/pagewalk.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
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
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/mremap.c:313:18: sparse: sparse: context imbalance in 'move_ptes' - unexpected unlock
--
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'folio_referenced_one' - unexpected unlock
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
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
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'try_to_migrate_one' - unexpected unlock
--
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
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, ...):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, ...):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, ...):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
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
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, ...):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
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
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, ...):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
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
--
   mm/madvise.c: note: in included file (through include/linux/mm.h, include/linux/mman.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/madvise.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, include/linux/mman.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/madvise.c:562:9: sparse: sparse: context imbalance in 'madvise_cold_or_pageout_pte_range' - different lock contexts for basic block
   mm/madvise.c: note: in included file (through include/linux/mm.h, include/linux/mman.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/madvise.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, include/linux/mman.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/madvise.c:781:9: sparse: sparse: context imbalance in 'madvise_free_pte_range' - different lock contexts for basic block
   mm/madvise.c: note: in included file (through include/linux/mm.h, include/linux/mman.h):
   include/linux/pgtable.h:354:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
--
   mm/ksm.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/ksm.c:816:17: sparse: sparse: context imbalance in 'get_mergeable_page' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/ksm.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/ksm.c: note: in included file:
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'write_protect_page' - unexpected unlock
   mm/ksm.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/ksm.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/ksm.c:1461:42: sparse: sparse: context imbalance in 'replace_page' - different lock contexts for basic block
   mm/ksm.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/ksm.c:2563:9: sparse: sparse: context imbalance in 'ksm_next_page_pmd_entry' - different lock contexts for basic block
--
   mm/vmalloc.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/vmalloc.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/vmalloc.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/vmalloc.c:1128:25: sparse: sparse: context imbalance in 'find_vmap_area_exceed_addr_lock' - wrong count at exit
   mm/vmalloc.c:4671:28: sparse: sparse: context imbalance in 'vread_iter' - unexpected unlock

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
