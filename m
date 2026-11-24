Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479954;
	b=QjVeRo1vKMtyUkY/S49Ezt9gSZ/0TeADsivaEgTDoBsKEWdprw7cdMc7kHA/4gCThG8E
	 Snxqa8rDiThOw3uy7sUZBVovHPAO4dvELJMo35VQivtbfTDCjudCbljae5AWFqGFU6W7z
	 keJv3/9l2Dni4REfEV/qYOr0h0xaLuRU723y1tGa3GzDY4aYxpIE9Ij91ojMGCGno5AT2
	 SOeNIZGqzN+iJsA2RY46TOaBOishQ9VI1y4sx8EBnQNdh4wGz0s6WOJvOQ8Qs5t7fhAyT
	 R6k3V95HWSETVcpf2vrzRIQaViQq9jtBPTO97X977mVIu3YlPCFgyMKIyoaPgVpplaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479954;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QALjCj9XdBQDb9VYY8OKLeNBt3tGzHGX/evd40vs1tI=;
	b=NwBH2NqhSvZCy2IRK3ehn+BuDlfrmFpHOfL0I9H52Cv/pyMjihjRZ9jBaH5gWw6IwYUz
	 JlBywm1yjz4Z9ycLDPDa82v4Encyo8CC0iGoEGu6ig9ArqAB8oaUyIQoxtofvIYOr2Gic
	 bEgypBa0H6Tcy3KSZ0z5BquYDF0YLF3+CCZZIcosh/Zsj8cT+PMgUwAsemf3vu2s96xA2
	 Mozn7Rm0F6vE47p56ITUftTYFpdfunvy24hvdHGMNlVuN2w0eIRj+fiso6rpgKZ4SqbaC
	 tjmZeTFKSn0EYC9KoNi/E5pleqYBtwLpsdeIluRPyYjxrGyiuuTIN2umSHv2Htppw7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RXpc41MS;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F776606A321
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 00:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F776606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RXpc41MS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795479953; x=1827015953;
  h=date:from:to:cc:subject:message-id;
  bh=jUqd2j7Fi/dq6JQ6J5XdEEqcOw78mxfeBRt4hIJHesg=;
  b=RXpc41MSEkvL786Aab7awGzItN+LI3dunDX9opLUk8YTeCHMbQmCmbQL
   P4Sa9dVjGVxYfQggO3rMk1gNhAQG/yWn5kVpuvcezqe/RIqPGCpc5oUbd
   QTuvAxGJo1dpJR82J1J3OZ074d5WkuWUnHgtoPloNMtC14h0kBSISBZCo
   n30UfzS/w+NA4+WMWf0KkgCvwhjikNboykOkzWT9F2QJF5eVtsYpgfQfA
   gUoMjA4YKFOzsIuPP8zOIIezTF8aT4LvpTXyZ39RMEqoY5+zZl6GjMQrK
   ID8pYU9xZDxCm/LO3eeChMuMnuBtnV0RmxpqHDdhzQ7+ZII535b3Zp1v1
   A==;
X-CSE-ConnectionGUID: TIQOx78KTj+i/I7uXEumqA==
X-CSE-MsgGUID: pQenTZI1Rc2KT1AAffmC9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4189348"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4189348"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:25:53 -0800
X-CSE-ConnectionGUID: 9Vg/AvL9TviI4X5AbTcxRw==
X-CSE-MsgGUID: cO8TGoybQ0eF/F+5KULmCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11543165"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Nov 2026 16:25:52 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVeM1-00000001OBk-0nUZ;
	Tue, 24 Nov 2026 00:25:49 +0000
Date: Tue, 24 Nov 2026 08:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:b4/acpi-static-table-irq-probe-defer-v2 3/10]
 include/linux/acpi.h:71:10: error: implicit declaration of function
 'FIELD_PREP'
Message-ID: <20261124081558.2nqvgOis-lkp@intel.com>
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261124/20261124081558.2nqvgOis-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124081558.2nqvgOis-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124081558.2nqvgOis-lkp@intel.com/

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
   include/linux/acpi.h:75:9: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
