Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C1F299944
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 02:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777774397; cv=none; b=oQybV2YOs2KdYHwWt4Y3eTfoQ2RWGzr6+rSuTUvVaRsD4awD8zrXI9+USCpJqKeWWp/8eYRySjeoTo9w/4GXMRGIWQQeHffhPmuxQG5b9h6VktKwQlymHHQQrMWJcb391j8U2mFp4fh/C6MscNIn7IKLsQyOJP4c19Z3uo+Ef+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777774397; c=relaxed/simple;
	bh=bDAE2kV4RTTi9V+0DohdTzgAc0yZRgdDpVSa7SISaLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OFAMEYlLfkzYVyeVJbBjh+pSbkIkCeRAl2x2AL9TkyaYFjUcaq3KCJ6lMKnQTtyqykvJ7MNDjD+L1BVsZPrDyeKLqzcBelKl9sEqnZoq8l+7uXtYBBI7NANOc5TXO54KwW2y2t/Z/SUBauqo56jQUiREr2UPOxrBX+G8A1S4qKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUiRV50i; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUiRV50i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777774394; x=1809310394;
  h=date:from:to:cc:subject:message-id;
  bh=bDAE2kV4RTTi9V+0DohdTzgAc0yZRgdDpVSa7SISaLM=;
  b=XUiRV50iXJORp9VHQnKIi6WYxx4xQyo5j7SwS1HqCRuVBfyt6MP3Jxzv
   gkQ6uOOHQjNfDnCge+pMBkVeljlTt9YlbtPDGr0p5rDaKzyUUWjLthWtT
   AhDZrApkjAWII+W9+MANrO51TadgG6/xHJl7nktX994CdYRNEMs7yAVpO
   QM5D+CAJu2rPhbWUyPiiP7riJz829+yYvw1pJFdclzz0vG70A1//kvusu
   XK0seQUBa1XqBIUykngi6e+ugx95UOgAE7O0nsOhJ1xQSwlO9lFkqJjtQ
   nqII7i8xsbTGiwPDaPKY2iOQVkwm0DiheEAZQV3DEe9/MwkuRSlhimq3s
   w==;
X-CSE-ConnectionGUID: fRIX48/IQzK1t+RkLWscEQ==
X-CSE-MsgGUID: pL+fPDumQICkGu28eaJjvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78582384"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78582384"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 19:13:13 -0700
X-CSE-ConnectionGUID: /XYU6vk3SYyBERzGhieWbg==
X-CSE-MsgGUID: VNvs/KkKTZijoBzDajvOkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="265548653"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 02 May 2026 19:13:12 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJMKU-000000005Qv-07po;
	Sun, 03 May 2026 02:13:10 +0000
Date: Sun, 03 May 2026 04:12:10 +0200
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 11/69] ../../../mm/vma.h:233:21: error:
 'struct vm_area_struct' has no member named 'vm_pteoff'; did you mean
 'vm_pgoff'?
Message-ID: <202605030410.vFOcLBYt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kiryl,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3453a5ad954365409373c2762ba237c7e31a623b
commit: f5f8a46a7c252a67e59b61ee475f5ef67c6b3988 [11/69] mm/vma: Use pteoff in vma_merge_struct and mmap_state
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260503/202605030410.vFOcLBYt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030410.vFOcLBYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030410.vFOcLBYt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from shared.h:12,
                    from main.c:3:
   ../../../mm/vma.h: In function 'vma_pte_offset':
>> ../../../mm/vma.h:233:21: error: 'struct vm_area_struct' has no member named 'vm_pteoff'; did you mean 'vm_pgoff'?
     233 |         return vma->vm_pteoff + ((addr - vma->vm_start) >> PTE_SHIFT);
         |                     ^~~~~~~~~
         |                     vm_pgoff
>> ../../../mm/vma.h:233:60: error: 'PTE_SHIFT' undeclared (first use in this function); did you mean 'PAGE_SHIFT'?
     233 |         return vma->vm_pteoff + ((addr - vma->vm_start) >> PTE_SHIFT);
         |                                                            ^~~~~~~~~
         |                                                            PAGE_SHIFT
   ../../../mm/vma.h:233:60: note: each undeclared identifier is reported only once for each function it appears in
   ../../../mm/vma.h: In function 'set_vma_from_desc':
   ../../../mm/vma.h:309:14: error: 'struct vm_area_struct' has no member named 'vm_pteoff'; did you mean 'vm_pgoff'?
     309 |         vma->vm_pteoff = desc->pteoff;
         |              ^~~~~~~~~
         |              vm_pgoff
>> ../../../mm/vma.h:309:32: error: 'struct vm_area_desc' has no member named 'pteoff'; did you mean 'pgoff'?
     309 |         vma->vm_pteoff = desc->pteoff;
         |                                ^~~~~~
         |                                pgoff
   In file included from main.c:10:
   ../../../mm/vma.c: In function 'can_vma_merge_before':
