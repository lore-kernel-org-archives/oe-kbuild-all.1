Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7670912FF8E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 15:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708097355; cv=none; b=pUE1NVcqTmA5iBCgGd0YKfLjby34h1LZc6F3Cn1WrgUDbnp6ZEAkNg0mg8AcEGoeIrB8DvMJc4HLUpHaMtVFfi24kFXjQVhp8AHX2gxSuIiD5U+RbPcJSJ8kQPwWwXmQ0hKlnqhpZ/uQ6dI3LeIE/sPFCzgACOO7eDTs521N9jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708097355; c=relaxed/simple;
	bh=cDGnAIznmV7dXCT/TkyBGmvmN4LxQXTrGN0kjdhTaG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qsbfGzCF8IG5gLstEAt0gvfMgMr+UmAAolYMDh75HPi9eaNE0pL0TQcNkQv1g2wmcwWWmcH4v96GM09tpJGQcgDVXAfSwltLNmI+GdQT5KVz+10JWbVSJDwbIm5VFtzqh6dTnt5zgngdQn4wml2xyionVmIyOUJdeCGJI4TmnGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTcWEsAq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTcWEsAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708097353; x=1739633353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cDGnAIznmV7dXCT/TkyBGmvmN4LxQXTrGN0kjdhTaG4=;
  b=PTcWEsAqEDJCiNJSKyY/I3XDsP2kJaOMa4jaaTgiK5QFmS+NvkwmXcN6
   re54GfT86e/4tlRqKaRvQnyfAoYt6iZbFQ1IdsqihLYPYwvYNSSx1s7eo
   6ZpjWlShH/Feweg8/khGqJBcVshHmUwcTS66BQu+nnsi3m/PSWAT7SYDO
   YQOzi1z6X4QKUi2UcSlFe3B3+b5+X+puVUXCCJbl3P79pFQTqtSrvtBU1
   8e8tbPpP9dEjwKbnYW3PDulokKB5FEYjp6mkGqLmXNsTrEZiDKOj7nScN
   MmAsKJTgUJUs/Xvm38FFWR132YF4xa63DOi9sUny3cGs1jS1Nx5eOu/G2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2094541"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="2094541"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 07:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="4256276"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Feb 2024 07:29:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rb09B-0001O0-2A;
	Fri, 16 Feb 2024 15:29:05 +0000
Date: Fri, 16 Feb 2024 23:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:56:6: warning: no previous prototype for
 '__pkvm_unmask_serror'
Message-ID: <202402162349.YQga25nD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   f16d68f570b8c6c3e0d2e7f6c1aaf546e93e34cd
commit: 9793ef67e848bc2bb24fb5097353abad9a7fce5e [1/1] ANDROID: KVM: arm64: Add pKVM module register_unmask_serror
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240216/202402162349.YQga25nD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402162349.YQga25nD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402162349.YQga25nD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:56:6: warning: no previous prototype for '__pkvm_unmask_serror' [-Wmissing-prototypes]
      56 | void __pkvm_unmask_serror(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:43: warning: initialized field overwritten [-Woverride-init]
     454 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:43: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:455:43: warning: initialized field overwritten [-Woverride-init]
     455 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:455:43: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:456:43: warning: initialized field overwritten [-Woverride-init]
     456 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:456:43: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:457:43: warning: initialized field overwritten [-Woverride-init]
     457 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:457:43: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:458:43: warning: initialized field overwritten [-Woverride-init]
     458 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:458:43: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:43: warning: initialized field overwritten [-Woverride-init]
     463 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:43: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:43: warning: initialized field overwritten [-Woverride-init]
     464 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:43: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:43: warning: initialized field overwritten [-Woverride-init]
     465 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:43: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:43: warning: initialized field overwritten [-Woverride-init]
     466 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:43: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:43: warning: initialized field overwritten [-Woverride-init]
     467 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:43: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:43: warning: initialized field overwritten [-Woverride-init]
     476 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:43: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:43: warning: initialized field overwritten [-Woverride-init]
     477 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:43: note: (near initialization for 'exit_hyp_vm_handlers[36]')


vim +/__pkvm_unmask_serror +56 arch/arm64/kvm/hyp/nvhe/hyp-main.c

    55	
  > 56	void __pkvm_unmask_serror(void)
    57	{
    58		u64 hcr = read_sysreg(HCR_EL2);
    59	
    60		if (!unmask_serror || !unmask_serror())
    61			return;
    62	
    63		write_sysreg(hcr | HCR_AMO, HCR_EL2);
    64		asm volatile("msr daifclr, #4");
    65		isb();
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
