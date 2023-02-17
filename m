Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5861746A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 15:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676648480; x=1708184480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XrA4i8zjucZDVYHsj2qhynzTaBP4SbAKvxeyy+D9DLk=;
  b=Hu2L+++a6mswatwaT7dmOXj1uEykM45khnwh6+Nkgml/s67zCzG4YJFu
   wk8gzDG5TzJ2/RjDkdw/fUyGFuyF1cMgfoonozOxOjDK7MnrH3Ar/WoWK
   1bnJUwYbK6rkRrdtL1QcDT+2GSKBA6roiFwM0KLOFLX8B8lOi7whAT3cN
   2D0eECca3+VdHlINhuD2IMrq0BscL3wH1yXX/aSPR3VimKqGLeOZislRB
   PDM829WCKR0HgIdi6s+q8pb2WObs0sCEEBu2rUBH8gFcieXVstwuxFGx6
   XL6k2uA3WdawafMO1pQAyvnFATYMx/RToFLZ1jVS3icHZVb4GLA2I/DwZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="333368606"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="333368606"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 07:41:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="813410112"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="813410112"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2023 07:41:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT2rO-000Bar-0H;
	Fri, 17 Feb 2023 15:41:18 +0000
Date: Fri, 17 Feb 2023 23:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-audio-wsa881x-gpio 249/615]
 drivers/usb/repeater/repeater.c:26:6: warning: no previous prototype for
 'usb_put_repeater'
Message-ID: <202302172306.IFsuEuiW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
head:   04e5048badb91c86b22993d0d9fd1bf8b79c0d91
commit: b23c32f2c50c083842531d4f69fb3546db601bd3 [249/615] usb: Add USB repeater generic framework
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230217/202302172306.IFsuEuiW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/b23c32f2c50c083842531d4f69fb3546db601bd3
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
        git checkout b23c32f2c50c083842531d4f69fb3546db601bd3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/usb/repeater/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302172306.IFsuEuiW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/repeater/repeater.c:26:6: warning: no previous prototype for 'usb_put_repeater' [-Wmissing-prototypes]
      26 | void usb_put_repeater(struct usb_repeater *rptr)
         |      ^~~~~~~~~~~~~~~~
--
>> drivers/usb/repeater/repeater.c:187: warning: expecting prototype for usb_remove_repeater(). Prototype was for usb_remove_repeater_dev() instead


