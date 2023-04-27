Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E7E1FCC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 08:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682583139; x=1714119139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cH21vdg1RYPn1H/wWWLnTDoatGLkNK88nsQtWyo2AuM=;
  b=JTBZvypZJSZwPPQ95mUBmgrSg0OP73NBdC7fUQRwwzswt8ex0lXdEIBb
   40jFyzGMCPkbCTn7k3VVeQ76W6p9ZxIwtp8PkVD5VMOCPbMymEG4+RNdY
   FRvnMh1HooKmgVKA491eRltCcR8V+/sroGDW18TI9AbIF3dUrURjJMeyp
   JVMTpxR9aa071dQp9Uyi+Y29Kb1n/hi4v+Qe6R3EQmgmBQirGqXyn8FEa
   pr2ZUc4I+87BILMbQv2d7ObLj3JzeyCz372ngZinUo+/gElQMhdjCMQEY
   UTrMN4aujGcYD9ABwYzLG2t8BRXbV6jtywAiKzyJ+2M0V6y6nqlhLHKaN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="412702208"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="412702208"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 01:12:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="805870384"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="805870384"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2023 01:12:17 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prwjg-00007F-2y;
	Thu, 27 Apr 2023 08:12:16 +0000
Date: Thu, 27 Apr 2023 16:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 56/56] sound/aoa/fabrics/layout.c:786:40:
 error: invalid use of undefined type 'struct device_node'
Message-ID: <202304271620.7dEcxZGl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   4cc2262d09430892703b2d82d4a48f65679a8b53
commit: 4cc2262d09430892703b2d82d4a48f65679a8b53 [56/56] of: header cleanups
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230427/202304271620.7dEcxZGl-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=4cc2262d09430892703b2d82d4a48f65679a8b53
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 4cc2262d09430892703b2d82d4a48f65679a8b53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash sound/aoa/fabrics/ sound/aoa/soundbus/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271620.7dEcxZGl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from sound/aoa/fabrics/../aoa.h:16,
                    from sound/aoa/fabrics/layout.c:14:
>> sound/aoa/fabrics/../soundbus/soundbus.h:143:32: error: field 'ofdev' has incomplete type
     143 |         struct platform_device ofdev;
         |                                ^~~~~
   sound/aoa/fabrics/layout.c: In function 'check_codec':
>> sound/aoa/fabrics/layout.c:777:13: error: implicit declaration of function 'of_node_name_eq' [-Werror=implicit-function-declaration]
     777 |         if (of_node_name_eq(codec->node, "codec")) {
         |             ^~~~~~~~~~~~~~~
>> sound/aoa/fabrics/layout.c:780:23: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]
     780 |                 ref = of_get_property(ldev->sound, propname, NULL);
         |                       ^~~~~~~~~~~~~~~
