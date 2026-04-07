Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAE7374E57
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533946; cv=none; b=nXzfBTi3D2q1p/Pun3b90Ij7B6WoB4pjGvD9R3vlSD/s3BjtXeqEmL7fdZ0h2aSXFhAJU7wkkNr/ow4Of00qcyHOg2tuh+m3en4UMyw3jps+hqvUOi6+ZXE2haZrwz2ZbwBiP7/StJBe/w0sJcYjaqfqOIsuBBfqWjo7NCofCYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533946; c=relaxed/simple;
	bh=CMh3e92ke5mWogD/8cV96fWnTqVpVBwZwt2HLQaDHek=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BWWSc4+9jsM38+4dF3f63w0Wwtwq0+RLmO4dwVvqWZiuvYhIBMCxibY68gaXGcH1GN7+h72VNJwtG6oDECzfHvexukwFpSJpaQCU+soP7a59jM1TR4VlA2HfdWqlNWsF4o5pSkQ0V5nNGL45w3tRju25mJic2ZuVYdFCxVhDidQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UClTrUpE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UClTrUpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533944; x=1807069944;
  h=date:from:to:cc:subject:message-id;
  bh=CMh3e92ke5mWogD/8cV96fWnTqVpVBwZwt2HLQaDHek=;
  b=UClTrUpE3aDAOxAouKyDsyyNJKWTEvI0ba1zeu2L7MaK3LA46uvYkFNO
   XbCZiGKLq89UXImlqMGXlKPaRzBboGx73wO/srvwtluSSy17zoKpHaaNw
   PPZlvgz96Wjf3C0HI7YuVMb4l9Ybi3QwPIOPFZiFppzkLW8C9eK7XsT06
   Ghl4TcgtEcDEeMv3kgJFpVawgJZgz3VrYg/pOktcDh1aGUX5F5ojEQ3XE
   vZnnFkYMF1ufA/195jZJP7Gb47HFfXisPL8lNke0u2VCfqUwFbmfdF8Nb
   abmt8sTs2p7MWKdbbiWfNz6StINSFiHIzVJERB/j6boCE0esJNjdN5MkK
   g==;
X-CSE-ConnectionGUID: OQ29A0rCRYSQUqLW90A8JA==
X-CSE-MsgGUID: N1FF6QSZRb2WRCt0MiB3Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781484"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781484"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:52:22 -0700
X-CSE-ConnectionGUID: jlBF11sBSQeCZkMHsTR/mQ==
X-CSE-MsgGUID: mGIkNhqBQOS9Xw5ImCkoVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="224842913"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Apr 2026 20:52:21 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xUA-0000000002n-3Xs4;
	Tue, 07 Apr 2026 03:52:18 +0000
Date: Tue, 07 Apr 2026 11:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 38/38]
 arch/x86/include/asm/kvm_pkvm.h:280:30: error: field has incomplete type
 'struct pkvm_iommu_map_param'
Message-ID: <202604040529.OfiIjFZG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vineeth,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   fc497420dca4064b76e29d6c2e5194af6b461b39
commit: e3aff207324c14597db951ea892402226359276b [38/38] ANDROID: pkvm: x86: Hypercalls for domain pagetable management
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260404/202604040529.OfiIjFZG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040529.OfiIjFZG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040529.OfiIjFZG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:43:
   arch/x86/include/asm/kvm_pkvm.h:275:31: error: field has incomplete type 'struct pkvm_lm_context_param'
     275 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:275:9: note: forward declaration of 'struct pkvm_lm_context_param'
     275 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:276:38: error: field has incomplete type 'struct pkvm_clear_translation_param'
     276 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^
   arch/x86/include/asm/kvm_pkvm.h:276:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     276 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:277:31: error: field has incomplete type 'struct pkvm_sm_context_param'
     277 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:277:9: note: forward declaration of 'struct pkvm_sm_context_param'
     277 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:278:32: error: field has incomplete type 'struct pkvm_pasid_table_param'
     278 |         struct pkvm_pasid_table_param pasid_table_param;
         |                                       ^
   arch/x86/include/asm/kvm_pkvm.h:278:9: note: forward declaration of 'struct pkvm_pasid_table_param'
     278 |         struct pkvm_pasid_table_param pasid_table_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:279:27: error: field has incomplete type 'struct pkvm_domain_param'
     279 |         struct pkvm_domain_param domain_param;
         |                                  ^
   arch/x86/include/asm/kvm_pkvm.h:279:9: note: forward declaration of 'struct pkvm_domain_param'
     279 |         struct pkvm_domain_param domain_param;
         |                ^
>> arch/x86/include/asm/kvm_pkvm.h:280:30: error: field has incomplete type 'struct pkvm_iommu_map_param'
     280 |         struct pkvm_iommu_map_param iommu_map_param;
         |                                     ^
   arch/x86/include/asm/kvm_pkvm.h:280:9: note: forward declaration of 'struct pkvm_iommu_map_param'
     280 |         struct pkvm_iommu_map_param iommu_map_param;
         |                ^
   6 errors generated.


vim +280 arch/x86/include/asm/kvm_pkvm.h

   267	
   268	union pkvm_pv_param {
   269		struct kvm_segment seg;
   270		struct msr_data msr;
   271		struct desc_ptr desc;
   272		struct eoi_exitmap eoi_exit_bitmap;
   273	
   274		/* IOMMU hypercall params */
   275		struct pkvm_lm_context_param lm_context_param;
   276		struct pkvm_clear_translation_param clear_translation_param;
   277		struct pkvm_sm_context_param sm_context_param;
   278		struct pkvm_pasid_table_param pasid_table_param;
   279		struct pkvm_domain_param domain_param;
 > 280		struct pkvm_iommu_map_param iommu_map_param;
   281	} __aligned(PAGE_SIZE);
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
