Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051D142A179
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507522; cv=none; b=cPhvfeouUja4W6yLtqyJndmMjq5DaH4TQd3oznq7xGuVmGQsRTHFulWnTsN9Thv3fRr+6nEL8EK/8Ftd63Ax2RWxNWKwr9tDMssMgFFh/ya9AclIEhATePoI2py/OGMtNGLzCcXTkDCUPdDFl430hfeL6ZiozjLuQHlXFGgeDAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507522; c=relaxed/simple;
	bh=eSSXeCiUb6q1ZjeGh+n0/dnt2kTjMRkHXvkztNF5SZ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X5JODaSEGfONR4N/iABab3bEc+R26VEyp/TpEH+rnq0azoLAq8KppSx2sigD9dBGEYOcQ7vxWz24c8VTSBCD15XNSN/k68KrUHDhh/70ei5nUkcCN/J8l6aWI2cLYq91Hd+6/33C7x8xYr8hYvt0Mcbcxdc704HKpbHWgXrqFy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ee9ivjs2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ee9ivjs2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785507521; x=1817043521;
  h=date:from:to:cc:subject:message-id;
  bh=eSSXeCiUb6q1ZjeGh+n0/dnt2kTjMRkHXvkztNF5SZ0=;
  b=Ee9ivjs286z2hsyN/p1QPJ8Sd21+Z4vZp3r7M+s1TC4tLH1ZKYVz9k75
   GBNLsqlH2jYplAsexdz/YxAh5FEhNcbqTAyorI5UZqqlp1s0EYbYp+b1H
   MYlMCSSfHFtCq1u/0JzXJyPkGlqJfq//WOg4OTPP/t1PkUsPtJ5V85aCW
   hSL0Ba1PqxgIUNgptD2JQjue6WwmWbq91xsZjy05jJbKYwtYWL/YfO0lm
   J4gpoC1EkREmrNiir/l6G+Tr7otiO6z9YtsCKg+llY9XKv5WQ0uC9e0IH
   MSOrLVadkW1WagkL0eq5n0tAbhk8TVLTJs7DExSZYtHqWRWpWqk0AMN6e
   A==;
X-CSE-ConnectionGUID: tONA+W0dQXeebSrOJz9cKg==
X-CSE-MsgGUID: wQ58KD6+TSiQZXM4mWWReA==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86331907"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="86331907"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:18:41 -0700
X-CSE-ConnectionGUID: dS4VzFexS7md2aj3kjlMVQ==
X-CSE-MsgGUID: xYZSOyIkT6+eDoC04MufBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="285194875"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2026 07:18:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpo4K-000000001BN-2kbQ;
	Fri, 31 Jul 2026 14:18:36 +0000
Date: Fri, 31 Jul 2026 22:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2/2]
 arch/arm64/kvm/hyp/include/hyp/switch.h:216:2: error: implicit declaration of
 function 'sve_cond_update_zcr_vq'
Message-ID: <202607312245.eegMzJWf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Marc,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   1290154c48656bd1012a837076a0fbe379330eb3
commit: 1105b4d1cef4bc19ad20129a716194268c937eaf [2/2] BACKPORT: FROMGIT: KVM: arm64: Rework SVE host-save/guest-restore
config: arm64-randconfig-003-20260731 (https://download.01.org/0day-ci/archive/20260731/202607312245.eegMzJWf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607312245.eegMzJWf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607312245.eegMzJWf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/vhe/switch.c:8:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__hyp_sve_restore_guest':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:2: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     216 |  sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
         |  ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c: At top level:
   arch/arm64/kvm/hyp/vhe/switch.c:227:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     227 | asmlinkage void kvm_unexpected_el2_exception(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:15:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__hyp_sve_restore_guest':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:2: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     216 |  sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
         |  ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:7:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__hyp_sve_restore_guest':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:2: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     216 |  sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
         |  ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: At top level:
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:233:6: warning: no previous prototype for 'handle_trap' [-Wmissing-prototypes]
     233 | void handle_trap(struct kvm_cpu_context *host_ctxt)
         |      ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:8:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__hyp_sve_restore_guest':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:2: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     216 |  sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
         |  ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c: At top level:
   arch/arm64/kvm/hyp/nvhe/switch.c:282:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     282 | asmlinkage void kvm_unexpected_el2_exception(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sve_cond_update_zcr_vq +216 arch/arm64/kvm/hyp/include/hyp/switch.h

   213	
   214	static inline void __hyp_sve_restore_guest(struct kvm_vcpu *vcpu)
   215	{
 > 216		sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
   217		__sve_restore_state(vcpu_sve_pffr(vcpu),
   218				    &vcpu->arch.ctxt.fp_regs.fpsr);
   219		write_sysreg_el1(__vcpu_sys_reg(vcpu, ZCR_EL1), SYS_ZCR);
   220	}
   221	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
