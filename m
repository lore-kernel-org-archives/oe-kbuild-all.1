Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1691AACC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 10:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706093584; cv=none; b=L/jnqUMOJPEkP1yzUhfIL6JeWR8QWlGHXgY0g2KLm0FHYXOB7XzZ99WXOAB2ybuuAVER9vp50bh2eDQguJ8AU8MlNYyogKRahLLh69WgZ0sVAHmQkEQ8W/ijK4QWzx4SPS+1B2peEjfAi01ZwZNqatqbmPel9kjio+SQEVQuZ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706093584; c=relaxed/simple;
	bh=EUA5NWRvCc7C81SfhZFnLiKt8jW4z3I9Hfz2aonFqMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LE3xSoxTcw14J1Ei4cbCbdTc0XLcIlEkfr9cvSok5bfGCB1KtkSVkJSmjEzoayWttN69nUucQ0IeqJLCF40nc4hH2B8kEBWApR0seo+ye0CxjnMbadJrP56OFKEhdGeyoqz4nvlb1aqnQHmd2Jk5McKRNFfCkh7hUZz78xiRKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmTDUXNO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmTDUXNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706093582; x=1737629582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EUA5NWRvCc7C81SfhZFnLiKt8jW4z3I9Hfz2aonFqMM=;
  b=CmTDUXNOxsHLXwGTNz0bXqs/0Tr7pZLmKJ3zarYGquS8P2XhppnmtK2P
   J9MWcb26MrUIJ+RDE629rG4vP9B4dlHoR/cEqguQ4VwDxF34FqZjDBLIm
   2JgZAoYWSaWcqUJ9+t3NxNWEW7tMoi8oRCP6FiGx7XcHNxr/EKpn/aeUW
   uSj8DUbVmyQzPRClqLxwcqQVfp+Jz0ympVVdFjfSzmzON1t8/BrJdm+Ca
   f+gR6vNUwJ6yrbCLCr+Q16OoEMb2Yg8wispek9TIKAQGYFKn3CpCOVn5/
   6skYaIezXFTDKd+MrtkJXk0Anh83gMQwhONUAzvOYflYxDYg5ToHIsbgT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="20363064"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="20363064"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 02:53:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1977320"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jan 2024 02:52:59 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSasL-00084H-1t;
	Wed, 24 Jan 2024 10:52:57 +0000
Date: Wed, 24 Jan 2024 18:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 72/175]
 arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:22: error: expected string
 literal before '__LSE_PREAMBLE'
