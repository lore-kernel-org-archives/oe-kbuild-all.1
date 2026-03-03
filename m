Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D681C38836B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 23:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772578858; cv=none; b=CJLjuIPuiu7q9ln57bKAj/C5N7YyIBPIJiaRoSPuICYHLcPLhrRyUOJF3yY4J7bOqoL8UiEhRBsk82A8/acRId8RB5iA3CfHF0Yf3WfofvYWwf8eXh0LSBi3JmYCtsMtNtnvPm+1xF1x0l3gxoGd1SmuVXlFoZDMSojbPJTbVMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772578858; c=relaxed/simple;
	bh=y3Qra+fcsS1OhmbEzAKNDdl/y2K8X0WBYX8VsgnWW4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g5zl8EecQ4jqRzz/KRcTDdbzR6meLUnKkNiA2iCFWEkIc0aPmaIkOtTsHaVUR80JJ7lD/o0J68m+hZgpf2SV9fv9EmplrgYQ4bXL3bPIGGvUc1F1jKwGUotW+2OGiQzGrE0zrb0k1dodmRqTW2G5lOCVnx/4JwMsSW131SL22QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgJ7fUIr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgJ7fUIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772578856; x=1804114856;
  h=date:from:to:cc:subject:message-id;
  bh=y3Qra+fcsS1OhmbEzAKNDdl/y2K8X0WBYX8VsgnWW4k=;
  b=IgJ7fUIrsB+d/RrJiay9UB+OyxsdUCR6ABW+WMtKqFCAymgz3OdncTBe
   XiBwtWoOiQEY73jTjR1lUIZzqhxfyhpuUvX2dMItjejfU9bnZxiZBvQ1h
   oCqR8IeVCltEFAh8HRYpW92Cq+iTpi1tnSsLBgWY4uaXFzVFIheCzDj/Q
   WsBPo08kzfYcTVpzw5PwQKZzlCYTFiYlSql3WkxnmEo9wa2jhSlrESnUc
   nf2xbXzn29axC0BLiMjGZZMCuUSw5tWlfYNQPxwCL4DHrlt7w9U1OcAsV
   D1ti85iYDJk1bP9xdSaC3PsmvUHrawFMOGsz0MJzi3DpPH0+JZEimSF0G
   w==;
X-CSE-ConnectionGUID: gC/ewXP3RHKMf6q6Ak7ldQ==
X-CSE-MsgGUID: inN13H0AQjKhXnctOkYezg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84269629"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="84269629"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 15:00:56 -0800
X-CSE-ConnectionGUID: PO3IgJsESgyulI2hHTkXFw==
X-CSE-MsgGUID: WyQG0n5WT1uOo7zLIEwZTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="222815747"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Mar 2026 15:00:54 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxYjU-000000002yX-2DWD;
	Tue, 03 Mar 2026 23:00:52 +0000
Date: Wed, 04 Mar 2026 07:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 28/28]
 drivers/platform/x86/hp/hp-wmi.c:276:40: warning: tentative definition of
 variable with internal linkage has incomplete non-array type 'struct
 platform_profile_handler'
