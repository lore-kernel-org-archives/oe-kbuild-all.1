Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB02A1BDD3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 23:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694821247; x=1726357247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ji5SIbgD2OdHO+cXqNJjYudIkj3OSGwEBZ8mSGkzsWQ=;
  b=cVygfBu5qquqGlWZ/XpBT8tDgd/feDZGsxzeT+UEgPptL19+EYYjJVhp
   cIhEVKf5pOqIITDeSDmoxdbWHIrl53TImOCr9wROK0HZRRcYzL3oD0pX0
   xVOvKOV3eC+j1lr+mM9AhsF/cUqQGpRu2Vnl8Kb1kkbN9Bm1Js0kG+B55
   ir53/1+GFc006fS4vVC7l4U8bSvsx8V+7I8Q8g/WzhD8YAb+k2tRz4b/8
   2snmrj8t/KvexjU27DsUJqXmrEweewD0lXmcwdf7JmI8WZ4pTaybhShJZ
   IBFszbH4mRSml4ICAPJQq+opKUCRJJAQ1KBYgU+OBgT9d6aFxTSGS+HQ+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="369684714"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="369684714"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 16:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="918820974"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="918820974"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Sep 2023 16:40:46 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhIQV-0003c1-2d;
	Fri, 15 Sep 2023 23:40:43 +0000
Date: Sat, 16 Sep 2023 07:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 12/14] fs/fuse/fuse_i.h:13:22: warning:
 format '%lu' expects argument of type 'long unsigned int', but argument 6
 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202309160730.a7JXNJlh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   a162ad55e2618ff22555d226f9076c83304a12ce
commit: cf8388aefa4988849bf36191d3f3ad87c1ab42c8 [12/14] fuse: implement read/write passthrough
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20230916/202309160730.a7JXNJlh-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309160730.a7JXNJlh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160730.a7JXNJlh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/fuse/passthrough.c:8:
   fs/fuse/passthrough.c: In function 'fuse_passthrough_read_iter':
>> fs/fuse/fuse_i.h:13:22: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      13 | # define pr_fmt(fmt) "fuse: " fmt
         |                      ^~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'pr_fmt'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   fs/fuse/passthrough.c:66:9: note: in expansion of macro 'pr_debug'
      66 |         pr_debug("%s: fb=0x%p, pos=%lld, len=%lu\n", __func__,
         |         ^~~~~~~~
   fs/fuse/passthrough.c: In function 'fuse_passthrough_write_iter':
>> fs/fuse/fuse_i.h:13:22: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      13 | # define pr_fmt(fmt) "fuse: " fmt
         |                      ^~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'pr_fmt'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   fs/fuse/passthrough.c:91:9: note: in expansion of macro 'pr_debug'
      91 |         pr_debug("%s: fb=0x%p, pos=%lld, len=%lu\n", __func__,
         |         ^~~~~~~~


vim +13 fs/fuse/fuse_i.h

29d434b39c8073 Tejun Heo      2008-10-16  11  
f2294482ff65dd Kirill Smelkov 2019-03-27  12  #ifndef pr_fmt
f2294482ff65dd Kirill Smelkov 2019-03-27 @13  # define pr_fmt(fmt) "fuse: " fmt
f2294482ff65dd Kirill Smelkov 2019-03-27  14  #endif
f2294482ff65dd Kirill Smelkov 2019-03-27  15  

:::::: The code at line 13 was first introduced by commit
:::::: f2294482ff65dd9c9c3c6ae1447f908c6aa60f52 fuse: convert printk -> pr_*

:::::: TO: Kirill Smelkov <kirr@nexedi.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