Message-ID: <202401241842.FGvArGJa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   faf8e92b3bdd8457b68cf85e37cdcd4a4ed867e9
commit: 6b29a1afdbebcc81e940e5c0f648aa1c32d3325d [72/175] ANDROID: KVM: arm64: Use atomic refcount helpers for 'struct hyp_page::refcount'
config: arm64-randconfig-004-20240123 (https://download.01.org/0day-ci/archive/20240124/202401241842.FGvArGJa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241842.FGvArGJa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241842.FGvArGJa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9,
                    from arch/arm64/kvm/hyp/hyp-constants.c:4:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h: In function '__lse_refcount_fetch_add_16':
>> arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:22: error: expected string literal before '__LSE_PREAMBLE'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9,
                    from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/include/nvhe/pkvm.h:12,
                    from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:14,
                    from arch/arm64/kvm/hyp/nvhe/hyp-main.c:19:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h: In function '__lse_refcount_fetch_add_16':
>> arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:22: error: expected string literal before '__LSE_PREAMBLE'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: At top level:
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:362:43: warning: initialized field overwritten [-Woverride-init]
     362 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:362:43: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:363:43: warning: initialized field overwritten [-Woverride-init]
     363 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:363:43: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:364:43: warning: initialized field overwritten [-Woverride-init]
     364 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:364:43: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:365:43: warning: initialized field overwritten [-Woverride-init]
     365 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:365:43: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:366:43: warning: initialized field overwritten [-Woverride-init]
     366 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:366:43: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:371:43: warning: initialized field overwritten [-Woverride-init]
     371 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:371:43: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:372:43: warning: initialized field overwritten [-Woverride-init]
     372 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:372:43: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:373:43: warning: initialized field overwritten [-Woverride-init]
     373 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:373:43: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:374:43: warning: initialized field overwritten [-Woverride-init]
     374 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:374:43: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:375:43: warning: initialized field overwritten [-Woverride-init]
     375 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:375:43: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:384:43: warning: initialized field overwritten [-Woverride-init]
     384 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:384:43: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:385:43: warning: initialized field overwritten [-Woverride-init]
     385 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:385:43: note: (near initialization for 'exit_hyp_vm_handlers[36]')
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9,
                    from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/include/nvhe/pkvm.h:12,
                    from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:14,
                    from arch/arm64/kvm/hyp/nvhe/switch.c:29:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h: In function '__lse_refcount_fetch_add_16':
>> arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:22: error: expected string literal before '__LSE_PREAMBLE'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c: At top level:
   arch/arm64/kvm/hyp/nvhe/switch.c:187:43: warning: initialized field overwritten [-Woverride-init]
     187 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:187:43: note: (near initialization for 'hyp_exit_handlers[3]')
   arch/arm64/kvm/hyp/nvhe/switch.c:188:43: warning: initialized field overwritten [-Woverride-init]
     188 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:188:43: note: (near initialization for 'hyp_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:189:43: warning: initialized field overwritten [-Woverride-init]
     189 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:189:43: note: (near initialization for 'hyp_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:190:43: warning: initialized field overwritten [-Woverride-init]
     190 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:190:43: note: (near initialization for 'hyp_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:191:43: warning: initialized field overwritten [-Woverride-init]
     191 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:191:43: note: (near initialization for 'hyp_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:192:43: warning: initialized field overwritten [-Woverride-init]
     192 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:192:43: note: (near initialization for 'hyp_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:193:43: warning: initialized field overwritten [-Woverride-init]
     193 |         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:193:43: note: (near initialization for 'hyp_exit_handlers[52]')
   arch/arm64/kvm/hyp/nvhe/switch.c:194:43: warning: initialized field overwritten [-Woverride-init]
     194 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:194:43: note: (near initialization for 'hyp_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:199:43: warning: initialized field overwritten [-Woverride-init]
     199 |         [ESR_ELx_EC_HVC64]              = kvm_handle_pvm_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:199:43: note: (near initialization for 'pvm_exit_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/switch.c:200:43: warning: initialized field overwritten [-Woverride-init]
     200 |         [ESR_ELx_EC_SYS64]              = kvm_handle_pvm_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:200:43: note: (near initialization for 'pvm_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:201:43: warning: initialized field overwritten [-Woverride-init]
     201 |         [ESR_ELx_EC_SVE]                = kvm_handle_pvm_restricted,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:201:43: note: (near initialization for 'pvm_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:202:43: warning: initialized field overwritten [-Woverride-init]
     202 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:202:43: note: (near initialization for 'pvm_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:203:43: warning: initialized field overwritten [-Woverride-init]
     203 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:203:43: note: (near initialization for 'pvm_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:204:43: warning: initialized field overwritten [-Woverride-init]
     204 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:204:43: note: (near initialization for 'pvm_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:205:43: warning: initialized field overwritten [-Woverride-init]
     205 |         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:205:43: note: (near initialization for 'pvm_exit_handlers[52]')
   arch/arm64/kvm/hyp/nvhe/switch.c:206:43: warning: initialized field overwritten [-Woverride-init]
     206 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:206:43: note: (near initialization for 'pvm_exit_handlers[9]')


vim +/__LSE_PREAMBLE +35 arch/arm64/kvm/hyp/include/nvhe/refcount.h

bb06ac6eeaa7e6 Will Deacon 2023-06-30  30  
bb06ac6eeaa7e6 Will Deacon 2023-06-30  31  static inline s16 __lse_refcount_fetch_add_16(u16 *refcount, s16 addend)
bb06ac6eeaa7e6 Will Deacon 2023-06-30  32  {
bb06ac6eeaa7e6 Will Deacon 2023-06-30  33  	s16 old;
bb06ac6eeaa7e6 Will Deacon 2023-06-30  34  
bb06ac6eeaa7e6 Will Deacon 2023-06-30 @35  	asm volatile(__LSE_PREAMBLE
bb06ac6eeaa7e6 Will Deacon 2023-06-30  36  	"	ldaddh	%w[addend], %w[old], %[refcount]"
bb06ac6eeaa7e6 Will Deacon 2023-06-30  37  	: [refcount] "+Q" (*refcount),
bb06ac6eeaa7e6 Will Deacon 2023-06-30  38  	  [old] "=r" (old)
bb06ac6eeaa7e6 Will Deacon 2023-06-30  39  	: [addend] "r" (addend));
bb06ac6eeaa7e6 Will Deacon 2023-06-30  40  
bb06ac6eeaa7e6 Will Deacon 2023-06-30  41  	return old + addend;
bb06ac6eeaa7e6 Will Deacon 2023-06-30  42  }
bb06ac6eeaa7e6 Will Deacon 2023-06-30  43  

:::::: The code at line 35 was first introduced by commit
:::::: bb06ac6eeaa7e68e1c532bda6814d1d2108f44d8 ANDROID: KVM: arm64: Add atomics-based checking refcount implementation at EL2

:::::: TO: Will Deacon <willdeacon@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
