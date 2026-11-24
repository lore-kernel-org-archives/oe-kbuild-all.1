Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495922;
	b=BCqJYsmGIYkxLltPkmdQpwL3v1dzCw5mBg10qEv8wDVqGvEf/zmr+1lJO30CZWqDDrsy
	 MaSas29FdqM6ScoYEksPYuThD502pIm+O2JxaEK+pb8ccw30AVtf3NaxtbUuwG9wvupwc
	 OuyhKg6iWecG2tVe7PkTXl/r0G6LHu2hcVhUO94cCLpbfhgc9oK/XvlztvHH8W13HuS5a
	 uM1smVlRQ/PczXqFS+n0vk6gkFWaMSGHoxDNvlE1zVYpd8TPHTSqAjQlameJuu5OzUOvz
	 q9klT761xrLvxchX5a4zS1HFPDNf8Hd7o62GM5Maq/rRRLOz1I4Qi6BRE3ygSp2UZ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495922;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yHkAnDg9TdNbRhJfhsvuZe2bK/p3ssG/jaKY+j2JJqQ=;
	b=BwC659/3DV+6/UM0I+xgh2Bu+rB7rD/RYKtfmAyuTaRxjl51PfpQIj7vtWkMEsbybB/O
	 xYqRlPN00y1I5iXssoKt22QWIGCBlZfoHkjUlmVyVFu5OirO3N6yTTU8tDmR981qM8+0I
	 B7w/JSUdI8q1aAG4jbVNgM+Q7njTbZLSE9d4Dan3A+d2sz7hV+uz+GiNs3Hq5y4SCI+b3
	 c6B0HzJ9wC6vzbW8xqJDTz4ODRTzG6p8WkTtF3BM67VsBaLBMxJkvjTB0XwyhrsnoTeCe
	 BDqjCr8eL+G4vGCJGPRkiQlQID1gg93T7JAKi+hUUbP6PdkX2sHzMn4ZXD27PfZetLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V7D5VkU1;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2122606A31E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 04:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2122606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V7D5VkU1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795495922; x=1827031922;
  h=date:from:to:cc:subject:message-id;
  bh=y4IZPTkMtEZf/XS0jIhokMQBKdVOZSXnTscA9FFTOVA=;
  b=V7D5VkU1BJqUOjyqgHnwzEwr+3JhCaZMwmvmKlA2w3RGwuzc99z2S7UE
   Fr5U01NDKvRZpZKw8fU9kTczVgjQ9GJLMAsldLHnbX0N5UnL+PnjAmntk
   T/kf+Y/5U888PxkcpOURNn5W1ctK+hS2YRkyAY677S/ViZ18k+AQlkiKS
   PfGfJzViwZZkdSjDhEEQzap2/vSvWTB1Gg9/k9e1pbglSFyGW5stOdnK6
   xYwbQ87yeMJv4eDi740R8X/QOM7yfyM1Th9/p1HmqSXhHc7HhgLWe8zdq
   rMO+z3QEjcEX18/VRGgzKxrvI/XIJqlk/dGtuF0t/7fLmNa8Rntdc8vSy
   w==;
X-CSE-ConnectionGUID: de+HFDVTSbGANHW1JlZN9A==
X-CSE-MsgGUID: k5F5PJ0uQ7mbB3aPHFEPYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4213226"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4213226"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 20:52:02 -0800
X-CSE-ConnectionGUID: JutXzW1FSdGgC+zNWh/jeA==
X-CSE-MsgGUID: h7e5eCt5TC2CJmOCRD/T2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="13460877"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 23 Nov 2026 20:52:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xViVa-0000000057x-0eYg;
	Tue, 24 Nov 2026 04:51:58 +0000
Date: Tue, 24 Nov 2026 05:51:50 +0100
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:b4/acpi-static-table-irq-probe-defer-v2 3/10]
 include/linux/acpi.h:71:10: error: implicit declaration of function
 'FIELD_PREP'
