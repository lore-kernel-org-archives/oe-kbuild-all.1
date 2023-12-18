Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C621768F2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 23:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NL+Onn1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702942660; x=1734478660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vUcio69mcWcyqQLnljxHv+8+k4ANLZjSB2cj2V6L14w=;
  b=NL+Onn1sd77ZLlB2YJdZhaQ5156CUsR5URCQyqYLD+9TPEYtYjoLvoFl
   dlLRgNVr+8dXhUC8dzqOxJgoNEk4sz/S8CV42tHUPcPz5uDUYVoFCtNbA
   JtvisI/y6jLULYlLsTltTjQTkvQ6uQUoJwRjJjenD4oh4kKETbom9OO0E
   +9YxCSIwytHUHDb8LpvvDuSbo0XwhHa0By8CtaiLB7WK+7YG7z2KQTwxR
   TKj7c2OssEIgUrU/Ojd80j+aijMMRgfxtujMumpptGBT9ZP1YyKa9Ttn9
   gvmQZWCf5ewvtSLIc1YAaxLkLsOoU4lcggUqNaEcKJSJJkQjE7ZVvesm/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="14268608"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="14268608"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 15:37:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="725519149"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="725519149"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 18 Dec 2023 15:37:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFNAz-0004db-35;
	Mon, 18 Dec 2023 23:37:33 +0000
Date: Tue, 19 Dec 2023 07:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: arch/riscv/kvm/vcpu_onereg.c:486 kvm_riscv_vcpu_set_reg_csr() warn:
 inconsistent indenting
Message-ID: <202312190719.kBuYl6oJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf4f94d8e8646803f8fb0facf134b0cd7fb691a
commit: c04913f2b54ee86be34d1a1e9df7b7876b12b8c0 RISCV: KVM: Add sstateen0 to ONE_REG
date:   10 weeks ago
config: riscv-randconfig-r071-20231218 (https://download.01.org/0day-ci/archive/20231219/202312190719.kBuYl6oJ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190719.kBuYl6oJ-lkp@intel.com/

smatch warnings:
arch/riscv/kvm/vcpu_onereg.c:486 kvm_riscv_vcpu_set_reg_csr() warn: inconsistent indenting

vim +486 arch/riscv/kvm/vcpu_onereg.c

   454	
   455	static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
   456					      const struct kvm_one_reg *reg)
   457	{
   458		int rc;
   459		unsigned long __user *uaddr =
   460				(unsigned long __user *)(unsigned long)reg->addr;
   461		unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
   462						    KVM_REG_SIZE_MASK |
   463						    KVM_REG_RISCV_CSR);
   464		unsigned long reg_val, reg_subtype;
   465	
   466		if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
   467			return -EINVAL;
   468	
   469		if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
   470			return -EFAULT;
   471	
   472		reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
   473		reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
   474		switch (reg_subtype) {
   475		case KVM_REG_RISCV_CSR_GENERAL:
   476			rc = kvm_riscv_vcpu_general_set_csr(vcpu, reg_num, reg_val);
   477			break;
   478		case KVM_REG_RISCV_CSR_AIA:
   479			rc = kvm_riscv_vcpu_aia_set_csr(vcpu, reg_num, reg_val);
   480			break;
   481		case KVM_REG_RISCV_CSR_SMSTATEEN:
   482			rc = -EINVAL;
   483			if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
   484				rc = kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num,
   485								      reg_val);
 > 486	break;
   487		default:
   488			rc = -ENOENT;
   489			break;
   490		}
   491		if (rc)
   492			return rc;
   493	
   494		return 0;
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
