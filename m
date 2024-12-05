Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BA24C83
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 04:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733372726; cv=none; b=Se640lkUKyozBOVTzUIC6z9LjbqybsOcaCy38Ga4V6ZLAUtPToUS02sq/nbS6rIBaR7rhTLdLNQdt0POO594M0jf6R2+Xd1p+Bft09TNwXuYVgXwZNmQ3pFtRhW4SoV47UQ13NWO1r1MUzCBMvWNbBsZcMo8uuHvlve8hiH/f6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733372726; c=relaxed/simple;
	bh=tQoRJeEXn1ROD+chn726BtgI8B2JZDRwQ9wbbSB2pc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B+n2M5Y0d/wpIUK441I5K5uSK72mexYqSTJucFsoqob/bBkz4T9nN8UEdlLoKn98lXbJdPl9571HsRjmPZWBT+ajxN0NaVBXyHAp73fLcSnml01tFWbE8+SrtEPSjv0A0bfDJnt1gU+fIkI5S2ltN+a+wRt7IjWTV97nGzwA4sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoMcBp/n; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoMcBp/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733372725; x=1764908725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tQoRJeEXn1ROD+chn726BtgI8B2JZDRwQ9wbbSB2pc0=;
  b=eoMcBp/nePadbx8QOA2bSWypn8PYjgX49uhejonMFcQh65CwLmmdiGjm
   0mATCdWVYvStdbOciX5XQP3avFxEPRURA8xQEqGB8oWnSzcDoBXnf3UtH
   1Vd/T6mO23R0smEUQSPT9xpY1ZdrPxv5jghrlvOymgB+g1bqX4PW0AHM7
   5kgT5lRnstJOiY2RhjqItYghAe4VRO3HsThwI11TZHgGVjgjwi5lGA8bP
   FzF34fZ8e9wUF7oT4p6LmheF+o0vuboU4g54rZ6tuieqKcNrS+PUxjHTQ
   SkdEdALzzRwW2W9shclgCGZVl2txoUEODQku5MF8WyEKjzQc41gWwRq/9
   w==;
X-CSE-ConnectionGUID: 6AXK7GlMQFSBAFK0MkFJVw==
X-CSE-MsgGUID: KKz/N0NWRie9byZS6JK+Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33021702"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33021702"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 20:25:23 -0800
X-CSE-ConnectionGUID: XGyZDUzNTGqeZFRKj8p7IA==
X-CSE-MsgGUID: UuQILOk1Qnqz+X+8Wt2feQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94055500"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Dec 2024 20:25:22 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ3QR-0003mj-1R;
	Thu, 05 Dec 2024 04:25:16 +0000
Date: Thu, 5 Dec 2024 12:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/extended-linear 2/4] include/linux/compiler.h:245:77:
 error: expression in static assertion is not an integer
Message-ID: <202412051201.PfxO648T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/extended-linear
head:   cc3b7ba41f14d666907c81d2b5079170659e37b1
commit: 6576e541fcc39fd4f68ddaf2e4851d7eb30c9791 [2/4] acpi/hmat / cxl: Add extended linear cache support for CXL
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20241205/202412051201.PfxO648T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051201.PfxO648T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051201.PfxO648T-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/i2c.h:13,
                    from drivers/media/pci/cx25821/cx25821.h:14,
                    from drivers/media/pci/cx25821/cx25821-alsa.c:29:
   include/linux/acpi.h:1105:19: error: redefinition of 'hmat_get_extended_linear_cache_size'
    1105 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:448:19: note: previous definition of 'hmat_get_extended_linear_cache_size' with type 'int(struct resource *, int,  resource_size_t *)' {aka 'int(struct resource *, int,  long long unsigned int *)'}
     448 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/media/pci/cx25821/cx25821-alsa.c:12:
>> include/linux/compiler.h:245:77: error: expression in static assertion is not an integer
     245 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:249:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     249 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/cx25821/cx25821-alsa.c:97:1: note: in expansion of macro 'module_param_array'
      97 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/pci/cx25821/cx25821-alsa.c:90:12: warning: 'index' defined but not used [-Wunused-variable]
      90 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/linux/i2c.h:13,
                    from cx25821.h:14,
                    from cx25821-alsa.c:29:
   include/linux/acpi.h:1105:19: error: redefinition of 'hmat_get_extended_linear_cache_size'
    1105 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:448:19: note: previous definition of 'hmat_get_extended_linear_cache_size' with type 'int(struct resource *, int,  resource_size_t *)' {aka 'int(struct resource *, int,  long long unsigned int *)'}
     448 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from cx25821-alsa.c:12:
>> include/linux/compiler.h:245:77: error: expression in static assertion is not an integer
     245 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:249:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     249 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   cx25821-alsa.c:97:1: note: in expansion of macro 'module_param_array'
      97 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   cx25821-alsa.c:90:12: warning: 'index' defined but not used [-Wunused-variable]
      90 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~


vim +245 include/linux/compiler.h

^1da177e4c3f415 Linus Torvalds  2005-04-16  241  
d7a516c6eeae291 Philipp Reisner 2024-11-15  242  #ifdef __CHECKER__
d7a516c6eeae291 Philipp Reisner 2024-11-15  243  #define __BUILD_BUG_ON_ZERO_MSG(e, msg) (0)
d7a516c6eeae291 Philipp Reisner 2024-11-15  244  #else /* __CHECKER__ */
d7a516c6eeae291 Philipp Reisner 2024-11-15 @245  #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
d7a516c6eeae291 Philipp Reisner 2024-11-15  246  #endif /* __CHECKER__ */
d7a516c6eeae291 Philipp Reisner 2024-11-15  247  

:::::: The code at line 245 was first introduced by commit
:::::: d7a516c6eeae29144649f1c3f586fa580ec9e040 compiler.h: Fix undefined BUILD_BUG_ON_ZERO()

:::::: TO: Philipp Reisner <philipp.reisner@linbit.com>
:::::: CC: Kees Cook <kees@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
