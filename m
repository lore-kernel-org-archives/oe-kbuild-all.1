Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CBA21CC58
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166829; cv=none; b=YuHA0kTjBFhpipDQNxgdNQaOxTrYXiSMJI7rbxVjeIU36cPbt8sXFKB3a8t1nglf44BL0tbVsbkbVwMgQM7m9+ftoskT1f7dXQLLVkqmFJfOzwcDsFS0thFFbMGYFnnJCFdk9SLxLGjWq3YSuMpYPCixIJeFVeTvp5Lduvy44MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166829; c=relaxed/simple;
	bh=+c8Q/KI9o8I1Z284AT3tk4gryJzzOWcVhx0HV/Hl4i4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bSSh6BRZtNW4kDeygd02C++GLIhoBqwSzz3meDTQyE1es87673TXgnmLlHMc7yAC4Lg1p4EecU5JQcB4o4Nf1ROwaRrs8Uoed/yOdZZPrbZBKoXmAExxKv9b+A7Vwr1k6bKR4zG3qkYPcS0CiWq5AARoFU2PKaaqNKGkvUjOHQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/9wrxa8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/9wrxa8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781166827; x=1812702827;
  h=date:from:to:cc:subject:message-id;
  bh=+c8Q/KI9o8I1Z284AT3tk4gryJzzOWcVhx0HV/Hl4i4=;
  b=I/9wrxa8VdHzzkMYcJLg2gcq2rCoLwCa7ZrKAyhx8pLjo0E8yCC3RSOp
   F/7Y1DETC/sv8tcbVbamUUnIYOPau+SQjZpLJA2Z01nnCHuqNpOy3OrTg
   kiEG3OGObzhyX7y+l2o2CwWv4C79S35/O1dZ5tXqhYoLS2YFOnQ6M/hlM
   g9W7SwD+4JNK9ebpKqN7ErDRlZ1PDzA0oUl+H3xMecgHasNmazLGEdL5V
   k+SW8rm+ORRJ5CpxHqH2DLtPl2FuNBewF8KDLvqWLe1zGyjQu+cPTDopY
   irJwcki/WGIndxFGijJEXlU2G9FZzmF5wmno7MYgEzHJQ4ss4UZjWpvC+
   Q==;
X-CSE-ConnectionGUID: tDxHpmyqQ7G0/Bgd36Ylrw==
X-CSE-MsgGUID: i0d/IhKWTDqzqmOy+L8mcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="80990714"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="80990714"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:33:45 -0700
X-CSE-ConnectionGUID: XAHQ0iDHSqONFvGKHftGvQ==
X-CSE-MsgGUID: 2ttiv6xIRby+GUO8UvzuNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="276605963"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jun 2026 01:33:45 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXar7-00000000Mck-24xl;
	Thu, 11 Jun 2026 08:33:41 +0000
Date: Thu, 11 Jun 2026 16:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/virt/halla/hvm_vm.c:435: warning: Function parameter or struct member
 'hvm' not described in 'hvm_destroy_vm'
Message-ID: <202606111634.GKJbKAtr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   17584f778119ed93d9ae85feb43561e05f5254b0
commit: e17566975f96abbb6d6b84aa4784161e51264095 [2/2] ANDROID: virt: halla: Tie struct hvm lifetime to vcpu fds with a kref
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260611/202606111634.GKJbKAtr-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project f99ad325b987c3f2fb2d298f1569377c989b06d3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111634.GKJbKAtr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111634.GKJbKAtr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/halla/hvm_vm.c:435: warning: Function parameter or struct member 'hvm' not described in 'hvm_destroy_vm'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +435 drivers/virt/halla/hvm_vm.c

