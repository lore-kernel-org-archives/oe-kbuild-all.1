Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E3D31327D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 14:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762784997; cv=none; b=okgyxB7aFPdlEOPrntt21PyThUs5sL8ztV3H5csybFAndUCSVW2ffehvQQThpPEOwI2eTbuuNNlMFazbdEQcSANUpeWArDjhy/KCLC878xQQbkIa6s3QIGhEPYrkUi/3K2Izar/r9whQyeI3E7YJhVztmoufgu75yMOht0GJ1J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762784997; c=relaxed/simple;
	bh=cwl/GWKBRI65r318+pLvo4xqvgQzYWCHJ74rFPBPHxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gJySV+VZJcj0N/ot5AujeZx+mQd+nfH+w6ZYZYIH7IKb16xMcvRpp95TkoowmjshHdSoz4HCBdQAgid134Svo8Y09b9WN8jX8cU9gJX1AVGh0y/MFjiM37b63UD685Jv4AkudhXFYHiPjpgQVN999RfoGhIlPWPVMBDmU6JkHD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfncWXJo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfncWXJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762784996; x=1794320996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cwl/GWKBRI65r318+pLvo4xqvgQzYWCHJ74rFPBPHxM=;
  b=EfncWXJo4wOfkP8CtKBKac734mRioixli0Ums6wXFRvxk3B0lEpGYmY8
   xvjBWXPsiqisHOR8gOyDgHl1rLpQ6BScmAuBWYupbzsyGBNRQqO9AhTJ8
   Jij0PAtXi21XZpEI+elCLHhWdMxadCkteNIqO/YAM5oQd3RKsnp5+GEj+
   jhvlgHQPrIYbudLeF4Bw56GZnqQWjXibkxmrrxdB8X0/1CMItdTH+yHqj
   tqg/L+OJMbctQdW9y1p1IEsOA/eqhZYOTTwsRSxw/GjxR1F/bGFehm/Wx
   plNcwYBANo64DziWbyYeAcdCLhjPlKe1oQ4GEQhoV6nBf5oycKdVck7w+
   A==;
X-CSE-ConnectionGUID: 5h0bgReNRpOWYxFn8LxqVw==
X-CSE-MsgGUID: t9xRyBXDR+WQduHQtwhY0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64763312"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64763312"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 06:29:55 -0800
X-CSE-ConnectionGUID: 5uwT5rpTQnu9brrqli+7Xg==
X-CSE-MsgGUID: zwHD1DFMT5O9YmvbLLm8Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="189407859"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Nov 2025 06:29:53 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIStz-0000XD-2F;
	Mon, 10 Nov 2025 14:29:51 +0000
Date: Mon, 10 Nov 2025 22:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 291/296] include/linux/mm.h:957:24: sparse: sparse:
 incorrect type in argument 2 (different modifiers)
Message-ID: <202511102224.9qWchj6g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   8017f1fc873a78f54df02521b4d150f7101916ae
commit: 85de428c7ca1b71457690b95e162662d0edb2792 [291/296] mm: set the VM_MAYBE_GUARD flag on guard region install
config: s390-randconfig-r131-20251110 (https://download.01.org/0day-ci/archive/20251110/202511102224.9qWchj6g-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511102224.9qWchj6g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511102224.9qWchj6g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/khugepaged.c:830:25: sparse: sparse: symbol 'khugepaged_collapse_control' was not declared. Should it be static?
   mm/khugepaged.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in '__collapse_huge_page_swapin' - unexpected unlock
   mm/khugepaged.c:1196:26: sparse: sparse: context imbalance in 'collapse_huge_page' - different lock contexts for basic block
   mm/khugepaged.c:1705:28: sparse: sparse: context imbalance in 'collapse_pte_mapped_thp' - unexpected unlock
   mm/khugepaged.c: note: in included file:
>> include/linux/mm.h:957:24: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *ptr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:957:24: sparse:     expected unsigned long const volatile *ptr
   include/linux/mm.h:957:24: sparse:     got unsigned long [noderef] *
>> include/linux/mm.h:957:24: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:957:24: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:957:24: sparse:     got unsigned long [noderef] *
   mm/khugepaged.c:1822:28: sparse: sparse: context imbalance in 'retract_page_tables' - different lock contexts for basic block

vim +957 include/linux/mm.h

bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07  946  
bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07  947  /*
bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07  948   * Test for VMA flag atomically. Requires no locks. Only specific valid flags
bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07  949   * are allowed to do this.
bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07  950   *
bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07  951   * This is necessarily racey, so callers must ensure that serialisation is
bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07  952   * achieved through some other means, or that races are permissible.
bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07  953   */
bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07  954  static inline bool vma_flag_test_atomic(struct vm_area_struct *vma, int bit)
bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07  955  {
bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07  956  	if (__vma_flag_atomic_valid(vma, bit))
bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07 @957  		return test_bit(bit, &vma->__vm_flags);
85de428c7ca1b71 Lorenzo Stoakes 2025-11-07  958  
85de428c7ca1b71 Lorenzo Stoakes 2025-11-07  959  	return false;
bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07  960  }
bf91f4ed2a530f2 Lorenzo Stoakes 2025-11-07  961  

:::::: The code at line 957 was first introduced by commit
:::::: bf91f4ed2a530f2e55e7b202c1692a4c682888d6 mm: add atomic VMA flags and set VM_MAYBE_GUARD as such

:::::: TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
