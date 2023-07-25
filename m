Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9574B14AB1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 09:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690276881; x=1721812881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=or2sUSS+TMXZhhDwQC+Gl9siuAQ0FHnpzV6Pia8Fl0w=;
  b=EDg8Oco5IpO9aVC+ozjwnJmoFBTNpMfzbYoVQARMqi7ePei+ifYwY9Fu
   QZ9m92ijCe5jI9HOsXHlBl1zcttJHtmY3W9JzMduUSm6EPI0xujRi1F0Z
   wKoZ06rms1Q2IugBI5BnmLISPYE0gF8PzPa1kg1sQF4+8tvRnkRADSMlJ
   eX91e9cEaY1TOt7fZ8kqQJ/0qKzBqgonpOWdUELUnizj9lQqbfI4UAvAZ
   KiHxqY1fVl/UG1+HiUEXqr/43+tDZj0c4z2aIhyv9bQdczMdr5y30aL8V
   YDfqlyQu3le6H/wgelEMBlsEiGh7jglNJxc4ti7RivHtL93c9MkluTd9l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367691784"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="367691784"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 02:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="761149956"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="761149956"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Jul 2023 02:21:18 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOEEH-000AUr-10;
	Tue, 25 Jul 2023 09:21:17 +0000
Date: Tue, 25 Jul 2023 17:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2n 23/24] lib/dynamic_debug.c:184:16: warning: variable
 'dt' is uninitialized when used within its own initialization
Message-ID: <202307251748.sQgmoaNO-lkp@intel.com>
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
commit: fe3adb13d2421af72e04bb3654f2a2bc6114bbb8 [23/24] dt-info
config: hexagon-randconfig-r045-20230724 (https://download.01.org/0day-ci/archive/20230725/202307251748.sQgmoaNO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251748.sQgmoaNO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251748.sQgmoaNO-lkp@intel.com/

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
>> lib/dynamic_debug.c:184:16: warning: variable 'dt' is uninitialized when used within its own initialization [-Wuninitialized]
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
   lib/dynamic_debug.c:1289:14: warning: variable 'dt' is uninitialized when used within its own initialization [-Wuninitialized]
    1289 |         vpr_dt_info(dt, "attach-client-module: ");
         |         ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:154:23: note: expanded from macro 'vpr_dt_info'
     154 |         __typeof__(_dt) dt = _dt;                                       \
         |                         ~~   ^~~
   9 warnings generated.


vim +/dt +184 lib/dynamic_debug.c

f657fd21e16e3ab Joe Perches 2012-12-05  152  
fe3adb13d2421af Jim Cromie  2023-07-18  153  #define vpr_dt_info(_dt, _msg, ...)	({				\
fe3adb13d2421af Jim Cromie  2023-07-18  154  	__typeof__(_dt) dt = _dt;					\
7b7de70f347fc01 Jim Cromie  2022-12-21  155  	v2pr_info(_msg " module:%s nd:%d nc:%d nu:%d\n", ##__VA_ARGS__,	\
fe3adb13d2421af Jim Cromie  2023-07-18  156  		  dt->mod_name, dt->num_ddebugs, dt->num_classes,	\
fe3adb13d2421af Jim Cromie  2023-07-18  157  		  dt->num_class_users);					\
fe3adb13d2421af Jim Cromie  2023-07-18  158  	})
7b7de70f347fc01 Jim Cromie  2022-12-21  159  
3b567f83cef41d8 Jim Cromie  2023-07-13  160  #define for_each_boxed_vector(_box, _vec, _len, _ct, _curs)		\
3b567f83cef41d8 Jim Cromie  2023-07-13  161  	for (_ct = 0, _curs = _box->_vec; _ct < _box->_len; _ct++, _curs++)
3b567f83cef41d8 Jim Cromie  2023-07-13  162  
657a3d12e1a49ea Jim Cromie  2022-11-01  163  #define __outvar /* filled by callee */
a4a2a427413e350 Jim Cromie  2022-09-04  164  static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
657a3d12e1a49ea Jim Cromie  2022-11-01  165  							const char *class_string,
657a3d12e1a49ea Jim Cromie  2022-11-01  166  							__outvar int *class_id)
a4a2a427413e350 Jim Cromie  2022-09-04  167  {
a4a2a427413e350 Jim Cromie  2022-09-04  168  	struct ddebug_class_map *map;
7b7de70f347fc01 Jim Cromie  2022-12-21  169  	struct ddebug_class_user *cli;
657a3d12e1a49ea Jim Cromie  2022-11-01  170  	int i, idx;
a4a2a427413e350 Jim Cromie  2022-09-04  171  
3b567f83cef41d8 Jim Cromie  2023-07-13  172  	for_each_boxed_vector(dt, classes, num_classes, i, map) {
a4a2a427413e350 Jim Cromie  2022-09-04  173  		idx = match_string(map->class_names, map->length, class_string);
a4a2a427413e350 Jim Cromie  2022-09-04  174  		if (idx >= 0) {
a4a2a427413e350 Jim Cromie  2022-09-04  175  			*class_id = idx + map->base;
7b7de70f347fc01 Jim Cromie  2022-12-21  176  			vpr_dt_info(dt, "good-class: %s.%s ", map->mod_name, class_string);
a4a2a427413e350 Jim Cromie  2022-09-04  177  			return map;
a4a2a427413e350 Jim Cromie  2022-09-04  178  		}
a4a2a427413e350 Jim Cromie  2022-09-04  179  	}
3b567f83cef41d8 Jim Cromie  2023-07-13  180  	for_each_boxed_vector(dt, class_users, num_class_users, i, cli) {
7b7de70f347fc01 Jim Cromie  2022-12-21  181  		idx = match_string(cli->map->class_names, cli->map->length, class_string);
7b7de70f347fc01 Jim Cromie  2022-12-21  182  		if (idx >= 0) {
7b7de70f347fc01 Jim Cromie  2022-12-21  183  			*class_id = idx + cli->map->base;
7b7de70f347fc01 Jim Cromie  2022-12-21 @184  			vpr_dt_info(dt, "class-ref: %s.%s ",
7b7de70f347fc01 Jim Cromie  2022-12-21  185  				    cli->user_mod_name, class_string);
7b7de70f347fc01 Jim Cromie  2022-12-21  186  			return cli->map;
7b7de70f347fc01 Jim Cromie  2022-12-21  187  		}
7b7de70f347fc01 Jim Cromie  2022-12-21  188  	}
a4a2a427413e350 Jim Cromie  2022-09-04  189  	*class_id = -ENOENT;
a4a2a427413e350 Jim Cromie  2022-09-04  190  	return NULL;
a4a2a427413e350 Jim Cromie  2022-09-04  191  }
a4a2a427413e350 Jim Cromie  2022-09-04  192  

:::::: The code at line 184 was first introduced by commit
:::::: 7b7de70f347fc0164d349ede0a979125ae5e4e1c dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP & CONFIG_DRM_USE_DYNAMIC_DEBUG

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
