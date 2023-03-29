Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E496FA2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 18:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680116296; x=1711652296;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iFMfpO1rcVzrBtGFigcEjcf/UNisBZWLmooJ0PVXzbI=;
  b=DOOpLTHgL+pnx0bABsAPGwVqC/vpt8JllEmeQ6UZoy5iUbY94PfGbukj
   NvqZZCLlADrVw2nE4TnzbrLrw6e0ime5IKY52bnhqc1R+WT/pVBwPD0kS
   elQ2DYEKz3DP2t+AkfBcYyYBUo0s0pkr1vwLbPzesEWg13GTOfCPXmT98
   9dtUUnYawINGQyNSFjiiP7eGXk7zPNQx19Kv/tQKm4KE/k6gKoOJPjCqU
   Tf8A5BksXmTSfXL8DFpLZwc3k3Ql3I/E1CahTUyDdYbp1X9+1sN6cz2Hc
   eHEOXy+cxAdE82dN85Mx0wiqRe8Jt0eMpxua52mAXf8LrRJKz7moh0om7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="405925404"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="405925404"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 11:58:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="748886475"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="748886475"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 Mar 2023 11:58:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phazn-000JqU-1e;
	Wed, 29 Mar 2023 18:58:07 +0000
Date: Thu, 30 Mar 2023 02:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:acpi-header-cleanup 1/1] drivers/iio/adc/ad7292.c:307:9:
 error: implicit declaration of function 'for_each_available_child_of_node';
 did you mean 'fwnode_for_each_available_child_node'?
Message-ID: <202303300215.NYzjkkSH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git acpi-header-cleanup
head:   333a203a26446521eac7046c6fb7426997569bf8
commit: 333a203a26446521eac7046c6fb7426997569bf8 [1/1] ACPI: Replace irqdomain.h include with struct declarations
config: csky-randconfig-r004-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300215.NYzjkkSH-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=333a203a26446521eac7046c6fb7426997569bf8
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh acpi-header-cleanup
        git checkout 333a203a26446521eac7046c6fb7426997569bf8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/iio/adc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300215.NYzjkkSH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/adc/ad7292.c: In function 'ad7292_probe':
>> drivers/iio/adc/ad7292.c:307:9: error: implicit declaration of function 'for_each_available_child_of_node'; did you mean 'fwnode_for_each_available_child_node'? [-Werror=implicit-function-declaration]
     307 |         for_each_available_child_of_node(spi->dev.of_node, child) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         fwnode_for_each_available_child_node
