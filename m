Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE03139D07
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 23:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732751304; cv=none; b=URharwYnTAQf7KW68rIOMvlbKBw/kF+693KQZ0AyxvH6b0KvMCJXW3eIf3F6HGEQQe3h1hogaKNBfcoVhMU6vMI16wQEdAmb2JpJwOVMJhF/KE1oKPePLEF8CuCTSngz6kum+YP+EsMrxblEKnttusA4CfYC2HCqyrWj88erPUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732751304; c=relaxed/simple;
	bh=L++95kFTGVifYdNmTrou1cuYOTrxQyVe5tDvgJ/HZjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=phxbTX/1SPtCRhhwwJ3+k+dkjn79SJpMA60y95tj1vOOruhBLX9O6r6MOCCNuSiuyunBngYMMKfHPaaL4vLeT0PQWemuvz1/wlQAVo1G+U8fxd7KRmY7Rub24FOkZpYBeQYfPdvym3Q13fjWPIg5NF36Q+oFX9XB04USgHt5sGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BzXZPRDL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzXZPRDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732751302; x=1764287302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L++95kFTGVifYdNmTrou1cuYOTrxQyVe5tDvgJ/HZjg=;
  b=BzXZPRDLHj0Ap5V1eG1xgBu6cEsjqswRepM8Cdw5AgrIZD3DCo1He/5D
   cSz54gDaONjNLpP97bLmEVF3Rb+OL9mL2xDLnwdABeToi2RYWGMjHu4VO
   MN+d1HQqtYrUHm450HHZCdu0pAlsA+KergBaeYaa33HbLXxF+2DCTBlsa
   l/UIj10xxSCQfomphOIdsjA9PAvNziD+4M14QsfDX4/oJk/zV2XoQ5O8L
   zsax4lmt3O3vZWaK2t4e4Fr3pEt/pBb8tnjCQoa4qmzOnLKEN2XVKEXk4
   WdcP6Vn6XdyAPEgrYlchN/tYoQwO3nvFuGyb4K6uyDaPxc+Q3UI+YnnIa
   Q==;
X-CSE-ConnectionGUID: HT6rzAQFQLOrh9hphVtSTg==
X-CSE-MsgGUID: PCnL/9S7TkGmh2mRVaMAjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="20566051"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="20566051"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 15:48:21 -0800
X-CSE-ConnectionGUID: a8Pg1GRESTOIqVZxpD/zcw==
X-CSE-MsgGUID: W0ZqSClxTLeOeiDYTtFneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97145110"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Nov 2024 15:48:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGRla-0008S5-0I;
	Wed, 27 Nov 2024 23:48:18 +0000
Date: Thu, 28 Nov 2024 07:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 194/328]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:1412:39: error: passing argument 1 of
 'handle_host_dynamic_hcall' from incompatible pointer type
Message-ID: <202411280739.jV5mZShK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c0d9896b3002fc622323de8e13e2217a746ef69d
commit: a9597bf5c067bf74a7982b06c0f9baa23f59dedb [194/328] ANDROID: KVM: arm64: Fix missing mask for custom hypercall handling
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241128/202411280739.jV5mZShK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280739.jV5mZShK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280739.jV5mZShK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/hyp-main.c:393:43: warning: initialized field overwritten [-Woverride-init]
     393 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:393:43: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:394:43: warning: initialized field overwritten [-Woverride-init]
     394 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:394:43: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:395:43: warning: initialized field overwritten [-Woverride-init]
     395 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:395:43: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:396:43: warning: initialized field overwritten [-Woverride-init]
     396 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:396:43: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:397:43: warning: initialized field overwritten [-Woverride-init]
     397 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:397:43: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:402:43: warning: initialized field overwritten [-Woverride-init]
     402 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:402:43: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:403:43: warning: initialized field overwritten [-Woverride-init]
     403 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:403:43: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:404:43: warning: initialized field overwritten [-Woverride-init]
     404 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:404:43: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:405:43: warning: initialized field overwritten [-Woverride-init]
     405 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:405:43: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:406:43: warning: initialized field overwritten [-Woverride-init]
     406 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:406:43: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:415:43: warning: initialized field overwritten [-Woverride-init]
     415 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:415:43: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:416:43: warning: initialized field overwritten [-Woverride-init]
     416 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:416:43: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:1412:39: error: passing argument 1 of 'handle_host_dynamic_hcall' from incompatible pointer type [-Wincompatible-pointer-types]
    1412 |         if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
         |                                       ^~~~~~~~~~~~~~~~
         |                                       |
         |                                       struct user_pt_regs *
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:21:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:24:51: note: expected 'struct kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
      24 | handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~


vim +/handle_host_dynamic_hcall +1412 arch/arm64/kvm/hyp/nvhe/hyp-main.c

  1390	
  1391	static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
  1392	{
  1393		DECLARE_REG(unsigned long, id, host_ctxt, 0);
  1394		unsigned long hcall_min = 0;
  1395		hcall_t hfn;
  1396	
  1397		/*
  1398		 * If pKVM has been initialised then reject any calls to the
  1399		 * early "privileged" hypercalls. Note that we cannot reject
  1400		 * calls to __pkvm_prot_finalize for two reasons: (1) The static
  1401		 * key used to determine initialisation must be toggled prior to
  1402		 * finalisation and (2) finalisation is performed on a per-CPU
  1403		 * basis. This is all fine, however, since __pkvm_prot_finalize
  1404		 * returns -EPERM after the first call for a given CPU.
  1405		 */
  1406		if (static_branch_unlikely(&kvm_protected_mode_initialized))
  1407			hcall_min = __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize;
  1408	
  1409		id &= ~ARM_SMCCC_CALL_HINTS;
  1410		id -= KVM_HOST_SMCCC_ID(0);
  1411	
> 1412		if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
  1413			goto end;
  1414	
  1415		if (unlikely(id < hcall_min || id >= ARRAY_SIZE(host_hcall)))
  1416			goto inval;
  1417	
  1418		hfn = host_hcall[id];
  1419		if (unlikely(!hfn))
  1420			goto inval;
  1421	
  1422		cpu_reg(host_ctxt, 0) = SMCCC_RET_SUCCESS;
  1423		hfn(host_ctxt);
  1424	end:
  1425		trace_host_hcall(id, 0);
  1426	
  1427		return;
  1428	inval:
  1429		trace_host_hcall(id, 1);
  1430		cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
  1431	}
  1432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
