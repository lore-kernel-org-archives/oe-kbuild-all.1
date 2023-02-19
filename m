Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7A2F4B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 19:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676834385; x=1708370385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m2hDeu9tKYhKigtYMsQGGnnVJQz9W0a6c91djommI6o=;
  b=FXbIQNBZV/rC2Vb3nSyvJtCtZcpYuv9BywmjGXdsEsNxUUpeJMNjh92G
   MigFIAZUtNTYq5nXSy0T0RxZIcAerZA/lYOivikHHu7cdsaVMHdqbUrQt
   9CG2OXWrEmJ2E9R5NUM7E3al4ujbNRCxjcngoAGRGPm8i4UxFtspTNtUV
   SJTe1l/6yajXL6JETFHtKngDhW80NbcafRP+UxtC4slH+RA7Ruux9lQCX
   GfMcDsby/BEFBzv9QrQzleI8izHZoXVD4lpWdPAdzuV0b+cHRlKIADXKp
   0eEmA2LM8e7ZKxjL3KXT/kZqoLBb0feVjMYdvi+b+Fg/5r/ifcRQHpsnl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="315990328"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="315990328"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 11:19:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="759953775"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="759953775"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Feb 2023 11:19:43 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTpDq-000DQb-32;
	Sun, 19 Feb 2023 19:19:42 +0000
Date: Mon, 20 Feb 2023 03:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:atcphy-20230219 14/54] include/acpi/acpi_bus.h:419:37:
 warning: passing argument 1 of 'is_acpi_device_node' makes pointer from
 integer without a cast
Message-ID: <202302200336.L97czsb1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux atcphy-20230219
head:   9928386c36c8def0becc6ce2db8f18f2111f9b3c
commit: f931e8ca0730986230243c7db38a5e60d9dc9ab7 [14/54] thunderbolt: Remove pci_dev from struct tb_nhi
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230220/202302200336.L97czsb1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/AsahiLinux/linux/commit/f931e8ca0730986230243c7db38a5e60d9dc9ab7
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux atcphy-20230219
        git checkout f931e8ca0730986230243c7db38a5e60d9dc9ab7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/thunderbolt/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200336.L97czsb1-lkp@intel.com/

