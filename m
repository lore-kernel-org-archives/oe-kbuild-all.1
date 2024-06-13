Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EB418028
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 03:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718247631; cv=none; b=lu6G4UqwuoOeplzOiSje+Y0h/8fr3U6HKPRggkrIo49mEn6Tzy8RUAivW5u9FZyCEwpZeQM3ReXeluEFtxKAOWimLYi9Wm2X51FM+P5pi1NFYW+8sSQlU9cxBDFAvuoqKCO9flgQ7OHReV07r0V7LSgL65SRYnnZTQyfyYSDYn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718247631; c=relaxed/simple;
	bh=QYx7/77HCs/wO129yFsr5bj+iRVGtf1ppThwjyL7aFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hAQc7gmM+xnElaGb6GQdOeR5CLLpX2emxiMW1smCCu0loMrPZNiiEg5Zjx5yqqO6MEOKwhheoE//l3OlGbOwY1Gd8GuMnB/tUL6eWmUvHz93Qfv9YFUA1fJ+9vkgERurmyFywihxRNwM7nTA/KCcnO+uY+Vt6cb+dDkbPGZwEWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ta5I0Yhu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ta5I0Yhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718247629; x=1749783629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QYx7/77HCs/wO129yFsr5bj+iRVGtf1ppThwjyL7aFw=;
  b=Ta5I0YhuJam2bgDEsp/QDdNt3ILuK/nIJXVTolVVG3XTfBSYEm4gUtiE
   zXAT3Y7S0kTZFHt3izPpAr45Zr2B6RTmfpeJcHKLjUM6PGhFZx6bNizbz
   IVmXraEBwAwnNsMxWCwAkJdrSu9jcsS01Hf31GbpPTJorAuC1CWJ8ivqw
   Wna7JUp5STZYGJH5nkUinlXQVOPuucDYleyBqJfiCwWKHAFbCk7JAZ5rC
   8ONR7SILDLMVnsWoucjNRwDg2C4mQjAKZrKKE19/E7/MBQ9va3GjPFmkC
   XP87VfCvzx0ChKSceaHxkrjMt4LZe0QbXxKnrvLZT2PBnFSVRUPce6G2G
   w==;
X-CSE-ConnectionGUID: MkZlk4UMRQmVvq/azDe2GA==
X-CSE-MsgGUID: vtLzmPuRQv2vqkV8zWrwmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15213045"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="15213045"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 20:00:28 -0700
X-CSE-ConnectionGUID: hWJy4PKnQGaIPHTNELsmRg==
X-CSE-MsgGUID: pOlTCQPLRJWc9pN5EoybqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="45120359"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jun 2024 20:00:28 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHahN-00029c-1J;
	Thu, 13 Jun 2024 03:00:25 +0000
Date: Thu, 13 Jun 2024 11:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 2/3] core.c:undefined reference to
 `__early_static_cpu_has__thunk'
Message-ID: <202406131032.2qi7DYtE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   77b952c11556f38dbdc95c25a04ff72c8fd20a1b
commit: 873d254d7a3c15b60376b9cfcd8002a1943ffb1e [2/3] todo
config: i386-buildonly-randconfig-001-20240613 (https://download.01.org/0day-ci/archive/20240613/202406131032.2qi7DYtE-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131032.2qi7DYtE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131032.2qi7DYtE-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/events/core.o: in function `perf_get_x86_pmu_capability':
>> core.c:(.text+0xa10): undefined reference to `__early_static_cpu_has__thunk'
   ld: arch/x86/events/amd/core.o: in function `amd_pmu_event_map':
   core.c:(.text+0x1f): undefined reference to `__early_static_cpu_has__thunk'
>> ld: core.c:(.text+0x4a): undefined reference to `__early_static_cpu_has__thunk'
   ld: core.c:(.text+0x6b): undefined reference to `__early_static_cpu_has__thunk'
   ld: arch/x86/events/amd/lbr.o: in function `amd_pmu_lbr_enable_all':
>> lbr.c:(.text+0x7d0): undefined reference to `__early_static_cpu_has__thunk'
   ld: arch/x86/events/amd/lbr.o:lbr.c:(.text+0x970): more undefined references to `__early_static_cpu_has__thunk' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