>> sound/aoa/fabrics/layout.c:780:21: warning: assignment to 'const u32 *' {aka 'const unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     780 |                 ref = of_get_property(ldev->sound, propname, NULL);
         |                     ^
>> sound/aoa/fabrics/layout.c:786:40: error: invalid use of undefined type 'struct device_node'
     786 |                 if (*ref != codec->node->phandle) {
         |                                        ^~
   sound/aoa/fabrics/layout.c: In function 'aoa_fabric_layout_probe':
>> sound/aoa/fabrics/layout.c:1009:9: error: implicit declaration of function 'for_each_child_of_node'; did you mean 'for_each_online_node'? [-Werror=implicit-function-declaration]
    1009 |         for_each_child_of_node(sdev->ofdev.dev.of_node, sound) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         for_each_online_node
>> sound/aoa/fabrics/layout.c:1009:63: error: expected ';' before '{' token
    1009 |         for_each_child_of_node(sdev->ofdev.dev.of_node, sound) {
         |                                                               ^~
         |                                                               ;
>> sound/aoa/fabrics/layout.c:1016:12: warning: assignment to 'const unsigned int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1016 |         id = of_get_property(sound, "layout-id", NULL);
         |            ^
   sound/aoa/fabrics/layout.c:1020:20: warning: assignment to 'const unsigned int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1020 |                 id = of_get_property(sound, "device-id", NULL);
         |                    ^
   sound/aoa/fabrics/layout.c:1038:32: error: invalid use of undefined type 'struct device_node'
    1038 |         ldev->gpio.node = sound->parent;
         |                                ^~
>> sound/aoa/fabrics/layout.c:1092:9: error: implicit declaration of function 'of_node_put' [-Werror=implicit-function-declaration]
    1092 |         of_node_put(sound);
         |         ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from sound/aoa/soundbus/core.c:9:
>> sound/aoa/soundbus/soundbus.h:143:32: error: field 'ofdev' has incomplete type
     143 |         struct platform_device ofdev;
         |                                ^~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from sound/aoa/soundbus/core.c:8:
   sound/aoa/soundbus/core.c: In function 'soundbus_dev_get':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   sound/aoa/soundbus/soundbus.h:172:31: note: in expansion of macro 'container_of'
     172 | #define to_soundbus_device(d) container_of(d, struct soundbus_dev, ofdev.dev)
         |                               ^~~~~~~~~~~~
   sound/aoa/soundbus/core.c:23:24: note: in expansion of macro 'to_soundbus_device'
      23 |                 return to_soundbus_device(tmp);
         |                        ^~~~~~~~~~~~~~~~~~
   sound/aoa/soundbus/core.c: In function 'soundbus_probe':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   sound/aoa/soundbus/soundbus.h:172:31: note: in expansion of macro 'container_of'
     172 | #define to_soundbus_device(d) container_of(d, struct soundbus_dev, ofdev.dev)
         |                               ^~~~~~~~~~~~
   sound/aoa/soundbus/core.c:43:24: note: in expansion of macro 'to_soundbus_device'
      43 |         soundbus_dev = to_soundbus_device(dev);
         |                        ^~~~~~~~~~~~~~~~~~
   sound/aoa/soundbus/core.c: In function 'soundbus_uevent':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   sound/aoa/soundbus/soundbus.h:172:31: note: in expansion of macro 'container_of'
     172 | #define to_soundbus_device(d) container_of(d, struct soundbus_dev, ofdev.dev)
         |                               ^~~~~~~~~~~~
   sound/aoa/soundbus/core.c:69:24: note: in expansion of macro 'to_soundbus_device'
      69 |         soundbus_dev = to_soundbus_device(dev);
         |                        ^~~~~~~~~~~~~~~~~~
>> sound/aoa/soundbus/core.c:76:57: error: invalid use of undefined type 'const struct platform_device'
      76 |         retval = add_uevent_var(env, "OF_NAME=%pOFn", of->dev.of_node);
         |                                                         ^~
>> sound/aoa/soundbus/core.c:80:52: error: implicit declaration of function 'of_node_get_device_type' [-Werror=implicit-function-declaration]
      80 |         retval = add_uevent_var(env, "OF_TYPE=%s", of_node_get_device_type(of->dev.of_node));
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/aoa/soundbus/core.c:80:78: error: invalid use of undefined type 'const struct platform_device'
      80 |         retval = add_uevent_var(env, "OF_TYPE=%s", of_node_get_device_type(of->dev.of_node));
         |                                                                              ^~
>> sound/aoa/soundbus/core.c:88:18: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]
      88 |         compat = of_get_property(of->dev.of_node, "compatible", &cplen);
         |                  ^~~~~~~~~~~~~~~
   sound/aoa/soundbus/core.c:88:36: error: invalid use of undefined type 'const struct platform_device'
      88 |         compat = of_get_property(of->dev.of_node, "compatible", &cplen);
         |                                    ^~
   sound/aoa/soundbus/core.c: In function 'soundbus_device_remove':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   sound/aoa/soundbus/soundbus.h:172:31: note: in expansion of macro 'container_of'
     172 | #define to_soundbus_device(d) container_of(d, struct soundbus_dev, ofdev.dev)
         |                               ^~~~~~~~~~~~
   sound/aoa/soundbus/core.c:109:46: note: in expansion of macro 'to_soundbus_device'
     109 |         struct soundbus_dev * soundbus_dev = to_soundbus_device(dev);
         |                                              ^~~~~~~~~~~~~~~~~~
   sound/aoa/soundbus/core.c: In function 'soundbus_device_shutdown':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   sound/aoa/soundbus/soundbus.h:172:31: note: in expansion of macro 'container_of'
     172 | #define to_soundbus_device(d) container_of(d, struct soundbus_dev, ofdev.dev)
         |                               ^~~~~~~~~~~~
   sound/aoa/soundbus/core.c:119:46: note: in expansion of macro 'to_soundbus_device'
     119 |         struct soundbus_dev * soundbus_dev = to_soundbus_device(dev);
         |                                              ^~~~~~~~~~~~~~~~~~
   sound/aoa/soundbus/core.c: In function 'soundbus_add_one':
>> sound/aoa/soundbus/core.c:152:16: error: implicit declaration of function 'of_device_register'; did you mean 'device_register'? [-Werror=implicit-function-declaration]
     152 |         return of_device_register(&dev->ofdev);
         |                ^~~~~~~~~~~~~~~~~~
         |                device_register
   sound/aoa/soundbus/core.c: In function 'soundbus_remove_one':
>> sound/aoa/soundbus/core.c:158:9: error: implicit declaration of function 'of_device_unregister'; did you mean 'root_device_unregister'? [-Werror=implicit-function-declaration]
     158 |         of_device_unregister(&dev->ofdev);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         root_device_unregister
   sound/aoa/soundbus/core.c: In function 'soundbus_dev_get':
   sound/aoa/soundbus/core.c:26:1: error: control reaches end of non-void function [-Werror=return-type]
      26 | }
         | ^
   sound/aoa/soundbus/core.c: In function 'soundbus_add_one':
   sound/aoa/soundbus/core.c:153:1: error: control reaches end of non-void function [-Werror=return-type]
     153 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from sound/aoa/soundbus/sysfs.c:6:
>> sound/aoa/soundbus/soundbus.h:143:32: error: field 'ofdev' has incomplete type
     143 |         struct platform_device ofdev;
         |                                ^~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from sound/aoa/soundbus/sysfs.c:2:
   sound/aoa/soundbus/sysfs.c: In function 'modalias_show':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   sound/aoa/soundbus/soundbus.h:172:31: note: in expansion of macro 'container_of'
     172 | #define to_soundbus_device(d) container_of(d, struct soundbus_dev, ofdev.dev)
         |                               ^~~~~~~~~~~~
   sound/aoa/soundbus/sysfs.c:11:37: note: in expansion of macro 'to_soundbus_device'
      11 |         struct soundbus_dev *sdev = to_soundbus_device(dev);
         |                                     ^~~~~~~~~~~~~~~~~~
>> sound/aoa/soundbus/sysfs.c:18:37: error: invalid use of undefined type 'struct platform_device'
      18 |                                   of->dev.of_node, 'T',
         |                                     ^~
   sound/aoa/soundbus/sysfs.c:19:61: error: invalid use of undefined type 'struct platform_device'
      19 |                                   of_node_get_device_type(of->dev.of_node));
         |                                                             ^~
   sound/aoa/soundbus/sysfs.c: In function 'name_show':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   sound/aoa/soundbus/soundbus.h:172:31: note: in expansion of macro 'container_of'
     172 | #define to_soundbus_device(d) container_of(d, struct soundbus_dev, ofdev.dev)
         |                               ^~~~~~~~~~~~
   sound/aoa/soundbus/sysfs.c:26:37: note: in expansion of macro 'to_soundbus_device'
      26 |         struct soundbus_dev *sdev = to_soundbus_device(dev);
         |                                     ^~~~~~~~~~~~~~~~~~
   sound/aoa/soundbus/sysfs.c:29:45: error: invalid use of undefined type 'struct platform_device'
      29 |         return sysfs_emit(buf, "%pOFn\n", of->dev.of_node);
         |                                             ^~
   sound/aoa/soundbus/sysfs.c: In function 'type_show':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   sound/aoa/soundbus/soundbus.h:172:31: note: in expansion of macro 'container_of'
     172 | #define to_soundbus_device(d) container_of(d, struct soundbus_dev, ofdev.dev)
         |                               ^~~~~~~~~~~~
   sound/aoa/soundbus/sysfs.c:36:37: note: in expansion of macro 'to_soundbus_device'
      36 |         struct soundbus_dev *sdev = to_soundbus_device(dev);
         |                                     ^~~~~~~~~~~~~~~~~~
   sound/aoa/soundbus/sysfs.c:39:66: error: invalid use of undefined type 'struct platform_device'
      39 |         return sysfs_emit(buf, "%s\n", of_node_get_device_type(of->dev.of_node));
         |                                                                  ^~
   sound/aoa/soundbus/sysfs.c: In function 'modalias_show':
   sound/aoa/soundbus/sysfs.c:20:1: error: control reaches end of non-void function [-Werror=return-type]
      20 | }
         | ^
   sound/aoa/soundbus/sysfs.c: In function 'type_show':
   sound/aoa/soundbus/sysfs.c:40:1: error: control reaches end of non-void function [-Werror=return-type]
      40 | }
         | ^
   sound/aoa/soundbus/sysfs.c: In function 'name_show':
   sound/aoa/soundbus/sysfs.c:30:1: error: control reaches end of non-void function [-Werror=return-type]
      30 | }
         | ^
   cc1: some warnings being treated as errors


