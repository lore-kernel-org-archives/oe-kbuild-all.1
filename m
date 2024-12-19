Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EFE21CA01
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734600113; cv=none; b=epkWSZ2eFw/zxgGmxjkTlIyQzJ5nCM/lNFrW96wZ8wjr/1Q/zDvOSvYd9nN11QEO7Mvk4wY8fNTitwY7MEfkRZtlFatWn1kwyKASXfT0iPSgy1xx4+Bcb6uw5G3WvOLdjmBCRR2jYzMt1omcDl2pwrE1AghEFkfIctSjpG0bhlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734600113; c=relaxed/simple;
	bh=ZqHv0dviY+RPLaIm2cACLwlkHWb2dR2PYbaeYH3epxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KdZxfhaXeY6YZhdpxI/Zh/7+WQa2WcLK/ZFTCR18vFOSsIkXYvWLPE91mQUx7uMB2BjKdqCG5azQEPgN+NG01ae/zrnejMFksIgE5W0aJyXPgWDwyUmiBm+aNEtGsizNfNwdgngTq4IAaJBm9qOkJk3iROG0eHECcCNcsCF/nAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0dHn4Vn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0dHn4Vn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734600112; x=1766136112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZqHv0dviY+RPLaIm2cACLwlkHWb2dR2PYbaeYH3epxA=;
  b=a0dHn4Vn8/5YrAGQAQP8uksDVB89KR3b+kN8ZopHvqxnhnUP0UcIcqn8
   3jvQAcixwGtV2OZ2tiawalVjNn8VZdt4v9GsuN1MufTZGHvV6qk4sxFEj
   B7oESVUFvpoJaChZaiRKTHNXExgfsPqICgaozpeuO9LZKQLGlPK1NdFZA
   xPNCmM5vqr2mFX/OLMOn0CLdpuLcgd9hLtVRKJb5rE6VqU6fJ4qSGFr2l
   Y/TJjPyq4oomB2vrbW1oBG8OmBynYPNZllc2s/mLKJshydbCJ6+z66gzh
   IDtj1KqE3nKbbxDYJPkBbG9SqiUHz+Xk71UF/cjHzAH5+PgsyuxGtOIv9
   Q==;
X-CSE-ConnectionGUID: 1Ypq5nvNS/GVGfvvkbGdEQ==
X-CSE-MsgGUID: bgPJ3Xy3Qaq5N1vhkGL5tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35131178"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="35131178"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 01:21:51 -0800
X-CSE-ConnectionGUID: e0vB4hIVSBWrJ1dj/xbWKA==
X-CSE-MsgGUID: 3QceukEyTEWx7T495aSp+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="98666490"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Dec 2024 01:21:50 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOCj5-00008Z-29;
	Thu, 19 Dec 2024 09:21:47 +0000
Date: Thu, 19 Dec 2024 17:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>
Subject: arch/riscv/kvm/vcpu_sbi_sta.c:59:13: sparse: sparse: restricted
 __le32 degrades to integer
Message-ID: <202412191745.vbAA5488-lkp@intel.com>
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
commit: f072b272aa27d57cf7fe6fdedb30fb50f391974e RISC-V: KVM: Use correct restricted types
date:   10 months ago
config: riscv-randconfig-r113-20241219 (https://download.01.org/0day-ci/archive/20241219/202412191745.vbAA5488-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241219/202412191745.vbAA5488-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412191745.vbAA5488-lkp@intel.com/

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
