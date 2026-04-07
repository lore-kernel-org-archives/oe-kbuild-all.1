Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D960375F65
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533954; cv=none; b=MrKpWnlWdDyJPHk7CoOLMEAV0EkCheEprA+DZWtgi9khenf0AvhpQfHs1SuWbob5tFd/u8QzbJa9zgnNE/sZAkvIXHQ7I28teOGFjmgcZi/rQGz1fRvPPSr3SbnCdBpCS696YgcjZOIFJY85bqj+zFJG1XKq8vTeO7evCaxefTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533954; c=relaxed/simple;
	bh=2cFqyz5C6rJgd4peP6Nc5WsW7lZSzq16/K+Ou1GTFFQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bS8MnM7qUMa0QA0IZIOmGvcNHv12pHmrPUSZOtADj9v20jv2oh+LYe1qy+wY0044dQ6g0n/uV1uET08UXwCK5raqPjpM3jCL7Rm5Fckzm3gosG2xWEl/YsV82FcoijoDQABZme8/0J0Ogm7VPI4yxI/CdIeU5XPvakAOCad4TCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hl+YQNwe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hl+YQNwe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533948; x=1807069948;
  h=date:from:to:cc:subject:message-id;
  bh=2cFqyz5C6rJgd4peP6Nc5WsW7lZSzq16/K+Ou1GTFFQ=;
  b=Hl+YQNweqfMMPQEYqQDngW8osfoIMBQLuL+HJTBHy96cVgSjU7+lg3Cn
   ScE/cNVso97o8+/uj49e2Afsq+8oZ7Vn70SAScJlPtqpCR2pK23uR/l0Z
   zrAmcx9lSYrYS3tym65/KbMyMnUFPrbFxdLoPrmrEDuvexXRdgUOg7QOD
   AHp4BPeTNV8jr7V0mTHPOLn8mHFP27JuBerZXKxvbHjnAVJxlu+YwB9p/
   TnZ8ae+ch1i5BFpIJvE65ouCgJy0gdJSa/HNR0+aBtyLmh+E+wRHAij7G
   mFeM+E+XbyiHqAaHkCXioieH5idbiQOrMcT11K6GrPDTHVRKsa5qnIBMl
   Q==;
X-CSE-ConnectionGUID: bc2hxFsXQ7mRBRAtuAOWgQ==
X-CSE-MsgGUID: ZUdXeugPSVmulGIzYrlKlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781498"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781498"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:52:23 -0700
X-CSE-ConnectionGUID: yV0PezZ9Q5qSviH6SN0n+g==
X-CSE-MsgGUID: m0iCFp6DSmeOCZfOh/YMGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="224842923"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Apr 2026 20:52:21 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xUA-0000000002h-3L6a;
	Tue, 07 Apr 2026 03:52:18 +0000
Date: Tue, 07 Apr 2026 11:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>
Subject: [amd-pstate:linux-next 15/22] ld.lld: error: undefined
 symbol: power_supply_reg_notifier
Message-ID: <202604040742.ySEdkuAa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
head:   9487e2a00e7b3c6f258c5c99953f470eba6fb61d
commit: e30ca6dd5345c5b8ba05f346a8e81105352fe571 [15/22] cpufreq/amd-pstate: Add dynamic energy performance preference
config: x86_64-randconfig-121-20260403 (https://download.01.org/0day-ci/archive/20260404/202604040742.ySEdkuAa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040742.ySEdkuAa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040742.ySEdkuAa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: power_supply_reg_notifier
   >>> referenced by amd-pstate.c:1216 (drivers/cpufreq/amd-pstate.c:1216)
   >>>               vmlinux.o:(amd_pstate_epp_cpu_init)
--
>> ld.lld: error: undefined symbol: power_supply_unreg_notifier
   >>> referenced by amd-pstate.c:1198 (drivers/cpufreq/amd-pstate.c:1198)
   >>>               vmlinux.o:(amd_pstate_epp_cpu_init)
   >>> referenced by amd-pstate.c:1198 (drivers/cpufreq/amd-pstate.c:1198)
   >>>               vmlinux.o:(amd_pstate_epp_cpu_exit)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