vim +786 sound/aoa/fabrics/layout.c

f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  767  
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  768  static int check_codec(struct aoa_codec *codec,
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  769  		       struct layout_dev *ldev,
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  770  		       struct codec_connect_info *cci)
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  771  {
a7edd0e676d511 sound/aoa/fabrics/snd-aoa-fabric-layout.c Stephen Rothwell 2007-04-03  772  	const u32 *ref;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  773  	char propname[32];
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  774  	struct codec_connection *cc;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  775  
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  776  	/* if the codec has a 'codec' node, we require a reference */
157ab88ef64a2e sound/aoa/fabrics/layout.c                Rob Herring      2018-12-05 @777  	if (of_node_name_eq(codec->node, "codec")) {
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  778  		snprintf(propname, sizeof(propname),
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  779  			 "platform-%s-codec-ref", codec->name);
c4f55b394505ff sound/aoa/fabrics/snd-aoa-fabric-layout.c Stephen Rothwell 2007-04-03 @780  		ref = of_get_property(ldev->sound, propname, NULL);
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  781  		if (!ref) {
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  782  			printk(KERN_INFO "snd-aoa-fabric-layout: "
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  783  				"required property %s not present\n", propname);
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  784  			return -ENODEV;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  785  		}
6016a363f6b56b sound/aoa/fabrics/layout.c                Grant Likely     2010-01-28 @786  		if (*ref != codec->node->phandle) {
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  787  			printk(KERN_INFO "snd-aoa-fabric-layout: "
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  788  				"%s doesn't match!\n", propname);
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  789  			return -ENODEV;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  790  		}
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  791  	} else {
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  792  		if (layouts_list_items != 1) {
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  793  			printk(KERN_INFO "snd-aoa-fabric-layout: "
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  794  				"more than one soundbus, but no references.\n");
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  795  			return -ENODEV;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  796  		}
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  797  	}
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  798  	codec->soundbus_dev = ldev->sdev;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  799  	codec->gpio = &ldev->gpio;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  800  
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  801  	cc = cci->connections;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  802  	if (!cc)
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  803  		return -EINVAL;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  804  
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  805  	printk(KERN_INFO "snd-aoa-fabric-layout: can use this codec\n");
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  806  
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  807  	codec->connected = 0;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  808  	codec->fabric_data = cc;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  809  
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  810  	while (cc->connected) {
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  811  		codec->connected |= 1<<cc->codec_bit;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  812  		cc++;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  813  	}
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  814  
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  815  	return 0;
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  816  }
f3d9478b2ce468 sound/aoa/fabrics/snd-aoa-fabric-layout.c Johannes Berg    2006-06-21  817  

:::::: The code at line 786 was first introduced by commit
:::::: 6016a363f6b56b46b24655bcfc0499b715851cf3 of: unify phandle name in struct device_node

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
