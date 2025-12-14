Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F88928314E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 02:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765681064; cv=none; b=JRWAcyv7m27NCDoxM0iasAqljEc4pFNVEzJRcQ2tpiBLWKmJU1lKffzYb3k947ac0T19/u//HiT0sWJhuUvYY44h6X3Qqw9DxrRe68gCowIPwU+od+bJ7aE5Ei42AkYjYcRgghfXmDmW0A20xFD5Sl4dHLGHclCmTbU1rI+RSUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765681064; c=relaxed/simple;
	bh=ZfQ/YQ7l+5Fg5VQBb7V7Zs46lho5rvw7OkSRL0jfS24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HTfAG0uOBY5UL+QciPm5gz7pv6Zyslwh4HS6VFMmUQemBC4fDsjeldXDbqNTl4y8ibjZax3D8J/SfI5+rpshzRQILhIC6tkhklrzgZMxRykQZwqJVsYJGP0SzpUJJf8LiGKlwrH2/0tvk0ISwzz/B0LsoUt5JSJmVaMHVqRU8uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YY9xZq9d; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YY9xZq9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765681062; x=1797217062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZfQ/YQ7l+5Fg5VQBb7V7Zs46lho5rvw7OkSRL0jfS24=;
  b=YY9xZq9dpJh1Z2EGxy9OXybKBvk0Oohv0CF9ME/UsilJBTpkXdEUmP0u
   KYzIkBwpoCwv82z2CVP/wrmoXX8OV9a7LU5+3qlNJPmWzAy2DrbdOl9nG
   Q5OqYptbdhddzN6FdGBX4nQ+lY/qYRb1ckibHXCM5WgDHEydX+wa6E9cC
   k8IbQsboDW5FcQSkcG6ur1zZdV6xRR+ELm7Ie/IQLd5851SlysKIxtULr
   HSFNcQZh/wNZ7+xPfem/0mihLcq7r6Wf0VCiyG0h1jZ4z0/5TXsr1OHq9
   SZZN7oBT+FvOHmQyJkbW+vXF5ycVhKg/VskuNmVHaVe6nQHG2eCDwrdrn
   A==;
X-CSE-ConnectionGUID: YFoBIfUbRFehLZOqwjHCGA==
X-CSE-MsgGUID: ONz4ACXCSZGT8ki9Vk7rCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67569570"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67569570"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 18:57:42 -0800
X-CSE-ConnectionGUID: E+A/EDkXR16TF1ZSI4kGpw==
X-CSE-MsgGUID: wH2ue8q7QrmgWPHYjzOFgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197427584"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 18:57:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUcIk-000000008UH-0lrw;
	Sun, 14 Dec 2025 02:57:38 +0000
Date: Sun, 14 Dec 2025 10:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3540/3540] kernel/dma/phytium/pswiotlb.c:1159:6:
 warning: variable 'cpuid' set but not used
Message-ID: <202512141034.7ERZ0sjF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiakun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 03479a75f63bef0dca7ec44c1e1a7e8c45201aed [3540/3540] dma: Fix kabi breakage due to "dma: phytium: Add PSWIOTLB mechanism to improve DMA performance"
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512141034.7ERZ0sjF-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141034.7ERZ0sjF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141034.7ERZ0sjF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/phytium/pswiotlb.c:1159:6: warning: variable 'cpuid' set but not used [-Wunused-but-set-variable]
    1159 |         int cpuid;
         |             ^
   1 warning generated.
