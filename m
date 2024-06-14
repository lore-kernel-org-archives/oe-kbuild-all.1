Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9834146D6D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718407651; cv=none; b=AYbjScD6QANMV+X5hRuU9tQ2Ux4fobUqT9QzTAeUc4GOLbZmiFjFQb+J12heXs47Y2eZro3l6xqG6n4oGkjjBxn1Ji9vNWzoOeb1rPqdsseUazUzcoWUSY/v2BKxcE3HLrQuOgG6CJPY8KY4LjRF336/8l12VwJeT8DMJ3rlZ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718407651; c=relaxed/simple;
	bh=A6UbBmeWmL/TKprfBWDm4j5qcSzpetmWTtsHhvEMWqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acaOiI1k+HxswOyM7mX5UfybJ0JbTxIB9zN0JLlx9ptCKJbO1D2YHwgVhhkKIDq9XTh+tTIkHKNVmFXKlzKoVWY9882oUeiwJkhBCniNV2qBROrW+xDzLwiwX5iMcDplS1nQ9yChtl2NNDGkV7BsKSwcrEMEF9rN4blclei1myw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWtcVBY+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWtcVBY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718407650; x=1749943650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A6UbBmeWmL/TKprfBWDm4j5qcSzpetmWTtsHhvEMWqI=;
  b=bWtcVBY+YT1y+AujCuUUvCNCJhXNaKDDl0IFS48MkudaBzel6GGkJVyG
   e0O6dG4RKSDKsfPrBqMEfpqLAs6DjwVlZJ0vUEWPu/X2EXm1U+SqscBAK
   IPup31l45KAsrkarA4OPcrhGFjMlI4pUXbteisNQ7jC/5ZPrIeVxGhJ+5
   Rdb+Rwq3yxVuG5Pphc3hO22Gs+WwckTqHBcztY68VJcYq2SEXuZq0c8TW
   aSpuAP2qbYctRtvcMsN7zwvV3RnsINQRzVxyStFEHU6GmXYd/AlbFgC3Q
   hzr5t5BauRNZY9y57xIiRMZH00BV8tR9bmnx0vuDqX5zsXCkDJhjX+jx7
   g==;
X-CSE-ConnectionGUID: ZVFzsPDzRfOzkokxR4Yv6Q==
X-CSE-MsgGUID: bXlIFAOGQUmzy5Lij67HLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19141768"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="19141768"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 16:27:29 -0700
X-CSE-ConnectionGUID: d5t1lNw9SPmzM5anvwGfGQ==
X-CSE-MsgGUID: jKwGEpCXQnCGVyNyTJUWjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="40596115"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Jun 2024 16:27:27 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIGKK-0001tp-2w;
	Fri, 14 Jun 2024 23:27:24 +0000
Date: Sat, 15 Jun 2024 07:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 11/12] drm/ttm, drm/xe: Add a shrinker for xe bos
Message-ID: <202406150714.bpznu6ly-lkp@intel.com>
References: <20240614102548.4364-12-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614102548.4364-12-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20240613]
[cannot apply to linus/master v6.10-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240614-182911
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240614102548.4364-12-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v4 11/12] drm/ttm, drm/xe: Add a shrinker for xe bos
config: i386-buildonly-randconfig-002-20240615 (https://download.01.org/0day-ci/archive/20240615/202406150714.bpznu6ly-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150714.bpznu6ly-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150714.bpznu6ly-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from include/drm/ttm/ttm_tt.h:30,
                    from drivers/gpu/drm/xe/xe_bo.h:9,
                    from drivers/gpu/drm/xe/xe_bo.c:6:
   drivers/gpu/drm/xe/tests/xe_bo.c: In function 'shrink_test_run_device':
>> include/linux/kern_levels.h:5:18: error: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/printk.h:436:11: note: in definition of macro 'printk_index_wrap'
     436 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |           ^~~~
   include/kunit/test.h:529:3: note: in expansion of macro 'printk'
     529 |   printk(lvl fmt, ##__VA_ARGS__);    \
         |   ^~~~~~
   include/kunit/test.h:535:2: note: in expansion of macro 'kunit_log'
     535 |  kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,  \
         |  ^~~~~~~~~
   include/kunit/test.h:548:2: note: in expansion of macro 'kunit_printk'
     548 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   include/kunit/test.h:548:15: note: in expansion of macro 'KERN_INFO'
     548 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |               ^~~~~~~~~
   drivers/gpu/drm/xe/tests/xe_bo.c:381:2: note: in expansion of macro 'kunit_info'
     381 |  kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
         |  ^~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_bo.c:2442:
   drivers/gpu/drm/xe/tests/xe_bo.c:381:34: note: format string is defined here
     381 |  kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
         |                                ~~^
         |                                  |
         |                                  long unsigned int
         |                                %u
   In file included from drivers/gpu/drm/xe/tests/xe_bo.c:6,
                    from drivers/gpu/drm/xe/xe_bo.c:2442:
>> include/kunit/test.h:50:31: error: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
      50 | #define KUNIT_SUBTEST_INDENT  "    "
         |                               ^~~~~~
   include/kunit/test.h:530:42: note: in definition of macro 'kunit_log'
     530 |   kunit_log_append((test_or_suite)->log, fmt,  \
         |                                          ^~~
   include/kunit/test.h:535:23: note: in expansion of macro 'KUNIT_SUBTEST_INDENT'
     535 |  kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,  \
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:548:2: note: in expansion of macro 'kunit_printk'
     548 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~
   drivers/gpu/drm/xe/tests/xe_bo.c:381:2: note: in expansion of macro 'kunit_info'
     381 |  kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
         |  ^~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_bo.c:2442:
   drivers/gpu/drm/xe/tests/xe_bo.c:381:34: note: format string is defined here
     381 |  kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
         |                                ~~^
         |                                  |
         |                                  long unsigned int
         |                                %u
   cc1: all warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPI
   Depends on [n]: SPI [=n]
   Selected by [y]:
   - AD9739A [=y] && IIO [=y] && (SPI [=n] || COMPILE_TEST [=y])


vim +50 include/kunit/test.h

6d2426b2f258da David Gow        2021-06-24  43  
c3bba690a26432 Alan Maguire     2020-03-26  44  /*
c3bba690a26432 Alan Maguire     2020-03-26  45   * TAP specifies subtest stream indentation of 4 spaces, 8 spaces for a
c3bba690a26432 Alan Maguire     2020-03-26  46   * sub-subtest.  See the "Subtests" section in
c3bba690a26432 Alan Maguire     2020-03-26  47   * https://node-tap.org/tap-protocol/
c3bba690a26432 Alan Maguire     2020-03-26  48   */
b1eaa8b2a55c9d Michal Wajdeczko 2023-05-17  49  #define KUNIT_INDENT_LEN		4
c3bba690a26432 Alan Maguire     2020-03-26 @50  #define KUNIT_SUBTEST_INDENT		"    "
c3bba690a26432 Alan Maguire     2020-03-26  51  #define KUNIT_SUBSUBTEST_INDENT		"        "
c3bba690a26432 Alan Maguire     2020-03-26  52  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
