Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3316F06C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709303002; cv=none; b=PDY5pXncJ4ulMSrP+Pg6lWqtL8NUoBvHzdb2Hg1rqAVjTTH8N+TJyX22FazA6Tud6ki5G5hKoBagSjyU0LZoJ6WiBhAl61pOR3fod330arXowS8224Q40TBQWDErGPHf/sEHJqv4OjPKMBBVHgJeltoNwdS6oyUxFZBFsFl9MuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709303002; c=relaxed/simple;
	bh=JZRLeFucQ9DZEFe7f4XTKy2yFOIDKG23tiuJujVzttc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cf7TpxMuSywEyjAhXlW9QIba3uLzHmJNwtquq+MsOQfbDTjntGo0ZznXZt539efhX1CfdGHxvkOmSv/Xye7sjrlwUqdQQw07XJu8/7rwQYslNzwJJky64578b8oVw/vwTzhg/yjHj1edSQhSaP2pYs+sQvYZTGELdArzBHst3/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgkmeyDo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgkmeyDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709303000; x=1740839000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JZRLeFucQ9DZEFe7f4XTKy2yFOIDKG23tiuJujVzttc=;
  b=LgkmeyDoQgwub8V3zJEwQuPnO4MNcIZv5hO1bZrN98NxRFsQhTfXFGH6
   kmhL/RGMZjiaHV8sSYvSsgZhn5S2SbaSzDETuRIPnMktRoE9fi/D1/ZCf
   DrAYE8aPdfB/TfZhMDpfiEH8vWndTTvgmbHNFn5xlkqm49wnjLXGGC/cV
   TfasbaOET7UD5RHbr5mgo0NpWe49VJgJoOOEWBPAonUujrIx608BiDIa7
   D4YYGZE3+ByYBCw9TI/oQ4Q6tmBzTtLk3+JnSOa7RNIExaCu7YOvbjBcO
   AyL/81c90tlrO/JoPuexUW2LMJrmomdoJNp7CODiWgCL/ZTGyUDb1VB4O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3698859"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="3698859"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 06:23:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8766888"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Mar 2024 06:23:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg3nA-000Dt9-0M;
	Fri, 01 Mar 2024 14:23:16 +0000
Date: Fri, 1 Mar 2024 22:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 1/2]
 include/linux/container_of.h:19:47: error: dereferencing pointer to
 incomplete type 'struct android_uevent_opts'
