Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230511;
	b=xUlCSW79jaxKGge6/hJHzEGhSMgAKBhndIHK25nUwi3zBSWY+DuMhr38GlT4GyhLEKRa
	 /QtlQXs7QSXEAypHzc4VBuFafpd5TV8AoubqtaM+3C6QoKJZLcVG/VwcsBvkusGSweloy
	 VVxGqsIVl56xf91Rehz+5t13v1zyhbdSEGxMtXJn75G8VE4L5NodPDwo9QVB9Jc+CuUPW
	 2C+HD2j0rfbJGf5TNFme8r1BUpaiY8GL2z9U79WClYuh/ELsaT3beFh2HZgTMAWRJ6hL9
	 zWm+miYVfDmioKBkehpy/P1t1m7z7JFMyS2DrshIJTNeRO18nErfC/mK3kR+4RSSdwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230511;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LUmHA0E/rXoCSNTG7nqLle2sz+ICyGXmqJ7l/gteU0o=;
	b=iApmmDylRQdY1T0nWrbNSh4/b7cU9H0jt+bdx+vYHR3ZdQoRMBIdARXm+2TQ7Sr6RX6U
	 8rmE0Bv/eRgJPTEm6K7r4vcZ+WgWFKBo1Nm/dfU8O3Rc6vyT36Aa+pBe8E3H7jjIDAneI
	 Z+KLJJsfRRwzO9m2d+EDX+E7Z6AMlZr4OGZpuVMP0nbGj9PXG0kq78X5Q5XxVcQfAo8+t
	 dlODvJlt3nLNs8dlGJkjo7f1hIT4s2g38LbO2oOEhEFVBgT2uAvVf2N1TewLEYfbQXbmq
	 QhyjGv3eMHybUX0K0TXFaF7B0J66aLQsJeMnmwQx+ZucRObyOINEFBf1U1QCLOkT2iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ncdmh8c7;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B68C606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 13:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B68C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ncdmh8c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794230510; x=1825766510;
  h=date:from:to:cc:subject:message-id;
  bh=tmE9ieAg+1geU4YtUaGwrudb5brus7GdF7jQM2TkWhg=;
  b=ncdmh8c7B7cvQIQ+RPfvSZGNmm1dSHRJxQzY6P9bODLHlOGIDMvulH8T
   ci2ZjgkJEyKiVLXUjYLoWnrNL7lZeHnnpYbtoQIM2lIzbsK5JvdcO8B41
   lxat9CmY8AizuG4oG5nxPO9iTL2NjBF14PVJqVW9q/MdD5pbRUyPl9oFC
   x2EKnin0lNqmVmMTi3yYpWGHyxntlk1ScOxiSQZYS9PhFda2xjxz/nuYN
   0QjH7r8OmbB1xdVnOEhCDl1pCpuXuAlB2mScoNoVheXYYHy1WrfrgbH1W
   /V5dwj3S11zbN9Flb6iLXPnw9/OoJ7kccm+sdUunQty8j/A41q8lnTR5f
   w==;
X-CSE-ConnectionGUID: aado/cHpR6220LdPTJn2Yg==
X-CSE-MsgGUID: rwKuXieIS3Wu9seG7RjE5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2983303"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2983303"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 05:21:49 -0800
X-CSE-ConnectionGUID: ODXKQIgqSfSKkJ+YCKBRrA==
X-CSE-MsgGUID: /hEUMQ+dQOWRG1BW0mPISA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7989558"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Nov 2026 05:21:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQPJh-00000000uZ1-0fgK;
	Mon, 09 Nov 2026 13:21:45 +0000
Date: Mon, 09 Nov 2026 21:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V15 10/35]
 include/linux/printk.h:109:25: warning: format '%llX' expects argument of
 type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka
 'unsigned int'}
Message-ID: <202611092137.dce1LEfL-lkp@intel.com>
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
config: sh-randconfig-1000-20261109 (https://download.01.org/0day-ci/archive/20261109/202611092137.dce1LEfL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611092137.dce1LEfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611092137.dce1LEfL-lkp@intel.com/

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
--
   In file included from include/linux/device.h:15,
                    from telemetry.c:13:
   telemetry.c: In function 'scmi_telemetry_area_check':
>> include/linux/printk.h:109:25: warning: format '%llX' expects argument of type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
     109 | #define FW_BUG          "[Firmware Bug]: "
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   telemetry.c:355:17: note: in expansion of macro 'dev_err'
     355 |                 dev_err(dev, FW_BUG "%s phys_addr (0x%llX) pointer too big.\n",
         |                 ^~~~~~~
   telemetry.c:355:30: note: in expansion of macro 'FW_BUG'
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
   telemetry.c:361:17: note: in expansion of macro 'dev_err'
     361 |                 dev_err(dev, FW_BUG "%s phys_addr (0x%llX) misaligned.\n",
         |                 ^~~~~~~
   telemetry.c:361:30: note: in expansion of macro 'FW_BUG'
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
   telemetry.c:373:17: note: in expansion of macro 'dev_err'
     373 |                 dev_err(dev, FW_BUG "%s area (0x%llX/%u) wrap-around.\n",
         |                 ^~~~~~~
   telemetry.c:373:30: note: in expansion of macro 'FW_BUG'
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
