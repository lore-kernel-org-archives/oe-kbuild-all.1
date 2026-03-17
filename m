Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E122D8798
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 02:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773713644; cv=none; b=QiPQTqM+XTtcdLRyNboSRiyxtf/JP+LPDT+9tm+8RzHq+Q8kq3osPdCEv7c7gzHmJnhLWeeQh/6OQC8tQvAjRImgdQvC0isd4X1FspcpjornSAXqHtJYLj0EHXsNoCmQS+/g+4+QX2YgIOr3ffFWJlSDnq1a6ccu2bHXbnGms08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773713644; c=relaxed/simple;
	bh=f/ZwGVP42ALBaczLISpsN7nfpQpwhxZYnJzXeDjBL6E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IM7aNwToz5e5pzLnfPvjB2tysOEIxKebNQEk+eULBC/MIvYwmSW5Uu6ie6/wfjBF/aLU6ReNO76VvrJRSqZ3ebJerK4QW/wIr56FPx8HigHrajib2T8LdRMC7xMXqy3WjWiIQ9zCtYNZC+i0PXYkszPb8/ni807AE6MFYuDkcbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsRIyoaq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsRIyoaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773713643; x=1805249643;
  h=date:from:to:cc:subject:message-id;
  bh=f/ZwGVP42ALBaczLISpsN7nfpQpwhxZYnJzXeDjBL6E=;
  b=dsRIyoaqw2mEd4lZdXh1fPfpnJQhdP/Q7kbSmr/QWYQOtggFgdPS2LYX
   SWcWOTY0cAatJlYiB3/BQHWXV4plDmDG3nL4YWIVrUmCt3JDiavnuoiBN
   2gJoh8LiAbFjhfPKgMy5M0fV0lVpkNwhW5TQlLDeSAfqIiAHCFjW6T1e3
   JpLoNUqTXnLM2uS4gsc+GwAKV9TnNlOUUD9wF2vxZHKbNXFcQQT7aFFhD
   vx1EtT2ihAq9qNkmAyO72ZVqvW8LNaASBJ9AOhM7XZu6Uj4WlNzkOkRaq
   SJy/DLSlAaEyl9a/N6FlrFnnKL+fBPrLKZvexYuSPR5jneQoSGK9wjRLI
   g==;
X-CSE-ConnectionGUID: IUUk7nIkRGWo78JhfIjDDA==
X-CSE-MsgGUID: NHCGhV8xRrKsTwXJIfypGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74628768"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74628768"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 19:14:02 -0700
X-CSE-ConnectionGUID: LTxGADnkQsKX9SRQfzV0Cw==
X-CSE-MsgGUID: THjgzxg2TXWumiwXIUTmdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="219631627"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Mar 2026 19:14:00 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2JwT-000000001fM-1qDn;
	Tue, 17 Mar 2026 02:13:57 +0000
Date: Tue, 17 Mar 2026 10:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>
Subject: arch/riscv/kvm/vcpu_sbi_sta.c:59:13: sparse: sparse: cast to
 restricted __le32
Message-ID: <202603171036.ZX6OXvb6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d1373e4246da3b58e1df058374ed6b101804e07
commit: bdce162f2e57a969803e5e9375999a3e0546905f riscv: Use 64-bit variable for output in __get_user_asm
date:   8 weeks ago
config: riscv-randconfig-r123-20260317 (https://download.01.org/0day-ci/archive/20260317/202603171036.ZX6OXvb6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171036.ZX6OXvb6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171036.ZX6OXvb6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
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
