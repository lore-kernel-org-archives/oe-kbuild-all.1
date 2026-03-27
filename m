Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705AD2EB878
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611332; cv=none; b=FC2O4UmvaUR4HyHpjrRsr8Jltpgz0fFcRLBDDYWFb/ukvV4ljcMkZMsa5DdGZoVnQ4aUOethSe08QBeTZMrMk9J3x34xO1HZVUzT7hJp8jfCHXubpDAOVkqODhgd5ySakr/VOmJaEhyW6e0UX2ngQSMh1Ywg1Ve/KwS1Fwr35jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611332; c=relaxed/simple;
	bh=a6vK7BRDa4IMNRDndtHs45hTINtUqOoxZyzwKLiWerM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=de579koIOnvRUreYW8W41zOUtpgrMHyTY1Eu/UJxYSU9c48xNiX8TrwlZjP13RlsAZrpM6tv+9elRR4BUCVZR0nU3UJhaIrrNCNhJmuoa0doQpXqyJ0wX0SVrglgGHLNgA2I9PLZsCvtge/MS8nukVOMJezH72WIPQwZ/xCnNQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuPHCu1A; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuPHCu1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774611331; x=1806147331;
  h=date:from:to:cc:subject:message-id;
  bh=a6vK7BRDa4IMNRDndtHs45hTINtUqOoxZyzwKLiWerM=;
  b=EuPHCu1AUdxd+iQZ/TvymNIhug29jV0efY93ArWqW34QwCxfiA+hwoj9
   ciSCTGnuEKG97XFiRxTgAHQc/q4XeEDvuZATTWRZHb/NBZi8/xyUMHBMP
   7EwgOrkV600s9wOSsVO5IFnrKi5dnW1eIa2RgLJXhGocxsOYbHQ3dV410
   7k3BHuMNqhZjMRuGLWF50GckW3TfPzTV592lFWMP4eBuCPZ7HJD8RIlGE
   oUB2sMl3CH87Dk45fZ8tJrF6BMJdmPySzGxQxZXKrn/DayVN7IGjz5QIG
   14nFIY8pJmWO+OzJ0J9eU37qfb0okaF6bW2rEdYBDIR9zKpS+cQMaD+eS
   Q==;
X-CSE-ConnectionGUID: ZziytmqKQvi3i12vDwOD6w==
X-CSE-MsgGUID: YP5+NMjmTKCtEqy1h9AtJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="101141909"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="101141909"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 04:35:30 -0700
X-CSE-ConnectionGUID: X1EeilwUSkKE99DoMLncog==
X-CSE-MsgGUID: B25qxIK6Toio1Qw5Q9FpdQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Mar 2026 04:35:28 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w65TK-00000000ADv-08XU;
	Fri, 27 Mar 2026 11:35:26 +0000
Date: Fri, 27 Mar 2026 19:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:1652:32: error: incompatible pointer types
 passing 'struct user_pt_regs *' to parameter of type 'struct kvm_cpu_context
 *'
Message-ID: <202603271932.9KZJHJmo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   bc39b9ac67e8f57d48676c9da3aca1b944590ea6
commit: 718bf2535e3912862e7f3aedb4a04f7377e7af3b [2/2] ANDROID: KVM: arm64: Fix missing mask for custom hypercall handling
config: arm64-randconfig-r062-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271932.9KZJHJmo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271932.9KZJHJmo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271932.9KZJHJmo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:7:
   In file included from include/kvm/arm_hypercalls.h:7:
   In file included from arch/arm64/include/asm/kvm_emulate.h:14:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2180:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:23:
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:14:
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
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


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
