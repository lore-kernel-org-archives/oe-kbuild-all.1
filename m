Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C97A212FAD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 02:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790304422; cv=none; b=uwijaJPpaWg0RaTyNb1oTyepLEyoOz85UtFV6Dn2OOxMroifOrgMjPcfK4wDenHT4pF7pt15Q8ZdYingPE4FQQ4YX3W0Ywa5+Xf9QiEwGUfTuPqs2DAEAxNOnh1M3RxD24/SsIxdLcVhqe0scTjwRzzsLoqTeL8nfgY3dnkjXDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790304422; c=relaxed/simple;
	bh=Y/Gnm58hwO4PatO7CiIFCm/GFYKJGt9C4xub0vRNOug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DJZyABqCx+C4Lf7KitXzU86Q2o5iZ12oEyXXBGHjEGfa0Vvrf4dSUdss6tMsZFa6MBtom9IdNlVm2ncrwtWAJFxeSJfNXxGmkqCjzp71r3pDbb86cT3sKiTv7P8GWjuDcnRacAupQUA6kLIS9rJuuccLochdjX01+d1uSzKbKLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OL4BP5N9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OL4BP5N9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790304420; x=1821840420;
  h=date:from:to:cc:subject:message-id;
  bh=Y/Gnm58hwO4PatO7CiIFCm/GFYKJGt9C4xub0vRNOug=;
  b=OL4BP5N9flZsmXGDGmg5XaabG4Czrsfdgj4dxuedd8gsLmYBpKFLEBxq
   HYDzm5ZzK50QVoUR/4woDSoQfGEuDHCJFnZTrDDEkefFJBUUsWtQIhVrv
   UsagZEV6K5Sw5Lz25PScFQabL7x5SJPQcaK//VAohk78TtfB4sfpUpn5w
   dyLAiGlDeHgdoHrvNaZr10MfTatrL+bKrzneW8BjA8BF8FroppSazlEYZ
   lMuFEvA6hTdtb/45Wk2dnD5UwsmLF0kvMOP5TyhvqyEbMdkA3yrXW8SxB
   HjWeokctxva578tR7mqnrTosmXuHGEAJttkiuxLlZj7uTOJG/CEDRGCag
   g==;
X-CSE-ConnectionGUID: wykbKnZNSdKzKIlOCvUbuw==
X-CSE-MsgGUID: mdFSWAWBT3i+mzkR65xj+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89952068"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="89952068"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 19:46:59 -0700
X-CSE-ConnectionGUID: tKbgamVLTKWaiOBujgJJMQ==
X-CSE-MsgGUID: LzJbJEBfS9mn8boEgimRlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="273424593"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Sep 2026 19:46:57 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9vxf-00000000Jx8-2Z03;
	Fri, 25 Sep 2026 02:46:55 +0000
Date: Fri, 25 Sep 2026 10:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-06 2/2]
 drivers/virt/halla/hvm_vm.c:435: warning: Function parameter or struct member
 'hvm' not described in 'hvm_destroy_vm'
Message-ID: <202609251029.5tw2ShPo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Junho,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-06
head:   20ed81c930ecc79af10bfca7c8de6d163fe051b7
commit: e17566975f96abbb6d6b84aa4784161e51264095 [2/2] ANDROID: virt: halla: Tie struct hvm lifetime to vcpu fds with a kref
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260925/202609251029.5tw2ShPo-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6e714c8d91116794cb699cdf80c26afe9cda3ef3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251029.5tw2ShPo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251029.5tw2ShPo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/halla/hvm_vm.c:435: warning: Function parameter or struct member 'hvm' not described in 'hvm_destroy_vm'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +435 drivers/virt/halla/hvm_vm.c

