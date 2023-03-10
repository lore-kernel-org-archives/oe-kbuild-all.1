Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2432103
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 09:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678439969; x=1709975969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9/+N1xq7fnCrni+/z3Kgli6vGm+Sjl92ym+nr/yX6yo=;
  b=DqsEqpsmkUBA//kYi5QNZ3gfhtY/s75GPxYJNV/Axce0AuKLDr0Mmrfk
   WSx4sbghxuA9+lWvYtXmeLRgbpLbFLshnNKmzGv9BXVPJWZFDcggeQTa/
   9BlUmQYutyd/X7NL9sC5NLJWKhlvAFFpxV7UoVSpJ9K4j9h//8zz8aLC2
   6sXkbwkOBpgrrvAZcOmzDxwfL+gn2+Ev1aIGQDHt/oG9azrGtEB7hvk3m
   zZRYVygiUb1EjDsHHopIFdXB6j+Gx1z5lzMvV78jKzlxGp0fRleC9bZ7Y
   vqyigelZMf8++S6XLHDeWKCTL7goOEejmL43DbNbcL5haey4tNdHAk3NL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="338240651"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="338240651"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 01:19:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677736672"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="677736672"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Mar 2023 01:19:11 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paYu7-0003hH-0T;
	Fri, 10 Mar 2023 09:19:11 +0000
Date: Fri, 10 Mar 2023 17:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/property-read 60/75] drivers/usb/misc/usb251xb.c:413:68:
 error: expected ';' before ')' token
Message-ID: <202303101721.6tDsJuPB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/property-read
head:   74493ede940cb21df9738396bb9dc7c33d1ecc37
commit: 267fb6d23eaaeb7486efacc1dbe5eaf8a080862e [60/75] usb: Use of_property_read_bool() for boolean properties
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20230310/202303101721.6tDsJuPB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=267fb6d23eaaeb7486efacc1dbe5eaf8a080862e
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/property-read
        git checkout 267fb6d23eaaeb7486efacc1dbe5eaf8a080862e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/usb/misc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101721.6tDsJuPB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/misc/usb251xb.c: In function 'usb251xb_get_ofdata':
>> drivers/usb/misc/usb251xb.c:413:68: error: expected ';' before ')' token
     413 |         hub->skip_config = of_property_read_bool(np, "skip-config"))
         |                                                                    ^
         |                                                                    ;
>> drivers/usb/misc/usb251xb.c:413:68: error: expected statement before ')' token


