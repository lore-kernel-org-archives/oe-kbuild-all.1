Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DE1259C9F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 13:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754571986; cv=none; b=gEpIIMygzT6J79AkmBYzwY7waQZibgwtZ3VN84p6CI3isdQmOfyIqJGZXpIbts19KGWLTcWaDjRzre1551VJmx+ZNT+aTTLrVbaaYNcIlKqXZZkjGBF5u253bLbd8XUYV/JRK/BT97uagvsGLKxCYMEPpkT+eCw1ruaugG31fSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754571986; c=relaxed/simple;
	bh=uvyfPUK/TD8olNevG14Z7ZeYYlx82eyydWACPmJYtYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HCNLUPWtJosbp/NyVmcKq3XfFlTx1WigToshem7JKTzEhJua8nj/AaGmyhevhGAEdtR1g2eUXp6NK5smb2j0w8s2RNl2uWo88Rvdm5tbIBQbayarwuMF+fncfotq3kHMZ8822poECTNDS2u/2I1fmQ0jbV2t0CiLEP1i9AFOrr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUq/fNF4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUq/fNF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754571985; x=1786107985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uvyfPUK/TD8olNevG14Z7ZeYYlx82eyydWACPmJYtYY=;
  b=FUq/fNF4Ghs6fU8GpBejM3UwO/VZKy6EkSc+qeadKNK2LiFvTTz9bINx
   B5w0TLNSPYBGQClApXvME3QRBxgs2DSs2P5DWHPlcyHfBhN6uhR2Z3fEl
   1seAUTA7lqrqnAXViaOrTcKli5gh+rjWHGAk6HBV0ULwXUEpNZEclIlFa
   EtyqMnUfbzlncZQxFLNMGP2YG78HMvnRRC28g/leoPiPMyOSuIEdMrVl/
   wPTAB4m6wW35mi+Xjma4bYMEjD7StFNqa4T0xcd8g2RCb3nFI6WL3ywtY
   CPj8hscYl0zqwE2trQLeIlfr/tw0JYIl2NRma6pQEMT4FFFhnpV97+u18
   w==;
X-CSE-ConnectionGUID: TzS6dvM3R+Ciu9FWcX3QzA==
X-CSE-MsgGUID: cXg/V8AQSiegSVk+/aULwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57045311"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="57045311"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 06:06:24 -0700
X-CSE-ConnectionGUID: +OU0DlFDQSmwOkbv3F+n9Q==
X-CSE-MsgGUID: DyTPIFhPSwqTk+VGXCVOAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164713711"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 07 Aug 2025 06:06:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk0K4-0002o6-3A;
	Thu, 07 Aug 2025 13:06:20 +0000
Date: Thu, 7 Aug 2025 21:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Yan Zhao <yan.y.zhao@intel.com>
Subject: [intel-tdx:huge_page_v2 47/204] include/linux/kvm_host.h:727:20:
 error: redefinition of 'kvm_arch_supports_gmem'
Message-ID: <202508072117.uIwhD7Pz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git huge_page_v2
head:   0744d0b90629d528fa94ff73dce7ceeaaed1560c
commit: 9747a2b15704a4f83d4c950118794f8b94058421 [47/204] KVM: arm64: Enable mapping guest_memfd in arm64
config: arm64-randconfig-001-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072117.uIwhD7Pz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072117.uIwhD7Pz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508072117.uIwhD7Pz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:15:
>> include/linux/kvm_host.h:727:20: error: redefinition of 'kvm_arch_supports_gmem'
    static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
                       ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:15:
   arch/arm64/include/asm/kvm_host.h:1677:20: note: previous definition of 'kvm_arch_supports_gmem' was here
    static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
                       ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/asm-offsets.c:15:
   include/linux/kvm_host.h:740:20: error: redefinition of 'kvm_arch_vm_supports_gmem_shared_mem'
    static inline bool kvm_arch_vm_supports_gmem_shared_mem(struct kvm *kvm)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:15:
   arch/arm64/include/asm/kvm_host.h:1682:20: note: previous definition of 'kvm_arch_vm_supports_gmem_shared_mem' was here
    static inline bool kvm_arch_vm_supports_gmem_shared_mem(struct kvm *kvm)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=1802608712
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2 shuffle=1802608712
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1802608712
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1802608712
   make: Target 'prepare' not remade because of errors.


vim +/kvm_arch_supports_gmem +727 include/linux/kvm_host.h

f481b069e674378 Paolo Bonzini       2015-05-17  721  
a7800aa80ea4d53 Sean Christopherson 2023-11-13  722  /*
0bd74ee4e718b0d Fuad Tabba          2025-05-13  723   * Arch code must define kvm_arch_supports_gmem if support for guest_memfd
a7800aa80ea4d53 Sean Christopherson 2023-11-13  724   * is enabled.
a7800aa80ea4d53 Sean Christopherson 2023-11-13  725   */
0bd74ee4e718b0d Fuad Tabba          2025-05-13  726  #if !defined(kvm_arch_supports_gmem) && !IS_ENABLED(CONFIG_KVM_GMEM)
0bd74ee4e718b0d Fuad Tabba          2025-05-13 @727  static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
a7800aa80ea4d53 Sean Christopherson 2023-11-13  728  {
a7800aa80ea4d53 Sean Christopherson 2023-11-13  729  	return false;
a7800aa80ea4d53 Sean Christopherson 2023-11-13  730  }
a7800aa80ea4d53 Sean Christopherson 2023-11-13  731  #endif
a7800aa80ea4d53 Sean Christopherson 2023-11-13  732  

:::::: The code at line 727 was first introduced by commit
:::::: 0bd74ee4e718b0d652602d430cf2e06b82750455 KVM: Rename kvm_arch_has_private_mem() to kvm_arch_supports_gmem()

:::::: TO: Fuad Tabba <tabba@google.com>
:::::: CC: Yan Zhao <yan.y.zhao@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
