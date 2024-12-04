Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DDD1B85D2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 11:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733312151; cv=none; b=Z17k2CWvTGPtWEq5ThmqxO1xuarV1hxYnXbBrt1vBisnEDJJ1fomUZEVvF/9BaQIgpBxBOYiMu18z00BbQlviUkK2kdkN9xrchqgHCPQFq0oJ14gGJy/QzlgmFcaTwR7lrbGIRcwaE5EF1D89s4c3PHePTGt86I4/y2j/Z4zOlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733312151; c=relaxed/simple;
	bh=n3Q/UQB1xNaLAmJgnRTsqyETn8k3pl071AHApj9YyIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OVEVzur7nv0Ea1DWa3wwRbU+PkW0v9Uehxlj371mUS4/+jQkauUQeKC5L3rt35pcunw+yA+JLnH/CpI0PqIpWpEx0P8ETGhy2a2gXIe26lLmEt/s5w9AepVNRrWeiLtp/eQLfCZF6wnRmQ3oVvDYj+g8hZX5F96kZ8JVAGzLgs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gdh4etfn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gdh4etfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733312148; x=1764848148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n3Q/UQB1xNaLAmJgnRTsqyETn8k3pl071AHApj9YyIk=;
  b=Gdh4etfnB+1rOdjMmksQ39uxa7fGIaY3/PH0Itgxru5m4MJJe+8jnsdw
   4PD7phs/RZlAPBVjb/eu5UeaESYH2ltG/IjErKmydUvUJM2WM4gfhDPBd
   IrDAtT5rPvb7rkKDTAf0EYfWCqYUlAi48GPXRfQdamPaYqHeBIQXAtxZ0
   3YeMh9m4tsZMTcvva+i/gRZwdXsavQG3NqilaidInrrD09MF9OT8M/otU
   dB2vlvme8X7ef2XNNgUcDZJ635tHQDTJhYwiyNF6tj2TNeaPVDALHtqXy
   b7HjCQvQE1YHuZjnW2tPjJ4ie6uLQVNs8DmXFemDM1puu6Xco4MlXpzZD
   w==;
X-CSE-ConnectionGUID: naxWU1vVSYWO15XJua9oRw==
X-CSE-MsgGUID: wGX5vx6OSR+gQTDbbutJuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="58986282"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="58986282"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 03:23:05 -0800
X-CSE-ConnectionGUID: ZEEEz2bCSkWLEInT5E9+Fg==
X-CSE-MsgGUID: 6U27RiVcTDW6ofQQAY10mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="131192018"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Dec 2024 03:23:03 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tInTA-0002wY-1w;
	Wed, 04 Dec 2024 11:23:00 +0000
Date: Wed, 4 Dec 2024 19:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1691/1720] include/linux/compiler.h:166:45:
 error: storage class specified for parameter
 '__UNIQUE_ID___addressable_ffa_bus_type709'
