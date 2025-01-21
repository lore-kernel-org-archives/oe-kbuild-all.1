Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6D6A41
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 00:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737418444; cv=none; b=dZPRvXhKamnLFSTVwfOpJsTj1N3Tzj1UvNMXDsl+PdyIEgSS0NRyKjVrrJZtZY8basPTnwDmzNXFvq9c/qblvjPVPkJURLs5LpHhpI3uN4DKcd4zKvZYcqWSHtXwAyBrFuaV/BO/UPyCZZnL56ALFeYabiR5cTdcZZLn+wNqw+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737418444; c=relaxed/simple;
	bh=0mvZ1rhAo68EjqhsulX18F3JDYfU797LIV+hb57EkKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PKeC56jng13qseOgAzb8OiwlEbEMGzLg0/GzEwu0+7hauCo1R+DfQ3kF7DOpV/M3gctlLP6+QF7BDA6he1dSwkDcqT5LglBKgMsLvOQxYzqG7zVYAZwI688IMJA5Up1iur06wZymxD2Q4P+BleSyEpKxgY8Ha7uE4I3Z5o5LbOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nosEOgVE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nosEOgVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737418442; x=1768954442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0mvZ1rhAo68EjqhsulX18F3JDYfU797LIV+hb57EkKc=;
  b=nosEOgVEpepWy6hCLqjtpzDmFGXpRHr12Hl6NEG4LueRdVlMdtAGLX3C
   gpInDRKT1j9DxdOUya0qovd/FHujNAblcHf2pLmzHO105bzUtlXajAjVG
   ysJvvIWeuFWw5j+xUVOYKeZqgIktREJ2JrHL1uA/zcx8t2pWJYa57Z1BV
   bc3pr4NCwKQjLWE0s13aMzPEiPhnu1Qmq27h6v5e9xxJ7oLgZUIsCcpiS
   sDZcp70UWN3aqysPMJn6XiuZf07QDhxoAH1kuorX/M56s6Z+DFDDIX829
   6Va5QIcez0cJqarsR3L5pH52j8aVvo1eG5C94Euky+ekoQf/DbFs/iMai
   w==;
X-CSE-ConnectionGUID: 8LVjFZxWTMOsLK+3Q8x5nw==
X-CSE-MsgGUID: D6a6DVCNQPyPWy8/PTacAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37981085"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="37981085"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 16:14:01 -0800
X-CSE-ConnectionGUID: 5uhueufjQZu2OxjxhlUDVA==
X-CSE-MsgGUID: VSr60aYlQm+hypml1u4Sdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="111631283"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jan 2025 16:14:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta1u2-000XOA-1E;
	Tue, 21 Jan 2025 00:13:58 +0000
Date: Tue, 21 Jan 2025 08:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/kvm/fixes-redo 1/8]
 arch/arm64/kvm/hyp/include/hyp/switch.h:184:21: warning: unused variable
 'kvm'
Message-ID: <202501210801.BKyLSKdq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/kvm/fixes-redo
head:   fc4f18e4b2156554c5481f7dc576c4dce0a7ed78
commit: a72566ddb55d7da9af1c68e0fa38b99f10329877 [1/8] WIP: KVM: arm64: unconditionally configure fine-grain traps
config: arm64-randconfig-001-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210801.BKyLSKdq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210801.BKyLSKdq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210801.BKyLSKdq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__deactivate_traps_hfgxtr':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:184:21: warning: unused variable 'kvm' [-Wunused-variable]
     184 |         struct kvm *kvm = kern_hyp_va(vcpu->kvm);
         |                     ^~~


vim +/kvm +184 arch/arm64/kvm/hyp/include/hyp/switch.h

ce4a36225753a1 Oliver Upton 2023-06-09  174  
f5a5a406b4b8bb Marc Zyngier 2024-02-14  175  #define __deactivate_fgt(htcxt, vcpu, kvm, reg)				\
f5a5a406b4b8bb Marc Zyngier 2024-02-14  176  	do {								\
f5a5a406b4b8bb Marc Zyngier 2024-02-14  177  		write_sysreg_s(ctxt_sys_reg(hctxt, reg),		\
f5a5a406b4b8bb Marc Zyngier 2024-02-14  178  			       SYS_ ## reg);				\
f5a5a406b4b8bb Marc Zyngier 2024-02-14  179  	} while(0)
f5a5a406b4b8bb Marc Zyngier 2024-02-14  180  
e930694e6145eb Marc Zyngier 2023-08-15  181  static inline void __deactivate_traps_hfgxtr(struct kvm_vcpu *vcpu)
ce4a36225753a1 Oliver Upton 2023-06-09  182  {
87f842c6c6543c Marc Zyngier 2024-03-01  183  	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
f5a5a406b4b8bb Marc Zyngier 2024-02-14 @184  	struct kvm *kvm = kern_hyp_va(vcpu->kvm);
ce4a36225753a1 Oliver Upton 2023-06-09  185  
e930694e6145eb Marc Zyngier 2023-08-15  186  	if (!cpus_have_final_cap(ARM64_HAS_FGT))
e930694e6145eb Marc Zyngier 2023-08-15  187  		return;
ce4a36225753a1 Oliver Upton 2023-06-09  188  
d196c20c6e5868 Marc Zyngier 2024-02-14  189  	__deactivate_fgt(hctxt, vcpu, kvm, HFGRTR_EL2);
d196c20c6e5868 Marc Zyngier 2024-02-14  190  	if (cpus_have_final_cap(ARM64_WORKAROUND_AMPERE_AC03_CPU_38))
e930694e6145eb Marc Zyngier 2023-08-15  191  		write_sysreg_s(ctxt_sys_reg(hctxt, HFGWTR_EL2), SYS_HFGWTR_EL2);
d196c20c6e5868 Marc Zyngier 2024-02-14  192  	else
d196c20c6e5868 Marc Zyngier 2024-02-14  193  		__deactivate_fgt(hctxt, vcpu, kvm, HFGWTR_EL2);
f5a5a406b4b8bb Marc Zyngier 2024-02-14  194  	__deactivate_fgt(hctxt, vcpu, kvm, HFGITR_EL2);
f5a5a406b4b8bb Marc Zyngier 2024-02-14  195  	__deactivate_fgt(hctxt, vcpu, kvm, HDFGRTR_EL2);
f5a5a406b4b8bb Marc Zyngier 2024-02-14  196  	__deactivate_fgt(hctxt, vcpu, kvm, HDFGWTR_EL2);
676f482354886c Fuad Tabba   2023-12-14  197  
0ccd901da1886c Fuad Tabba   2023-12-14  198  	if (cpu_has_amu())
f5a5a406b4b8bb Marc Zyngier 2024-02-14  199  		__deactivate_fgt(hctxt, vcpu, kvm, HAFGRTR_EL2);
ce4a36225753a1 Oliver Upton 2023-06-09  200  }
ce4a36225753a1 Oliver Upton 2023-06-09  201  

:::::: The code at line 184 was first introduced by commit
:::::: f5a5a406b4b8bb6c1fc7a1e92a872bd86061a53f KVM: arm64: Propagate and handle Fine-Grained UNDEF bits

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Oliver Upton <oliver.upton@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
