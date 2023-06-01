Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B6D23422
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 14:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685630068; x=1717166068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QpHlxFaYDKzdr4tCqywpP5S+WSVJjjMDQCbyCTbcqkk=;
  b=VWHPP+AGqZhN8SB8dM84pBDjZbLO6HB5JqINVN184xXWWk7pnFqbBeAc
   shmgPtydoYNst77iuqNmPCwnQSdslmJaaKqDEgRutJyHk2NBp29DkiewQ
   aBcb06+loojU9Y699xwhwKrwwtGyVJXy6MYiPfJ9j943OKjDd5u4tcBch
   P6rgmOrH35YynGqDpMqQ/9yqG+tW+w9BdWEZjuWRMQwyJMujpbAnCdAyo
   5RkroS2kt/sOkn3LgNiBODmtUiUXTgL9Z294yYiudFGQCvPW92koBCsz8
   Tdr+61SzK3xOHeB80iJVefRJIqWr+BBsDEdh0522xouNxcnsSyuTM0s6U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="355585926"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="355585926"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 07:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737123554"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="737123554"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Jun 2023 07:34:22 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4jNe-0002NI-0S;
	Thu, 01 Jun 2023 14:34:22 +0000
Date: Thu, 1 Jun 2023 22:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [linux-next:master 6070/6538]
 drivers/net/dsa/qca/qca8k-leds.c:406:31: error: 'struct led_classdev' has no
 member named 'hw_control_get_device'
Message-ID: <202306011915.bWdy8AJ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   571d71e886a5edc89b4ea6d0fe6f445282938320
commit: 4f53c27f772e27e4cf4e5507d6f4d5980002cb6a [6070/6538] net: dsa: qca8k: add op to get ports netdev
config: arm64-randconfig-r001-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011915.bWdy8AJ8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4f53c27f772e27e4cf4e5507d6f4d5980002cb6a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4f53c27f772e27e4cf4e5507d6f4d5980002cb6a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/dsa/qca/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011915.bWdy8AJ8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/dsa/qca/qca8k-leds.c: In function 'qca8k_parse_port_leds':
   drivers/net/dsa/qca/qca8k-leds.c:403:31: error: 'struct led_classdev' has no member named 'hw_control_is_supported'
     403 |                 port_led->cdev.hw_control_is_supported = qca8k_cled_hw_control_is_supported;
         |                               ^
   drivers/net/dsa/qca/qca8k-leds.c:404:31: error: 'struct led_classdev' has no member named 'hw_control_set'
     404 |                 port_led->cdev.hw_control_set = qca8k_cled_hw_control_set;
         |                               ^
   drivers/net/dsa/qca/qca8k-leds.c:405:31: error: 'struct led_classdev' has no member named 'hw_control_get'
     405 |                 port_led->cdev.hw_control_get = qca8k_cled_hw_control_get;
         |                               ^
>> drivers/net/dsa/qca/qca8k-leds.c:406:31: error: 'struct led_classdev' has no member named 'hw_control_get_device'
     406 |                 port_led->cdev.hw_control_get_device = qca8k_cled_hw_control_get_device;
         |                               ^
   drivers/net/dsa/qca/qca8k-leds.c:407:31: error: 'struct led_classdev' has no member named 'hw_control_trigger'
     407 |                 port_led->cdev.hw_control_trigger = "netdev";
         |                               ^


vim +406 drivers/net/dsa/qca/qca8k-leds.c

   342	
   343	static int
   344	qca8k_parse_port_leds(struct qca8k_priv *priv, struct fwnode_handle *port, int port_num)
   345	{
   346		struct fwnode_handle *led = NULL, *leds = NULL;
   347		struct led_init_data init_data = { };
   348		struct dsa_switch *ds = priv->ds;
   349		enum led_default_state state;
   350		struct qca8k_led *port_led;
   351		int led_num, led_index;
   352		int ret;
   353	
   354		leds = fwnode_get_named_child_node(port, "leds");
   355		if (!leds) {
   356			dev_dbg(priv->dev, "No Leds node specified in device tree for port %d!\n",
   357				port_num);
   358			return 0;
   359		}
   360	
   361		fwnode_for_each_child_node(leds, led) {
   362			/* Reg represent the led number of the port.
   363			 * Each port can have at most 3 leds attached
   364			 * Commonly:
   365			 * 1. is gigabit led
   366			 * 2. is mbit led
   367			 * 3. additional status led
   368			 */
   369			if (fwnode_property_read_u32(led, "reg", &led_num))
   370				continue;
   371	
   372			if (led_num >= QCA8K_LED_PORT_COUNT) {
   373				dev_warn(priv->dev, "Invalid LED reg %d defined for port %d",
   374					 led_num, port_num);
   375				continue;
   376			}
   377	
   378			led_index = QCA8K_LED_PORT_INDEX(port_num, led_num);
   379	
   380			port_led = &priv->ports_led[led_index];
   381			port_led->port_num = port_num;
   382			port_led->led_num = led_num;
   383			port_led->priv = priv;
   384	
   385			state = led_init_default_state_get(led);
   386			switch (state) {
   387			case LEDS_DEFSTATE_ON:
   388				port_led->cdev.brightness = 1;
   389				qca8k_led_brightness_set(port_led, 1);
   390				break;
   391			case LEDS_DEFSTATE_KEEP:
   392				port_led->cdev.brightness =
   393						qca8k_led_brightness_get(port_led);
   394				break;
   395			default:
   396				port_led->cdev.brightness = 0;
   397				qca8k_led_brightness_set(port_led, 0);
   398			}
   399	
   400			port_led->cdev.max_brightness = 1;
   401			port_led->cdev.brightness_set_blocking = qca8k_cled_brightness_set_blocking;
   402			port_led->cdev.blink_set = qca8k_cled_blink_set;
   403			port_led->cdev.hw_control_is_supported = qca8k_cled_hw_control_is_supported;
   404			port_led->cdev.hw_control_set = qca8k_cled_hw_control_set;
   405			port_led->cdev.hw_control_get = qca8k_cled_hw_control_get;
 > 406			port_led->cdev.hw_control_get_device = qca8k_cled_hw_control_get_device;
   407			port_led->cdev.hw_control_trigger = "netdev";
   408			init_data.default_label = ":port";
   409			init_data.fwnode = led;
   410			init_data.devname_mandatory = true;
   411			init_data.devicename = kasprintf(GFP_KERNEL, "%s:0%d", ds->slave_mii_bus->id,
   412							 port_num);
   413			if (!init_data.devicename)
   414				return -ENOMEM;
   415	
   416			ret = devm_led_classdev_register_ext(priv->dev, &port_led->cdev, &init_data);
   417			if (ret)
   418				dev_warn(priv->dev, "Failed to init LED %d for port %d", led_num, port_num);
   419	
   420			kfree(init_data.devicename);
   421		}
   422	
   423		return 0;
   424	}
   425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
