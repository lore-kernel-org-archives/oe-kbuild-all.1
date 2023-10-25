Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0193D522C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 22:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMch7AdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698271725; x=1729807725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6LhXb07dSec5SrDh5f5JPocHEnuc+lTsscfZHO/YP8=;
  b=hMch7AdG2ZpOEsaDf7ywOQ0an5hQ+U5a2IHu7PTZ0h8cBlzO9Ln1vBUT
   32I2Dhz8JOGHOYJKwQgEMhvIFJFsyezptTOhwLiDao91bI/DTKG/ZDmaK
   IiQVw619c19A/QLWjts9Lm0jg5XRhpuIt55YK4uQv6+8pNZMgavd1korC
   Y0lQelrksHrqM3sny214104WzUgW8Pl5U2uKj8fLiOEdAPlVNLn+YBFCz
   f7GGELdPwMEjuqHp6Ki6QlmKNv70JzkjC+hjvauUpLQY/2uZqtfUsbPup
   3KE0TZQa4KnXrArhmsRsyk7pQrKeygbdUYpVjuqYR3HqWUleNGWg1M2vJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="191191"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="191191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 15:08:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="875670595"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="875670595"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Oct 2023 15:08:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvm3M-0009ES-1a;
	Wed, 25 Oct 2023 22:08:40 +0000
Date: Thu, 26 Oct 2023 06:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v3-2023-10-24 19/27] drivers/dax/extent.c:117:28: error:
 'PMD_SIZE' undeclared; did you mean 'P4D_SIZE'?
Message-ID: <202310260507.CtS3R0VU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v3-2023-10-24
head:   1d3abb0480b0b8503b82e5f02ef95da8b182ba71
commit: 143c58584ca1474ccfbd6b32ffe0a026db8c2a0a [19/27] dax/region: Expose DC extents on DAX region driver load
config: arm-randconfig-004-20231026 (https://download.01.org/0day-ci/archive/20231026/202310260507.CtS3R0VU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310260507.CtS3R0VU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260507.CtS3R0VU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/dax/extent.c:6:
   drivers/dax/dax-private.h:111:30: error: field 'range' has incomplete type
     111 |                 struct range range;
         |                              ^~~~~
   drivers/dax/extent.c: In function 'length_show':
   drivers/dax/extent.c:13:37: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      13 |         return sysfs_emit(buf, "%#llx\n", dr_extent->length);
         |                                 ~~~~^     ~~~~~~~~~~~~~~~~~
         |                                     |              |
         |                                     |              resource_size_t {aka unsigned int}
         |                                     long long unsigned int
         |                                 %#x
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/dax/extent.c:4:
   drivers/dax/extent.c: In function 'dr_release':
   drivers/dax/extent.c:75:34: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      75 |         dev_dbg(&dr_extent->dev, "Unregister DAX region ext OFF:%#llx L:%s\n",
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/dax/extent.c:75:9: note: in expansion of macro 'dev_dbg'
      75 |         dev_dbg(&dr_extent->dev, "Unregister DAX region ext OFF:%#llx L:%s\n",
         |         ^~~~~~~
   drivers/dax/extent.c:75:69: note: format string is defined here
      75 |         dev_dbg(&dr_extent->dev, "Unregister DAX region ext OFF:%#llx L:%s\n",
         |                                                                 ~~~~^
         |                                                                     |
         |                                                                     long long unsigned int
         |                                                                 %#x
   drivers/dax/extent.c: At top level:
   drivers/dax/extent.c:85:6: warning: no previous prototype for 'dr_ext_reg_put' [-Wmissing-prototypes]
      85 | void dr_ext_reg_put(void *data)
         |      ^~~~~~~~~~~~~~
   drivers/dax/extent.c: In function 'dax_region_ext_create_dev':
>> drivers/dax/extent.c:117:28: error: 'PMD_SIZE' undeclared (first use in this function); did you mean 'P4D_SIZE'?
     117 |         dev->id = offset / PMD_SIZE;
         |                            ^~~~~~~~
         |                            P4D_SIZE
   drivers/dax/extent.c:117:28: note: each undeclared identifier is reported only once for each function it appears in
   drivers/dax/extent.c:129:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     129 |         dev_dbg(dev, "DAX region extent OFF:%#llx LEN:%#llx\n", offset, length);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/dax/extent.c:129:9: note: in expansion of macro 'dev_dbg'
     129 |         dev_dbg(dev, "DAX region extent OFF:%#llx LEN:%#llx\n", offset, length);
         |         ^~~~~~~
   drivers/dax/extent.c:129:49: note: format string is defined here
     129 |         dev_dbg(dev, "DAX region extent OFF:%#llx LEN:%#llx\n", offset, length);
         |                                             ~~~~^
         |                                                 |
         |                                                 long long unsigned int
         |                                             %#x
   drivers/dax/extent.c:129:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     129 |         dev_dbg(dev, "DAX region extent OFF:%#llx LEN:%#llx\n", offset, length);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/dax/extent.c:129:9: note: in expansion of macro 'dev_dbg'
     129 |         dev_dbg(dev, "DAX region extent OFF:%#llx LEN:%#llx\n", offset, length);
         |         ^~~~~~~
   drivers/dax/extent.c:129:59: note: format string is defined here
     129 |         dev_dbg(dev, "DAX region extent OFF:%#llx LEN:%#llx\n", offset, length);
         |                                                       ~~~~^
         |                                                           |
         |                                                           long long unsigned int
         |                                                       %#x
   drivers/dax/extent.c:134:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     134 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%#llx LEN:%#llx\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/dax/extent.c:134:9: note: in expansion of macro 'dev_err'
     134 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%#llx LEN:%#llx\n",
         |         ^~~~~~~
   drivers/dax/extent.c:134:67: note: format string is defined here
     134 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%#llx LEN:%#llx\n",
         |                                                               ~~~~^
         |                                                                   |
         |                                                                   long long unsigned int
         |                                                               %#x
   drivers/dax/extent.c:134:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     134 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%#llx LEN:%#llx\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/dax/extent.c:134:9: note: in expansion of macro 'dev_err'
     134 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%#llx LEN:%#llx\n",
         |         ^~~~~~~
   drivers/dax/extent.c:134:77: note: format string is defined here
     134 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%#llx LEN:%#llx\n",
         |                                                                         ~~~~^
         |                                                                             |
         |                                                                             long long unsigned int
         |                                                                         %#x


vim +117 drivers/dax/extent.c

    91	
    92	int dax_region_ext_create_dev(struct dax_region *dax_region,
    93				      void *private_data,
    94				      void (*release)(void *private_data),
    95				      resource_size_t offset,
    96				      resource_size_t length,
    97				      const char *label)
    98	{
    99		struct dr_extent *dr_extent;
   100		struct device *dev;
   101		int rc;
   102	
   103		dr_extent = kzalloc(sizeof(*dr_extent), GFP_KERNEL);
   104		if (!dr_extent)
   105			return -ENOMEM;
   106	
   107		dr_extent->offset = offset;
   108		dr_extent->length = length;
   109		snprintf(dr_extent->label, DAX_EXTENT_LABEL_LEN, "%s", label);
   110	
   111		dr_extent->private_data = private_data;
   112		dr_extent->release = release;
   113		kref_init(&dr_extent->ref);
   114	
   115		dev = &dr_extent->dev;
   116		device_initialize(dev);
 > 117		dev->id = offset / PMD_SIZE;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