>> drivers/iio/adc/ad7292.c:307:66: error: expected ';' before '{' token
     307 |         for_each_available_child_of_node(spi->dev.of_node, child) {
         |                                                                  ^~
         |                                                                  ;
   drivers/iio/adc/ad7292.c:263:14: warning: unused variable 'diff_channels' [-Wunused-variable]
     263 |         bool diff_channels = false;
         |              ^~~~~~~~~~~~~
   drivers/iio/adc/ad7292.c:324:1: error: control reaches end of non-void function [-Werror=return-type]
     324 | }
         | ^
   drivers/iio/adc/ad7292.c: At top level:
   drivers/iio/adc/ad7292.c:61:35: warning: 'ad7292_channels_diff' defined but not used [-Wunused-const-variable=]
      61 | static const struct iio_chan_spec ad7292_channels_diff[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad7292.c:50:35: warning: 'ad7292_channels' defined but not used [-Wunused-const-variable=]
      50 | static const struct iio_chan_spec ad7292_channels[] = {
         |                                   ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +307 drivers/iio/adc/ad7292.c

506d2e317a0a02 Marcelo Schmitt 2019-11-08  257  
506d2e317a0a02 Marcelo Schmitt 2019-11-08  258  static int ad7292_probe(struct spi_device *spi)
506d2e317a0a02 Marcelo Schmitt 2019-11-08  259  {
506d2e317a0a02 Marcelo Schmitt 2019-11-08  260  	struct ad7292_state *st;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  261  	struct iio_dev *indio_dev;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  262  	struct device_node *child;
707182b4ff3e64 Guoqing Chi     2021-03-19  263  	bool diff_channels = false;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  264  	int ret;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  265  
506d2e317a0a02 Marcelo Schmitt 2019-11-08  266  	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
506d2e317a0a02 Marcelo Schmitt 2019-11-08  267  	if (!indio_dev)
506d2e317a0a02 Marcelo Schmitt 2019-11-08  268  		return -ENOMEM;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  269  
506d2e317a0a02 Marcelo Schmitt 2019-11-08  270  	st = iio_priv(indio_dev);
506d2e317a0a02 Marcelo Schmitt 2019-11-08  271  	st->spi = spi;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  272  
506d2e317a0a02 Marcelo Schmitt 2019-11-08  273  	ret = ad7292_spi_reg_read(st, AD7292_REG_VENDOR_ID);
506d2e317a0a02 Marcelo Schmitt 2019-11-08  274  	if (ret != ADI_VENDOR_ID) {
506d2e317a0a02 Marcelo Schmitt 2019-11-08  275  		dev_err(&spi->dev, "Wrong vendor id 0x%x\n", ret);
506d2e317a0a02 Marcelo Schmitt 2019-11-08  276  		return -EINVAL;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  277  	}
506d2e317a0a02 Marcelo Schmitt 2019-11-08  278  
506d2e317a0a02 Marcelo Schmitt 2019-11-08  279  	st->reg = devm_regulator_get_optional(&spi->dev, "vref");
506d2e317a0a02 Marcelo Schmitt 2019-11-08  280  	if (!IS_ERR(st->reg)) {
506d2e317a0a02 Marcelo Schmitt 2019-11-08  281  		ret = regulator_enable(st->reg);
506d2e317a0a02 Marcelo Schmitt 2019-11-08  282  		if (ret) {
506d2e317a0a02 Marcelo Schmitt 2019-11-08  283  			dev_err(&spi->dev,
506d2e317a0a02 Marcelo Schmitt 2019-11-08  284  				"Failed to enable external vref supply\n");
506d2e317a0a02 Marcelo Schmitt 2019-11-08  285  			return ret;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  286  		}
506d2e317a0a02 Marcelo Schmitt 2019-11-08  287  
506d2e317a0a02 Marcelo Schmitt 2019-11-08  288  		ret = devm_add_action_or_reset(&spi->dev,
506d2e317a0a02 Marcelo Schmitt 2019-11-08  289  					       ad7292_regulator_disable, st);
22b4277641c682 Matti Vaittinen 2022-08-19  290  		if (ret)
506d2e317a0a02 Marcelo Schmitt 2019-11-08  291  			return ret;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  292  
506d2e317a0a02 Marcelo Schmitt 2019-11-08  293  		ret = regulator_get_voltage(st->reg);
506d2e317a0a02 Marcelo Schmitt 2019-11-08  294  		if (ret < 0)
506d2e317a0a02 Marcelo Schmitt 2019-11-08  295  			return ret;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  296  
506d2e317a0a02 Marcelo Schmitt 2019-11-08  297  		st->vref_mv = ret / 1000;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  298  	} else {
506d2e317a0a02 Marcelo Schmitt 2019-11-08  299  		/* Use the internal voltage reference. */
506d2e317a0a02 Marcelo Schmitt 2019-11-08  300  		st->vref_mv = 1250;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  301  	}
506d2e317a0a02 Marcelo Schmitt 2019-11-08  302  
506d2e317a0a02 Marcelo Schmitt 2019-11-08  303  	indio_dev->name = spi_get_device_id(spi)->name;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  304  	indio_dev->modes = INDIO_DIRECT_MODE;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  305  	indio_dev->info = &ad7292_info;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  306  
506d2e317a0a02 Marcelo Schmitt 2019-11-08 @307  	for_each_available_child_of_node(spi->dev.of_node, child) {
506d2e317a0a02 Marcelo Schmitt 2019-11-08  308  		diff_channels = of_property_read_bool(child, "diff-channels");
b8a533f3c24b3b Nuno Sá         2020-09-25  309  		if (diff_channels) {
b8a533f3c24b3b Nuno Sá         2020-09-25  310  			of_node_put(child);
506d2e317a0a02 Marcelo Schmitt 2019-11-08  311  			break;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  312  		}
b8a533f3c24b3b Nuno Sá         2020-09-25  313  	}
506d2e317a0a02 Marcelo Schmitt 2019-11-08  314  
506d2e317a0a02 Marcelo Schmitt 2019-11-08  315  	if (diff_channels) {
506d2e317a0a02 Marcelo Schmitt 2019-11-08  316  		indio_dev->num_channels = ARRAY_SIZE(ad7292_channels_diff);
506d2e317a0a02 Marcelo Schmitt 2019-11-08  317  		indio_dev->channels = ad7292_channels_diff;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  318  	} else {
506d2e317a0a02 Marcelo Schmitt 2019-11-08  319  		indio_dev->num_channels = ARRAY_SIZE(ad7292_channels);
506d2e317a0a02 Marcelo Schmitt 2019-11-08  320  		indio_dev->channels = ad7292_channels;
506d2e317a0a02 Marcelo Schmitt 2019-11-08  321  	}
506d2e317a0a02 Marcelo Schmitt 2019-11-08  322  
506d2e317a0a02 Marcelo Schmitt 2019-11-08  323  	return devm_iio_device_register(&spi->dev, indio_dev);
506d2e317a0a02 Marcelo Schmitt 2019-11-08  324  }
506d2e317a0a02 Marcelo Schmitt 2019-11-08  325  

:::::: The code at line 307 was first introduced by commit
:::::: 506d2e317a0a02631a74bbc4c508334c29e26eae iio: adc: Add driver support for AD7292

:::::: TO: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
