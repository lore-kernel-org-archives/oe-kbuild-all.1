Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF03A1FB5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 07:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677136254; x=1708672254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uWFv4XH3rhBJ/f63WlqWAxrxm8amt5ciKkQNpz7xDoA=;
  b=g0Eoy8XytTcvaxMBZEDKmmfYNG893bWkRJxmV6Vvg4vsBGnQ+8Ben866
   RodI4YCITjp5ISWexe7D7QrKzJwJt3TkB9GdxOtXqo8l8Pz8v1V+2MCW3
   oPEDuksXMm2Yp31jI9yfYrpgs4FS7I3FnRXfIpzuElqD0I3AOs/IY+nle
   7rzrF+W8z8fwtADbL4RTtkn+9TifN4KzZ3vSaqf3A7HIs1Cg8NW53eUV+
   rEN10LSGzLpUSrJo0oEW2SsmMCkNyhLNQputPuHfDYRHjy7x4BCLvlMoC
   SVlnuAxJ2xjyeS0fkaNRCwpTjOQ9kXQNVl8sFxiajy37dsTjMUpm/KEw0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="397829153"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="397829153"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 23:10:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="917874807"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="917874807"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Feb 2023 23:10:52 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV5kh-00018a-1k;
	Thu, 23 Feb 2023 07:10:51 +0000
Date: Thu, 23 Feb 2023 15:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 8/8] media: i2c: add DS90UB953 driver
Message-ID: <202302231450.jVPzRXbK-lkp@intel.com>
References: <20230222132907.594690-9-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222132907.594690-9-tomi.valkeinen@ideasonboard.com>

Hi Tomi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on sailus-media-tree/streams next-20230222]
[cannot apply to wsa/i2c/for-next linus/master v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/i2c-add-I2C-Address-Translator-ATR-support/20230222-234839
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230222132907.594690-9-tomi.valkeinen%40ideasonboard.com
patch subject: [PATCH v10 8/8] media: i2c: add DS90UB953 driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230223/202302231450.jVPzRXbK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/34b28a8690e0cdd2d859d35261490ee3efc65b24
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tomi-Valkeinen/i2c-add-I2C-Address-Translator-ATR-support/20230222-234839
        git checkout 34b28a8690e0cdd2d859d35261490ee3efc65b24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231450.jVPzRXbK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/gpio/driver.h:5,
                    from drivers/media/i2c/ds90ub953.c:15:
   drivers/media/i2c/ds90ub953.c: In function 'ub953_log_status':
>> drivers/media/i2c/ds90ub953.c:603:23: warning: field precision specifier '.*' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
     603 |         dev_info(dev, "ID '%.*s'\n", sizeof(id), id);
         |                       ^~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:150:58: note: in expansion of macro 'dev_fmt'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/media/i2c/ds90ub953.c:603:9: note: in expansion of macro 'dev_info'
     603 |         dev_info(dev, "ID '%.*s'\n", sizeof(id), id);
         |         ^~~~~~~~
   drivers/media/i2c/ds90ub953.c:603:30: note: format string is defined here
     603 |         dev_info(dev, "ID '%.*s'\n", sizeof(id), id);
         |                            ~~^~
         |                              |
         |                              int


vim +603 drivers/media/i2c/ds90ub953.c

   588	
   589	static int ub953_log_status(struct v4l2_subdev *sd)
   590	{
   591		struct ub953_data *priv = sd_to_ub953(sd);
   592		struct device *dev = &priv->client->dev;
   593		u8 v = 0, v1 = 0, v2 = 0;
   594		unsigned int i;
   595		char id[UB953_REG_FPD3_RX_ID_LEN];
   596		u8 gpio_local_data;
   597		u8 gpio_input_ctrl;
   598		u8 gpio_pin_sts;
   599	
   600		for (i = 0; i < sizeof(id); i++)
   601			ub953_read(priv, UB953_REG_FPD3_RX_ID(i), &id[i]);
   602	
 > 603		dev_info(dev, "ID '%.*s'\n", sizeof(id), id);
   604	
   605		ub953_read(priv, UB953_REG_GENERAL_STATUS, &v);
   606		dev_info(dev, "GENERAL_STATUS %#02x\n", v);
   607	
   608		ub953_read(priv, UB953_REG_CRC_ERR_CNT1, &v1);
   609		ub953_read(priv, UB953_REG_CRC_ERR_CNT2, &v2);
   610		dev_info(dev, "CRC error count %u\n", v1 | (v2 << 8));
   611	
   612		ub953_read(priv, UB953_REG_CSI_ERR_CNT, &v);
   613		dev_info(dev, "CSI error count %u\n", v);
   614	
   615		ub953_read(priv, UB953_REG_CSI_ERR_STATUS, &v);
   616		dev_info(dev, "CSI_ERR_STATUS %#02x\n", v);
   617	
   618		ub953_read(priv, UB953_REG_CSI_ERR_DLANE01, &v);
   619		dev_info(dev, "CSI_ERR_DLANE01 %#02x\n", v);
   620	
   621		ub953_read(priv, UB953_REG_CSI_ERR_DLANE23, &v);
   622		dev_info(dev, "CSI_ERR_DLANE23 %#02x\n", v);
   623	
   624		ub953_read(priv, UB953_REG_CSI_ERR_CLK_LANE, &v);
   625		dev_info(dev, "CSI_ERR_CLK_LANE %#02x\n", v);
   626	
   627		ub953_read(priv, UB953_REG_CSI_PKT_HDR_VC_ID, &v);
   628		dev_info(dev, "CSI packet header VC %u ID %u\n", v >> 6, v & 0x3f);
   629	
   630		ub953_read(priv, UB953_REG_PKT_HDR_WC_LSB, &v1);
   631		ub953_read(priv, UB953_REG_PKT_HDR_WC_MSB, &v2);
   632		dev_info(dev, "CSI packet header WC %u\n", (v2 << 8) | v1);
   633	
   634		ub953_read(priv, UB953_REG_CSI_ECC, &v);
   635		dev_info(dev, "CSI ECC %#02x\n", v);
   636	
   637		ub953_read(priv, UB953_REG_LOCAL_GPIO_DATA, &gpio_local_data);
   638		ub953_read(priv, UB953_REG_GPIO_INPUT_CTRL, &gpio_input_ctrl);
   639		ub953_read(priv, UB953_REG_GPIO_PIN_STS, &gpio_pin_sts);
   640	
   641		for (i = 0; i < UB953_NUM_GPIOS; i++) {
   642			dev_info(dev,
   643				 "GPIO%u: remote: %u is_input: %u is_output: %u val: %u sts: %u\n",
   644				 i,
   645				 !!(gpio_local_data & UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(i)),
   646				 !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(i)),
   647				 !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_OUT_EN(i)),
   648				 !!(gpio_local_data & UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(i)),
   649				 !!(gpio_pin_sts & UB953_REG_GPIO_PIN_STS_GPIO_STS(i)));
   650		}
   651	
   652		return 0;
   653	}
   654	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
