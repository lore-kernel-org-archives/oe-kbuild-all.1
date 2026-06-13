Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74517215075
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 06:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781333055; cv=none; b=linNuChQ9cW/2bVEXnIvkhgLCg8FnOrzaJdAzLnE7IYcrP9xjJnK6DBsJ25cwmLhbd8ka95m6iWgt1ie4Wo9GG89+Ejhx8ASdYvpjSO9e2+4uoKJeVNkX08tk4buprLAlLahTQKhO47c1aeNTT3O97Byuexm7OTLgIsRLLS9L8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781333055; c=relaxed/simple;
	bh=uRGjsJ24tPV361e6NusC5n513hC/IsKjDXKfqqGvsoA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XJXQj0CQW/4DvQTuMaXF6Z6Pw9NcYe/XFj2Q/4Co4n1i7MWJl0Pc7VLd6imQUvPoPuZp2UCd+aDw/wGQfp+FWqyYE2z7Hzpv6rpQL+LtktRC5fg8x0K5VDZZ+sp6qkrWpFgAL/Z6FGXnY+kesbfMzzRyCVi3Qg0nYjfGFT/Kj2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrAuyoI+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrAuyoI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781333054; x=1812869054;
  h=date:from:to:cc:subject:message-id;
  bh=uRGjsJ24tPV361e6NusC5n513hC/IsKjDXKfqqGvsoA=;
  b=NrAuyoI+XBqbIuI9O+ZA0bPXMhkmpussc23kVv3quugj5hcbsK8dhRPP
   xBkrAmt+vNqViwJH1yCER/ZB20mFBsxBGHW+E69axv1TsrP7b485QvTZB
   PtwS3W+AbCMHc6R6DKfBirN0H+gHk4QibEdHCL8jHY8qDOYAzIbSIPiXm
   O3RQJjqyaRhyRmEcrsCf9Cd17TaAj24t0Ev1Jmal9Lg59/OiYpkOnnGW6
   4l9eIle0KfMON8hDO1IqST0BTn/QD8Xad5x/QbYMzbMWDhY8xyKxY0nWN
   AetkpHVhiIOlVbNrz7BugBuCJNAdDGdcJHkOwxUOZT63jz+LcJW4XqUsU
   A==;
X-CSE-ConnectionGUID: CijMq71nTTW/33oGlUfYqA==
X-CSE-MsgGUID: 0Ox5/PCKTXGD/8tCsS/YCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85790828"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="85790828"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 23:44:13 -0700
X-CSE-ConnectionGUID: 1FPqDTjlSwGqO3R+3VSswQ==
X-CSE-MsgGUID: zZ54cmj5SGee/dDyO5xJmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="250921910"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2026 23:44:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYI6C-00000000PkA-38y4;
	Sat, 13 Jun 2026 06:44:08 +0000
Date: Sat, 13 Jun 2026 14:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/no_unsync_for_nested_tdp 28/28] x86.c:undefined
 reference to `tdp_enabled'
Message-ID: <202606131440.1ifKv7Dz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/no_unsync_for_nested_tdp
head:   70581e9c96071da6df2465de7d17a0d36a63388a
commit: 9f53f21ed659784cf113f5c1690230a7b1549cb5 [28/28] KVM: x86/mmu: Add Kconfig option to disable legacy (non-TDP) shadow paging
config: i386-buildonly-randconfig-002-20260613 (https://download.01.org/0day-ci/archive/20260613/202606131440.1ifKv7Dz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131440.1ifKv7Dz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131440.1ifKv7Dz-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/x86.o: in function `kvm_post_set_cr0':
>> x86.c:(.text+0x1399e): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/x86.o: in function `kvm_post_set_cr4':
   x86.c:(.text+0x13a34): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/x86.o: in function `load_pdptrs':
   x86.c:(.text+0x172da): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/x86.o: in function `kvm_invalidate_pcid':
   x86.c:(.text+0x1994f): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/x86.o: in function `vcpu_mmio_gva_to_gpa':
   x86.c:(.text+0x1bc86): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/x86.o:x86.c:(.text+0x1bd8f): more undefined references to `tdp_enabled' follow
   ld: arch/x86/kvm/x86.o: in function `vcpu_enter_guest.constprop.0':
>> x86.c:(.text+0x29d18): undefined reference to `kvm_mmu_sync_roots'
   ld: arch/x86/kvm/x86.o: in function `kvm_arch_prepare_memory_region':
   x86.c:(.text+0x2d4c1): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/mmu/mmu.o: in function `mmio_info_in_cache.part.0':
>> mmu.c:(.text+0x839d): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/mmu/mmu.o: in function `handle_mmio_page_fault':
   mmu.c:(.text+0x86a6): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/mmu/mmu.o: in function `kvm_handle_noslot_fault':
   mmu.c:(.text+0xbe11): undefined reference to `tdp_enabled'
>> ld: mmu.c:(.text+0xbe73): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/mmu/mmu.o:mmu.c:(.text+0x10883): more undefined references to `tdp_enabled' follow
   ld: arch/x86/kvm/mmu/mmu.o: in function `kvm_mmu_load':
>> mmu.c:(.text+0x127f0): undefined reference to `kvm_mmu_sync_roots'
   ld: arch/x86/kvm/cpuid.o: in function `kvm_initialize_cpu_caps':
>> cpuid.c:(.text+0x50d): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/cpuid.o: in function `__do_cpuid_func':
   cpuid.c:(.text+0x1d0a): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/cpuid.o: in function `kvm_vcpu_after_set_cpuid':
   cpuid.c:(.text+0x2542): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/mmu/page_track.o: in function `kvm_page_track_write_tracking_enabled':
>> page_track.c:(.text+0x16): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/mmu/page_track.o: in function `kvm_page_track_create_memslot':
   page_track.c:(.text+0xa4): undefined reference to `tdp_enabled'
   ld: arch/x86/kvm/mmu/page_track.o:page_track.c:(.text+0x1ab): more undefined references to `tdp_enabled' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
