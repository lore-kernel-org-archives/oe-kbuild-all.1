Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCAB1EEF9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 22:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755384499; cv=none; b=cdsm1VTempaKsbTl8USLmKbr+AM3oZDRGnzOYlYk82QZaplFhTNP/aE/Qs15dziT4Gtw0BqN3RzE0UvTu+Z1zSV0XITC3NYPJRVlDvWOW7V7ZRgqcMogyJnZY5dsn5i6iDvXcOP/jqQpOYwlrxsAlYMgUQ1SH7Tw2S4t1b6zlaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755384499; c=relaxed/simple;
	bh=5i5WTltE0LTaPow7EWW925OtjvCAV1jK3xX22g0MAno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cDnRKy8EnWYaO2NVamJmyqpHDvVuFMKsM5Ez8zT9F1zh0aQLxznaJlXsbgr7BMLZcX6+ff/9gw4o75FS5rOnKaRQojIwxwzp4s9wFRZ7Hob72H9+dA269IqawccFJoyfckU4Sjk5rxBvOyZ6EjQCHUhmPFOudU2ieXJlwaytTtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJCBdXyh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJCBdXyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755384497; x=1786920497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5i5WTltE0LTaPow7EWW925OtjvCAV1jK3xX22g0MAno=;
  b=UJCBdXyhj3IbXnyn4/zluTfroq3lY3R+otZ4n/JwQWu1Lv1Sq97oyUfe
   7EUWkvpdCfZL/Fab7e3ZtjYipZwJ4gVpoowg5j6YLdo4YBA7b3pS4ixUR
   KR8dp+7qpb739MU7al9iZiD+gFsnJ0/EcT29awP9Xth5SjfE9HvE0R7KU
   xAGalSKvoAw3Zxv+lebuYkGiSYZo2pBUW37s503Dq2NtiQXeV2zssZkfA
   WrRli7Uz20u+yk0OiVmb3GIO8hgjRCwRv+E4LRuA+gjGPIjIBLaMU7ELD
   BTP6+HWyeq5pyTGxIfQneT3Dbh9uomhmd6gCpir6EwkGdpkvnisaCacq3
   w==;
X-CSE-ConnectionGUID: qBndM1ARTra9Q4znnj36HQ==
X-CSE-MsgGUID: O565XWCCTGyw8YIzZNKDWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="45231113"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="45231113"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 15:48:15 -0700
X-CSE-ConnectionGUID: 48eyqC9VTnCAzjV9IidVNA==
X-CSE-MsgGUID: 5ZgYzjqTShWjJRuRQNqhkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166497670"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Aug 2025 15:48:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unPgs-000DEh-0T;
	Sat, 16 Aug 2025 22:48:03 +0000
Date: Sun, 17 Aug 2025 06:47:36 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_mpxy_mailbox_v10 6/35]
 arch/riscv/kvm/vcpu_sbi.c:510:2-3: Unneeded semicolon
Message-ID: <202508170600.IQl81MZe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_mpxy_mailbox_v10
head:   903cf9d73fcec79f309cb9c5da05aa0ded51c178
commit: a5f4688f447f8f3de0163efadae6525140e12e28 [6/35] RISC-V: KVM: Introduce optional ONE_REG callbacks for SBI extensions
config: riscv-randconfig-r052-20250817 (https://download.01.org/0day-ci/archive/20250817/202508170600.IQl81MZe-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508170600.IQl81MZe-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/vcpu_sbi.c:510:2-3: Unneeded semicolon
   arch/riscv/kvm/vcpu_sbi.c:464:2-3: Unneeded semicolon

vim +510 arch/riscv/kvm/vcpu_sbi.c

   478	
   479	int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
   480	{
   481		unsigned long __user *uaddr =
   482				(unsigned long __user *)(unsigned long)reg->addr;
   483		unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
   484						    KVM_REG_SIZE_MASK |
   485						    KVM_REG_RISCV_SBI_STATE);
   486		const struct kvm_vcpu_sbi_extension *ext;
   487		unsigned long reg_subtype;
   488		void *reg_val;
   489		u64 data64;
   490		u32 data32;
   491		u16 data16;
   492		u8 data8;
   493		int ret;
   494	
   495		switch (KVM_REG_SIZE(reg->id)) {
   496		case 1:
   497			reg_val = &data8;
   498			break;
   499		case 2:
   500			reg_val = &data16;
   501			break;
   502		case 4:
   503			reg_val = &data32;
   504			break;
   505		case 8:
   506			reg_val = &data64;
   507			break;
   508		default:
   509			return -EINVAL;
 > 510		};
   511	
   512		reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
   513		reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
   514	
   515		ext = kvm_vcpu_sbi_find_ext_withstate(vcpu, reg_subtype);
   516		if (!ext || !ext->get_state_reg)
   517			return -EINVAL;
   518	
   519		ret = ext->get_state_reg(vcpu, reg_num, KVM_REG_SIZE(reg->id), reg_val);
   520		if (ret)
   521			return ret;
   522	
   523		if (copy_to_user(uaddr, reg_val, KVM_REG_SIZE(reg->id)))
   524			return -EFAULT;
   525	
   526		return 0;
   527	}
   528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
