Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCAE1F163
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690285023; x=1721821023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6PL1fqeW5uovCSrl4s5HWDcBEK/nImvC5H8wMfWJKA4=;
  b=EI4+pE/YqbV9vQPU3NbvQDOGy4VuqUVHI+k9JmXJtKEXA3v2R5PCLZVV
   sAtWCn7SE+ES/pGgHiLsAxFIQCDoHk4mdH6VH7DyQdibuB1EU/GnquaJj
   ulEhAii/N17Hc5Fq3PhJ0236/UiQWyR7E73s73IRoZ5hqDJsMxhCAd4YQ
   ofB+ggFAHAdYFYeIqlDSpx77v4l/e8eid8ZfCFNshTZYX/Y7yXTD4rExg
   7E/y2Wc/d9drBqCht8xefWcYQJS6Q0ByRU+U9fKBbI3ePCBpxRfHFY33/
   tSQBdpmnhDKUmvKzPxkhrg3TnnjeaqO4sPnyXTiqy8xFiqGWTiUpMgVI2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347971014"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="347971014"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 04:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="791349377"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="791349377"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2023 04:35:35 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOGKE-000Aa0-0K;
	Tue, 25 Jul 2023 11:35:34 +0000
Date: Tue, 25 Jul 2023 19:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2n 24/24] lib/dynamic_debug.c:1224:15: warning:
 variable 'cm' is uninitialized when used within its own initialization
Message-ID: <202307251917.aN1Z6aeS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2n
head:   11b7d3b10685166a9825f966f75a0bb130189d2a
commit: 11b7d3b10685166a9825f966f75a0bb130189d2a [24/24] cm-info
config: hexagon-randconfig-r045-20230724 (https://download.01.org/0day-ci/archive/20230725/202307251917.aN1Z6aeS-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251917.aN1Z6aeS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251917.aN1Z6aeS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/dynamic_debug.c:35:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from lib/dynamic_debug.c:35:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from lib/dynamic_debug.c:35:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   lib/dynamic_debug.c:184:16: warning: variable 'dt' is uninitialized when used within its own initialization [-Wuninitialized]
     184 |                         vpr_dt_info(dt, "class-ref: %s.%s ",
         |                         ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
     185 |                                     cli->user_mod_name, class_string);
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:154:23: note: expanded from macro 'vpr_dt_info'
     154 |         __typeof__(_dt) dt = _dt;                                       \
         |                         ~~   ^~~
   lib/dynamic_debug.c:176:16: warning: variable 'dt' is uninitialized when used within its own initialization [-Wuninitialized]
     176 |                         vpr_dt_info(dt, "good-class: %s.%s ", map->mod_name, class_string);
         |                         ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:154:23: note: expanded from macro 'vpr_dt_info'
     154 |         __typeof__(_dt) dt = _dt;                                       \
         |                         ~~   ^~~
>> lib/dynamic_debug.c:1224:15: warning: variable 'cm' is uninitialized when used within its own initialization [-Wuninitialized]
    1224 |                 vpr_cm_info(cm, "builtin class:");
         |                 ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1165:23: note: expanded from macro 'vpr_cm_info'
    1165 |         __typeof__(_cm) cm = _cm;                                       \
         |                         ~~   ^~~
   lib/dynamic_debug.c:1243:16: warning: variable 'cm' is uninitialized when used within its own initialization [-Wuninitialized]
    1243 |                         vpr_cm_info(cm, "classes[%d]:", i);
         |                         ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1165:23: note: expanded from macro 'vpr_cm_info'
    1165 |         __typeof__(_cm) cm = _cm;                                       \
         |                         ~~   ^~~
   lib/dynamic_debug.c:1291:14: warning: variable 'dt' is uninitialized when used within its own initialization [-Wuninitialized]
    1291 |         vpr_dt_info(dt, "attach-client-module: ");
         |         ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:154:23: note: expanded from macro 'vpr_dt_info'
     154 |         __typeof__(_dt) dt = _dt;                                       \
         |                         ~~   ^~~
   11 warnings generated.


vim +/cm +1224 lib/dynamic_debug.c

7b7de70f347fc01 Jim Cromie 2022-12-21  1210  
7b7de70f347fc01 Jim Cromie 2022-12-21  1211  static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *modnm)
7b7de70f347fc01 Jim Cromie 2022-12-21  1212  {
7b7de70f347fc01 Jim Cromie 2022-12-21  1213  	const struct kernel_param *kp;
7b7de70f347fc01 Jim Cromie 2022-12-21  1214  #if IS_ENABLED(CONFIG_MODULES)
7b7de70f347fc01 Jim Cromie 2022-12-21  1215  	int i;
7b7de70f347fc01 Jim Cromie 2022-12-21  1216  
7b7de70f347fc01 Jim Cromie 2022-12-21  1217  	if (cm->mod) {
7b7de70f347fc01 Jim Cromie 2022-12-21  1218  		vpr_cm_info(cm, "loaded class:");
7b7de70f347fc01 Jim Cromie 2022-12-21  1219  		for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
7b7de70f347fc01 Jim Cromie 2022-12-21  1220  			ddebug_match_apply_kparam(kp, cm, modnm);
7b7de70f347fc01 Jim Cromie 2022-12-21  1221  	}
7b7de70f347fc01 Jim Cromie 2022-12-21  1222  #endif
7b7de70f347fc01 Jim Cromie 2022-12-21  1223  	if (!cm->mod) {
7b7de70f347fc01 Jim Cromie 2022-12-21 @1224  		vpr_cm_info(cm, "builtin class:");
7b7de70f347fc01 Jim Cromie 2022-12-21  1225  		for (kp = __start___param; kp < __stop___param; kp++)
7b7de70f347fc01 Jim Cromie 2022-12-21  1226  			ddebug_match_apply_kparam(kp, cm, modnm);
7b7de70f347fc01 Jim Cromie 2022-12-21  1227  	}
7b7de70f347fc01 Jim Cromie 2022-12-21  1228  }
7b7de70f347fc01 Jim Cromie 2022-12-21  1229  

:::::: The code at line 1224 was first introduced by commit
:::::: 7b7de70f347fc0164d349ede0a979125ae5e4e1c dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP & CONFIG_DRM_USE_DYNAMIC_DEBUG

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
