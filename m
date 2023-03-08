Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC25D7C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 01:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678237952; x=1709773952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gIVUeacPu9gNFPu06DPaVLWtRWzKGJ5w8H7/E6zTjjs=;
  b=nlLx7RZDDbmzEbTgNSxlbZqMXQSBWudOGcaBwut5t98ALP7JTAyvfjSK
   vk2sPYsGb47L+X/xsV0g82pAcqx3xF1u9JyDQj0IQz8aenbb+PxqQuWLw
   tGOaPyDXqLOZp4hUKXLoD/iP0QNTTnJHyc/P7nfUrFP0MYnEE12Fum0uw
   hos/mnErSiL8ltQmS/JBOS7nfIwCqId4q53Bex8vwo+WIk5rITdl4Z+eE
   smBXucrdVRFPfex5RTfkVaWWY9+OFE4aNHcEzikPUg9wSI82GUeVLYc58
   ZBhWk5/QbdofcLKPZWHfaHaqS5XElxqQxHtJmi3uDxXlLAtbq9dS4MdxD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="315677219"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="315677219"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 17:12:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="654166267"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="654166267"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Mar 2023 17:12:30 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZiM1-0001kn-2p;
	Wed, 08 Mar 2023 01:12:29 +0000
Date: Wed, 8 Mar 2023 09:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 09/10] media: v4l: async: Set v4l2_device in async notifier
 init
Message-ID: <202303080846.ORWVGsJ9-lkp@intel.com>
References: <20230307212038.968381-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307212038.968381-10-sakari.ailus@linux.intel.com>

