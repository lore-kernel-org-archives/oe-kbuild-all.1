Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217583;
	b=L0B5eijMr/+yqWcaTAnm22od9W93ZGgB1aD64nhjXwduluv5N6u+RUmcvVxExGBZscUX
	 NdhV2jcoEW7tx1Raw6/v39YVNSIh4IDY5Uo2G2GfV+VM5W6I6UWSvQE8o3Wk/ySRHFn8N
	 iGO/21xRjjkCrdV9AgY6VqdbqiAvUZUV8HApiQC11u/430Erz6gNEW9rqIgyacaZUw1jE
	 aN8xy2qCCnL3bvlHn2U94vY3ePHH2QQ9TQVVj+pEMqmFZHeSOORvfGyZsX6nQRWhwkT27
	 JHjTwKBF2DWKsVDbWV348AcquSdtEyszyd4Y+E7TQNtSNp+mHzWxvUhNp+oXsmBrGoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217583;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pxA+bLXaZCHF0FHQjPNOsRskW6Q3Xx9+dszn4INgVbY=;
	b=y+0BF3ZpvP/2vZJmHQK+BougRwNPmsL95d2qzGl8OmoMGG4WDxOaLHJq3dcd/YsRLWBc
	 BkcC626V1sst0mfesxVHG70H3L6eCD+8npssinJf+YeTtPpxVZcJ4Cnw6O3/29M62CaxH
	 +x0eVmgS6eCgg5TClGG6iHV8zZqisOgexRD7VhKbNzzMEwrH/OdXcGlI1nd38e/cM3zVc
	 VjqoOYqfiWhffva9zleYZkmm5HfNQlabpCdlp1T/jbAsqw2Aw6XgTx8vD91iEBkQNe4BB
	 hSmM6/soIiGmYs+R5+fkSX3VvJRBLKLn7wKXBBQCYksEbVwRDNdoyk/Z4Uj43es67Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SsZJfGAL;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC019606A687
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 23:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC019606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SsZJfGAL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795217580; x=1826753580;
  h=date:from:to:cc:subject:message-id;
  bh=IOGJC42mmyBK9/udByNf53ZpB6qLRvKObvAd4DQryFk=;
  b=SsZJfGALoE18ZtKU+L4zaGBxudc/6Kvf4nAaXBqVjE14OxuNc9QV+ar4
   IvLcPbni7dNY9S98E6tD6qFVHpa+1YP+rMKHd1sHxv8rhzCmmC34p2m2D
   lD9ra7kEva1u6CLM3El8uf4imVMliH1l6j8lgoIp03Ms66oRob6uDJ1Zj
   sDTCqQDoCurc6kqRbBiwqMhxTg85B/CwVxfNXv5yoiO2CHFk3qPmXrnhb
   tBVjGUNlPDq++d2BOwgtBaRYiWXz3LZTb1iJedFVlR7L0wF2ep9CKtdyS
   8fobuCeqTqoJcYElGMt3NPLbLrsrpPjcxL6es3Hhaue3ETyW8CTB9bVB0
   Q==;
X-CSE-ConnectionGUID: V4bFdBYcShmKrqk24qyxSw==
X-CSE-MsgGUID: gth0EZmIQjeTCPrhnM4zzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3987662"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3987662"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:32:59 -0800
X-CSE-ConnectionGUID: U+zPlU1vRzm2/Nj9AK53HQ==
X-CSE-MsgGUID: DwPOs+tEQW+rzOfPSO76Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10752644"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 20 Nov 2026 15:32:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUY6A-000000004AJ-1vKT;
	Fri, 20 Nov 2026 23:32:54 +0000
Date: Sat, 21 Nov 2026 00:32:20 +0100
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:b4/acpi-static-table-irq-probe-defer-v2 3/10]
 include/linux/acpi.h:71:10: error: implicit declaration of function
 'FIELD_PREP'
Message-ID: <20261121002930.1E4YJP1U-lkp@intel.com>
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261121/20261121002930.1E4YJP1U-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121002930.1E4YJP1U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121002930.1E4YJP1U-lkp@intel.com/

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
>> drivers/acpi/property.c:1791:12: error: static declaration of 'acpi_static_fwnode_irq_get' follows non-static declaration
    1791 | static int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:92:5: note: previous declaration of 'acpi_static_fwnode_irq_get' with type 'int(const struct fwnode_handle *, unsigned int)'
      92 | int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c: In function 'acpi_static_fwnode_irq_get':
>> include/linux/acpi.h:75:9: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      75 |         FIELD_GET(ACPI_STATIC_IRQ_TRIGGER_MASK, (flags))
         |         ^~~~~~~~~
   drivers/acpi/property.c:1802:50: note: in expansion of macro 'ACPI_STATIC_IRQ_TRIGGER'
    1802 |         return acpi_register_gsi(NULL, irq->gsi, ACPI_STATIC_IRQ_TRIGGER(irq->flags),
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