e17566975f96abb Junho Choi  2026-06-10  423  
e17566975f96abb Junho Choi  2026-06-10  424  /**
e17566975f96abb Junho Choi  2026-06-10  425   * hvm_destroy_vm() - VM fd release path.
e17566975f96abb Junho Choi  2026-06-10  426   *
e17566975f96abb Junho Choi  2026-06-10  427   * Tears down everything that owns guest memory or hypervisor S2
e17566975f96abb Junho Choi  2026-06-10  428   * resources, detaches the live vcpus from the hypervisor, removes
e17566975f96abb Junho Choi  2026-06-10  429   * the VM from hvm_list, then drops the VM fd's kref.  The struct
e17566975f96abb Junho Choi  2026-06-10  430   * hvm itself stays alive as long as any vcpu fd still holds a
e17566975f96abb Junho Choi  2026-06-10  431   * reference, so a vcpu ioctl racing with VM fd close stays on
e17566975f96abb Junho Choi  2026-06-10  432   * valid memory until the vcpu fd is also closed.
e17566975f96abb Junho Choi  2026-06-10  433   */
9007a992df6c7fb Kim Mankyum 2025-08-27  434  static void hvm_destroy_vm(struct hvm *hvm)
9007a992df6c7fb Kim Mankyum 2025-08-27 @435  {
e17566975f96abb Junho Choi  2026-06-10  436  	unsigned long ret;
9007a992df6c7fb Kim Mankyum 2025-08-27  437  
9007a992df6c7fb Kim Mankyum 2025-08-27  438  	mutex_lock(&hvm->lock);
9007a992df6c7fb Kim Mankyum 2025-08-27  439  
f2801c7c470f11d Kim Mankyum 2026-04-14  440  	hvm_pre_destroy_vm(hvm);
9007a992df6c7fb Kim Mankyum 2025-08-27  441  
9007a992df6c7fb Kim Mankyum 2025-08-27  442  	hvm_vm_irqfd_release(hvm);
9007a992df6c7fb Kim Mankyum 2025-08-27  443  
9007a992df6c7fb Kim Mankyum 2025-08-27  444  	ret = hvm_reclaim_guest_memory(hvm);
9007a992df6c7fb Kim Mankyum 2025-08-27  445  	hvm_reclaim_guest_stage2_pgtable(hvm);
9007a992df6c7fb Kim Mankyum 2025-08-27  446  
9007a992df6c7fb Kim Mankyum 2025-08-27  447  	hvm_destroy_vcpus(hvm);
9007a992df6c7fb Kim Mankyum 2025-08-27  448  
9007a992df6c7fb Kim Mankyum 2025-08-27  449  	mutex_lock(&hvm_list_lock);
9007a992df6c7fb Kim Mankyum 2025-08-27  450  	list_del(&hvm->vm_list);
9007a992df6c7fb Kim Mankyum 2025-08-27  451  	mutex_unlock(&hvm_list_lock);
9007a992df6c7fb Kim Mankyum 2025-08-27  452  
9007a992df6c7fb Kim Mankyum 2025-08-27  453  	mutex_unlock(&hvm->lock);
9007a992df6c7fb Kim Mankyum 2025-08-27  454  
9007a992df6c7fb Kim Mankyum 2025-08-27  455  	/**
9007a992df6c7fb Kim Mankyum 2025-08-27  456  	 * Have to leave the page pinned as we don't know whether its
9007a992df6c7fb Kim Mankyum 2025-08-27  457  	 * save to access
9007a992df6c7fb Kim Mankyum 2025-08-27  458  	 */
9007a992df6c7fb Kim Mankyum 2025-08-27  459  	if (!ret) {
9007a992df6c7fb Kim Mankyum 2025-08-27  460  		/**
9007a992df6c7fb Kim Mankyum 2025-08-27  461  		 * No need to lock here becauese it's single-threaded
9007a992df6c7fb Kim Mankyum 2025-08-27  462  		 * execution
9007a992df6c7fb Kim Mankyum 2025-08-27  463  		 */
9007a992df6c7fb Kim Mankyum 2025-08-27  464  		hvm_destroy_all_ppage(hvm);
9007a992df6c7fb Kim Mankyum 2025-08-27  465  	}
9007a992df6c7fb Kim Mankyum 2025-08-27  466  
e17566975f96abb Junho Choi  2026-06-10  467  	hvm_vm_put(hvm);
9007a992df6c7fb Kim Mankyum 2025-08-27  468  }
9007a992df6c7fb Kim Mankyum 2025-08-27  469  

:::::: The code at line 435 was first introduced by commit
:::::: 9007a992df6c7fbc50cbcc21613b3a5c3c019ab6 ANDROID: drivers: virt: Initialization halla module

:::::: TO: Kim Mankyum <mankyum.kim@samsung.com>
:::::: CC: Greg Kroah-Hartman <gregkh@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
