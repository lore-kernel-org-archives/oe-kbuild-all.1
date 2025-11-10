Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B79918C31
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 04:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762750579; cv=none; b=ELz/nmIF2WJJslT/bJKGIX0Sqlb18To+7fTqpBSdBvHtWhcpmiXu1fOWKhmVziC3S3EipoMHc5E1yp764OCNzzZ16QzjgOUmQSg5XsVMtpNkVZNOLhR/2MeZ1+na6FK8tMzqW/c52tAsnKJV8deLK+VbZcoey3mzkjWHRfSfLc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762750579; c=relaxed/simple;
	bh=o4dnrJF/zL3tHnHkxUrc86rJ5TDlOtv/Mscs8IBPhEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V9ExVDrf2qrcjOQdGwVE0BxVg7zFCApIL9BGVODjdSVk3JiaflYBqwIVdqu6yJej7G06G3ZHZJb0MOwbu5Lf51ijh6QYH1TJgnT5HcOxS4tvqqdFW99HPNxplgRsP7rZtAbBiF9WWfp0TqgLsRYIc3swwBnzM747Hcii7X0YBCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXBSkcQI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXBSkcQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762750578; x=1794286578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4dnrJF/zL3tHnHkxUrc86rJ5TDlOtv/Mscs8IBPhEs=;
  b=cXBSkcQI6Zqi4JAazeyB/aRj6uH3Y9PET8ybGRDivAnUXlBSWcuH4OVP
   VDylVVvjjYOpvtMh8U495obBNeYAn/LtOGLo2ujTrmi+NlHhQvCKwT/qA
   Dxs50CasjbNM6F+JZHl9co1YK4uOzxbVYwedN01nKCgV/Y3Kerhnsf0zr
   ny5DP3yBlJDQWCdeZYMRSPWZsKTBaSu73t3wwFwMqEIVmRG+LqI/TwHzZ
   DnGVKfEAiIbJ1f3GJCByLkh5SRziA/RGxLUIWdmtWAQ0M8NoENodI+kfs
   TAvFDY3HvHN3qxy8YX+tyCmb4fwb6Papc/h7ZUOf8UUUXXyQchJWJ80k3
   w==;
X-CSE-ConnectionGUID: rwm/aL6mTsmDIGycdQDxoQ==
X-CSE-MsgGUID: CdREO39pQ4CQdU/TuYjlIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="75091859"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="75091859"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 20:56:17 -0800
X-CSE-ConnectionGUID: XaF4WF3KRhubLCU1e3NS9w==
X-CSE-MsgGUID: mznSG5n8Tamnb+dOdu8P1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="193591058"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Nov 2025 20:56:16 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIJws-0002fT-0y;
	Mon, 10 Nov 2025 04:56:14 +0000
Date: Mon, 10 Nov 2025 12:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 291/296] include/linux/mm.h:944:31: sparse: sparse:
 incorrect type in argument 2 (different modifiers)
Message-ID: <202511101223.yntfHDDu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   02dafa01ec9a00c3758c1c6478d82fe601f5f1ba
commit: 85de428c7ca1b71457690b95e162662d0edb2792 [291/296] mm: set the VM_MAYBE_GUARD flag on guard region install
config: csky-randconfig-r121-20251110 (https://download.01.org/0day-ci/archive/20251110/202511101223.yntfHDDu-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511101223.yntfHDDu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511101223.yntfHDDu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/madvise.c:562:9: sparse: sparse: context imbalance in 'madvise_cold_or_pageout_pte_range' - different lock contexts for basic block
   mm/madvise.c:781:9: sparse: sparse: context imbalance in 'madvise_free_pte_range' - different lock contexts for basic block
   mm/madvise.c: note: in included file (through include/linux/mman.h):
>> include/linux/mm.h:944:31: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:944:31: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:944:31: sparse:     got unsigned long [noderef] *

vim +944 include/linux/mm.h

bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  932  
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  933  /*
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  934   * Set VMA flag atomically. Requires only VMA/mmap read lock. Only specific
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  935   * valid flags are allowed to do this.
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  936   */
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  937  static inline void vma_flag_set_atomic(struct vm_area_struct *vma, int bit)
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  938  {
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  939  	/* mmap read lock/VMA read lock must be held. */
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  940  	if (!rwsem_is_locked(&vma->vm_mm->mmap_lock))
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  941  		vma_assert_locked(vma);
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  942  
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  943  	if (__vma_flag_atomic_valid(vma, bit))
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07 @944  		set_bit(bit, &vma->__vm_flags);
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  945  }
bf91f4ed2a530f Lorenzo Stoakes 2025-11-07  946  

:::::: The code at line 944 was first introduced by commit
:::::: bf91f4ed2a530f2e55e7b202c1692a4c682888d6 mm: add atomic VMA flags and set VM_MAYBE_GUARD as such

:::::: TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
