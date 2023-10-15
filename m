Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E394414AA1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 22:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJy8UrPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697408545; x=1728944545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e2K8XYa68pZr/HRCcWHGLhECgEpvxpclS0LZ+VMIivY=;
  b=DJy8UrPSWGmlUN/v22bqm1YOwXeIenfrctjbMGeETwI7k0kEDt6HiWVB
   +aEcz50G/NV1MwxcGWhL1FBKi8zSyIjwar0fqgXBfWCnGDbzowXqsh++E
   pSpZSizEsT0SlCzMOJ/4sqblmxKe3LPNbBs2PkIbw8mJ8yGAL22HpZJJ1
   adU6ZCpClsnGfyUGBStEFvqGOJ/SPqtItrBomuMWaR68hWGWLU3aNzxl+
   GZKsOUIVqTPJbC4HXvWT449INhul7D3ywoxReKX98s/xy4qPvHAPqQU5H
   GLdLsRLsFVVOS+UcFuSlkq5eLY71aZNPn7S5fPPDewGc5Xy2in9BPSOZy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365682169"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="365682169"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 15:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1086863168"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="1086863168"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Oct 2023 15:22:24 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs9Ui-0007rB-2N;
	Sun, 15 Oct 2023 22:22:08 +0000
Date: Mon, 16 Oct 2023 06:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1577/30000]
 arch/arc/include/asm/uaccess.h:27:34: error: implicit declaration of
 function 'uaccess_kernel'
Message-ID: <202310160653.ulpg6A65-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: b5805df1b1a6c25d66b734c9249ac30c5f419b9d [1577/30000] MLK-14392-1 input: touch: add focaltech touch screen support
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231016/202310160653.ulpg6A65-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160653.ulpg6A65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160653.ulpg6A65-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from include/linux/i2c.h:13,
                    from drivers/input/touchscreen/focaltech_touch/focaltech_core.h:36,
                    from drivers/input/touchscreen/focaltech_touch/focaltech_core.c:34:
   include/asm-generic/uaccess.h: In function 'strncpy_from_user':
>> arch/arc/include/asm/uaccess.h:27:34: error: implicit declaration of function 'uaccess_kernel' [-Werror=implicit-function-declaration]
      27 | #define __kernel_ok             (uaccess_kernel())
         |                                  ^~~~~~~~~~~~~~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   arch/arc/include/asm/uaccess.h:52:43: note: in expansion of macro '__kernel_ok'
      52 | #define __access_ok(addr, sz)   (unlikely(__kernel_ok) || \
         |                                           ^~~~~~~~~~~
   include/asm-generic/uaccess.h:93:31: note: in expansion of macro '__access_ok'
      93 | #define access_ok(addr, size) __access_ok((unsigned long)(addr),(size))
         |                               ^~~~~~~~~~~
   include/asm-generic/uaccess.h:233:14: note: in expansion of macro 'access_ok'
     233 |         if (!access_ok(src, 1))
         |              ^~~~~~~~~
   drivers/input/touchscreen/focaltech_touch/focaltech_core.c: In function 'fts_parse_dt':
   drivers/input/touchscreen/focaltech_touch/focaltech_core.c:970:31: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     970 |         if (pdata->reset_gpio < 0)
         |                               ^
   drivers/input/touchscreen/focaltech_touch/focaltech_core.c:976:29: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     976 |         if (pdata->irq_gpio < 0)
         |                             ^
   drivers/input/touchscreen/focaltech_touch/focaltech_core.c: At top level:
   drivers/input/touchscreen/focaltech_touch/focaltech_core.c:1328:12: warning: 'fts_ts_resume' defined but not used [-Wunused-function]
    1328 | static int fts_ts_resume(struct device *dev)
         |            ^~~~~~~~~~~~~
   drivers/input/touchscreen/focaltech_touch/focaltech_core.c:1267:12: warning: 'fts_ts_suspend' defined but not used [-Wunused-function]
    1267 | static int fts_ts_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from include/linux/i2c.h:13,
                    from drivers/input/touchscreen/focaltech_touch/focaltech_core.h:36,
                    from drivers/input/touchscreen/focaltech_touch/focaltech_esdcheck.c:38:
   include/asm-generic/uaccess.h: In function 'strncpy_from_user':
>> arch/arc/include/asm/uaccess.h:27:34: error: implicit declaration of function 'uaccess_kernel' [-Werror=implicit-function-declaration]
      27 | #define __kernel_ok             (uaccess_kernel())
         |                                  ^~~~~~~~~~~~~~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   arch/arc/include/asm/uaccess.h:52:43: note: in expansion of macro '__kernel_ok'
      52 | #define __access_ok(addr, sz)   (unlikely(__kernel_ok) || \
         |                                           ^~~~~~~~~~~
   include/asm-generic/uaccess.h:93:31: note: in expansion of macro '__access_ok'
      93 | #define access_ok(addr, size) __access_ok((unsigned long)(addr),(size))
         |                               ^~~~~~~~~~~
   include/asm-generic/uaccess.h:233:14: note: in expansion of macro 'access_ok'
     233 |         if (!access_ok(src, 1))
         |              ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/uaccess_kernel +27 arch/arc/include/asm/uaccess.h

43697cb0973da1 Vineet Gupta 2013-01-18  25  
43697cb0973da1 Vineet Gupta 2013-01-18  26  
db68ce10c4f0a2 Al Viro      2017-03-20 @27  #define __kernel_ok		(uaccess_kernel())
43697cb0973da1 Vineet Gupta 2013-01-18  28  

:::::: The code at line 27 was first introduced by commit
:::::: db68ce10c4f0a27c1ff9fa0e789e5c41f8c4ea63 new helper: uaccess_kernel()

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
