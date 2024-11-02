Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E2118A925
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730556945; cv=none; b=peoIMZHm+IVyX4aMuKmGQ7mBa40iIZRqRQthFoATuKTjtBLJqBep8ktSRu4COJne6coUMJh7/PV9I/uzKOrFErDrmHuFq/15lsPvTkeo4KprplCzX9DRzGHMYRvqWo4laEzKHINFv+s1D2H/yfJZL1URhVCYjYbwvrM6zpchj2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730556945; c=relaxed/simple;
	bh=IgDeAUzYxb1Fo38cc6C1G4XaRVWee0V2M1rPDOSgCXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iDi6YRDljbFGffK0iE6NDn/PB3HMAhv1FE9DnsEUnNhbndYepsnBeodPXh0SR5LOPQ4NZOX3GjDlX3M1FMriqQhUn+XZTyUH1eJk3v3ss6BDLP3pkC0Z+BMIaFwK33MsQboCW7jYvU1pLclTrsUJMX7dI0q6sNMF+XBlBz1+YIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaMF1YCl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaMF1YCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730556943; x=1762092943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IgDeAUzYxb1Fo38cc6C1G4XaRVWee0V2M1rPDOSgCXE=;
  b=UaMF1YClOxyfyDKp1e9lEQCbROpvS1DNTgXP1wZf2nnVJ22vQ3ttkYyT
   VMNawa3LwPsY3YqPgBZDsdhlVlDjFUgNe34hbsXNy1t2nNxeedsFvUPbw
   gtnx1GouXmOgBZMzWv3uWmr2BMcr+DsvWJ131hSY63kcu/gLy5a75EPYB
   Cr+kvj71k1YkakgKLBAIPbV1uGP9B3B8IZTOb1hEYIvTMmMWDuz1PRPot
   zznGC81DpDm1qLuGBWBdgyHYDdZGJ+/qF3y+V9hxFjJ69tSSAjIjP3OAV
   5t6Z3P9chkchFQpJUlQGhUnxO9ww4/8bbk6yT9d9hceZ/tR2ZnVi0vSmZ
   Q==;
X-CSE-ConnectionGUID: /pSizLwvTCWh9KEq3H/Vjw==
X-CSE-MsgGUID: dj1kg0ToRyWJ79F27ulhaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30485193"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30485193"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 07:15:40 -0700
X-CSE-ConnectionGUID: iROgqnsrROmf8l1W2Ao5Qw==
X-CSE-MsgGUID: 90qJETIuSD60VKiHvGGaVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="114037552"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Nov 2024 07:15:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Euf-000j3L-1r;
	Sat, 02 Nov 2024 14:15:37 +0000
Date: Sat, 2 Nov 2024 22:14:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-11 1/1]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:1652:32: error: incompatible pointer
 types passing 'struct user_pt_regs *' to parameter of type 'struct
 kvm_cpu_context *'
Message-ID: <202411022219.8pq8uBDG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-11
head:   4dc1c153f7b0c12b5ace41e7383514e9ab54cd3b
commit: 718bf2535e3912862e7f3aedb4a04f7377e7af3b [1/1] ANDROID: KVM: arm64: Fix missing mask for custom hypercall handling
config: arm64-randconfig-002-20241102 (https://download.01.org/0day-ci/archive/20241102/202411022219.8pq8uBDG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411022219.8pq8uBDG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411022219.8pq8uBDG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:7:
   In file included from include/kvm/arm_hypercalls.h:7:
   In file included from arch/arm64/include/asm/kvm_emulate.h:14:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2180:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:88:6: warning: no previous prototype for function '__pkvm_unmask_serror' [-Wmissing-prototypes]
      88 | void __pkvm_unmask_serror(void)
         |      ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:88:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      88 | void __pkvm_unmask_serror(void)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:796:8: warning: unused variable 'vq_len' [-Wunused-variable]
     796 |                         u64 vq_len = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
         |                             ^~~~~~
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:1652:32: error: incompatible pointer types passing 'struct user_pt_regs *' to parameter of type 'struct kvm_cpu_context *' [-Werror,-Wincompatible-pointer-types]
    1652 |         if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
         |                                       ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:25:51: note: passing argument to parameter 'host_ctxt' here
      25 | handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
         |                                                   ^
   7 warnings and 1 error generated.


vim +1652 arch/arm64/kvm/hyp/nvhe/hyp-main.c

  1630	
  1631	static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
  1632	{
  1633		DECLARE_REG(unsigned long, id, host_ctxt, 0);
  1634		unsigned long hcall_min = 0;
  1635		hcall_t hfn;
  1636	
  1637		/*
  1638		 * If pKVM has been initialised then reject any calls to the
  1639		 * early "privileged" hypercalls. Note that we cannot reject
  1640		 * calls to __pkvm_prot_finalize for two reasons: (1) The static
  1641		 * key used to determine initialisation must be toggled prior to
  1642		 * finalisation and (2) finalisation is performed on a per-CPU
  1643		 * basis. This is all fine, however, since __pkvm_prot_finalize
  1644		 * returns -EPERM after the first call for a given CPU.
  1645		 */
  1646		if (static_branch_unlikely(&kvm_protected_mode_initialized))
  1647			hcall_min = __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize;
  1648	
  1649		id &= ~ARM_SMCCC_CALL_HINTS;
  1650		id -= KVM_HOST_SMCCC_ID(0);
  1651	
> 1652		if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
  1653			goto end;
  1654	
  1655		if (unlikely(id < hcall_min || id >= ARRAY_SIZE(host_hcall)))
  1656			goto inval;
  1657	
  1658		hfn = host_hcall[id];
  1659		if (unlikely(!hfn))
  1660			goto inval;
  1661	
  1662		cpu_reg(host_ctxt, 0) = SMCCC_RET_SUCCESS;
  1663		hfn(host_ctxt);
  1664	end:
  1665		trace_host_hcall(id, 0);
  1666	
  1667		return;
  1668	inval:
  1669		trace_host_hcall(id, 1);
  1670		cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
  1671	}
  1672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
