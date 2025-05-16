Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F105224225
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 22:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747434529; cv=none; b=GwKZXmPBmozUHlbLLRTY3bGM4KYPa8ilTVYT4xADmtFHptVB0+4wxD3PRXc+hAP81Q7AQ2kIjjEizN2W64kDafvnP8ow207FZAjQEs1l1geuYAZwW6Mnz0WX0fuVWPk8eqgCf7XkWaJe+j9APzZzilliX1XdxLnl0ewuvfbkuxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747434529; c=relaxed/simple;
	bh=3OGK2M2e/CnOBaBwYrE6Oh1NJadFNgv+3hzb258oVWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KOjVJx/7l9oewbUqV/aMWW318Z81uQ1ozZ84bDmh4y4EHSIrgP1HfMv2TzC3/hYkWwSU2VMNm5/zUUuFZ1JSnK6uDLjJpiD/VvMDr9OSF+mOHFLIb2897M2qWN/7GW1LzNH7OOTDj/gVXZkxi1P5dCYKkkE1g5caE2+iwhhiIv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmlOaG+T; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmlOaG+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747434528; x=1778970528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OGK2M2e/CnOBaBwYrE6Oh1NJadFNgv+3hzb258oVWU=;
  b=EmlOaG+TI3efy7dVGQpcPA1tI+GBKY6i4xH5gglNll95h9VewPqRRlWJ
   8Uj8JfzFZe33PEaU24siTWdVRKElcQz8MC3hbRGQKoko1vXOUjJbTI7Vz
   LejNcs8XmNQD4iBu34Z1PTANzdA++ZHZcdw4/TajqgvhH4uaOvVQXR0c/
   PN9DUrsEgoN8Z1koLZ0xdaWibUpWCcNYAeNPqFcbL+a83xc4E2iY8G6Yu
   ckx2p1YCrJz4a8STNIJA7d5TPPEGILMvkoBq0uVHSB0yK8PBCNJs4J6VV
   JMWDuLZMXRpqX7Dfcbe3pkhY9a9ELzDR3xgjONkRwNhBuNYbyWCCvTsQD
   w==;
X-CSE-ConnectionGUID: oU7vM0wwSCy7atTDIz7YEQ==
X-CSE-MsgGUID: tLtH4ZoOS/6XvA+eyv8xMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53220438"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="53220438"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 15:28:47 -0700
X-CSE-ConnectionGUID: J3TuAMAtQzKJJ5O8Ou1OWg==
X-CSE-MsgGUID: e5aqITxfQIm546XdW5/n1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="143936437"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa005.jf.intel.com with ESMTP; 16 May 2025 15:28:46 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG3Xn-0000Sl-2R;
	Fri, 16 May 2025 22:28:43 +0000
Date: Sat, 17 May 2025 06:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 arch/arm64/kernel/proton-pack.c:557:13: warning: no previous prototype for
 'smccc_patch_fw_mitigation_conduit'
Message-ID: <202505170615.h7uHPWFS-lkp@intel.com>
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
commit: 44adac5908ff712e0fee34e3472f884c17af8025 [1/1] arm64: spectre: Rename spectre_v4_patch_fw_mitigation_conduit
config: arm64-randconfig-2003-20250514 (https://download.01.org/0day-ci/archive/20250517/202505170615.h7uHPWFS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170615.h7uHPWFS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170615.h7uHPWFS-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

   arch/arm64/kernel/proton-pack.c:537:13: warning: no previous prototype for 'spectre_v4_patch_fw_mitigation_enable' [-Wmissing-prototypes]
    void __init spectre_v4_patch_fw_mitigation_enable(struct alt_instr *alt,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/proton-pack.c:557:13: warning: no previous prototype for 'smccc_patch_fw_mitigation_conduit' [-Wmissing-prototypes]
    void __init smccc_patch_fw_mitigation_conduit(struct alt_instr *alt,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/smccc_patch_fw_mitigation_conduit +557 arch/arm64/kernel/proton-pack.c

   532	
   533	/*
   534	 * Patch a branch over the Spectre-v4 mitigation code with a NOP so that
   535	 * we fallthrough and check whether firmware needs to be called on this CPU.
   536	 */
 > 537	void __init spectre_v4_patch_fw_mitigation_enable(struct alt_instr *alt,
   538							  __le32 *origptr,
   539							  __le32 *updptr, int nr_inst)
   540	{
   541		BUG_ON(nr_inst != 1); /* Branch -> NOP */
   542	
   543		if (spectre_v4_mitigations_off())
   544			return;
   545	
   546		if (cpus_have_final_cap(ARM64_SSBS))
   547			return;
   548	
   549		if (spectre_v4_mitigations_dynamic())
   550			*updptr = cpu_to_le32(aarch64_insn_gen_nop());
   551	}
   552	
   553	/*
   554	 * Patch a NOP in the Spectre-v4 mitigation code with an SMC/HVC instruction
   555	 * to call into firmware to adjust the mitigation state.
   556	 */
 > 557	void __init smccc_patch_fw_mitigation_conduit(struct alt_instr *alt,
   558						       __le32 *origptr,
   559						       __le32 *updptr, int nr_inst)
   560	{
   561		u32 insn;
   562	
   563		BUG_ON(nr_inst != 1); /* NOP -> HVC/SMC */
   564	
   565		switch (arm_smccc_1_1_get_conduit()) {
   566		case SMCCC_CONDUIT_HVC:
   567			insn = aarch64_insn_get_hvc_value();
   568			break;
   569		case SMCCC_CONDUIT_SMC:
   570			insn = aarch64_insn_get_smc_value();
   571			break;
   572		default:
   573			return;
   574		}
   575	
   576		*updptr = cpu_to_le32(insn);
   577	}
   578	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
