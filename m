Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0D51990C1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 21:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735422233; cv=none; b=js6y30lPbCbTG70VMZnF84AqrPP8aVGDU2WYkGe43ZL1yohpEiDOocM6PkG79Jjs92c8uYf4yJHfdHMR/KCUfvV5NWDB4DlINleV0Ogeie4pA46B0Rit+5fLFlwZ2g+p8IP3HMZeQrsMxxvVzq9vYqk4B5UBMzZfL1BiIElOSSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735422233; c=relaxed/simple;
	bh=fHg7z8eku8d9Jaoy6rxcjnw0tBaX4xO2RDeawECZEpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r6foNjT6mZ8PSdlJcGg5RvqndxHBMiy0946lpLh93tHMkZMbqCv/hw21PUzwjl9kI9cLq9/KrysLvcqGBPihWlY/27PqU2xNPfYh/ER6JZxZwL67mUgfWE5Sdvhf/QCl0NNbc4ncxmUs2OVbpVGbnUYwP6p3RLJ0auQaEd2GgxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWeLtVni; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWeLtVni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735422231; x=1766958231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fHg7z8eku8d9Jaoy6rxcjnw0tBaX4xO2RDeawECZEpk=;
  b=aWeLtVni0Q/NexblN1FlvD+TT9AhWqoofpFYZgiPeAoSbo6CiXPVUxiF
   7eyElmfUJjVk3WlFu17KmeCD6HO0vZelCZw4mrh9v0umqlNsPbvzAntQu
   0DZYf1EPbeuvNkRj+xU+JTGcB5cQKJ86aKSGdX3h4W/prdMohWNw1USW6
   zVuyXLiRlPqfHnOH7M7cGcc3dgjbqdjrGWq0PnmR5y3cjUzx2hah0mXDh
   mwq/jtsyS5evRWNmTq/z7GCv1B6TT+vTPTA38WxMBcZDQ7NYH3v3cpNR6
   CWoRjSikafTsFtq3CtFBT5XeXPCtCEKUIX31VTyo6yNCdH1kuUTGt1jrY
   Q==;
X-CSE-ConnectionGUID: j4AdOnBYQfqPJLPvRePOJw==
X-CSE-MsgGUID: 3QC0zqVuTXCxFvrC5PJmXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46766796"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="46766796"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 13:43:47 -0800
X-CSE-ConnectionGUID: fR2vFKJETWCqbIPmbQSY6A==
X-CSE-MsgGUID: r/g6L7NLRmmH0itm0IHl9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105043601"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Dec 2024 13:43:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tReb1-0004Ka-21;
	Sat, 28 Dec 2024 21:43:43 +0000
Date: Sun, 29 Dec 2024 05:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 13/13] ld.lld: error:
 drivers/thermal/intel/x86_pkg_temp_thermal.o <inline asm>:26:3: unknown
 directive
Message-ID: <202412290541.JAgkSPIG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   831a3852bafc8cabcce4c27132e763d6c88e3e25
commit: 831a3852bafc8cabcce4c27132e763d6c88e3e25 [13/13] x86/msr: Use the alternatives mechanism to call Xen MSR APIs
config: x86_64-randconfig-r063-20241228 (https://download.01.org/0day-ci/archive/20241229/202412290541.JAgkSPIG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290541.JAgkSPIG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290541.JAgkSPIG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/thermal/intel/x86_pkg_temp_thermal.c:8:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   240 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   278 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   313 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   345 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   568 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   594 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   636 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   671 |         __attribute__((cold, unused));
   |                        ^
   8 warnings generated.
>> ld.lld: error: drivers/thermal/intel/x86_pkg_temp_thermal.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $434{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/thermal/intel/x86_pkg_temp_thermal.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $434{:u32}, %rax
   ^
--
   In file included from drivers/cpufreq/speedstep-lib.c:13:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   240 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   278 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   313 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   345 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   568 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   594 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   636 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   671 |         __attribute__((cold, unused));
   |                        ^
   8 warnings generated.
>> ld.lld: error: drivers/cpufreq/speedstep-lib.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $42{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/cpufreq/speedstep-lib.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $42{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/cpufreq/speedstep-lib.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $23{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/cpufreq/speedstep-lib.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $205{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/cpufreq/speedstep-lib.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $44{:u32}, %rax
   ^
--
   In file included from drivers/cpufreq/p4-clockmod.c:21:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   240 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   278 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   313 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   345 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   568 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   594 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   636 |         __attribute__((cold, unused));
   |                        ^
   arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   671 |         __attribute__((cold, unused));
   |                        ^
   8 warnings generated.
>> ld.lld: error: drivers/cpufreq/p4-clockmod.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $410{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/cpufreq/p4-clockmod.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $412{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/cpufreq/p4-clockmod.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $410{:u32}, %rax
   ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
