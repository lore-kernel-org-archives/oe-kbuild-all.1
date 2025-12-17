Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EE83246F0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960233; cv=none; b=TjIj6dFzizAPMGme/rUkUytJ1V7cOpuR/b3z18Ho0cOUrunZtdac8AFogwur6l/oO5Gexlpq5zqzkZjy3H3mTWqXIXzEMZxNo5sKHi0V9VO8ljYw7Nah9Dwm9/iOaa754C1bAZwXjzL6VvWKjco9elPHAmE4ALGCrIZlKjr8brE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960233; c=relaxed/simple;
	bh=yy6l5hucZSbJTo800y4HY2YNLNxG+Nc9ulyqylHIl7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qt0mSeMZLOPQf2tjMCHR9MtG/i2TnbLPj6CRDvlyYZ4U3fvCZDNsO1uPoDzP+iThZKj9n2lcJd6hbjqFEoa64/ahF5o2p7zrS7qTHJZM2agXXqqR6L6ma2xy1+gIOsbNTtiOCQoGDbwqUboJuSTKfKqF/tF8bcJvsSoD9j+ZZZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZG+lCoZh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZG+lCoZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765960229; x=1797496229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yy6l5hucZSbJTo800y4HY2YNLNxG+Nc9ulyqylHIl7U=;
  b=ZG+lCoZh5M8XM7MgNzA4wDeSYzusgIYKaJUguyiW7Hgu2Mw4Q2p/jBVQ
   tQLF+1xHXzB0irTHDgMEo1/yakPHIMEuOVBrOiFg2ZAPvF5FxAaSKyzsJ
   Yg/2boZCgy8SyIUFR9xKhfqVSfK5AZRyvJ4vndK76TCM6pha++TQQgy42
   KBVNpM+PLeHVFuJltM77gqyHmbSOL4OsJFASAkAlKemmPFDtJQNabNGqt
   a051kfxwuJIfwjSzw2hZ+w+stii0zcvXxPZVJgRo17DlDG3LJEv4RdLHb
   neuxqhtj2PhwKOXGrP0tT24vO2zuW+NEPEUPRb1MVDIakM0brkwjlOihy
   g==;
X-CSE-ConnectionGUID: jP7fGQXPRzuWYaszqe/UIg==
X-CSE-MsgGUID: CPM4B/AdQGGT0pZF6GRzDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="68049863"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="68049863"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 00:29:22 -0800
X-CSE-ConnectionGUID: 0nidvcguQ1KVP9yBLh2gLg==
X-CSE-MsgGUID: hCdvzFeBSbSlw544jCog2g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Dec 2025 00:29:21 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVmuM-000000000Dd-2lBh;
	Wed, 17 Dec 2025 08:29:18 +0000
Date: Wed, 17 Dec 2025 16:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:55:22: warning: 'pkvm_host_id'
 defined but not used
Message-ID: <202512171657.bhAZIkCQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: 5da4a4ca5f6805c27ccd1fc48e4bec11764819d2 [2/2] ANDROID: BACKPORT: KVM: arm64: Make owner ids 32 bits wide
config: arm64-randconfig-003-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171657.bhAZIkCQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171657.bhAZIkCQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171657.bhAZIkCQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:17:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:22: warning: 'pkvm_guest_id' defined but not used [-Wunused-const-variable=]
      57 | static const pkvm_id pkvm_guest_id = 2;
         |                      ^~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:56:22: warning: 'pkvm_hyp_id' defined but not used [-Wunused-const-variable=]
      56 | static const pkvm_id pkvm_hyp_id = 1;
         |                      ^~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:55:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
      55 | static const pkvm_id pkvm_host_id = 0;
         |                      ^~~~~~~~~~~~