All warnings (new ones prefixed by >>):

                    from include/linux/irqdomain.h:36,
                    from include/linux/acpi.h:13,
                    from drivers/thunderbolt/acpi.c:9:
   drivers/thunderbolt/acpi.c: In function 'tb_acpi_add_link':
   drivers/thunderbolt/acpi.c:31:30: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
      31 |         if (dev_fwnode(&nhi->pdev->dev) != fwnode)
         |                              ^~~~
   include/linux/property.h:39:19: note: in definition of macro 'dev_fwnode'
      39 |         _Generic((dev),                                                 \
         |                   ^~~
   drivers/thunderbolt/acpi.c:31:30: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
      31 |         if (dev_fwnode(&nhi->pdev->dev) != fwnode)
         |                              ^~~~
   include/linux/property.h:41:49: note: in definition of macro 'dev_fwnode'
      41 |                  struct device *: __dev_fwnode)(dev)
         |                                                 ^~~
   drivers/thunderbolt/acpi.c:83:58: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
      83 |                 link = device_link_add(&pdev->dev, &nhi->pdev->dev,
         |                                                          ^~~~
         |                                                          dev
   In file included from include/linux/printk.h:566,
                    from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/mutex.h:14,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:36,
                    from include/linux/acpi.h:13,
                    from drivers/thunderbolt/acpi.c:9:
   drivers/thunderbolt/acpi.c:88:39: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
      88 |                         dev_dbg(&nhi->pdev->dev, "created link from %s\n",
         |                                       ^~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/thunderbolt/acpi.c:88:25: note: in expansion of macro 'dev_dbg'
      88 |                         dev_dbg(&nhi->pdev->dev, "created link from %s\n",
         |                         ^~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from drivers/thunderbolt/acpi.c:9:
   drivers/thunderbolt/acpi.c:91:40: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
      91 |                         dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
         |                                        ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/thunderbolt/acpi.c:91:25: note: in expansion of macro 'dev_warn'
      91 |                         dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
         |                         ^~~~~~~~
   drivers/thunderbolt/acpi.c: In function 'tb_acpi_add_links':
   drivers/thunderbolt/acpi.c:115:39: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
     115 |         if (!has_acpi_companion(&nhi->pdev->dev))
         |                                       ^~~~
         |                                       dev
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from drivers/thunderbolt/acpi.c:9:
   drivers/thunderbolt/acpi.c:125:32: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
     125 |                 dev_warn(&nhi->pdev->dev, "failed to enumerate tunneled ports\n");
         |                                ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/thunderbolt/acpi.c:125:17: note: in expansion of macro 'dev_warn'
     125 |                 dev_warn(&nhi->pdev->dev, "failed to enumerate tunneled ports\n");
         |                 ^~~~~~~~
   In file included from include/linux/acpi.h:32,
                    from drivers/thunderbolt/acpi.c:9:
   drivers/thunderbolt/acpi.c: In function 'tb_acpi_switch_find_companion':
   drivers/thunderbolt/acpi.c:322:52: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                                                    ^~~~
   include/acpi/acpi_bus.h:417:24: note: in definition of macro 'to_acpi_device_node'
     417 |                 typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
         |                        ^~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~
   drivers/thunderbolt/acpi.c:322:52: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                                                    ^~~~
   include/acpi/acpi_bus.h:417:65: note: in definition of macro 'to_acpi_device_node'
     417 |                 typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
         |                                                                 ^~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~
>> include/acpi/acpi_bus.h:419:37: warning: passing argument 1 of 'is_acpi_device_node' makes pointer from integer without a cast [-Wint-conversion]
     419 |                 is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     int
   include/linux/acpi.h:43:41: note: in expansion of macro 'to_acpi_device_node'
      43 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:407:54: note: expected 'const struct fwnode_handle *' but argument is of type 'int'
     407 | bool is_acpi_device_node(const struct fwnode_handle *fwnode);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   In file included from include/linux/list.h:5,
                    from include/linux/kobject.h:19,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:36,
                    from include/linux/acpi.h:13,
                    from drivers/thunderbolt/acpi.c:9:
>> include/linux/container_of.h:19:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                        ^
   include/acpi/acpi_bus.h:420:25: note: in expansion of macro 'container_of'
     420 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:43:41: note: in expansion of macro 'to_acpi_device_node'
      43 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~
   In file included from include/linux/bits.h:22,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/thunderbolt/acpi.c:9:
   include/linux/container_of.h:20:35: error: invalid type argument of unary '*' (have 'int')
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                   ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:420:25: note: in expansion of macro 'container_of'
     420 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:43:41: note: in expansion of macro 'to_acpi_device_node'
      43 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~
   include/linux/container_of.h:21:35: error: invalid type argument of unary '*' (have 'int')
      21 |                       __same_type(*(ptr), void),                        \
         |                                   ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:420:25: note: in expansion of macro 'container_of'
     420 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:43:41: note: in expansion of macro 'to_acpi_device_node'
      43 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:299:27: error: expression in static assertion is not an integer
     299 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:420:25: note: in expansion of macro 'container_of'
     420 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:43:41: note: in expansion of macro 'to_acpi_device_node'
      43 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~


vim +/is_acpi_device_node +419 include/acpi/acpi_bus.h

8a0662d9ed2968 Rafael J. Wysocki 2014-11-04  414  
8b9d6802583a1e Sakari Ailus      2017-07-21  415  #define to_acpi_device_node(__fwnode)					\
8b9d6802583a1e Sakari Ailus      2017-07-21  416  	({								\
8b9d6802583a1e Sakari Ailus      2017-07-21  417  		typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
8b9d6802583a1e Sakari Ailus      2017-07-21  418  									\
8b9d6802583a1e Sakari Ailus      2017-07-21 @419  		is_acpi_device_node(__to_acpi_device_node_fwnode) ?	\
8b9d6802583a1e Sakari Ailus      2017-07-21  420  			container_of(__to_acpi_device_node_fwnode,	\
8b9d6802583a1e Sakari Ailus      2017-07-21  421  				     struct acpi_device, fwnode) :	\
8b9d6802583a1e Sakari Ailus      2017-07-21  422  			NULL;						\
8b9d6802583a1e Sakari Ailus      2017-07-21  423  	})
8b9d6802583a1e Sakari Ailus      2017-07-21  424  

:::::: The code at line 419 was first introduced by commit
:::::: 8b9d6802583a1ef6977e4b059f9fa848e6882253 ACPI: Constify acpi_bus helper functions, switch to macros

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
