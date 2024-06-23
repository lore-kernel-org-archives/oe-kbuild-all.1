Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29979846D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 02:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719108137; cv=none; b=iVBuA3S8CPJ7kV/BNj0unQP684ywUD8Yil0rHIMiX7R/8Sa6p+V6oyMfnxE2jz9XM/EC8DqC/NMkd4pNbyFbjf00BLejyGC84N0WE6z9EOfyZDp12PL4XlEGk4Qfva2ptc/jVnyxhhrJdLDMxsl0On8LMZxmJL2wf3ZN+vfzc90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719108137; c=relaxed/simple;
	bh=h1N9BbSsxrG7WSx3YjhjY6wHi48QSKB0RFaKMUWGCsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HlKL5UXlVChaHDy+RjKA4RyuZtb+wBY24t0+h128rcQJlJ30sJ1YDWLhBUGHf/nEHTHlCLkTByPLb1kms16ScpVTut4HCzcy+9Y+xY/dWyoqZxLCBHrAWkxuvguwLTAs9w6zz3nIH5Ex04yuDGQ0Zn+mv8RNwQKlWplPVVbLS5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CE7uzyLI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CE7uzyLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719108136; x=1750644136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h1N9BbSsxrG7WSx3YjhjY6wHi48QSKB0RFaKMUWGCsA=;
  b=CE7uzyLImSpp65bmHfNHCi/vZK9Wq+N50IviYlTGzc0vQTLJKE/94HkA
   eoS9ritCAm7M8NCeZZVuFOiTfkwhqDqJHAI/3CMZlIiLb6Eb85rVU0fZv
   pcO3CqiW5pHsrT85cKKnC+al5yYxtj93p9PpgeGiyu7rdgPd6mxMZHrbX
   D1PphT0jURwKwh8lZVVZ9apJg1Rg1060kQRmqhX/iAl2Lh2hopISdpN17
   qwEJeiQqputeSbeEx4zX2WiiHor3YGU1FSYzYBm0GJ6UK5Wv7aQF8jqsv
   QNd8eGkQwL9aTIVs6o/uIfIqXRRql58do69fYaolwCDcOnKtz9M8udU3J
   A==;
X-CSE-ConnectionGUID: 8Y6YzAhuTCiWNrC9IbJUwQ==
X-CSE-MsgGUID: CWWf7PBGSDyDebGVsehtvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="15938084"
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="15938084"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 19:02:12 -0700
X-CSE-ConnectionGUID: PmUJVu4HQzSGm8LdDAbaxg==
X-CSE-MsgGUID: db0Yfp9qQ/ihglgjzfD3Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="42921677"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jun 2024 19:02:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLCYR-000A9e-23;
	Sun, 23 Jun 2024 02:02:07 +0000
Date: Sun, 23 Jun 2024 10:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>
Subject: arch/riscv/kvm/vcpu_sbi_sta.c:59:13: sparse: sparse: restricted
 __le32 degrades to integer
Message-ID: <202406230951.z2XjxdWg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5f583a3162ffd9f7999af76b8ab634ce2dac9f90
commit: f072b272aa27d57cf7fe6fdedb30fb50f391974e RISC-V: KVM: Use correct restricted types
date:   5 months ago
config: riscv-randconfig-r113-20240623 (https://download.01.org/0day-ci/archive/20240623/202406230951.z2XjxdWg-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240623/202406230951.z2XjxdWg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406230951.z2XjxdWg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/vcpu_sbi_sta.c:59:13: sparse: sparse: restricted __le32 degrades to integer
>> arch/riscv/kvm/vcpu_sbi_sta.c:59:13: sparse: sparse: restricted __le32 degrades to integer
   arch/riscv/kvm/vcpu_sbi_sta.c:59:13: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu_sbi_sta.c:65:13: sparse: sparse: restricted __le32 degrades to integer
   arch/riscv/kvm/vcpu_sbi_sta.c:65:13: sparse: sparse: restricted __le32 degrades to integer
>> arch/riscv/kvm/vcpu_sbi_sta.c:65:13: sparse: sparse: cast from restricted __le32
>> arch/riscv/kvm/vcpu_sbi_sta.c:68:14: sparse: sparse: restricted __le64 degrades to integer
>> arch/riscv/kvm/vcpu_sbi_sta.c:68:14: sparse: sparse: restricted __le64 degrades to integer
   arch/riscv/kvm/vcpu_sbi_sta.c:68:14: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu_sbi_sta.c:72:17: sparse: sparse: restricted __le64 degrades to integer
   arch/riscv/kvm/vcpu_sbi_sta.c:72:17: sparse: sparse: restricted __le64 degrades to integer
>> arch/riscv/kvm/vcpu_sbi_sta.c:72:17: sparse: sparse: cast from restricted __le64
   arch/riscv/kvm/vcpu_sbi_sta.c:76:9: sparse: sparse: restricted __le32 degrades to integer
   arch/riscv/kvm/vcpu_sbi_sta.c:76:9: sparse: sparse: restricted __le32 degrades to integer
   arch/riscv/kvm/vcpu_sbi_sta.c:76:9: sparse: sparse: cast from restricted __le32

vim +59 arch/riscv/kvm/vcpu_sbi_sta.c

    24	
    25	void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
    26	{
    27		gpa_t shmem = vcpu->arch.sta.shmem;
    28		u64 last_steal = vcpu->arch.sta.last_steal;
    29		__le32 __user *sequence_ptr;
    30		__le64 __user *steal_ptr;
    31		__le32 sequence_le;
    32		__le64 steal_le;
    33		u32 sequence;
    34		u64 steal;
    35		unsigned long hva;
    36		gfn_t gfn;
    37	
    38		if (shmem == INVALID_GPA)
    39			return;
    40	
    41		/*
    42		 * shmem is 64-byte aligned (see the enforcement in
    43		 * kvm_sbi_sta_steal_time_set_shmem()) and the size of sbi_sta_struct
    44		 * is 64 bytes, so we know all its offsets are in the same page.
    45		 */
    46		gfn = shmem >> PAGE_SHIFT;
    47		hva = kvm_vcpu_gfn_to_hva(vcpu, gfn);
    48	
    49		if (WARN_ON(kvm_is_error_hva(hva))) {
    50			vcpu->arch.sta.shmem = INVALID_GPA;
    51			return;
    52		}
    53	
    54		sequence_ptr = (__le32 __user *)(hva + offset_in_page(shmem) +
    55				       offsetof(struct sbi_sta_struct, sequence));
    56		steal_ptr = (__le64 __user *)(hva + offset_in_page(shmem) +
    57				    offsetof(struct sbi_sta_struct, steal));
    58	
  > 59		if (WARN_ON(get_user(sequence_le, sequence_ptr)))
    60			return;
    61	
    62		sequence = le32_to_cpu(sequence_le);
    63		sequence += 1;
    64	
  > 65		if (WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr)))
    66			return;
    67	
  > 68		if (!WARN_ON(get_user(steal_le, steal_ptr))) {
    69			steal = le64_to_cpu(steal_le);
    70			vcpu->arch.sta.last_steal = READ_ONCE(current->sched_info.run_delay);
    71			steal += vcpu->arch.sta.last_steal - last_steal;
  > 72			WARN_ON(put_user(cpu_to_le64(steal), steal_ptr));
    73		}
    74	
    75		sequence += 1;
    76		WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr));
    77	
    78		kvm_vcpu_mark_page_dirty(vcpu, gfn);
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
