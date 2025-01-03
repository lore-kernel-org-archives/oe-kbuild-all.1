Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7A8632
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 00:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735863038; cv=none; b=tBPMrDUIBTkbRLty23Nfi1hygg6EvfTVgYZkZN4Z2xKOQCmzFzmT4uCyM1ebBeQlZaaOz/epaUjP3lATxXMqFyuA5312imNxEYF2WU0yFy4qU/bV9U85c+UEqQzakWQtGormFMpI38zgomu9eU7ZqbLxyx8j/glJyFssItuhQ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735863038; c=relaxed/simple;
	bh=/4t7WrZqGtBglyazLM9qxCTH2Eul1B+XXL1YNFqtWvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gh7BFe9JwDf5yyn2SHyAyklyfyS1C9t9WW2YCnCkvWDlwsX8WuDl+I5bB4/OlXsbROOpeyv+kDD0GeN3FaiMp9n8nLQ1xbcOJ9XKqKU7khKfthnPu1dDLgPTkt9wKpapeRC7ypI2cgeGV5IbWf+vIMXZRt450F0rZz5YmhQc5LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9H9KuDv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9H9KuDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735863037; x=1767399037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/4t7WrZqGtBglyazLM9qxCTH2Eul1B+XXL1YNFqtWvs=;
  b=J9H9KuDviFnxQR7f1ipL03tYo4BjuOUGsNhkCjdU45UIjfBzu7fcud3w
   2RbceQmbFnrUcNwBlbORm9TuKhlFHLsqlkEX1ZvnsPwbEg0UR3lZtucIT
   2Q5F63HD1iVPjdFx79ayWV6+trseP+Hrt4ZbsgaV/zpmN2ZDmEPW8Nk+G
   Hni4b6cadluGZcXly5hYAYqfCYvfSrCH6jFfvcRQATOEeYoGREfuGymIe
   tUe1+l77+ZolXDoiUx2LSi1e23QN23aIn0c4sZNCe7ZKB2diPjX0/6b05
   j4m4cVbTzOVkQHCejwpBPqF+JRbcbmULstM3HmU6TBZ1i5zqcXhTbuf6x
   w==;
X-CSE-ConnectionGUID: 4LMpN1tBTYCvJ85Iq7vwdw==
X-CSE-MsgGUID: e6IKDV9lQUW7zNnFh31LeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36129284"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36129284"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 16:10:37 -0800
X-CSE-ConnectionGUID: pwhJo+b9TjqfvXTDBJRTSQ==
X-CSE-MsgGUID: LdfTLj+hQHGx/fQfgruJtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101715772"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Jan 2025 16:10:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTVGq-0008yx-2l;
	Fri, 03 Jan 2025 00:10:32 +0000
Date: Fri, 3 Jan 2025 08:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 11/15]
 arch/x86/include/asm/msr.h:324:3: error: unknown directive
