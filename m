Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73FC15B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 01:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677114042; x=1708650042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YLP9Dk1BRC6bF7x3/asi8+4YqQoug2yceliAy/e8nQY=;
  b=isuEAMvMvkbkZLRkDv/jk4DAL0hVgB6WQcqhauWY15rFLI6WDmVSGtHt
   V3S4FFBd1bxVqQfNpHSZZPTa4E+3R8fyNzqO2jjKFGQbSHpXrMw13pqA/
   Ch5mc/WBJCqtpz3ip8elZ3mNa1RSZ7kVE/drrfwWvYdOE3EdS19WUkplq
   /+9IuEu1FK4bvMyKYWp1kYmFr2drnqgdTz/beGdRwahl4t1+k+QtAgLrc
   ddzvZ3OdH+ar7MjW+aHTjIBkPZwRS+385MGuX3Rk4hEBC9ditTpB+bs8e
   VDqinMLj4p6BmMss976TUhGX3iq450RLbwe7eToWmiPcjBVGaWCFKXrTa
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="312707690"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="312707690"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 17:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="917777203"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="917777203"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Feb 2023 17:00:39 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUzyR-0000rj-02;
	Thu, 23 Feb 2023 01:00:39 +0000
Date: Thu, 23 Feb 2023 08:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 6/8] media: i2c: add DS90UB960 driver
Message-ID: <202302230812.E7YUDwoD-lkp@intel.com>
References: <20230222132907.594690-7-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222132907.594690-7-tomi.valkeinen@ideasonboard.com>

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
patch link:    https://lore.kernel.org/r/20230222132907.594690-7-tomi.valkeinen%40ideasonboard.com
patch subject: [PATCH v10 6/8] media: i2c: add DS90UB960 driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230223/202302230812.E7YUDwoD-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a29202c9dbc0af66dcebae21b3681262b3fa17e6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tomi-Valkeinen/i2c-add-I2C-Address-Translator-ATR-support/20230222-234839
        git checkout a29202c9dbc0af66dcebae21b3681262b3fa17e6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302230812.E7YUDwoD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from include/linux/i2c-atr.h:14,
                    from drivers/media/i2c/ds90ub960.c:34:
   drivers/media/i2c/ds90ub960.c: In function 'ub960_log_status':
>> drivers/media/i2c/ds90ub960.c:3020:23: warning: field precision specifier '.*' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
    3020 |         dev_info(dev, "ID '%.*s'\n", sizeof(id), id);
         |                       ^~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:150:58: note: in expansion of macro 'dev_fmt'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/media/i2c/ds90ub960.c:3020:9: note: in expansion of macro 'dev_info'
    3020 |         dev_info(dev, "ID '%.*s'\n", sizeof(id), id);
         |         ^~~~~~~~
   drivers/media/i2c/ds90ub960.c:3020:30: note: format string is defined here
    3020 |         dev_info(dev, "ID '%.*s'\n", sizeof(id), id);
         |                            ~~^~
         |                              |
         |                              int


