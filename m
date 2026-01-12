Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5662BD5AD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 23:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768262008; cv=none; b=NXV9rYYk2FWcU2LhTMsDUD6P+//sd585Cr4dW6z22I0YWh2wCdaFqMqRieDiUXAlqHAO+eV0b7u2LrBnaNHUmzGFna3mDXt6GA9OEt3oWSEIs+Rec3RAS3Qls4Dq+LmuTxHlwzW8ooagydjEpX/E5WrgnG5qaUZedKScth7do9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768262008; c=relaxed/simple;
	bh=LZkQI2JkeWFfLstjOSWjauB3Y+IFUUKfX+GPw5mChoQ=;
	h=Date:From:Cc:Subject:Message-ID; b=W9rcoLKX/EnbO+Hqrdhx3B3O3PHgBbhCgkmZNsjPb9DrVGZuz6IMsowTPDomiEDBkFQAeXUzWFfi+aIGB2ywlnU5yuy/ODH/mlI9IhA8EiqcCU8H5hWb4k0hggp6iUvDHLcFpFxsERqqyPjUOUWzNh2Fm0oGVL02faVVxrK0LkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwelEf0N; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwelEf0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768262006; x=1799798006;
  h=date:from:cc:subject:message-id;
  bh=LZkQI2JkeWFfLstjOSWjauB3Y+IFUUKfX+GPw5mChoQ=;
  b=AwelEf0NCHsuxMCtvNVywNrpdgviNgXEEsi+GfYVrwtXpZ44h17z2OU4
   kSBfzaj6H69QKKBgCor8gWPCq5Aox6iSM0rMCfnaXSp68Mg5cC4KXieyo
   QO8n7J6g0pbLNZ5vImfwb4yByClssLhqF1UuNs+lAueBVc7wxxTPb0P5h
   xJjd0IqAWVPluSDw+6pe8jB7mhU27JYNE6bLkXEj+SEAcwNe1Fd1mWMrS
   RLOw5jMlxkx/sI4X2vppqPEOEcbhuSjxjZY4ElkUvu52s3+3zSSszj7um
   2wJF725ZG/SK92epAIBZYQEjFOg1jlY0COb6yB9ECc+ae44lterUGptqM
   w==;
X-CSE-ConnectionGUID: VAs9lfFDRZaam07UtZhs+Q==
X-CSE-MsgGUID: woLAToSwT3+NybjgW/GJQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69529128"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69529128"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 15:53:26 -0800
X-CSE-ConnectionGUID: ooH6OXfzRaC09fwVdVhVtA==
X-CSE-MsgGUID: UMeKtTjBTA+EvBXPxKiiaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208383772"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jan 2026 15:53:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfRis-00000000E00-0MjV;
	Mon, 12 Jan 2026 23:53:22 +0000
Date: Tue, 13 Jan 2026 07:52:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: arch/xtensa/boot/boot-elf/bootstrap.S:58: Error: invalid
 register 'atomctl' for 'wsr' instruction
Message-ID: <202601130726.HBzz6OhQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lucas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: b67e7422d229dead0dddaad7e7c05558f24d552f drm/xe: Fix build with CONFIG_MODULES=n
date:   4 months ago
config: xtensa-randconfig-r063-20260112 (https://download.01.org/0day-ci/archive/20260113/202601130726.HBzz6OhQ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130726.HBzz6OhQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130726.HBzz6OhQ-lkp@intel.com/

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