Hi Sakari,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on media-tree/master]
[also build test ERROR on tegra/for-next rockchip/for-next linus/master v6.3-rc1 next-20230307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-async-Return-async-sub-devices-to-subnotifier-list/20230308-053012
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230307212038.968381-10-sakari.ailus%40linux.intel.com
patch subject: [RFC 09/10] media: v4l: async: Set v4l2_device in async notifier init
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230308/202303080846.ORWVGsJ9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e4525faa2e3ef73323fcace2bdb8b147ad5b9bdb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sakari-Ailus/media-v4l-async-Return-async-sub-devices-to-subnotifier-list/20230308-053012
        git checkout e4525faa2e3ef73323fcace2bdb8b147ad5b9bdb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/staging/media/deprecated/atmel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080846.ORWVGsJ9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c: In function 'atmel_isc_probe':
>> drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c:512:36: error: passing argument 1 of 'v4l2_async_nf_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
     512 |                 v4l2_async_nf_init(&subdev_entity->notifier);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    struct v4l2_async_notifier *
   In file included from include/media/v4l2-subdev.h:14,
                    from include/media/v4l2-device.h:13,
                    from drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c:41:
   include/media/v4l2-async.h:149:45: note: expected 'struct v4l2_device *' but argument is of type 'struct v4l2_async_notifier *'
     149 | void v4l2_async_nf_init(struct v4l2_device *v4l2_dev,
         |                         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c:512:17: error: too few arguments to function 'v4l2_async_nf_init'
     512 |                 v4l2_async_nf_init(&subdev_entity->notifier);
         |                 ^~~~~~~~~~~~~~~~~~
   include/media/v4l2-async.h:149:6: note: declared here
     149 | void v4l2_async_nf_init(struct v4l2_device *v4l2_dev,
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c:528:46: error: passing argument 1 of 'v4l2_async_nf_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
     528 |                 ret = v4l2_async_nf_register(&isc->v4l2_dev,
         |                                              ^~~~~~~~~~~~~~
         |                                              |
         |                                              struct v4l2_device *
   include/media/v4l2-async.h:264:56: note: expected 'struct v4l2_async_notifier *' but argument is of type 'struct v4l2_device *'
     264 | int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c:528:23: error: too many arguments to function 'v4l2_async_nf_register'
     528 |                 ret = v4l2_async_nf_register(&isc->v4l2_dev,
         |                       ^~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-async.h:264:5: note: declared here
     264 | int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
         |     ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c: In function 'microchip_xisc_probe':
>> drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c:502:36: error: passing argument 1 of 'v4l2_async_nf_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
     502 |                 v4l2_async_nf_init(&subdev_entity->notifier);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    struct v4l2_async_notifier *
   In file included from include/media/v4l2-subdev.h:14,
                    from include/media/v4l2-device.h:13,
                    from drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c:44:
   include/media/v4l2-async.h:149:45: note: expected 'struct v4l2_device *' but argument is of type 'struct v4l2_async_notifier *'
     149 | void v4l2_async_nf_init(struct v4l2_device *v4l2_dev,
         |                         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c:502:17: error: too few arguments to function 'v4l2_async_nf_init'
     502 |                 v4l2_async_nf_init(&subdev_entity->notifier);
         |                 ^~~~~~~~~~~~~~~~~~
   include/media/v4l2-async.h:149:6: note: declared here
     149 | void v4l2_async_nf_init(struct v4l2_device *v4l2_dev,
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c:518:46: error: passing argument 1 of 'v4l2_async_nf_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
     518 |                 ret = v4l2_async_nf_register(&isc->v4l2_dev,
         |                                              ^~~~~~~~~~~~~~
         |                                              |
         |                                              struct v4l2_device *
   include/media/v4l2-async.h:264:56: note: expected 'struct v4l2_async_notifier *' but argument is of type 'struct v4l2_device *'
     264 | int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c:518:23: error: too many arguments to function 'v4l2_async_nf_register'
     518 |                 ret = v4l2_async_nf_register(&isc->v4l2_dev,
         |                       ^~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-async.h:264:5: note: declared here
     264 | int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
         |     ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/v4l2_async_nf_init +512 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c

0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  387  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  388  static int atmel_isc_probe(struct platform_device *pdev)
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  389  {
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  390  	struct device *dev = &pdev->dev;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  391  	struct isc_device *isc;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  392  	struct resource *res;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  393  	void __iomem *io_base;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  394  	struct isc_subdev_entity *subdev_entity;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  395  	int irq;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  396  	int ret;
d51470069eb169 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  397  	u32 ver;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  398  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  399  	isc = devm_kzalloc(dev, sizeof(*isc), GFP_KERNEL);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  400  	if (!isc)
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  401  		return -ENOMEM;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  402  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  403  	platform_set_drvdata(pdev, isc);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  404  	isc->dev = dev;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  405  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  406  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  407  	io_base = devm_ioremap_resource(dev, res);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  408  	if (IS_ERR(io_base))
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  409  		return PTR_ERR(io_base);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  410  
55927c98a2c880 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c Eugen Hristev   2022-11-07  411  	isc->regmap = devm_regmap_init_mmio(dev, io_base, &atmel_isc_regmap_config);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  412  	if (IS_ERR(isc->regmap)) {
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  413  		ret = PTR_ERR(isc->regmap);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  414  		dev_err(dev, "failed to init register map: %d\n", ret);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  415  		return ret;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  416  	}
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  417  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  418  	irq = platform_get_irq(pdev, 0);
97299a3035328d drivers/media/platform/atmel/atmel-sama5d2-isc.c           Stephen Boyd    2019-07-30  419  	if (irq < 0)
97299a3035328d drivers/media/platform/atmel/atmel-sama5d2-isc.c           Stephen Boyd    2019-07-30  420  		return irq;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  421  
55927c98a2c880 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c Eugen Hristev   2022-11-07  422  	ret = devm_request_irq(dev, irq, atmel_isc_interrupt, 0,
d5475b3c901a00 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  423  			       "atmel-sama5d2-isc", isc);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  424  	if (ret < 0) {
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  425  		dev_err(dev, "can't register ISR for IRQ %u (ret=%i)\n",
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  426  			irq, ret);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  427  		return ret;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  428  	}
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  429  
f84bc784fa614a drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  430  	isc->gamma_table = isc_sama5d2_gamma_table;
f84bc784fa614a drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  431  	isc->gamma_max = 2;
f84bc784fa614a drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  432  
f794bc16a52da7 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  433  	isc->max_width = ISC_SAMA5D2_MAX_SUPPORT_WIDTH;
f794bc16a52da7 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  434  	isc->max_height = ISC_SAMA5D2_MAX_SUPPORT_HEIGHT;
f794bc16a52da7 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  435  
883285556388af drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  436  	isc->config_dpc = isc_sama5d2_config_dpc;
2ede3975c0a853 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  437  	isc->config_csc = isc_sama5d2_config_csc;
d3b2ee5478c856 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  438  	isc->config_cbc = isc_sama5d2_config_cbc;
2873f85bd318bf drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  439  	isc->config_cc = isc_sama5d2_config_cc;
e48848a6af150e drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  440  	isc->config_gam = isc_sama5d2_config_gam;
ef9b7779688b2d drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  441  	isc->config_rlp = isc_sama5d2_config_rlp;
8f1b451c87ee05 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  442  	isc->config_ctrls = isc_sama5d2_config_ctrls;
2ede3975c0a853 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  443  
049a38fc9681b3 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  444  	isc->adapt_pipeline = isc_sama5d2_adapt_pipeline;
049a38fc9681b3 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  445  
ffeeb01d11397b drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  446  	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
4fc9e8a775d4b3 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  447  	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
87b62b6d55dd78 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  448  	isc->offsets.sub422 = ISC_SAMA5D2_SUB422_OFFSET;
87b62b6d55dd78 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  449  	isc->offsets.sub420 = ISC_SAMA5D2_SUB420_OFFSET;
40ee17d1b41ccc drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  450  	isc->offsets.rlp = ISC_SAMA5D2_RLP_OFFSET;
1a3ac5d51541b6 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  451  	isc->offsets.his = ISC_SAMA5D2_HIS_OFFSET;
e891009857716e drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  452  	isc->offsets.dma = ISC_SAMA5D2_DMA_OFFSET;
d51470069eb169 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  453  	isc->offsets.version = ISC_SAMA5D2_VERSION_OFFSET;
629de518e6f3b8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  454  	isc->offsets.his_entry = ISC_SAMA5D2_HIS_ENTRY_OFFSET;
ffeeb01d11397b drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  455  
415dbe4efafa29 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  456  	isc->controller_formats = sama5d2_controller_formats;
415dbe4efafa29 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  457  	isc->controller_formats_size = ARRAY_SIZE(sama5d2_controller_formats);
415dbe4efafa29 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  458  	isc->formats_list = sama5d2_formats_list;
415dbe4efafa29 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  459  	isc->formats_list_size = ARRAY_SIZE(sama5d2_formats_list);
415dbe4efafa29 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  460  
cd5af39467bdc7 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  461  	/* sama5d2-isc - 8 bits per beat */
cd5af39467bdc7 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  462  	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
cd5af39467bdc7 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  463  
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  464  	/* sama5d2-isc : ISPCK is required and mandatory */
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  465  	isc->ispck_required = true;
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  466  
55927c98a2c880 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c Eugen Hristev   2022-11-07  467  	ret = atmel_isc_pipeline_init(isc);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  468  	if (ret)
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  469  		return ret;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  470  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  471  	isc->hclock = devm_clk_get(dev, "hclock");
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  472  	if (IS_ERR(isc->hclock)) {
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  473  		ret = PTR_ERR(isc->hclock);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  474  		dev_err(dev, "failed to get hclock: %d\n", ret);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  475  		return ret;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  476  	}
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  477  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  478  	ret = clk_prepare_enable(isc->hclock);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  479  	if (ret) {
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  480  		dev_err(dev, "failed to enable hclock: %d\n", ret);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  481  		return ret;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  482  	}
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  483  
55927c98a2c880 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c Eugen Hristev   2022-11-07  484  	ret = atmel_isc_clk_init(isc);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  485  	if (ret) {
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  486  		dev_err(dev, "failed to init isc clock: %d\n", ret);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  487  		goto unprepare_hclk;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  488  	}
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  489  	ret = v4l2_device_register(dev, &isc->v4l2_dev);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  490  	if (ret) {
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  491  		dev_err(dev, "unable to register v4l2 device.\n");
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  492  		goto unprepare_clk;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  493  	}
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  494  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  495  	ret = isc_parse_dt(dev, isc);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  496  	if (ret) {
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  497  		dev_err(dev, "fail to parse device tree\n");
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  498  		goto unregister_v4l2_device;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  499  	}
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  500  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  501  	if (list_empty(&isc->subdev_entities)) {
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  502  		dev_err(dev, "no subdev found\n");
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  503  		ret = -ENODEV;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  504  		goto unregister_v4l2_device;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  505  	}
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  506  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  507  	list_for_each_entry(subdev_entity, &isc->subdev_entities, list) {
39303a228c298a drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c Sakari Ailus    2023-03-07  508  		struct v4l2_async_connection *asd;
3c8c153914812a drivers/media/platform/atmel/atmel-sama5d2-isc.c           Sakari Ailus    2021-03-05  509  		struct fwnode_handle *fwnode =
3c8c153914812a drivers/media/platform/atmel/atmel-sama5d2-isc.c           Sakari Ailus    2021-03-05  510  			of_fwnode_handle(subdev_entity->epn);
d6701f13bd0747 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Ezequiel Garcia 2021-01-18  511  
3c8c153914812a drivers/media/platform/atmel/atmel-sama5d2-isc.c           Sakari Ailus    2021-03-05 @512  		v4l2_async_nf_init(&subdev_entity->notifier);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  513  
3c8c153914812a drivers/media/platform/atmel/atmel-sama5d2-isc.c           Sakari Ailus    2021-03-05  514  		asd = v4l2_async_nf_add_fwnode_remote(&subdev_entity->notifier,
3c8c153914812a drivers/media/platform/atmel/atmel-sama5d2-isc.c           Sakari Ailus    2021-03-05  515  						      fwnode,
39303a228c298a drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c Sakari Ailus    2023-03-07  516  						      struct v4l2_async_connection);
d6701f13bd0747 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Ezequiel Garcia 2021-01-18  517  
d6701f13bd0747 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Ezequiel Garcia 2021-01-18  518  		of_node_put(subdev_entity->epn);
d6701f13bd0747 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Ezequiel Garcia 2021-01-18  519  		subdev_entity->epn = NULL;
d6701f13bd0747 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Ezequiel Garcia 2021-01-18  520  
d6701f13bd0747 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Ezequiel Garcia 2021-01-18  521  		if (IS_ERR(asd)) {
d6701f13bd0747 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Ezequiel Garcia 2021-01-18  522  			ret = PTR_ERR(asd);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  523  			goto cleanup_subdev;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  524  		}
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  525  
55927c98a2c880 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c Eugen Hristev   2022-11-07  526  		subdev_entity->notifier.ops = &atmel_isc_async_ops;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  527  
3c8c153914812a drivers/media/platform/atmel/atmel-sama5d2-isc.c           Sakari Ailus    2021-03-05 @528  		ret = v4l2_async_nf_register(&isc->v4l2_dev,
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  529  					     &subdev_entity->notifier);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  530  		if (ret) {
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  531  			dev_err(dev, "fail to register async notifier\n");
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  532  			goto cleanup_subdev;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  533  		}
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  534  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  535  		if (video_is_registered(&isc->video_dev))
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  536  			break;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  537  	}
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  538  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  539  	pm_runtime_set_active(dev);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  540  	pm_runtime_enable(dev);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  541  	pm_request_idle(dev);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  542  
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  543  	isc->ispck = isc->isc_clks[ISC_ISPCK].clk;
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  544  
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  545  	ret = clk_prepare_enable(isc->ispck);
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  546  	if (ret) {
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  547  		dev_err(dev, "failed to enable ispck: %d\n", ret);
395829c61a196a drivers/media/platform/atmel/atmel-sama5d2-isc.c           Miaoqian Lin    2022-03-07  548  		goto disable_pm;
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  549  	}
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  550  
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  551  	/* ispck should be greater or equal to hclock */
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  552  	ret = clk_set_rate(isc->ispck, clk_get_rate(isc->hclock));
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  553  	if (ret) {
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  554  		dev_err(dev, "failed to set ispck rate: %d\n", ret);
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  555  		goto unprepare_clk;
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  556  	}
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  557  
d51470069eb169 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  558  	regmap_read(isc->regmap, ISC_VERSION + isc->offsets.version, &ver);
d51470069eb169 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  559  	dev_info(dev, "Microchip ISC version %x\n", ver);
d51470069eb169 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-04-13  560  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  561  	return 0;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  562  
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  563  unprepare_clk:
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  564  	clk_disable_unprepare(isc->ispck);
d7f26849ed7cc8 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2021-09-13  565  
395829c61a196a drivers/media/platform/atmel/atmel-sama5d2-isc.c           Miaoqian Lin    2022-03-07  566  disable_pm:
395829c61a196a drivers/media/platform/atmel/atmel-sama5d2-isc.c           Miaoqian Lin    2022-03-07  567  	pm_runtime_disable(dev);
395829c61a196a drivers/media/platform/atmel/atmel-sama5d2-isc.c           Miaoqian Lin    2022-03-07  568  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  569  cleanup_subdev:
55927c98a2c880 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c Eugen Hristev   2022-11-07  570  	atmel_isc_subdev_cleanup(isc);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  571  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  572  unregister_v4l2_device:
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  573  	v4l2_device_unregister(&isc->v4l2_dev);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  574  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  575  unprepare_hclk:
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  576  	clk_disable_unprepare(isc->hclock);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  577  
55927c98a2c880 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c Eugen Hristev   2022-11-07  578  	atmel_isc_clk_cleanup(isc);
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  579  
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  580  	return ret;
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  581  }
0a0e265515db76 drivers/media/platform/atmel/atmel-sama5d2-isc.c           Eugen Hristev   2019-06-12  582  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