vim +3020 drivers/media/i2c/ds90ub960.c

  3003	
  3004	static int ub960_log_status(struct v4l2_subdev *sd)
  3005	{
  3006		struct ub960_data *priv = sd_to_ub960(sd);
  3007		struct device *dev = &priv->client->dev;
  3008		struct v4l2_subdev_state *state;
  3009		unsigned int nport;
  3010		unsigned int i;
  3011		u16 v16 = 0;
  3012		u8 v = 0;
  3013		u8 id[UB960_SR_FPD3_RX_ID_LEN];
  3014	
  3015		state = v4l2_subdev_lock_and_get_active_state(sd);
  3016	
  3017		for (i = 0; i < sizeof(id); i++)
  3018			ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
  3019	
> 3020		dev_info(dev, "ID '%.*s'\n", sizeof(id), id);
  3021	
  3022		for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
  3023			struct ub960_txport *txport = priv->txports[nport];
  3024	
  3025			dev_info(dev, "TX %u\n", nport);
  3026	
  3027			if (!txport) {
  3028				dev_info(dev, "\tNot initialized\n");
  3029				continue;
  3030			}
  3031	
  3032			ub960_txport_read(priv, nport, UB960_TR_CSI_STS, &v);
  3033			dev_info(dev, "\tsync %u, pass %u\n", v & (u8)BIT(1),
  3034				 v & (u8)BIT(0));
  3035	
  3036			ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport), &v16);
  3037			dev_info(dev, "\tframe counter %u\n", v16);
  3038	
  3039			ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport), &v16);
  3040			dev_info(dev, "\tframe error counter %u\n", v16);
  3041	
  3042			ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport), &v16);
  3043			dev_info(dev, "\tline counter %u\n", v16);
  3044	
  3045			ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport), &v16);
  3046			dev_info(dev, "\tline error counter %u\n", v16);
  3047		}
  3048	
  3049		for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
  3050			struct ub960_rxport *rxport = priv->rxports[nport];
  3051			u8 eq_level;
  3052			s8 strobe_pos;
  3053			unsigned int i;
  3054	
  3055			dev_info(dev, "RX %u\n", nport);
  3056	
  3057			if (!rxport) {
  3058				dev_info(dev, "\tNot initialized\n");
  3059				continue;
  3060			}
  3061	
  3062			ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &v);
  3063	
  3064			if (v & UB960_RR_RX_PORT_STS1_LOCK_STS)
  3065				dev_info(dev, "\tLocked\n");
  3066			else
  3067				dev_info(dev, "\tNot locked\n");
  3068	
  3069			dev_info(dev, "\trx_port_sts1 %#02x\n", v);
  3070			ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v);
  3071			dev_info(dev, "\trx_port_sts2 %#02x\n", v);
  3072	
  3073			ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v16);
  3074			dev_info(dev, "\tlink freq %llu Hz\n", (v16 * 1000000ULL) >> 8);
  3075	
  3076			ub960_rxport_read16(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v16);
  3077			dev_info(dev, "\tparity errors %u\n", v16);
  3078	
  3079			ub960_rxport_read16(priv, nport, UB960_RR_LINE_COUNT_HI, &v16);
  3080			dev_info(dev, "\tlines per frame %u\n", v16);
  3081	
  3082			ub960_rxport_read16(priv, nport, UB960_RR_LINE_LEN_1, &v16);
  3083			dev_info(dev, "\tbytes per line %u\n", v16);
  3084	
  3085			ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v);
  3086			dev_info(dev, "\tcsi_err_counter %u\n", v);
  3087	
  3088			/* Strobe */
  3089	
  3090			ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
  3091	
  3092			dev_info(dev, "\t%s strobe\n",
  3093				 (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) ? "Adaptive" :
  3094									  "Manual");
  3095	
  3096			if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
  3097				ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
  3098	
  3099				dev_info(dev, "\tStrobe range [%d, %d]\n",
  3100					 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) - 7,
  3101					 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) - 7);
  3102			}
  3103	
  3104			ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
  3105	
  3106			dev_info(dev, "\tStrobe pos %d\n", strobe_pos);
  3107	
  3108			/* EQ */
  3109	
  3110			ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
  3111	
  3112			dev_info(dev, "\t%s EQ\n",
  3113				 (v & UB960_RR_AEQ_BYPASS_ENABLE) ? "Manual" :
  3114								    "Adaptive");
  3115	
  3116			if (!(v & UB960_RR_AEQ_BYPASS_ENABLE)) {
  3117				ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
  3118	
  3119				dev_info(dev, "\tEQ range [%u, %u]\n",
  3120					 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) & 0xf,
  3121					 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT) & 0xf);
  3122			}
  3123	
  3124			if (ub960_rxport_get_eq_level(priv, nport, &eq_level) == 0)
  3125				dev_info(dev, "\tEQ level %u\n", eq_level);
  3126	
  3127			/* GPIOs */
  3128			for (i = 0; i < UB960_NUM_BC_GPIOS; i++) {
  3129				u8 ctl_reg;
  3130				u8 ctl_shift;
  3131	
  3132				ctl_reg = UB960_RR_BC_GPIO_CTL(i / 2);
  3133				ctl_shift = (i % 2) * 4;
  3134	
  3135				ub960_rxport_read(priv, nport, ctl_reg, &v);
  3136	
  3137				dev_info(dev, "\tGPIO%u: mode %u\n", i,
  3138					 (v >> ctl_shift) & 0xf);
  3139			}
  3140		}
  3141	
  3142		v4l2_subdev_unlock_state(state);
  3143	
  3144		return 0;
  3145	}
  3146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
