Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C744621CEB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685629191; x=1717165191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X6KKEp0V1GUXANQ0rZJBMjbMpeWKMO99DlS80GR99TM=;
  b=N1RmbMCmPRCKQ3/C4ij/J94PaVlwTBaqYGcl1wastDFhM3xN/QmLcUox
   KnlPj9HWSyDEWuROp7mHkjLE+rdL/tkJTy3l6WUhMWtzw5Yvv+bD7269J
   2y47I6AtQULT0+TqvumQZMs2ecSh29Lw6CVlgDTFJSAr/MFFnam8H5GbA
   U2cvGA7+I1wv0hPf00SlO5R95LxVCXlde5D85vpmg9xGrG3oGTV+1blmU
   xOf3UEdG8vzTU/8tDy9OgBHhanvkfdg7jWfYcIpOZ0YhzYfdy9zO3ujUK
   ucocm4ySpLYiKRa8YaWmTnlqFuQyp9FGPRBCLJYETKxsyITFDxkIawHeX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="441931589"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="441931589"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 07:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="819811072"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="819811072"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2023 07:19:17 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4j92-0002Ls-2A;
	Thu, 01 Jun 2023 14:19:16 +0000
Date: Thu, 1 Jun 2023 22:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 6069/6538]
 drivers/net/dsa/qca/qca8k-leds.c:377:31: error: 'struct led_classdev' has no
 member named 'hw_control_is_supported'
Message-ID: <202306011753.7eXAmz0M-lkp@intel.com>
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
commit: e0256648c831af13cbfe4a1787327fcec01c2807 [6069/6538] net: dsa: qca8k: implement hw_control ops
config: arm64-randconfig-r001-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011753.7eXAmz0M-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e0256648c831af13cbfe4a1787327fcec01c2807
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e0256648c831af13cbfe4a1787327fcec01c2807
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/dsa/qca/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011753.7eXAmz0M-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/dsa/qca/qca8k-leds.c: In function 'qca8k_parse_port_leds':
>> drivers/net/dsa/qca/qca8k-leds.c:377:31: error: 'struct led_classdev' has no member named 'hw_control_is_supported'
     377 |                 port_led->cdev.hw_control_is_supported = qca8k_cled_hw_control_is_supported;
         |                               ^
>> drivers/net/dsa/qca/qca8k-leds.c:378:31: error: 'struct led_classdev' has no member named 'hw_control_set'
     378 |                 port_led->cdev.hw_control_set = qca8k_cled_hw_control_set;
         |                               ^
>> drivers/net/dsa/qca/qca8k-leds.c:379:31: error: 'struct led_classdev' has no member named 'hw_control_get'
     379 |                 port_led->cdev.hw_control_get = qca8k_cled_hw_control_get;
         |                               ^
>> drivers/net/dsa/qca/qca8k-leds.c:380:31: error: 'struct led_classdev' has no member named 'hw_control_trigger'
     380 |                 port_led->cdev.hw_control_trigger = "netdev";
         |                               ^


vim +377 drivers/net/dsa/qca/qca8k-leds.c

   316	
   317	static int
   318	qca8k_parse_port_leds(struct qca8k_priv *priv, struct fwnode_handle *port, int port_num)
   319	{
   320		struct fwnode_handle *led = NULL, *leds = NULL;
   321		struct led_init_data init_data = { };
   322		struct dsa_switch *ds = priv->ds;
   323		enum led_default_state state;
   324		struct qca8k_led *port_led;
   325		int led_num, led_index;
   326		int ret;
   327	
   328		leds = fwnode_get_named_child_node(port, "leds");
   329		if (!leds) {
   330			dev_dbg(priv->dev, "No Leds node specified in device tree for port %d!\n",
   331				port_num);
   332			return 0;
   333		}
   334	
   335		fwnode_for_each_child_node(leds, led) {
   336			/* Reg represent the led number of the port.
   337			 * Each port can have at most 3 leds attached
   338			 * Commonly:
   339			 * 1. is gigabit led
   340			 * 2. is mbit led
   341			 * 3. additional status led
   342			 */
   343			if (fwnode_property_read_u32(led, "reg", &led_num))
   344				continue;
   345	
   346			if (led_num >= QCA8K_LED_PORT_COUNT) {
   347				dev_warn(priv->dev, "Invalid LED reg %d defined for port %d",
   348					 led_num, port_num);
   349				continue;
   350			}
   351	
   352			led_index = QCA8K_LED_PORT_INDEX(port_num, led_num);
   353	
   354			port_led = &priv->ports_led[led_index];
   355			port_led->port_num = port_num;
   356			port_led->led_num = led_num;
   357			port_led->priv = priv;
   358	
   359			state = led_init_default_state_get(led);
   360			switch (state) {
   361			case LEDS_DEFSTATE_ON:
   362				port_led->cdev.brightness = 1;
   363				qca8k_led_brightness_set(port_led, 1);
   364				break;
   365			case LEDS_DEFSTATE_KEEP:
   366				port_led->cdev.brightness =
   367						qca8k_led_brightness_get(port_led);
   368				break;
   369			default:
   370				port_led->cdev.brightness = 0;
   371				qca8k_led_brightness_set(port_led, 0);
   372			}
   373	
   374			port_led->cdev.max_brightness = 1;
   375			port_led->cdev.brightness_set_blocking = qca8k_cled_brightness_set_blocking;
   376			port_led->cdev.blink_set = qca8k_cled_blink_set;
 > 377			port_led->cdev.hw_control_is_supported = qca8k_cled_hw_control_is_supported;
 > 378			port_led->cdev.hw_control_set = qca8k_cled_hw_control_set;
 > 379			port_led->cdev.hw_control_get = qca8k_cled_hw_control_get;
 > 380			port_led->cdev.hw_control_trigger = "netdev";
   381			init_data.default_label = ":port";
   382			init_data.fwnode = led;
   383			init_data.devname_mandatory = true;
   384			init_data.devicename = kasprintf(GFP_KERNEL, "%s:0%d", ds->slave_mii_bus->id,
   385							 port_num);
   386			if (!init_data.devicename)
   387				return -ENOMEM;
   388	
   389			ret = devm_led_classdev_register_ext(priv->dev, &port_led->cdev, &init_data);
   390			if (ret)
   391				dev_warn(priv->dev, "Failed to init LED %d for port %d", led_num, port_num);
   392	
   393			kfree(init_data.devicename);
   394		}
   395	
   396		return 0;
   397	}
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
