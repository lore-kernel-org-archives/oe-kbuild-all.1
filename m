Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6C8A2C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 02:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676082115; x=1707618115;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xzHGxb4v9trWLNDY/Q9fmcDX3lrdCcZlJ9Hoh1F+M/A=;
  b=ItkITw1IYFUkM7E2hWNq7GkoUV8OnFM/7tYJnUc1hPCJMwfT6Dw3psjQ
   d7Y+PmtdklNryuQDvKwNU0gQUiBFYOQOTYJEDCvu1AClbXoVd4rAV48Ob
   h+LnB7pyLZD98zASinKdOi8sdpf5+ev/bgCqysRZZ0ejoYlizi+ebd/gR
   iA8k2py1YAYxNqE98wf7vDF/HbdeJE41R0qjWESD9UnlFlcDadiDGbAJq
   BZfe4uHSVxd7Koplzo0M9sYIuvEa2NB7CrSfgQUzCL8Qyng9Fe5ueAAAQ
   aYZ74ghwIzhTG3rOoqDJ8W1++phzUFGWQtwSW2W6xIzsAnEb5f+3i+vLN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="332712739"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="332712739"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 18:21:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="698603582"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="698603582"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Feb 2023 18:21:53 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQfWS-0006BJ-2l;
	Sat, 11 Feb 2023 02:21:52 +0000
Date: Sat, 11 Feb 2023 10:21:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y 16229/21442]
 drivers/media/i2c/ds90ub953.c:268:11: error: 'struct gpio_chip' has no
 member named 'of_xlate'
Message-ID: <202302111001.JAsMs9id-lkp@intel.com>
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
config: mips-randconfig-r016-20230210 (https://download.01.org/0day-ci/archive/20230211/202302111001.JAsMs9id-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout 51c767df6b13b4db728ececa0c5d8e644705dd62
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111001.JAsMs9id-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/ds90ub953.c: In function 'ub953_gpiochip_probe':
>> drivers/media/i2c/ds90ub953.c:268:11: error: 'struct gpio_chip' has no member named 'of_xlate'
     268 |         gc->of_xlate = ub953_gpio_of_xlate;
         |           ^~
>> drivers/media/i2c/ds90ub953.c:269:11: error: 'struct gpio_chip' has no member named 'of_node'
     269 |         gc->of_node = priv->client->dev.of_node;
         |           ^~
>> drivers/media/i2c/ds90ub953.c:270:11: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     270 |         gc->of_gpio_n_cells = 2;
         |           ^~


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
