Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D40E7E2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 04:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676003243; x=1707539243;
  h=date:from:cc:subject:message-id:mime-version;
  bh=BCek8t0JeGzvEK6wu116iAXo54s71FTa/1NkgZkzQdk=;
  b=g3Y0mJ6JW0LaXJM90tTf5msU+c243MsCewhQAb/odqUDnkLaSZqSrg5K
   6DOh242Fladp3QWGad4xxqz3+s7Aorb/DMqwpEzWl4liSFLH+H8BQJzy7
   KGQPJV3DoRx4Bog8mlmJUV8e0AiocYnXIa80txznUBWLldHnUezc0rmBh
   NSF2eMJq632pif3L60LrPpe7/dhGxx1c32VdtjjETF7Z7ATxLs7RBNOKC
   /CKuaCDt56oaLZ1xgoVGpvmHMnRzug6b+2ambFNuFlpxGbcaJrG3+ZiGg
   n4RzskdyKI8Lc1wBuyp7kExASivucR0eP9OdY2z3BXpfuIu3aGeiQRR7K
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="310698304"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="310698304"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 20:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="913399738"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="913399738"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Feb 2023 20:27:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQL0K-0005YH-19;
	Fri, 10 Feb 2023 04:27:20 +0000
Date: Fri, 10 Feb 2023 12:26:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y 16229/21442]
 drivers/media/i2c/ds90ub953.c:268:6: error: no member named 'of_xlate' in
 'struct gpio_chip'
Message-ID: <202302101239.OIR2d59B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tomi,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   221424b9d0cea049e58d5ad93fcec93c90511744
commit: 51c767df6b13b4db728ececa0c5d8e644705dd62 [16229/21442] media: i2c: add DS90UB953 driver
config: hexagon-randconfig-r014-20230210 (https://download.01.org/0day-ci/archive/20230210/202302101239.OIR2d59B-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout 51c767df6b13b4db728ececa0c5d8e644705dd62
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101239.OIR2d59B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ds90ub953.c:268:6: error: no member named 'of_xlate' in 'struct gpio_chip'
           gc->of_xlate = ub953_gpio_of_xlate;
           ~~  ^
>> drivers/media/i2c/ds90ub953.c:269:6: error: no member named 'of_node' in 'struct gpio_chip'
           gc->of_node = priv->client->dev.of_node;
           ~~  ^
>> drivers/media/i2c/ds90ub953.c:270:6: error: no member named 'of_gpio_n_cells' in 'struct gpio_chip'
           gc->of_gpio_n_cells = 2;
           ~~  ^
   3 errors generated.


vim +268 drivers/media/i2c/ds90ub953.c

   244	
   245	static int ub953_gpiochip_probe(struct ub953_data *priv)
   246	{
   247		struct device *dev = &priv->client->dev;
   248		struct gpio_chip *gc = &priv->gpio_chip;
   249		int ret;
   250	
   251		/* Set all GPIOs to local mode */
   252		ub953_write(priv, UB953_REG_LOCAL_GPIO_DATA, 0);
   253	
   254		scnprintf(priv->gpio_chip_name, sizeof(priv->gpio_chip_name), "%s",
   255			  dev_name(dev));
   256	
   257		gc->label = priv->gpio_chip_name;
   258		gc->parent = dev;
   259		gc->owner = THIS_MODULE;
   260		gc->base = -1;
   261		gc->can_sleep = 1;
   262		gc->ngpio = UB953_NUM_GPIOS;
   263		gc->get_direction = ub953_gpio_get_direction;
   264		gc->direction_input = ub953_gpio_direction_in;
   265		gc->direction_output = ub953_gpio_direction_out;
   266		gc->get = ub953_gpio_get;
   267		gc->set = ub953_gpio_set;
 > 268		gc->of_xlate = ub953_gpio_of_xlate;
 > 269		gc->of_node = priv->client->dev.of_node;
 > 270		gc->of_gpio_n_cells = 2;
   271	
   272		ret = gpiochip_add_data(gc, priv);
   273		if (ret) {
   274			dev_err(dev, "Failed to add GPIOs: %d\n", ret);
   275			return ret;
   276		}
   277	
   278		return 0;
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
