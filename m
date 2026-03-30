Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D125333727
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882821; cv=none; b=seGglyxoMrsWsHPrIr22GNRxV2zVQdaX2CvM+akbKg9CBFk3D5mTki9clVrdwT7LXhhVwzdHI0nEOHhZ7L0I3kINzz7FSWsJrsKBIWfFv5PdjgIa/peCO7EnsOaK935dOytPGzT/5Ry6dSx5h1OtO8WxzVlil6sYSmaD+bW1row=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882821; c=relaxed/simple;
	bh=AaSaXpYMZ0KFQ51vcRSIyIf4Stp81w1HNzB2nnen1xk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kFOgN7kud+BHRhfRFohazEmvPEWjqIPxvoAmxp5/Vu5yRgWO1ehMgz/eNklNabviBOdx7QwCacjyHVYDsg8/Z17bp77EfkXZxWclH7zakAySDNYRTO7vPZR3EktwNC/uvzV5/WZO7P47mlleX1huC/kfydOctAaUrERRRqSNRyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJuTFztf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJuTFztf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774882820; x=1806418820;
  h=date:from:to:cc:subject:message-id;
  bh=AaSaXpYMZ0KFQ51vcRSIyIf4Stp81w1HNzB2nnen1xk=;
  b=fJuTFztf7U4RnpXwq+M0Tp4zKiWWvCXt6WcjllaHp+Jcf0+aE/leHBQ4
   lPXleH6qODgUi7pPAsiHpqfZQoiCzOJxv17BwZqU8VwE/jm/xmeLlmJUj
   ZN2+ruXYWi472djx2HhdtNZMTftQZjV6G3U2CVCVa3dCD7CF7BQnbWMk1
   A71FA9DWYNdc8KqYhoo/Rz/90wqwPrPRUTjSmfd1WoDb3VGj+rA9oItTf
   yC0U2Ch2NJ+BRDYQ7gr6WiHDRY/5pwXqOCAuCQIVLwlZbEs9Ba7t3fNfm
   mgbO8SYUanICCkHbARSt7rch6IJJkVjjhp4BhYJ48xPaHb/fp6xs4iwSn
   A==;
X-CSE-ConnectionGUID: 6JhpM7XGQJGV1rlvgUA8EQ==
X-CSE-MsgGUID: eYcrH9NtSR6rT8ZjN95/DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86953185"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="86953185"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 08:00:20 -0700
X-CSE-ConnectionGUID: cQgycbqvTQyPx7OdAqn8pA==
X-CSE-MsgGUID: ir+66uVySF6/TMUnZ6z3fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="230901440"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Mar 2026 08:00:17 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7E6A-000000001EX-3vnT;
	Mon, 30 Mar 2026 15:00:14 +0000
Date: Mon, 30 Mar 2026 22:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:770:6: warning: unused variable 'zcr_el2'
Message-ID: <202603302213.bdwNbiR5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Fuad,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5fdbbd61a3cbdca7ac1034dc16723bdbc7ece8cc
commit: 2b5e5cbdf01152384c781bb7edd7a778c1419b3a [2/2] ANDROID: KVM: arm64: Use active guest SVE vector length on save/restore
config: arm64-randconfig-001-20260330 (https://download.01.org/0day-ci/archive/20260330/202603302213.bdwNbiR5-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302213.bdwNbiR5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302213.bdwNbiR5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:7:
   In file included from include/kvm/arm_hypercalls.h:7:
   In file included from arch/arm64/include/asm/kvm_emulate.h:14:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2180:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:88:6: warning: no previous prototype for function '__pkvm_unmask_serror' [-Wmissing-prototypes]
      88 | void __pkvm_unmask_serror(void)
         |      ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:88:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      88 | void __pkvm_unmask_serror(void)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:770:6: warning: unused variable 'zcr_el2' [-Wunused-variable]
     770 |         u64 zcr_el2 = min(zcr_el1, vcpu_sve_max_vq(vcpu) - 1ULL);
         |             ^~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:799:8: warning: unused variable 'vq_len' [-Wunused-variable]
     799 |                         u64 vq_len = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
         |                             ^~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:1655:32: error: incompatible pointer types passing 'struct user_pt_regs *' to parameter of type 'struct kvm_cpu_context *' [-Wincompatible-pointer-types]
    1655 |         if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
         |                                       ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:25:51: note: passing argument to parameter 'host_ctxt' here
      25 | handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
         |                                                   ^
   4 warnings and 1 error generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:7:
   In file included from arch/arm64/kvm/hyp/include/hyp/switch.h:10:
   In file included from arch/arm64/kvm/hyp/include/hyp/adjust_pc.h:13:
   In file included from arch/arm64/include/asm/kvm_emulate.h:14:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2180:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:7:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:265:6: warning: unused variable 'zcr_el2' [-Wunused-variable]
     265 |         u64 zcr_el2 = min(zcr_el1, vcpu_sve_max_vq(vcpu) - 1ULL);
         |             ^~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:216:7: warning: unused variable 'vq_len' [-Wunused-variable]
     216 |                 u64 vq_len = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
         |                     ^~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:414:5: warning: no previous prototype for function '__pkvm_register_hyp_panic_notifier' [-Wmissing-prototypes]
     414 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         |     ^
   arch/arm64/kvm/hyp/nvhe/switch.c:414:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     414 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         | ^
         | static 
   4 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
   In file included from arch/arm64/kvm/hyp/include/hyp/switch.h:10:
   In file included from arch/arm64/kvm/hyp/include/hyp/adjust_pc.h:13:
   In file included from arch/arm64/include/asm/kvm_emulate.h:14:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2180:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:265:6: warning: unused variable 'zcr_el2' [-Wunused-variable]
     265 |         u64 zcr_el2 = min(zcr_el1, vcpu_sve_max_vq(vcpu) - 1ULL);
         |             ^~~~~~~
   3 warnings generated.


vim +/zcr_el2 +770 arch/arm64/kvm/hyp/nvhe/hyp-main.c

   765	
   766	static void __hyp_sve_save_guest(struct pkvm_hyp_vcpu *hyp_vcpu)
   767	{
   768		struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
   769		u64 zcr_el1 = read_sysreg_el1(SYS_ZCR);
 > 770		u64 zcr_el2 = min(zcr_el1, vcpu_sve_max_vq(vcpu) - 1ULL);
   771	
   772		__vcpu_sys_reg(vcpu, ZCR_EL1) = zcr_el1;
   773		sve_cond_update_zcr_vq(zcr_el2, SYS_ZCR_EL2);
   774		__sve_save_state(vcpu_sve_pffr(vcpu), &vcpu->arch.ctxt.fp_regs.fpsr);
   775		sve_cond_update_zcr_vq(ZCR_ELx_LEN_MASK, SYS_ZCR_EL2);
   776	}
   777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
