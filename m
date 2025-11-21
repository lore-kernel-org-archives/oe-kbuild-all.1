Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C90C289E13
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 16:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763742069; cv=none; b=oZr5VWEYS748wU6jC8FCCccbVNyQuxNOSi0XmG6JK/AoCkcdzuOkL3V6hdqnrxYMFMEf+EuDxePnv+tOO2/PxG1dSwu7oJpf1nWNyTD4sjktpuilPVfL6LK5PCRQj651dkYq+7gtlumywTJncX/nHU+4fAP5ACXVlgDt6YASvpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763742069; c=relaxed/simple;
	bh=7qK6J28Cks6/0aaTff7oiytOvXWN9JkYc0RN0fwKlFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EQNEJ/rLeSNE/5slAzo5oe15NNxSY8ydbXDcVSEaOLb0B2PuHxsbX16kxwB2NmBFbqeSBynnN+EQIasU7FJdyWT+eGry4vNw0kqjFWsSl2gTGxll/iIOtsk8v971LvRLPwE7eLmn63473guZFqUQGM0PrbIU1RflsA03NKg4Nv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GulRyps9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GulRyps9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763742068; x=1795278068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7qK6J28Cks6/0aaTff7oiytOvXWN9JkYc0RN0fwKlFc=;
  b=GulRyps9L6MBcFnt91cyUdxPheWvJkmWfZ5pFZPraOEraNpguVFLX0AO
   8QOcGsmtSCvm2t2IsCgSwrYPpStCnSN8Gw44JLpfUxxg/cV3mpV5cK8dC
   xpBhYcCVIJGGGeM7Z7foi78zIrvWQjws82VhxU1TneP8RI/YOGfmXFuHV
   CX28CWtUrQsiHuM52OrRqSFHdVWHaBQRr3tcFFO7RabQwFZ3ro991bvxd
   0QjvrY/v7/eyZl/m+Y+4ZYKlyg+5yz6RR2mo6sGF2QXRI0Bt1xkAWR6cP
   q5b/VpvtApbTFthlb6GlgRXiBMHXcX5H8WGAixCyKve5ce9APTApD7KQu
   w==;
X-CSE-ConnectionGUID: uKZRTSsvRiaIizAfzghwEw==
X-CSE-MsgGUID: 6xxACTCOTZCdkydC9vH8nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="68441280"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="68441280"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 08:21:07 -0800
X-CSE-ConnectionGUID: UvLhAPqEQxWl0ANjmO/bWQ==
X-CSE-MsgGUID: ezsGzrPzQBSE8b+SbBH9hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="222359343"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Nov 2025 08:21:05 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMTsc-0006a1-2S;
	Fri, 21 Nov 2025 16:21:02 +0000
Date: Sat, 22 Nov 2025 00:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/4]
 drivers/platform/x86/acer-wmi.c:1928:27: error: incomplete definition of
 type 'struct platform_profile_handler'
Message-ID: <202511220045.Cbc09c5x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   40435e5332925bf7429f8e4c796040981fcc4968
commit: 82c3c913af0c82e7da403f126de414662b19d5ab [0/4] UPSTREAM: ACPI: platform_profile: Move platform_profile_handler
config: i386-randconfig-011-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220045.Cbc09c5x-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220045.Cbc09c5x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220045.Cbc09c5x-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/platform/x86/acer-wmi.c:763:40: warning: tentative definition of variable with internal linkage has incomplete non-array type 'struct platform_profile_handler' [-Wtentative-definition-incomplete-type]
     763 | static struct platform_profile_handler platform_profile_handler;
         |                                        ^
   drivers/platform/x86/acer-wmi.c:763:15: note: forward declaration of 'struct platform_profile_handler'
     763 | static struct platform_profile_handler platform_profile_handler;
         |               ^