Message-ID: <202403012247.koBNwqWo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   79d40fcc7f981896f569f51e4c48058128a710ec
commit: 5e9a404dff899b6f6586f99fb19e90d598ae2d6d [1/2] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: i386-randconfig-011-20240301 (https://download.01.org/0day-ci/archive/20240301/202403012247.koBNwqWo-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403012247.koBNwqWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403012247.koBNwqWo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/usb/gadget/android_configfs_uevent.c:5:
   drivers/usb/gadget/android_configfs_uevent.h:125:48: warning: 'struct android_uevent_opts' declared inside parameter list will not be visible outside of this definition or declaration
     125 | static inline int android_device_create(struct android_uevent_opts *opts)
         |                                                ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.h:130:50: warning: 'struct android_uevent_opts' declared inside parameter list will not be visible outside of this definition or declaration
     130 | static inline void android_device_destroy(struct android_uevent_opts *opts)
         |                                                  ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.h:134:49: warning: 'struct android_uevent_opts' declared inside parameter list will not be visible outside of this definition or declaration
     134 | static inline void android_set_connected(struct android_uevent_opts *opts)
         |                                                 ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.h:138:52: warning: 'struct android_uevent_opts' declared inside parameter list will not be visible outside of this definition or declaration
     138 | static inline void android_set_disconnected(struct android_uevent_opts *opts)
         |                                                    ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.h:142:50: warning: 'struct android_uevent_opts' declared inside parameter list will not be visible outside of this definition or declaration
     142 | static inline void android_set_configured(struct android_uevent_opts *opts)
         |                                                  ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.h:146:52: warning: 'struct android_uevent_opts' declared inside parameter list will not be visible outside of this definition or declaration
     146 | static inline void android_set_unconfigured(struct android_uevent_opts *opts)
         |                                                    ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:22,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/usb/gadget/android_configfs_uevent.c:6:
   drivers/usb/gadget/android_configfs_uevent.c: In function 'android_work':
>> include/linux/container_of.h:19:47: error: dereferencing pointer to incomplete type 'struct android_uevent_opts'
      19 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                                               ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:2: note: in expansion of macro 'static_assert'
      19 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |  ^~~~~~~~~~~~~
   include/linux/container_of.h:19:16: note: in expansion of macro '__same_type'
      19 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                ^~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:19:37: note: in expansion of macro 'container_of'
      19 |  struct android_uevent_opts *opts = container_of(data,
         |                                     ^~~~~~~~~~~~
   include/linux/compiler_types.h:298:27: error: expression in static assertion is not an integer
     298 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:2: note: in expansion of macro 'static_assert'
      19 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |  ^~~~~~~~~~~~~
   include/linux/container_of.h:19:16: note: in expansion of macro '__same_type'
      19 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                ^~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:19:37: note: in expansion of macro 'container_of'
      19 |  struct android_uevent_opts *opts = container_of(data,
         |                                     ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from drivers/usb/gadget/android_configfs_uevent.c:6:
   include/linux/stddef.h:16:32: error: invalid use of undefined type 'struct android_uevent_opts'
      16 | #define offsetof(TYPE, MEMBER) __builtin_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:22:21: note: in expansion of macro 'offsetof'
      22 |  ((type *)(__mptr - offsetof(type, member))); })
         |                     ^~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:19:37: note: in expansion of macro 'container_of'
      19 |  struct android_uevent_opts *opts = container_of(data,
         |                                     ^~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:28:7: warning: variable 'configured' set but not used [-Wunused-but-set-variable]
      28 |  bool configured = false;
         |       ^~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c: At top level:
   drivers/usb/gadget/android_configfs_uevent.c:133:5: error: redefinition of 'android_class_create'
     133 | int android_class_create(void)
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/gadget/android_configfs_uevent.c:5:
   drivers/usb/gadget/android_configfs_uevent.h:116:19: note: previous definition of 'android_class_create' was here
     116 | static inline int android_class_create(void)
         |                   ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:139:6: error: redefinition of 'android_class_destroy'
     139 | void android_class_destroy(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/gadget/android_configfs_uevent.c:5:
   drivers/usb/gadget/android_configfs_uevent.h:121:20: note: previous definition of 'android_class_destroy' was here
     121 | static inline void android_class_destroy(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:145:5: error: conflicting types for 'android_device_create'
     145 | int android_device_create(struct android_uevent_opts *opts)
         |     ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/gadget/android_configfs_uevent.c:5:
   drivers/usb/gadget/android_configfs_uevent.h:125:19: note: previous definition of 'android_device_create' was here
     125 | static inline int android_device_create(struct android_uevent_opts *opts)
         |                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:170:6: error: conflicting types for 'android_device_destroy'
     170 | void android_device_destroy(struct android_uevent_opts *opts)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/gadget/android_configfs_uevent.c:5:
   drivers/usb/gadget/android_configfs_uevent.h:130:20: note: previous definition of 'android_device_destroy' was here
     130 | static inline void android_device_destroy(struct android_uevent_opts *opts)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:186:6: warning: no previous prototype for '__android_set_connected' [-Wmissing-prototypes]
     186 | void __android_set_connected(struct android_uevent_opts *opts, bool connected)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:199:6: warning: no previous prototype for '__android_set_configured' [-Wmissing-prototypes]
     199 | void __android_set_configured(struct android_uevent_opts *opts, bool configured)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:212:6: error: conflicting types for 'android_set_connected'
     212 | void android_set_connected(struct android_uevent_opts *opts)
         |      ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/gadget/android_configfs_uevent.c:5:
   drivers/usb/gadget/android_configfs_uevent.h:134:20: note: previous definition of 'android_set_connected' was here
     134 | static inline void android_set_connected(struct android_uevent_opts *opts)
         |                    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:218:6: error: conflicting types for 'android_set_disconnected'
     218 | void android_set_disconnected(struct android_uevent_opts *opts)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/gadget/android_configfs_uevent.c:5:
   drivers/usb/gadget/android_configfs_uevent.h:138:20: note: previous definition of 'android_set_disconnected' was here
     138 | static inline void android_set_disconnected(struct android_uevent_opts *opts)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:224:6: error: conflicting types for 'android_set_configured'
     224 | void android_set_configured(struct android_uevent_opts *opts)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/gadget/android_configfs_uevent.c:5:
   drivers/usb/gadget/android_configfs_uevent.h:142:20: note: previous definition of 'android_set_configured' was here
     142 | static inline void android_set_configured(struct android_uevent_opts *opts)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:230:6: error: conflicting types for 'android_set_unconfigured'
     230 | void android_set_unconfigured(struct android_uevent_opts *opts)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/gadget/android_configfs_uevent.c:5:
   drivers/usb/gadget/android_configfs_uevent.h:146:20: note: previous definition of 'android_set_unconfigured' was here
     146 | static inline void android_set_unconfigured(struct android_uevent_opts *opts)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:236:16: warning: no previous prototype for 'android_create_function_device' [-Wmissing-prototypes]
     236 | struct device *android_create_function_device(char *name, void *drvdata,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:264:6: warning: no previous prototype for 'android_remove_function_device' [-Wmissing-prototypes]
     264 | void android_remove_function_device(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +19 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko  2021-11-08   9  
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  15   *
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  16   */
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  17  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  18  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6df Rasmus Villemoes 2021-11-08 @19  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  20  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  21  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  22  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  23  

:::::: The code at line 19 was first introduced by commit
:::::: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: switch to static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