Message-ID: <20261124054242.Z3e5KwYl-lkp@intel.com>
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
head:   ca8bd1758c478a6d6f4ee72816f935c38cdb1169
commit: c692f3d86b735adeead52e7d58f1b943135cfaae [3/10] ACPI: Introduce irq_get() for static fwnodes
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261124/20261124054242.Z3e5KwYl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124054242.Z3e5KwYl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124054242.Z3e5KwYl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/tables.c:19:
   include/linux/acpi.h: In function 'acpi_static_fwnode_add_irq':
>> include/linux/acpi.h:71:10: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^~~~~~~~~~
   include/linux/acpi.h:126:22: note: in expansion of macro 'ACPI_STATIC_IRQ_FLAGS'
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/acpi/property.c:16:
   include/linux/acpi.h: In function 'acpi_static_fwnode_add_irq':
>> include/linux/acpi.h:71:10: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^~~~~~~~~~
   include/linux/acpi.h:126:22: note: in expansion of macro 'ACPI_STATIC_IRQ_FLAGS'
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c: At top level:
>> drivers/acpi/property.c:1792:12: error: static declaration of 'acpi_static_fwnode_irq_get' follows non-static declaration
    1792 | static int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:92:5: note: previous declaration of 'acpi_static_fwnode_irq_get' with type 'int(const struct fwnode_handle *, unsigned int)'
      92 | int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c: In function 'acpi_static_fwnode_irq_get':
>> include/linux/acpi.h:75:9: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      75 |         FIELD_GET(ACPI_STATIC_IRQ_TRIGGER_MASK, (flags))
         |         ^~~~~~~~~
   drivers/acpi/property.c:1803:50: note: in expansion of macro 'ACPI_STATIC_IRQ_TRIGGER'
    1803 |         return acpi_register_gsi(NULL, irq->gsi, ACPI_STATIC_IRQ_TRIGGER(irq->flags),
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from sound/hda/controllers/intel.c:38:
   include/linux/acpi.h: In function 'acpi_static_fwnode_add_irq':
>> include/linux/acpi.h:71:10: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^~~~~~~~~~
   include/linux/acpi.h:126:22: note: in expansion of macro 'ACPI_STATIC_IRQ_FLAGS'
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/div64.h:27,
                    from arch/x86/include/asm/div64.h:100,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12,
                    from sound/hda/controllers/intel.c:23:
   sound/hda/controllers/intel.c: At top level:
>> include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
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
   sound/hda/controllers/intel.c:127:1: note: in expansion of macro 'module_param_array'
     127 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/hda/controllers/intel.c:106:12: warning: 'index' defined but not used [-Wunused-variable]
     106 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from intel.c:38:
   include/linux/acpi.h: In function 'acpi_static_fwnode_add_irq':
>> include/linux/acpi.h:71:10: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^~~~~~~~~~
   include/linux/acpi.h:126:22: note: in expansion of macro 'ACPI_STATIC_IRQ_FLAGS'
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/div64.h:27,
                    from arch/x86/include/asm/div64.h:100,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12,
                    from intel.c:23:
   intel.c: At top level:
>> include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
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
   intel.c:127:1: note: in expansion of macro 'module_param_array'
     127 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   intel.c:106:12: warning: 'index' defined but not used [-Wunused-variable]
     106 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~


vim +/FIELD_PREP +71 include/linux/acpi.h

    69	
    70	#define ACPI_STATIC_IRQ_FLAGS(trigger, polarity) \
  > 71		(FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))	| \
    72		 FIELD_PREP(ACPI_STATIC_IRQ_POLARITY_MASK, (polarity)))
    73	
    74	#define ACPI_STATIC_IRQ_TRIGGER(flags)		\
  > 75		FIELD_GET(ACPI_STATIC_IRQ_TRIGGER_MASK, (flags))
    76	#define ACPI_STATIC_IRQ_POLARITY(flags)	\
    77		FIELD_GET(ACPI_STATIC_IRQ_POLARITY_MASK, (flags))
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