>> ../../../mm/vma.c:201:32: error: 'struct vm_area_struct' has no member named 'vm_pteoff'; did you mean 'vm_pgoff'?
     201 |                 if (vmg->next->vm_pteoff == vmg->pteoff + ptelen)
         |                                ^~~~~~~~~
         |                                vm_pgoff
   ../../../mm/vma.c: In function 'can_vma_merge_after':
   ../../../mm/vma.c:221:32: error: 'struct vm_area_struct' has no member named 'vm_pteoff'; did you mean 'vm_pgoff'?
     221 |                 if (vmg->prev->vm_pteoff + vma_pages(vmg->prev) == vmg->pteoff)
         |                                ^~~~~~~~~
         |                                vm_pgoff
   ../../../mm/vma.c: In function 'vma_merge_existing_range':
   ../../../mm/vma.c:922:37: error: 'struct vm_area_struct' has no member named 'vm_pteoff'; did you mean 'vm_pgoff'?
     922 |                 vmg->pteoff = prev->vm_pteoff;
         |                                     ^~~~~~~~~
         |                                     vm_pgoff
   ../../../mm/vma.c:941:37: error: 'struct vm_area_struct' has no member named 'vm_pteoff'; did you mean 'vm_pgoff'?
     941 |                 vmg->pteoff = prev->vm_pteoff;
         |                                     ^~~~~~~~~
         |                                     vm_pgoff
   ../../../mm/vma.c:964:45: error: 'struct vm_area_struct' has no member named 'vm_pteoff'; did you mean 'vm_pgoff'?
     964 |                         vmg->pteoff = next->vm_pteoff - ptelen;
         |                                             ^~~~~~~~~
         |                                             vm_pgoff
   ../../../mm/vma.c:970:47: error: 'struct vm_area_struct' has no member named 'vm_pteoff'; did you mean 'vm_pgoff'?
     970 |                         vmg->pteoff = middle->vm_pteoff;
         |                                               ^~~~~~~~~
         |                                               vm_pgoff
   ../../../mm/vma.c: In function 'vma_merge_new_range':
   ../../../mm/vma.c:1078:37: error: 'struct vm_area_struct' has no member named 'vm_pteoff'; did you mean 'vm_pgoff'?
    1078 |                 vmg->pteoff = prev->vm_pteoff;
         |                                     ^~~~~~~~~
         |                                     vm_pgoff
   ../../../mm/vma.c: In function 'set_desc_from_map':
>> ../../../mm/vma.c:2373:15: error: 'struct vm_area_desc' has no member named 'pteoff'; did you mean 'pgoff'?
    2373 |         desc->pteoff = map->pteoff;
         |               ^~~~~~
         |               pgoff
   ../../../mm/vma.c: In function 'call_mmap_prepare':
   ../../../mm/vma.c:2651:29: error: 'struct vm_area_desc' has no member named 'pteoff'; did you mean 'pgoff'?
    2651 |         map->pteoff = desc->pteoff;
         |                             ^~~~~~
         |                             pgoff
   In file included from main.c:13:
   tests/merge.c: In function 'vmg_set_range':
>> tests/merge.c:47:14: error: 'struct vma_merge_struct' has no member named 'pgoff'; did you mean 'pteoff'?
      47 |         vmg->pgoff = pgoff;
         |              ^~~~~
         |              pteoff
   tests/merge.c: In function 'test_simple_merge':
   tests/merge.c:109:18: error: 'struct vma_merge_struct' has no member named 'pgoff'; did you mean 'pteoff'?
     109 |                 .pgoff = 1,
         |                  ^~~~~
         |                  pteoff
>> tests/merge.c:109:26: error: initialization of 'struct file *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     109 |                 .pgoff = 1,
         |                          ^
   tests/merge.c:109:26: note: (near initialization for 'vmg.file')
   tests/merge.c: In function 'test_simple_expand':
   tests/merge.c:201:18: error: 'struct vma_merge_struct' has no member named 'pgoff'; did you mean 'pteoff'?
     201 |                 .pgoff = 0,
         |                  ^~~~~
         |                  pteoff
   ../../../mm/vma.h: In function 'vma_pte_offset':
>> ../../../mm/vma.h:234:1: warning: control reaches end of non-void function [-Wreturn-type]
     234 | }
         | ^
--
   In file included from shared.h:12,
                    from shared.c:3:
   ../../../mm/vma.h: In function 'vma_pte_offset':
>> ../../../mm/vma.h:233:21: error: 'struct vm_area_struct' has no member named 'vm_pteoff'; did you mean 'vm_pgoff'?
     233 |         return vma->vm_pteoff + ((addr - vma->vm_start) >> PTE_SHIFT);
         |                     ^~~~~~~~~
         |                     vm_pgoff
>> ../../../mm/vma.h:233:60: error: 'PTE_SHIFT' undeclared (first use in this function); did you mean 'PAGE_SHIFT'?
     233 |         return vma->vm_pteoff + ((addr - vma->vm_start) >> PTE_SHIFT);
         |                                                            ^~~~~~~~~
         |                                                            PAGE_SHIFT
   ../../../mm/vma.h:233:60: note: each undeclared identifier is reported only once for each function it appears in
   ../../../mm/vma.h: In function 'set_vma_from_desc':
   ../../../mm/vma.h:309:14: error: 'struct vm_area_struct' has no member named 'vm_pteoff'; did you mean 'vm_pgoff'?
     309 |         vma->vm_pteoff = desc->pteoff;
         |              ^~~~~~~~~
         |              vm_pgoff
>> ../../../mm/vma.h:309:32: error: 'struct vm_area_desc' has no member named 'pteoff'; did you mean 'pgoff'?
     309 |         vma->vm_pteoff = desc->pteoff;
         |                                ^~~~~~
         |                                pgoff

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
