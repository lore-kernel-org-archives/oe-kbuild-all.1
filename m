Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B842361DBD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771334567; cv=none; b=rF0G6+sCUBLsrWJaAahfITbTGlBVW1eY4XHzo7dcqSid0dWFPeADoBlo8CinxnPf3IXOuu5YdgeGEPDTsFaFV3XrI+AC0PH44wfkMUTDE+F+Qf4xtmXhPIbg4IaX0WjEk+Ku1mEPIApOuEt4lvoJ3zd2IeMwSEI3zz/jiiWeALg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771334567; c=relaxed/simple;
	bh=xusPohBx2ntbbpZ3Z4LiaPjqkjwTc7J24tlroXnzhcI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=grSxzxZ7i3AOCGF8lg0SkSceMMynv/qFoZPF7CKO0p+88oLqkZlzAJPIuGChHZ3wck5Yc3iuuydteCVdZk7Gba4lV5mXsAHJdg7Tw/gJKAhvQ0T0uCqTDpJn2+HeBpF+FwfJ8efzGmy+KEAkrKePg+ZJKzWLIc3UV86QqRtjInc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GK72DoOL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GK72DoOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771334566; x=1802870566;
  h=date:from:to:cc:subject:message-id;
  bh=xusPohBx2ntbbpZ3Z4LiaPjqkjwTc7J24tlroXnzhcI=;
  b=GK72DoOLN+s3PC7f2xv1j8V/bvb+I/j1TlinxRT9nhJq8dfPP7K+wJwi
   HoOEpwT/2PL3Nqe/w9SHc0tYw3j6UzuGpkZI0hD4a5B8UxTnAVmjKTLqI
   bKsh2hFUM/CQv0+iZ9AoYZnlxMxj3HNApAMe7fDUsLKq7DQ6fXQukIm/O
   KHx1u9A5/IttnywAHfE41Ag2jdzsxMTraYFfziC34+JVsF8tQtp1MfuFc
   xCMmm/LMPXo4K7u5IBllHGw0+H34s87UaCXtg5f3qKMUJLdyui16X3tFu
   Lc84PGPgfHeeMSiUltj0Dv3vVAV45QrE8wBhQZqSO+rVVgHFRJX3zZjzu
   g==;
X-CSE-ConnectionGUID: t66jShm5TQqsLs2/wHiH+Q==
X-CSE-MsgGUID: fz/vytXZSDm85IHJ3nIHOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="76241524"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="76241524"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 05:22:45 -0800
X-CSE-ConnectionGUID: K7dnBk10R/aQvvJxpnMAcA==
X-CSE-MsgGUID: wdIuz7K/Sn68jCOJDM8MtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="212602913"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Feb 2026 05:22:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsL2H-0000000111E-3WoI;
	Tue, 17 Feb 2026 13:22:41 +0000
Date: Tue, 17 Feb 2026 21:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 53/53]
 arch/x86/include/asm/kvm_pkvm.h:280:37: error: field 'iommu_map_param' has
 incomplete type
Message-ID: <202602172128.hbAY9wsO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vineeth,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   590a98f7b9783af3a52d4213d1f276148be94b4e
commit: e3aff207324c14597db951ea892402226359276b [53/53] ANDROID: pkvm: x86: Hypercalls for domain pagetable management
config: i386-randconfig-141-20260217 (https://download.01.org/0day-ci/archive/20260217/202602172128.hbAY9wsO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602172128.hbAY9wsO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602172128.hbAY9wsO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:43:
   arch/x86/include/asm/kvm_pkvm.h:275:38: error: field 'lm_context_param' has incomplete type
     275 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:276:45: error: field 'clear_translation_param' has incomplete type
     276 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:277:38: error: field 'sm_context_param' has incomplete type
     277 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:278:39: error: field 'pasid_table_param' has incomplete type
     278 |         struct pkvm_pasid_table_param pasid_table_param;
         |                                       ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:279:34: error: field 'domain_param' has incomplete type
     279 |         struct pkvm_domain_param domain_param;
         |                                  ^~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:280:37: error: field 'iommu_map_param' has incomplete type
     280 |         struct pkvm_iommu_map_param iommu_map_param;
         |                                     ^~~~~~~~~~~~~~~


vim +/iommu_map_param +280 arch/x86/include/asm/kvm_pkvm.h

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
