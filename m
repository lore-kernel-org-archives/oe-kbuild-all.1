Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B5319865
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 18:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755196921; cv=none; b=f9Xh4C9O6YTFsSPTg5FRr4WFA8lJnPTYPbbSOSodILDMraAh4ALrnbO050QNQbojiy68viHxpnWpRLPLpmRzN4qQwZb+9qU6aNq0Crx0N6zDFuV1RoYI6HR1Xlya9kU+O/elqAn0G/M8mS0EbGKfwufH4MEh6oTXQTV9NxcotUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755196921; c=relaxed/simple;
	bh=7e6kw1js69bNwfs3lg2Wyv/vweGDVvRrMXY8Tg7JiXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bVzoJYixhgdiBuulWsVx5Bce1HwNU2YPgfTdLBNhPlUyh4onYPiQlpr8vQHU/VXIguAyeyU3wcYq+CYqZbIO8S1JgzLf2ZWtcNi1hIWpZ6TuJLL2ZJpW3rVWuO211ed+aVH14WKi4OFG8P1o4BIiPpSTyRZCwj+O1aPUs/kwObo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LK9QdziX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LK9QdziX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755196920; x=1786732920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7e6kw1js69bNwfs3lg2Wyv/vweGDVvRrMXY8Tg7JiXs=;
  b=LK9QdziXyAfLuofoEofkb5SsuS9gfgVti5etk980CvNyKkq3hq1wf28c
   2Nvl99MGTIc6ta63arLt6KRjAKEYDiS4YZBVNKyCpIXsk9Pbdc9PoN6hJ
   FZaAjdnPonP4X5LMOr/dV/rkRE3FL5YMxyL/2tN3D4B33I1Z3sdVYKvSW
   5sEKw2Covzdk20oRJ5KOWbsL8AnBReCEWsk6Uuh5oXyuzpX6n0QmC3nWf
   ai7XRAWHHcTkreXVsEPY4b5bWI/Hcm0hRuR+FxK+0ppA05EOzR3PwBpTn
   R9zFRmqzOBrf/qw+XZQmCOAgK6fFq0saOp/pKb6iaRFGcGoa65v5bcbFJ
   w==;
X-CSE-ConnectionGUID: J/LlaDUMSeuTyaOU4OtUJw==
X-CSE-MsgGUID: fnmSGottSRCC4pOrZqpw/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57449061"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57449061"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 11:42:00 -0700
X-CSE-ConnectionGUID: exXnZ1pRSDKPC2BWffRIlQ==
X-CSE-MsgGUID: 6qZdh5FyQhyU0m32lz3uag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197822356"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 14 Aug 2025 11:41:58 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umctg-0000Jv-0R;
	Thu, 14 Aug 2025 18:41:56 +0000
Date: Thu, 14 Aug 2025 20:40:58 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:1412:32: error: incompatible pointer
 types passing 'struct user_pt_regs *' to parameter of type 'struct
 kvm_cpu_context *'
Message-ID: <202508142043.5MGzQeU2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   125206b4d7d6898a8a5d0c088a5ba75114266b81
commit: a9597bf5c067bf74a7982b06c0f9baa23f59dedb [4/4] ANDROID: KVM: arm64: Fix missing mask for custom hypercall handling
config: arm64-randconfig-2002-20250814 (https://download.01.org/0day-ci/archive/20250814/202508142043.5MGzQeU2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7d886fab74d4037d654d02bed24dd97c0ba863d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142043.5MGzQeU2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142043.5MGzQeU2-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:392:28: note: previous initialization is here
     392 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:394:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     394 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:392:28: note: previous initialization is here
     392 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:395:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     395 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:392:28: note: previous initialization is here
     392 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:396:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     396 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:392:28: note: previous initialization is here
     392 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:397:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     397 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:392:28: note: previous initialization is here
     392 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:402:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     402 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:401:28: note: previous initialization is here
     401 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:403:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     403 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:401:28: note: previous initialization is here
     401 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:404:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     404 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:401:28: note: previous initialization is here
     401 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:405:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     405 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:401:28: note: previous initialization is here
     401 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:406:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     406 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:401:28: note: previous initialization is here
     401 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:415:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     415 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:414:28: note: previous initialization is here
     414 |         [0 ... ESR_ELx_EC_MAX]          = handle_vm_exit_generic,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:416:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     416 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:414:28: note: previous initialization is here
     414 |         [0 ... ESR_ELx_EC_MAX]          = handle_vm_exit_generic,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:1412:32: error: incompatible pointer types passing 'struct user_pt_regs *' to parameter of type 'struct kvm_cpu_context *' [-Werror,-Wincompatible-pointer-types]
    1412 |         if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
         |                                       ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:24:51: note: passing argument to parameter 'host_ctxt' here
      24 | handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
         |                                                   ^
   12 warnings and 1 error generated.


vim +1412 arch/arm64/kvm/hyp/nvhe/hyp-main.c

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
