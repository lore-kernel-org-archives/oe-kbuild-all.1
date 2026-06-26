Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1E437AA83
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782487523; cv=none; b=Z3miQw1Yf/RhnGvnZetAegFFR/2UIJIuOdPlIsjDxNp1kRtqykTbub+Sere65QBcL4/Ixlrkaq1Yz6fxCxdy2NUNSfAD05CeXrV540zMWpqh44Mz04i2GVARwCns8QUERLjYEaEOAW5xLeI/780aa5ebu4oCoK59UAm24cb28fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782487523; c=relaxed/simple;
	bh=Ti9UzmjEyRaOtkjWsWkuyEaIq1AmWuqZ6qX/odKpPI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=b6ETUztvdptmvO0ZJIEPlKwjBuiTkCN0DvcM5tNn8cH3ZdxSMqG/udCLD7b4Xq6pbxFzPIbcEyhjfKFMB21GEzDxQRtSjZjSk6FSc5NFJVJAOLtn0zOmFc2YbxeX3BBaTTMh908tRQWpWknjI9p72MVwtyh2big6d7ZngjRZGVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqZ1K2jf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqZ1K2jf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782487520; x=1814023520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ti9UzmjEyRaOtkjWsWkuyEaIq1AmWuqZ6qX/odKpPI4=;
  b=gqZ1K2jfTtWd0ZxzJtPEvw5W7zXVpzDL4gb/TQ7dLxYlQurUEW5C8TYg
   rtwaTAr1Jx3tYP7NvW1xXobcs6CGjIvTXrmgOaXFQFTHX9H/silslO4nT
   QL54HvmAcQQWJso3lo5uYXiQYTtZsK8ZNXgV6xZwkEjwgdUiLVOdTHLxL
   UfZCZQE+r1onf5WqvRnAkeZTLTsFrNgLbNlPsqOmkQp04nlHG3vnxzTYH
   6oAwVHbTdrFcs5rFLj68cJzEZehmzpiSvcpEwuViS1mD0mIPeDX73+bnf
   +GlyorIXJdx/x6swx+iJxHulhPSV0j6/wHb6aocG0PD+RfgdHoiBLD7uW
   g==;
X-CSE-ConnectionGUID: uoef4MpaRDiirPwO53FONg==
X-CSE-MsgGUID: sP86i4u0QMeYQ7qyzx/yBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="94428710"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="94428710"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 08:25:20 -0700
X-CSE-ConnectionGUID: 1A9Qt4gVSMWmcULHATopdw==
X-CSE-MsgGUID: zfeQ59ZzR2qwwngHiLvGDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="275593412"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jun 2026 08:25:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wd8Qa-000000005Bp-22VN;
	Fri, 26 Jun 2026 15:25:13 +0000
Date: Fri, 26 Jun 2026 23:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 15/125]
 arch/arm/kernel/head.S:122: Error: selected processor does not support `cps
 #0x00000016' in ARM mode
Message-ID: <202606262347.oknBJlGV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   ede867810341ed402296e37b369698f7ad1aae9f
commit: 60ecf886273ac4bac4d73a2902bed89bb3e8843e [15/125] ARM: zte: HACK: Set up GICv3.
config: arm-randconfig-001-20260626 (https://download.01.org/0day-ci/archive/20260626/202606262347.oknBJlGV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606262347.oknBJlGV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606262347.oknBJlGV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/head.S: Assembler messages:
>> arch/arm/kernel/head.S:122: Error: selected processor does not support `cps #0x00000016' in ARM mode
   arch/arm/kernel/head.S:156: Error: selected processor does not support `cps #0x00000013' in ARM mode
   arch/arm/kernel/head.S:129: Error: invalid constant (131) after fixup


vim +122 arch/arm/kernel/head.S

   105	
   106		@ FIXME: This needs to go into the bootloader, it has no business being here.
   107		@ zx297520v3 has essentially an ARMv8 CPU with a GICv3 and secure mode support, but there's
   108		@ no ARM TrustZone firmware. So we have to set up the CPU and GIC according to arm64 boot
   109		@ requirements specified in Documentation/arch/arm64/booting.rst.
   110		@ Leave r0, r1 and r2 alone to preserve the DTB pointer.
   111	
   112		@ This allows EL1 to handle ints hat are normally handled by EL2/3.
   113		@ Detect sane bootloaders and skip the hack
   114		ldr	r3, =0xf2000000
   115		ldr	r3, [r3]
   116		ldr	r4, =(GICD_CTLR_ARE_NS | GICD_CTLR_DS)
   117		cmp	r3, r4
   118		beq	skip_zx_hack
   119		ldr	r3, =0xf2000000
   120		str	r4, [r3]
   121	
 > 122		cps	#MON_MODE
   123	
   124		@ Work in non-secure physical addres space: SCR_EL3.NS = 1. At least the UART seems to
   125		@ respond only to non-secure addresses. I have taken insipiration from Raspberry pi's
   126		@ armstub7.S here.
   127		@
   128		@ ARM docs say modify this bit in monitor mode only...
   129		mov	r3, #0x131			@ non-secure
   130		mcr	p15, 0, r3, c1, c1, 0
   131	
   132		@ AP_PPI_MODE_REG: Configure timer PPIs (10, 11, 13, 14) to active-low.
   133		ldr	r3, =0xF22020a8
   134		ldr	r4, =0x50
   135		str	r4, [r3]
   136		ldr	r3, =0xF22020ac
   137		ldr	r4, =0x14
   138		str	r4, [r3]
   139	
   140		@ Enable EL access to ICC_SRE (bit 3, ICC_SRE_EL3.Enable). Enable system reg access to
   141		@ GICv3 registers (bit 0, ICC_SRE_EL3.SRE).
   142		mrc	p15, 6, r3, c12, c12, 5		@ ICC_SRE_EL3
   143		orr	r3, #0x9			@ FIXME: No defines for SRE_EL3 values?
   144		mcr	p15, 6, r3, c12, c12, 5
   145		mrc	p15, 0, r3, c12, c12, 5		@ ICC_SRE_EL1
   146		orr	r3, #(ICC_SRE_EL1_SRE)
   147		mcr	p15, 0, r3, c12, c12, 5
   148	
   149		@ Like ICC_SRE_EL3, enable non-secure access and allow register based access.
   150		mrc	p15, 4, r3, c12, c9, 5		@ ICC_SRE_EL2 aka ICC_HSRE
   151		orr	r3, r3, #(ICC_SRE_EL2_ENABLE | ICC_SRE_EL2_SRE)
   152		mcr	p15, 4, r3, c12, c9, 5
   153		isb
   154	
   155		@ Back to SVC mode. TODO: Doesn't safe_svcmode_maskall do this for us anyway?
   156		cps	#SVC_MODE
   157	skip_zx_hack:
   158	
   159		@ ensure svc mode and all interrupts masked
   160		safe_svcmode_maskall r9
   161	
   162		mrc	p15, 0, r9, c0, c0		@ get processor id
   163		bl	__lookup_processor_type		@ r5=procinfo r9=cpuid
   164		movs	r10, r5				@ invalid processor (r5=0)?
   165	 THUMB( it	eq )		@ force fixup-able long branch encoding
   166		beq	__error_p			@ yes, error 'p'
   167	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
