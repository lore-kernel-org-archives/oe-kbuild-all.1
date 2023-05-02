Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4207491
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 22:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683065742; x=1714601742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Se4+CrokBDotMpJ4xpxGiRL7Dec2LSIvJrY5kA227H4=;
  b=WHuZFNSqV3zBsJ/AjTeK3xzbqKa4K6/nZOo3rckUcHPqfJb+QOO3/8OK
   SKIWbxz4R7OXZLgbd28G9nMCFh2qy6MVTvUv4SO07nmfTxM0TQ/pDb1kK
   Rtph08caaQQHtfjl2w4S4g0UPG20WPwDQYK8OVWa/JW8OLcdFW+topVfM
   KhMG0pYJxNluiVnXcEYF5p3VoR7skaPLm/VDn1b1N0/C6jOwH03i2Mmxg
   p9oHocM3f4WkzdUCBPhma4EGV2iGb7ai+mRqvTCTbViPuHDiHFu5W7FzM
   yAGsmzaWnQd1kIA7RR8FJwhRBu5Xols/b1DWe0eR+/zeOh+bCHyXqUvy4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="351496605"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="351496605"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 15:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="870717194"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="870717194"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 May 2023 15:15:41 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptyHc-0001JQ-0S;
	Tue, 02 May 2023 22:15:40 +0000
Date: Wed, 3 May 2023 06:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 6733/26132]
 arch/arm64/kvm/fpsimd.c:129:33: error: implicit declaration of function
 'sve_cond_update_zcr_vq'
Message-ID: <202305030613.PKW5DszR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marc,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   4d2352ab07ad3dd1f16fd79e50e2815c8daf135f
commit: b0e15c8c44275afef4aacfb1560e38b974b02ac8 [6733/26132] FROMGIT: KVM: arm64: Save/restore SVE state for nVHE
config: arm64-randconfig-r006-20230430 (https://download.01.org/0day-ci/archive/20230503/202305030613.PKW5DszR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.10
        git checkout b0e15c8c44275afef4aacfb1560e38b974b02ac8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305030613.PKW5DszR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/fpsimd.c: In function 'kvm_arch_vcpu_put_fp':
>> arch/arm64/kvm/fpsimd.c:129:33: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror=implicit-function-declaration]
     129 |                                 sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sve_cond_update_zcr_vq +129 arch/arm64/kvm/fpsimd.c

   108	
   109	/*
   110	 * Write back the vcpu FPSIMD regs if they are dirty, and invalidate the
   111	 * cpu FPSIMD regs so that they can't be spuriously reused if this vcpu
   112	 * disappears and another task or vcpu appears that recycles the same
   113	 * struct fpsimd_state.
   114	 */
   115	void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
   116	{
   117		unsigned long flags;
   118		bool host_has_sve = system_supports_sve();
   119		bool guest_has_sve = vcpu_has_sve(vcpu);
   120	
   121		local_irq_save(flags);
   122	
   123		if (vcpu->arch.flags & KVM_ARM64_FP_ENABLED) {
   124			if (guest_has_sve) {
   125				__vcpu_sys_reg(vcpu, ZCR_EL1) = read_sysreg_el1(SYS_ZCR);
   126	
   127				/* Restore the VL that was saved when bound to the CPU */
   128				if (!has_vhe())
 > 129					sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
