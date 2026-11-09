Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200114;
	b=pPKpKlMibKDYVQmOhXM6crNeijrnVMv70yVU6H+jhBNb4Gx1y9Bvbm1HKQVQdRdIEJwN
	 ewBid9sBfs0UH4G17M/LDybQuZqdG5Aweih5Wgjc2mN4a2TMGSaxZCV1jx00Tj8deocD7
	 oPnopDpLADQo/8abC1rV9KV7GHs36+XGAvwnwpEImnjlAU+h3NApN+5tis8Y/DlUIicCN
	 o0/FcafPi56l1pmS+t4qIgoFfF5Bu/scrLNFFq/FJQxpl80QTVXIjoVD55+GnQfqtaJxB
	 qI9usopGkOAJhweU8AUXuO5UCDnjbh6LyadT56SdtpKMAad1mO0s3Kd27kYX6I/0XPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200114;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=zf+xQOwW5HSsGHucKYYThPTgEXkuCRUTz4UFZ4uYMBA=;
	b=M9Pt8KIu0RxcznjPec1ETgMZYz3WDVS6NwmR4LDnkPwgLZC3b2HYtE1OnNbrP0C6bqVg
	 Du0I4wOoTR/zlpbKd0cxkydIhKpSm1g9w8g2RSpuOYvxIoxbefD0m6VEyvwBez7hqH6De
	 HLSABHPEbk2BUAH6spGZMYcS/IlvfHQbA/qKuGOk3PSj5IXOqrgzhY4gGFrv94w7W6Ai9
	 utWj1DccZJE7gNIzIUzZnQmrxrS2Uq9O++RQTYTCgxb18KU2nk38DKA/SHTHeDgT1t++h
	 SsdALlN/HBmFPQgIR4cKzAOhbDW+YbUyzQEje1TzTCyFqrb7Rn7XFFLseEMzh3ZUAOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VJNR5HSM;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568D4606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 04:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VJNR5HSM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794200114; x=1825736114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ihjfK2qb6kEMB/XzExil25GYI44OKmaizuQVXqNldgg=;
  b=VJNR5HSMAMfTmYoRXAMzA+n/Z2ZJaUlYQvh3BcoOuOUBj+/1+T/0zh2C
   rD5bhxC6UFoDvevfDFXODxKJAZwRslhGwsRGKF4dfgzPGdt/3cFiFGTmL
   xTQNLwvv/E2Xec5rMI6kxVycjdZZykz8TickFJKXbebQUE7NoWec8OZGW
   aZb3xFmLx/gcNA990dNhfR0B12UBSYFcIiiC3YRyKfiIfIBZblcKHUCkJ
   Q8S5No3DTxPJAiBMUQXJsytVM+A0DMIMRbCD+T1KNxKSd7jEnEX/xrWQi
   Nvf1uoNYyelXPOxGKlsg4snjLu0s0oRe1L/lLFkG/dCpqHTyFuNQkKnpy
   w==;
X-CSE-ConnectionGUID: Jdzg0ypDSteahB4jQxuo8g==
X-CSE-MsgGUID: LHsItPz1Q7W4LwZHiP7QTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2910027"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2910027"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 20:55:13 -0800
X-CSE-ConnectionGUID: 1H7ckq+ESIafnVRbRbpNJA==
X-CSE-MsgGUID: JZrdBLu2SfWe71ujrc3yvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7659419"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 08 Nov 2026 20:55:11 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQHPP-000000000DX-1u45;
	Mon, 09 Nov 2026 04:55:07 +0000
Date: Mon, 09 Nov 2026 05:54:56 +0100
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-maple-clean 47/50] lib/dynamic_debug.c:117:22:
 warning: conversion from 'long long unsigned int' to 'long unsigned int'
 changes value from '3458764513820540928' to '0'
