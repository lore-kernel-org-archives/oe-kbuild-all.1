Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC46AAB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 23:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695510010; x=1727046010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rkCwqwDVHc3Hznmk1Zr/IhGbmia5oAiDaNqpi6KJZOo=;
  b=NvPI6xxqm2NMRJ3V6hGbqULAnvs1dC8vnKR37v5lUCtii8ljlRAIVBGn
   xSw5E6WLHztvT0bJbKCRtdRvWVifdr2Xq0sLK3tpliNfT50AvV/xK8T3I
   GL3Ifbd1EoxvB26yuPD8U9fxrBxZNcMtdfYqMlZS0FQ60qsVfDRtbz8lX
   Vpbca7UC4T2CwwjASPOam66cJ8kw72kzC7mSXJ9rNyNURzqhF+R5ncAph
   DGlt8/lhLqmZsrKm2yzF8L4zCLR6sUNfWIzsGjkco6VXhFUR40agxpMEr
   Fn0tBIuZKnwpXzqYx5PdzpKLKfoPsvEH1YvlM9zhgZfecmJUFqyVk4hcb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="379938344"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="379938344"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 16:00:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="863390763"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="863390763"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2023 16:00:09 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkBbb-0002xd-08;
	Sat, 23 Sep 2023 23:00:07 +0000
Date: Sun, 24 Sep 2023 07:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 6733/29449]
 arch/arm64/kvm/fpsimd.c:129:33: error: implicit declaration of function
 'sve_cond_update_zcr_vq'
Message-ID: <202309240608.NA5Jb0mc-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   833db5ec53f6ad1606b5363338fb455e6bd7bd01
commit: b0e15c8c44275afef4aacfb1560e38b974b02ac8 [6733/29449] FROMGIT: KVM: arm64: Save/restore SVE state for nVHE
config: arm64-randconfig-004-20230924 (https://download.01.org/0day-ci/archive/20230924/202309240608.NA5Jb0mc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240608.NA5Jb0mc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240608.NA5Jb0mc-lkp@intel.com/

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
