Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA04F33C1B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769703849; cv=none; b=BJ3GWOX8uxi/EfSxAv6RybpmdZ/HuON+jlSH4Bubma6XBUsNgf4vo6F3lUQ3jjMPfhBkKSmNr0B9RuUO+lY9Qk0B23rchqsZzrnsd+k7DRDuPCMSq3OH8mu7KYshizDUAT9s+a1xYgapVgxuKjWo8kka6yl+sz21vGdZPEJW5Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769703849; c=relaxed/simple;
	bh=/zLSssrRyOfBQB1QrQ/5twWiIYLSDeXSSNsbOJoe6k0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d+giLZSmU2XlqEK2Nk7jKo5oTuoLE+reKqFF9YZbDCbMf0B5GbMk8CtqUTkMBn8t/PVzML91J60n3AkwbONwQ4qUo6PxOK3DFZlkcIMnrfYc2JgoEubDOzxFfw6UznivMz2YjABs878SyoUfitpQOBYJ1FJsD2AMF1rCRSWypAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKVluxJO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKVluxJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769703847; x=1801239847;
  h=date:from:to:cc:subject:message-id;
  bh=/zLSssrRyOfBQB1QrQ/5twWiIYLSDeXSSNsbOJoe6k0=;
  b=LKVluxJOHj2cVAJpqbSsMnC+lwGGFsp0XkBavTnRS5yfSRXrqx35uDEl
   zjn4OjM9p742Nxa5KgXL07q8U+GoyT/Q/9BGCDP1ssFqriCj3MGIvuvLK
   T75IvpwY97aMBGmcnf92GkWvv6HcVy+mkExBQfo7ye3xkknXP5/EoZeEi
   31Kb1nZ8ABQXdq8SjHHGOMNpYKD9zB/xtborDOXWwLY4zk8amk6fD+UuQ
   GG9sHMCqB+nOEPv920wnAL1BfrNgWmpi77Cp7OJa5cZppYPDK/A6GZvRn
   sNvTFNiIV1a2Vvx1VHCU4IlpPSsTQU7X6uB80a8CLG+6vviYKv3HV4Nda
   g==;
X-CSE-ConnectionGUID: XmTf4eujT3KZqzi/7L/4EQ==
X-CSE-MsgGUID: a76MRXPJTsOjExG9IaU52g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="93604394"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="93604394"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 08:24:06 -0800
X-CSE-ConnectionGUID: kGBEsN9fRAeaUYppMNy7+Q==
X-CSE-MsgGUID: 1ajqW5STS9+T47p0Dv5b2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="212702345"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Jan 2026 08:24:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlUoL-00000000bfe-0v4I;
	Thu, 29 Jan 2026 16:24:01 +0000
Date: Fri, 30 Jan 2026 00:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>
Subject: arch/riscv/kvm/vcpu_sbi_sta.c:59:13: sparse: sparse: cast to
 restricted __le32