--
>> kernel/dma/phytium/pswiotlb.c:474: warning: Function parameter or member 'nid' not described in 'pswiotlb_alloc_tlb'
>> kernel/dma/phytium/pswiotlb.c:533: warning: Function parameter or member 'nid' not described in 'pswiotlb_alloc_pool'
>> kernel/dma/phytium/pswiotlb.c:533: warning: Function parameter or member 'transient' not described in 'pswiotlb_alloc_pool'
>> kernel/dma/phytium/pswiotlb.c:806: warning: Function parameter or member 'nid' not described in 'alloc_dma_pages'
>> kernel/dma/phytium/pswiotlb.c:836: warning: Function parameter or member 'nid' not described in 'pswiotlb_find_pool'
>> kernel/dma/phytium/pswiotlb.c:1005: warning: Function parameter or member 'nid' not described in 'pswiotlb_area_find_slots'
>> kernel/dma/phytium/pswiotlb.c:1115: warning: Function parameter or member 'nid' not described in 'pswiotlb_pool_find_slots'
>> kernel/dma/phytium/pswiotlb.c:1153: warning: Function parameter or member 'nid' not described in 'pswiotlb_find_slots'
>> kernel/dma/phytium/pswiotlb.c:1523: warning: Function parameter or member 'dev' not described in 'is_pswiotlb_allocated'
>> kernel/dma/phytium/pswiotlb.c:1542: warning: Function parameter or member 'dev' not described in 'default_pswiotlb_base'
>> kernel/dma/phytium/pswiotlb.c:1556: warning: Function parameter or member 'dev' not described in 'default_pswiotlb_limit'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_FEATURE_BYPASS
   Depends on [n]: (FAST_SYSCALL [=y] || FAST_IRQ [=y]) && !LOCKDEP [=y]
   Selected by [y]:
   - FAST_SYSCALL [=y]
   - FAST_IRQ [=y] && ARM_GIC_V3 [=y]
   WARNING: unmet direct dependencies detected for SECURITY_FEATURE_BYPASS
   Depends on [n]: !ARM64_MTE [=y] && !KASAN_HW_TAGS [=n] && (FAST_SYSCALL [=y] || FAST_IRQ [=y])
   Selected by [y]:
   - FAST_SYSCALL [=y]
   - FAST_IRQ [=y] && ARM_GIC_V3 [=y]


vim +/cpuid +1159 kernel/dma/phytium/pswiotlb.c