--
   arch/arm64/kvm/hyp/nvhe/setup.c:277:17: warning: no previous prototype for '__pkvm_init_finalise' [-Wmissing-prototypes]
     277 | void __noreturn __pkvm_init_finalise(void)
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/include/nvhe/iommu.h:8,
                    from arch/arm64/kvm/hyp/nvhe/setup.c:15:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:22: warning: 'pkvm_guest_id' defined but not used [-Wunused-const-variable=]
      57 | static const pkvm_id pkvm_guest_id = 2;
         |                      ^~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:55:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
      55 | static const pkvm_id pkvm_host_id = 0;
         |                      ^~~~~~~~~~~~
--
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:321:22: warning: initialized field overwritten [-Woverride-init]
     321 |  [ESR_ELx_EC_WFx]  = handle_pvm_entry_wfx,
         |                      ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:321:22: note: (near initialization for 'entry_shadow_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:322:24: warning: initialized field overwritten [-Woverride-init]
     322 |  [ESR_ELx_EC_HVC64]  = handle_pvm_entry_hvc64,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:322:24: note: (near initialization for 'entry_shadow_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:323:24: warning: initialized field overwritten [-Woverride-init]
     323 |  [ESR_ELx_EC_SYS64]  = handle_pvm_entry_sys64,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:323:24: note: (near initialization for 'entry_shadow_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:324:27: warning: initialized field overwritten [-Woverride-init]
     324 |  [ESR_ELx_EC_IABT_LOW]  = handle_pvm_entry_iabt,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:324:27: note: (near initialization for 'entry_shadow_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:325:27: warning: initialized field overwritten [-Woverride-init]
     325 |  [ESR_ELx_EC_DABT_LOW]  = handle_pvm_entry_dabt,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:325:27: note: (near initialization for 'entry_shadow_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:330:22: warning: initialized field overwritten [-Woverride-init]
     330 |  [ESR_ELx_EC_WFx]  = handle_pvm_exit_wfx,
         |                      ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:330:22: note: (near initialization for 'exit_shadow_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:331:24: warning: initialized field overwritten [-Woverride-init]
     331 |  [ESR_ELx_EC_HVC64]  = handle_pvm_exit_hvc64,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:331:24: note: (near initialization for 'exit_shadow_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:332:24: warning: initialized field overwritten [-Woverride-init]
     332 |  [ESR_ELx_EC_SYS64]  = handle_pvm_exit_sys64,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:332:24: note: (near initialization for 'exit_shadow_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:333:27: warning: initialized field overwritten [-Woverride-init]
     333 |  [ESR_ELx_EC_IABT_LOW]  = handle_pvm_exit_iabt,
         |                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:333:27: note: (near initialization for 'exit_shadow_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:334:27: warning: initialized field overwritten [-Woverride-init]
     334 |  [ESR_ELx_EC_DABT_LOW]  = handle_pvm_exit_dabt,
         |                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:334:27: note: (near initialization for 'exit_shadow_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:919:6: warning: no previous prototype for 'handle_trap' [-Wmissing-prototypes]
     919 | void handle_trap(struct kvm_cpu_context *host_ctxt)
         |      ^~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/include/nvhe/iommu.h:8,
                    from arch/arm64/kvm/hyp/nvhe/hyp-main.c:18:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:22: warning: 'pkvm_guest_id' defined but not used [-Wunused-const-variable=]
      57 | static const pkvm_id pkvm_guest_id = 2;
         |                      ^~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:56:22: warning: 'pkvm_hyp_id' defined but not used [-Wunused-const-variable=]
      56 | static const pkvm_id pkvm_hyp_id = 1;
         |                      ^~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:55:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
      55 | static const pkvm_id pkvm_host_id = 0;
         |                      ^~~~~~~~~~~~
--
   arch/arm64/kvm/hyp/nvhe/switch.c:208:26: warning: initialized field overwritten [-Woverride-init]
     208 |  [ESR_ELx_EC_CP15_32]  = kvm_hyp_handle_cp15_32,
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:208:26: note: (near initialization for 'hyp_exit_handlers[3]')
   arch/arm64/kvm/hyp/nvhe/switch.c:209:24: warning: initialized field overwritten [-Woverride-init]
     209 |  [ESR_ELx_EC_SYS64]  = kvm_hyp_handle_sysreg,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:209:24: note: (near initialization for 'hyp_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:210:22: warning: initialized field overwritten [-Woverride-init]
     210 |  [ESR_ELx_EC_SVE]  = kvm_hyp_handle_fpsimd,
         |                      ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:210:22: note: (near initialization for 'hyp_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:211:27: warning: initialized field overwritten [-Woverride-init]
     211 |  [ESR_ELx_EC_FP_ASIMD]  = kvm_hyp_handle_fpsimd,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:211:27: note: (near initialization for 'hyp_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:212:27: warning: initialized field overwritten [-Woverride-init]
     212 |  [ESR_ELx_EC_IABT_LOW]  = kvm_hyp_handle_iabt_low,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:212:27: note: (near initialization for 'hyp_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:213:27: warning: initialized field overwritten [-Woverride-init]
     213 |  [ESR_ELx_EC_DABT_LOW]  = kvm_hyp_handle_dabt_low,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:213:27: note: (near initialization for 'hyp_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:214:22: warning: initialized field overwritten [-Woverride-init]
     214 |  [ESR_ELx_EC_PAC]  = kvm_hyp_handle_ptrauth,
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:214:22: note: (near initialization for 'hyp_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:219:24: warning: initialized field overwritten [-Woverride-init]
     219 |  [ESR_ELx_EC_HVC64]  = kvm_handle_pvm_hvc64,
         |                        ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:219:24: note: (near initialization for 'pvm_exit_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/switch.c:220:24: warning: initialized field overwritten [-Woverride-init]
     220 |  [ESR_ELx_EC_SYS64]  = kvm_handle_pvm_sys64,
         |                        ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:220:24: note: (near initialization for 'pvm_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:221:22: warning: initialized field overwritten [-Woverride-init]
     221 |  [ESR_ELx_EC_SVE]  = kvm_handle_pvm_restricted,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:221:22: note: (near initialization for 'pvm_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:222:27: warning: initialized field overwritten [-Woverride-init]
     222 |  [ESR_ELx_EC_FP_ASIMD]  = kvm_handle_pvm_fpsimd,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:222:27: note: (near initialization for 'pvm_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:223:27: warning: initialized field overwritten [-Woverride-init]
     223 |  [ESR_ELx_EC_IABT_LOW]  = kvm_hyp_handle_iabt_low,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:223:27: note: (near initialization for 'pvm_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:224:27: warning: initialized field overwritten [-Woverride-init]
     224 |  [ESR_ELx_EC_DABT_LOW]  = kvm_hyp_handle_dabt_low,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:224:27: note: (near initialization for 'pvm_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:225:22: warning: initialized field overwritten [-Woverride-init]
     225 |  [ESR_ELx_EC_PAC]  = kvm_hyp_handle_ptrauth,
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:225:22: note: (near initialization for 'pvm_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:362:17: warning: no previous prototype for 'hyp_panic' [-Wmissing-prototypes]
     362 | void __noreturn hyp_panic(void)
         |                 ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:384:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     384 | asmlinkage void kvm_unexpected_el2_exception(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:29:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:22: warning: 'pkvm_guest_id' defined but not used [-Wunused-const-variable=]
      57 | static const pkvm_id pkvm_guest_id = 2;
         |                      ^~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:56:22: warning: 'pkvm_hyp_id' defined but not used [-Wunused-const-variable=]
      56 | static const pkvm_id pkvm_hyp_id = 1;
         |                      ^~~~~~~~~~~
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:55:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
      55 | static const pkvm_id pkvm_host_id = 0;
         |                      ^~~~~~~~~~~~


vim +/pkvm_host_id +55 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h

    53	
    54	typedef u32 pkvm_id;
  > 55	static const pkvm_id pkvm_host_id	= 0;
    56	static const pkvm_id pkvm_hyp_id	= 1;
  > 57	static const pkvm_id pkvm_guest_id	= 2;
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
