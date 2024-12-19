Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615F67082A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 07:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734593264; cv=none; b=s2QJgpm2/+4p3wBFC06OaJ+cyDsgpSEN4cP467CrfQG38VhY+9/2jmh2K4AhbkHPUgzxVeonFqa/s7e0+eCdZl+8a90Wen9q4Vme9g82NLu4EcKlJt0MAUl0xU+3/ZaH3oYP925d2TyTvu+nBbo4ag8ZJfXwnXanzOU4rhEoJBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734593264; c=relaxed/simple;
	bh=2LWnwZvRE1R1ygw/EAnSUKPCLv88NyPQ6CwgkJZtVsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FhnEmDGL7Mqv5PBXXsYIGqMhuqpVs/ubYQrNbHzLV3LziCUTkk9xQ2yy5Slsmlteml9lEY0zVx59LkO7sCbPdQYEBgYq2WgR34JgdV3W3Q/tx35sWF3ECYtc9NlXfy9yDRQqiIoBuUNflTZKIANN/KkZSTOhsBaxBQgGsnNirXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfKaF9dT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfKaF9dT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734593262; x=1766129262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2LWnwZvRE1R1ygw/EAnSUKPCLv88NyPQ6CwgkJZtVsQ=;
  b=XfKaF9dT0oSlHnH2t6gQxQdhxSOyW4B8HZmJB6Kimuzge/U7cOPJk/Xu
   +KuNAyJf7eV81wiVxsNgEIL55DRDUtZc21FVHdK5W3z69Q4xt8jkc8hGP
   M7DwmHtPcI+PMSNkihKaHPLCuIgEgAkvWIGAqehJeamFb7vzgx3+kQOPL
   24Bm117XeRoKLJNmxpCp5fHE+NtNHAgT6QBLVChVNtf2o8yxj+7mOU6ef
   vQub/7cIU8you38SwDc/YK1dhwWWt3LNYDD5+8SsniQ+/GoAhwEDaeKR7
   VBf7RqtNenGzB/zj/ZNIivUkxl5R5F5+6cZ26dD3JmgGQBMxS4Kv3W9zT
   g==;
X-CSE-ConnectionGUID: t6PkqBXJRSOdVoK7c/Kkhg==
X-CSE-MsgGUID: i9ZHaIQfQiKqNXIGdUkzUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34992405"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="34992405"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 23:27:41 -0800
X-CSE-ConnectionGUID: Jtb1A+rZRbuIKNFIsehEhQ==
X-CSE-MsgGUID: uYiw48EOTHWNPHP8unf5vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="98644460"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Dec 2024 23:27:40 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOAwc-00005e-0y;
	Thu, 19 Dec 2024 07:27:38 +0000
Date: Thu, 19 Dec 2024 15:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>
Subject: arch/riscv/kvm/vcpu_sbi_sta.c:58:20: sparse: sparse: cast to
 restricted __le32
Message-ID: <202412191512.SmrR3jZB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eabcdba3ad4098460a376538df2ae36500223c1e
commit: e9f12b5fff8ad0eefd0340273767d329ef65fd69 RISC-V: KVM: Implement SBI STA extension
date:   12 months ago
config: riscv-randconfig-r113-20241219 (https://download.01.org/0day-ci/archive/20241219/202412191512.SmrR3jZB-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241219/202412191512.SmrR3jZB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412191512.SmrR3jZB-lkp@intel.com/

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
  > 55		if (WARN_ON(get_user(sequence, sequence_ptr)))
    56			return;
    57	
  > 58		sequence = le32_to_cpu(sequence);
    59		sequence += 1;
    60	
  > 61		if (WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr)))
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
