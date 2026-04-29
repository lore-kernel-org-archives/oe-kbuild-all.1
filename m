Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF1423A561
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461401; cv=none; b=qO67HoHYmimWAMdOEneWUgHAEwX+qAcTppBWIPvDIRnaXzQh85++b50Yd59eMUiAccUuSp0NNI8a9xDGL615Rv/xUBv1VTjgw57bHGGiihf68RgnrD7lcflXYFrJjsCC9KiWKrue5C2W/acZRyMoT9Prajt98ccH7/Zr1otVwWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461401; c=relaxed/simple;
	bh=SjXHhRXNipYfFcaD20wY6h+WLvLzGR+dK6u1V6mBM8Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HNw6HOMdrqSt+OOuBUeNSeRkqfCLTwEXdoaQQKTWZYW1p/CuEn1gyXvUyIO+9ByY/jkNbCCxRBQWhCvTaIp39d75TnxOEgKRqpxrmo4KDDNRNVfp0rnJfY40wwNxHJJtNWu4kuFQgN1PK1kCF+u7y/s5MT46jmDdtzoSvXFIC9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dl+KrVV2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dl+KrVV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777461399; x=1808997399;
  h=date:from:to:cc:subject:message-id;
  bh=SjXHhRXNipYfFcaD20wY6h+WLvLzGR+dK6u1V6mBM8Q=;
  b=Dl+KrVV2BelJXSIyk5zYiKSnZZ1BxOJZUn2hrqozCTOAF5w5gzZziKyY
   ljcUVhlI8G+84yPoJL0GyMp/GdD8394D40Mge0qGY6qi8i7IvhrxzJ0mp
   FuCOKsme2pxhu+3ip2dxOse//PDlvXvlH5y86VvENzkK60QI3YRbtHRM4
   7lh016PPkOYAr8v8pQAY/bVtsZJgsHwMAb/EQM1/uwFgnzjIvqClRfpv2
   7tLKo/UPLEKa/VV2bYNZ4l4P5spixUbtc/8I/lFDnQTYQm5qaOpCEOLM4
   oE+Bcq3JOTQShl5+Fppxm5fE9Sogm/lMZob5+5XrJ87+w/WmnweGM2Exa
   Q==;
X-CSE-ConnectionGUID: LTr6kDA5SN64dXe82+jUdA==
X-CSE-MsgGUID: neixvkOVTeyVl/21/lOtSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78402983"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78402983"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 04:16:39 -0700
X-CSE-ConnectionGUID: iCvF1m/0QuGoPYJups1yyQ==
X-CSE-MsgGUID: qvlw9LW7TPiMks+EHjPEfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="229891921"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Apr 2026 04:16:37 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wI2uB-00000000Ayq-1fDp;
	Wed, 29 Apr 2026 11:16:35 +0000
Date: Wed, 29 Apr 2026 19:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-04 11/11]
 arch/arm64/kvm/hyp/nvhe/switch.c:216:7: warning: unused variable 'zcr_el2'
Message-ID: <202604291959.QFboC7tz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Fuad,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-04
head:   105716676e6f47b5f08783f64cf6bd69b85cc57c
commit: 082497437e04b4cd56b8c742c9df06e608a76a40 [11/11] ANDROID: KVM: arm64: Refactor saving/restoring guest/host SVE state code
config: arm64-randconfig-001-20260429 (https://download.01.org/0day-ci/archive/20260429/202604291959.QFboC7tz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604291959.QFboC7tz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604291959.QFboC7tz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:7:
   In file included from arch/arm64/kvm/hyp/include/hyp/switch.h:10:
   In file included from arch/arm64/kvm/hyp/include/hyp/adjust_pc.h:13:
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
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:7:
   arch/arm64/kvm/hyp/include/hyp/switch.h:265:6: warning: unused variable 'zcr_el2' [-Wunused-variable]
     265 |         u64 zcr_el2 = min(zcr_el1, vcpu_sve_max_vq(vcpu) - 1ULL);
         |             ^~~~~~~
>> arch/arm64/kvm/hyp/nvhe/switch.c:216:7: warning: unused variable 'zcr_el2' [-Wunused-variable]
     216 |                 u64 zcr_el2 = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
         |                     ^~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:414:5: warning: no previous prototype for function '__pkvm_register_hyp_panic_notifier' [-Wmissing-prototypes]
     414 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         |     ^
   arch/arm64/kvm/hyp/nvhe/switch.c:414:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     414 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         | ^
         | static 
   8 warnings generated.


vim +/zcr_el2 +216 arch/arm64/kvm/hyp/nvhe/switch.c

   206	
   207	static void kvm_hyp_handle_fpsimd_host(struct kvm_vcpu *vcpu)
   208	{
   209		/*
   210		 * Non-protected kvm relies on the host restoring its sve state.
   211		 * Protected kvm restores the host's sve state as not to reveal that
   212		 * fpsimd was used by a guest nor leak upper sve bits.
   213		 */
   214		if (unlikely(is_protected_kvm_enabled() && system_supports_sve())) {
   215			struct kvm_host_sve_state *sve_state = get_host_sve_state(vcpu);
 > 216			u64 zcr_el2 = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
   217	
   218			sve_state->zcr_el1 = read_sysreg_el1(SYS_ZCR);
   219			sve_cond_update_zcr_vq(zcr_el2, SYS_ZCR_EL2);
   220			__sve_save_state(sve_state->sve_regs +
   221					 sve_ffr_offset(kvm_host_sve_max_vl),
   222					 &sve_state->fpsr);
   223	
   224			/* Still trap SVE since it's handled by hyp in pKVM. */
   225			if (!vcpu_has_sve(vcpu))
   226				sysreg_clear_set(cptr_el2, 0, CPTR_EL2_TZ);
   227		} else {
   228			__fpsimd_save_state(get_host_fpsimd_state(vcpu));
   229		}
   230	}
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
