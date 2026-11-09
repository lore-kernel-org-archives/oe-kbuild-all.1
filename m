Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230022;
	b=3b+DTAtSCoZZNOROeP4yZvWNqUnLswMFzvw1Ej7h37CqNGvhbjgxr8CMKb1a5RAo7Lgd
	 EJi4l02Ik8ljICSwXt8cy/E0BVkT1WbSU2mHzC3GkFWqI/cs4fy/DsXh9096Emn0tKhPe
	 metXA2El77lnyglSNpvOmkVIWVBYgY/LL5/kunoo5sfOF5mf+zfoeX0moig8JXS1RXu6x
	 MA/B5ZBJihG/asGkj3XlhikAAPrf9t0S73cyckZyMhVyL/hTN+7yFGtFOUa6/U65ZXXVC
	 f+EB0kCRD0mPPIX4cNfdubT1JiEqhVGJ0hblgik+hL8QA+Csp0+JOVYp0kIPcxaxMXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230022;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WEBGySd8eDYXFEUOIoQVWxoti5esmVynoR6udnNRuzw=;
	b=Blzhsh8m4tyVWOudV4LZe6TGT6KGrQdh3IZ79PAQ1pdbDfZeSsrqWjlBK4xFCcAWgMBA
	 xGNaoNLKbeQwP4kJzy6a7nEfRXzvI2d7xHdSaIhImSmDfkFcpP/WrfCINw9g+Pw8R9NCx
	 yqrWxBSPhnBsZy7xHZp66SyGzUozHqShSuf4fI8BJGj2wY2l9F8ehsj11O57q5FfZl5Si
	 WhMljrvv4Zk+YSNhv4cLLzM+TqHyqwXiKYvbOwWtbjRt57SOjxA+n3an3WR0rnjJsODQ+
	 i/Wg3qAN5TXsNcvEQn0O7D9rzuhf4FoTXUe+qWmFFnHlCkpXxOY4JOzDtCnxn51Qk/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djuI31l5;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90F8606A326
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 13:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90F8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djuI31l5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794230020; x=1825766020;
  h=date:from:to:cc:subject:message-id;
  bh=kTyEGDagyuEf/ea47Amgpu5oVvFi94NeNqQBjvaCC34=;
  b=djuI31l5YU+u3aQk4R6IAs1TZ5EitZV7tBAU5KGQU7gNawZc+MDO8r3e
   YxdMaQL0DAtxqDr9P1v4bQSo5wlwcE3wtUmtAWL3JO1zJAjJYZjx9E6x6
   ygZAZ9IJ+uFMEDyrmUlfdzkLRyTDt2t/yk5GJ0zAzP9wkDKqUZA/CjIv+
   PjtcJFi2d87GjNDlIBZ8ufmgy1IS2MwIfw1ItVEzU6lBdUZy3nIcPSLpz
   e3lFZHacKethG9lAHnRwFVGwlAADMBSChzNeHSb4GGspWHaYLDV70B2Ic
   i3ChktoKh5FuvqkUU3eFhNTgooV6YroKJHL+CEBu1ZGlDq/S9rjW9EPKW
   A==;
X-CSE-ConnectionGUID: 2WcARvh+Twyn8HMZSoeS4Q==
X-CSE-MsgGUID: k6kzTCOUT962jEpWupU0gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2984049"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2984049"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 05:13:40 -0800
X-CSE-ConnectionGUID: iJb9PZ0RRuKbNLr6u2ZWAw==
X-CSE-MsgGUID: t5iAtLwXR0K6KZ5bQlggkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8191701"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 09 Nov 2026 05:13:39 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQPBo-000000000KN-2HTF;
	Mon, 09 Nov 2026 13:13:36 +0000
Date: Mon, 09 Nov 2026 14:12:38 +0100
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V15 10/35]
 include/linux/printk.h:109:25: warning: format '%llX' expects argument of
 type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka
 'unsigned int'}
Message-ID: <202611091427.c6pFGLd7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V15
head:   d51f22cab86f4ad2f08b4e88803f85fdffd81a62
commit: 64c4292f50171fb197737a97cf5cd8b6d378984f [10/35] firmware: arm_scmi: Add Telemetry resources enumeration
config: csky-randconfig-2200-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091427.c6pFGLd7-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091427.c6pFGLd7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091427.c6pFGLd7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/firmware/arm_scmi/telemetry.c:13:
   drivers/firmware/arm_scmi/telemetry.c: In function 'scmi_telemetry_area_check':