Message-ID: <202412041935.AIgllJDo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c245a7a79602ccbee780c004c1e4abcda66aec32
commit: a388140d8759aebc56eed6a717ea0491c3d6a7d7 [1691/1720] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: arm64-randconfig-002 (https://download.01.org/0day-ci/archive/20241204/202412041935.AIgllJDo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041935.AIgllJDo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041935.AIgllJDo-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/sysfs.h:284:9: note: (near initialization for 'ffa_device_attributes_groups')
     284 |         &_name##_group,                                         \
         |         ^
   include/linux/sysfs.h:292:1: note: in expansion of macro '__ATTRIBUTE_GROUPS'
     292 | __ATTRIBUTE_GROUPS(_name)
         | ^~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:109:1: note: in expansion of macro 'ATTRIBUTE_GROUPS'
     109 | ATTRIBUTE_GROUPS(ffa_device_attributes);
         | ^~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:14: warning: excess elements in scalar initializer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/sysfs.h:285:9: note: in expansion of macro 'NULL'
     285 |         NULL,                                                   \
         |         ^~~~
   include/linux/sysfs.h:292:1: note: in expansion of macro '__ATTRIBUTE_GROUPS'
     292 | __ATTRIBUTE_GROUPS(_name)
         | ^~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:109:1: note: in expansion of macro 'ATTRIBUTE_GROUPS'
     109 | ATTRIBUTE_GROUPS(ffa_device_attributes);
         | ^~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'ffa_device_attributes_groups')
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/sysfs.h:285:9: note: in expansion of macro 'NULL'
     285 |         NULL,                                                   \
         |         ^~~~
   include/linux/sysfs.h:292:1: note: in expansion of macro '__ATTRIBUTE_GROUPS'
     292 | __ATTRIBUTE_GROUPS(_name)
         | ^~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:109:1: note: in expansion of macro 'ATTRIBUTE_GROUPS'
     109 | ATTRIBUTE_GROUPS(ffa_device_attributes);
         | ^~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:111:14: error: parameter 'ffa_bus_type' is initialized
     111 | const struct bus_type ffa_bus_type = {
         |              ^~~~~~~~
   drivers/firmware/arm_ffa/bus.c:111:23: error: redefinition of parameter 'ffa_bus_type'
     111 | const struct bus_type ffa_bus_type = {
         |                       ^~~~~~~~~~~~
   include/linux/arm_ffa.h:221:30: note: previous definition of 'ffa_bus_type' with type 'const struct bus_type'
     221 | extern const struct bus_type ffa_bus_type;
         |                              ^~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:113:27: error: 'ffa_device_match' undeclared (first use in this function); did you mean 'ffa_device_match_uuid'?
     113 |         .match          = ffa_device_match,
         |                           ^~~~~~~~~~~~~~~~
         |                           ffa_device_match_uuid
   drivers/firmware/arm_ffa/bus.c:114:27: error: 'ffa_device_probe' undeclared (first use in this function); did you mean 'ffa_device_id'?
     114 |         .probe          = ffa_device_probe,
         |                           ^~~~~~~~~~~~~~~~
         |                           ffa_device_id
   drivers/firmware/arm_ffa/bus.c:115:27: error: 'ffa_device_remove' undeclared (first use in this function); did you mean 'ffa_device_register'?
     115 |         .remove         = ffa_device_remove,
         |                           ^~~~~~~~~~~~~~~~~
         |                           ffa_device_register
   drivers/firmware/arm_ffa/bus.c:116:27: error: 'ffa_device_uevent' undeclared (first use in this function); did you mean 'ffa_device_register'?
     116 |         .uevent         = ffa_device_uevent,
         |                           ^~~~~~~~~~~~~~~~~
         |                           ffa_device_register
   In file included from arch/arm64/include/asm/lse.h:12,
                    from arch/arm64/include/asm/cmpxchg.h:14,
                    from arch/arm64/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:25,
                    from include/linux/bitops.h:68,
                    from arch/arm64/include/asm/cache.h:40,
                    from include/linux/cache.h:6,
                    from arch/arm64/include/asm/processor.h:29,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15:
   drivers/firmware/arm_ffa/bus.c:119:19: error: storage class specified for parameter 'ffa_bus_type'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         |                   ^~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:119:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:119:19: error: redefinition of parameter 'ffa_bus_type'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         |                   ^~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:119:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:111:23: note: previous definition of 'ffa_bus_type' with type 'const struct bus_type'
     111 | const struct bus_type ffa_bus_type = {
         |                       ^~~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_ffa_bus_type709'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:204:9: note: in expansion of macro '__UNIQUE_ID'
     204 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:206:9: note: in expansion of macro '___ADDRESSABLE'
     206 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:119:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         | ^~~~~~~~~~~~~~~~~
>> drivers/firmware/arm_ffa/bus.c:119:1: error: parameter '__UNIQUE_ID___addressable_ffa_bus_type709' is initialized
   drivers/firmware/arm_ffa/bus.c:119:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_ffa_bus_type709'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:204:9: note: in expansion of macro '__UNIQUE_ID'
     204 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:206:9: note: in expansion of macro '___ADDRESSABLE'
     206 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:119:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:58:9: error: expected declaration specifiers before 'asm'
      58 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:119:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:123:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     123 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:140:19: error: storage class specified for parameter 'ffa_driver_register'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:140:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:140:19: error: redefinition of parameter 'ffa_driver_register'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:140:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         | ^~~~~~~~~~~~~~~~~
   include/linux/arm_ffa.h:176:5: note: previous definition of 'ffa_driver_register' with type 'int (*)(struct ffa_driver *, struct module *, const char *)'
     176 | int ffa_driver_register(struct ffa_driver *driver, struct module *owner,
         |     ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_ffa_driver_register710'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:204:9: note: in expansion of macro '__UNIQUE_ID'
     204 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:206:9: note: in expansion of macro '___ADDRESSABLE'
     206 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:140:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         | ^~~~~~~~~~~~~~~~~
>> drivers/firmware/arm_ffa/bus.c:140:1: error: parameter '__UNIQUE_ID___addressable_ffa_driver_register710' is initialized
   drivers/firmware/arm_ffa/bus.c:140:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_ffa_driver_register710'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:204:9: note: in expansion of macro '__UNIQUE_ID'
     204 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:206:9: note: in expansion of macro '___ADDRESSABLE'
     206 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:140:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:58:9: error: expected declaration specifiers before 'asm'
      58 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:140:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:143:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     143 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:146:19: error: storage class specified for parameter 'ffa_driver_unregister'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:146:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:146:19: error: redefinition of parameter 'ffa_driver_unregister'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:146:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         | ^~~~~~~~~~~~~~~~~
   include/linux/arm_ffa.h:178:6: note: previous definition of 'ffa_driver_unregister' with type 'void (*)(struct ffa_driver *)'
     178 | void ffa_driver_unregister(struct ffa_driver *driver);
         |      ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_ffa_driver_unregister711'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:204:9: note: in expansion of macro '__UNIQUE_ID'
     204 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:206:9: note: in expansion of macro '___ADDRESSABLE'
     206 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:146:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         | ^~~~~~~~~~~~~~~~~
>> drivers/firmware/arm_ffa/bus.c:146:1: error: parameter '__UNIQUE_ID___addressable_ffa_driver_unregister711' is initialized
   drivers/firmware/arm_ffa/bus.c:146:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_ffa_driver_unregister711'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:204:9: note: in expansion of macro '__UNIQUE_ID'
     204 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:206:9: note: in expansion of macro '___ADDRESSABLE'
     206 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:146:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:58:9: error: expected declaration specifiers before 'asm'
      58 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:146:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:149:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     149 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:157:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     157 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:164:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     164 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:170:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     170 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:193:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     193 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:234:19: error: storage class specified for parameter 'ffa_device_register'
     234 | EXPORT_SYMBOL_GPL(ffa_device_register);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:234:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     234 | EXPORT_SYMBOL_GPL(ffa_device_register);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_ffa_device_register712'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:204:9: note: in expansion of macro '__UNIQUE_ID'
     204 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:206:9: note: in expansion of macro '___ADDRESSABLE'
     206 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:234:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     234 | EXPORT_SYMBOL_GPL(ffa_device_register);
         | ^~~~~~~~~~~~~~~~~
>> drivers/firmware/arm_ffa/bus.c:234:1: error: parameter '__UNIQUE_ID___addressable_ffa_device_register712' is initialized
   drivers/firmware/arm_ffa/bus.c:234:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_ffa_device_register712'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:204:9: note: in expansion of macro '__UNIQUE_ID'
     204 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:206:9: note: in expansion of macro '___ADDRESSABLE'
     206 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:234:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     234 | EXPORT_SYMBOL_GPL(ffa_device_register);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:58:9: error: expected declaration specifiers before 'asm'
      58 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:234:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     234 | EXPORT_SYMBOL_GPL(ffa_device_register);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:237:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     237 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:243:19: error: storage class specified for parameter 'ffa_device_unregister'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:243:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:243:19: error: redefinition of parameter 'ffa_device_unregister'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:243:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         | ^~~~~~~~~~~~~~~~~
   include/linux/arm_ffa.h:175:6: note: previous definition of 'ffa_device_unregister' with type 'void (*)(struct ffa_device *)'
     175 | void ffa_device_unregister(struct ffa_device *ffa_dev);
         |      ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_ffa_device_unregister713'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:204:9: note: in expansion of macro '__UNIQUE_ID'
     204 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:206:9: note: in expansion of macro '___ADDRESSABLE'
     206 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:243:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         | ^~~~~~~~~~~~~~~~~
>> drivers/firmware/arm_ffa/bus.c:243:1: error: parameter '__UNIQUE_ID___addressable_ffa_device_unregister713' is initialized
   drivers/firmware/arm_ffa/bus.c:243:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_ffa_device_unregister713'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:204:9: note: in expansion of macro '__UNIQUE_ID'
     204 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:206:9: note: in expansion of macro '___ADDRESSABLE'
     206 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:243:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:58:9: error: expected declaration specifiers before 'asm'
      58 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:243:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:246:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     246 | {
         | ^
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_arm_ffa_bus_init715'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:204:9: note: in expansion of macro '__UNIQUE_ID'
     204 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:206:9: note: in expansion of macro '___ADDRESSABLE'
     206 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/init.h:256:9: note: in expansion of macro '__ADDRESSABLE'
     256 |         __ADDRESSABLE(fn)
         |         ^~~~~~~~~~~~~
   include/linux/init.h:261:9: note: in expansion of macro '__define_initcall_stub'
     261 |         __define_initcall_stub(__stub, fn)                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:274:9: note: in expansion of macro '____define_initcall'
     274 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:280:9: note: in expansion of macro '__unique_initcall'
     280 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
     282 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:306:41: note: in expansion of macro '__define_initcall'
     306 | #define subsys_initcall(fn)             __define_initcall(fn, 4)
         |                                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:1: note: in expansion of macro 'subsys_initcall'
     249 | subsys_initcall(arm_ffa_bus_init);
         | ^~~~~~~~~~~~~~~
>> drivers/firmware/arm_ffa/bus.c:249:1: error: parameter '__UNIQUE_ID___addressable_arm_ffa_bus_init715' is initialized
   drivers/firmware/arm_ffa/bus.c:249:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_arm_ffa_bus_init715'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:204:9: note: in expansion of macro '__UNIQUE_ID'
     204 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:206:9: note: in expansion of macro '___ADDRESSABLE'
     206 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/init.h:256:9: note: in expansion of macro '__ADDRESSABLE'
     256 |         __ADDRESSABLE(fn)
         |         ^~~~~~~~~~~~~
   include/linux/init.h:261:9: note: in expansion of macro '__define_initcall_stub'
     261 |         __define_initcall_stub(__stub, fn)                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:274:9: note: in expansion of macro '____define_initcall'
     274 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:280:9: note: in expansion of macro '__unique_initcall'
     280 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
     282 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:306:41: note: in expansion of macro '__define_initcall'
     306 | #define subsys_initcall(fn)             __define_initcall(fn, 4)
         |                                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:1: note: in expansion of macro 'subsys_initcall'
     249 | subsys_initcall(arm_ffa_bus_init);
         | ^~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:17: error: 'arm_ffa_bus_init' undeclared (first use in this function)
     249 | subsys_initcall(arm_ffa_bus_init);
         |                 ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:204:72: note: in definition of macro '___ADDRESSABLE'
     204 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |                                                                        ^~~
   include/linux/init.h:256:9: note: in expansion of macro '__ADDRESSABLE'
     256 |         __ADDRESSABLE(fn)
         |         ^~~~~~~~~~~~~
   include/linux/init.h:261:9: note: in expansion of macro '__define_initcall_stub'
     261 |         __define_initcall_stub(__stub, fn)                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:274:9: note: in expansion of macro '____define_initcall'
     274 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:280:9: note: in expansion of macro '__unique_initcall'
     280 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
     282 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:306:41: note: in expansion of macro '__define_initcall'
     306 | #define subsys_initcall(fn)             __define_initcall(fn, 4)
         |                                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:1: note: in expansion of macro 'subsys_initcall'
     249 | subsys_initcall(arm_ffa_bus_init);
         | ^~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/alternative.h:9,
                    from arch/arm64/include/asm/lse.h:14:
   include/linux/init.h:262:9: error: expected declaration specifiers before 'asm'
     262 |         asm(".section   \"" __sec "\", \"a\"            \n"     \
         |         ^~~
   include/linux/init.h:274:9: note: in expansion of macro '____define_initcall'
     274 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:280:9: note: in expansion of macro '__unique_initcall'
     280 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
     282 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:306:41: note: in expansion of macro '__define_initcall'
     306 | #define subsys_initcall(fn)             __define_initcall(fn, 4)
         |                                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:1: note: in expansion of macro 'subsys_initcall'
     249 | subsys_initcall(arm_ffa_bus_init);
         | ^~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: error: expected declaration specifiers before '_Static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/init.h:266:9: note: in expansion of macro 'static_assert'
     266 |         static_assert(__same_type(initcall_t, &fn));
         |         ^~~~~~~~~~~~~
   include/linux/init.h:274:9: note: in expansion of macro '____define_initcall'
     274 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:280:9: note: in expansion of macro '__unique_initcall'
     280 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
     282 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:306:41: note: in expansion of macro '__define_initcall'
     306 | #define subsys_initcall(fn)             __define_initcall(fn, 4)
         |                                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:1: note: in expansion of macro 'subsys_initcall'
     249 | subsys_initcall(arm_ffa_bus_init);
         | ^~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:34: error: expected declaration specifiers before ';' token
     249 | subsys_initcall(arm_ffa_bus_init);
         |                                  ^
   drivers/firmware/arm_ffa/bus.c:252:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     252 | {
         | ^
   include/linux/init.h:319:27: error: storage class specified for parameter '__exitcall_arm_ffa_bus_exit'
     319 |         static exitcall_t __exitcall_##fn __exit_call = fn
         |                           ^~~~~~~~~~~
   include/linux/module.h:100:25: note: in expansion of macro '__exitcall'
     100 | #define module_exit(x)  __exitcall(x);
         |                         ^~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:257:1: note: in expansion of macro 'module_exit'
     257 | module_exit(arm_ffa_bus_exit);
         | ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:257:1: error: parameter '__exitcall_arm_ffa_bus_exit' is initialized
   drivers/firmware/arm_ffa/bus.c:257:1: warning: 'used' attribute ignored [-Wattributes]
   include/linux/init.h:319:27: error: section attribute not allowed for '__exitcall_arm_ffa_bus_exit'
     319 |         static exitcall_t __exitcall_##fn __exit_call = fn
         |                           ^~~~~~~~~~~
   include/linux/module.h:100:25: note: in expansion of macro '__exitcall'
     100 | #define module_exit(x)  __exitcall(x);
         |                         ^~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:257:1: note: in expansion of macro 'module_exit'
     257 | module_exit(arm_ffa_bus_exit);
         | ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:257:13: error: 'arm_ffa_bus_exit' undeclared (first use in this function)
     257 | module_exit(arm_ffa_bus_exit);
         |             ^~~~~~~~~~~~~~~~
   include/linux/init.h:319:57: note: in definition of macro '__exitcall'
     319 |         static exitcall_t __exitcall_##fn __exit_call = fn
         |                                                         ^~
   drivers/firmware/arm_ffa/bus.c:257:1: note: in expansion of macro 'module_exit'
     257 | module_exit(arm_ffa_bus_exit);
         | ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:257:30: error: expected declaration specifiers before ';' token
     257 | module_exit(arm_ffa_bus_exit);
         |                              ^
>> include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID_alias716'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/moduleparam.h:24:27: note: in expansion of macro '__UNIQUE_ID'
      24 |         static const char __UNIQUE_ID(name)[]                             \
         |                           ^~~~~~~~~~~
   include/linux/module.h:166:32: note: in expansion of macro '__MODULE_INFO'
     166 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:169:30: note: in expansion of macro 'MODULE_INFO'
     169 | #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
         |                              ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:259:1: note: in expansion of macro 'MODULE_ALIAS'
     259 | MODULE_ALIAS("ffa-core");
         | ^~~~~~~~~~~~
>> drivers/firmware/arm_ffa/bus.c:259:1: error: parameter '__UNIQUE_ID_alias716' is initialized
   drivers/firmware/arm_ffa/bus.c:259:1: warning: 'used' attribute ignored [-Wattributes]
   include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID_alias716'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/moduleparam.h:24:27: note: in expansion of macro '__UNIQUE_ID'
      24 |         static const char __UNIQUE_ID(name)[]                             \
         |                           ^~~~~~~~~~~
   include/linux/module.h:166:32: note: in expansion of macro '__MODULE_INFO'
     166 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:169:30: note: in expansion of macro 'MODULE_INFO'
     169 | #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
         |                              ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:259:1: note: in expansion of macro 'MODULE_ALIAS'
     259 | MODULE_ALIAS("ffa-core");
         | ^~~~~~~~~~~~
   include/linux/compiler.h:166:45: error: alignment may not be specified for '__UNIQUE_ID_alias716'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/moduleparam.h:24:27: note: in expansion of macro '__UNIQUE_ID'
      24 |         static const char __UNIQUE_ID(name)[]                             \
         |                           ^~~~~~~~~~~
   include/linux/module.h:166:32: note: in expansion of macro '__MODULE_INFO'
     166 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:169:30: note: in expansion of macro 'MODULE_INFO'
     169 | #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
         |                              ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:259:1: note: in expansion of macro 'MODULE_ALIAS'
     259 | MODULE_ALIAS("ffa-core");
         | ^~~~~~~~~~~~
   <command-line>: error: variable-sized object may not be initialized except with an empty initializer
   include/linux/moduleparam.h:17:30: note: in expansion of macro 'KBUILD_MODNAME'
      17 | #define __MODULE_INFO_PREFIX KBUILD_MODNAME "."
         |                              ^~~~~~~~~~~~~~
   include/linux/moduleparam.h:26:19: note: in expansion of macro '__MODULE_INFO_PREFIX'
      26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:166:32: note: in expansion of macro '__MODULE_INFO'
     166 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:169:30: note: in expansion of macro 'MODULE_INFO'
     169 | #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
         |                              ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:259:1: note: in expansion of macro 'MODULE_ALIAS'
     259 | MODULE_ALIAS("ffa-core");
         | ^~~~~~~~~~~~
   include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID_author717'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/moduleparam.h:24:27: note: in expansion of macro '__UNIQUE_ID'
      24 |         static const char __UNIQUE_ID(name)[]                             \
         |                           ^~~~~~~~~~~
   include/linux/module.h:166:32: note: in expansion of macro '__MODULE_INFO'
     166 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:242:32: note: in expansion of macro 'MODULE_INFO'
     242 | #define MODULE_AUTHOR(_author) MODULE_INFO(author, _author)
         |                                ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:260:1: note: in expansion of macro 'MODULE_AUTHOR'
     260 | MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
         | ^~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:260:1: error: parameter '__UNIQUE_ID_author717' is initialized
   drivers/firmware/arm_ffa/bus.c:260:1: warning: 'used' attribute ignored [-Wattributes]
..


vim +/__UNIQUE_ID___addressable_ffa_bus_type709 +166 include/linux/compiler.h

fe8c8a126806fea Cesar Eduardo Barros 2013-11-25  165  
a8306f2d4dcea03 Nick Desaulniers     2023-08-31 @166  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
6f33d58794ef4ce Rusty Russell        2012-11-22  167  

:::::: The code at line 166 was first introduced by commit
:::::: a8306f2d4dcea03538c70c26d2948483f70254ff compiler.h: unify __UNIQUE_ID

:::::: TO: Nick Desaulniers <ndesaulniers@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
