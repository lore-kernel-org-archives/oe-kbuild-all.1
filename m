Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864F62C87F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMnpG2fo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698248839; x=1729784839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EpRzLbBL7EZt/wAoLkGjYRVw7Lo8LgNJAmHEFR8iq3s=;
  b=HMnpG2foxbA1vZ2Xc8m0P81sVYZdnZomd8/EHfJJIStyxQ23+2JSPs4x
   j3Bb1yu1phXtnZOooIyZcVKnTCHh2DGfvy0Nc9aMrM9pvqQLauJVSQZyu
   RE6vIDMS+4cD7zcpmaFCfJtZaqT53k/oxyYqZw9dWMnYkxZsDwhOVP6e0
   lvIlZ6jSuFhhEw2YbhfSh8zMgzKs4Kw3s/pS02JczdAFFtJzuarUCsMkx
   gZi4Fvrv6jJ0S+xiUqU4pSYFA+IngASsD2mkjASmgaS4LCBujJxy+Zn1o
   C0PvzK0WZaCuaQw6frK6i0rWKPNNMaGEj3iCSEX28G4Kh8TqDGV+taGyd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="114942"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="114942"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 08:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="849572108"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="849572108"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Oct 2023 08:47:13 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvg6A-0008yL-2L;
	Wed, 25 Oct 2023 15:47:10 +0000
Date: Wed, 25 Oct 2023 23:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v3-2023-10-24 19/27] drivers/dax/extent.c:13:37:
 warning: format '%llx' expects argument of type 'long long unsigned int',
 but argument 3 has type 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202310252344.7GG6F9vW-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231025/202310252344.7GG6F9vW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310252344.7GG6F9vW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310252344.7GG6F9vW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/dax/extent.c:6:
   drivers/dax/dax-private.h:111:30: error: field 'range' has incomplete type
     111 |                 struct range range;
         |                              ^~~~~
   drivers/dax/extent.c: In function 'length_show':
>> drivers/dax/extent.c:13:37: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      13 |         return sysfs_emit(buf, "%#llx\n", dr_extent->length);
         |                                 ~~~~^     ~~~~~~~~~~~~~~~~~
         |                                     |              |
         |                                     |              resource_size_t {aka unsigned int}
         |                                     long long unsigned int
         |                                 %#x
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:17,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
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
>> drivers/dax/extent.c:85:6: warning: no previous prototype for 'dr_ext_reg_put' [-Wmissing-prototypes]
      85 | void dr_ext_reg_put(void *data)
         |      ^~~~~~~~~~~~~~
   drivers/dax/extent.c: In function 'dax_region_ext_create_dev':
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


vim +13 drivers/dax/extent.c

     7	
     8	static ssize_t length_show(struct device *dev, struct device_attribute *attr,
     9				 char *buf)
    10	{
    11		struct dr_extent *dr_extent = to_dr_extent(dev);
    12	
  > 13		return sysfs_emit(buf, "%#llx\n", dr_extent->length);
    14	}
    15	static DEVICE_ATTR_RO(length);
    16	
    17	static ssize_t label_show(struct device *dev, struct device_attribute *attr,
    18				  char *buf)
    19	{
    20		struct dr_extent *dr_extent = to_dr_extent(dev);
    21	
    22		return sysfs_emit(buf, "%s\n", dr_extent->label);
    23	}
    24	
    25	static ssize_t label_store(struct device *dev, struct device_attribute *attr,
    26				   const char *buf, size_t len)
    27	{
    28		struct dr_extent *dr_extent = to_dr_extent(dev);
    29	
    30		snprintf(dr_extent->label, DAX_EXTENT_LABEL_LEN, "%s", buf);
    31		return len;
    32	}
    33	static DEVICE_ATTR_RW(label);
    34	
    35	static struct attribute *dr_extent_attrs[] = {
    36		&dev_attr_length.attr,
    37		&dev_attr_label.attr,
    38		NULL,
    39	};
    40	
    41	static const struct attribute_group dr_extent_attribute_group = {
    42		.attrs = dr_extent_attrs,
    43	};
    44	
    45	static void dr_extent_release(struct device *dev)
    46	{
    47		struct dr_extent *dr_extent = to_dr_extent(dev);
    48	
    49		kfree(dr_extent);
    50	}
    51	
    52	static const struct attribute_group *dr_extent_attribute_groups[] = {
    53		&dr_extent_attribute_group,
    54		NULL,
    55	};
    56	
    57	const struct device_type dr_extent_type = {
    58		.name = "extent",
    59		.release = dr_extent_release,
    60		.groups = dr_extent_attribute_groups,
    61	};
    62	
    63	void dr_extent_get(struct dr_extent *dr_extent)
    64	{
    65		kref_get(&dr_extent->ref);
    66	}
    67	
    68	static void dr_release(struct kref *kref)
    69	{
    70		struct dr_extent *dr_extent;
    71	
    72		dr_extent = container_of(kref, struct dr_extent, ref);
    73		if (dr_extent->release)
    74			dr_extent->release(dr_extent->private_data);
    75		dev_dbg(&dr_extent->dev, "Unregister DAX region ext OFF:%#llx L:%s\n",
    76			dr_extent->offset, dr_extent->label);
    77		device_unregister(&dr_extent->dev);
    78	}
    79	
    80	void dr_extent_put(struct dr_extent *dr_extent)
    81	{
    82		kref_put(&dr_extent->ref, dr_release);
    83	}
    84	
  > 85	void dr_ext_reg_put(void *data)
    86	{
    87		struct dr_extent *dr_extent = data;
    88	
    89		dr_extent_put(dr_extent);
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
