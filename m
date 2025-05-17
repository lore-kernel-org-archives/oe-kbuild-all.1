Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3574214EC5B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 03:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747451706; cv=none; b=nLqYk/PlIaCaT170zowM550HlkAnBLtSnOCdlHdSCoVHRdVDSwj/nl3skrEcYWnOPkHyVuT14k0v4fYGi3PQgy5XV331sRpH17FSfaaBxaKzhCB2CfV3H+Xu32rPxv40+Bw/3kpq8Y9dJP1sf4g/pWPd1tdt9xdVGq/kPf4tJtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747451706; c=relaxed/simple;
	bh=cNrzCual/6TxWf71XUoCV70SG694TLwQlCbI7ZAwJz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nktaWFLzcqb0VQuGVTMAR+HTR8DoNxjApfI96k0FQtOTo/CbwOE4A0CJrfMq1n1xfqeYeiRTNebxdUxbGt5iaKl7iH7qg/eCEE0qi5y+DvPCYLuTAy6qs0+TFB9AATLIVb5hTjARnYXjETBfGI1v4mlH9RWuy0z/5nUpkvmIY9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0mCMpwA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0mCMpwA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747451704; x=1778987704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cNrzCual/6TxWf71XUoCV70SG694TLwQlCbI7ZAwJz4=;
  b=R0mCMpwAetqeIYPxC/i673Alpagu2Ry4cvNnGEKawgqmMPOQxfNJ9uzi
   1sT7HriMjLsVbYrHI5dNF0VMNWvHdiMMb+LC3pZ5atoAk3qK02mcCDGVn
   8+zkcWKifsPLBzpvkLH2QNTW6WWCYgbLKsXIiZEBSBsnwKYXiHz9nrAHV
   dS38gu3Aqww0idr03+CdFa6kuY7dIA1DDOOWTBtzBnhQ5nhxzMVZVL4zg
   jika2zP3W7Na0fGjfUrb8ivMOp1GLPaDQmyGn6xfOjgPEAANX/JNMiQlg
   OccZEUHkglsprSoyEOYLqFq+DRT2SrWZrp7UAX50k/MXiBfBsAyqZU76B
   A==;
X-CSE-ConnectionGUID: J088NzyrSwa67He0YvX7Eg==
X-CSE-MsgGUID: nY8ekzTzTIKqpDn1KOwGEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60459020"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="60459020"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 20:15:03 -0700
X-CSE-ConnectionGUID: X1vHAgk/QB6EpFbZC9BAKw==
X-CSE-MsgGUID: vQVF7XzJTzq5hxBksT3GCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="139349938"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 May 2025 20:15:02 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG80q-0000UN-1d;
	Sat, 17 May 2025 03:15:00 +0000
Date: Sat, 17 May 2025 11:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 arch/arm64/kernel/proton-pack.c:1054:14: warning: no previous prototype for
 'spectre_bhb_patch_loop_iter'
Message-ID: <202505171151.iNo8QKML-lkp@intel.com>
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
commit: 4bbfd0c280254b273c564767021bb9b0f945148e [1/1] arm64: Mitigate spectre style branch history side channels
config: arm64-randconfig-2003-20250514 (https://download.01.org/0day-ci/archive/20250517/202505171151.iNo8QKML-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171151.iNo8QKML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171151.iNo8QKML-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/proton-pack.c:564:13: warning: no previous prototype for 'spectre_v4_patch_fw_mitigation_enable' [-Wmissing-prototypes]
    void __init spectre_v4_patch_fw_mitigation_enable(struct alt_instr *alt,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:584:13: warning: no previous prototype for 'smccc_patch_fw_mitigation_conduit' [-Wmissing-prototypes]
    void __init smccc_patch_fw_mitigation_conduit(struct alt_instr *alt,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:1032:14: warning: no previous prototype for 'spectre_bhb_patch_loop_mitigation_enable' [-Wmissing-prototypes]
    void noinstr spectre_bhb_patch_loop_mitigation_enable(struct alt_instr *alt,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:1043:14: warning: no previous prototype for 'spectre_bhb_patch_fw_mitigation_enabled' [-Wmissing-prototypes]
    void noinstr spectre_bhb_patch_fw_mitigation_enabled(struct alt_instr *alt,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/proton-pack.c:1054:14: warning: no previous prototype for 'spectre_bhb_patch_loop_iter' [-Wmissing-prototypes]
    void noinstr spectre_bhb_patch_loop_iter(struct alt_instr *alt,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/proton-pack.c:1075:14: warning: no previous prototype for 'spectre_bhb_patch_wa3' [-Wmissing-prototypes]
    void noinstr spectre_bhb_patch_wa3(struct alt_instr *alt,
                 ^~~~~~~~~~~~~~~~~~~~~


vim +/spectre_bhb_patch_loop_iter +1054 arch/arm64/kernel/proton-pack.c

  1030	
  1031	/* Patched to NOP when enabled */
> 1032	void noinstr spectre_bhb_patch_loop_mitigation_enable(struct alt_instr *alt,
  1033							     __le32 *origptr,
  1034							      __le32 *updptr, int nr_inst)
  1035	{
  1036		BUG_ON(nr_inst != 1);
  1037	
  1038		if (test_bit(BHB_LOOP, &system_bhb_mitigations))
  1039			*updptr++ = cpu_to_le32(aarch64_insn_gen_nop());
  1040	}
  1041	
  1042	/* Patched to NOP when enabled */
  1043	void noinstr spectre_bhb_patch_fw_mitigation_enabled(struct alt_instr *alt,
  1044							   __le32 *origptr,
  1045							   __le32 *updptr, int nr_inst)
  1046	{
  1047		BUG_ON(nr_inst != 1);
  1048	
  1049		if (test_bit(BHB_FW, &system_bhb_mitigations))
  1050			*updptr++ = cpu_to_le32(aarch64_insn_gen_nop());
  1051	}
  1052	
  1053	/* Patched to correct the immediate */
> 1054	void noinstr spectre_bhb_patch_loop_iter(struct alt_instr *alt,
  1055					   __le32 *origptr, __le32 *updptr, int nr_inst)
  1056	{
  1057		u8 rd;
  1058		u32 insn;
  1059		u16 loop_count = spectre_bhb_loop_affected(SCOPE_SYSTEM);
  1060	
  1061		BUG_ON(nr_inst != 1); /* MOV -> MOV */
  1062	
  1063		if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY))
  1064			return;
  1065	
  1066		insn = le32_to_cpu(*origptr);
  1067		rd = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, insn);
  1068		insn = aarch64_insn_gen_movewide(rd, loop_count, 0,
  1069						 AARCH64_INSN_VARIANT_64BIT,
  1070						 AARCH64_INSN_MOVEWIDE_ZERO);
  1071		*updptr++ = cpu_to_le32(insn);
  1072	}
  1073	
  1074	/* Patched to mov WA3 when supported */
> 1075	void noinstr spectre_bhb_patch_wa3(struct alt_instr *alt,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
