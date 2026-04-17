Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B1E18871F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776433798; cv=none; b=Fzi2Gb2wX3CLC5xut72d3y5ddHOmACZn//bTCLUdPPwu5hCeCV26PgnzP7PDt2tU1zlnbo0frWZwNSsScfIf14nQgGez+LYhozNMQkIm94UuQIDgBnmMV9VOImdPrqNaHz68wxmLQb5y7rYdR+o/qIao1YgU+l6bE/Lhr/j4hn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776433798; c=relaxed/simple;
	bh=1DIOBtTYxWhfOcJnLP8692R/X2vhJ5q0SfBxhPnF49k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vk/APrN9FBJGrQFp66AkEs8/tRHXbycnKvLSZIOBJU0Dtjrg34Q/+UQucgDnmfZ7MdU7l2/APmgHrVrKUX7AXAGjUc+NPawiW8ECVUnJNyyD7Ww93cTPYC8La7IfESyrTe76BaGljp37qvQCWutTENjDoYZeaOWOa8bSV+Av20U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hf3OB2zi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hf3OB2zi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776433794; x=1807969794;
  h=date:from:to:cc:subject:message-id;
  bh=1DIOBtTYxWhfOcJnLP8692R/X2vhJ5q0SfBxhPnF49k=;
  b=Hf3OB2ziln4qI7PvKD3neT1yWFJwHUpsKG2ZK6YJ3AMUqLXmd0ik+oqv
   GDujk/nXa96OOcY4fuMDQO63n6AcFvMosLvldU4XPKnoVjW20zowmeVRN
   x7LuoRrkbo1Bfchl4ptwHBH/RkerO1yXIUaMadzJV6Bsnw3bugjK90GkY
   5mujH3Xse3AKqP/EjJe2lhrE3XMf2/B9GrG0LayscD7CoUKrxN9skJYKy
   YhkjXhswhvHanmBJtNvlsRbQkJyykMvb9nwP8cQ6z1grVXJbTVczgyp3P
   TJzd5qhuU1yddfLP6ba2QAm/vfvAiy1kX8wBOyQYWf7MReGFOj5S+GrhZ
   Q==;
X-CSE-ConnectionGUID: JYhBwTN5RJiwcbq6Lbs6nw==
X-CSE-MsgGUID: fVqU8HdZSHaDKFouMrduHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="95014020"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="95014020"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 06:49:54 -0700
X-CSE-ConnectionGUID: XcugrBwPQ9ip4iAlJQRAhQ==
X-CSE-MsgGUID: TMZLFLHkSieOK7HKRqvclw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="226696690"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2026 06:49:54 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDjZu-000000000QG-3uDs;
	Fri, 17 Apr 2026 13:49:50 +0000
Date: Fri, 17 Apr 2026 21:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jon Hunter <jonathanh@nvidia.com>
Subject: arch/xtensa/boot/boot-elf/bootstrap.S:58: Error: invalid
 register 'atomctl' for 'wsr' instruction
Message-ID: <202604172102.1KIXUw9l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Guenter,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   43cfbdda5af60ffc6272a7b8c5c37d1d0a181ca9
commit: 916aa36042db8ee230543ffe0d192f900e8b8c9f clocksource/drivers/timer-tegra186: Avoid 64-bit divide operation
date:   7 months ago
config: xtensa-randconfig-r063-20260417 (https://download.01.org/0day-ci/archive/20260417/202604172102.1KIXUw9l-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604172102.1KIXUw9l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 916aa36042db ("clocksource/drivers/timer-tegra186: Avoid 64-bit divide operation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604172102.1KIXUw9l-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/xtensa/boot/boot-elf/bootstrap.S: Assembler messages:
>> arch/xtensa/boot/boot-elf/bootstrap.S:58: Error: invalid register 'atomctl' for 'wsr' instruction
   arch/xtensa/boot/boot-elf/bootstrap.S:68: Warning: value 0x1a0003000 truncated to 0xa0003000


vim +58 arch/xtensa/boot/boot-elf/bootstrap.S

e85e335f8ff615f Max Filippov 2012-12-03  42  
e85e335f8ff615f Max Filippov 2012-12-03  43  	.align  4
e85e335f8ff615f Max Filippov 2012-12-03  44  _SetupMMU:
09af39f649dac66 Max Filippov 2021-07-26  45  #if XCHAL_HAVE_WINDOWED
e85e335f8ff615f Max Filippov 2012-12-03  46  	movi	a0, 0
e85e335f8ff615f Max Filippov 2012-12-03  47  	wsr	a0, windowbase
e85e335f8ff615f Max Filippov 2012-12-03  48  	rsync
e85e335f8ff615f Max Filippov 2012-12-03  49  	movi	a0, 1
e85e335f8ff615f Max Filippov 2012-12-03  50  	wsr	a0, windowstart
e85e335f8ff615f Max Filippov 2012-12-03  51  	rsync
09af39f649dac66 Max Filippov 2021-07-26  52  #endif
e85e335f8ff615f Max Filippov 2012-12-03  53  	movi	a0, 0x1F
e85e335f8ff615f Max Filippov 2012-12-03  54  	wsr	a0, ps
e85e335f8ff615f Max Filippov 2012-12-03  55  	rsync
e85e335f8ff615f Max Filippov 2012-12-03  56  
e85e335f8ff615f Max Filippov 2012-12-03  57  #ifndef CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
e85e335f8ff615f Max Filippov 2012-12-03 @58  	initialize_mmu

:::::: The code at line 58 was first introduced by commit
:::::: e85e335f8ff615f74e29e09cc2599f095600114b xtensa: add MMU v3 support

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Chris Zankel <chris@zankel.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
