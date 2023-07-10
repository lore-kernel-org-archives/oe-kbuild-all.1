Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2CA156CD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 22:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689026746; x=1720562746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TVQI1Ceiy04Vycg3FZ7teOvO+F4kWoxvxHira0Ei3f4=;
  b=PV/X56Pfc9K4OG0P036ZyNRAm48v9bVvgefWhEfFW96G4B8nTezOu5cC
   6Zk8W76qcFmnkH5E46xqnmUNbILIBqejjm3pi9tiB9i92YDGEiJAd4D5M
   CkGTrY+bAz02z7cJIFBYiH6PR9APbYeblLT131A6mjXLiJY5iicBVSE4z
   1U4hPVXJEYQvZRcb9/V0K4iO96JWzjt0ZdJ5pNhi94fVriJ8qTz43Mkhg
   Z92LgrtL9f5AO/Xb4hTO6ZRVCQN5M1h/z4S3+Q7mGpWX+HTxH6Ypa123i
   Ao6fygqPgjzhqiapQ2a/95iid8KweOM1AiLFZBwTgmdBNRF5J2G85VSzT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="428165206"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="428165206"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 15:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="714950669"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="714950669"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Jul 2023 15:05:30 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIz0b-00043M-1T;
	Mon, 10 Jul 2023 22:05:29 +0000
Date: Tue, 11 Jul 2023 06:04:51 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v2_20230710_andriy_shevchenko_spi_header_and_core_clean_up_and_refactoring
 6/11] drivers/iio/dac/ad3552r.c:1024:1: warning: label 'put_child' defined
 but not used
