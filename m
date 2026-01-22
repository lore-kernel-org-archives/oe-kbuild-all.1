Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CDB330640
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 05:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769058340; cv=none; b=IzAJesvR+YJZubLRljKQU4H04XtW/F8l2nAlKrkOqAB4gb7JpWfbyzIfwOt93C+BnZuTypB0DAlQAOIGmpKStHXtGAopCL4wj+7qw7Vb9G80e9lmONqo4p/x6/Nh2ieBRWTV4UjXl0J6YFFcniBVqYUw1uU0ZrOjVylg8MVyshw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769058340; c=relaxed/simple;
	bh=FkCnrkU+R4ExF1g792DCFBpq2YYmCwvWfVvcZPdphJQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cqINecQ/BPWa8E0LvVrneZDW4Kqw/w+D/sEYsbkgckUtkCd+F9vq2OpnzKKlzv6pnOce4CJsEn4pHbyMwe7Axda+5TWM2Mud8u3IPDViZP6iDsV694YS2sM7+FbzxB+F+Iqa56HY4YuVLPltnuSb+f0uYT8Rk5Zy57+fJlLTSb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6Xl398+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6Xl398+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769058339; x=1800594339;
  h=date:from:to:cc:subject:message-id;
  bh=FkCnrkU+R4ExF1g792DCFBpq2YYmCwvWfVvcZPdphJQ=;
  b=b6Xl398+GPgVYDA/ni/RtyxUu5rLR+jhvnaamxSOkWvJvyAaNpqtjtl5
   g5yrlAd4KJPQQztKdmrP3q7M4oUk0F6SOv8TZYUffKyLavy0Dd+KiVp9W
   bs4przCJmLUupCLn/dFz/tWgpi4E1Rq0mWOEvoirANG3W7kY/zyiSmsHS
   Sk+8a9/6n8+hmXgzd9+uRqb5wMH+OMC2TyJPomiuy+WvcNCQbBEc7lNaD
   WI1l9THQ4xwfMbtYQQNsq7KqVXTDUTNT8krv8YnJE84/ru2s7//dArhVe
   VX02/9AZ9TkN1GBHPw2xPtMyNiEhz9Jc5Tg1GZVSA7vJVr38Zkhbx7DBA
   g==;
X-CSE-ConnectionGUID: gGhwqdY/T0qFlo8vh6JIXQ==
X-CSE-MsgGUID: ucRb3gllQMiOf9NgzUX4Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57856729"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="57856729"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 21:05:38 -0800
X-CSE-ConnectionGUID: ufnMYAIBQHWacd4tm5eS/g==
X-CSE-MsgGUID: JStUsUdsQJmTQBeZ8NCuOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="211494205"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jan 2026 21:05:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vimsw-00000000SSf-28RL;
	Thu, 22 Jan 2026 05:05:34 +0000
Date: Thu, 22 Jan 2026 13:04:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:zero-page/v0 1/1] arch/sh/include/asm/setup.h:10:35:
 error: 'boot_params_page' undeclared
Message-ID: <202601221305.irA7Lvrb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git zero-page/v0
head:   53d07913878ea27d6fe4224e8581729185291278
commit: 53d07913878ea27d6fe4224e8581729185291278 [1/1] dev: arch, mm: consolidate empty_zero_page
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260122/202601221305.irA7Lvrb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221305.irA7Lvrb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221305.irA7Lvrb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sh/kernel/setup.c:40:
   arch/sh/kernel/setup.c: In function 'setup_arch':
>> arch/sh/include/asm/setup.h:10:35: error: 'boot_params_page' undeclared (first use in this function)
      10 | #define PARAM   ((unsigned char *)boot_params_page)
         |                                   ^~~~~~~~~~~~~~~~
   arch/sh/include/asm/setup.h:14:44: note: in expansion of macro 'PARAM'
      14 | #define ORIG_ROOT_DEV (*(unsigned long *) (PARAM+0x008))
         |                                            ^~~~~
   arch/sh/kernel/setup.c:274:35: note: in expansion of macro 'ORIG_ROOT_DEV'
     274 |         ROOT_DEV = old_decode_dev(ORIG_ROOT_DEV);
         |                                   ^~~~~~~~~~~~~
   arch/sh/include/asm/setup.h:10:35: note: each undeclared identifier is reported only once for each function it appears in
      10 | #define PARAM   ((unsigned char *)boot_params_page)
         |                                   ^~~~~~~~~~~~~~~~
   arch/sh/include/asm/setup.h:14:44: note: in expansion of macro 'PARAM'
      14 | #define ORIG_ROOT_DEV (*(unsigned long *) (PARAM+0x008))
         |                                            ^~~~~
   arch/sh/kernel/setup.c:274:35: note: in expansion of macro 'ORIG_ROOT_DEV'
     274 |         ROOT_DEV = old_decode_dev(ORIG_ROOT_DEV);
         |                                   ^~~~~~~~~~~~~


vim +/boot_params_page +10 arch/sh/include/asm/setup.h

     6	
     7	/*
     8	 * This is set up by the setup-routine at boot-time
     9	 */
  > 10	#define PARAM	((unsigned char *)boot_params_page)
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
