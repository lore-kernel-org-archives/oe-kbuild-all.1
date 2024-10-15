Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDF91CF7DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 08:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728982304; cv=none; b=IoVHUiA+d+6e1gs/rf/I50dXGL3MRt8Bio8WD+hhb8I3rA1KdiegWxNfpwqfe2cGKaY3K/VOkKMz0vbiKoXD+jE8oWQhwFMQx6GVsdA/K3NbcdVa/llqmogO35+Ouz/afwiEV4YSEiuU7ypJPJCf85OQilEn5TOf/nprPotBuWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728982304; c=relaxed/simple;
	bh=TO5FfazasUA8bTKfpx4np1JW/UhLOXiGiVWWP47Gg8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KKi+w2ZTjA8Ay9gUT6ZDQ3HrTWYpku7HCun0PJBuxhIKitCu1qJNlb9CYmOB5YkaNpCGxetxfuhCkV+pg/wo/yJiQiNYjBGph1yT0ou+jH336s6ZuC50YN9fIKZpjXOLc751XqdUVkpBpd2ybXyqVsNJOXZuw+Cqj88MY6YdB5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUJ58nUA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUJ58nUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728982303; x=1760518303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TO5FfazasUA8bTKfpx4np1JW/UhLOXiGiVWWP47Gg8E=;
  b=KUJ58nUAvUhKPDNz6GmlXrJ/z+4MgNVzH0xmC217TMWSLSzN0sPl1osZ
   CIY+PO9mEjlUsBiS/H/Vl6ZWfkXFfoC2ZtayUNmGqnRUKlikuKsM7zeQx
   c7ph6aXbhqvQ8LtTRwhJBmRzQWVtiHN+wOxLueLX/AzmGGoVt3O1fjcHB
   JcCo9Ra/odNPrSI102ySQg4yVqScKyzC035FfzAXIaPyDkZFmfBmHk8ID
   aDwjrVL4pzMk2ydaFCrT8P2ihQROXsR5Krt/5W/6Xhbiu/Y2LmAeD8SrN
   HFyjhbjTiBwWkmOaVQJbI/muyRcXTHyq59hQJIuOXyieobk/SwjFzOQAv
   g==;
X-CSE-ConnectionGUID: r6+q/E4FRZuY+nxXBxNiwg==
X-CSE-MsgGUID: q/O9ZKJGTxGJ3i7rTT1emg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28460336"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="28460336"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 01:51:42 -0700
X-CSE-ConnectionGUID: 8hAVO72xScGG4OuhoVEQGA==
X-CSE-MsgGUID: lXy7bNZEQH6Gty9AbbOPsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="78653387"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Oct 2024 01:51:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0dHF-000Hqh-0X;
	Tue, 15 Oct 2024 08:51:37 +0000
Date: Tue, 15 Oct 2024 16:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>
Subject: arch/riscv/kvm/vcpu_sbi_sta.c:58:20: sparse: sparse: cast to
 restricted __le32
Message-ID: <202410151618.iYFXm2Ip-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eca631b8fe808748d7585059c4307005ca5c5820
commit: e9f12b5fff8ad0eefd0340273767d329ef65fd69 RISC-V: KVM: Implement SBI STA extension
date:   10 months ago
config: riscv-randconfig-r132-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151618.iYFXm2Ip-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241015/202410151618.iYFXm2Ip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151618.iYFXm2Ip-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/riscv/kvm/vcpu_sbi_sta.c:55:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] *[assigned] sequence_ptr @@
   arch/riscv/kvm/vcpu_sbi_sta.c:55:13: sparse:     expected unsigned int const [noderef] __user *__p
   arch/riscv/kvm/vcpu_sbi_sta.c:55:13: sparse:     got unsigned int [usertype] *[assigned] sequence_ptr
>> arch/riscv/kvm/vcpu_sbi_sta.c:58:20: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu_sbi_sta.c:61:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] *[assigned] sequence_ptr @@
   arch/riscv/kvm/vcpu_sbi_sta.c:61:13: sparse:     expected unsigned int [noderef] __user *__p
   arch/riscv/kvm/vcpu_sbi_sta.c:61:13: sparse:     got unsigned int [usertype] *[assigned] sequence_ptr
   arch/riscv/kvm/vcpu_sbi_sta.c:61:13: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int __val @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_sbi_sta.c:61:13: sparse:     expected unsigned int __val
   arch/riscv/kvm/vcpu_sbi_sta.c:61:13: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_sbi_sta.c:64:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long const [noderef] __user *__p @@     got unsigned long long [usertype] *[assigned] steal_ptr @@
   arch/riscv/kvm/vcpu_sbi_sta.c:64:14: sparse:     expected unsigned long long const [noderef] __user *__p
   arch/riscv/kvm/vcpu_sbi_sta.c:64:14: sparse:     got unsigned long long [usertype] *[assigned] steal_ptr
>> arch/riscv/kvm/vcpu_sbi_sta.c:65:25: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu_sbi_sta.c:68:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] __user *__p @@     got unsigned long long [usertype] *[assigned] steal_ptr @@
   arch/riscv/kvm/vcpu_sbi_sta.c:68:17: sparse:     expected unsigned long long [noderef] __user *__p
   arch/riscv/kvm/vcpu_sbi_sta.c:68:17: sparse:     got unsigned long long [usertype] *[assigned] steal_ptr
   arch/riscv/kvm/vcpu_sbi_sta.c:68:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long __val @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_sbi_sta.c:68:17: sparse:     expected unsigned long long __val
   arch/riscv/kvm/vcpu_sbi_sta.c:68:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/vcpu_sbi_sta.c:72:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] *[assigned] sequence_ptr @@
   arch/riscv/kvm/vcpu_sbi_sta.c:72:9: sparse:     expected unsigned int [noderef] __user *__p
   arch/riscv/kvm/vcpu_sbi_sta.c:72:9: sparse:     got unsigned int [usertype] *[assigned] sequence_ptr
   arch/riscv/kvm/vcpu_sbi_sta.c:72:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int __val @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_sbi_sta.c:72:9: sparse:     expected unsigned int __val
   arch/riscv/kvm/vcpu_sbi_sta.c:72:9: sparse:     got restricted __le32 [usertype]

vim +58 arch/riscv/kvm/vcpu_sbi_sta.c

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
    55		if (WARN_ON(get_user(sequence, sequence_ptr)))
    56			return;
    57	
  > 58		sequence = le32_to_cpu(sequence);
    59		sequence += 1;
    60	
    61		if (WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr)))
    62			return;
    63	
    64		if (!WARN_ON(get_user(steal, steal_ptr))) {
  > 65			steal = le64_to_cpu(steal);
    66			vcpu->arch.sta.last_steal = READ_ONCE(current->sched_info.run_delay);
    67			steal += vcpu->arch.sta.last_steal - last_steal;
    68			WARN_ON(put_user(cpu_to_le64(steal), steal_ptr));
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
