Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F5F6CBEE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709292971; cv=none; b=N52CsQvxbqBzNEf1zfm0TMxUgWIou2NV1+Kn2koE3TSYs/0GNuXgPQTlJWujvU1Vw+0tUk/NZe9mD8Fe1CKwiLZmK0j4g7xn1MM24sn2tYLt/z3yzuceR67xx4W6mGkTkjRgN7v5u8bPFv5HWh5bkshVEYaZvW/d0lWRdA7jv6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709292971; c=relaxed/simple;
	bh=NdZEpkWYiBl8ZKC/JYVmymIdYZ9fnYPm7f0iN3ZyMBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o6DWSohywdfiHd1LpC6h9YWbXF0Jydzi9X5qOrNSVjLN7J0S90AXcstXKw+XPtunvDiMhIIGHTOUnnYSp9HjLv9/+tYn0ESx6jrVqIsFCcc1OJ6FWL4rFDPRq9Z1d5w17ZCYDrA04CbeytQNlL5RvhlBvTKxKEPqeb6T3GDjO5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lhd5hpsL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lhd5hpsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709292968; x=1740828968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NdZEpkWYiBl8ZKC/JYVmymIdYZ9fnYPm7f0iN3ZyMBs=;
  b=Lhd5hpsL3Jnbbcw56qoYnAF2XYCqxoZia9Msi7qRn1MaMHdLFF52A+Xf
   loWvuvltfxTIjS9cPrYuFMGnZ7FCwRw8FiHeIhZ70gK8QrNfhguF8lrSW
   wR9fCoo2z6d5Sfa68ghxGVDzzJ8bakgxwu58BTR90+AZARnLx6SV4taKj
   LUjXmnxOsPoLCTtpOxyULX7loQCHt2UN+vau7BPrS01Vdg4t4+nwPDHXW
   NDJtr9Q1eL7oq7uY3i+ZiVm0jbaye/X6Q08/vjrh0CTkJp2YQztuAVrp2
   lena1kLqIFr7wHZoViU+UaWN0WX4UHqWIEFy+6XOdD94kH6lb4EqsQajw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14466294"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="14466294"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 03:36:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="12880626"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Mar 2024 03:36:06 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg1BL-000Dp5-0U;
	Fri, 01 Mar 2024 11:36:03 +0000
Date: Fri, 1 Mar 2024 19:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 1/2]
 include/linux/container_of.h:19:54: error: invalid use of undefined type
 'struct android_uevent_opts'
Message-ID: <202403011907.3crDz5LD-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240301/202403011907.3crDz5LD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011907.3crDz5LD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011907.3crDz5LD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/usb/composite.h:30,
                    from drivers/usb/gadget/config.c:18:
   include/linux/usb/android_configfs_uevent.h: In function 'android_remove_function_device':
>> include/linux/usb/android_configfs_uevent.h:55:1: warning: no return statement in function returning non-void [-Wreturn-type]
      55 | }
         | ^
--
   In file included from drivers/usb/gadget/android_configfs_uevent.c:5:
