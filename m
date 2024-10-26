Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDFC217F51
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729943104; cv=none; b=gmCiiL51wgoHOb3sK0dVgWVHu+eF0vFNaBtUQQaubpc8aKPhyYpsZEFmiStjGx7y6fcw9PJ3541MldXxiu9IqPUJb2Vj6mDvgJ0iCzNQbhXfZz1UvnDhCINXf7/IBP260sfp0VSMjmNNcQeBBzrr0GUOTwo+8YMwBONBI0R8o9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729943104; c=relaxed/simple;
	bh=AnbWQjqPZ+Oi0nuFU7xcYzUBX1bNv5dsaLPbXNU0Q3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pImt1bZdMTvnhtcAUUkuTRSQr9AD8X+ztVgJpT+UrtdGb6sjWICZshSRtIhvIFddRx71W1HMexieLIjtpUyWcWEHSeLgjYMOV3b851/PituUksLWPENqUEY5KewgAeKGoZvyyJ+beiKwu1qcfXMXJJ30fZrRMruYaR7G1DOR/e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQO7RWZv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQO7RWZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729943101; x=1761479101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AnbWQjqPZ+Oi0nuFU7xcYzUBX1bNv5dsaLPbXNU0Q3w=;
  b=aQO7RWZvZDFi0/TOeT+CIGraxr8isEwLXxGqAc30xV+gX5pvx0WQQfc7
   9Cio76er2Su9wJfARDPWom0GLO1C2nluBOYOF2BBWVL+0JFb80Nlr8xZs
   lmKJRJ82T6BrodLAErh8vs7B7xobICO5QGPYn7bVS57hCldenI6hCbrxG
   KhNC9OwGDwQoBhGFvIe+EZceVGy2rOd/r0iktAoDWMydBEC8JO+QWSchi
   xx69R9al1SAeasV9aHBcKwpJcjgjokKboMHRohbLXWP7aKZoDicXSvbb1
   xBSPswnrj11GwDdT5NZ5w1HdhK5i0q+MiLPvViE37eUQoTmCk4v0Jb2u1
   w==;
X-CSE-ConnectionGUID: Gtyjsh5pRD2mKznX2FIO+A==
X-CSE-MsgGUID: c5EFAME4RWGUksf/H4iWGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29818749"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="29818749"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 04:45:01 -0700
X-CSE-ConnectionGUID: lqzjE9DOTlmHY787pq1zkA==
X-CSE-MsgGUID: kjd+4XmyQEKFEu3ks+T5jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="118651595"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Oct 2024 04:44:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4fE0-000Zab-38;
	Sat, 26 Oct 2024 11:44:56 +0000
Date: Sat, 26 Oct 2024 19:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <atishp@rivosinc.com>
Subject: [avpatel:riscv_sbi_nested_v2 36/40]
 arch/riscv/kvm/vcpu_timer.c:78:9: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202410261951.u0V7oazs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v2
head:   7a05f36363ea749eae162c351c3c177cdbb390d2
commit: d21bc6ce5891ac8857f752b603d18f4b108b44a9 [36/40] RISC-V: KVM: Use nacl_csr_xyz() for accessing H-extension CSRs
config: riscv-randconfig-r113-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261951.u0V7oazs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241026/202410261951.u0V7oazs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261951.u0V7oazs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/vcpu_timer.c:78:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_timer.c:78:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_timer.c:78:9: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_timer.c:295:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_timer.c:295:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_timer.c:295:9: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_timer.c:312:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_timer.c:312:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_timer.c:312:9: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kvm/vcpu_timer.c:333:26: sparse: sparse: cast to restricted __le64
--
>> arch/riscv/kvm/mmu.c:735:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/mmu.c:735:9: sparse:     expected unsigned long
   arch/riscv/kvm/mmu.c:735:9: sparse:     got restricted __le64 [usertype]
--
   arch/riscv/kvm/vcpu.c:27:49: sparse: sparse: array of flexible structures
   arch/riscv/kvm/vcpu.c: note: in included file:
   include/linux/kvm_host.h:2035:56: sparse: sparse: array of flexible structures
>> arch/riscv/kvm/vcpu.c:371:21: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:374:16: sparse: sparse: cast to restricted __le64
>> arch/riscv/kvm/vcpu.c:581:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:581:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:581:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:582:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:582:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:582:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:583:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:583:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:583:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:584:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:584:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:584:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:585:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:585:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:585:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:586:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:586:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:586:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:587:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:587:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:587:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:588:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:588:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:588:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:589:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:589:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:589:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:590:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:590:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:590:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:591:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:591:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:591:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:593:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:593:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:593:25: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:595:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:595:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:595:25: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:597:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:597:33: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:597:33: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:658:33: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:659:29: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:660:31: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:661:34: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:662:30: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:663:32: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:664:31: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:665:29: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:666:30: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:732:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:732:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:732:9: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:779:26: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:779:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:779:26: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:779:26: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:916:30: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:917:31: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:320:9: sparse: sparse: context imbalance in 'kvm_riscv_check_vcpu_requests' - unexpected unlock

vim +78 arch/riscv/kvm/vcpu_timer.c

    71	
    72	static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
    73	{
    74	#if defined(CONFIG_32BIT)
    75		ncsr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
    76		ncsr_write(CSR_VSTIMECMPH, ncycles >> 32);
    77	#else
  > 78		ncsr_write(CSR_VSTIMECMP, ncycles);
    79	#endif
    80		return 0;
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
