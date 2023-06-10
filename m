Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B05A4E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 00:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686357301; x=1717893301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qI2WxKDa/na5U9r5L6PNgKLhajrkDlqapDPphy0hUQk=;
  b=kpppCeiBqr2BHRKr/tzRPFf6UXsliDpHBqXhE9U1R2eJ/vnvmDRdXMh6
   iBxseL1q9lCn6+pCP1myVY8/RuwCAjegZOPaVEhoCzSrVRvxesIaIBS0L
   Ai200+zCXVQHz/cdS4mmi7ipOas8iJtKaItaBHB5E+PVbTnMCNB7t9muV
   DGyF/RPxSzSpcKkn1AIZ27gT0z6iLwMQgw1e3u+EUbU+wYJE2NwCa7ynE
   WHxZADjTobX/gSldOxVeF/qB8wTqTi08UwleW/hXrqfoV2iuPDLXz/UU+
   scENcgYrybfddheRAA4jVVPDUL7aqjIHY/HP4MMn8QNyfp913BAbnbrZE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="386081822"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="386081822"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 17:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="780491392"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="780491392"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Jun 2023 17:34:59 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7mZG-0009Xw-2x;
	Sat, 10 Jun 2023 00:34:58 +0000
Date: Sat, 10 Jun 2023 08:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 20/20] drivers/of/device.c:35:5: warning:
 no previous prototype for 'of_device_add'
