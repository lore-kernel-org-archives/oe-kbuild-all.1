Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3978375F9C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 01:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776649885; cv=none; b=V27gpRJeLvW8e1S9GJ7prVIdJ1kyinroHhQshx7//mlcEuA1gaUyff9gxRfpEiSzRK0RYwg+ylOnvYCQ/sQ/02rOVoT01gyhtmDLaJ04u3V9i/NfpSmN75dOOxMDSHAPyebITcHBe9H4f3dxgB6z3qrbZzKtKiEO7ALplJmN0Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776649885; c=relaxed/simple;
	bh=D4b5UN0k6Sj/hBHoxcBhz6m6NhPOgwx8xTOOWx/Fc6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QTtic2h9YkVbgrFyp1ey2DYkM9w0xaxJRjt2g3DhDadaeJmbbPKAKiROZBVU+O8SmKo8W3ZcTP1yV3wZaqKuHExs21N7mkriGuZGnLIZCJXqVY1kYJf1lT2TqbEyNjhuctK8TJmJ14KR9pp6gtq4mHqwawyBPfMuMtr+Eup7bdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eyHo9yit; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyHo9yit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776649884; x=1808185884;
  h=date:from:to:cc:subject:message-id;
  bh=D4b5UN0k6Sj/hBHoxcBhz6m6NhPOgwx8xTOOWx/Fc6M=;
  b=eyHo9yitg2Q8xkgy36YrFPHHIrfZQfVby23moDnpwOj6QR7sUcPLDTwZ
   TAZFadvGdr0vpgB0Y294/3w/EOWGklhyIoeG87372+RrJHoqfzPXtrlL6
   pCoDuPXw+jDvCOVxZHRny8sSRzbWDQJzf2o5oXvUVVYgVijW+hSICP+W7
   bWzakSj2srhSd/UO+LFawEZFjoMnHcoHjHxN40tdd/i/YlXgKR7XKUTOG
   LtNFhtnDigkqhy+Lr3yBTWFrL00oC2E5hV3Cfgm0p7TAP31HOCTxn7aGm
   mkbW02IewT88sW5Yj+eQDcZj/8cQZyDyDiB+NKNHSQET9gWOc7HcQ5W3r
   Q==;
X-CSE-ConnectionGUID: IDBI7fDiQ+a/wIKVAV8kog==
X-CSE-MsgGUID: mGkxXXJFSdiAvbR/ZvD9oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77438372"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="77438372"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 18:51:23 -0700
X-CSE-ConnectionGUID: DmncUjkbQUOWtcKDbYajdA==
X-CSE-MsgGUID: QruQuPmqSniUzuiXI2ri4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="231461904"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Apr 2026 18:51:21 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEdnD-0000000021E-0QeK;
	Mon, 20 Apr 2026 01:51:19 +0000
Date: Mon, 20 Apr 2026 09:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Subject: [linux-next:master 6676/9539]
 arch/riscv/kvm/vcpu_sbi_sta.c:59:13: sparse: sparse: cast to restricted
 __le32
Message-ID: <202604200645.53SsmPws-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
commit: bdce162f2e57a969803e5e9375999a3e0546905f [6676/9539] riscv: Use 64-bit variable for output in __get_user_asm
config: riscv-randconfig-r132-20260420 (https://download.01.org/0day-ci/archive/20260420/202604200645.53SsmPws-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604200645.53SsmPws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604200645.53SsmPws-lkp@intel.com/

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
