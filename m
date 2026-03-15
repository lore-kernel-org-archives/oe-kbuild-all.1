Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851FE367F5C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Mar 2026 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773587620; cv=none; b=e+AgQKc+IZidaxTh2M+xWCnf9RWo7j/asqeFc8KIeDoa1tOd0d/QhrV7Hztzcs8DOQ1rSiNQiWhHBRQDNAUCMvsbA23fHCnBNhwr7o962fVjl0Spo/DpvrxjfLwaIy+1V3X9lJff1ROnDQv1/MJzx7W7L17NcBEFNbExzDUgcAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773587620; c=relaxed/simple;
	bh=TZis4O8DFtcPXn/9HxmGgtxBz7UgK8O2WFIYCF/xGhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSrp1sGemBjCXtm3IB+xkiq/T5JS/LF3ZR2xAJFjB1H0m3sJgnuP49i0psddq7j+oXsoFJ62h08oTqO0Q8UMBd/txuZBnYsH6m2Lry7UlpsS7UmKcVrxYRxU2a5HfLRS1lkVZWLwMofsgbLHAyguQy7h0KsmGDJRxy5XFxcmMPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3aES4uG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3aES4uG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773587619; x=1805123619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TZis4O8DFtcPXn/9HxmGgtxBz7UgK8O2WFIYCF/xGhs=;
  b=h3aES4uGe/rdj6EIljTyCa5AZ4kmZsegoVq/KeNEDqQTOdox7ygNXPdj
   T6G7zE5a7KcAn+FeNzPis24LHtoB11RtlKqVjNYfJPgZZL4VxRhmzk8yk
   mt7Eck5lfClFjwWoiJidH0N1bSjj0Y6Ln8fdxl+d3AMEDiLNDuOr1u+0b
   Tzdu+GOjyDEl+r9+GzjWtdGVwmZ1ac11vV8/Sz1Cay8nSmcizlW/qGHwf
   HI8B0VszJXifhPnZUogpXWl7acYKjKqZCy6WsmmLp/AlBbitnCT6Q1cnI
   d/ODxogbp3WBpHSqU67HHyv+vSA97GuehIzRAru8BDNrWF2W/eqO+EHmr
   Q==;
X-CSE-ConnectionGUID: r4oMrC2fRe+IV3fXzRW6cQ==
X-CSE-MsgGUID: G1FSy07+RQ6bUxSGfNvifg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74326090"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="74326090"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 08:13:38 -0700
X-CSE-ConnectionGUID: aD5bVVxrRZ2YXXHHM9tdzA==
X-CSE-MsgGUID: xXI7F7+RQOmyq01u3PUlxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="244710501"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 Mar 2026 08:13:36 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1n9p-0000000044X-3oDH;
	Sun, 15 Mar 2026 15:13:33 +0000
Date: Sun, 15 Mar 2026 16:12:41 +0100
From: kernel test robot <lkp@intel.com>
To: hamjin <jinham@qq.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, hamjin <jinham@qq.com>
Subject: Re: [PATCH] lib: typecheck: initialize const variable to avoid Clang
 warning
Message-ID: <202603151603.CY7ALlB0-lkp@intel.com>
References: <tencent_274FD06231C70768C2C28FD13673A24C2B08@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_274FD06231C70768C2C28FD13673A24C2B08@qq.com>

Hi hamjin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc3 next-20260313]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hamjin/lib-typecheck-initialize-const-variable-to-avoid-Clang-warning/20260315-165617
base:   linus/master
patch link:    https://lore.kernel.org/r/tencent_274FD06231C70768C2C28FD13673A24C2B08%40qq.com
patch subject: [PATCH] lib: typecheck: initialize const variable to avoid Clang warning
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260315/202603151603.CY7ALlB0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603151603.CY7ALlB0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603151603.CY7ALlB0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:7,
                    from include/linux/log2.h:12,
                    from include/asm-generic/getorder.h:8,
                    from arch/x86/include/asm/page.h:84,
                    from arch/x86/include/asm/processor.h:20,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from drivers/net/wireless/ralink/rt2x00/rt2x00mmio.c:13:
   drivers/net/wireless/ralink/rt2x00/rt2x00mmio.c: In function 'rt2x00mmio_regbusy_read':
>> drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:254:33: error: conversion to non-scalar type requested
     254 |         GET_FIELD(__reg, struct rt2x00_field32, __field)
         |                                 ^~~~~~~~~~~~~~
   include/linux/typecheck.h:10:9: note: in definition of macro 'typecheck'
      10 | ({      type __dummy; \
         |         ^~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:254:9: note: in expansion of macro 'GET_FIELD'
     254 |         GET_FIELD(__reg, struct rt2x00_field32, __field)
         |         ^~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00mmio.c:36:22: note: in expansion of macro 'rt2x00_get_field32'
      36 |                 if (!rt2x00_get_field32(*reg, field))
         |                      ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/bitops.h:7,
                    from include/linux/kernel.h:23,
                    from drivers/net/wireless/ralink/rt2x00/rt2x00usb.c:14:
   drivers/net/wireless/ralink/rt2x00/rt2x00usb.c: In function 'rt2x00usb_regbusy_read':
>> drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:254:33: error: conversion to non-scalar type requested
     254 |         GET_FIELD(__reg, struct rt2x00_field32, __field)
         |                                 ^~~~~~~~~~~~~~
   include/linux/typecheck.h:10:9: note: in definition of macro 'typecheck'
      10 | ({      type __dummy; \
         |         ^~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:254:9: note: in expansion of macro 'GET_FIELD'
     254 |         GET_FIELD(__reg, struct rt2x00_field32, __field)
         |         ^~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00usb.c:157:22: note: in expansion of macro 'rt2x00_get_field32'
     157 |                 if (!rt2x00_get_field32(*reg, field))
         |                      ^~~~~~~~~~~~~~~~~~
--
    2173 |         rt2x00_set_field32(&reg, GF40_PROT_CFG_PROTECT_CTRL, gf40_mode);
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800.h:1539:41: note: in expansion of macro 'FIELD32'
    1539 | #define GF40_PROT_CFG_PROTECT_CTRL      FIELD32(0x00030000)
         |                                         ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2173:34: note: in expansion of macro 'GF40_PROT_CFG_PROTECT_CTRL'
    2173 |         rt2x00_set_field32(&reg, GF40_PROT_CFG_PROTECT_CTRL, gf40_mode);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c: In function 'rt2800_config_erp':
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:230:17: error: conversion to non-scalar type requested
     230 |         (struct rt2x00_field32) {               \
         |                 ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:38: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2 = (typeof(x))0; \
         |                                      ^
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:252:9: note: in expansion of macro 'SET_FIELD'
     252 |         SET_FIELD(__reg, struct rt2x00_field32, __field, __value)
         |         ^~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2184:17: note: in expansion of macro 'rt2x00_set_field32'
    2184 |                 rt2x00_set_field32(&reg, AUTO_RSP_CFG_AR_PREAMBLE,
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800.h:1790:41: note: in expansion of macro 'FIELD32'
    1790 | #define AUTO_RSP_CFG_AR_PREAMBLE        FIELD32(0x00000010)
         |                                         ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2184:42: note: in expansion of macro 'AUTO_RSP_CFG_AR_PREAMBLE'
    2184 |                 rt2x00_set_field32(&reg, AUTO_RSP_CFG_AR_PREAMBLE,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:230:17: error: conversion to non-scalar type requested
     230 |         (struct rt2x00_field32) {               \
         |                 ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:38: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2 = (typeof(x))0; \
         |                                      ^
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:252:9: note: in expansion of macro 'SET_FIELD'
     252 |         SET_FIELD(__reg, struct rt2x00_field32, __field, __value)
         |         ^~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2191:17: note: in expansion of macro 'rt2x00_set_field32'
    2191 |                 rt2x00_set_field32(&reg, OFDM_PROT_CFG_PROTECT_CTRL,
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800.h:1475:41: note: in expansion of macro 'FIELD32'
    1475 | #define OFDM_PROT_CFG_PROTECT_CTRL      FIELD32(0x00030000)
         |                                         ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2191:42: note: in expansion of macro 'OFDM_PROT_CFG_PROTECT_CTRL'
    2191 |                 rt2x00_set_field32(&reg, OFDM_PROT_CFG_PROTECT_CTRL,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:230:17: error: conversion to non-scalar type requested
     230 |         (struct rt2x00_field32) {               \
         |                 ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:38: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2 = (typeof(x))0; \
         |                                      ^
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:252:9: note: in expansion of macro 'SET_FIELD'
     252 |         SET_FIELD(__reg, struct rt2x00_field32, __field, __value)
         |         ^~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2204:17: note: in expansion of macro 'rt2x00_set_field32'
    2204 |                 rt2x00_set_field32(&reg, BKOFF_SLOT_CFG_SLOT_TIME,
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800.h:918:41: note: in expansion of macro 'FIELD32'
     918 | #define BKOFF_SLOT_CFG_SLOT_TIME        FIELD32(0x000000ff)
         |                                         ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2204:42: note: in expansion of macro 'BKOFF_SLOT_CFG_SLOT_TIME'
    2204 |                 rt2x00_set_field32(&reg, BKOFF_SLOT_CFG_SLOT_TIME,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:230:17: error: conversion to non-scalar type requested
     230 |         (struct rt2x00_field32) {               \
         |                 ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:38: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2 = (typeof(x))0; \
         |                                      ^
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:252:9: note: in expansion of macro 'SET_FIELD'
     252 |         SET_FIELD(__reg, struct rt2x00_field32, __field, __value)
         |         ^~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2209:17: note: in expansion of macro 'rt2x00_set_field32'
    2209 |                 rt2x00_set_field32(&reg, XIFS_TIME_CFG_EIFS, erp->eifs);
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800.h:911:41: note: in expansion of macro 'FIELD32'
     911 | #define XIFS_TIME_CFG_EIFS              FIELD32(0x1ff00000)
         |                                         ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2209:42: note: in expansion of macro 'XIFS_TIME_CFG_EIFS'
    2209 |                 rt2x00_set_field32(&reg, XIFS_TIME_CFG_EIFS, erp->eifs);
         |                                          ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:230:17: error: conversion to non-scalar type requested
     230 |         (struct rt2x00_field32) {               \
         |                 ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:38: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2 = (typeof(x))0; \
         |                                      ^
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:252:9: note: in expansion of macro 'SET_FIELD'
     252 |         SET_FIELD(__reg, struct rt2x00_field32, __field, __value)
         |         ^~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2215:17: note: in expansion of macro 'rt2x00_set_field32'
    2215 |                 rt2x00_set_field32(&reg, BCN_TIME_CFG_BEACON_INTERVAL,
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800.h:958:41: note: in expansion of macro 'FIELD32'
     958 | #define BCN_TIME_CFG_BEACON_INTERVAL    FIELD32(0x0000ffff)
         |                                         ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2215:42: note: in expansion of macro 'BCN_TIME_CFG_BEACON_INTERVAL'
    2215 |                 rt2x00_set_field32(&reg, BCN_TIME_CFG_BEACON_INTERVAL,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c: In function 'rt2800_wait_bbp_rf_ready':
>> drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:254:33: error: conversion to non-scalar type requested
     254 |         GET_FIELD(__reg, struct rt2x00_field32, __field)
         |                                 ^~~~~~~~~~~~~~
   include/linux/typecheck.h:10:9: note: in definition of macro 'typecheck'
      10 | ({      type __dummy; \
         |         ^~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:254:9: note: in expansion of macro 'GET_FIELD'
     254 |         GET_FIELD(__reg, struct rt2x00_field32, __field)
         |         ^~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2233:22: note: in expansion of macro 'rt2x00_get_field32'
    2233 |                 if (!rt2x00_get_field32(reg, mask))
         |                      ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c: In function 'rt2800_config_3572bt_ant':
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:230:17: error: conversion to non-scalar type requested
     230 |         (struct rt2x00_field32) {               \
         |                 ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:38: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2 = (typeof(x))0; \
         |                                      ^
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:252:9: note: in expansion of macro 'SET_FIELD'
     252 |         SET_FIELD(__reg, struct rt2x00_field32, __field, __value)
         |         ^~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2275:17: note: in expansion of macro 'rt2x00_set_field32'
    2275 |                 rt2x00_set_field32(&reg, GPIO_SWITCH_0, 1);
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800.h:697:41: note: in expansion of macro 'FIELD32'
     697 | #define GPIO_SWITCH_0                   FIELD32(0x00000001)
         |                                         ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2275:42: note: in expansion of macro 'GPIO_SWITCH_0'
    2275 |                 rt2x00_set_field32(&reg, GPIO_SWITCH_0, 1);
         |                                          ^~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:230:17: error: conversion to non-scalar type requested
     230 |         (struct rt2x00_field32) {               \
         |                 ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:38: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2 = (typeof(x))0; \
         |                                      ^
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:252:9: note: in expansion of macro 'SET_FIELD'
     252 |         SET_FIELD(__reg, struct rt2x00_field32, __field, __value)
         |         ^~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2276:17: note: in expansion of macro 'rt2x00_set_field32'
    2276 |                 rt2x00_set_field32(&reg, GPIO_SWITCH_1, 1);
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800.h:698:41: note: in expansion of macro 'FIELD32'
     698 | #define GPIO_SWITCH_1                   FIELD32(0x00000002)
         |                                         ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2276:42: note: in expansion of macro 'GPIO_SWITCH_1'
    2276 |                 rt2x00_set_field32(&reg, GPIO_SWITCH_1, 1);
         |                                          ^~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:230:17: error: conversion to non-scalar type requested
     230 |         (struct rt2x00_field32) {               \
         |                 ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:38: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2 = (typeof(x))0; \
         |                                      ^
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:252:9: note: in expansion of macro 'SET_FIELD'
     252 |         SET_FIELD(__reg, struct rt2x00_field32, __field, __value)
         |         ^~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2278:17: note: in expansion of macro 'rt2x00_set_field32'
    2278 |                 rt2x00_set_field32(&reg, GPIO_SWITCH_0, 0);
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800.h:697:41: note: in expansion of macro 'FIELD32'
     697 | #define GPIO_SWITCH_0                   FIELD32(0x00000001)
         |                                         ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2278:42: note: in expansion of macro 'GPIO_SWITCH_0'
    2278 |                 rt2x00_set_field32(&reg, GPIO_SWITCH_0, 0);
         |                                          ^~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:230:17: error: conversion to non-scalar type requested
     230 |         (struct rt2x00_field32) {               \
         |                 ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:38: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2 = (typeof(x))0; \
         |                                      ^
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:252:9: note: in expansion of macro 'SET_FIELD'
     252 |         SET_FIELD(__reg, struct rt2x00_field32, __field, __value)
         |         ^~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2279:17: note: in expansion of macro 'rt2x00_set_field32'
    2279 |                 rt2x00_set_field32(&reg, GPIO_SWITCH_1, 0);
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800.h:698:41: note: in expansion of macro 'FIELD32'
     698 | #define GPIO_SWITCH_1                   FIELD32(0x00000002)
         |                                         ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2279:42: note: in expansion of macro 'GPIO_SWITCH_1'
    2279 |                 rt2x00_set_field32(&reg, GPIO_SWITCH_1, 0);
         |                                          ^~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:230:17: error: conversion to non-scalar type requested
     230 |         (struct rt2x00_field32) {               \
         |                 ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:38: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2 = (typeof(x))0; \
         |                                      ^
   drivers/net/wireless/ralink/rt2x00/rt2x00reg.h:254:9: note: in expansion of macro 'GET_FIELD'
     254 |         GET_FIELD(__reg, struct rt2x00_field32, __field)
         |         ^~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2284:22: note: in expansion of macro 'rt2x00_get_field32'
    2284 |         led_g_mode = rt2x00_get_field32(reg, LED_CFG_LED_POLAR) ? 3 : 0;
         |                      ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800.h:871:41: note: in expansion of macro 'FIELD32'
     871 | #define LED_CFG_LED_POLAR               FIELD32(0x40000000)
         |                                         ^~~~~~~
   drivers/net/wireless/ralink/rt2x00/rt2800lib.c:2284:46: note: in expansion of macro 'LED_CFG_LED_POLAR'


vim +254 drivers/net/wireless/ralink/rt2x00/rt2x00reg.h

c483bb4cbdeb24 drivers/net/wireless/rt2x00/rt2x00reg.h Ivo van Doorn 2008-06-03  250  
c483bb4cbdeb24 drivers/net/wireless/rt2x00/rt2x00reg.h Ivo van Doorn 2008-06-03  251  #define rt2x00_set_field32(__reg, __field, __value) \
c483bb4cbdeb24 drivers/net/wireless/rt2x00/rt2x00reg.h Ivo van Doorn 2008-06-03  252  	SET_FIELD(__reg, struct rt2x00_field32, __field, __value)
c483bb4cbdeb24 drivers/net/wireless/rt2x00/rt2x00reg.h Ivo van Doorn 2008-06-03  253  #define rt2x00_get_field32(__reg, __field) \
c483bb4cbdeb24 drivers/net/wireless/rt2x00/rt2x00reg.h Ivo van Doorn 2008-06-03 @254  	GET_FIELD(__reg, struct rt2x00_field32, __field)
c483bb4cbdeb24 drivers/net/wireless/rt2x00/rt2x00reg.h Ivo van Doorn 2008-06-03  255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
