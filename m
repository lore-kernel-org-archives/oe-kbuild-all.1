Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863DF374C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 11:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="deJvjoeo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702900083; x=1734436083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vKuL/ZIrIaKuN/MA9S9S3jhZv0tW/yPR3Z5WOVJw4CI=;
  b=deJvjoeohWNdfiMErTm9GcSKvbDIU3hOmXRv2sux3+U6mmbROxYSQ/J7
   c6jUvI3nd2YvEcCxuqv7q5bWQ+/zs88yIiQugb8kGFQ/qPJEoaUflbLdr
   Wi3PvveRrn4Up0wy59d6uU/oZKW2cLabuBjv1WpGnp+/9vvFxVTKMZRAU
   VFFAWz5TgvbmL2Io1pfI1oKzoWX6wYg01Wu7L0krLpKJKFl3pK+Mm16qv
   Rci5P9tJSr3V/YKnNobZarHsXQIjBZlulTZ6rBJVPkQfK8tqEA/9/SXT/
   GwmJQUKkSN860SCVxJhzMf+efUwjXC3RxTkSgvMWgqBGhvWyNkfxvVlY6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2702164"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2702164"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 03:48:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="919240123"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="919240123"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2023 03:47:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFC6H-00042T-1o;
	Mon, 18 Dec 2023 11:47:57 +0000
Date: Mon, 18 Dec 2023 19:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: davidgow <davidgow@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-next:master 8437/9113] lib/kunit/device.c:68: warning:
 Function parameter or struct member 'test' not described in
 'kunit_driver_create'
Message-ID: <202312181920.H4EPAH20-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ceb2fe0d438644e1de06b9a6468a1fb8e2199c70
commit: dcb420cba3162bce885a2127865888850a6d6b99 [8437/9113] kunit: Add APIs for managing devices
config: x86_64-buildonly-randconfig-003-20231218 (https://download.01.org/0day-ci/archive/20231218/202312181920.H4EPAH20-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181920.H4EPAH20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312181920.H4EPAH20-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/device.c:68: warning: Function parameter or struct member 'test' not described in 'kunit_driver_create'
>> lib/kunit/device.c:68: warning: Function parameter or struct member 'name' not described in 'kunit_driver_create'
   lib/kunit/device.c:68: warning: expecting prototype for Create and register a KUnit(). Prototype was for kunit_driver_create() instead
>> lib/kunit/device.c:134: warning: Function parameter or struct member 'test' not described in 'kunit_device_register_with_driver'
>> lib/kunit/device.c:134: warning: Function parameter or struct member 'name' not described in 'kunit_device_register_with_driver'
>> lib/kunit/device.c:134: warning: Function parameter or struct member 'drv' not described in 'kunit_device_register_with_driver'
   lib/kunit/device.c:134: warning: expecting prototype for Create and register a new KUnit-managed device, using the user(). Prototype was for kunit_device_register_with_driver() instead
>> lib/kunit/device.c:149: warning: Function parameter or struct member 'test' not described in 'kunit_device_register'
>> lib/kunit/device.c:149: warning: Function parameter or struct member 'name' not described in 'kunit_device_register'
   lib/kunit/device.c:149: warning: expecting prototype for Create and register a new KUnit(). Prototype was for kunit_device_register() instead


vim +68 lib/kunit/device.c

    62	
    63	/**
    64	 * Create and register a KUnit-managed struct device_driver on the kunit_bus.
    65	 * Returns an error pointer on failure.
    66	 */
    67	struct device_driver *kunit_driver_create(struct kunit *test, const char *name)
  > 68	{
    69		struct device_driver *driver;
    70		int err = -ENOMEM;
    71	
    72		driver = kunit_kzalloc(test, sizeof(*driver), GFP_KERNEL);
    73	
    74		if (!driver)
    75			return ERR_PTR(err);
    76	
    77		driver->name = name;
    78		driver->bus = &kunit_bus_type;
    79		driver->owner = THIS_MODULE;
    80	
    81		err = driver_register(driver);
    82		if (err) {
    83			kunit_kfree(test, driver);
    84			return ERR_PTR(err);
    85		}
    86	
    87		kunit_add_action(test, driver_unregister_wrapper, driver);
    88		return driver;
    89	}
    90	EXPORT_SYMBOL_GPL(kunit_driver_create);
    91	
    92	/* Helper which creates a kunit_device, attaches it to the kunit_bus*/
    93	static struct kunit_device *kunit_device_register_internal(struct kunit *test,
    94								   const char *name,
    95								   const struct device_driver *drv)
    96	{
    97		struct kunit_device *kunit_dev;
    98		int err = -ENOMEM;
    99	
   100		kunit_dev = kzalloc(sizeof(*kunit_dev), GFP_KERNEL);
   101		if (!kunit_dev)
   102			return ERR_PTR(err);
   103	
   104		kunit_dev->owner = test;
   105	
   106		err = dev_set_name(&kunit_dev->dev, "%s.%s", test->name, name);
   107		if (err) {
   108			kfree(kunit_dev);
   109			return ERR_PTR(err);
   110		}
   111	
   112		kunit_dev->dev.release = kunit_device_release;
   113		kunit_dev->dev.bus = &kunit_bus_type;
   114		kunit_dev->dev.parent = kunit_bus_device;
   115	
   116		err = device_register(&kunit_dev->dev);
   117		if (err) {
   118			put_device(&kunit_dev->dev);
   119			return ERR_PTR(err);
   120		}
   121	
   122		kunit_add_action(test, device_unregister_wrapper, &kunit_dev->dev);
   123	
   124		return kunit_dev;
   125	}
   126	
   127	/**
   128	 * Create and register a new KUnit-managed device, using the user-supplied device_driver.
   129	 * On failure, returns an error pointer.
   130	 */
   131	struct device *kunit_device_register_with_driver(struct kunit *test,
   132							 const char *name,
   133							 const struct device_driver *drv)
 > 134	{
   135		struct kunit_device *kunit_dev = kunit_device_register_internal(test, name, drv);
   136	
   137		if (IS_ERR_OR_NULL(kunit_dev))
   138			return ERR_CAST(kunit_dev);
   139	
   140		return &kunit_dev->dev;
   141	}
   142	EXPORT_SYMBOL_GPL(kunit_device_register_with_driver);
   143	
   144	/**
   145	 * Create and register a new KUnit-managed device, including a matching device_driver.
   146	 * On failure, returns an error pointer.
   147	 */
   148	struct device *kunit_device_register(struct kunit *test, const char *name)
 > 149	{
   150		struct device_driver *drv;
   151		struct kunit_device *dev;
   152	
   153		drv = kunit_driver_create(test, name);
   154		if (IS_ERR(drv))
   155			return ERR_CAST(drv);
   156	
   157		dev = kunit_device_register_internal(test, name, drv);
   158		if (IS_ERR(dev)) {
   159			kunit_release_action(test, driver_unregister_wrapper, (void *)drv);
   160			return ERR_CAST(dev);
   161		}
   162	
   163		/* Request the driver be freed. */
   164		dev->driver = drv;
   165	
   166	
   167		return &dev->dev;
   168	}
   169	EXPORT_SYMBOL_GPL(kunit_device_register);
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