Message-ID: <202601300057.iTAe6Gxb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
commit: bdce162f2e57a969803e5e9375999a3e0546905f riscv: Use 64-bit variable for output in __get_user_asm
date:   13 days ago
config: riscv-randconfig-r111-20260129 (https://download.01.org/0day-ci/archive/20260130/202601300057.iTAe6Gxb-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601300057.iTAe6Gxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601300057.iTAe6Gxb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/vcpu_sbi_sta.c:59:13: sparse: sparse: cast to restricted __le32
>> arch/riscv/kvm/vcpu_sbi_sta.c:59:13: sparse: sparse: cast to restricted __le32
>> arch/riscv/kvm/vcpu_sbi_sta.c:59:13: sparse: sparse: cast to restricted __le32
>> arch/riscv/kvm/vcpu_sbi_sta.c:59:13: sparse: sparse: cast to restricted __le32
>> arch/riscv/kvm/vcpu_sbi_sta.c:68:14: sparse: sparse: cast to restricted __le64
>> arch/riscv/kvm/vcpu_sbi_sta.c:68:14: sparse: sparse: cast to restricted __le64
>> arch/riscv/kvm/vcpu_sbi_sta.c:68:14: sparse: sparse: cast to restricted __le64
>> arch/riscv/kvm/vcpu_sbi_sta.c:68:14: sparse: sparse: cast to restricted __le64

vim +59 arch/riscv/kvm/vcpu_sbi_sta.c

38b3390ee48801 Andrew Jones 2023-12-20  24  
2a1f6bf079700f Andrew Jones 2023-12-20  25  void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
2a1f6bf079700f Andrew Jones 2023-12-20  26  {
38b3390ee48801 Andrew Jones 2023-12-20  27  	gpa_t shmem = vcpu->arch.sta.shmem;
e9f12b5fff8ad0 Andrew Jones 2023-12-20  28  	u64 last_steal = vcpu->arch.sta.last_steal;
f072b272aa27d5 Andrew Jones 2024-01-31  29  	__le32 __user *sequence_ptr;
f072b272aa27d5 Andrew Jones 2024-01-31  30  	__le64 __user *steal_ptr;
f072b272aa27d5 Andrew Jones 2024-01-31  31  	__le32 sequence_le;
f072b272aa27d5 Andrew Jones 2024-01-31  32  	__le64 steal_le;
f072b272aa27d5 Andrew Jones 2024-01-31  33  	u32 sequence;
f072b272aa27d5 Andrew Jones 2024-01-31  34  	u64 steal;
e9f12b5fff8ad0 Andrew Jones 2023-12-20  35  	unsigned long hva;
e9f12b5fff8ad0 Andrew Jones 2023-12-20  36  	gfn_t gfn;
38b3390ee48801 Andrew Jones 2023-12-20  37  
38b3390ee48801 Andrew Jones 2023-12-20  38  	if (shmem == INVALID_GPA)
38b3390ee48801 Andrew Jones 2023-12-20  39  		return;
e9f12b5fff8ad0 Andrew Jones 2023-12-20  40  
e9f12b5fff8ad0 Andrew Jones 2023-12-20  41  	/*
e9f12b5fff8ad0 Andrew Jones 2023-12-20  42  	 * shmem is 64-byte aligned (see the enforcement in
e9f12b5fff8ad0 Andrew Jones 2023-12-20  43  	 * kvm_sbi_sta_steal_time_set_shmem()) and the size of sbi_sta_struct
e9f12b5fff8ad0 Andrew Jones 2023-12-20  44  	 * is 64 bytes, so we know all its offsets are in the same page.
e9f12b5fff8ad0 Andrew Jones 2023-12-20  45  	 */
e9f12b5fff8ad0 Andrew Jones 2023-12-20  46  	gfn = shmem >> PAGE_SHIFT;
e9f12b5fff8ad0 Andrew Jones 2023-12-20  47  	hva = kvm_vcpu_gfn_to_hva(vcpu, gfn);
e9f12b5fff8ad0 Andrew Jones 2023-12-20  48  
e9f12b5fff8ad0 Andrew Jones 2023-12-20  49  	if (WARN_ON(kvm_is_error_hva(hva))) {
e9f12b5fff8ad0 Andrew Jones 2023-12-20  50  		vcpu->arch.sta.shmem = INVALID_GPA;
e9f12b5fff8ad0 Andrew Jones 2023-12-20  51  		return;
e9f12b5fff8ad0 Andrew Jones 2023-12-20  52  	}
e9f12b5fff8ad0 Andrew Jones 2023-12-20  53  
f072b272aa27d5 Andrew Jones 2024-01-31  54  	sequence_ptr = (__le32 __user *)(hva + offset_in_page(shmem) +
e9f12b5fff8ad0 Andrew Jones 2023-12-20  55  			       offsetof(struct sbi_sta_struct, sequence));
f072b272aa27d5 Andrew Jones 2024-01-31  56  	steal_ptr = (__le64 __user *)(hva + offset_in_page(shmem) +
e9f12b5fff8ad0 Andrew Jones 2023-12-20  57  			    offsetof(struct sbi_sta_struct, steal));
e9f12b5fff8ad0 Andrew Jones 2023-12-20  58  
f072b272aa27d5 Andrew Jones 2024-01-31 @59  	if (WARN_ON(get_user(sequence_le, sequence_ptr)))
e9f12b5fff8ad0 Andrew Jones 2023-12-20  60  		return;
e9f12b5fff8ad0 Andrew Jones 2023-12-20  61  
f072b272aa27d5 Andrew Jones 2024-01-31  62  	sequence = le32_to_cpu(sequence_le);
e9f12b5fff8ad0 Andrew Jones 2023-12-20  63  	sequence += 1;
e9f12b5fff8ad0 Andrew Jones 2023-12-20  64  
e9f12b5fff8ad0 Andrew Jones 2023-12-20  65  	if (WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr)))
e9f12b5fff8ad0 Andrew Jones 2023-12-20  66  		return;
e9f12b5fff8ad0 Andrew Jones 2023-12-20  67  
f072b272aa27d5 Andrew Jones 2024-01-31 @68  	if (!WARN_ON(get_user(steal_le, steal_ptr))) {
f072b272aa27d5 Andrew Jones 2024-01-31  69  		steal = le64_to_cpu(steal_le);
e9f12b5fff8ad0 Andrew Jones 2023-12-20  70  		vcpu->arch.sta.last_steal = READ_ONCE(current->sched_info.run_delay);
e9f12b5fff8ad0 Andrew Jones 2023-12-20  71  		steal += vcpu->arch.sta.last_steal - last_steal;
e9f12b5fff8ad0 Andrew Jones 2023-12-20  72  		WARN_ON(put_user(cpu_to_le64(steal), steal_ptr));
e9f12b5fff8ad0 Andrew Jones 2023-12-20  73  	}
e9f12b5fff8ad0 Andrew Jones 2023-12-20  74  
e9f12b5fff8ad0 Andrew Jones 2023-12-20  75  	sequence += 1;
e9f12b5fff8ad0 Andrew Jones 2023-12-20  76  	WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr));
e9f12b5fff8ad0 Andrew Jones 2023-12-20  77  
e9f12b5fff8ad0 Andrew Jones 2023-12-20  78  	kvm_vcpu_mark_page_dirty(vcpu, gfn);
2a1f6bf079700f Andrew Jones 2023-12-20  79  }
2a1f6bf079700f Andrew Jones 2023-12-20  80  

:::::: The code at line 59 was first introduced by commit
:::::: f072b272aa27d57cf7fe6fdedb30fb50f391974e RISC-V: KVM: Use correct restricted types

:::::: TO: Andrew Jones <ajones@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