>> drivers/usb/gadget/android_configfs_uevent.h:125:48: warning: 'struct android_uevent_opts' declared inside parameter list will not be visible outside of this definition or declaration
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
>> include/linux/container_of.h:19:54: error: invalid use of undefined type 'struct android_uevent_opts'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:19:44: note: in expansion of macro 'container_of'
      19 |         struct android_uevent_opts *opts = container_of(data,
         |                                            ^~~~~~~~~~~~
>> include/linux/compiler_types.h:298:27: error: expression in static assertion is not an integer
     298 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:19:44: note: in expansion of macro 'container_of'
      19 |         struct android_uevent_opts *opts = container_of(data,
         |                                            ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/arm64/include/asm/rwonce.h:71,
                    from include/linux/compiler.h:247,
                    from include/linux/dev_printk.h:14:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct android_uevent_opts'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:22:28: note: in expansion of macro 'offsetof'
      22 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:19:44: note: in expansion of macro 'container_of'
      19 |         struct android_uevent_opts *opts = container_of(data,
         |                                            ^~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:43:18: error: invalid use of undefined type 'struct android_uevent_opts'
      43 |         if (!opts->dev) {
         |                  ^~
   drivers/usb/gadget/android_configfs_uevent.c:48:17: error: invalid use of undefined type 'struct android_uevent_opts'
      48 |         if (opts->connected != opts->sw_connected) {
         |                 ^~
   drivers/usb/gadget/android_configfs_uevent.c:48:36: error: invalid use of undefined type 'struct android_uevent_opts'
      48 |         if (opts->connected != opts->sw_connected) {
         |                                    ^~
   drivers/usb/gadget/android_configfs_uevent.c:49:25: error: invalid use of undefined type 'struct android_uevent_opts'
      49 |                 if (opts->connected)
         |                         ^~
   drivers/usb/gadget/android_configfs_uevent.c:53:21: error: invalid use of undefined type 'struct android_uevent_opts'
      53 |                 opts->sw_connected = opts->connected;
         |                     ^~
   drivers/usb/gadget/android_configfs_uevent.c:53:42: error: invalid use of undefined type 'struct android_uevent_opts'
      53 |                 opts->sw_connected = opts->connected;
         |                                          ^~
   drivers/usb/gadget/android_configfs_uevent.c:55:17: error: invalid use of undefined type 'struct android_uevent_opts'
      55 |         if (opts->configured)
         |                 ^~
   drivers/usb/gadget/android_configfs_uevent.c:67:45: error: invalid use of undefined type 'struct android_uevent_opts'
      67 |                 if (kobject_uevent_env(&opts->dev->kobj, KOBJ_CHANGE, connected_strs)) {
         |                                             ^~
   drivers/usb/gadget/android_configfs_uevent.c:68:37: error: invalid use of undefined type 'struct android_uevent_opts'
      68 |                         dev_err(opts->dev, "Failed to send connected uevent\n");
         |                                     ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/usb/gadget/android_configfs_uevent.c:68:25: note: in expansion of macro 'dev_err'
      68 |                         dev_err(opts->dev, "Failed to send connected uevent\n");
         |                         ^~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:70:37: error: invalid use of undefined type 'struct android_uevent_opts'
      70 |                         dev_dbg(opts->dev, "sent uevent %s\n", connected_strs[0]);
         |                                     ^~
   include/linux/dev_printk.h:129:36: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                    ^~~
   drivers/usb/gadget/android_configfs_uevent.c:70:25: note: in expansion of macro 'dev_dbg'
      70 |                         dev_dbg(opts->dev, "sent uevent %s\n", connected_strs[0]);
         |                         ^~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:75:17: error: invalid use of undefined type 'struct android_uevent_opts'
      75 |         if (opts->configured) {
         |                 ^~
   drivers/usb/gadget/android_configfs_uevent.c:76:45: error: invalid use of undefined type 'struct android_uevent_opts'
      76 |                 if (kobject_uevent_env(&opts->dev->kobj, KOBJ_CHANGE, configured_strs)) {
         |                                             ^~
   drivers/usb/gadget/android_configfs_uevent.c:77:37: error: invalid use of undefined type 'struct android_uevent_opts'
      77 |                         dev_err(opts->dev, "Failed to send configured uevent\n");
         |                                     ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/usb/gadget/android_configfs_uevent.c:77:25: note: in expansion of macro 'dev_err'
      77 |                         dev_err(opts->dev, "Failed to send configured uevent\n");
         |                         ^~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:79:37: error: invalid use of undefined type 'struct android_uevent_opts'
      79 |                         dev_dbg(opts->dev, "sent uevent %s\n", configured_strs[0]);
         |                                     ^~
   include/linux/dev_printk.h:129:36: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                    ^~~
   drivers/usb/gadget/android_configfs_uevent.c:79:25: note: in expansion of macro 'dev_dbg'
      79 |                         dev_dbg(opts->dev, "sent uevent %s\n", configured_strs[0]);
         |                         ^~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:85:45: error: invalid use of undefined type 'struct android_uevent_opts'
      85 |                 if (kobject_uevent_env(&opts->dev->kobj, KOBJ_CHANGE, disconnected_strs)) {
         |                                             ^~
   drivers/usb/gadget/android_configfs_uevent.c:86:37: error: invalid use of undefined type 'struct android_uevent_opts'
      86 |                         dev_err(opts->dev, "Failed to send disconnected uevent\n");
         |                                     ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/usb/gadget/android_configfs_uevent.c:86:25: note: in expansion of macro 'dev_err'
      86 |                         dev_err(opts->dev, "Failed to send disconnected uevent\n");
         |                         ^~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:88:37: error: invalid use of undefined type 'struct android_uevent_opts'
      88 |                         dev_dbg(opts->dev, "sent uevent %s\n", disconnected_strs[0]);
         |                                     ^~
   include/linux/dev_printk.h:129:36: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                    ^~~
   drivers/usb/gadget/android_configfs_uevent.c:88:25: note: in expansion of macro 'dev_dbg'
      88 |                         dev_dbg(opts->dev, "sent uevent %s\n", disconnected_strs[0]);
         |                         ^~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:100:29: error: invalid use of undefined type 'struct android_uevent_opts'
     100 |                 dev_dbg(opts->dev, "did not send uevent\n");
         |                             ^~
   include/linux/dev_printk.h:129:36: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                    ^~~
   drivers/usb/gadget/android_configfs_uevent.c:100:17: note: in expansion of macro 'dev_dbg'
     100 |                 dev_dbg(opts->dev, "did not send uevent\n");
         |                 ^~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:28:14: warning: variable 'configured' set but not used [-Wunused-but-set-variable]
      28 |         bool configured = false;
         |              ^~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c: In function 'state_show':
   drivers/usb/gadget/android_configfs_uevent.c:112:17: error: invalid use of undefined type 'struct android_uevent_opts'
     112 |         if (opts->configured)
         |                 ^~
   drivers/usb/gadget/android_configfs_uevent.c:114:22: error: invalid use of undefined type 'struct android_uevent_opts'
     114 |         else if (opts->connected)
         |                      ^~
   drivers/usb/gadget/android_configfs_uevent.c: At top level:
>> drivers/usb/gadget/android_configfs_uevent.c:133:5: error: redefinition of 'android_class_create'
     133 | int android_class_create(void)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.h:116:19: note: previous definition of 'android_class_create' with type 'int(void)'
     116 | static inline int android_class_create(void)
         |                   ^~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:139:6: error: redefinition of 'android_class_destroy'
     139 | void android_class_destroy(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.h:121:20: note: previous definition of 'android_class_destroy' with type 'void(void)'
     121 | static inline void android_class_destroy(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:145:5: error: conflicting types for 'android_device_create'; have 'int(struct android_uevent_opts *)'
     145 | int android_device_create(struct android_uevent_opts *opts)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.h:125:19: note: previous definition of 'android_device_create' with type 'int(struct android_uevent_opts *)'
     125 | static inline int android_device_create(struct android_uevent_opts *opts)
         |                   ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/rhashtable-types.h:15,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15,
                    from include/linux/ratelimit.h:6:
   drivers/usb/gadget/android_configfs_uevent.c: In function 'android_device_create':
   drivers/usb/gadget/android_configfs_uevent.c:150:24: error: invalid use of undefined type 'struct android_uevent_opts'
     150 |         INIT_WORK(&opts->work, android_work);
         |                        ^~
   include/linux/workqueue.h:242:30: note: in definition of macro '__INIT_WORK_KEY'
     242 |                 __init_work((_work), _onstack);                         \
         |                              ^~~~~
   include/linux/workqueue.h:257:9: note: in expansion of macro '__INIT_WORK'
     257 |         __INIT_WORK((_work), (_func), 0)
         |         ^~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:150:9: note: in expansion of macro 'INIT_WORK'
     150 |         INIT_WORK(&opts->work, android_work);
         |         ^~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:150:24: error: invalid use of undefined type 'struct android_uevent_opts'
     150 |         INIT_WORK(&opts->work, android_work);
         |                        ^~
   include/linux/workqueue.h:243:18: note: in definition of macro '__INIT_WORK_KEY'
     243 |                 (_work)->data = (atomic_long_t) WORK_DATA_INIT();       \
         |                  ^~~~~
   include/linux/workqueue.h:257:9: note: in expansion of macro '__INIT_WORK'
     257 |         __INIT_WORK((_work), (_func), 0)
         |         ^~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:150:9: note: in expansion of macro 'INIT_WORK'
     150 |         INIT_WORK(&opts->work, android_work);
         |         ^~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:150:24: error: invalid use of undefined type 'struct android_uevent_opts'
     150 |         INIT_WORK(&opts->work, android_work);
         |                        ^~
   include/linux/workqueue.h:244:34: note: in definition of macro '__INIT_WORK_KEY'
     244 |                 INIT_LIST_HEAD(&(_work)->entry);                        \
         |                                  ^~~~~
   include/linux/workqueue.h:257:9: note: in expansion of macro '__INIT_WORK'
     257 |         __INIT_WORK((_work), (_func), 0)
         |         ^~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:150:9: note: in expansion of macro 'INIT_WORK'
     150 |         INIT_WORK(&opts->work, android_work);
         |         ^~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:150:24: error: invalid use of undefined type 'struct android_uevent_opts'
     150 |         INIT_WORK(&opts->work, android_work);
         |                        ^~
   include/linux/workqueue.h:245:18: note: in definition of macro '__INIT_WORK_KEY'
     245 |                 (_work)->func = (_func);                                \
         |                  ^~~~~
   include/linux/workqueue.h:257:9: note: in expansion of macro '__INIT_WORK'
     257 |         __INIT_WORK((_work), (_func), 0)
         |         ^~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:150:9: note: in expansion of macro 'INIT_WORK'
     150 |         INIT_WORK(&opts->work, android_work);
         |         ^~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c:152:13: error: invalid use of undefined type 'struct android_uevent_opts'
     152 |         opts->device_id = ida_alloc(&android_ida, GFP_KERNEL);
         |             ^~
   drivers/usb/gadget/android_configfs_uevent.c:153:17: error: invalid use of undefined type 'struct android_uevent_opts'
     153 |         if (opts->device_id < 0)
         |                 ^~
   drivers/usb/gadget/android_configfs_uevent.c:154:28: error: invalid use of undefined type 'struct android_uevent_opts'
     154 |                 return opts->device_id;
         |                            ^~
   drivers/usb/gadget/android_configfs_uevent.c:156:13: error: invalid use of undefined type 'struct android_uevent_opts'
     156 |         opts->dev = device_create(&android_usb_class, NULL, MKDEV(0, 0),
         |             ^~
   drivers/usb/gadget/android_configfs_uevent.c:157:55: error: invalid use of undefined type 'struct android_uevent_opts'
     157 |                                opts, "android%d", opts->device_id);
         |                                                       ^~
   drivers/usb/gadget/android_configfs_uevent.c:158:24: error: invalid use of undefined type 'struct android_uevent_opts'
     158 |         if (IS_ERR(opts->dev))
         |                        ^~
   drivers/usb/gadget/android_configfs_uevent.c:159:36: error: invalid use of undefined type 'struct android_uevent_opts'
     159 |                 return PTR_ERR(opts->dev);
         |                                    ^~
   drivers/usb/gadget/android_configfs_uevent.c:161:23: error: invalid use of undefined type 'struct android_uevent_opts'
     161 |         ida_init(&opts->function_ida);
         |                       ^~
   drivers/usb/gadget/android_configfs_uevent.c: At top level:
>> drivers/usb/gadget/android_configfs_uevent.c:170:6: error: conflicting types for 'android_device_destroy'; have 'void(struct android_uevent_opts *)'
     170 | void android_device_destroy(struct android_uevent_opts *opts)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.h:130:20: note: previous definition of 'android_device_destroy' with type 'void(struct android_uevent_opts *)'
     130 | static inline void android_device_destroy(struct android_uevent_opts *opts)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c: In function 'android_device_destroy':
   drivers/usb/gadget/android_configfs_uevent.c:175:17: error: invalid use of undefined type 'struct android_uevent_opts'
     175 |         if (opts->device_id >= 0)
         |                 ^~
   drivers/usb/gadget/android_configfs_uevent.c:176:44: error: invalid use of undefined type 'struct android_uevent_opts'
     176 |                 ida_free(&android_ida, opts->device_id);
         |                                            ^~
   drivers/usb/gadget/android_configfs_uevent.c:179:26: error: invalid use of undefined type 'struct android_uevent_opts'
     179 |         ida_destroy(&opts->function_ida);
         |                          ^~
   drivers/usb/gadget/android_configfs_uevent.c:180:28: error: invalid use of undefined type 'struct android_uevent_opts'
     180 |         device_destroy(opts->dev->class, opts->dev->devt);
         |                            ^~
   drivers/usb/gadget/android_configfs_uevent.c:180:46: error: invalid use of undefined type 'struct android_uevent_opts'
     180 |         device_destroy(opts->dev->class, opts->dev->devt);
         |                                              ^~
   drivers/usb/gadget/android_configfs_uevent.c:181:13: error: invalid use of undefined type 'struct android_uevent_opts'
     181 |         opts->dev = NULL;
         |             ^~
   drivers/usb/gadget/android_configfs_uevent.c: At top level:
>> drivers/usb/gadget/android_configfs_uevent.c:186:6: warning: no previous prototype for '__android_set_connected' [-Wmissing-prototypes]
     186 | void __android_set_connected(struct android_uevent_opts *opts, bool connected)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c: In function '__android_set_connected':
   drivers/usb/gadget/android_configfs_uevent.c:192:17: error: invalid use of undefined type 'struct android_uevent_opts'
     192 |         if (opts->connected != connected) {
         |                 ^~
   drivers/usb/gadget/android_configfs_uevent.c:193:21: error: invalid use of undefined type 'struct android_uevent_opts'
     193 |                 opts->connected = connected;
         |                     ^~
   drivers/usb/gadget/android_configfs_uevent.c:194:36: error: invalid use of undefined type 'struct android_uevent_opts'
     194 |                 schedule_work(&opts->work);
         |                                    ^~
   drivers/usb/gadget/android_configfs_uevent.c: At top level:
>> drivers/usb/gadget/android_configfs_uevent.c:199:6: warning: no previous prototype for '__android_set_configured' [-Wmissing-prototypes]
     199 | void __android_set_configured(struct android_uevent_opts *opts, bool configured)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c: In function '__android_set_configured':
   drivers/usb/gadget/android_configfs_uevent.c:205:17: error: invalid use of undefined type 'struct android_uevent_opts'
     205 |         if (opts->configured != configured) {
         |                 ^~
   drivers/usb/gadget/android_configfs_uevent.c:206:21: error: invalid use of undefined type 'struct android_uevent_opts'
     206 |                 opts->configured = configured;
         |                     ^~
   drivers/usb/gadget/android_configfs_uevent.c:207:36: error: invalid use of undefined type 'struct android_uevent_opts'
     207 |                 schedule_work(&opts->work);
         |                                    ^~
   drivers/usb/gadget/android_configfs_uevent.c: At top level:
>> drivers/usb/gadget/android_configfs_uevent.c:212:6: error: conflicting types for 'android_set_connected'; have 'void(struct android_uevent_opts *)'
     212 | void android_set_connected(struct android_uevent_opts *opts)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.h:134:20: note: previous definition of 'android_set_connected' with type 'void(struct android_uevent_opts *)'
     134 | static inline void android_set_connected(struct android_uevent_opts *opts)
         |                    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:218:6: error: conflicting types for 'android_set_disconnected'; have 'void(struct android_uevent_opts *)'
     218 | void android_set_disconnected(struct android_uevent_opts *opts)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.h:138:20: note: previous definition of 'android_set_disconnected' with type 'void(struct android_uevent_opts *)'
     138 | static inline void android_set_disconnected(struct android_uevent_opts *opts)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:224:6: error: conflicting types for 'android_set_configured'; have 'void(struct android_uevent_opts *)'
     224 | void android_set_configured(struct android_uevent_opts *opts)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.h:142:20: note: previous definition of 'android_set_configured' with type 'void(struct android_uevent_opts *)'
     142 | static inline void android_set_configured(struct android_uevent_opts *opts)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:230:6: error: conflicting types for 'android_set_unconfigured'; have 'void(struct android_uevent_opts *)'
     230 | void android_set_unconfigured(struct android_uevent_opts *opts)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.h:146:20: note: previous definition of 'android_set_unconfigured' with type 'void(struct android_uevent_opts *)'
     146 | static inline void android_set_unconfigured(struct android_uevent_opts *opts)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:236:16: warning: no previous prototype for 'android_create_function_device' [-Wmissing-prototypes]
     236 | struct device *android_create_function_device(char *name, void *drvdata,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c: In function 'android_create_function_device':
   drivers/usb/gadget/android_configfs_uevent.c:246:56: error: invalid use of undefined type 'struct android_uevent_opts'
     246 |         if (IS_ERR_OR_NULL(opts) || IS_ERR_OR_NULL(opts->dev)) {
         |                                                        ^~
   drivers/usb/gadget/android_configfs_uevent.c:251:29: error: invalid use of undefined type 'struct android_uevent_opts'
     251 |         id = ida_alloc(&opts->function_ida, GFP_KERNEL);
         |                             ^~
   drivers/usb/gadget/android_configfs_uevent.c:257:65: error: invalid use of undefined type 'struct android_uevent_opts'
     257 |         dev = device_create_with_groups(&android_usb_class, opts->dev,
         |                                                                 ^~
   drivers/usb/gadget/android_configfs_uevent.c: At top level:
>> drivers/usb/gadget/android_configfs_uevent.c:264:6: warning: no previous prototype for 'android_remove_function_device' [-Wmissing-prototypes]
     264 | void android_remove_function_device(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/android_configfs_uevent.c: In function 'android_remove_function_device':
   drivers/usb/gadget/android_configfs_uevent.c:278:23: error: invalid use of undefined type 'struct android_uevent_opts'
     278 |         ida_free(&opts->function_ida, MINOR(dev->devt));
         |                       ^~


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
