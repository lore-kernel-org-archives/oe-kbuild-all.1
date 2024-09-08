Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7409139CF2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 22:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725833208; cv=none; b=qcyW48x5NGHnCr6m+lsL80wUBmT2R1q0/gQW84c8jnx8tram0EQLlQQU+Hd/Zc+pEZB8cwinSKbp90R5DwDU+BdpczRfJB6XaxK63j4u+2apdmX7d9IW8q5Css5bVQfgPBt16W5tf9Xc7ARhVckDVnHyRXe9LRLHFH3sd2mxCgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725833208; c=relaxed/simple;
	bh=yMvbJrdG/eRqX0y+LUU4/2HoWT+850ytYqRqo8ShUws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LwMXbobuARa0WIDfOgYJMCv0L44Zkonla6RDbkpoas++HKo8RjohfEZfCB03IUIA6PeV7MlcDqhmzG00eVSCO/4JLnNljfFzvodBKeLbq8cKawNWIVIdpfW+Nbv64ys/G5TinTlNqaJiNx1AhoU/KNohL4q/OEbKe8VAum5ETCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWqIRWIp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWqIRWIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725833206; x=1757369206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yMvbJrdG/eRqX0y+LUU4/2HoWT+850ytYqRqo8ShUws=;
  b=eWqIRWIpY9DN3TM0miyo9jL3YqmLdTSE2q/S3aJSHHG2Yh0tZ9yBCEfn
   YKRb7FB+HfadhjEvHhwwhelIDMzC998Y5x5FPMUnMpSGk6Nq+g+er1wc8
   CIPYinfqnJ1Ed8n9N6LWn98UFXw8Pi7zNmIeXAHQNFW00G4jGlFpgQE8W
   uK5MsQA0UG2OAPnWTN66YZMVw4L7vtR0gVJFmAE/CwvYmtIuj+DP5vKex
   xmfWPS5iiybYstJBKtyuhQxN3e0AU3tEkjrAtGtPbdCq1BSaLboe4I3xS
   eX1YST7UIC9iffwd9dZ37ctgbAghugnBZZwQpuELYqF2/gSlcWMWQLZwG
   Q==;
X-CSE-ConnectionGUID: T8VSON4jQsu3pMc9+jN/Mw==
X-CSE-MsgGUID: gGBPhPf1QNi/lwwasy01rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35085478"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="35085478"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 15:06:45 -0700
X-CSE-ConnectionGUID: UjdGQpHMQy2rLsn3/MEUDA==
X-CSE-MsgGUID: Zcss6zRQRg2roYzO94FGpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="67208676"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Sep 2024 15:06:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snQ3N-000E1X-28;
	Sun, 08 Sep 2024 22:06:41 +0000
Date: Mon, 9 Sep 2024 06:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:1652:32: error: incompatible pointer
 types passing 'struct user_pt_regs *' to parameter of type 'struct
 kvm_cpu_context *'
Message-ID: <202409090626.BppVJ37e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   73613a1daf068f5a55ff6323171266d9af1d4403
commit: 718bf2535e3912862e7f3aedb4a04f7377e7af3b [2/2] ANDROID: KVM: arm64: Fix missing mask for custom hypercall handling
config: arm64-randconfig-r062-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090626.BppVJ37e-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090626.BppVJ37e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090626.BppVJ37e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:7:
   In file included from include/kvm/arm_hypercalls.h:7:
   In file included from arch/arm64/include/asm/kvm_emulate.h:14:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2180:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:22:
   In file included from arch/arm64/kvm/hyp/include/nvhe/iommu.h:9:
   In file included from include/linux/io-pgtable-arm.h:167:
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:15: error: expected string literal in 'asm'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^
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
   3 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


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
