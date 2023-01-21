Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178347E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 15:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674314972; x=1705850972;
  h=date:from:cc:subject:message-id:mime-version;
  bh=IvFkx9NgcS0kKhg+rrvwVuB17fjdnaSGwgB/DV4JqOY=;
  b=Vxhx9BLQkgXzMN/4MdtJwup0asXFoZb2lKogb7aVqRUywIdf9rL3HQ1d
   lxBQJpVWdTzptGKKwGQqsutbClCftIIKwee7PFpr15vrhLSH1BQxXulv7
   WOEKhT7Y2JYcrWR2qzRZZVVwJfZV1k3YxWHmFbY+HKExWWcsBVpMKESu1
   ItJikYUT/4Yo0g0fPwI63wk/y+6PSdUmUcyfkg7guS5jr3g39qCnTizKF
   1XQ/84NOVmujT9pTlK+BO8ZQlk3eWLVjsQR5cSab0a+8p5RMXU3sTYiAD
   WTYcbFprUl/KhEfvZ2ODokoBux+L6qfdNuC4xs7ws4vHBox9iLkdw/UTD
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="313683190"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="313683190"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 07:29:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="662858210"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="662858210"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jan 2023 07:29:28 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJFo7-0004Cs-17;
	Sat, 21 Jan 2023 15:29:27 +0000
Date: Sat, 21 Jan 2023 23:28:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y-cicd 16229/21104]
 drivers/media/i2c/ds90ub953.c:268:11: error: 'struct gpio_chip' has no
 member named 'of_xlate'
Message-ID: <202301212344.lYUQxxLV-lkp@intel.com>
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

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   b1294a176635a75f2e351773ba76f41d11ec53e4
commit: 51c767df6b13b4db728ececa0c5d8e644705dd62 [16229/21104] media: i2c: add DS90UB953 driver
config: ia64-buildonly-randconfig-r003-20230121 (https://download.01.org/0day-ci/archive/20230121/202301212344.lYUQxxLV-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout 51c767df6b13b4db728ececa0c5d8e644705dd62
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/ia64/include/asm/pgtable.h:154,
                    from include/linux/pgtable.h:6,
                    from arch/ia64/include/asm/uaccess.h:40,
                    from include/linux/uaccess.h:11,
                    from arch/ia64/include/asm/sections.h:11,
                    from include/linux/interrupt.h:20,
                    from arch/ia64/include/asm/hw_irq.h:10,
                    from include/linux/irq.h:591,
                    from include/linux/gpio/driver.h:7,
                    from drivers/media/i2c/ds90ub953.c:12:
   arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
   arch/ia64/include/asm/mmu_context.h:137:48: warning: variable 'old_rr4' set but not used [-Wunused-but-set-variable]
     137 |         unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
         |                                                ^~~~~~~
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