Message-ID: <202306100825.rfSNXbl6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
commit: 3118a5812ec5b3b83ca38f2d1c4162ccda268c0d [20/20] of: header cleanups
config: parisc-randconfig-r011-20230610 (https://download.01.org/0day-ci/archive/20230610/202306100825.rfSNXbl6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/of/ lib/ net/core/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100825.rfSNXbl6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/device.c:35:5: warning: no previous prototype for 'of_device_add' [-Wmissing-prototypes]
      35 | int of_device_add(struct platform_device *ofdev)
         |     ^~~~~~~~~~~~~
>> drivers/of/device.c:224:5: warning: no previous prototype for 'of_device_register' [-Wmissing-prototypes]
     224 | int of_device_register(struct platform_device *pdev)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/of/device.c:231:6: warning: no previous prototype for 'of_device_unregister' [-Wmissing-prototypes]
     231 | void of_device_unregister(struct platform_device *ofdev)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/of_device_add +35 drivers/of/device.c

f85ff3056cefdf Stephen Rothwell       2007-05-01   34  
7096d0422153ff Grant Likely           2010-10-20  @35  int of_device_add(struct platform_device *ofdev)
f85ff3056cefdf Stephen Rothwell       2007-05-01   36  {
61c7a080a5a061 Grant Likely           2010-04-13   37  	BUG_ON(ofdev->dev.of_node == NULL);
6098e2ee14849e Jeremy Kerr            2008-10-26   38  
eca3930163ba88 Grant Likely           2010-06-08   39  	/* name and id have to be set so that the platform bus doesn't get
eca3930163ba88 Grant Likely           2010-06-08   40  	 * confused on matching */
eca3930163ba88 Grant Likely           2010-06-08   41  	ofdev->name = dev_name(&ofdev->dev);
6d7e3bf8d12c0a Andy Shevchenko        2017-08-25   42  	ofdev->id = PLATFORM_DEVID_NONE;
eca3930163ba88 Grant Likely           2010-06-08   43  
56f2de81e020c5 Zhen Lei               2015-08-25   44  	/*
56f2de81e020c5 Zhen Lei               2015-08-25   45  	 * If this device has not binding numa node in devicetree, that is
56f2de81e020c5 Zhen Lei               2015-08-25   46  	 * of_node_to_nid returns NUMA_NO_NODE. device_add will assume that this
56f2de81e020c5 Zhen Lei               2015-08-25   47  	 * device is on the same node as the parent.
56f2de81e020c5 Zhen Lei               2015-08-25   48  	 */
61c7a080a5a061 Grant Likely           2010-04-13   49  	set_dev_node(&ofdev->dev, of_node_to_nid(ofdev->dev.of_node));
6098e2ee14849e Jeremy Kerr            2008-10-26   50  
6098e2ee14849e Jeremy Kerr            2008-10-26   51  	return device_add(&ofdev->dev);
f85ff3056cefdf Stephen Rothwell       2007-05-01   52  }
7096d0422153ff Grant Likely           2010-10-20   53  
f3cfd136aef018 Will Deacon            2021-08-16   54  static void
ce5cb67c664fbc Will Deacon            2021-08-16   55  of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
ce5cb67c664fbc Will Deacon            2021-08-16   56  {
ce5cb67c664fbc Will Deacon            2021-08-16   57  	struct device_node *node, *of_node = dev->of_node;
ce5cb67c664fbc Will Deacon            2021-08-16   58  	int count, i;
ce5cb67c664fbc Will Deacon            2021-08-16   59  
f3cfd136aef018 Will Deacon            2021-08-16   60  	if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
f3cfd136aef018 Will Deacon            2021-08-16   61  		return;
f3cfd136aef018 Will Deacon            2021-08-16   62  
ce5cb67c664fbc Will Deacon            2021-08-16   63  	count = of_property_count_elems_of_size(of_node, "memory-region",
ce5cb67c664fbc Will Deacon            2021-08-16   64  						sizeof(u32));
ce5cb67c664fbc Will Deacon            2021-08-16   65  	/*
ce5cb67c664fbc Will Deacon            2021-08-16   66  	 * If dev->of_node doesn't exist or doesn't contain memory-region, try
ce5cb67c664fbc Will Deacon            2021-08-16   67  	 * the OF node having DMA configuration.
ce5cb67c664fbc Will Deacon            2021-08-16   68  	 */
ce5cb67c664fbc Will Deacon            2021-08-16   69  	if (count <= 0) {
ce5cb67c664fbc Will Deacon            2021-08-16   70  		of_node = np;
ce5cb67c664fbc Will Deacon            2021-08-16   71  		count = of_property_count_elems_of_size(
ce5cb67c664fbc Will Deacon            2021-08-16   72  			of_node, "memory-region", sizeof(u32));
ce5cb67c664fbc Will Deacon            2021-08-16   73  	}
ce5cb67c664fbc Will Deacon            2021-08-16   74  
ce5cb67c664fbc Will Deacon            2021-08-16   75  	for (i = 0; i < count; i++) {
ce5cb67c664fbc Will Deacon            2021-08-16   76  		node = of_parse_phandle(of_node, "memory-region", i);
ce5cb67c664fbc Will Deacon            2021-08-16   77  		/*
ce5cb67c664fbc Will Deacon            2021-08-16   78  		 * There might be multiple memory regions, but only one
ce5cb67c664fbc Will Deacon            2021-08-16   79  		 * restricted-dma-pool region is allowed.
ce5cb67c664fbc Will Deacon            2021-08-16   80  		 */
ce5cb67c664fbc Will Deacon            2021-08-16   81  		if (of_device_is_compatible(node, "restricted-dma-pool") &&
d17e37c41b7ed3 Liang He               2022-07-02   82  		    of_device_is_available(node)) {
d17e37c41b7ed3 Liang He               2022-07-02   83  			of_node_put(node);
f3cfd136aef018 Will Deacon            2021-08-16   84  			break;
ce5cb67c664fbc Will Deacon            2021-08-16   85  		}
d17e37c41b7ed3 Liang He               2022-07-02   86  		of_node_put(node);
d17e37c41b7ed3 Liang He               2022-07-02   87  	}
ce5cb67c664fbc Will Deacon            2021-08-16   88  
31c8025fac3d8b David Brazdil          2021-09-17   89  	/*
31c8025fac3d8b David Brazdil          2021-09-17   90  	 * Attempt to initialize a restricted-dma-pool region if one was found.
31c8025fac3d8b David Brazdil          2021-09-17   91  	 * Note that count can hold a negative error code.
31c8025fac3d8b David Brazdil          2021-09-17   92  	 */
31c8025fac3d8b David Brazdil          2021-09-17   93  	if (i < count && of_reserved_mem_device_init_by_idx(dev, of_node, i))
f3cfd136aef018 Will Deacon            2021-08-16   94  		dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memory node\n");
ce5cb67c664fbc Will Deacon            2021-08-16   95  }
ce5cb67c664fbc Will Deacon            2021-08-16   96  
1f5c69aa51f9c7 Murali Karicheri       2015-03-03   97  /**
cb61e9dbeee9b3 Lee Jones              2021-03-18   98   * of_dma_configure_id - Setup DMA configuration
1f5c69aa51f9c7 Murali Karicheri       2015-03-03   99   * @dev:	Device to apply DMA configuration
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  100   * @np:		Pointer to OF node having DMA configuration
3d6ce86ee79465 Christoph Hellwig      2018-05-03  101   * @force_dma:  Whether device is to be set up by of_dma_configure() even if
3d6ce86ee79465 Christoph Hellwig      2018-05-03  102   *		DMA capability is not explicitly described by firmware.
a081bd4af4ce80 Lorenzo Pieralisi      2020-06-19  103   * @id:		Optional const pointer value input id
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  104   *
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  105   * Try to get devices's DMA configuration from DT and update it
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  106   * accordingly.
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  107   *
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  108   * If platform code needs to use its own special DMA configuration, it
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  109   * can use a platform bus notifier and handle BUS_NOTIFY_ADD_DEVICE events
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  110   * to fix up DMA configuration.
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  111   */
a081bd4af4ce80 Lorenzo Pieralisi      2020-06-19  112  int of_dma_configure_id(struct device *dev, struct device_node *np,
a081bd4af4ce80 Lorenzo Pieralisi      2020-06-19  113  			bool force_dma, const u32 *id)
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  114  {
53c92d793395fd Robin Murphy           2016-04-07  115  	const struct iommu_ops *iommu;
e0d072782c734d Jim Quinlan            2020-09-17  116  	const struct bus_dma_region *map = NULL;
f1ad5338a4d57f Robin Murphy           2022-09-29  117  	struct device_node *bus_np;
48ab6d5d1f096d Geert Uytterhoeven     2020-10-26  118  	u64 dma_start = 0;
e0d072782c734d Jim Quinlan            2020-09-17  119  	u64 mask, end, size = 0;
e0d072782c734d Jim Quinlan            2020-09-17  120  	bool coherent;
e0d072782c734d Jim Quinlan            2020-09-17  121  	int ret;
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  122  
f1ad5338a4d57f Robin Murphy           2022-09-29  123  	if (np == dev->of_node)
f1ad5338a4d57f Robin Murphy           2022-09-29  124  		bus_np = __of_get_dma_parent(np);
f1ad5338a4d57f Robin Murphy           2022-09-29  125  	else
f1ad5338a4d57f Robin Murphy           2022-09-29  126  		bus_np = of_node_get(np);
f1ad5338a4d57f Robin Murphy           2022-09-29  127  
f1ad5338a4d57f Robin Murphy           2022-09-29  128  	ret = of_dma_get_range(bus_np, &map);
f1ad5338a4d57f Robin Murphy           2022-09-29  129  	of_node_put(bus_np);
723288836628bc Robin Murphy           2017-08-31  130  	if (ret < 0) {
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  131  		/*
723288836628bc Robin Murphy           2017-08-31  132  		 * For legacy reasons, we have to assume some devices need
723288836628bc Robin Murphy           2017-08-31  133  		 * DMA configuration regardless of whether "dma-ranges" is
723288836628bc Robin Murphy           2017-08-31  134  		 * correctly specified or not.
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  135  		 */
3d6ce86ee79465 Christoph Hellwig      2018-05-03  136  		if (!force_dma)
723288836628bc Robin Murphy           2017-08-31  137  			return ret == -ENODEV ? 0 : ret;
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  138  	} else {
e0d072782c734d Jim Quinlan            2020-09-17  139  		const struct bus_dma_region *r = map;
48ab6d5d1f096d Geert Uytterhoeven     2020-10-26  140  		u64 dma_end = 0;
e0d072782c734d Jim Quinlan            2020-09-17  141  
e0d072782c734d Jim Quinlan            2020-09-17  142  		/* Determine the overall bounds of all DMA regions */
495023e4e49e4b Geert Uytterhoeven     2020-11-02  143  		for (dma_start = ~0; r->size; r++) {
e0d072782c734d Jim Quinlan            2020-09-17  144  			/* Take lower and upper limits */
e0d072782c734d Jim Quinlan            2020-09-17  145  			if (r->dma_start < dma_start)
e0d072782c734d Jim Quinlan            2020-09-17  146  				dma_start = r->dma_start;
e0d072782c734d Jim Quinlan            2020-09-17  147  			if (r->dma_start + r->size > dma_end)
e0d072782c734d Jim Quinlan            2020-09-17  148  				dma_end = r->dma_start + r->size;
e0d072782c734d Jim Quinlan            2020-09-17  149  		}
e0d072782c734d Jim Quinlan            2020-09-17  150  		size = dma_end - dma_start;
0c79c81c779fe5 Murali Karicheri       2015-03-03  151  
0c79c81c779fe5 Murali Karicheri       2015-03-03  152  		/*
0c79c81c779fe5 Murali Karicheri       2015-03-03  153  		 * Add a work around to treat the size as mask + 1 in case
0c79c81c779fe5 Murali Karicheri       2015-03-03  154  		 * it is defined in DT as a mask.
0c79c81c779fe5 Murali Karicheri       2015-03-03  155  		 */
0c79c81c779fe5 Murali Karicheri       2015-03-03  156  		if (size & 1) {
e0d072782c734d Jim Quinlan            2020-09-17  157  			dev_warn(dev, "Invalid size 0x%llx for dma-range(s)\n",
0c79c81c779fe5 Murali Karicheri       2015-03-03  158  				 size);
0c79c81c779fe5 Murali Karicheri       2015-03-03  159  			size = size + 1;
0c79c81c779fe5 Murali Karicheri       2015-03-03  160  		}
0c79c81c779fe5 Murali Karicheri       2015-03-03  161  
0c79c81c779fe5 Murali Karicheri       2015-03-03  162  		if (!size) {
0c79c81c779fe5 Murali Karicheri       2015-03-03  163  			dev_err(dev, "Adjusted size 0x%llx invalid\n", size);
e0d072782c734d Jim Quinlan            2020-09-17  164  			kfree(map);
7b07cbefb68d48 Laurent Pinchart       2017-04-10  165  			return -EINVAL;
0c79c81c779fe5 Murali Karicheri       2015-03-03  166  		}
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  167  	}
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  168  
723288836628bc Robin Murphy           2017-08-31  169  	/*
4d8bde883bfba3 Robin Murphy           2018-07-23  170  	 * If @dev is expected to be DMA-capable then the bus code that created
4d8bde883bfba3 Robin Murphy           2018-07-23  171  	 * it should have initialised its dma_mask pointer by this point. For
4d8bde883bfba3 Robin Murphy           2018-07-23  172  	 * now, we'll continue the legacy behaviour of coercing it to the
4d8bde883bfba3 Robin Murphy           2018-07-23  173  	 * coherent mask if not, but we'll no longer do so quietly.
723288836628bc Robin Murphy           2017-08-31  174  	 */
4d8bde883bfba3 Robin Murphy           2018-07-23  175  	if (!dev->dma_mask) {
4d8bde883bfba3 Robin Murphy           2018-07-23  176  		dev_warn(dev, "DMA mask not set\n");
723288836628bc Robin Murphy           2017-08-31  177  		dev->dma_mask = &dev->coherent_dma_mask;
4d8bde883bfba3 Robin Murphy           2018-07-23  178  	}
723288836628bc Robin Murphy           2017-08-31  179  
4d8bde883bfba3 Robin Murphy           2018-07-23  180  	if (!size && dev->coherent_dma_mask)
723288836628bc Robin Murphy           2017-08-31  181  		size = max(dev->coherent_dma_mask, dev->coherent_dma_mask + 1);
4d8bde883bfba3 Robin Murphy           2018-07-23  182  	else if (!size)
4d8bde883bfba3 Robin Murphy           2018-07-23  183  		size = 1ULL << 32;
723288836628bc Robin Murphy           2017-08-31  184  
9a6d7298b08336 Murali Karicheri       2015-03-03  185  	/*
9a6d7298b08336 Murali Karicheri       2015-03-03  186  	 * Limit coherent and dma mask based on size and default mask
9a6d7298b08336 Murali Karicheri       2015-03-03  187  	 * set by the driver.
9a6d7298b08336 Murali Karicheri       2015-03-03  188  	 */
e0d072782c734d Jim Quinlan            2020-09-17  189  	end = dma_start + size - 1;
a7ba70f1787f97 Nicolas Saenz Julienne 2019-11-21  190  	mask = DMA_BIT_MASK(ilog2(end) + 1);
ee7b1f31200d9f Robin Murphy           2017-08-11  191  	dev->coherent_dma_mask &= mask;
ee7b1f31200d9f Robin Murphy           2017-08-11  192  	*dev->dma_mask &= mask;
89c7cb1608ac3c Yong Wu                2021-01-19  193  	/* ...but only set bus limit and range map if we found valid dma-ranges earlier */
89c7cb1608ac3c Yong Wu                2021-01-19  194  	if (!ret) {
a7ba70f1787f97 Nicolas Saenz Julienne 2019-11-21  195  		dev->bus_dma_limit = end;
89c7cb1608ac3c Yong Wu                2021-01-19  196  		dev->dma_range_map = map;
89c7cb1608ac3c Yong Wu                2021-01-19  197  	}
9a6d7298b08336 Murali Karicheri       2015-03-03  198  
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  199  	coherent = of_dma_is_coherent(np);
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  200  	dev_dbg(dev, "device is%sdma coherent\n",
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  201  		coherent ? " " : " not ");
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  202  
a081bd4af4ce80 Lorenzo Pieralisi      2020-06-19  203  	iommu = of_iommu_configure(dev, np, id);
e0d072782c734d Jim Quinlan            2020-09-17  204  	if (PTR_ERR(iommu) == -EPROBE_DEFER) {
89c7cb1608ac3c Yong Wu                2021-01-19  205  		/* Don't touch range map if it wasn't set from a valid dma-ranges */
89c7cb1608ac3c Yong Wu                2021-01-19  206  		if (!ret)
89c7cb1608ac3c Yong Wu                2021-01-19  207  			dev->dma_range_map = NULL;
e0d072782c734d Jim Quinlan            2020-09-17  208  		kfree(map);
a37b19a384914c Sricharan R            2017-05-27  209  		return -EPROBE_DEFER;
e0d072782c734d Jim Quinlan            2020-09-17  210  	}
7b07cbefb68d48 Laurent Pinchart       2017-04-10  211  
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  212  	dev_dbg(dev, "device is%sbehind an iommu\n",
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  213  		iommu ? " " : " not ");
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  214  
e0d072782c734d Jim Quinlan            2020-09-17  215  	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
7b07cbefb68d48 Laurent Pinchart       2017-04-10  216  
fec9b625095f73 Claire Chang           2021-06-19  217  	if (!iommu)
f3cfd136aef018 Will Deacon            2021-08-16  218  		of_dma_set_restricted_buffer(dev, np);
fec9b625095f73 Claire Chang           2021-06-19  219  
7b07cbefb68d48 Laurent Pinchart       2017-04-10  220  	return 0;
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  221  }
a081bd4af4ce80 Lorenzo Pieralisi      2020-06-19  222  EXPORT_SYMBOL_GPL(of_dma_configure_id);
1f5c69aa51f9c7 Murali Karicheri       2015-03-03  223  
7096d0422153ff Grant Likely           2010-10-20 @224  int of_device_register(struct platform_device *pdev)
7096d0422153ff Grant Likely           2010-10-20  225  {
7096d0422153ff Grant Likely           2010-10-20  226  	device_initialize(&pdev->dev);
7096d0422153ff Grant Likely           2010-10-20  227  	return of_device_add(pdev);
7096d0422153ff Grant Likely           2010-10-20  228  }
f85ff3056cefdf Stephen Rothwell       2007-05-01  229  EXPORT_SYMBOL(of_device_register);
f85ff3056cefdf Stephen Rothwell       2007-05-01  230  
94a0cb1fc61ab7 Grant Likely           2010-07-22 @231  void of_device_unregister(struct platform_device *ofdev)
f85ff3056cefdf Stephen Rothwell       2007-05-01  232  {
f85ff3056cefdf Stephen Rothwell       2007-05-01  233  	device_unregister(&ofdev->dev);
f85ff3056cefdf Stephen Rothwell       2007-05-01  234  }
f85ff3056cefdf Stephen Rothwell       2007-05-01  235  EXPORT_SYMBOL(of_device_unregister);
09e67ca2c52354 Stephen Rothwell       2008-05-16  236  

:::::: The code at line 35 was first introduced by commit
:::::: 7096d0422153ffcc2264eef652fc3a7bca3e6d3c of/device: Rework to use common platform_device_alloc() for allocating devices

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