Message-ID: <202307110552.a7J9VNkk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20230710_andriy_shevchenko_spi_header_and_core_clean_up_and_refactoring
head:   369552a608af49f5a4eb2e0f314b7404ab405b27
commit: 7ed8e3577d00253736324aabaae615698fb65f78 [6/11] spi: Clean up headers
config: i386-randconfig-i005-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110552.a7J9VNkk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110552.a7J9VNkk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110552.a7J9VNkk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/dac/ad3552r.c: In function 'ad3552r_trigger_hw_ldac':
   drivers/iio/dac/ad3552r.c:521:9: error: implicit declaration of function 'gpiod_set_value_cansleep' [-Werror=implicit-function-declaration]
     521 |         gpiod_set_value_cansleep(ldac, 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad3552r.c: In function 'ad3552r_reset':
   drivers/iio/dac/ad3552r.c:661:27: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Werror=implicit-function-declaration]
     661 |         dac->gpio_reset = devm_gpiod_get_optional(&dac->spi->dev, "reset",
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
         |                           devm_regulator_get_optional
   drivers/iio/dac/ad3552r.c:662:51: error: 'GPIOD_OUT_LOW' undeclared (first use in this function)
     662 |                                                   GPIOD_OUT_LOW);
         |                                                   ^~~~~~~~~~~~~
   drivers/iio/dac/ad3552r.c:662:51: note: each undeclared identifier is reported only once for each function it appears in
   drivers/iio/dac/ad3552r.c: In function 'ad3552r_configure_custom_gain':
   drivers/iio/dac/ad3552r.c:810:22: error: implicit declaration of function 'fwnode_get_named_child_node' [-Werror=implicit-function-declaration]
     810 |         gain_child = fwnode_get_named_child_node(child,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad3552r.c:810:20: warning: assignment to 'struct fwnode_handle *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     810 |         gain_child = fwnode_get_named_child_node(child,
         |                    ^
   drivers/iio/dac/ad3552r.c:821:15: error: implicit declaration of function 'fwnode_property_read_u32' [-Werror=implicit-function-declaration]
     821 |         err = fwnode_property_read_u32(gain_child, "adi,gain-scaling-p", &val);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad3552r.c:870:9: error: implicit declaration of function 'fwnode_handle_put' [-Werror=implicit-function-declaration]
     870 |         fwnode_handle_put(gain_child);
         |         ^~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad3552r.c: In function 'ad3552r_configure_device':
   drivers/iio/dac/ad3552r.c:888:63: error: 'GPIOD_OUT_HIGH' undeclared (first use in this function)
     888 |         dac->gpio_ldac = devm_gpiod_get_optional(dev, "ldac", GPIOD_OUT_HIGH);
         |                                                               ^~~~~~~~~~~~~~
   drivers/iio/dac/ad3552r.c:899:21: error: implicit declaration of function 'device_property_read_bool' [-Werror=implicit-function-declaration]
     899 |                 if (device_property_read_bool(dev, "adi,vref-out-en"))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad3552r.c:931:15: error: implicit declaration of function 'device_property_read_u32' [-Werror=implicit-function-declaration]
     931 |         err = device_property_read_u32(dev, "adi,sdo-drive-strength", &val);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad3552r.c:946:23: error: implicit declaration of function 'device_get_child_node_count' [-Werror=implicit-function-declaration]
     946 |         dac->num_ch = device_get_child_node_count(dev);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad3552r.c:952:9: error: implicit declaration of function 'device_for_each_child_node'; did you mean 'device_for_each_child'? [-Werror=implicit-function-declaration]
     952 |         device_for_each_child_node(dev, child) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         device_for_each_child
   drivers/iio/dac/ad3552r.c:952:47: error: expected ';' before '{' token
     952 |         device_for_each_child_node(dev, child) {
         |                                               ^~
         |                                               ;
>> drivers/iio/dac/ad3552r.c:1024:1: warning: label 'put_child' defined but not used [-Wunused-label]
    1024 | put_child:
         | ^~~~~~~~~
>> drivers/iio/dac/ad3552r.c:886:27: warning: unused variable 'ch' [-Wunused-variable]
     886 |         u32 vals[2], val, ch;
         |                           ^~
>> drivers/iio/dac/ad3552r.c:886:13: warning: unused variable 'vals' [-Wunused-variable]
     886 |         u32 vals[2], val, ch;
         |             ^~~~
>> drivers/iio/dac/ad3552r.c:885:18: warning: unused variable 'cnt' [-Wunused-variable]
     885 |         int err, cnt = 0, voltage, delta = 100000;
         |                  ^~~
   drivers/iio/dac/ad3552r.c: At top level:
   drivers/iio/dac/ad3552r.c:799:12: warning: 'ad3552r_configure_custom_gain' defined but not used [-Wunused-function]
     799 | static int ad3552r_configure_custom_gain(struct ad3552r_desc *dac,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad3552r.c:778:12: warning: 'ad3552r_find_range' defined but not used [-Wunused-function]
     778 | static int ad3552r_find_range(u16 id, s32 *vals)
         |            ^~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad3552r.c:738:13: warning: 'ad3552r_calc_gain_and_offset' defined but not used [-Wunused-function]
     738 | static void ad3552r_calc_gain_and_offset(struct ad3552r_desc *dac, s32 ch)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/iio/adc/max11410.c: In function 'max11410_parse_channels':
   drivers/iio/adc/max11410.c:707:18: error: implicit declaration of function 'device_get_child_node_count' [-Werror=implicit-function-declaration]
     707 |         num_ch = device_get_child_node_count(dev);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/max11410.c:723:9: error: implicit declaration of function 'device_for_each_child_node'; did you mean 'device_for_each_child'? [-Werror=implicit-function-declaration]
     723 |         device_for_each_child_node(dev, child) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         device_for_each_child
   drivers/iio/adc/max11410.c:723:47: error: expected ';' before '{' token
     723 |         device_for_each_child_node(dev, child) {
         |                                               ^~
         |                                               ;
>> drivers/iio/adc/max11410.c:705:18: warning: unused variable 'i' [-Wunused-variable]
     705 |         int ret, i;
         |                  ^
>> drivers/iio/adc/max11410.c:705:13: warning: unused variable 'ret' [-Wunused-variable]
     705 |         int ret, i;
         |             ^~~
>> drivers/iio/adc/max11410.c:702:24: warning: unused variable 'scale' [-Wunused-variable]
     702 |         u32 inputs[2], scale;
         |                        ^~~~~
>> drivers/iio/adc/max11410.c:702:13: warning: unused variable 'inputs' [-Wunused-variable]
     702 |         u32 inputs[2], scale;
         |             ^~~~~~
>> drivers/iio/adc/max11410.c:701:21: warning: unused variable 'node_name' [-Wunused-variable]
     701 |         const char *node_name;
         |                     ^~~~~~~~~
>> drivers/iio/adc/max11410.c:700:24: warning: unused variable 'sig_path' [-Wunused-variable]
     700 |         u32 reference, sig_path;
         |                        ^~~~~~~~
>> drivers/iio/adc/max11410.c:700:13: warning: unused variable 'reference' [-Wunused-variable]
     700 |         u32 reference, sig_path;
         |             ^~~~~~~~~
>> drivers/iio/adc/max11410.c:697:41: warning: unused variable 'cfg' [-Wunused-variable]
     697 |         struct max11410_channel_config *cfg;
         |                                         ^~~
>> drivers/iio/adc/max11410.c:695:30: warning: unused variable 'chanspec' [-Wunused-variable]
     695 |         struct iio_chan_spec chanspec = chanspec_template;
         |                              ^~~~~~~~
   drivers/iio/adc/max11410.c: In function 'max11410_probe':
   drivers/iio/adc/max11410.c:976:19: error: implicit declaration of function 'fwnode_irq_get_byname' [-Werror=implicit-function-declaration]
     976 |         irqs[0] = fwnode_irq_get_byname(dev_fwnode(dev), "gpio0");
         |                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/max11410.c:976:41: error: implicit declaration of function 'dev_fwnode'; did you mean 'dev_of_node'? [-Werror=implicit-function-declaration]
     976 |         irqs[0] = fwnode_irq_get_byname(dev_fwnode(dev), "gpio0");
         |                                         ^~~~~~~~~~
         |                                         dev_of_node
   cc1: some warnings being treated as errors
--
   drivers/iio/adc/ti-ads131e08.c: In function 'ads131e08_alloc_channels':
   drivers/iio/adc/ti-ads131e08.c:701:15: error: implicit declaration of function 'device_property_read_u32' [-Werror=implicit-function-declaration]
     701 |         ret = device_property_read_u32(dev, "ti,vref-internal", &tmp);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads131e08.c:717:24: error: implicit declaration of function 'device_get_child_node_count' [-Werror=implicit-function-declaration]
     717 |         num_channels = device_get_child_node_count(dev);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads131e08.c:739:9: error: implicit declaration of function 'device_for_each_child_node'; did you mean 'device_for_each_child'? [-Werror=implicit-function-declaration]
     739 |         device_for_each_child_node(dev, node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         device_for_each_child
   drivers/iio/adc/ti-ads131e08.c:739:46: error: expected ';' before '{' token
     739 |         device_for_each_child_node(dev, node) {
         |                                              ^~
         |                                              ;
   drivers/iio/adc/ti-ads131e08.c:789:9: error: implicit declaration of function 'fwnode_handle_put' [-Werror=implicit-function-declaration]
     789 |         fwnode_handle_put(node);
         |         ^~~~~~~~~~~~~~~~~
>> drivers/iio/adc/ti-ads131e08.c:788:1: warning: label 'err_child_out' defined but not used [-Wunused-label]
     788 | err_child_out:
         | ^~~~~~~~~~~~~
   drivers/iio/adc/ti-ads131e08.c:699:27: warning: variable 'i' set but not used [-Wunused-but-set-variable]
     699 |         int num_channels, i, ret;
         |                           ^
>> drivers/iio/adc/ti-ads131e08.c:698:22: warning: unused variable 'channel' [-Wunused-variable]
     698 |         unsigned int channel, tmp;
         |                      ^~~~~~~
   drivers/iio/adc/ti-ads131e08.c: In function 'ads131e08_probe':
   drivers/iio/adc/ti-ads131e08.c:809:16: error: implicit declaration of function 'device_get_match_data'; did you mean 'device_match_any'? [-Werror=implicit-function-declaration]
     809 |         info = device_get_match_data(&spi->dev);
         |                ^~~~~~~~~~~~~~~~~~~~~
         |                device_match_any
   drivers/iio/adc/ti-ads131e08.c:809:14: warning: assignment to 'const struct ads131e08_info *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     809 |         info = device_get_match_data(&spi->dev);
         |              ^
   drivers/iio/adc/ti-ads131e08.c: At top level:
   drivers/iio/adc/ti-ads131e08.c:320:12: warning: 'ads131e08_validate_channel_mux' defined but not used [-Wunused-function]
     320 | static int ads131e08_validate_channel_mux(struct ads131e08_state *st,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/put_child +1024 drivers/iio/dac/ad3552r.c

8f2b54824b28ba Mihail Chindris 2021-12-13   879  
8f2b54824b28ba Mihail Chindris 2021-12-13   880  static int ad3552r_configure_device(struct ad3552r_desc *dac)
8f2b54824b28ba Mihail Chindris 2021-12-13   881  {
8f2b54824b28ba Mihail Chindris 2021-12-13   882  	struct device *dev = &dac->spi->dev;
8f2b54824b28ba Mihail Chindris 2021-12-13   883  	struct fwnode_handle *child;
8f2b54824b28ba Mihail Chindris 2021-12-13   884  	struct regulator *vref;
8f2b54824b28ba Mihail Chindris 2021-12-13  @885  	int err, cnt = 0, voltage, delta = 100000;
8f2b54824b28ba Mihail Chindris 2021-12-13  @886  	u32 vals[2], val, ch;
8f2b54824b28ba Mihail Chindris 2021-12-13   887  
8f2b54824b28ba Mihail Chindris 2021-12-13   888  	dac->gpio_ldac = devm_gpiod_get_optional(dev, "ldac", GPIOD_OUT_HIGH);
8f2b54824b28ba Mihail Chindris 2021-12-13   889  	if (IS_ERR(dac->gpio_ldac))
8f2b54824b28ba Mihail Chindris 2021-12-13   890  		return dev_err_probe(dev, PTR_ERR(dac->gpio_ldac),
8f2b54824b28ba Mihail Chindris 2021-12-13   891  				     "Error getting gpio ldac");
8f2b54824b28ba Mihail Chindris 2021-12-13   892  
8f2b54824b28ba Mihail Chindris 2021-12-13   893  	vref = devm_regulator_get_optional(dev, "vref");
8f2b54824b28ba Mihail Chindris 2021-12-13   894  	if (IS_ERR(vref)) {
8f2b54824b28ba Mihail Chindris 2021-12-13   895  		if (PTR_ERR(vref) != -ENODEV)
8f2b54824b28ba Mihail Chindris 2021-12-13   896  			return dev_err_probe(dev, PTR_ERR(vref),
8f2b54824b28ba Mihail Chindris 2021-12-13   897  					     "Error getting vref");
8f2b54824b28ba Mihail Chindris 2021-12-13   898  
8f2b54824b28ba Mihail Chindris 2021-12-13   899  		if (device_property_read_bool(dev, "adi,vref-out-en"))
8f2b54824b28ba Mihail Chindris 2021-12-13   900  			val = AD3552R_INTERNAL_VREF_PIN_2P5V;
8f2b54824b28ba Mihail Chindris 2021-12-13   901  		else
8f2b54824b28ba Mihail Chindris 2021-12-13   902  			val = AD3552R_INTERNAL_VREF_PIN_FLOATING;
8f2b54824b28ba Mihail Chindris 2021-12-13   903  	} else {
8f2b54824b28ba Mihail Chindris 2021-12-13   904  		err = regulator_enable(vref);
8f2b54824b28ba Mihail Chindris 2021-12-13   905  		if (err) {
8f2b54824b28ba Mihail Chindris 2021-12-13   906  			dev_err(dev, "Failed to enable external vref supply\n");
8f2b54824b28ba Mihail Chindris 2021-12-13   907  			return err;
8f2b54824b28ba Mihail Chindris 2021-12-13   908  		}
8f2b54824b28ba Mihail Chindris 2021-12-13   909  
8f2b54824b28ba Mihail Chindris 2021-12-13   910  		err = devm_add_action_or_reset(dev, ad3552r_reg_disable, vref);
8f2b54824b28ba Mihail Chindris 2021-12-13   911  		if (err) {
8f2b54824b28ba Mihail Chindris 2021-12-13   912  			regulator_disable(vref);
8f2b54824b28ba Mihail Chindris 2021-12-13   913  			return err;
8f2b54824b28ba Mihail Chindris 2021-12-13   914  		}
8f2b54824b28ba Mihail Chindris 2021-12-13   915  
8f2b54824b28ba Mihail Chindris 2021-12-13   916  		voltage = regulator_get_voltage(vref);
8f2b54824b28ba Mihail Chindris 2021-12-13   917  		if (voltage > 2500000 + delta || voltage < 2500000 - delta) {
8f2b54824b28ba Mihail Chindris 2021-12-13   918  			dev_warn(dev, "vref-supply must be 2.5V");
8f2b54824b28ba Mihail Chindris 2021-12-13   919  			return -EINVAL;
8f2b54824b28ba Mihail Chindris 2021-12-13   920  		}
8f2b54824b28ba Mihail Chindris 2021-12-13   921  		val = AD3552R_EXTERNAL_VREF_PIN_INPUT;
8f2b54824b28ba Mihail Chindris 2021-12-13   922  	}
8f2b54824b28ba Mihail Chindris 2021-12-13   923  
8f2b54824b28ba Mihail Chindris 2021-12-13   924  	err = ad3552r_update_reg_field(dac,
8f2b54824b28ba Mihail Chindris 2021-12-13   925  				       addr_mask_map[AD3552R_VREF_SELECT][0],
8f2b54824b28ba Mihail Chindris 2021-12-13   926  				       addr_mask_map[AD3552R_VREF_SELECT][1],
8f2b54824b28ba Mihail Chindris 2021-12-13   927  				       val);
8f2b54824b28ba Mihail Chindris 2021-12-13   928  	if (err)
8f2b54824b28ba Mihail Chindris 2021-12-13   929  		return err;
8f2b54824b28ba Mihail Chindris 2021-12-13   930  
8f2b54824b28ba Mihail Chindris 2021-12-13   931  	err = device_property_read_u32(dev, "adi,sdo-drive-strength", &val);
8f2b54824b28ba Mihail Chindris 2021-12-13   932  	if (!err) {
8f2b54824b28ba Mihail Chindris 2021-12-13   933  		if (val > 3) {
8f2b54824b28ba Mihail Chindris 2021-12-13   934  			dev_err(dev, "adi,sdo-drive-strength must be less than 4\n");
8f2b54824b28ba Mihail Chindris 2021-12-13   935  			return -EINVAL;
8f2b54824b28ba Mihail Chindris 2021-12-13   936  		}
8f2b54824b28ba Mihail Chindris 2021-12-13   937  
8f2b54824b28ba Mihail Chindris 2021-12-13   938  		err = ad3552r_update_reg_field(dac,
8f2b54824b28ba Mihail Chindris 2021-12-13   939  					       addr_mask_map[AD3552R_SDO_DRIVE_STRENGTH][0],
8f2b54824b28ba Mihail Chindris 2021-12-13   940  					       addr_mask_map[AD3552R_SDO_DRIVE_STRENGTH][1],
8f2b54824b28ba Mihail Chindris 2021-12-13   941  					       val);
8f2b54824b28ba Mihail Chindris 2021-12-13   942  		if (err)
8f2b54824b28ba Mihail Chindris 2021-12-13   943  			return err;
8f2b54824b28ba Mihail Chindris 2021-12-13   944  	}
8f2b54824b28ba Mihail Chindris 2021-12-13   945  
8f2b54824b28ba Mihail Chindris 2021-12-13   946  	dac->num_ch = device_get_child_node_count(dev);
8f2b54824b28ba Mihail Chindris 2021-12-13   947  	if (!dac->num_ch) {
8f2b54824b28ba Mihail Chindris 2021-12-13   948  		dev_err(dev, "No channels defined\n");
8f2b54824b28ba Mihail Chindris 2021-12-13   949  		return -ENODEV;
8f2b54824b28ba Mihail Chindris 2021-12-13   950  	}
8f2b54824b28ba Mihail Chindris 2021-12-13   951  
8f2b54824b28ba Mihail Chindris 2021-12-13  @952  	device_for_each_child_node(dev, child) {
8f2b54824b28ba Mihail Chindris 2021-12-13   953  		err = fwnode_property_read_u32(child, "reg", &ch);
8f2b54824b28ba Mihail Chindris 2021-12-13   954  		if (err) {
8f2b54824b28ba Mihail Chindris 2021-12-13   955  			dev_err(dev, "mandatory reg property missing\n");
8f2b54824b28ba Mihail Chindris 2021-12-13   956  			goto put_child;
8f2b54824b28ba Mihail Chindris 2021-12-13   957  		}
8f2b54824b28ba Mihail Chindris 2021-12-13   958  		if (ch >= AD3552R_NUM_CH) {
8f2b54824b28ba Mihail Chindris 2021-12-13   959  			dev_err(dev, "reg must be less than %d\n",
8f2b54824b28ba Mihail Chindris 2021-12-13   960  				AD3552R_NUM_CH);
8f2b54824b28ba Mihail Chindris 2021-12-13   961  			err = -EINVAL;
8f2b54824b28ba Mihail Chindris 2021-12-13   962  			goto put_child;
8f2b54824b28ba Mihail Chindris 2021-12-13   963  		}
8f2b54824b28ba Mihail Chindris 2021-12-13   964  
8f2b54824b28ba Mihail Chindris 2021-12-13   965  		if (fwnode_property_present(child, "adi,output-range-microvolt")) {
8f2b54824b28ba Mihail Chindris 2021-12-13   966  			err = fwnode_property_read_u32_array(child,
8f2b54824b28ba Mihail Chindris 2021-12-13   967  							     "adi,output-range-microvolt",
8f2b54824b28ba Mihail Chindris 2021-12-13   968  							     vals,
8f2b54824b28ba Mihail Chindris 2021-12-13   969  							     2);
8f2b54824b28ba Mihail Chindris 2021-12-13   970  			if (err) {
8f2b54824b28ba Mihail Chindris 2021-12-13   971  				dev_err(dev,
8f2b54824b28ba Mihail Chindris 2021-12-13   972  					"adi,output-range-microvolt property could not be parsed\n");
8f2b54824b28ba Mihail Chindris 2021-12-13   973  				goto put_child;
8f2b54824b28ba Mihail Chindris 2021-12-13   974  			}
8f2b54824b28ba Mihail Chindris 2021-12-13   975  
8f2b54824b28ba Mihail Chindris 2021-12-13   976  			err = ad3552r_find_range(dac->chip_id, vals);
8f2b54824b28ba Mihail Chindris 2021-12-13   977  			if (err < 0) {
8f2b54824b28ba Mihail Chindris 2021-12-13   978  				dev_err(dev,
8f2b54824b28ba Mihail Chindris 2021-12-13   979  					"Invalid adi,output-range-microvolt value\n");
8f2b54824b28ba Mihail Chindris 2021-12-13   980  				goto put_child;
8f2b54824b28ba Mihail Chindris 2021-12-13   981  			}
8f2b54824b28ba Mihail Chindris 2021-12-13   982  			val = err;
8f2b54824b28ba Mihail Chindris 2021-12-13   983  			err = ad3552r_set_ch_value(dac,
8f2b54824b28ba Mihail Chindris 2021-12-13   984  						   AD3552R_CH_OUTPUT_RANGE_SEL,
8f2b54824b28ba Mihail Chindris 2021-12-13   985  						   ch, val);
8f2b54824b28ba Mihail Chindris 2021-12-13   986  			if (err)
8f2b54824b28ba Mihail Chindris 2021-12-13   987  				goto put_child;
8f2b54824b28ba Mihail Chindris 2021-12-13   988  
8f2b54824b28ba Mihail Chindris 2021-12-13   989  			dac->ch_data[ch].range = val;
8f2b54824b28ba Mihail Chindris 2021-12-13   990  		} else if (dac->chip_id == AD3542R_ID) {
8f2b54824b28ba Mihail Chindris 2021-12-13   991  			dev_err(dev,
8f2b54824b28ba Mihail Chindris 2021-12-13   992  				"adi,output-range-microvolt is required for ad3542r\n");
8f2b54824b28ba Mihail Chindris 2021-12-13   993  			err = -EINVAL;
8f2b54824b28ba Mihail Chindris 2021-12-13   994  			goto put_child;
8f2b54824b28ba Mihail Chindris 2021-12-13   995  		} else {
8f2b54824b28ba Mihail Chindris 2021-12-13   996  			err = ad3552r_configure_custom_gain(dac, child, ch);
8f2b54824b28ba Mihail Chindris 2021-12-13   997  			if (err)
8f2b54824b28ba Mihail Chindris 2021-12-13   998  				goto put_child;
8f2b54824b28ba Mihail Chindris 2021-12-13   999  		}
8f2b54824b28ba Mihail Chindris 2021-12-13  1000  
8f2b54824b28ba Mihail Chindris 2021-12-13  1001  		ad3552r_calc_gain_and_offset(dac, ch);
8f2b54824b28ba Mihail Chindris 2021-12-13  1002  		dac->enabled_ch |= BIT(ch);
8f2b54824b28ba Mihail Chindris 2021-12-13  1003  
8f2b54824b28ba Mihail Chindris 2021-12-13  1004  		err = ad3552r_set_ch_value(dac, AD3552R_CH_SELECT, ch, 1);
8f2b54824b28ba Mihail Chindris 2021-12-13  1005  		if (err < 0)
8f2b54824b28ba Mihail Chindris 2021-12-13  1006  			goto put_child;
8f2b54824b28ba Mihail Chindris 2021-12-13  1007  
8f2b54824b28ba Mihail Chindris 2021-12-13  1008  		dac->channels[cnt] = AD3552R_CH_DAC(ch);
8f2b54824b28ba Mihail Chindris 2021-12-13  1009  		++cnt;
8f2b54824b28ba Mihail Chindris 2021-12-13  1010  
8f2b54824b28ba Mihail Chindris 2021-12-13  1011  	}
8f2b54824b28ba Mihail Chindris 2021-12-13  1012  
8f2b54824b28ba Mihail Chindris 2021-12-13  1013  	/* Disable unused channels */
8f2b54824b28ba Mihail Chindris 2021-12-13  1014  	for_each_clear_bit(ch, &dac->enabled_ch, AD3552R_NUM_CH) {
8f2b54824b28ba Mihail Chindris 2021-12-13  1015  		err = ad3552r_set_ch_value(dac, AD3552R_CH_AMPLIFIER_POWERDOWN,
8f2b54824b28ba Mihail Chindris 2021-12-13  1016  					   ch, 1);
8f2b54824b28ba Mihail Chindris 2021-12-13  1017  		if (err)
8f2b54824b28ba Mihail Chindris 2021-12-13  1018  			return err;
8f2b54824b28ba Mihail Chindris 2021-12-13  1019  	}
8f2b54824b28ba Mihail Chindris 2021-12-13  1020  
8f2b54824b28ba Mihail Chindris 2021-12-13  1021  	dac->num_ch = cnt;
8f2b54824b28ba Mihail Chindris 2021-12-13  1022  
8f2b54824b28ba Mihail Chindris 2021-12-13  1023  	return 0;
8f2b54824b28ba Mihail Chindris 2021-12-13 @1024  put_child:
8f2b54824b28ba Mihail Chindris 2021-12-13  1025  	fwnode_handle_put(child);
8f2b54824b28ba Mihail Chindris 2021-12-13  1026  
8f2b54824b28ba Mihail Chindris 2021-12-13  1027  	return err;
8f2b54824b28ba Mihail Chindris 2021-12-13  1028  }
8f2b54824b28ba Mihail Chindris 2021-12-13  1029  

:::::: The code at line 1024 was first introduced by commit
:::::: 8f2b54824b28ba8317c60947b5941d686e3df70d drivers:iio:dac: Add AD3552R driver support

:::::: TO: Mihail Chindris <mihail.chindris@analog.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