Message-ID: <202603040610.DNnDuYHp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kurt,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   8e5209e3b2974d51db2fd44a262f0d2bc2b7798d
commit: 82c3c913af0c82e7da403f126de414662b19d5ab [28/28] UPSTREAM: ACPI: platform_profile: Move platform_profile_handler
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260304/202603040610.DNnDuYHp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603040610.DNnDuYHp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603040610.DNnDuYHp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/hp/hp-wmi.c:276:40: warning: tentative definition of variable with internal linkage has incomplete non-array type 'struct platform_profile_handler' [-Wtentative-definition-incomplete-type]
     276 | static struct platform_profile_handler platform_profile_handler;
         |                                        ^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/hp/hp-wmi.c:1585:27: error: incomplete definition of type 'struct platform_profile_handler'
    1585 |                 platform_profile_handler.profile_get = platform_profile_omen_get;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/hp/hp-wmi.c:1586:27: error: incomplete definition of type 'struct platform_profile_handler'
    1586 |                 platform_profile_handler.profile_set = platform_profile_omen_set;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/hp/hp-wmi.c:1588:58: error: incomplete definition of type 'struct platform_profile_handler'
    1588 |                 set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
         |                                                ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/hp/hp-wmi.c:1602:27: error: incomplete definition of type 'struct platform_profile_handler'
    1602 |                 platform_profile_handler.profile_get = platform_profile_victus_get;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/hp/hp-wmi.c:1603:27: error: incomplete definition of type 'struct platform_profile_handler'
    1603 |                 platform_profile_handler.profile_set = platform_profile_victus_set;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/hp/hp-wmi.c:1605:59: error: incomplete definition of type 'struct platform_profile_handler'
    1605 |                 set_bit(PLATFORM_PROFILE_QUIET, platform_profile_handler.choices);
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/hp/hp-wmi.c:1620:27: error: incomplete definition of type 'struct platform_profile_handler'
    1620 |                 platform_profile_handler.profile_get = hp_wmi_platform_profile_get;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/hp/hp-wmi.c:1621:27: error: incomplete definition of type 'struct platform_profile_handler'
    1621 |                 platform_profile_handler.profile_set = hp_wmi_platform_profile_set;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/hp/hp-wmi.c:1623:59: error: incomplete definition of type 'struct platform_profile_handler'
    1623 |                 set_bit(PLATFORM_PROFILE_QUIET, platform_profile_handler.choices);
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/hp/hp-wmi.c:1624:58: error: incomplete definition of type 'struct platform_profile_handler'
    1624 |                 set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
         |                                                ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/hp/hp-wmi.c:1627:61: error: incomplete definition of type 'struct platform_profile_handler'
    1627 |         set_bit(PLATFORM_PROFILE_BALANCED, platform_profile_handler.choices);
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/hp/hp-wmi.c:1628:64: error: incomplete definition of type 'struct platform_profile_handler'
    1628 |         set_bit(PLATFORM_PROFILE_PERFORMANCE, platform_profile_handler.choices);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   drivers/platform/x86/hp/hp-wmi.c:1630:59: error: too few arguments to function call, expected 4, have 1
    1630 |         err = platform_profile_register(&platform_profile_handler);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~                          ^
   include/linux/platform_profile.h:37:16: note: 'platform_profile_register' declared here
      37 | struct device *platform_profile_register(struct device *dev, const char *name,
         |                ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      38 |                                          void *drvdata,
         |                                          ~~~~~~~~~~~~~~
      39 |                                          const struct platform_profile_ops *ops);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/hp/hp-wmi.c:1694:27: error: too few arguments to function call, single argument 'dev' was not specified
    1694 |                 platform_profile_remove();
         |                 ~~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/platform_profile.h:40:5: note: 'platform_profile_remove' declared here
      40 | int platform_profile_remove(struct device *dev);
         |     ^                       ~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/hp/hp-wmi.c:276:40: error: tentative definition has type 'struct platform_profile_handler' that is never completed
     276 | static struct platform_profile_handler platform_profile_handler;
         |                                        ^
   drivers/platform/x86/hp/hp-wmi.c:276:15: note: forward declaration of 'struct platform_profile_handler'
     276 | static struct platform_profile_handler platform_profile_handler;
         |               ^
   1 warning and 15 errors generated.


vim +276 drivers/platform/x86/hp/hp-wmi.c

d23430233494411 drivers/platform/x86/hp/hp-wmi.c Alexis Belmonte 2024-07-08  272  
62ec30d45ecbb85 drivers/misc/hp-wmi.c            Matthew Garrett 2008-07-25  273  static struct input_dev *hp_wmi_input_dev;
604915f1c7b22a9 drivers/platform/x86/hp/hp-wmi.c Jonathan Singer 2023-04-26  274  static struct input_dev *camera_shutter_input_dev;
62ec30d45ecbb85 drivers/misc/hp-wmi.c            Matthew Garrett 2008-07-25  275  static struct platform_device *hp_wmi_platform_dev;
4296f679ca50f97 drivers/platform/x86/hp-wmi.c    Elia Devito     2021-02-21 @276  static struct platform_profile_handler platform_profile_handler;
d23430233494411 drivers/platform/x86/hp/hp-wmi.c Alexis Belmonte 2024-07-08  277  static struct notifier_block platform_power_source_nb;
d23430233494411 drivers/platform/x86/hp/hp-wmi.c Alexis Belmonte 2024-07-08  278  static enum platform_profile_option active_platform_profile;
4296f679ca50f97 drivers/platform/x86/hp-wmi.c    Elia Devito     2021-02-21  279  static bool platform_profile_support;
65f936f3535950d drivers/platform/x86/hp-wmi.c    Bedant Patnaik  2022-06-09  280  static bool zero_insize_support;
62ec30d45ecbb85 drivers/misc/hp-wmi.c            Matthew Garrett 2008-07-25  281  

:::::: The code at line 276 was first introduced by commit
:::::: 4296f679ca50f97c4973715f1e9e72357d2eb251 platform/x86: hp-wmi: add platform profile support

:::::: TO: Elia Devito <eliadevito@gmail.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