>> include/linux/printk.h:109:25: warning: format '%llX' expects argument of type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
     109 | #define FW_BUG          "[Firmware Bug]: "
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:355:17: note: in expansion of macro 'dev_err'
     355 |                 dev_err(dev, FW_BUG "%s phys_addr (0x%llX) pointer too big.\n",
         |                 ^~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:355:30: note: in expansion of macro 'FW_BUG'
     355 |                 dev_err(dev, FW_BUG "%s phys_addr (0x%llX) pointer too big.\n",
         |                              ^~~~~~
>> include/linux/printk.h:109:25: warning: format '%llX' expects argument of type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
     109 | #define FW_BUG          "[Firmware Bug]: "
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:361:17: note: in expansion of macro 'dev_err'
     361 |                 dev_err(dev, FW_BUG "%s phys_addr (0x%llX) misaligned.\n",
         |                 ^~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:361:30: note: in expansion of macro 'FW_BUG'
     361 |                 dev_err(dev, FW_BUG "%s phys_addr (0x%llX) misaligned.\n",
         |                              ^~~~~~
>> include/linux/printk.h:109:25: warning: format '%llX' expects argument of type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
     109 | #define FW_BUG          "[Firmware Bug]: "
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:373:17: note: in expansion of macro 'dev_err'
     373 |                 dev_err(dev, FW_BUG "%s area (0x%llX/%u) wrap-around.\n",
         |                 ^~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:373:30: note: in expansion of macro 'FW_BUG'
     373 |                 dev_err(dev, FW_BUG "%s area (0x%llX/%u) wrap-around.\n",
         |                              ^~~~~~


vim +109 include/linux/printk.h

968ab1838a5d48f Linus Torvalds 2010-11-15   88  
968ab1838a5d48f Linus Torvalds 2010-11-15   89  /*
968ab1838a5d48f Linus Torvalds 2010-11-15   90   * FW_BUG
968ab1838a5d48f Linus Torvalds 2010-11-15   91   * Add this to a message where you are sure the firmware is buggy or behaves
968ab1838a5d48f Linus Torvalds 2010-11-15   92   * really stupid or out of spec. Be aware that the responsible BIOS developer
968ab1838a5d48f Linus Torvalds 2010-11-15   93   * should be able to fix this issue or at least get a concrete idea of the
968ab1838a5d48f Linus Torvalds 2010-11-15   94   * problem by reading your message without the need of looking at the kernel
968ab1838a5d48f Linus Torvalds 2010-11-15   95   * code.
968ab1838a5d48f Linus Torvalds 2010-11-15   96   *
968ab1838a5d48f Linus Torvalds 2010-11-15   97   * Use it for definite and high priority BIOS bugs.
968ab1838a5d48f Linus Torvalds 2010-11-15   98   *
968ab1838a5d48f Linus Torvalds 2010-11-15   99   * FW_WARN
968ab1838a5d48f Linus Torvalds 2010-11-15  100   * Use it for not that clear (e.g. could the kernel messed up things already?)
968ab1838a5d48f Linus Torvalds 2010-11-15  101   * and medium priority BIOS bugs.
968ab1838a5d48f Linus Torvalds 2010-11-15  102   *
968ab1838a5d48f Linus Torvalds 2010-11-15  103   * FW_INFO
968ab1838a5d48f Linus Torvalds 2010-11-15  104   * Use this one if you want to tell the user or vendor about something
968ab1838a5d48f Linus Torvalds 2010-11-15  105   * suspicious, but generally harmless related to the firmware.
968ab1838a5d48f Linus Torvalds 2010-11-15  106   *
968ab1838a5d48f Linus Torvalds 2010-11-15  107   * Use it for information or very low priority BIOS bugs.
968ab1838a5d48f Linus Torvalds 2010-11-15  108   */
968ab1838a5d48f Linus Torvalds 2010-11-15 @109  #define FW_BUG		"[Firmware Bug]: "
968ab1838a5d48f Linus Torvalds 2010-11-15  110  #define FW_WARN		"[Firmware Warn]: "
968ab1838a5d48f Linus Torvalds 2010-11-15  111  #define FW_INFO		"[Firmware Info]: "
968ab1838a5d48f Linus Torvalds 2010-11-15  112  

:::::: The code at line 109 was first introduced by commit
:::::: 968ab1838a5d48f02f5b471aa1d0e59e2cc2ccbc include/linux/kernel.h: Move logging bits to include/linux/printk.h

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
