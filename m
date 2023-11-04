Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582DABA48
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKa/Hi46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699086575; x=1730622575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wuIdQ3gApHcta5DLZI5nD+kKOAIoZSRZO5CrKTMQleY=;
  b=mKa/Hi46zuSCPFGQyKpaN+oHahjnsn7apSOzQ/dp8q+R0JKfWwQK7ZU6
   Gu2Sr2meV+i3flnRwwv5GDbE1HmB3Q3XhJ8cWRhytF/7l/VIWuPQMO6TE
   jKowgisvNtcwa2MdC+ZDuyrmJjTmzgeZYIH9GhtK4ut5a6bkKzZNkPAYv
   HZciXJpB7uT/gzDhTNkcX4CgloldkBhD0qrtjybHY0TsRgTSkQCarKElR
   hFLaxBQTKRFGJnGC07rMPMS+3pJRe86OybZiFvtlpV58wGvRekpAvj7tq
   EJWFj2MdbM+tBbhoVIdWg0fWbynMCK7HtrOqoq+xBju/1UhMjBSx2W1IQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="10606565"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="10606565"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 01:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="878889778"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="878889778"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2023 01:29:33 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzC27-0003gB-16;
	Sat, 04 Nov 2023 08:29:31 +0000
Date: Sat, 4 Nov 2023 16:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 6398/30000]
 arch/arm64/kvm/hyp/include/hyp/switch.h:216:9: error: implicit declaration
 of function 'sve_cond_update_zcr_vq'
Message-ID: <202311041654.2ndWwlBD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marc,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   f40707abde2eb5cd21cf8848f33aefb7e394ad1a
commit: 1105b4d1cef4bc19ad20129a716194268c937eaf [6398/30000] BACKPORT: FROMGIT: KVM: arm64: Rework SVE host-save/guest-restore
config: arm64-randconfig-003-20231104 (https://download.01.org/0day-ci/archive/20231104/202311041654.2ndWwlBD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041654.2ndWwlBD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041654.2ndWwlBD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:15:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__hyp_sve_restore_guest':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:9: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     216 |         sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:7:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__hyp_sve_restore_guest':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:9: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     216 |         sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: At top level:
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:233:6: warning: no previous prototype for 'handle_trap' [-Wmissing-prototypes]
     233 | void handle_trap(struct kvm_cpu_context *host_ctxt)
         |      ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:8:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__hyp_sve_restore_guest':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:9: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     216 |         sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c: At top level:
   arch/arm64/kvm/hyp/nvhe/switch.c:282:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     282 | asmlinkage void kvm_unexpected_el2_exception(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/vhe/switch.c:8:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__hyp_sve_restore_guest':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:9: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     216 |         sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c: At top level:
   arch/arm64/kvm/hyp/vhe/switch.c:227:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     227 | asmlinkage void kvm_unexpected_el2_exception(void)
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