>> drivers/platform/x86/acer-wmi.c:1928:27: error: incomplete definition of type 'struct platform_profile_handler'
    1928 |                 platform_profile_handler.profile_get =
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/acer-wmi.c:763:15: note: forward declaration of 'struct platform_profile_handler'
     763 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/acer-wmi.c:1930:27: error: incomplete definition of type 'struct platform_profile_handler'
    1930 |                 platform_profile_handler.profile_set =
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/acer-wmi.c:763:15: note: forward declaration of 'struct platform_profile_handler'
     763 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/acer-wmi.c:1934:28: error: incomplete definition of type 'struct platform_profile_handler'
    1934 |                         platform_profile_handler.choices);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/acer-wmi.c:763:15: note: forward declaration of 'struct platform_profile_handler'
     763 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/acer-wmi.c:1936:28: error: incomplete definition of type 'struct platform_profile_handler'
    1936 |                         platform_profile_handler.choices);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/acer-wmi.c:763:15: note: forward declaration of 'struct platform_profile_handler'
     763 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/acer-wmi.c:1938:28: error: incomplete definition of type 'struct platform_profile_handler'
    1938 |                         platform_profile_handler.choices);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/acer-wmi.c:763:15: note: forward declaration of 'struct platform_profile_handler'
     763 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/acer-wmi.c:1940:28: error: incomplete definition of type 'struct platform_profile_handler'
    1940 |                         platform_profile_handler.choices);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/acer-wmi.c:763:15: note: forward declaration of 'struct platform_profile_handler'
     763 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/acer-wmi.c:1942:28: error: incomplete definition of type 'struct platform_profile_handler'
    1942 |                         platform_profile_handler.choices);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/acer-wmi.c:763:15: note: forward declaration of 'struct platform_profile_handler'
     763 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/acer-wmi.c:1944:60: error: too few arguments to function call, expected 4, have 1
    1944 |                 err = platform_profile_register(&platform_profile_handler);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~                          ^
   include/linux/platform_profile.h:37:16: note: 'platform_profile_register' declared here
      37 | struct device *platform_profile_register(struct device *dev, const char *name,
         |                ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      38 |                                          void *drvdata,
         |                                          ~~~~~~~~~~~~~~
      39 |                                          const struct platform_profile_ops *ops);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c:2036:27: error: too few arguments to function call, single argument 'dev' was not specified
    2036 |                 platform_profile_notify();
         |                 ~~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/platform_profile.h:45:6: note: 'platform_profile_notify' declared here
      45 | void platform_profile_notify(struct device *dev);
         |      ^                       ~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c:2598:27: error: too few arguments to function call, single argument 'dev' was not specified
    2598 |                 platform_profile_remove();
         |                 ~~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/platform_profile.h:40:5: note: 'platform_profile_remove' declared here
      40 | int platform_profile_remove(struct device *dev);
         |     ^                       ~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c:2621:27: error: too few arguments to function call, single argument 'dev' was not specified
    2621 |                 platform_profile_remove();
         |                 ~~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/platform_profile.h:40:5: note: 'platform_profile_remove' declared here
      40 | int platform_profile_remove(struct device *dev);
         |     ^                       ~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/acer-wmi.c:763:40: error: tentative definition has type 'struct platform_profile_handler' that is never completed
     763 | static struct platform_profile_handler platform_profile_handler;
         |                                        ^
   drivers/platform/x86/acer-wmi.c:763:15: note: forward declaration of 'struct platform_profile_handler'
     763 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   1 warning and 12 errors generated.


vim +1928 drivers/platform/x86/acer-wmi.c

6bb5153dfbaf88 SungHwan Jung 2023-11-24  1922  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1923  static int acer_platform_profile_setup(void)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1924  {
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1925  	if (quirks->predator_v4) {
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1926  		int err;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1927  
6bb5153dfbaf88 SungHwan Jung 2023-11-24 @1928  		platform_profile_handler.profile_get =
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1929  			acer_predator_v4_platform_profile_get;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1930  		platform_profile_handler.profile_set =
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1931  			acer_predator_v4_platform_profile_set;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1932  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1933  		set_bit(PLATFORM_PROFILE_PERFORMANCE,
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1934  			platform_profile_handler.choices);
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1935  		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1936  			platform_profile_handler.choices);
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1937  		set_bit(PLATFORM_PROFILE_BALANCED,
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1938  			platform_profile_handler.choices);
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1939  		set_bit(PLATFORM_PROFILE_QUIET,
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1940  			platform_profile_handler.choices);
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1941  		set_bit(PLATFORM_PROFILE_LOW_POWER,
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1942  			platform_profile_handler.choices);
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1943  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1944  		err = platform_profile_register(&platform_profile_handler);
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1945  		if (err)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1946  			return err;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1947  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1948  		platform_profile_support = true;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1949  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1950  		/* Set default non-turbo profile  */
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1951  		last_non_turbo_profile =
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1952  			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1953  	}
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1954  	return 0;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1955  }
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1956  

:::::: The code at line 1928 was first introduced by commit
:::::: 6bb5153dfbaf88fa4b40ef50b706d2fb186ed92e platform/x86: acer-wmi: Add platform profile and mode key support for Predator PHN16-71

:::::: TO: SungHwan Jung <onenowy@gmail.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
