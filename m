Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844D96FB8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jan 2024 17:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4D9Yzlx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704129197; x=1735665197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8BEn53P+XVnox8JrZv47N1KGUZmmHsAzdOcXLIbKVOA=;
  b=h4D9Yzlx9xf4n5kbuEGrDh/NopWwsmc4bImLqInoPW1GrfJ1/swKAfJl
   +Mb9YsoU0a8uyne5QpGS1z+nHCrXV4tXcA4Bly2/lIsjfXz2tj+XFN+ce
   QsY1gTRxw7t7VlDiAlEWzqZjLk3x0yjj3VgmpSL0HaeV3ExrwgRCnQbb3
   Sf1BUPRdP+MGdi5fafaBIRRKkVIlnsNwhYIZsQAlh1nMaEa9wrB+BwisV
   +VlQVYjC1Lx5sBdD6a22g+Q9fYsYIW3AvNvQMOJd6/ga88VPoi3/rXEo/
   wa/Qf93np4dqpgKWml13O5g/7oNNhqyaByGk3OLo465j6bYpzhZKwIjo5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="15449045"
X-IronPort-AV: E=Sophos;i="6.04,322,1695711600"; 
   d="scan'208";a="15449045"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2024 09:13:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,322,1695711600"; 
   d="scan'208";a="27865891"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Jan 2024 09:13:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKLqg-000KQh-2E;
	Mon, 01 Jan 2024 17:13:11 +0000
Date: Tue, 2 Jan 2024 01:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-riscv:riscv_kvm_queue 23/27]
 arch/riscv/kvm/vcpu_sbi_sta.c:55:13: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202401020142.lwFEDK5v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kvm-riscv/linux.git riscv_kvm_queue
head:   aad86da229bc9d0390dc2c02eb0db9ab1f50d059
commit: 48cf9d76ece38e3855f9a05929a0c094c2933c2d [23/27] RISC-V: KVM: Implement SBI STA extension
config: riscv-randconfig-r123-20240101 (https://download.01.org/0day-ci/archive/20240102/202401020142.lwFEDK5v-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 8a4266a626914765c0c69839e8a51be383013c1a)
reproduce: (https://download.01.org/0day-ci/archive/20240102/202401020142.lwFEDK5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401020142.lwFEDK5v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/vcpu_sbi_sta.c:55:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] *[assigned] sequence_ptr @@
   arch/riscv/kvm/vcpu_sbi_sta.c:55:13: sparse:     expected unsigned int const [noderef] __user *__p
   arch/riscv/kvm/vcpu_sbi_sta.c:55:13: sparse:     got unsigned int [usertype] *[assigned] sequence_ptr
>> arch/riscv/kvm/vcpu_sbi_sta.c:58:20: sparse: sparse: cast to restricted __le32
>> arch/riscv/kvm/vcpu_sbi_sta.c:61:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] *[assigned] sequence_ptr @@
   arch/riscv/kvm/vcpu_sbi_sta.c:61:13: sparse:     expected unsigned int [noderef] __user *__p
   arch/riscv/kvm/vcpu_sbi_sta.c:61:13: sparse:     got unsigned int [usertype] *[assigned] sequence_ptr
>> arch/riscv/kvm/vcpu_sbi_sta.c:61:13: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int __val @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_sbi_sta.c:61:13: sparse:     expected unsigned int __val
   arch/riscv/kvm/vcpu_sbi_sta.c:61:13: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kvm/vcpu_sbi_sta.c:64:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long const [noderef] __user *__p @@     got unsigned long long [usertype] *[assigned] steal_ptr @@
   arch/riscv/kvm/vcpu_sbi_sta.c:64:14: sparse:     expected unsigned long long const [noderef] __user *__p
   arch/riscv/kvm/vcpu_sbi_sta.c:64:14: sparse:     got unsigned long long [usertype] *[assigned] steal_ptr
>> arch/riscv/kvm/vcpu_sbi_sta.c:65:25: sparse: sparse: cast to restricted __le64
>> arch/riscv/kvm/vcpu_sbi_sta.c:68:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] __user *__p @@     got unsigned long long [usertype] *[assigned] steal_ptr @@
   arch/riscv/kvm/vcpu_sbi_sta.c:68:17: sparse:     expected unsigned long long [noderef] __user *__p
   arch/riscv/kvm/vcpu_sbi_sta.c:68:17: sparse:     got unsigned long long [usertype] *[assigned] steal_ptr
>> arch/riscv/kvm/vcpu_sbi_sta.c:68:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long __val @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_sbi_sta.c:68:17: sparse:     expected unsigned long long __val
   arch/riscv/kvm/vcpu_sbi_sta.c:68:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_sbi_sta.c:72:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] *[assigned] sequence_ptr @@
   arch/riscv/kvm/vcpu_sbi_sta.c:72:9: sparse:     expected unsigned int [noderef] __user *__p
   arch/riscv/kvm/vcpu_sbi_sta.c:72:9: sparse:     got unsigned int [usertype] *[assigned] sequence_ptr
   arch/riscv/kvm/vcpu_sbi_sta.c:72:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int __val @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_sbi_sta.c:72:9: sparse:     expected unsigned int __val
   arch/riscv/kvm/vcpu_sbi_sta.c:72:9: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_sbi_sta.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +55 arch/riscv/kvm/vcpu_sbi_sta.c

    24	
    25	void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
    26	{
    27		gpa_t shmem = vcpu->arch.sta.shmem;
    28		u64 last_steal = vcpu->arch.sta.last_steal;
    29		u32 *sequence_ptr, sequence;
    30		u64 *steal_ptr, steal;
    31		unsigned long hva;
    32		gfn_t gfn;
    33	
    34		if (shmem == INVALID_GPA)
    35			return;
    36	
    37		/*
    38		 * shmem is 64-byte aligned (see the enforcement in
    39		 * kvm_sbi_sta_steal_time_set_shmem()) and the size of sbi_sta_struct
    40		 * is 64 bytes, so we know all its offsets are in the same page.
    41		 */
    42		gfn = shmem >> PAGE_SHIFT;
    43		hva = kvm_vcpu_gfn_to_hva(vcpu, gfn);
    44	
    45		if (WARN_ON(kvm_is_error_hva(hva))) {
    46			vcpu->arch.sta.shmem = INVALID_GPA;
    47			return;
    48		}
    49	
    50		sequence_ptr = (u32 *)(hva + offset_in_page(shmem) +
    51				       offsetof(struct sbi_sta_struct, sequence));
    52		steal_ptr = (u64 *)(hva + offset_in_page(shmem) +
    53				    offsetof(struct sbi_sta_struct, steal));
    54	
  > 55		if (WARN_ON(get_user(sequence, sequence_ptr)))
    56			return;
    57	
  > 58		sequence = le32_to_cpu(sequence);
    59		sequence += 1;
    60	
  > 61		if (WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr)))
    62			return;
    63	
  > 64		if (!WARN_ON(get_user(steal, steal_ptr))) {
  > 65			steal = le64_to_cpu(steal);
    66			vcpu->arch.sta.last_steal = READ_ONCE(current->sched_info.run_delay);
    67			steal += vcpu->arch.sta.last_steal - last_steal;
  > 68			WARN_ON(put_user(cpu_to_le64(steal), steal_ptr));
    69		}
    70	
    71		sequence += 1;
    72		WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr));
    73	
    74		kvm_vcpu_mark_page_dirty(vcpu, gfn);
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