vim +413 drivers/usb/misc/usb251xb.c

   397	
   398	static int usb251xb_get_ofdata(struct usb251xb *hub,
   399				       const struct usb251xb_data *data)
   400	{
   401		struct device *dev = hub->dev;
   402		struct device_node *np = dev->of_node;
   403		int len;
   404		u32 property_u32 = 0;
   405		const char *cproperty_char;
   406		char str[USB251XB_STRING_BUFSIZE / 2];
   407	
   408		if (!np) {
   409			dev_err(dev, "failed to get ofdata\n");
   410			return -ENODEV;
   411		}
   412	
 > 413		hub->skip_config = of_property_read_bool(np, "skip-config"))
   414	
   415		hub->gpio_reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
   416		if (IS_ERR(hub->gpio_reset))
   417			return dev_err_probe(dev, PTR_ERR(hub->gpio_reset),
   418					     "unable to request GPIO reset pin\n");
   419	
   420		if (of_property_read_u16_array(np, "vendor-id", &hub->vendor_id, 1))
   421			hub->vendor_id = USB251XB_DEF_VENDOR_ID;
   422	
   423		if (of_property_read_u16_array(np, "product-id",
   424					       &hub->product_id, 1))
   425			hub->product_id = data->product_id;
   426	
   427		if (of_property_read_u16_array(np, "device-id", &hub->device_id, 1))
   428			hub->device_id = USB251XB_DEF_DEVICE_ID;
   429	
   430		hub->conf_data1 = USB251XB_DEF_CONFIG_DATA_1;
   431		if (of_property_read_bool(np, "self-powered")) {
   432			hub->conf_data1 |= BIT(7);
   433	
   434			/* Configure Over-Current sens when self-powered */
   435			hub->conf_data1 &= ~BIT(2);
   436			if (of_property_read_bool(np, "ganged-sensing"))
   437				hub->conf_data1 &= ~BIT(1);
   438			else if (of_property_read_bool(np, "individual-sensing"))
   439				hub->conf_data1 |= BIT(1);
   440		} else if (of_property_read_bool(np, "bus-powered")) {
   441			hub->conf_data1 &= ~BIT(7);
   442	
   443			/* Disable Over-Current sense when bus-powered */
   444			hub->conf_data1 |= BIT(2);
   445		}
   446	
   447		if (of_property_read_bool(np, "disable-hi-speed"))
   448			hub->conf_data1 |= BIT(5);
   449	
   450		if (of_property_read_bool(np, "multi-tt"))
   451			hub->conf_data1 |= BIT(4);
   452		else if (of_property_read_bool(np, "single-tt"))
   453			hub->conf_data1 &= ~BIT(4);
   454	
   455		if (of_property_read_bool(np, "disable-eop"))
   456			hub->conf_data1 |= BIT(3);
   457	
   458		if (of_property_read_bool(np, "individual-port-switching"))
   459			hub->conf_data1 |= BIT(0);
   460		else if (of_property_read_bool(np, "ganged-port-switching"))
   461			hub->conf_data1 &= ~BIT(0);
   462	
   463		hub->conf_data2 = USB251XB_DEF_CONFIG_DATA_2;
   464		if (of_property_read_bool(np, "dynamic-power-switching"))
   465			hub->conf_data2 |= BIT(7);
   466	
   467		if (!of_property_read_u32(np, "oc-delay-us", &property_u32)) {
   468			if (property_u32 == 100) {
   469				/* 100 us*/
   470				hub->conf_data2 &= ~BIT(5);
   471				hub->conf_data2 &= ~BIT(4);
   472			} else if (property_u32 == 4000) {
   473				/* 4 ms */
   474				hub->conf_data2 &= ~BIT(5);
   475				hub->conf_data2 |= BIT(4);
   476			} else if (property_u32 == 16000) {
   477				/* 16 ms */
   478				hub->conf_data2 |= BIT(5);
   479				hub->conf_data2 |= BIT(4);
   480			} else {
   481				/* 8 ms (DEFAULT) */
   482				hub->conf_data2 |= BIT(5);
   483				hub->conf_data2 &= ~BIT(4);
   484			}
   485		}
   486	
   487		if (of_property_read_bool(np, "compound-device"))
   488			hub->conf_data2 |= BIT(3);
   489	
   490		hub->conf_data3 = USB251XB_DEF_CONFIG_DATA_3;
   491		if (of_property_read_bool(np, "port-mapping-mode"))
   492			hub->conf_data3 |= BIT(3);
   493	
   494		if (data->led_support && of_get_property(np, "led-usb-mode", NULL))
   495			hub->conf_data3 &= ~BIT(1);
   496	
   497		if (of_property_read_bool(np, "string-support"))
   498			hub->conf_data3 |= BIT(0);
   499	
   500		hub->non_rem_dev = USB251XB_DEF_NON_REMOVABLE_DEVICES;
   501		usb251xb_get_ports_field(hub, "non-removable-ports", data->port_cnt,
   502					 true, &hub->non_rem_dev);
   503	
   504		hub->port_disable_sp = USB251XB_DEF_PORT_DISABLE_SELF;
   505		usb251xb_get_ports_field(hub, "sp-disabled-ports", data->port_cnt,
   506					 true, &hub->port_disable_sp);
   507	
   508		hub->port_disable_bp = USB251XB_DEF_PORT_DISABLE_BUS;
   509		usb251xb_get_ports_field(hub, "bp-disabled-ports", data->port_cnt,
   510					 true, &hub->port_disable_bp);
   511	
   512		hub->max_power_sp = USB251XB_DEF_MAX_POWER_SELF;
   513		if (!of_property_read_u32(np, "sp-max-total-current-microamp",
   514		    &property_u32))
   515			hub->max_power_sp = min_t(u8, property_u32 / 2000, 50);
   516	
   517		hub->max_power_bp = USB251XB_DEF_MAX_POWER_BUS;
   518		if (!of_property_read_u32(np, "bp-max-total-current-microamp",
   519		    &property_u32))
   520			hub->max_power_bp = min_t(u8, property_u32 / 2000, 255);
   521	
   522		hub->max_current_sp = USB251XB_DEF_MAX_CURRENT_SELF;
   523		if (!of_property_read_u32(np, "sp-max-removable-current-microamp",
   524		    &property_u32))
   525			hub->max_current_sp = min_t(u8, property_u32 / 2000, 50);
   526	
   527		hub->max_current_bp = USB251XB_DEF_MAX_CURRENT_BUS;
   528		if (!of_property_read_u32(np, "bp-max-removable-current-microamp",
   529		    &property_u32))
   530			hub->max_current_bp = min_t(u8, property_u32 / 2000, 255);
   531	
   532		hub->power_on_time = USB251XB_DEF_POWER_ON_TIME;
   533		if (!of_property_read_u32(np, "power-on-time-ms", &property_u32))
   534			hub->power_on_time = min_t(u8, property_u32 / 2, 255);
   535	
   536		if (of_property_read_u16_array(np, "language-id", &hub->lang_id, 1))
   537			hub->lang_id = USB251XB_DEF_LANGUAGE_ID;
   538	
   539		if (of_property_read_u8(np, "boost-up", &hub->boost_up))
   540			hub->boost_up = USB251XB_DEF_BOOST_UP;
   541	
   542		cproperty_char = of_get_property(np, "manufacturer", NULL);
   543		strscpy(str, cproperty_char ? : USB251XB_DEF_MANUFACTURER_STRING,
   544			sizeof(str));
   545		hub->manufacturer_len = strlen(str) & 0xFF;
   546		memset(hub->manufacturer, 0, USB251XB_STRING_BUFSIZE);
   547		len = min_t(size_t, USB251XB_STRING_BUFSIZE / 2, strlen(str));
   548		len = utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
   549				      (wchar_t *)hub->manufacturer,
   550				      USB251XB_STRING_BUFSIZE);
   551	
   552		cproperty_char = of_get_property(np, "product", NULL);
   553		strscpy(str, cproperty_char ? : data->product_str, sizeof(str));
   554		hub->product_len = strlen(str) & 0xFF;
   555		memset(hub->product, 0, USB251XB_STRING_BUFSIZE);
   556		len = min_t(size_t, USB251XB_STRING_BUFSIZE / 2, strlen(str));
   557		len = utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
   558				      (wchar_t *)hub->product,
   559				      USB251XB_STRING_BUFSIZE);
   560	
   561		cproperty_char = of_get_property(np, "serial", NULL);
   562		strscpy(str, cproperty_char ? : USB251XB_DEF_SERIAL_STRING,
   563			sizeof(str));
   564		hub->serial_len = strlen(str) & 0xFF;
   565		memset(hub->serial, 0, USB251XB_STRING_BUFSIZE);
   566		len = min_t(size_t, USB251XB_STRING_BUFSIZE / 2, strlen(str));
   567		len = utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
   568				      (wchar_t *)hub->serial,
   569				      USB251XB_STRING_BUFSIZE);
   570	
   571		/*
   572		 * The datasheet documents the register as 'Port Swap' but in real the
   573		 * register controls the USB DP/DM signal swapping for each port.
   574		 */
   575		hub->port_swap = USB251XB_DEF_PORT_SWAP;
   576		usb251xb_get_ports_field(hub, "swap-dx-lanes", data->port_cnt,
   577					 false, &hub->port_swap);
   578	
   579		/* The following parameters are currently not exposed to devicetree, but
   580		 * may be as soon as needed.
   581		 */
   582		hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
   583		hub->boost_57 = USB251XB_DEF_BOOST_57;
   584		hub->boost_14 = USB251XB_DEF_BOOST_14;
   585		hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
   586		hub->port_map34 = USB251XB_DEF_PORT_MAP_34;
   587		hub->port_map56 = USB251XB_DEF_PORT_MAP_56;
   588		hub->port_map7  = USB251XB_DEF_PORT_MAP_7;
   589	
   590		return 0;
   591	}
   592	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