e17566975f96ab Junho Choi  2026-06-10  423  
e17566975f96ab Junho Choi  2026-06-10  424  /**
e17566975f96ab Junho Choi  2026-06-10  425   * hvm_destroy_vm() - VM fd release path.
e17566975f96ab Junho Choi  2026-06-10  426   *
e17566975f96ab Junho Choi  2026-06-10  427   * Tears down everything that owns guest memory or hypervisor S2
e17566975f96ab Junho Choi  2026-06-10  428   * resources, detaches the live vcpus from the hypervisor, removes
e17566975f96ab Junho Choi  2026-06-10  429   * the VM from hvm_list, then drops the VM fd's kref.  The struct
e17566975f96ab Junho Choi  2026-06-10  430   * hvm itself stays alive as long as any vcpu fd still holds a
e17566975f96ab Junho Choi  2026-06-10  431   * reference, so a vcpu ioctl racing with VM fd close stays on
e17566975f96ab Junho Choi  2026-06-10  432   * valid memory until the vcpu fd is also closed.
e17566975f96ab Junho Choi  2026-06-10  433   */
9007a992df6c7f Kim Mankyum 2025-08-27  434  static void hvm_destroy_vm(struct hvm *hvm)
9007a992df6c7f Kim Mankyum 2025-08-27 @435  {
e17566975f96ab Junho Choi  2026-06-10  436  	unsigned long ret;
9007a992df6c7f Kim Mankyum 2025-08-27  437  
9007a992df6c7f Kim Mankyum 2025-08-27  438  	mutex_lock(&hvm->lock);
9007a992df6c7f Kim Mankyum 2025-08-27  439  
f2801c7c470f11 Kim Mankyum 2026-04-14  440  	hvm_pre_destroy_vm(hvm);
9007a992df6c7f Kim Mankyum 2025-08-27  441  
9007a992df6c7f Kim Mankyum 2025-08-27  442  	hvm_vm_irqfd_release(hvm);
9007a992df6c7f Kim Mankyum 2025-08-27  443  
9007a992df6c7f Kim Mankyum 2025-08-27  444  	ret = hvm_reclaim_guest_memory(hvm);
9007a992df6c7f Kim Mankyum 2025-08-27  445  	hvm_reclaim_guest_stage2_pgtable(hvm);
9007a992df6c7f Kim Mankyum 2025-08-27  446  
9007a992df6c7f Kim Mankyum 2025-08-27  447  	hvm_destroy_vcpus(hvm);
9007a992df6c7f Kim Mankyum 2025-08-27  448  
9007a992df6c7f Kim Mankyum 2025-08-27  449  	mutex_lock(&hvm_list_lock);
9007a992df6c7f Kim Mankyum 2025-08-27  450  	list_del(&hvm->vm_list);
9007a992df6c7f Kim Mankyum 2025-08-27  451  	mutex_unlock(&hvm_list_lock);
9007a992df6c7f Kim Mankyum 2025-08-27  452  
9007a992df6c7f Kim Mankyum 2025-08-27  453  	mutex_unlock(&hvm->lock);
9007a992df6c7f Kim Mankyum 2025-08-27  454  
9007a992df6c7f Kim Mankyum 2025-08-27  455  	/**
9007a992df6c7f Kim Mankyum 2025-08-27  456  	 * Have to leave the page pinned as we don't know whether its
9007a992df6c7f Kim Mankyum 2025-08-27  457  	 * save to access
9007a992df6c7f Kim Mankyum 2025-08-27  458  	 */
9007a992df6c7f Kim Mankyum 2025-08-27  459  	if (!ret) {
9007a992df6c7f Kim Mankyum 2025-08-27  460  		/**
9007a992df6c7f Kim Mankyum 2025-08-27  461  		 * No need to lock here becauese it's single-threaded
9007a992df6c7f Kim Mankyum 2025-08-27  462  		 * execution
9007a992df6c7f Kim Mankyum 2025-08-27  463  		 */
9007a992df6c7f Kim Mankyum 2025-08-27  464  		hvm_destroy_all_ppage(hvm);
9007a992df6c7f Kim Mankyum 2025-08-27  465  	}
9007a992df6c7f Kim Mankyum 2025-08-27  466  
e17566975f96ab Junho Choi  2026-06-10  467  	hvm_vm_put(hvm);
9007a992df6c7f Kim Mankyum 2025-08-27  468  }
9007a992df6c7f Kim Mankyum 2025-08-27  469  

:::::: The code at line 435 was first introduced by commit
:::::: 9007a992df6c7fbc50cbcc21613b3a5c3c019ab6 ANDROID: drivers: virt: Initialization halla module

:::::: TO: Kim Mankyum <mankyum.kim@samsung.com>
:::::: CC: Greg Kroah-Hartman <gregkh@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
