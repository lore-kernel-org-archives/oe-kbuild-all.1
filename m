Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC903C0A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 10:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686998914; x=1718534914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2C9kDsHraKXEmCFYQQR1MEMei5BSURlLv7bj1/ra/uA=;
  b=MLl3VKHcM+gwzSXhMpC/bl5Ngty046SQ1thAXDs/grwgUggzb6CF7zW0
   euaO7glJGl4lIoR7JQjpdTKUo7zvue9LVepEdgmVBHESYULL2dHDmDCR6
   pa+f+9nUOkk2IzLXNdgxVOqPxIhbFCN7+wNnucHihKXQywdLnFsmSwDS/
   uNyO20uSzZhXpeRgp1rm06O+vlKxpmX+Y3/mFsr576uEpBVk5GYcm1XE9
   IcXbrVslblcpx0vqI98vvRqqQQBQ1g5i4lZ+vDbyIsOFOkwwsEcI1jP0W
   HCw1a2N3IKZUnEk8DJHBn6faUYNpanVjn1zNKdFMB1jjXwZXDFLNi/Uaj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="344119420"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="344119420"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 03:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="803106209"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="803106209"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2023 03:48:30 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qATTp-0002gE-23;
	Sat, 17 Jun 2023 10:48:29 +0000
Date: Sat, 17 Jun 2023 18:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:arcvm12-5.10 6733/27680]
 arch/arm64/kvm/fpsimd.c:129:33: error: implicit declaration of function
 'sve_cond_update_zcr_vq'
Message-ID: <202306171854.v8E1clCt-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common arcvm12-5.10
head:   1d52f82a5a291f35847b6d4ddae50955aad91a50
commit: b0e15c8c44275afef4aacfb1560e38b974b02ac8 [6733/27680] FROMGIT: KVM: arm64: Save/restore SVE state for nVHE
config: arm64-randconfig-r016-20230616 (https://download.01.org/0day-ci/archive/20230617/202306171854.v8E1clCt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171854.v8E1clCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171854.v8E1clCt-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
