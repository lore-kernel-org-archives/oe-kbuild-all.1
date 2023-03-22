Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26ED15C8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 03:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679457499; x=1710993499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JrGh6jxQLYJ9ogbmrqBC3AVPFc03/t2UrihD5eI/iJQ=;
  b=eQjNgacl9iQKb7cOH4qklM48waTZwMVd8N6F6VQcYpmJeyOME3sJf2gf
   Ba6/6NP6bj75MI9UaUp692q9x6ZS0uPv9aLDMkkLefV/tBZTwtOpT2cGP
   YxAfKiQA4zEiM7Boq3H9MdBVEZTvTaG0WgxZZNL/jmKtpudiCLZekKItj
   2Od8uRsYJFrl++sKZxHsO+wm72CdpYSQdckyTC1H7dSanbIVT78ICgeCK
   2VLigO7SSlTzF6H/X2vRP+0n9vgRPQ7qxLPBq68iFccscgQDvqmD77FfJ
   zak12+CCgq9Yqvy1K5akGEzYNKqvqkvef82f2yeihy1U5D1f5xN51lvjr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="337846122"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="337846122"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 20:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="770901492"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="770901492"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Mar 2023 20:58:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pepc6-000CqU-3D;
	Wed, 22 Mar 2023 03:58:15 +0000
Date: Wed, 22 Mar 2023 11:57:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: [lunn:v6.2.0-net-next-phy-leds 10/28]
 drivers/net/dsa/qca/qca8k-leds.c:89:43: error: 'struct led_classdev' has no
 member named 'trigger'
Message-ID: <202303221122.LDgX9LXH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.2.0-net-next-phy-leds
head:   8a9b1a5ad5dd0e48585009020088a2ee5bdd6688
commit: 4224813a0f5a6ce1476d73761e5eed08884b2da6 [10/28] net: dsa: qca8k: add LEDs support
config: loongarch-randconfig-r022-20230322 (https://download.01.org/0day-ci/archive/20230322/202303221122.LDgX9LXH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/4224813a0f5a6ce1476d73761e5eed08884b2da6
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2.0-net-next-phy-leds
        git checkout 4224813a0f5a6ce1476d73761e5eed08884b2da6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/net/dsa/qca/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221122.LDgX9LXH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/dsa/qca/qca8k-leds.c: In function 'qca8k_cled_hw_control_configure':
>> drivers/net/dsa/qca/qca8k-leds.c:89:43: error: 'struct led_classdev' has no member named 'trigger'
      89 |         struct led_trigger *trigger = ldev->trigger;
         |                                           ^~
>> drivers/net/dsa/qca/qca8k-leds.c:96:27: error: 'struct led_trigger' has no member named 'name'
      96 |         if (strcmp(trigger->name, "netdev"))
         |                           ^~
   drivers/net/dsa/qca/qca8k-leds.c:99:28: error: 'struct led_trigger' has no member named 'name'
      99 |         if (!strcmp(trigger->name, "netdev"))
         |                            ^~
   drivers/net/dsa/qca/qca8k-leds.c: In function 'qca8k_parse_port_leds':
>> drivers/net/dsa/qca/qca8k-leds.c:374:31: error: 'struct led_classdev' has no member named 'blink_mode'
     374 |                 port_led->cdev.blink_mode = LED_BLINK_SWHW_CONTROLLED;
         |                               ^
>> drivers/net/dsa/qca/qca8k-leds.c:379:31: error: 'struct led_classdev' has no member named 'hw_control_start'
     379 |                 port_led->cdev.hw_control_start = qca8k_cled_hw_control_start;
         |                               ^
>> drivers/net/dsa/qca/qca8k-leds.c:380:31: error: 'struct led_classdev' has no member named 'hw_control_stop'
     380 |                 port_led->cdev.hw_control_stop = qca8k_cled_hw_control_stop;
         |                               ^
>> drivers/net/dsa/qca/qca8k-leds.c:381:31: error: 'struct led_classdev' has no member named 'hw_control_status'
     381 |                 port_led->cdev.hw_control_status = qca8k_cled_hw_control_status;
         |                               ^
>> drivers/net/dsa/qca/qca8k-leds.c:382:31: error: 'struct led_classdev' has no member named 'hw_control_configure'
     382 |                 port_led->cdev.hw_control_configure = qca8k_cled_hw_control_configure;
         |                               ^


vim +89 drivers/net/dsa/qca/qca8k-leds.c

    83	
    84	static int
    85	qca8k_cled_hw_control_configure(struct led_classdev *ldev, unsigned long rules,
    86					enum led_blink_hw_cmd cmd)
    87	{
    88		struct qca8k_led *led = container_of(ldev, struct qca8k_led, cdev);
  > 89		struct led_trigger *trigger = ldev->trigger;
    90		struct qca8k_led_pattern_en reg_info;
    91		struct qca8k_priv *priv = led->priv;
    92		u32 offload_trigger = 0, mask, val;
    93		int ret;
    94	
    95		/* Check trigger compatibility */
  > 96		if (strcmp(trigger->name, "netdev"))
    97			return -EOPNOTSUPP;
    98	
    99		if (!strcmp(trigger->name, "netdev"))
   100			ret = qca8k_parse_netdev(rules, &offload_trigger, &mask);
   101	
   102		if (ret)
   103			return ret;
   104	
   105		qca8k_get_control_led_reg(led->port_num, led->led_num, &reg_info);
   106	
   107		switch (cmd) {
   108		case LED_BLINK_HW_SUPPORTED:
   109			/* We reach this point, we are sure the trigger is supported */
   110			return 1;
   111		case LED_BLINK_HW_RESET:
   112			/* We set 4hz by default */
   113			ret = regmap_update_bits(priv->regmap, reg_info.reg,
   114						 QCA8K_LED_RULE_MASK << reg_info.shift,
   115						 QCA8K_LED_BLINK_4HZ << reg_info.shift);
   116			break;
   117		case LED_BLINK_HW_ENABLE:
   118			ret = regmap_update_bits(priv->regmap, reg_info.reg,
   119						 mask << reg_info.shift,
   120						 offload_trigger << reg_info.shift);
   121			break;
   122		case LED_BLINK_HW_DISABLE:
   123			ret = regmap_update_bits(priv->regmap, reg_info.reg,
   124						 mask << reg_info.shift,
   125						 0);
   126			break;
   127		case LED_BLINK_HW_STATUS:
   128			ret = regmap_read(priv->regmap, reg_info.reg, &val);
   129			if (ret)
   130				return ret;
   131	
   132			val >>= reg_info.shift;
   133			val &= offload_trigger;
   134	
   135			return val;
   136		default:
   137			return -EOPNOTSUPP;
   138		}
   139	
   140		return ret;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