81a243170f720e Jiakun Shuai 2025-07-07   985  
81a243170f720e Jiakun Shuai 2025-07-07   986  /**
81a243170f720e Jiakun Shuai 2025-07-07   987   * pswiotlb_area_find_slots() - search for slots in one Phytium IO TLB memory area
81a243170f720e Jiakun Shuai 2025-07-07   988   * @dev:	Device which maps the buffer.
81a243170f720e Jiakun Shuai 2025-07-07   989   * @pool:	Memory pool to be searched.
81a243170f720e Jiakun Shuai 2025-07-07   990   * @area_index:	Index of the Phytium IO TLB memory area to be searched.
81a243170f720e Jiakun Shuai 2025-07-07   991   * @orig_addr:	Original (non-bounced) Phytium IO buffer address.
81a243170f720e Jiakun Shuai 2025-07-07   992   * @alloc_size: Total requested size of the bounce buffer,
81a243170f720e Jiakun Shuai 2025-07-07   993   *		including initial alignment padding.
81a243170f720e Jiakun Shuai 2025-07-07   994   * @alloc_align_mask:	Required alignment of the allocated buffer.
81a243170f720e Jiakun Shuai 2025-07-07   995   *
81a243170f720e Jiakun Shuai 2025-07-07   996   * Find a suitable sequence of Phytium IO TLB entries for the request and allocate
81a243170f720e Jiakun Shuai 2025-07-07   997   * a buffer from the given Phytium IO TLB memory area.
81a243170f720e Jiakun Shuai 2025-07-07   998   * This function takes care of locking.
81a243170f720e Jiakun Shuai 2025-07-07   999   *
81a243170f720e Jiakun Shuai 2025-07-07  1000   * Return: Index of the first allocated slot, or -1 on error.
81a243170f720e Jiakun Shuai 2025-07-07  1001   */
81a243170f720e Jiakun Shuai 2025-07-07  1002  static int pswiotlb_area_find_slots(struct device *dev, int nid, struct p_io_tlb_pool *pool,
81a243170f720e Jiakun Shuai 2025-07-07  1003  		int area_index, phys_addr_t orig_addr, size_t alloc_size,
81a243170f720e Jiakun Shuai 2025-07-07  1004  		unsigned int alloc_align_mask)
81a243170f720e Jiakun Shuai 2025-07-07 @1005  {
81a243170f720e Jiakun Shuai 2025-07-07  1006  	struct p_io_tlb_area *area = pool->areas + area_index;
81a243170f720e Jiakun Shuai 2025-07-07  1007  	unsigned long boundary_mask = dma_get_seg_boundary(dev);
81a243170f720e Jiakun Shuai 2025-07-07  1008  	dma_addr_t tbl_dma_addr =
81a243170f720e Jiakun Shuai 2025-07-07  1009  		phys_to_dma_unencrypted(dev, pool->start) & boundary_mask;
81a243170f720e Jiakun Shuai 2025-07-07  1010  	unsigned long max_slots = get_max_slots(boundary_mask);
81a243170f720e Jiakun Shuai 2025-07-07  1011  	unsigned int iotlb_align_mask =
81a243170f720e Jiakun Shuai 2025-07-07  1012  		dma_get_min_align_mask(dev) | alloc_align_mask;
81a243170f720e Jiakun Shuai 2025-07-07  1013  	unsigned int nslots = nr_slots(alloc_size), stride;
81a243170f720e Jiakun Shuai 2025-07-07  1014  	unsigned int offset = pswiotlb_align_offset(dev, orig_addr);
81a243170f720e Jiakun Shuai 2025-07-07  1015  	unsigned int index, slots_checked, count = 0, i;
81a243170f720e Jiakun Shuai 2025-07-07  1016  	unsigned long flags;
81a243170f720e Jiakun Shuai 2025-07-07  1017  	unsigned int slot_base;
81a243170f720e Jiakun Shuai 2025-07-07  1018  	unsigned int slot_index;
81a243170f720e Jiakun Shuai 2025-07-07  1019  
81a243170f720e Jiakun Shuai 2025-07-07  1020  	WARN_ON(!nslots);
81a243170f720e Jiakun Shuai 2025-07-07  1021  	WARN_ON(area_index >= pool->nareas);
81a243170f720e Jiakun Shuai 2025-07-07  1022  
81a243170f720e Jiakun Shuai 2025-07-07  1023  	/*
81a243170f720e Jiakun Shuai 2025-07-07  1024  	 * For allocations of PAGE_SIZE or larger only look for page aligned
81a243170f720e Jiakun Shuai 2025-07-07  1025  	 * allocations.
81a243170f720e Jiakun Shuai 2025-07-07  1026  	 */
81a243170f720e Jiakun Shuai 2025-07-07  1027  	if (alloc_size >= PAGE_SIZE)
81a243170f720e Jiakun Shuai 2025-07-07  1028  		iotlb_align_mask |= ~PAGE_MASK;
81a243170f720e Jiakun Shuai 2025-07-07  1029  	iotlb_align_mask &= ~(P_IO_TLB_SIZE - 1);
81a243170f720e Jiakun Shuai 2025-07-07  1030  
81a243170f720e Jiakun Shuai 2025-07-07  1031  	/*
81a243170f720e Jiakun Shuai 2025-07-07  1032  	 * For mappings with an alignment requirement don't bother looping to
81a243170f720e Jiakun Shuai 2025-07-07  1033  	 * unaligned slots once we found an aligned one.
81a243170f720e Jiakun Shuai 2025-07-07  1034  	 */
81a243170f720e Jiakun Shuai 2025-07-07  1035  	stride = (iotlb_align_mask >> P_IO_TLB_SHIFT) + 1;
81a243170f720e Jiakun Shuai 2025-07-07  1036  
81a243170f720e Jiakun Shuai 2025-07-07  1037  	if (spin_trylock_irqsave(&area->lock, flags)) {
81a243170f720e Jiakun Shuai 2025-07-07  1038  		if (unlikely(nslots > pool->area_nslabs - area->used))
81a243170f720e Jiakun Shuai 2025-07-07  1039  			goto not_found;
81a243170f720e Jiakun Shuai 2025-07-07  1040  
81a243170f720e Jiakun Shuai 2025-07-07  1041  		slot_base = area_index * pool->area_nslabs;
81a243170f720e Jiakun Shuai 2025-07-07  1042  		index = area->index;
81a243170f720e Jiakun Shuai 2025-07-07  1043  
81a243170f720e Jiakun Shuai 2025-07-07  1044  		for (slots_checked = 0; slots_checked < pool->area_nslabs;) {
81a243170f720e Jiakun Shuai 2025-07-07  1045  			slot_index = slot_base + index;
81a243170f720e Jiakun Shuai 2025-07-07  1046  
81a243170f720e Jiakun Shuai 2025-07-07  1047  			if (orig_addr &&
81a243170f720e Jiakun Shuai 2025-07-07  1048  				 (slot_addr(tbl_dma_addr, slot_index) &
81a243170f720e Jiakun Shuai 2025-07-07  1049  				 iotlb_align_mask) != (orig_addr & iotlb_align_mask)) {
81a243170f720e Jiakun Shuai 2025-07-07  1050  				index = wrap_area_index(pool, index + 1);
81a243170f720e Jiakun Shuai 2025-07-07  1051  				slots_checked++;
81a243170f720e Jiakun Shuai 2025-07-07  1052  				continue;
81a243170f720e Jiakun Shuai 2025-07-07  1053  			}
81a243170f720e Jiakun Shuai 2025-07-07  1054  
81a243170f720e Jiakun Shuai 2025-07-07  1055  			if (!iommu_is_span_boundary(slot_index, nslots,
81a243170f720e Jiakun Shuai 2025-07-07  1056  						    nr_slots(tbl_dma_addr),
81a243170f720e Jiakun Shuai 2025-07-07  1057  						    max_slots)) {
81a243170f720e Jiakun Shuai 2025-07-07  1058  				if (pool->slots[slot_index].list >= nslots)
81a243170f720e Jiakun Shuai 2025-07-07  1059  					goto found;
81a243170f720e Jiakun Shuai 2025-07-07  1060  			}
81a243170f720e Jiakun Shuai 2025-07-07  1061  			index = wrap_area_index(pool, index + stride);
81a243170f720e Jiakun Shuai 2025-07-07  1062  			slots_checked += stride;
81a243170f720e Jiakun Shuai 2025-07-07  1063  		}
81a243170f720e Jiakun Shuai 2025-07-07  1064  	} else {
81a243170f720e Jiakun Shuai 2025-07-07  1065  		return -1;
81a243170f720e Jiakun Shuai 2025-07-07  1066  	}
81a243170f720e Jiakun Shuai 2025-07-07  1067  
81a243170f720e Jiakun Shuai 2025-07-07  1068  not_found:
81a243170f720e Jiakun Shuai 2025-07-07  1069  	spin_unlock_irqrestore(&area->lock, flags);
81a243170f720e Jiakun Shuai 2025-07-07  1070  	return -1;
81a243170f720e Jiakun Shuai 2025-07-07  1071  
81a243170f720e Jiakun Shuai 2025-07-07  1072  found:
81a243170f720e Jiakun Shuai 2025-07-07  1073  	/*
81a243170f720e Jiakun Shuai 2025-07-07  1074  	 * If we find a slot that indicates we have 'nslots' number of
81a243170f720e Jiakun Shuai 2025-07-07  1075  	 * contiguous buffers, we allocate the buffers from that slot onwards
81a243170f720e Jiakun Shuai 2025-07-07  1076  	 * and set the list of free entries to '0' indicating unavailable.
81a243170f720e Jiakun Shuai 2025-07-07  1077  	 */
81a243170f720e Jiakun Shuai 2025-07-07  1078  	for (i = slot_index; i < slot_index + nslots; i++) {
81a243170f720e Jiakun Shuai 2025-07-07  1079  		pool->slots[i].list = 0;
81a243170f720e Jiakun Shuai 2025-07-07  1080  		pool->slots[i].alloc_size = alloc_size - (offset +
81a243170f720e Jiakun Shuai 2025-07-07  1081  				((i - slot_index) << P_IO_TLB_SHIFT));
81a243170f720e Jiakun Shuai 2025-07-07  1082  	}
81a243170f720e Jiakun Shuai 2025-07-07  1083  	for (i = slot_index - 1;
81a243170f720e Jiakun Shuai 2025-07-07  1084  	     io_tlb_offset(i) != P_IO_TLB_SEGSIZE - 1 &&
81a243170f720e Jiakun Shuai 2025-07-07  1085  	     pool->slots[i].list; i--)
81a243170f720e Jiakun Shuai 2025-07-07  1086  		pool->slots[i].list = ++count;
81a243170f720e Jiakun Shuai 2025-07-07  1087  
81a243170f720e Jiakun Shuai 2025-07-07  1088  	/*
81a243170f720e Jiakun Shuai 2025-07-07  1089  	 * Update the indices to avoid searching in the next round.
81a243170f720e Jiakun Shuai 2025-07-07  1090  	 */
81a243170f720e Jiakun Shuai 2025-07-07  1091  	area->index = wrap_area_index(pool, index + nslots);
81a243170f720e Jiakun Shuai 2025-07-07  1092  	area->used += nslots;
81a243170f720e Jiakun Shuai 2025-07-07  1093  	spin_unlock_irqrestore(&area->lock, flags);
81a243170f720e Jiakun Shuai 2025-07-07  1094  
81a243170f720e Jiakun Shuai 2025-07-07  1095  	return slot_index;
81a243170f720e Jiakun Shuai 2025-07-07  1096  }
81a243170f720e Jiakun Shuai 2025-07-07  1097  
81a243170f720e Jiakun Shuai 2025-07-07  1098  /**
81a243170f720e Jiakun Shuai 2025-07-07  1099   * pswiotlb_pool_find_slots() - search for slots in one memory pool
81a243170f720e Jiakun Shuai 2025-07-07  1100   * @dev:	Device which maps the buffer.
81a243170f720e Jiakun Shuai 2025-07-07  1101   * @pool:	Memory pool to be searched.
81a243170f720e Jiakun Shuai 2025-07-07  1102   * @orig_addr:	Original (non-bounced)Phytium  IO buffer address.
81a243170f720e Jiakun Shuai 2025-07-07  1103   * @alloc_size: Total requested size of the bounce buffer,
81a243170f720e Jiakun Shuai 2025-07-07  1104   *		including initial alignment padding.
81a243170f720e Jiakun Shuai 2025-07-07  1105   * @alloc_align_mask:	Required alignment of the allocated buffer.
81a243170f720e Jiakun Shuai 2025-07-07  1106   *
81a243170f720e Jiakun Shuai 2025-07-07  1107   * Search through one memory pool to find a sequence of slots that match the
81a243170f720e Jiakun Shuai 2025-07-07  1108   * allocation constraints.
81a243170f720e Jiakun Shuai 2025-07-07  1109   *
81a243170f720e Jiakun Shuai 2025-07-07  1110   * Return: Index of the first allocated slot, or -1 on error.
81a243170f720e Jiakun Shuai 2025-07-07  1111   */
81a243170f720e Jiakun Shuai 2025-07-07  1112  static int pswiotlb_pool_find_slots(struct device *dev, int nid, struct p_io_tlb_pool *pool,
81a243170f720e Jiakun Shuai 2025-07-07  1113  		phys_addr_t orig_addr, size_t alloc_size,
81a243170f720e Jiakun Shuai 2025-07-07  1114  		unsigned int alloc_align_mask)
81a243170f720e Jiakun Shuai 2025-07-07 @1115  {
81a243170f720e Jiakun Shuai 2025-07-07  1116  	int start = raw_smp_processor_id() & (pool->nareas - 1);
81a243170f720e Jiakun Shuai 2025-07-07  1117  	int i = start, index;
81a243170f720e Jiakun Shuai 2025-07-07  1118  
81a243170f720e Jiakun Shuai 2025-07-07  1119  	do {
81a243170f720e Jiakun Shuai 2025-07-07  1120  		index = pswiotlb_area_find_slots(dev, nid, pool, i, orig_addr,
81a243170f720e Jiakun Shuai 2025-07-07  1121  						alloc_size, alloc_align_mask);
81a243170f720e Jiakun Shuai 2025-07-07  1122  		if (index >= 0) {
81a243170f720e Jiakun Shuai 2025-07-07  1123  			if ((pool != &p_io_tlb_default_mem[nid].defpool) &&
81a243170f720e Jiakun Shuai 2025-07-07  1124  						!pool->transient) {
81a243170f720e Jiakun Shuai 2025-07-07  1125  				bitmap_set(pool->busy_record, i, 1);
81a243170f720e Jiakun Shuai 2025-07-07  1126  			}
81a243170f720e Jiakun Shuai 2025-07-07  1127  			return index;
81a243170f720e Jiakun Shuai 2025-07-07  1128  		}
81a243170f720e Jiakun Shuai 2025-07-07  1129  		if (++i >= pool->nareas)
81a243170f720e Jiakun Shuai 2025-07-07  1130  			i = 0;
81a243170f720e Jiakun Shuai 2025-07-07  1131  	} while (i != start);
81a243170f720e Jiakun Shuai 2025-07-07  1132  
81a243170f720e Jiakun Shuai 2025-07-07  1133  	return -1;
81a243170f720e Jiakun Shuai 2025-07-07  1134  }
81a243170f720e Jiakun Shuai 2025-07-07  1135  
81a243170f720e Jiakun Shuai 2025-07-07  1136  /**
81a243170f720e Jiakun Shuai 2025-07-07  1137   * pswiotlb_find_slots() - search for slots in the whole pswiotlb
81a243170f720e Jiakun Shuai 2025-07-07  1138   * @dev:	Device which maps the buffer.
81a243170f720e Jiakun Shuai 2025-07-07  1139   * @orig_addr:	Original (non-bounced) Phytium IO buffer address.
81a243170f720e Jiakun Shuai 2025-07-07  1140   * @alloc_size: Total requested size of the bounce buffer,
81a243170f720e Jiakun Shuai 2025-07-07  1141   *		including initial alignment padding.
81a243170f720e Jiakun Shuai 2025-07-07  1142   * @alloc_align_mask:	Required alignment of the allocated buffer.
81a243170f720e Jiakun Shuai 2025-07-07  1143   * @retpool:	Used memory pool, updated on return.
81a243170f720e Jiakun Shuai 2025-07-07  1144   *
81a243170f720e Jiakun Shuai 2025-07-07  1145   * Search through the whole Phytium software IO TLB to find a sequence of slots that
81a243170f720e Jiakun Shuai 2025-07-07  1146   * match the allocation constraints.
81a243170f720e Jiakun Shuai 2025-07-07  1147   *
81a243170f720e Jiakun Shuai 2025-07-07  1148   * Return: Index of the first allocated slot, or -1 on error.
81a243170f720e Jiakun Shuai 2025-07-07  1149   */
81a243170f720e Jiakun Shuai 2025-07-07  1150  static int pswiotlb_find_slots(struct device *dev, int nid, phys_addr_t orig_addr,
81a243170f720e Jiakun Shuai 2025-07-07  1151  		size_t alloc_size, unsigned int alloc_align_mask,
81a243170f720e Jiakun Shuai 2025-07-07  1152  		struct p_io_tlb_pool **retpool)
81a243170f720e Jiakun Shuai 2025-07-07 @1153  {
81a243170f720e Jiakun Shuai 2025-07-07  1154  	struct p_io_tlb_mem *mem = &dev->dma_p_io_tlb_mem[nid];
81a243170f720e Jiakun Shuai 2025-07-07  1155  	struct p_io_tlb_pool *pool;
81a243170f720e Jiakun Shuai 2025-07-07  1156  	int index;
81a243170f720e Jiakun Shuai 2025-07-07  1157  	int try_pool_idx;
81a243170f720e Jiakun Shuai 2025-07-07  1158  	int i;
81a243170f720e Jiakun Shuai 2025-07-07 @1159  	int cpuid;
81a243170f720e Jiakun Shuai 2025-07-07  1160  	int current_ratio;
81a243170f720e Jiakun Shuai 2025-07-07  1161  	unsigned long pswiotlb_mem;
81a243170f720e Jiakun Shuai 2025-07-07  1162  	unsigned long nslabs_per_pool = dynamic_inc_thr_npslabs;
81a243170f720e Jiakun Shuai 2025-07-07  1163  
81a243170f720e Jiakun Shuai 2025-07-07  1164  	cpuid = raw_smp_processor_id();
81a243170f720e Jiakun Shuai 2025-07-07  1165  
81a243170f720e Jiakun Shuai 2025-07-07  1166  	rcu_read_lock();
81a243170f720e Jiakun Shuai 2025-07-07  1167  #ifndef CONFIG_ARM64_4K_PAGES
81a243170f720e Jiakun Shuai 2025-07-07  1168  	for (i = 0; i < 15; i++) {
81a243170f720e Jiakun Shuai 2025-07-07  1169  		if (i == 0) {
81a243170f720e Jiakun Shuai 2025-07-07  1170  			pool = mem->pool_addr[0];
81a243170f720e Jiakun Shuai 2025-07-07  1171  			index = pswiotlb_pool_find_slots(dev, nid, pool, orig_addr,
81a243170f720e Jiakun Shuai 2025-07-07  1172  						alloc_size, alloc_align_mask);
81a243170f720e Jiakun Shuai 2025-07-07  1173  		} else if (i == 1 && mem->capacity > (cpuid + 1)) {
81a243170f720e Jiakun Shuai 2025-07-07  1174  			pool = mem->pool_addr[cpuid + 1];
81a243170f720e Jiakun Shuai 2025-07-07  1175  			index = pswiotlb_pool_find_slots(dev, nid, pool, orig_addr,
81a243170f720e Jiakun Shuai 2025-07-07  1176  						alloc_size, alloc_align_mask);
81a243170f720e Jiakun Shuai 2025-07-07  1177  		} else {
81a243170f720e Jiakun Shuai 2025-07-07  1178  			try_pool_idx = get_random_u32() % mem->capacity;
81a243170f720e Jiakun Shuai 2025-07-07  1179  			pool = mem->pool_addr[try_pool_idx];
81a243170f720e Jiakun Shuai 2025-07-07  1180  			index = pswiotlb_pool_find_slots(dev, nid, pool, orig_addr,
81a243170f720e Jiakun Shuai 2025-07-07  1181  							alloc_size, alloc_align_mask);
81a243170f720e Jiakun Shuai 2025-07-07  1182  		}
81a243170f720e Jiakun Shuai 2025-07-07  1183  
81a243170f720e Jiakun Shuai 2025-07-07  1184  		if (index >= 0) {
81a243170f720e Jiakun Shuai 2025-07-07  1185  			rcu_read_unlock();
81a243170f720e Jiakun Shuai 2025-07-07  1186  			goto found;
81a243170f720e Jiakun Shuai 2025-07-07  1187  		}
81a243170f720e Jiakun Shuai 2025-07-07  1188  	}
81a243170f720e Jiakun Shuai 2025-07-07  1189  #else
81a243170f720e Jiakun Shuai 2025-07-07  1190  	for (i = 0; i < 15; i++) {
81a243170f720e Jiakun Shuai 2025-07-07  1191  		try_pool_idx = get_random_u32() % mem->capacity;
81a243170f720e Jiakun Shuai 2025-07-07  1192  		pool = mem->pool_addr[try_pool_idx];
81a243170f720e Jiakun Shuai 2025-07-07  1193  		index = pswiotlb_pool_find_slots(dev, nid, pool, orig_addr,
81a243170f720e Jiakun Shuai 2025-07-07  1194  						alloc_size, alloc_align_mask);
81a243170f720e Jiakun Shuai 2025-07-07  1195  
81a243170f720e Jiakun Shuai 2025-07-07  1196  		if (index >= 0) {
81a243170f720e Jiakun Shuai 2025-07-07  1197  			rcu_read_unlock();
81a243170f720e Jiakun Shuai 2025-07-07  1198  			goto found;
81a243170f720e Jiakun Shuai 2025-07-07  1199  		}
81a243170f720e Jiakun Shuai 2025-07-07  1200  	}
81a243170f720e Jiakun Shuai 2025-07-07  1201  #endif
81a243170f720e Jiakun Shuai 2025-07-07  1202  	rcu_read_unlock();
81a243170f720e Jiakun Shuai 2025-07-07  1203  	if (nslabs_per_pool > SLABS_PER_PAGE << MAX_ORDER)
81a243170f720e Jiakun Shuai 2025-07-07  1204  		nslabs_per_pool = SLABS_PER_PAGE << MAX_ORDER;
81a243170f720e Jiakun Shuai 2025-07-07  1205  
81a243170f720e Jiakun Shuai 2025-07-07  1206  	nslabs_per_pool = ALIGN(nslabs_per_pool >> 1, P_IO_TLB_SEGSIZE);
81a243170f720e Jiakun Shuai 2025-07-07  1207  	pswiotlb_mem = P_IO_TLB_DEFAULT_SIZE +
81a243170f720e Jiakun Shuai 2025-07-07  1208  		(nslabs_per_pool << P_IO_TLB_SHIFT) * (mem->whole_size - 1);
81a243170f720e Jiakun Shuai 2025-07-07  1209  	current_ratio = (pswiotlb_mem * 100 + mem->node_total_mem / 2) / mem->node_total_mem;
81a243170f720e Jiakun Shuai 2025-07-07  1210  	if (current_ratio >= P_IO_TLB_EXT_WATERMARK) {
81a243170f720e Jiakun Shuai 2025-07-07  1211  		dev_warn_once(dev, "Total pswiotlb (%ld MB) exceeds the watermark (%d%%)\n"
81a243170f720e Jiakun Shuai 2025-07-07  1212  					"of memory (%ld MB) in node %d, pswiotlb expansion is prohibited.\n",
81a243170f720e Jiakun Shuai 2025-07-07  1213  					pswiotlb_mem >> 20, P_IO_TLB_EXT_WATERMARK,
81a243170f720e Jiakun Shuai 2025-07-07  1214  					mem->node_total_mem >> 20, nid);
81a243170f720e Jiakun Shuai 2025-07-07  1215  		return -1;
81a243170f720e Jiakun Shuai 2025-07-07  1216  	}
81a243170f720e Jiakun Shuai 2025-07-07  1217  
81a243170f720e Jiakun Shuai 2025-07-07  1218  	if (!mem->can_grow)
81a243170f720e Jiakun Shuai 2025-07-07  1219  		return -1;
81a243170f720e Jiakun Shuai 2025-07-07  1220  
81a243170f720e Jiakun Shuai 2025-07-07  1221  	pool = pswiotlb_formal_alloc(dev, mem);
81a243170f720e Jiakun Shuai 2025-07-07  1222  	if (!pool)
81a243170f720e Jiakun Shuai 2025-07-07  1223  		return -1;
81a243170f720e Jiakun Shuai 2025-07-07  1224  
81a243170f720e Jiakun Shuai 2025-07-07  1225  	/* retry */
81a243170f720e Jiakun Shuai 2025-07-07  1226  	rcu_read_lock();
81a243170f720e Jiakun Shuai 2025-07-07  1227  	index = pswiotlb_pool_find_slots(dev, nid, pool, orig_addr,
81a243170f720e Jiakun Shuai 2025-07-07  1228  					alloc_size, alloc_align_mask);
81a243170f720e Jiakun Shuai 2025-07-07  1229  	rcu_read_unlock();
81a243170f720e Jiakun Shuai 2025-07-07  1230  
81a243170f720e Jiakun Shuai 2025-07-07  1231  	if (index < 0) {
81a243170f720e Jiakun Shuai 2025-07-07  1232  		pswiotlb_dyn_free(&pool->rcu);
81a243170f720e Jiakun Shuai 2025-07-07  1233  		return -1;
81a243170f720e Jiakun Shuai 2025-07-07  1234  	}
81a243170f720e Jiakun Shuai 2025-07-07  1235  
81a243170f720e Jiakun Shuai 2025-07-07  1236  found:
81a243170f720e Jiakun Shuai 2025-07-07  1237  	WRITE_ONCE(dev->dma_uses_p_io_tlb, true);
81a243170f720e Jiakun Shuai 2025-07-07  1238  
81a243170f720e Jiakun Shuai 2025-07-07  1239  	/*
81a243170f720e Jiakun Shuai 2025-07-07  1240  	 * The general barrier orders reads and writes against a presumed store
81a243170f720e Jiakun Shuai 2025-07-07  1241  	 * of the PSWIOTLB buffer address by a device driver (to a driver private
81a243170f720e Jiakun Shuai 2025-07-07  1242  	 * data structure). It serves two purposes.
81a243170f720e Jiakun Shuai 2025-07-07  1243  	 *
81a243170f720e Jiakun Shuai 2025-07-07  1244  	 * First, the store to dev->dma_uses_p_io_tlb must be ordered before the
81a243170f720e Jiakun Shuai 2025-07-07  1245  	 * presumed store. This guarantees that the returned buffer address
81a243170f720e Jiakun Shuai 2025-07-07  1246  	 * cannot be passed to another CPU before updating dev->dma_uses_p_io_tlb.
81a243170f720e Jiakun Shuai 2025-07-07  1247  	 *
81a243170f720e Jiakun Shuai 2025-07-07  1248  	 * Second, the load from mem->pools must be ordered before the same
81a243170f720e Jiakun Shuai 2025-07-07  1249  	 * presumed store. This guarantees that the returned buffer address
81a243170f720e Jiakun Shuai 2025-07-07  1250  	 * cannot be observed by another CPU before an update of the RCU list
81a243170f720e Jiakun Shuai 2025-07-07  1251  	 * that was made by pswiotlb_dyn_alloc() on a third CPU (cf. multicopy
81a243170f720e Jiakun Shuai 2025-07-07  1252  	 * atomicity).
81a243170f720e Jiakun Shuai 2025-07-07  1253  	 *
81a243170f720e Jiakun Shuai 2025-07-07  1254  	 * See also the comment in is_pswiotlb_buffer().
81a243170f720e Jiakun Shuai 2025-07-07  1255  	 */
81a243170f720e Jiakun Shuai 2025-07-07  1256  	smp_mb();
81a243170f720e Jiakun Shuai 2025-07-07  1257  
81a243170f720e Jiakun Shuai 2025-07-07  1258  	*retpool = pool;
81a243170f720e Jiakun Shuai 2025-07-07  1259  	return index;
81a243170f720e Jiakun Shuai 2025-07-07  1260  }
81a243170f720e Jiakun Shuai 2025-07-07  1261  #ifdef CONFIG_DEBUG_FS
81a243170f720e Jiakun Shuai 2025-07-07  1262  

:::::: The code at line 1159 was first introduced by commit
:::::: 81a243170f720e9b8772c7b0a1dfb2922264e0c6 dma: phytium: Add PSWIOTLB mechanism to improve DMA performance

:::::: TO: Jiakun Shuai <shuaijiakun1288@phytium.com.cn>
:::::: CC: Jiakun Shuai <shuaijiakun1288@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