Message-ID: <202501030818.4CA0Qcn4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   eaa81ab93145df5a8414e5d1c00c9228a947cced
commit: a7ec2803038cf2ce4567973fe0cd9f8fd58ecadb [11/15] x86/msr: Use the alternatives mechanism to call Xen MSR APIs
config: x86_64-randconfig-074-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030818.4CA0Qcn4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030818.4CA0Qcn4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030818.4CA0Qcn4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/events/amd/power.c:10:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:324:3: error: unknown directive
     324 |                 ALTERNATIVE_2("mov %[msr], %%ecx\n\t"
         |                 ^
   arch/x86/include/asm/alternative.h:184:14: note: expanded from macro 'ALTERNATIVE_2'
     184 |         ALTERNATIVE(ALTERNATIVE(oldinstr, newinstr1, ft_flags1), newinstr2, ft_flags2)
         |                     ^
   arch/x86/include/asm/alternative.h:181:2: note: expanded from macro 'ALTERNATIVE'
     181 |         ALTINSTR_REPLACEMENT(newinstr)
         |         ^
   arch/x86/include/asm/alternative.h:174:9: note: expanded from macro 'ALTINSTR_REPLACEMENT'
     174 |         "774:\n\t" newinstr "\n775:\n"                                  \
         |                ^
   <inline asm>:26:3: note: instantiated into assembly here
      26 |          .insn VEX.128.F2.M7.W0 0xf6 /0, $-1073676165{:u32}, %rax
         |          ^
   In file included from arch/x86/events/amd/power.c:10:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:192:3: error: unknown directive
     192 |                 ALTERNATIVE_2("mov %[msr], %%ecx\n\t"
         |                 ^
   arch/x86/include/asm/alternative.h:184:14: note: expanded from macro 'ALTERNATIVE_2'
     184 |         ALTERNATIVE(ALTERNATIVE(oldinstr, newinstr1, ft_flags1), newinstr2, ft_flags2)
         |                     ^
   arch/x86/include/asm/alternative.h:181:2: note: expanded from macro 'ALTERNATIVE'
     181 |         ALTINSTR_REPLACEMENT(newinstr)
         |         ^
   arch/x86/include/asm/alternative.h:174:9: note: expanded from macro 'ALTINSTR_REPLACEMENT'
     174 |         "774:\n\t" newinstr "\n775:\n"                                  \
         |                ^
   <inline asm>:26:3: note: instantiated into assembly here
      26 |          .insn VEX.128.F2.M7.W0 0xf6 /0, $-1073675648{:u32}, %rax
         |          ^
   In file included from arch/x86/events/amd/power.c:10:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:192:3: error: unknown directive
     192 |                 ALTERNATIVE_2("mov %[msr], %%ecx\n\t"
         |                 ^
   arch/x86/include/asm/alternative.h:184:14: note: expanded from macro 'ALTERNATIVE_2'
     184 |         ALTERNATIVE(ALTERNATIVE(oldinstr, newinstr1, ft_flags1), newinstr2, ft_flags2)
         |                     ^
   arch/x86/include/asm/alternative.h:181:2: note: expanded from macro 'ALTERNATIVE'
     181 |         ALTINSTR_REPLACEMENT(newinstr)
         |         ^
   arch/x86/include/asm/alternative.h:174:9: note: expanded from macro 'ALTINSTR_REPLACEMENT'
     174 |         "774:\n\t" newinstr "\n775:\n"                                  \
         |                ^
   <inline asm>:26:3: note: instantiated into assembly here
      26 |          .insn VEX.128.F2.M7.W0 0xf6 /0, $-1073676166{:u32}, %rax
         |          ^
   In file included from arch/x86/events/amd/power.c:10:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:192:3: error: unknown directive
     192 |                 ALTERNATIVE_2("mov %[msr], %%ecx\n\t"
         |                 ^
   arch/x86/include/asm/alternative.h:184:14: note: expanded from macro 'ALTERNATIVE_2'
     184 |         ALTERNATIVE(ALTERNATIVE(oldinstr, newinstr1, ft_flags1), newinstr2, ft_flags2)
         |                     ^
   arch/x86/include/asm/alternative.h:181:2: note: expanded from macro 'ALTERNATIVE'
     181 |         ALTINSTR_REPLACEMENT(newinstr)
         |         ^
   arch/x86/include/asm/alternative.h:174:9: note: expanded from macro 'ALTINSTR_REPLACEMENT'
     174 |         "774:\n\t" newinstr "\n775:\n"                                  \
         |                ^
   <inline asm>:26:3: note: instantiated into assembly here
      26 |          .insn VEX.128.F2.M7.W0 0xf6 /0, $-1073676166{:u32}, %rax
         |          ^
   In file included from arch/x86/events/amd/power.c:10:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:192:3: error: unknown directive
     192 |                 ALTERNATIVE_2("mov %[msr], %%ecx\n\t"
         |                 ^
   arch/x86/include/asm/alternative.h:184:14: note: expanded from macro 'ALTERNATIVE_2'
     184 |         ALTERNATIVE(ALTERNATIVE(oldinstr, newinstr1, ft_flags1), newinstr2, ft_flags2)
         |                     ^
   arch/x86/include/asm/alternative.h:181:2: note: expanded from macro 'ALTERNATIVE'
     181 |         ALTINSTR_REPLACEMENT(newinstr)
         |         ^


vim +324 arch/x86/include/asm/msr.h

   316	
   317	#ifdef CONFIG_X86_64
   318	static __always_inline int __rdmsr_constant_safe(const u32 msr, u64 *val)
   319	{
   320		BUILD_BUG_ON(!__builtin_constant_p(msr));
   321	
   322		asm_inline volatile goto(
   323			"1:\n"
 > 324			ALTERNATIVE_2("mov %[msr], %%ecx\n\t"
   325				      "2:\n"
   326				      RDMSR_AND_SAVE_RESULT,
   327				      INSN_RDMSR_IMM,
   328				      X86_FEATURE_MSR_IMM,
   329				      "call asm_xen_read_msr\n\t"
   330				      "test %%edx, %%edx\n\t"
   331				      "jz %l[badmsr]\n\t",
   332				      X86_FEATURE_XENPV)
   333			EX_RDMSR_SAFE(1b, %l[badmsr])	/* For RDMSR immediate */
   334			EX_RDMSR_SAFE(2b, %l[badmsr])	/* For RDMSR */
   335			: [val] "=a" (*val), ASM_CALL_CONSTRAINT
   336			: [msr] "i" (msr)
   337			: "memory", "ecx", "rdx"
   338			: badmsr);
   339		return 0;
   340	
   341	badmsr:
   342		return -EIO;
   343	}
   344	#endif
   345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
