Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6360B4AF96
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 18:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNJwW4B+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701282755; x=1732818755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SCGldnRqq1YWUyiUho+iGN0QrFJ8KEBE/alVwtwqkaA=;
  b=TNJwW4B+JntiNp8ESh5+Q84wmjXwmw4ssPa3rxYuj6zMQXmyQKuZYX4E
   y6rhrapfbXg/7vdZEAXBg8xMrozis8wTnar/d9NKNbDGNMbmkr0Xg0KNA
   6duydIlpTIIq3BrFdGjWKHJnkbjz06ILHHWksqz5NLNA6hFKcnZdJh1vO
   07nFQNo82SAdTLq3BKxjPYed5r3BdEucgg/ikq5SucQYGwY/+WrvDjc5S
   x6J4ykPNnsEmu2Z1zMeyI4UdhzRZykKg70yv/IP76rF3273Cst6vYCAYc
   HWd80S3lkG4HU+09nTZnBl3xh9mk/fMU7vnaDC+UJ8RI7GlXT3Dwu2RXs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="191413"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="191413"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 10:32:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772773864"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="772773864"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2023 10:32:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8PMJ-0000dL-2q;
	Wed, 29 Nov 2023 18:32:27 +0000
Date: Thu, 30 Nov 2023 02:32:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1577/30000]
 arch/mips/include/asm/uaccess.h:90:16: error: implicit declaration of
 function 'uaccess_kernel'
Message-ID: <202311300047.uhtRcbBV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gao,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: b5805df1b1a6c25d66b734c9249ac30c5f419b9d [1577/30000] MLK-14392-1 input: touch: add focaltech touch screen support
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231130/202311300047.uhtRcbBV-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311300047.uhtRcbBV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300047.uhtRcbBV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/input/touchscreen/focaltech_touch/focaltech_core.h:55,
                    from drivers/input/touchscreen/focaltech_touch/focaltech_core.c:34:
   arch/mips/include/asm/uaccess.h: In function 'eva_kernel_access':
>> arch/mips/include/asm/uaccess.h:90:16: error: implicit declaration of function 'uaccess_kernel' [-Werror=implicit-function-declaration]
      90 |         return uaccess_kernel();
         |                ^~~~~~~~~~~~~~
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
   In file included from drivers/input/touchscreen/focaltech_touch/focaltech_core.h:55,
                    from drivers/input/touchscreen/focaltech_touch/focaltech_esdcheck.c:38:
   arch/mips/include/asm/uaccess.h: In function 'eva_kernel_access':
>> arch/mips/include/asm/uaccess.h:90:16: error: implicit declaration of function 'uaccess_kernel' [-Werror=implicit-function-declaration]
      90 |         return uaccess_kernel();
         |                ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/uaccess_kernel +90 arch/mips/include/asm/uaccess.h

^1da177e4c3f41 include/asm-mips/uaccess.h      Linus Torvalds  2005-04-16  76  
12060666f5c065 arch/mips/include/asm/uaccess.h Paul Burton     2015-05-24  77  /*
12060666f5c065 arch/mips/include/asm/uaccess.h Paul Burton     2015-05-24  78   * eva_kernel_access() - determine whether kernel memory access on an EVA system
12060666f5c065 arch/mips/include/asm/uaccess.h Paul Burton     2015-05-24  79   *
12060666f5c065 arch/mips/include/asm/uaccess.h Paul Burton     2015-05-24  80   * Determines whether memory accesses should be performed to kernel memory
12060666f5c065 arch/mips/include/asm/uaccess.h Paul Burton     2015-05-24  81   * on a system using Extended Virtual Addressing (EVA).
12060666f5c065 arch/mips/include/asm/uaccess.h Paul Burton     2015-05-24  82   *
12060666f5c065 arch/mips/include/asm/uaccess.h Paul Burton     2015-05-24  83   * Return: true if a kernel memory access on an EVA system, else false.
12060666f5c065 arch/mips/include/asm/uaccess.h Paul Burton     2015-05-24  84   */
12060666f5c065 arch/mips/include/asm/uaccess.h Paul Burton     2015-05-24  85  static inline bool eva_kernel_access(void)
12060666f5c065 arch/mips/include/asm/uaccess.h Paul Burton     2015-05-24  86  {
97f2645f358b41 arch/mips/include/asm/uaccess.h Masahiro Yamada 2016-08-03  87  	if (!IS_ENABLED(CONFIG_EVA))
12060666f5c065 arch/mips/include/asm/uaccess.h Paul Burton     2015-05-24  88  		return false;
12060666f5c065 arch/mips/include/asm/uaccess.h Paul Burton     2015-05-24  89  
db68ce10c4f0a2 arch/mips/include/asm/uaccess.h Al Viro         2017-03-20 @90  	return uaccess_kernel();
12060666f5c065 arch/mips/include/asm/uaccess.h Paul Burton     2015-05-24  91  }
^1da177e4c3f41 include/asm-mips/uaccess.h      Linus Torvalds  2005-04-16  92  

:::::: The code at line 90 was first introduced by commit
:::::: db68ce10c4f0a27c1ff9fa0e789e5c41f8c4ea63 new helper: uaccess_kernel()

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
