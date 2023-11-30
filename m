Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF9752F60
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 21:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ys/PgHDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701378122; x=1732914122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eILiWuciVmQ3sixIW54RTiUYP47Shk8VwrB8GMNaxk0=;
  b=Ys/PgHDkcHkYOeITGJ7Tf1N3/VwkI5sUAsvKDriQP1Rdm3Lw5CEvOabn
   JJPAr+Xh+k+xqwL7WYzaLeGXVE45z7jvyES/RIVjH5QV3aAlMXf40B883
   YQz0z0s4hULvX6Bt7CEHgLSSbouoS1xp+qY1kRbnI4fdGE+UA8kMUZKGT
   hwlo+T6bTUz2y4WtjYWCeEKr1vYaDMtOw87wFIB0MUhmRqvb2FAU08h2s
   cAngJZm1MuP4ToFI7qmGUsaJeD5qj/dz0YeEDKpVndRpVh0Z/PBW7k7p8
   QXHa5FfYw0Xz8gL3tvyST+adoyRXn3lrHiSCBWlcnaFM1JGuZs58sANen
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="373575769"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="373575769"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 13:01:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="719255325"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="719255325"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Nov 2023 13:01:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8oAT-0002eC-0K;
	Thu, 30 Nov 2023 21:01:53 +0000
Date: Fri, 1 Dec 2023 05:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_nested_v1 58/61] arch/riscv/kvm/mmu.c:755:9:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202312010557.dpfQgCM8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   23b4d8596c1b6a096138dd87e29e6c6f25175dbf
commit: 1b4a250af5494427a203e98bfe2776b38efbe274 [58/61] RISC-V: KVM: Use nacl_csr_xyz() for accessing CSRs in run-loop
config: riscv-randconfig-r111-20231130 (https://download.01.org/0day-ci/archive/20231201/202312010557.dpfQgCM8-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010557.dpfQgCM8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312010557.dpfQgCM8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> arch/riscv/kvm/mmu.c:755:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/mmu.c:755:9: sparse:     expected unsigned long
   arch/riscv/kvm/mmu.c:755:9: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/mmu.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, include/linux/hugetlb.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
   WARNING: invalid argument to '-march': '_zihintpause'
   arch/riscv/kvm/vcpu.c:24:49: sparse: sparse: array of flexible structures
   arch/riscv/kvm/vcpu.c: note: in included file:
   include/linux/kvm_host.h:1948:56: sparse: sparse: array of flexible structures
>> arch/riscv/kvm/vcpu.c:350:21: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:353:16: sparse: sparse: cast to restricted __le64
>> arch/riscv/kvm/vcpu.c:516:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:516:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:516:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:517:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:517:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:517:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:518:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:518:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:518:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:519:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:519:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:519:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:520:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:520:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:520:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:521:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:521:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:521:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:522:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:522:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:522:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:523:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:523:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:523:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:524:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:524:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:524:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:525:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:525:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:525:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:527:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:527:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:527:25: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:530:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:530:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:530:25: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:533:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:533:33: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:533:33: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:592:33: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:593:29: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:594:31: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:595:34: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:596:30: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:597:32: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:598:31: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:599:29: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:600:30: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:663:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:663:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:663:9: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:708:26: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:708:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu.c:708:26: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:708:26: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu.c:844:30: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c:845:31: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   arch/riscv/kvm/vcpu.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:285:9: sparse: sparse: context imbalance in 'kvm_riscv_check_vcpu_requests' - unexpected unlock
--
   WARNING: invalid argument to '-march': '_zihintpause'
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
   arch/riscv/kvm/vcpu_timer.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +755 arch/riscv/kvm/mmu.c

   746	
   747	void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
   748	{
   749		unsigned long hgatp = gstage_mode;
   750		struct kvm_arch *k = &vcpu->kvm->arch;
   751	
   752		hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
   753		hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
   754	
 > 755		nacl_csr_write(CSR_HGATP, hgatp);
   756	
   757		if (!kvm_riscv_gstage_vmid_bits())
   758			kvm_riscv_local_hfence_gvma_all();
   759	}
   760	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