vim +/usb_put_repeater +26 drivers/usb/repeater/repeater.c

    17	
    18	/**
    19	 * usb_put_repeater - release the USB repeater
    20	 * @rptr: the repeater returned by usb_get_repeater()
    21	 *
    22	 * Releases a refcount the caller received from usb_get_repeater().
    23	 *
    24	 * For use by USB PHY drivers.
    25	 */
  > 26	void usb_put_repeater(struct usb_repeater *rptr)
    27	{
    28		if (rptr) {
    29			put_device(rptr->dev);
    30			if (rptr->dev->driver && rptr->dev->driver->owner) {
    31				struct module *owner = rptr->dev->driver->owner;
    32	
    33				module_put(owner);
    34			}
    35		}
    36	}
    37	EXPORT_SYMBOL_GPL(usb_put_repeater);
    38	
    39	static struct usb_repeater *of_usb_find_repeater(struct device_node *node)
    40	{
    41		struct usb_repeater *rptr;
    42	
    43		if (!of_device_is_available(node))
    44			return ERR_PTR(-ENODEV);
    45	
    46		list_for_each_entry(rptr, &usb_repeater_list, entry) {
    47			if (node != rptr->dev->of_node)
    48				continue;
    49	
    50			return rptr;
    51		}
    52	
    53		return ERR_PTR(-EPROBE_DEFER);
    54	}
    55	
    56	static void devm_usb_repeater_release(struct device *dev, void *res)
    57	{
    58		struct usb_repeater *rptr = *(struct usb_repeater **)res;
    59	
    60		usb_put_repeater(rptr);
    61	}
    62	
    63	/**
    64	 * devm_usb_get_repeater_by_node - find the USB repeater by device_node
    65	 * @dev: device that requests this USB repeater
    66	 * @node: the device_node for the USB repeater device.
    67	 * @nb: a notifier_block to register with the USB repeater.
    68	 *
    69	 * Returns the USB repeater driver associated with the given device_node,
    70	 * after getting a refcount to it, -ENODEV if there is no such repeater or
    71	 * -EPROBE_DEFER if the device is not yet loaded. While at that, it
    72	 * also associates the device with
    73	 * the repeater using devres. On driver detach, release function is invoked
    74	 * on the devres data, then, devres data is freed.
    75	 *
    76	 * For use by peripheral drivers for devices related to a repeater,
    77	 * such as a charger.
    78	 */
    79	struct  usb_repeater *devm_usb_get_repeater_by_node(struct device *dev,
    80						  struct device_node *node,
    81						  struct notifier_block *nb)
    82	{
    83		struct usb_repeater *rptr = ERR_PTR(-ENOMEM);
    84		struct usb_repeater *rptr_devm;
    85		unsigned long flags;
    86	
    87		rptr_devm = devres_alloc(devm_usb_repeater_release,
    88						sizeof(*rptr_devm), GFP_KERNEL);
    89		if (!rptr_devm) {
    90			dev_dbg(dev, "failed to allocate memory for devres\n");
    91			goto err0;
    92		}
    93	
    94		spin_lock_irqsave(&usb_repeater_lock, flags);
    95	
    96		rptr = of_usb_find_repeater(node);
    97		if (IS_ERR(rptr)) {
    98			devres_free(rptr_devm);
    99			goto err0;
   100		}
   101	
   102		if (!try_module_get(rptr->dev->driver->owner)) {
   103			rptr = ERR_PTR(-ENODEV);
   104			devres_free(rptr_devm);
   105			goto err0;
   106		}
   107		devres_add(dev, rptr_devm);
   108	
   109		get_device(rptr->dev);
   110	err0:
   111		spin_unlock_irqrestore(&usb_repeater_lock, flags);
   112	
   113		return rptr;
   114	}
   115	EXPORT_SYMBOL_GPL(devm_usb_get_repeater_by_node);
   116	
   117	/**
   118	 * devm_usb_get_repeater_by_phandle - find the USB repeater by phandle
   119	 * @dev: device that requests this repeater
   120	 * @phandle: name of the property holding the repeater phandle value
   121	 * @index: the index of the repeater
   122	 *
   123	 * Returns the USB repeater driver associated with the given phandle value,
   124	 * after getting a refcount to it, -ENODEV if there is no such repeater or
   125	 * -EPROBE_DEFER if there is a phandle to the repeater, but the device is
   126	 * not yet loaded. While at that, it also associates the device with
   127	 * the repeater using devres. On driver detach, release function is invoked
   128	 * on the devres data, then, devres data is freed.
   129	 *
   130	 * For use by USB PHY drivers.
   131	 */
   132	struct usb_repeater *devm_usb_get_repeater_by_phandle(struct device *dev,
   133		const char *phandle, u8 index)
   134	{
   135		struct device_node *node;
   136		struct usb_repeater *rptr;
   137	
   138		if (!dev->of_node) {
   139			dev_dbg(dev, "device does not have a device node entry\n");
   140			return ERR_PTR(-EINVAL);
   141		}
   142	
   143		node = of_parse_phandle(dev->of_node, phandle, index);
   144		if (!node) {
   145			dev_dbg(dev, "failed to get %s phandle in %pOF node\n", phandle,
   146				dev->of_node);
   147			return ERR_PTR(-ENODEV);
   148		}
   149		rptr = devm_usb_get_repeater_by_node(dev, node, NULL);
   150		of_node_put(node);
   151		return rptr;
   152	}
   153	EXPORT_SYMBOL_GPL(devm_usb_get_repeater_by_phandle);
   154	
   155	/**
   156	 * usb_add_repeater_dev - declare the USB repeater
   157	 * @rptr: the USB repeater to be used; or NULL
   158	 *
   159	 * This call is exclusively for use by repeater drivers to
   160	 * register the device to allow the USB phy driver to control it
   161	 * via repeater specific ops.
   162	 */
   163	int usb_add_repeater_dev(struct usb_repeater *rptr)
   164	{
   165		unsigned long flags;
   166	
   167		if (!rptr->dev) {
   168			dev_err(rptr->dev, "no device provided for repeater\n");
   169			return -EINVAL;
   170		}
   171	
   172		spin_lock_irqsave(&usb_repeater_lock, flags);
   173		list_add_tail(&rptr->entry, &usb_repeater_list);
   174		spin_unlock_irqrestore(&usb_repeater_lock, flags);
   175	
   176		return 0;
   177	}
   178	EXPORT_SYMBOL_GPL(usb_add_repeater_dev);
   179	
   180	/**
   181	 * usb_remove_repeater - remove the USB repeater
   182	 * @rptr: the USB Repeater to be removed;
   183	 *
   184	 * This reverts the effects of usb_add_repeater_dev
   185	 */
   186	void usb_remove_repeater_dev(struct usb_repeater *rptr)
 > 187	{
   188		unsigned long flags;
   189	
   190		spin_lock_irqsave(&usb_repeater_lock, flags);
   191		if (rptr)
   192			list_del(&rptr->entry);
   193		spin_unlock_irqrestore(&usb_repeater_lock, flags);
   194	}
   195	EXPORT_SYMBOL_GPL(usb_remove_repeater_dev);
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