Message-ID: <202611090502.HTxFKNj5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-maple-clean
head:   5f7782a41d4ca319992609b6589a592f87e83006
commit: af718ee6a3256d73ee276d2c2bbbae9df0da6bfb [47/50] dyndbg: Save _ddebug_site fields into a maple-tree
config: mips-randconfig-2001-20261109 (https://download.01.org/0day-ci/archive/20261109/202611090502.HTxFKNj5-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090502.HTxFKNj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090502.HTxFKNj5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'desc_function':
>> lib/dynamic_debug.c:117:22: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '3458764513820540928' to '0' [-Woverflow]
    #define DD_TAG_FUNC  (3ULL << DD_KEY_TAG_SHIFT)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:292:61: note: in definition of macro 'DEFINE_DYNDBG_SITE_ACCESSOR'
     unsigned long key = ddebug_site_tag_key((unsigned long)dp, tag); \
                                                                ^~~
   lib/dynamic_debug.c:301:39: note: in expansion of macro 'DD_TAG_FUNC'
    DEFINE_DYNDBG_SITE_ACCESSOR(function, DD_TAG_FUNC)
                                          ^~~~~~~~~~~
   lib/dynamic_debug.c: In function 'desc_filename':
   lib/dynamic_debug.c:116:22: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '2305843009213693952' to '0' [-Woverflow]
    #define DD_TAG_FILE  (2ULL << DD_KEY_TAG_SHIFT)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:292:61: note: in definition of macro 'DEFINE_DYNDBG_SITE_ACCESSOR'
     unsigned long key = ddebug_site_tag_key((unsigned long)dp, tag); \
                                                                ^~~
   lib/dynamic_debug.c:302:39: note: in expansion of macro 'DD_TAG_FILE'
    DEFINE_DYNDBG_SITE_ACCESSOR(filename, DD_TAG_FILE)
                                          ^~~~~~~~~~~
   lib/dynamic_debug.c: In function 'desc_modname':
   lib/dynamic_debug.c:115:21: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1152921504606846976' to '0' [-Woverflow]
    #define DD_TAG_MOD  (1ULL << DD_KEY_TAG_SHIFT)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:292:61: note: in definition of macro 'DEFINE_DYNDBG_SITE_ACCESSOR'
     unsigned long key = ddebug_site_tag_key((unsigned long)dp, tag); \
                                                                ^~~
   lib/dynamic_debug.c:303:38: note: in expansion of macro 'DD_TAG_MOD'
    DEFINE_DYNDBG_SITE_ACCESSOR(modname, DD_TAG_MOD)
                                         ^~~~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_resolve_site':
   lib/dynamic_debug.c:115:21: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1152921504606846976' to '0' [-Woverflow]
    #define DD_TAG_MOD  (1ULL << DD_KEY_TAG_SHIFT)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:311:51: note: in expansion of macro 'DD_TAG_MOD'
      *mod = mtree_load(mt, ddebug_site_tag_key(addr, DD_TAG_MOD)) ?: "unknown";
                                                      ^~~~~~~~~~
   lib/dynamic_debug.c:116:22: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '2305843009213693952' to '0' [-Woverflow]
    #define DD_TAG_FILE  (2ULL << DD_KEY_TAG_SHIFT)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:313:52: note: in expansion of macro 'DD_TAG_FILE'
      *file = mtree_load(mt, ddebug_site_tag_key(addr, DD_TAG_FILE)) ?: "unknown";
                                                       ^~~~~~~~~~~
>> lib/dynamic_debug.c:117:22: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '3458764513820540928' to '0' [-Woverflow]
    #define DD_TAG_FUNC  (3ULL << DD_KEY_TAG_SHIFT)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:315:52: note: in expansion of macro 'DD_TAG_FUNC'
      *func = mtree_load(mt, ddebug_site_tag_key(addr, DD_TAG_FUNC)) ?: "unknown";
                                                       ^~~~~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_condense_sites':
>> lib/dynamic_debug.c:117:22: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '3458764513820540928' to '0' [-Woverflow]
    #define DD_TAG_FUNC  (3ULL << DD_KEY_TAG_SHIFT)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1825:35: note: in expansion of macro 'DD_TAG_FUNC'
         "func", ddebug_get_function, DD_TAG_FUNC);
                                      ^~~~~~~~~~~
   lib/dynamic_debug.c:116:22: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '2305843009213693952' to '0' [-Woverflow]
    #define DD_TAG_FILE  (2ULL << DD_KEY_TAG_SHIFT)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1827:35: note: in expansion of macro 'DD_TAG_FILE'
         "file", ddebug_get_filename, DD_TAG_FILE);
                                      ^~~~~~~~~~~
   lib/dynamic_debug.c:115:21: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1152921504606846976' to '0' [-Woverflow]
    #define DD_TAG_MOD  (1ULL << DD_KEY_TAG_SHIFT)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1829:32: note: in expansion of macro 'DD_TAG_MOD'
        "mod", ddebug_get_modname, DD_TAG_MOD);
                                   ^~~~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_module_sites_clear':
   lib/dynamic_debug.c:115:21: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1152921504606846976' to '0' [-Woverflow]
    #define DD_TAG_MOD  (1ULL << DD_KEY_TAG_SHIFT)
                        ^
   lib/dynamic_debug.c:1968:27: note: in expansion of macro 'DD_TAG_MOD'
     unsigned long tags[] = { DD_TAG_MOD, DD_TAG_FILE, DD_TAG_FUNC };
                              ^~~~~~~~~~
   lib/dynamic_debug.c:116:22: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '2305843009213693952' to '0' [-Woverflow]
    #define DD_TAG_FILE  (2ULL << DD_KEY_TAG_SHIFT)
                         ^
   lib/dynamic_debug.c:1968:39: note: in expansion of macro 'DD_TAG_FILE'
     unsigned long tags[] = { DD_TAG_MOD, DD_TAG_FILE, DD_TAG_FUNC };
                                          ^~~~~~~~~~~
>> lib/dynamic_debug.c:117:22: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '3458764513820540928' to '0' [-Woverflow]
    #define DD_TAG_FUNC  (3ULL << DD_KEY_TAG_SHIFT)
                         ^
   lib/dynamic_debug.c:1968:52: note: in expansion of macro 'DD_TAG_FUNC'
     unsigned long tags[] = { DD_TAG_MOD, DD_TAG_FILE, DD_TAG_FUNC };
                                                       ^~~~~~~~~~~


vim +117 lib/dynamic_debug.c

   112	
   113	#define DD_KEY_TAG_SHIFT	60
   114	#define DD_KEY_TAG_MASK		(0xFULL << DD_KEY_TAG_SHIFT)
   115	#define DD_TAG_MOD		(1ULL << DD_KEY_TAG_SHIFT)
   116	#define DD_TAG_FILE		(2ULL << DD_KEY_TAG_SHIFT)
 > 117	#define DD_TAG_FUNC		(3ULL << DD_KEY_TAG_SHIFT)
   118	#define DD_KEY_ADDR_MASK	(~DD_KEY_TAG_MASK)
   119	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
