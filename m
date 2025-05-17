Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B24B153BED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 05:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747460655; cv=none; b=cUeBLeKHE2wjHfqD790T9bsyf2Lh278eKeME68lJt5Z8dwVaIR/kzOMOwCVIXq0SqTKtL9upwvw2+XbyjmTcArk7MUxod3fIyda0XXU9gLJugqM7l/QFJ8MSLUSw3dE3/LzVxmNp/grAx+0wSQEExQCNEumtPu5gt8uUHwXnrHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747460655; c=relaxed/simple;
	bh=pGxhvEUvx5Ekw/Fb+247qkTpBhePDxjvF+6OS8SkNWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=orJaIzyST75Uz8StOdi+aTlpz/CDlMYZbTvotFDBxrpJ4lHZk6qZEQU9tB/TtiKeLnPR4O6gt9Id+sCWfhj6LImqP8tD2WIP81MCBFio2uT3TIw6Yi1I2T1tlt41+V2QsNAEwCo5KpVQouNbcN85M9jOBy43xn5Ynab9dtCcsgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blNBL9ef; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blNBL9ef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747460653; x=1778996653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pGxhvEUvx5Ekw/Fb+247qkTpBhePDxjvF+6OS8SkNWQ=;
  b=blNBL9efateZRjKzU1WCTDZRyDhzB67XVxbT0tbV/IaDTEEdu++eOl2F
   JxeVc//qOYc1Oo+wej06uffp2+P2GYds9eDD7j+u/k2xgn5MX4od7xarR
   V1x6p+taj/qJVVrj4Tveq9g+zdoBV8jhLtX4G0MzsNqJjHlfUjLfrDPq0
   CoqyijTn/d46RmKPAzSbU6tDintc9R5OyKAHXixtjzKOhL51UtxruLAoX
   fjWrTB5qolQ3A8VP42X0a9fuoNr6ybxC4NkPA2j4muBvXSdD+MvkX9l2p
   Bkhrz9XECbKj6XiyWxL34JsgVVZKQ4wNSL5D91nbxYcl6+w7WS4bbW5NE
   A==;
X-CSE-ConnectionGUID: 5zr1D8w4TCObLflmYSQ3PA==
X-CSE-MsgGUID: 1RSD1qJMQgevTsFakqqByA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53235762"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="53235762"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 22:44:12 -0700
X-CSE-ConnectionGUID: nuKiGVxQRKSHddXMEmlrIg==
X-CSE-MsgGUID: ziMiOJhbS/qaWTN+TVEKKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="138720227"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa010.jf.intel.com with ESMTP; 16 May 2025 22:44:12 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGALA-0000V1-2y;
	Sat, 17 May 2025 05:44:08 +0000
Date: Sat, 17 May 2025 13:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 arch/arm64/kernel/proton-pack.c:1117:13: warning: no previous prototype for
 'spectre_bhb_patch_clearbhb'
