Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12B0125A0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 04:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772683285; cv=none; b=IE2VHGOuKqOpW2cTgv+fWv3mCdgDDRrFhl5NFif9K+bZYxvJcheRet4REfXEBAPTA7wh+QvskZwJ45UE3TtOTDVKlWalvbI5+39nUPzimaC33DdouEx9l8EdD8BvypaJJrxsDDOEBdqxxHozaeEUICM+7tk+lF9uwzgVW2PK9hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772683285; c=relaxed/simple;
	bh=Tyzb71CFFfLyugnRvfuEQHNWgYdiZyU+0uGCRgA9l/E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uP6OGzGN8UpdRpFnGASYZpMhl2Tuipu/d4VvJFogrTVRrGRQR3k2axtn8AS6odQc7QQ+W9WaqCY1fxlta8zlIj+nPCk1kunrm4n7Ujlsb7lILAP1WuV/iDQFg9T2dBG+hpcjf7HVpgAISW7itgIISzaH+5mycsgSvZKysOVylqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyWhtHy4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyWhtHy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772683284; x=1804219284;
  h=date:from:to:cc:subject:message-id;
  bh=Tyzb71CFFfLyugnRvfuEQHNWgYdiZyU+0uGCRgA9l/E=;
  b=XyWhtHy4vk3Cb0j/FApB+mIolhvz5gL//sCLSSCarv71+zv0gVvIWejY
   3uX+kDF14T3OZs13kIOoX1LWDsQFoT9q7hS6adKg95embdYaSxo1aSxJI
   89LLSl/0/OuFGzwtYN/NauIwebFCN7+TDypWcCzRyyyV6tAMC6QHyMTpH
   3+OI5STBLb9ciy8lsMFdM2m1YTdkk1pczgo/BiLntwHiZAMoNkTAoK5Nm
   F+54TfvRHhQH3oYMXFXzVdFIFD4gnZizV/B9ylUqI+cTqLA1rz/30WnhG
   Y3egidtF0eqa0Qw5SR7FHOZ6GfOCdq/C1xFronryD5KlY31NGx1NiteAv
   g==;
X-CSE-ConnectionGUID: bVXAQqkeQw6e7U9xF+a4Dw==
X-CSE-MsgGUID: JwjaUCBBRDWenZi4P9PwPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73631238"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73631238"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 20:01:23 -0800
X-CSE-ConnectionGUID: ms1UlvrAQY2n63PCjaO2bA==
X-CSE-MsgGUID: zEsCmtEIQyy3NgUrg1ADmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="241562133"
Received: from lkp-server02.sh.intel.com (HELO 456988d8841c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 20:01:21 -0800
Received: from kbuild by 456988d8841c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxztN-0000000002V-0yGf;
	Thu, 05 Mar 2026 04:00:58 +0000
Date: Thu, 05 Mar 2026 11:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.12.y 955/955]
 arch/arm64/kernel/entry-ftrace.S:333: Error: undefined symbol FREGS_SIZE used
 as an immediate value
Message-ID: <202603051134.8AbTS4Wl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.12.y
head:   c1924e059c728edf4138c6343fafb2c6d234ac35
commit: 33d4e904e24d14ff0fbc528b657ddc7c7b636e6a [955/955] fgraph: Replace fgraph_ret_regs with ftrace_regs
config: arm64-randconfig-004-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051134.8AbTS4Wl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051134.8AbTS4Wl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051134.8AbTS4Wl-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/entry-ftrace.S: Assembler messages:
>> arch/arm64/kernel/entry-ftrace.S:333: Error: undefined symbol FREGS_SIZE used as an immediate value
>> arch/arm64/kernel/entry-ftrace.S:336: Error: undefined symbol FREGS_X0 used as an immediate value
>> arch/arm64/kernel/entry-ftrace.S:337: Error: undefined symbol FREGS_X2 used as an immediate value
>> arch/arm64/kernel/entry-ftrace.S:338: Error: undefined symbol FREGS_X4 used as an immediate value
>> arch/arm64/kernel/entry-ftrace.S:339: Error: undefined symbol FREGS_X6 used as an immediate value
>> arch/arm64/kernel/entry-ftrace.S:342: Error: undefined symbol FREGS_FP used as an immediate value
   arch/arm64/kernel/entry-ftrace.S:349: Error: undefined symbol FREGS_X0 used as an immediate value
   arch/arm64/kernel/entry-ftrace.S:350: Error: undefined symbol FREGS_X2 used as an immediate value
   arch/arm64/kernel/entry-ftrace.S:351: Error: undefined symbol FREGS_X4 used as an immediate value
   arch/arm64/kernel/entry-ftrace.S:352: Error: undefined symbol FREGS_X6 used as an immediate value
   arch/arm64/kernel/entry-ftrace.S:353: Error: undefined symbol FREGS_SIZE used as an immediate value


vim +333 arch/arm64/kernel/entry-ftrace.S

   324	
   325	/*
   326	 * void return_to_handler(void)
   327	 *
   328	 * Run ftrace_return_to_handler() before going back to parent.
   329	 * @fp is checked against the value passed by ftrace_graph_caller().
   330	 */
   331	SYM_CODE_START(return_to_handler)
   332		/* Make room for ftrace_regs */
 > 333		sub	sp, sp, #FREGS_SIZE
   334	
   335		/* Save return value regs */
 > 336		stp	x0, x1, [sp, #FREGS_X0]
 > 337		stp	x2, x3, [sp, #FREGS_X2]
 > 338		stp	x4, x5, [sp, #FREGS_X4]
 > 339		stp	x6, x7, [sp, #FREGS_X6]
   340	
   341		/* Save the callsite's FP */
 > 342		str	x29, [sp, #FREGS_FP]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
