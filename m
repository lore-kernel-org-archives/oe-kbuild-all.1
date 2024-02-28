Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591AE15B105
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 14:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709132389; cv=none; b=nJd+t9sK0c1jB/+JlW9f4l5djfQRJQ7ThJvM3C3ezgDIwUTbF9A1Kncws6aDzCCSKqHW2qxVV781iTkeFBfME3Z0HIcI50RqwUxL6+f2Agys+UwG+i9JDTJNYU4QzOpMfnIwnhP0YZz5GrGMMgR2KE88HEuawZBk/CIPZwxkFXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709132389; c=relaxed/simple;
	bh=m0FKAcRYR23WgYE/ZlfosoYqWJ4T4G+4lvT6ShH452c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kO2jXnFBEWhJiv0SH4Cq4ZEv14Khr5yr+rvlzoBaUclrpkxjWGi6GYKhtKzeGKovD6f+L3UJoC6WV42DjNmDAI8Cq/Km8zycD5znNIp+2Myf4YRWFpyZQjzdYE1BxPW6eJOiatazK59so6QnbN2gbNfITQYvNH4iZ4uYwagZv5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cp0JFfLk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cp0JFfLk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709132388; x=1740668388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m0FKAcRYR23WgYE/ZlfosoYqWJ4T4G+4lvT6ShH452c=;
  b=Cp0JFfLk4OSYzlKkBADIQtEHwk3Vhqw9/GPZ7dzIRBV6+bSumJV9YF0A
   Ei/HBVA/8Zk9AZjW9JMhCSkp9QkyJqkThJnjq7wT8onMRjrS5aT+86v4k
   Grzjrd/kBHw3s+QzClol51hM5mYwIi0HWrbS/LK50X41MkC1jBGkwYncp
   6y61XZgwNaQiVfpbRcCNDigLd0TN9W1czVg2DDUK3sMnCYtf06lbRabnR
   Bm8cNBYG4dNHbjDnyBVTYZUB3EsVIKaqki2vWQLSMeP7DXRRZujv3a5QJ
   u/kvivHNmXNd7uQ5LPJMoY948RqVX2V1NX6LCVoHCuctN81En2GMRrHrz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3697530"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3697530"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 06:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="12175331"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Feb 2024 06:59:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfLP6-000C9X-22;
	Wed, 28 Feb 2024 14:59:28 +0000
Date: Wed, 28 Feb 2024 22:59:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-group-fp-data 3/3]
 arch/arm64/kvm/fpsimd.c:141:29: warning: unused variable 'fp_state'
Message-ID: <202402282220.P1XIPzd9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-group-fp-data
head:   17e9635b3b9398eb2d066b32e686811739a1b756
commit: 17e9635b3b9398eb2d066b32e686811739a1b756 [3/3] KVM: arm64: Reuse struct cpu_fp_state to track the guest FP state
config: arm64-randconfig-003-20240227 (https://download.01.org/0day-ci/archive/20240228/202402282220.P1XIPzd9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240228/202402282220.P1XIPzd9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402282220.P1XIPzd9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/fpsimd.c: In function 'kvm_arch_vcpu_ctxsync_fp':
>> arch/arm64/kvm/fpsimd.c:141:29: warning: unused variable 'fp_state' [-Wunused-variable]
     141 |         struct cpu_fp_state fp_state;
         |                             ^~~~~~~~


vim +/fp_state +141 arch/arm64/kvm/fpsimd.c

af9a0e21d817f4 Marc Zyngier 2021-10-21  131  
e6b673b741ea0d Dave Martin  2018-04-06  132  /*
23afc82539cfcc Mark Brown   2022-01-24  133   * Called just after exiting the guest. If the guest FPSIMD state
23afc82539cfcc Mark Brown   2022-01-24  134   * was loaded, update the host's context tracking data mark the CPU
23afc82539cfcc Mark Brown   2022-01-24  135   * FPSIMD regs as dirty and belonging to vcpu so that they will be
23afc82539cfcc Mark Brown   2022-01-24  136   * written back if the kernel clobbers them due to kernel-mode NEON
23afc82539cfcc Mark Brown   2022-01-24  137   * before re-entry into the guest.
e6b673b741ea0d Dave Martin  2018-04-06  138   */
e6b673b741ea0d Dave Martin  2018-04-06  139  void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
e6b673b741ea0d Dave Martin  2018-04-06  140  {
1192b93ba3528f Mark Brown   2022-11-15 @141  	struct cpu_fp_state fp_state;
deeb8f9a80fdae Mark Brown   2022-11-15  142  
e6b673b741ea0d Dave Martin  2018-04-06  143  	WARN_ON_ONCE(!irqs_disabled());
e6b673b741ea0d Dave Martin  2018-04-06  144  
23d58eef2c2072 Mark Brown   2024-02-26  145  	if (vcpu->arch.fp_owner == FP_STATE_GUEST_OWNED) {
17e9635b3b9398 Mark Brown   2024-02-26  146  		fpsimd_bind_state_to_cpu(&vcpu->arch.fp_state);
0495067420f352 Dave Martin  2018-09-28  147  
e6b673b741ea0d Dave Martin  2018-04-06  148  		clear_thread_flag(TIF_FOREIGN_FPSTATE);
e6b673b741ea0d Dave Martin  2018-04-06  149  	}
e6b673b741ea0d Dave Martin  2018-04-06  150  }
e6b673b741ea0d Dave Martin  2018-04-06  151  

:::::: The code at line 141 was first introduced by commit
:::::: 1192b93ba3528feaf37dc4b5d8d6bdbb475791ad arm64/fp: Use a struct to pass data to fpsimd_bind_state_to_cpu()

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