Message-ID: <202505171357.XbOJTbrD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0caacc39200ed39c9449b0b8da1ffc26e2402876
commit: 8979720ac64c70af1395ce78e5c6ffb546b43e0d [1/1] arm64: Use the clearbhb instruction in mitigations
config: arm64-randconfig-2003-20250514 (https://download.01.org/0day-ci/archive/20250517/202505171357.XbOJTbrD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171357.XbOJTbrD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171357.XbOJTbrD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/proton-pack.c:564:13: warning: no previous prototype for 'spectre_v4_patch_fw_mitigation_enable' [-Wmissing-prototypes]
    void __init spectre_v4_patch_fw_mitigation_enable(struct alt_instr *alt,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:584:13: warning: no previous prototype for 'smccc_patch_fw_mitigation_conduit' [-Wmissing-prototypes]
    void __init smccc_patch_fw_mitigation_conduit(struct alt_instr *alt,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:1048:14: warning: no previous prototype for 'spectre_bhb_patch_loop_mitigation_enable' [-Wmissing-prototypes]
    void noinstr spectre_bhb_patch_loop_mitigation_enable(struct alt_instr *alt,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:1059:14: warning: no previous prototype for 'spectre_bhb_patch_fw_mitigation_enabled' [-Wmissing-prototypes]
    void noinstr spectre_bhb_patch_fw_mitigation_enabled(struct alt_instr *alt,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:1070:14: warning: no previous prototype for 'spectre_bhb_patch_loop_iter' [-Wmissing-prototypes]
    void noinstr spectre_bhb_patch_loop_iter(struct alt_instr *alt,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:1091:14: warning: no previous prototype for 'spectre_bhb_patch_wa3' [-Wmissing-prototypes]
    void noinstr spectre_bhb_patch_wa3(struct alt_instr *alt,
                 ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/proton-pack.c:1117:13: warning: no previous prototype for 'spectre_bhb_patch_clearbhb' [-Wmissing-prototypes]
    void __init spectre_bhb_patch_clearbhb(struct alt_instr *alt,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/spectre_bhb_patch_clearbhb +1117 arch/arm64/kernel/proton-pack.c

  1057	
  1058	/* Patched to NOP when enabled */
> 1059	void noinstr spectre_bhb_patch_fw_mitigation_enabled(struct alt_instr *alt,
  1060							   __le32 *origptr,
  1061							   __le32 *updptr, int nr_inst)
  1062	{
  1063		BUG_ON(nr_inst != 1);
  1064	
  1065		if (test_bit(BHB_FW, &system_bhb_mitigations))
  1066			*updptr++ = cpu_to_le32(aarch64_insn_gen_nop());
  1067	}
  1068	
  1069	/* Patched to correct the immediate */
  1070	void noinstr spectre_bhb_patch_loop_iter(struct alt_instr *alt,
  1071					   __le32 *origptr, __le32 *updptr, int nr_inst)
  1072	{
  1073		u8 rd;
  1074		u32 insn;
  1075		u16 loop_count = spectre_bhb_loop_affected(SCOPE_SYSTEM);
  1076	
  1077		BUG_ON(nr_inst != 1); /* MOV -> MOV */
  1078	
  1079		if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY))
  1080			return;
  1081	
  1082		insn = le32_to_cpu(*origptr);
  1083		rd = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, insn);
  1084		insn = aarch64_insn_gen_movewide(rd, loop_count, 0,
  1085						 AARCH64_INSN_VARIANT_64BIT,
  1086						 AARCH64_INSN_MOVEWIDE_ZERO);
  1087		*updptr++ = cpu_to_le32(insn);
  1088	}
  1089	
  1090	/* Patched to mov WA3 when supported */
  1091	void noinstr spectre_bhb_patch_wa3(struct alt_instr *alt,
  1092					   __le32 *origptr, __le32 *updptr, int nr_inst)
  1093	{
  1094		u8 rd;
  1095		u32 insn;
  1096	
  1097		BUG_ON(nr_inst != 1); /* MOV -> MOV */
  1098	
  1099		if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY) ||
  1100		    !test_bit(BHB_FW, &system_bhb_mitigations))
  1101			return;
  1102	
  1103		insn = le32_to_cpu(*origptr);
  1104		rd = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, insn);
  1105	
  1106		insn = aarch64_insn_gen_logical_immediate(AARCH64_INSN_LOGIC_ORR,
  1107							  AARCH64_INSN_VARIANT_32BIT,
  1108							  AARCH64_INSN_REG_ZR, rd,
  1109							  ARM_SMCCC_ARCH_WORKAROUND_3);
  1110		if (WARN_ON_ONCE(insn == AARCH64_BREAK_FAULT))
  1111			return;
  1112	
  1113		*updptr++ = cpu_to_le32(insn);
  1114	}
  1115	
  1116	/* Patched to NOP when not supported */
> 1117	void __init spectre_bhb_patch_clearbhb(struct alt_instr *alt,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
