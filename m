Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED3944A715
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 19:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007993; cv=none; b=TSACtDvVjob6Rao/9YkNilf93JhzciF+Bcn6qqVXZ27mvzryj8PNX4SS++ZK+GsPFxjS0kak0HKvhOcdl2Lj82TwRFHXbzCXMIrqrC5FP10g9NJLSSd0Y8838q5SwaxNhFtprKKajzGHjhz1724nZHdCwTQ3+QiLRIZSepp/gSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007993; c=relaxed/simple;
	bh=ChB3Snu2jDXEc9sW4i0L6/wFrrqqm2AKWTOQ17EQ2AE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=K4UecIGKUk5wXw/wHRTuyGTsZt45CFDmQWO7vM+HURuy0x//v4F+P864eGXsXrfCq48YUAGtEf0VtHs6I/NihfTV7yIJbhZ7O934R4Az80UWCP7wEXwmwB/pvsDVTVLLJKZZ/6i7b6DReVRpDfa/HVpsqZKkAs7xfW2J5S9stWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndZnHD6F; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndZnHD6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778007990; x=1809543990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ChB3Snu2jDXEc9sW4i0L6/wFrrqqm2AKWTOQ17EQ2AE=;
  b=ndZnHD6F+ivjSDnIu3ZXlk5p2X2Mp7PQL27qwki81Ex/yuJHN2XQ+kNf
   PU7ZKhhd3tqCEWZiQYJCNdQjPmzIjyyS3fPo1yyYYVNBsnICtqGdkAv2g
   Jvy1SmaBymMGwuWKEp1WuAA33mjwbpktT/LPxBcWzR6EZNlq58G2SIPoy
   fGVP1eVb3riVTkeAe0k3GgFYPdcPY8k5C72FoHl8qJ1LAjP4PHsxnY5ty
   XiGfuGm5+jVhapVbDF5CbttkgM+p13ufGY8sZZajNjTew3K0YVlf6MEWy
   K0Izi5CE0o4W+L31ENQzgSVkWtcp4V4H30orW/k57hXT8xWbIX7Ucrx74
   A==;
X-CSE-ConnectionGUID: x5JffwksRaK2UHkgoLGyGA==
X-CSE-MsgGUID: TyyVsLi+RrGDLMFhpBAVRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104345044"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="104345044"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 12:06:30 -0700
X-CSE-ConnectionGUID: Uno+DnIhSoWjDhhOTVrtPg==
X-CSE-MsgGUID: JM82bUfnRfa9OQdXKMNTTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="266235138"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 May 2026 12:06:28 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKL69-000000000Nt-2lLz;
	Tue, 05 May 2026 19:06:25 +0000
Date: Wed, 06 May 2026 03:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Radim =?utf-8?Q?Kr=C4=8Dm=C3=A1=C5=99"?= <radim.krcmar@oss.qualcomm.com>
Subject: arch/riscv/kvm/vcpu_config.c:81:17: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202605060232.PcNtMxLY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
commit: 6ed523e2b6129d7dd4aab801a610930d85b2d3f8 RISC-V: KVM: Factor-out VCPU config into separate sources
date:   5 weeks ago
config: riscv-randconfig-r111-20260505 (https://download.01.org/0day-ci/archive/20260506/202605060232.PcNtMxLY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060232.PcNtMxLY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6ed523e2b612 ("RISC-V: KVM: Factor-out VCPU config into separate sources")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060232.PcNtMxLY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/vcpu_config.c:81:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:81:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:81:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:82:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:82:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:82:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:83:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:83:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:83:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:85:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:85:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:85:25: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:87:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:87:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:87:25: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_config.c:89:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_config.c:89:33: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_config.c:89:33: sparse:     got restricted __le64 [usertype]

vim +81 arch/riscv/kvm/vcpu_config.c

    73	
    74	void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu)
    75	{
    76		struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
    77		void *nsh;
    78	
    79		if (kvm_riscv_nacl_sync_csr_available()) {
    80			nsh = nacl_shmem();
  > 81			nacl_csr_write(nsh, CSR_HEDELEG, cfg->hedeleg);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
