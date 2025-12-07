Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF96817C9E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765112626; cv=none; b=R1Bun8lx+RzaZEDaV0WMau0w2gWVJkEBT5uelaUmIPc3qWztT0JOeZBJiQ3qWkSfvPYctUBuQWyhlWXnSdk43hJKSZofqtKQR2ewWdU6RPuOTvhUZxkQBKO5lmUStlHR91bcYJRT5o1wv/TtoojAOB47KYE0aNw0C2cP6/Bpo8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765112626; c=relaxed/simple;
	bh=X8nKL70f3jMihVVpYhKMK8sBdbM0AYPP10a0KY8ikzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WvOXiMjSsxxNAwefg649OK+6UnR9ZBXijo6Ws0Cn/d8gxijaTPjwzuJbcQ6iGs3eg8ii2vKGd5bxXWfW3uUlnR2uLIbuOoI6UnqMnAO8n6YbNIOChl3aJfx44G8oihE9BItnF7BgAPwcV+7S9bvAnKdgQwPt9V1mYrBNrCmLAvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHE4Xika; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHE4Xika"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765112625; x=1796648625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X8nKL70f3jMihVVpYhKMK8sBdbM0AYPP10a0KY8ikzk=;
  b=JHE4XikayrUAy2ZlmW4MvyWPCVXe/5rd8Fesgvbe9jSj0dSVNgB7l21L
   bRWk/kA8/GJVGRKApdOusldgTM2hk0APKNvMRuAIEg6WqgPrvXh94Rp8V
   GikOROgqBkCUb1QVvpMKhllC+R4DxiIg38otBGjAiWiYaEWbDm0e6hVhA
   pY0hHJrmC0bTHFW1PAJNRkrTx9j9DCy8qazKKwimpjtAh8cwxh0+LL9mz
   MgBICDSMj3fYLCT9D/2CdXEv8nfBDgs84CJjMtKCuxRVgNm4z6IJ7SZa0
   cyJc6Sq3I+4O8D0lUf9nxrgHHAzZU1r/SK/23e3jS4Ua+ZaXGvkwfIZb5
   Q==;
X-CSE-ConnectionGUID: 6PO9BKdBSW2vC7a4Jxw/GQ==
X-CSE-MsgGUID: E2IfJ8MfQdeTntGigFqRmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="92553566"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="92553566"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 05:03:44 -0800
X-CSE-ConnectionGUID: 3PG0XE2hS2ilds4aWPjnYw==
X-CSE-MsgGUID: iPwlDsZfTHacg5qHCME4rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="195525383"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Dec 2025 05:03:43 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSEQO-00000000JEp-2X3Y;
	Sun, 07 Dec 2025 13:03:40 +0000
Date: Sun, 7 Dec 2025 21:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jon Hunter <jonathanh@nvidia.com>
Subject: arch/xtensa/boot/boot-elf/bootstrap.S:58: Error: invalid register
 'atomctl' for 'wsr' instruction
Message-ID: <202512072036.TF3TU1wf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   37bb2e7217b01404e2abf9d90d8e5705a5603b52
commit: 916aa36042db8ee230543ffe0d192f900e8b8c9f clocksource/drivers/timer-tegra186: Avoid 64-bit divide operation
date:   3 months ago
config: xtensa-randconfig-r054-20251207 (https://download.01.org/0day-ci/archive/20251207/202512072036.TF3TU1wf-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512072036.TF3TU1wf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512072036.TF3TU1wf-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/xtensa/boot/boot-elf/bootstrap.S: Assembler messages:
>> arch/xtensa/boot/boot-elf/bootstrap.S:58: Error: invalid register 'atomctl' for 'wsr' instruction
   arch/xtensa/boot/boot-elf/bootstrap.S:68: Warning: value 0x1a0003000 truncated to 0xa0003000


vim +58 arch/xtensa/boot/boot-elf/bootstrap.S

e85e335f8ff615 Max Filippov 2012-12-03  42  
e85e335f8ff615 Max Filippov 2012-12-03  43  	.align  4
e85e335f8ff615 Max Filippov 2012-12-03  44  _SetupMMU:
09af39f649dac6 Max Filippov 2021-07-26  45  #if XCHAL_HAVE_WINDOWED
e85e335f8ff615 Max Filippov 2012-12-03  46  	movi	a0, 0
e85e335f8ff615 Max Filippov 2012-12-03  47  	wsr	a0, windowbase
e85e335f8ff615 Max Filippov 2012-12-03  48  	rsync
e85e335f8ff615 Max Filippov 2012-12-03  49  	movi	a0, 1
e85e335f8ff615 Max Filippov 2012-12-03  50  	wsr	a0, windowstart
e85e335f8ff615 Max Filippov 2012-12-03  51  	rsync
09af39f649dac6 Max Filippov 2021-07-26  52  #endif
e85e335f8ff615 Max Filippov 2012-12-03  53  	movi	a0, 0x1F
e85e335f8ff615 Max Filippov 2012-12-03  54  	wsr	a0, ps
e85e335f8ff615 Max Filippov 2012-12-03  55  	rsync
e85e335f8ff615 Max Filippov 2012-12-03  56  
e85e335f8ff615 Max Filippov 2012-12-03  57  #ifndef CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
e85e335f8ff615 Max Filippov 2012-12-03 @58  	initialize_mmu

:::::: The code at line 58 was first introduced by commit
:::::: e85e335f8ff615f74e29e09cc2599f095600114b xtensa: add MMU v3 support

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Chris Zankel <chris@zankel.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
