Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3071AA83
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 16:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691598401; x=1723134401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3mlfA+HyXWU7bgxtkCetWvkmhcBFg7EGUNJt/8einMA=;
  b=KicDMMgPt8WgOi3aRDz7Ujbe6X+vYLZNkn3nL9ZHno9F4PwacNHucTt3
   8t46XMcFUtKV6y0OSqi6vfCkKjJUY4dHuul4wFGBEDv2SCw/mi9aC5uxl
   F6a9EWFO10VRfqTK5Tb2N2OiJvkgvF3dj9hj9sr+V/7k7+hXIR8ccrjG2
   qx/xSZ8oZWkNAc48Zm9m/D+gp4dlvgngiFf+dz7LaxPIt6gD3JbOI26+v
   CUwYZJoPweIRTC9uL1eriID815wt5DqxLc+xPOIkjnbUP1AZkwLzdlulr
   8g2e5691IpzT6t6647Xlhv/WJqxpyLwySyeOpJ313K8A6O+OqTO+FJr8X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="371157276"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="371157276"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 09:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="735071113"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="735071113"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2023 09:26:39 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTm18-0006Fi-33;
	Wed, 09 Aug 2023 16:26:38 +0000
Date: Thu, 10 Aug 2023 00:25:44 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-kfence 2/2] mm/kfence/core.c:111:13:
 error: conflicting types for '__kfence_pool'; have 'const void *'
Message-ID: <202308100029.fiY8fbHn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-kfence
head:   1d8567fb084df07151b6dbf6337f7e909b3576f3
commit: 1d8567fb084df07151b6dbf6337f7e909b3576f3 [2/2] kfence: Use a const void * for page pool
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230810/202308100029.fiY8fbHn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100029.fiY8fbHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100029.fiY8fbHn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kfence/core.c:111:13: error: conflicting types for '__kfence_pool'; have 'const void *'
     111 | const void *__kfence_pool __read_mostly;
         |             ^~~~~~~~~~~~~
   In file included from mm/kfence/core.c:17:
   include/linux/kfence.h:28:14: note: previous declaration of '__kfence_pool' with type 'char *'
      28 | extern char *__kfence_pool;
         |              ^~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from arch/arm/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from mm/kfence/core.c:11:
   mm/kfence/core.c:112:15: error: conflicting types for '__kfence_pool'; have 'const void *'
     112 | EXPORT_SYMBOL(__kfence_pool); /* Export for test modules. */
         |               ^~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   mm/kfence/core.c:112:1: note: in expansion of macro 'EXPORT_SYMBOL'
     112 | EXPORT_SYMBOL(__kfence_pool); /* Export for test modules. */
         | ^~~~~~~~~~~~~
   include/linux/kfence.h:28:14: note: previous declaration of '__kfence_pool' with type 'char *'
      28 | extern char *__kfence_pool;
         |              ^~~~~~~~~~~~~
   mm/kfence/core.c: In function 'metadata_to_pageaddr':
   mm/kfence/core.c:245:63: warning: dereferencing 'void *' pointer
     245 |         unsigned long pageaddr = (unsigned long)&__kfence_pool[offset];
         |                                                               ^


vim +111 mm/kfence/core.c

   109	
   110	/* The pool of pages used for guard pages and objects. */
 > 111	const void *__kfence_pool __read_mostly;
   112	EXPORT_SYMBOL(__kfence_pool); /* Export for test modules. */
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
