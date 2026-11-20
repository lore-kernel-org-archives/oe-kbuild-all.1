Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216921;
	b=aPTEOkWQA0sBx9IMvMjR8huQVIJbf6Unn9eQPHKa9NEMikuiv4fjKUAJFAuhIOKxdoJ4
	 Y3wW2TCi3YR/bB4WCvBoQ0kpdkREKxJRdRADKBCJfVtCDIscB81bkYSKKUlt42vt0HdiR
	 WE+hre9qeX2CA8yDUGybAvoIIz9S1kEB5A59LNEO1WWXbjBR6K5kdxNLaLjj6+OhuUCM9
	 WdQSragYI9TYE0PlvxJqs1k3GWvz9IpjGVQKji1qVboNw/6Fxna9HCw/OO69sPka+sR9v
	 d8pSKvjLyJc1GTEdHpwVRtCHnX3SQNbSAngbPYa8unZQ3qVGqnVonnSFfCb/ZtkSJbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216921;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BNRdMXPe/2X/wVaqnzQo1CIQw4o6jkqBUaeCyZSzn2s=;
	b=K5xP8L20j4kkI4yTxn4d8QKXBSxep6drEkdb4/Y+q8pY2TPVWbjz52RN0zxnOmpgVxeT
	 Iy1X6c4AA2l0vyoZQWhQzfTaW7d/BMd0VVmK3oxQIaJjXCbaacQaMuhk/uZe1zaDduhsk
	 ncsXx55MzltjO4POuWtnDeravEOQmm1vuYyIL+DKDnRqRQSsDxa4aO08FzxQpDPkVA42V
	 gv8FV9fXQZSz+ybSsTfejl+aAYgrE2jAFemd2X7KqWjKcAFoK2xnXJQjeSCTtm01Z6Hrs
	 Y2Bk5RjXI02o4BUb9cephtTB2ZWbcmpQWHuGVd+qVk5BFRIV9V/AcqUZw0m05gFkgrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OAQRVdBm;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F43606A682
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 23:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9F43606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OAQRVdBm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795216916; x=1826752916;
  h=date:from:to:cc:subject:message-id;
  bh=z93fIsu/vpEjImZWdx4QsWA70fL8+qznp2dlMh55lYE=;
  b=OAQRVdBm2CiGZY2FPtkZV8g+StKLebdEMuZB6Lc92T9DkCSnAyBoiTPz
   tXaDraltRZ8L6Y7XQVKuGr3S8e0l0kUaMhnaRYkrJTph6Flsium66bAhA
   mhJ/wyQk9WfoUQ+d4uiPl3plQ7Y1epC+UkyVy5v/zcxOQsyKxGipx+fhN
   FXgJHCmOd5kzpYbbjYZ6omOqOTUaWYT6U5K57hBHPGeGhoFij2BXck934
   hxw2znCptNpqGi2HCiLBc6RN+xTGapYymSVPKCPOswN5tVRWw1wQq8AFz
   OZzq1sQwl0fsbMdGQ0QvVZai5PFhl4NnBmPfmeI0wL1YOflGVgtzSU91W
   w==;
X-CSE-ConnectionGUID: Gcbw1sNZSIivFbfpkWwAaQ==
X-CSE-MsgGUID: FloZe3BcTb2zUsOMwptg5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4020236"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4020236"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:21:56 -0800
X-CSE-ConnectionGUID: lbdwfDnDS6mcPKqGl9D1Ww==
X-CSE-MsgGUID: CjgM4audQqWYJD/UVq2Iig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11025834"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2026 15:21:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUXvU-0000000049d-216Y;
	Fri, 20 Nov 2026 23:21:52 +0000
Date: Sat, 21 Nov 2026 00:21:47 +0100
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:b4/acpi-static-table-irq-probe-defer-v2 3/10]
 sound/pci/es1968.c:115:12: warning: 'index' defined but not used
Message-ID: <20261121001458.PUFfptJo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/acpi-static-table-irq-probe-defer-v2
head:   a75860f203b994ab67f8a876c7f568ac0f7f84c0
commit: 5df91ea5bcbef51cb967f3a07dd7c69c50681213 [3/10] ACPI: Introduce irq_get() for static fwnodes
config: i386-randconfig-r2100-20261120 (https://download.01.org/0day-ci/archive/20261121/20261121001458.PUFfptJo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121001458.PUFfptJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121001458.PUFfptJo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/i2c.h:13,
                    from include/media/v4l2-common.h:106,
                    from include/media/v4l2-subdev.h:15,
                    from include/media/v4l2-device.h:13,
                    from include/media/drv-intf/tea575x.h:14,
                    from sound/pci/es1968.c:102:
   include/linux/acpi.h: In function 'acpi_static_fwnode_add_irq':
   include/linux/acpi.h:71:10: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^~~~~~~~~~
   include/linux/acpi.h:126:22: note: in expansion of macro 'ACPI_STATIC_IRQ_FLAGS'
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from include/linux/io.h:11,
                    from sound/pci/es1968.c:83:
   sound/pci/es1968.c: At top level:
   include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:205:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     205 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:544:20: note: in expansion of macro 'ARRAY_SIZE'
     544 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:528:9: note: in expansion of macro 'module_param_array_named'
     528 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/es1968.c:129:1: note: in expansion of macro 'module_param_array'
     129 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/es1968.c:115:12: warning: 'index' defined but not used [-Wunused-variable]
     115 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 1-MAX */
         |            ^~~~~


vim +/index +115 sound/pci/es1968.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  114  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @115  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;	/* Index 1-MAX */
^1da177e4c3f41 Linus Torvalds 2005-04-16  116  static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;	/* ID for this card */
a67ff6a54095e2 Rusty Russell  2011-12-15  117  static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;	/* Enable this card */
^1da177e4c3f41 Linus Torvalds 2005-04-16  118  static int total_bufsize[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 1024 };
^1da177e4c3f41 Linus Torvalds 2005-04-16  119  static int pcm_substreams_p[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 4 };
^1da177e4c3f41 Linus Torvalds 2005-04-16  120  static int pcm_substreams_c[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 1 };
6581f4e74d8541 Takashi Iwai   2006-05-17  121  static int clock[SNDRV_CARDS];
^1da177e4c3f41 Linus Torvalds 2005-04-16  122  static int use_pm[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 2};
^1da177e4c3f41 Linus Torvalds 2005-04-16  123  static int enable_mpu[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 2};
^1da177e4c3f41 Linus Torvalds 2005-04-16  124  #ifdef SUPPORT_JOYSTICK
a67ff6a54095e2 Rusty Russell  2011-12-15  125  static bool joystick[SNDRV_CARDS];
^1da177e4c3f41 Linus Torvalds 2005-04-16  126  #endif
d4ecc83b79cc29 Hans Verkuil   2012-02-27  127  static int radio_nr[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = -1};
^1da177e4c3f41 Linus Torvalds 2005-04-16  128  

:::::: The code at line 115 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
