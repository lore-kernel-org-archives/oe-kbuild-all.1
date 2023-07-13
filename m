Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656AA79CB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 10:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689245514; x=1720781514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hsyB0/NELilMiq0sYpRvBfKsJSQ3+oE12BRT1wbgXEo=;
  b=ccReycd2ogjaay/ZvzrGUrWVqomrqbA7KaDG4rZDfV1McFx5itIF2Cke
   FPd83KSewJJq55X2i6tO0yI+i6uaCzpBUUUoprst9bnn+poh6j6z+Musm
   9K3Kl6CnkdRln3+1BXcV/vLAqY3XHFTIc2QKhl2PEVMonFG/G19RwW+sm
   oaB0yQaiCMzcopNZ1nfhIIwuLQgr1rm5j3OD0W7lx1tIDxd07UPYHKoGv
   kgUJXFNmIySDwArbqIv5eKDnBDNsTyCSV6FExm4FsioxFEzZIFkf4pKV1
   GB+uisHtZH0njIq8X35VqDxPFOUBtHYIqlZV6xjlvQw/stWOTf1vcW9ZH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="355068127"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="355068127"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 03:51:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="725261215"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="725261215"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jul 2023 03:51:51 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJtvK-0006YP-2o;
	Thu, 13 Jul 2023 10:51:50 +0000
Date: Thu, 13 Jul 2023 18:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Meng J <meng.j.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>,
	zouxiaoh <xiaohong.zou@intel.com>
Subject: [intel-lts:5.15/linux 26/38]
 drivers/media/platform/intel/ipu6-acpi-pdata.c:55:6: warning: no previous
 prototype for 'print_serdes_sdinfo'
Message-ID: <202307131830.FaMK39Z2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   4d44667fd3eca9633f0844bb09886fdc54f18539
commit: 4de71cacfa75fc249aa6f79004ee09b3ae17ce41 [26/38] media: intel: correct dependency for PDATA and ACPI
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230713/202307131830.FaMK39Z2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131830.FaMK39Z2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131830.FaMK39Z2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/intel/ipu6-acpi-pdata.c:55:6: warning: no previous prototype for 'print_serdes_sdinfo' [-Wmissing-prototypes]
      55 | void print_serdes_sdinfo(struct serdes_subdev_info *sdinfo)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:83:6: warning: no previous prototype for 'print_serdes_subdev' [-Wmissing-prototypes]
      83 | void print_serdes_subdev(struct ipu_isys_subdev_info *sd)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:123:6: warning: no previous prototype for 'print_subdev' [-Wmissing-prototypes]
     123 | void print_subdev(struct ipu_isys_subdev_info *sd)
         |      ^~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:157:6: warning: no previous prototype for 'add_local_subdevs' [-Wmissing-prototypes]
     157 | void add_local_subdevs(struct ipu_isys_subdev_info *new_subdev_info)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:172:6: warning: no previous prototype for 'update_short' [-Wmissing-prototypes]
     172 | void update_short(struct device *dev,
         |      ^~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:183:6: warning: no previous prototype for 'update_hex' [-Wmissing-prototypes]
     183 | void update_hex(struct device *dev,
         |      ^~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: warning: no previous prototype for 'update_int' [-Wmissing-prototypes]
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:205:6: warning: no previous prototype for 'update_inta' [-Wmissing-prototypes]
     205 | void update_inta(struct device *dev,
         |      ^~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:221:6: warning: no previous prototype for 'update_str' [-Wmissing-prototypes]
     221 | void update_str(struct device *dev,
         |      ^~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:232:6: warning: no previous prototype for 'update_subdev' [-Wmissing-prototypes]
     232 | void update_subdev(struct device *dev,
         |      ^~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:264:6: warning: no previous prototype for 'update_serdes_subdev' [-Wmissing-prototypes]
     264 | void update_serdes_subdev(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:325:5: warning: no previous prototype for 'compare_subdev' [-Wmissing-prototypes]
     325 | int compare_subdev(struct device *dev,
         |     ^~~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:377:6: warning: no previous prototype for 'update_pdata' [-Wmissing-prototypes]
     377 | void update_pdata(struct device *dev,
         |      ^~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:448:6: warning: no previous prototype for 'set_ti960_gpio' [-Wmissing-prototypes]
     448 | void set_ti960_gpio(struct control_logic_data *ctl_data, struct serdes_platform_data **pdata)
         |      ^~~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:468:6: warning: no previous prototype for 'set_lt_gpio' [-Wmissing-prototypes]
     468 | void set_lt_gpio(struct control_logic_data *ctl_data, struct sensor_platform_data **pdata,
         |      ^~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:499:6: warning: no previous prototype for 'set_ar0234_gpio' [-Wmissing-prototypes]
     499 | void set_ar0234_gpio(struct sensor_platform_data **pdata)
         |      ^~~~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:507:5: warning: no previous prototype for 'set_csi2' [-Wmissing-prototypes]
     507 | int set_csi2(struct ipu_isys_subdev_info **sensor_sd,
         |     ^~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:524:6: warning: no previous prototype for 'set_i2c' [-Wmissing-prototypes]
     524 | void set_i2c(struct ipu_isys_subdev_info **sensor_sd,
         |      ^~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:535:6: warning: no previous prototype for 'set_serdes_sd_pdata' [-Wmissing-prototypes]
     535 | void set_serdes_sd_pdata(struct serdes_module_pdata **module_pdata, char sensor_name[I2C_NAME_SIZE],
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:555:5: warning: no previous prototype for 'set_serdes_subdev' [-Wmissing-prototypes]
     555 | int set_serdes_subdev(struct ipu_isys_subdev_info **serdes_sd,
         |     ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:591:5: warning: no previous prototype for 'set_pdata' [-Wmissing-prototypes]
     591 | int set_pdata(struct ipu_isys_subdev_info **sensor_sd,
         |     ^~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:652:6: warning: no previous prototype for 'set_serdes_info' [-Wmissing-prototypes]
     652 | void set_serdes_info(struct device *dev, const char *serdes_name, struct sensor_bios_data *cam_data)
         |      ^~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:672:5: warning: no previous prototype for 'populate_dummy' [-Wmissing-prototypes]
     672 | int populate_dummy(struct device *dev,
         |     ^~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:706:5: warning: no previous prototype for 'populate_sensor_pdata' [-Wmissing-prototypes]
     706 | int populate_sensor_pdata(struct device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~
--
>> drivers/media/platform/intel/ipu6-acpi-common.c:77:5: warning: no previous prototype for 'ipu_acpi_get_gpio_data' [-Wmissing-prototypes]
      77 | int ipu_acpi_get_gpio_data(struct device *dev, struct ipu_gpio_info *gpio, int size,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-common.c:160:5: warning: no previous prototype for 'ipu_acpi_get_i2c_info' [-Wmissing-prototypes]
     160 | int ipu_acpi_get_i2c_info(struct device *dev, struct ipu_i2c_info *i2c, int size, u64 *num)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/print_serdes_sdinfo +55 drivers/media/platform/intel/ipu6-acpi-pdata.c

cfb5743695d51c zouxiaoh 2022-11-28   54  
cfb5743695d51c zouxiaoh 2022-11-28  @55  void print_serdes_sdinfo(struct serdes_subdev_info *sdinfo)
cfb5743695d51c zouxiaoh 2022-11-28   56  {
cfb5743695d51c zouxiaoh 2022-11-28   57  	int j;
cfb5743695d51c zouxiaoh 2022-11-28   58  	struct serdes_module_pdata *sd_mpdata = sdinfo->board_info.platform_data;
cfb5743695d51c zouxiaoh 2022-11-28   59  
cfb5743695d51c zouxiaoh 2022-11-28   60  	if (!sd_mpdata) {
cfb5743695d51c zouxiaoh 2022-11-28   61  		pr_err("Empty serdes module pdata");
cfb5743695d51c zouxiaoh 2022-11-28   62  		return;
cfb5743695d51c zouxiaoh 2022-11-28   63  	}
cfb5743695d51c zouxiaoh 2022-11-28   64  
cfb5743695d51c zouxiaoh 2022-11-28   65  	pr_debug("\t\trx_port \t\t= %d", sdinfo->rx_port);
cfb5743695d51c zouxiaoh 2022-11-28   66  	pr_debug("\t\tphy_i2c_addr \t\t= 0x%x", sdinfo->phy_i2c_addr);
cfb5743695d51c zouxiaoh 2022-11-28   67  	pr_debug("\t\tser_alias \t\t= 0x%x", sdinfo->ser_alias);
cfb5743695d51c zouxiaoh 2022-11-28   68  	pr_debug("\t\tsuffix \t\t\t= %c", sdinfo->suffix);
cfb5743695d51c zouxiaoh 2022-11-28   69  	pr_debug("\t\tboard_info.type \t= %s", sdinfo->board_info.type);
cfb5743695d51c zouxiaoh 2022-11-28   70  	pr_debug("\t\tboard_info.addr \t= 0x%x", sdinfo->board_info.addr);
cfb5743695d51c zouxiaoh 2022-11-28   71  
cfb5743695d51c zouxiaoh 2022-11-28   72  	pr_debug("serdes board_info.platform_data");
cfb5743695d51c zouxiaoh 2022-11-28   73  	pr_debug("\t\tlanes \t\t\t= %d", sd_mpdata->lanes);
cfb5743695d51c zouxiaoh 2022-11-28   74  	pr_debug("\t\tmodule_name \t\t= %s", sd_mpdata->module_name);
cfb5743695d51c zouxiaoh 2022-11-28   75  	pr_debug("\t\tfsin \t\t\t= %d", sd_mpdata->fsin);
cfb5743695d51c zouxiaoh 2022-11-28   76  
cfb5743695d51c zouxiaoh 2022-11-28   77  	if (serdes_info.gpio_powerup_seq > 0)
cfb5743695d51c zouxiaoh 2022-11-28   78  		for (j = 0; j < serdes_info.gpio_powerup_seq; j++)
cfb5743695d51c zouxiaoh 2022-11-28   79  			pr_debug("\t\t gpio_powerup_seq[%d] \t= %d", j,
cfb5743695d51c zouxiaoh 2022-11-28   80  				(int)sd_mpdata->gpio_powerup_seq[j]);
cfb5743695d51c zouxiaoh 2022-11-28   81  }
cfb5743695d51c zouxiaoh 2022-11-28   82  
cfb5743695d51c zouxiaoh 2022-11-28  @83  void print_serdes_subdev(struct ipu_isys_subdev_info *sd)
cfb5743695d51c zouxiaoh 2022-11-28   84  {
cfb5743695d51c zouxiaoh 2022-11-28   85  	struct serdes_platform_data *sd_pdata = sd->i2c.board_info.platform_data;
cfb5743695d51c zouxiaoh 2022-11-28   86  	int i;
cfb5743695d51c zouxiaoh 2022-11-28   87  	struct serdes_subdev_info *sd_sdinfo;
cfb5743695d51c zouxiaoh 2022-11-28   88  	struct serdes_module_pdata *sd_mpdata;
cfb5743695d51c zouxiaoh 2022-11-28   89  
cfb5743695d51c zouxiaoh 2022-11-28   90  	if (!sd_pdata) {
cfb5743695d51c zouxiaoh 2022-11-28   91  		pr_err("Empty serdes subdev pdata");
cfb5743695d51c zouxiaoh 2022-11-28   92  		return;
cfb5743695d51c zouxiaoh 2022-11-28   93  	}
cfb5743695d51c zouxiaoh 2022-11-28   94  
cfb5743695d51c zouxiaoh 2022-11-28   95  	pr_debug("IPU6 ACPI %s", __func__);
cfb5743695d51c zouxiaoh 2022-11-28   96  	pr_debug("sd_csi2");
cfb5743695d51c zouxiaoh 2022-11-28   97  	pr_debug("\t\tnlanes \t\t\t= %d", sd->csi2->nlanes);
cfb5743695d51c zouxiaoh 2022-11-28   98  	pr_debug("\t\tport \t\t\t= %d", sd->csi2->port);
cfb5743695d51c zouxiaoh 2022-11-28   99  
cfb5743695d51c zouxiaoh 2022-11-28  100  	pr_debug("sd->i2c");
cfb5743695d51c zouxiaoh 2022-11-28  101  	pr_debug("\t\ti2c_adapter_bdf \t= %s", sd->i2c.i2c_adapter_bdf);
cfb5743695d51c zouxiaoh 2022-11-28  102  	pr_debug("\t\tboard_info.type \t= %s", sd->i2c.board_info.type);
cfb5743695d51c zouxiaoh 2022-11-28  103  	pr_debug("\t\tboard_info.addr \t= 0x%x", sd->i2c.board_info.addr);
cfb5743695d51c zouxiaoh 2022-11-28  104  
cfb5743695d51c zouxiaoh 2022-11-28  105  	pr_debug("sd->i2c.board_info.platform_data");
cfb5743695d51c zouxiaoh 2022-11-28  106  	pr_debug("\t\treset_gpio \t\t= %d", sd_pdata->reset_gpio);
cfb5743695d51c zouxiaoh 2022-11-28  107  	pr_debug("\t\tFPD_gpio \t\t= %d", sd_pdata->FPD_gpio);
cfb5743695d51c zouxiaoh 2022-11-28  108  	pr_debug("\t\tsuffix \t\t\t= %c", sd_pdata->suffix);
cfb5743695d51c zouxiaoh 2022-11-28  109  
cfb5743695d51c zouxiaoh 2022-11-28  110  	for (i = 0; i < serdes_info.rx_port; i++) {
cfb5743695d51c zouxiaoh 2022-11-28  111  		sd_sdinfo = &sd_pdata->subdev_info[i];
cfb5743695d51c zouxiaoh 2022-11-28  112  		sd_mpdata = sd_sdinfo->board_info.platform_data;
cfb5743695d51c zouxiaoh 2022-11-28  113  
cfb5743695d51c zouxiaoh 2022-11-28  114  		if (!sd_mpdata)
cfb5743695d51c zouxiaoh 2022-11-28  115  			continue;
cfb5743695d51c zouxiaoh 2022-11-28  116  
cfb5743695d51c zouxiaoh 2022-11-28  117  		pr_debug("serdes subdev_info[%d]", i);
cfb5743695d51c zouxiaoh 2022-11-28  118  		print_serdes_sdinfo(sd_sdinfo);
cfb5743695d51c zouxiaoh 2022-11-28  119  	}
cfb5743695d51c zouxiaoh 2022-11-28  120  
cfb5743695d51c zouxiaoh 2022-11-28  121  }
cfb5743695d51c zouxiaoh 2022-11-28  122  
cfb5743695d51c zouxiaoh 2022-11-28 @123  void print_subdev(struct ipu_isys_subdev_info *sd)
cfb5743695d51c zouxiaoh 2022-11-28  124  {
cfb5743695d51c zouxiaoh 2022-11-28  125  	struct sensor_platform_data *spdata = sd->i2c.board_info.platform_data;
cfb5743695d51c zouxiaoh 2022-11-28  126  	int i;
cfb5743695d51c zouxiaoh 2022-11-28  127  
cfb5743695d51c zouxiaoh 2022-11-28  128  	if (!spdata) {
cfb5743695d51c zouxiaoh 2022-11-28  129  		pr_err("Empty sensor subdev");
cfb5743695d51c zouxiaoh 2022-11-28  130  		return;
cfb5743695d51c zouxiaoh 2022-11-28  131  	}
cfb5743695d51c zouxiaoh 2022-11-28  132  
cfb5743695d51c zouxiaoh 2022-11-28  133  	pr_debug("IPU6 ACPI %s", __func__);
cfb5743695d51c zouxiaoh 2022-11-28  134  	pr_debug("sd->csi2");
cfb5743695d51c zouxiaoh 2022-11-28  135  	pr_debug("\t\tnlanes \t\t\t= %d", sd->csi2->nlanes);
cfb5743695d51c zouxiaoh 2022-11-28  136  	pr_debug("\t\tport \t\t\t= %d", sd->csi2->port);
cfb5743695d51c zouxiaoh 2022-11-28  137  
cfb5743695d51c zouxiaoh 2022-11-28  138  	pr_debug("sd->i2c");
cfb5743695d51c zouxiaoh 2022-11-28  139  	pr_debug("\t\ti2c_adapter_bdf \t= %s", sd->i2c.i2c_adapter_bdf);
cfb5743695d51c zouxiaoh 2022-11-28  140  	pr_debug("\t\tboard_info.type \t= %s", sd->i2c.board_info.type);
cfb5743695d51c zouxiaoh 2022-11-28  141  	pr_debug("\t\tboard_info.addr \t= 0x%x", sd->i2c.board_info.addr);
cfb5743695d51c zouxiaoh 2022-11-28  142  
cfb5743695d51c zouxiaoh 2022-11-28  143  	pr_debug("sd->i2c.platform_data");
cfb5743695d51c zouxiaoh 2022-11-28  144  	pr_debug("\t\tport \t\t\t= %d", spdata->port);
cfb5743695d51c zouxiaoh 2022-11-28  145  	pr_debug("\t\tlanes \t\t\t= %d", spdata->lanes);
cfb5743695d51c zouxiaoh 2022-11-28  146  	pr_debug("\t\ti2c_slave_address \t= 0x%x", spdata->i2c_slave_address);
cfb5743695d51c zouxiaoh 2022-11-28  147  	pr_debug("\t\tirq_pin \t\t= %d", spdata->irq_pin);
cfb5743695d51c zouxiaoh 2022-11-28  148  	pr_debug("\t\tirq_pin_name \t\t= %s", spdata->irq_pin_name);
cfb5743695d51c zouxiaoh 2022-11-28  149  	pr_debug("\t\tsuffix \t\t\t= %c", spdata->suffix);
cfb5743695d51c zouxiaoh 2022-11-28  150  	pr_debug("\t\treset_pin \t\t= %d", spdata->reset_pin);
cfb5743695d51c zouxiaoh 2022-11-28  151  	pr_debug("\t\tdetect_pin \t\t= %d", spdata->detect_pin);
cfb5743695d51c zouxiaoh 2022-11-28  152  
9a2116b2763776 zouxiaoh 2022-11-09  153  	for (i = 0; i < IPU_SPDATA_GPIO_NUM; i++)
cfb5743695d51c zouxiaoh 2022-11-28  154  		pr_debug("\t\tgpios[%d] \t\t= %d", i, spdata->gpios[i]);
cfb5743695d51c zouxiaoh 2022-11-28  155  }
cfb5743695d51c zouxiaoh 2022-11-28  156  
cfb5743695d51c zouxiaoh 2022-11-28 @157  void add_local_subdevs(struct ipu_isys_subdev_info *new_subdev_info)
cfb5743695d51c zouxiaoh 2022-11-28  158  {
cfb5743695d51c zouxiaoh 2022-11-28  159  	struct ipu_isys_subdev_pdata *ptr_acpi_subdev_pdata = &acpi_subdev_pdata;
cfb5743695d51c zouxiaoh 2022-11-28  160  	int i = 0;
cfb5743695d51c zouxiaoh 2022-11-28  161  
cfb5743695d51c zouxiaoh 2022-11-28  162  	while (i <= MAX_ACPI_SENSOR_NUM) {
cfb5743695d51c zouxiaoh 2022-11-28  163  		if (!ptr_acpi_subdev_pdata->subdevs[i]) {
cfb5743695d51c zouxiaoh 2022-11-28  164  			ptr_acpi_subdev_pdata->subdevs[i] = new_subdev_info;
cfb5743695d51c zouxiaoh 2022-11-28  165  			ptr_acpi_subdev_pdata->subdevs[i+1] = NULL;
cfb5743695d51c zouxiaoh 2022-11-28  166  			break;
cfb5743695d51c zouxiaoh 2022-11-28  167  		}
cfb5743695d51c zouxiaoh 2022-11-28  168  		i++;
cfb5743695d51c zouxiaoh 2022-11-28  169  	}
cfb5743695d51c zouxiaoh 2022-11-28  170  }
cfb5743695d51c zouxiaoh 2022-11-28  171  
cfb5743695d51c zouxiaoh 2022-11-28 @172  void update_short(struct device *dev,
cfb5743695d51c zouxiaoh 2022-11-28  173  		char msg[MSG_LEN],
cfb5743695d51c zouxiaoh 2022-11-28  174  		unsigned short *old_short,
cfb5743695d51c zouxiaoh 2022-11-28  175  		unsigned int new_short)
cfb5743695d51c zouxiaoh 2022-11-28  176  {
cfb5743695d51c zouxiaoh 2022-11-28  177  	if (*old_short != new_short) {
cfb5743695d51c zouxiaoh 2022-11-28  178  		dev_info(dev, "%s 0x%x -> 0x%x", msg, *old_short, new_short);
cfb5743695d51c zouxiaoh 2022-11-28  179  		*old_short = new_short;
cfb5743695d51c zouxiaoh 2022-11-28  180  	}
cfb5743695d51c zouxiaoh 2022-11-28  181  }
cfb5743695d51c zouxiaoh 2022-11-28  182  
cfb5743695d51c zouxiaoh 2022-11-28 @183  void update_hex(struct device *dev,
cfb5743695d51c zouxiaoh 2022-11-28  184  		char msg[MSG_LEN],
cfb5743695d51c zouxiaoh 2022-11-28  185  		unsigned int *old_hex,
cfb5743695d51c zouxiaoh 2022-11-28  186  		unsigned int new_hex)
cfb5743695d51c zouxiaoh 2022-11-28  187  {
cfb5743695d51c zouxiaoh 2022-11-28  188  	if (*old_hex != new_hex) {
cfb5743695d51c zouxiaoh 2022-11-28  189  		dev_info(dev, "%s 0x%x -> 0x%x", msg, *old_hex, new_hex);
cfb5743695d51c zouxiaoh 2022-11-28  190  		*old_hex = new_hex;
cfb5743695d51c zouxiaoh 2022-11-28  191  	}
cfb5743695d51c zouxiaoh 2022-11-28  192  }
cfb5743695d51c zouxiaoh 2022-11-28  193  
cfb5743695d51c zouxiaoh 2022-11-28 @194  void update_int(struct device *dev,
cfb5743695d51c zouxiaoh 2022-11-28  195  		char msg[MSG_LEN],
cfb5743695d51c zouxiaoh 2022-11-28  196  		unsigned int *old_int,
cfb5743695d51c zouxiaoh 2022-11-28  197  		unsigned int new_int)
cfb5743695d51c zouxiaoh 2022-11-28  198  {
cfb5743695d51c zouxiaoh 2022-11-28  199  	if (*old_int != new_int) {
cfb5743695d51c zouxiaoh 2022-11-28  200  		dev_info(dev, "%s %d -> %d", msg, *old_int, new_int);
cfb5743695d51c zouxiaoh 2022-11-28  201  		*old_int = new_int;
cfb5743695d51c zouxiaoh 2022-11-28  202  	}
cfb5743695d51c zouxiaoh 2022-11-28  203  }
cfb5743695d51c zouxiaoh 2022-11-28  204  
cfb5743695d51c zouxiaoh 2022-11-28 @205  void update_inta(struct device *dev,
cfb5743695d51c zouxiaoh 2022-11-28  206  		char msg[MSG_LEN],
cfb5743695d51c zouxiaoh 2022-11-28  207  		int old_int[MSG_LEN],
cfb5743695d51c zouxiaoh 2022-11-28  208  		int new_int[MSG_LEN],
cfb5743695d51c zouxiaoh 2022-11-28  209  		size_t size)
cfb5743695d51c zouxiaoh 2022-11-28  210  {
cfb5743695d51c zouxiaoh 2022-11-28  211  	int i;
cfb5743695d51c zouxiaoh 2022-11-28  212  
cfb5743695d51c zouxiaoh 2022-11-28  213  	for (i = 0; i < size; i++) {
cfb5743695d51c zouxiaoh 2022-11-28  214  		if (old_int[i] != new_int[i]) {
cfb5743695d51c zouxiaoh 2022-11-28  215  			dev_info(dev, "%s %d -> %d", msg, old_int[i], new_int[i]);
cfb5743695d51c zouxiaoh 2022-11-28  216  			old_int[i] = new_int[i];
cfb5743695d51c zouxiaoh 2022-11-28  217  		}
cfb5743695d51c zouxiaoh 2022-11-28  218  	}
cfb5743695d51c zouxiaoh 2022-11-28  219  }
cfb5743695d51c zouxiaoh 2022-11-28  220  
cfb5743695d51c zouxiaoh 2022-11-28 @221  void update_str(struct device *dev,
cfb5743695d51c zouxiaoh 2022-11-28  222  		char msg[MSG_LEN],
cfb5743695d51c zouxiaoh 2022-11-28  223  		char old_str[MSG_LEN],
cfb5743695d51c zouxiaoh 2022-11-28  224  		char new_str[MSG_LEN])
cfb5743695d51c zouxiaoh 2022-11-28  225  {
cfb5743695d51c zouxiaoh 2022-11-28  226  	if (strcmp(old_str, new_str) != 0) {
cfb5743695d51c zouxiaoh 2022-11-28  227  		dev_info(dev, "%s %s -> %s", msg, old_str, new_str);
cfb5743695d51c zouxiaoh 2022-11-28  228  		strlcpy(old_str, new_str, strlen(new_str)+1);
cfb5743695d51c zouxiaoh 2022-11-28  229  	}
cfb5743695d51c zouxiaoh 2022-11-28  230  }
cfb5743695d51c zouxiaoh 2022-11-28  231  
cfb5743695d51c zouxiaoh 2022-11-28 @232  void update_subdev(struct device *dev,
cfb5743695d51c zouxiaoh 2022-11-28  233  			struct ipu_isys_subdev_info *new_sd,
cfb5743695d51c zouxiaoh 2022-11-28  234  			struct ipu_isys_subdev_info **old_sd)
cfb5743695d51c zouxiaoh 2022-11-28  235  {
cfb5743695d51c zouxiaoh 2022-11-28  236  	struct sensor_platform_data *old_pdata =
cfb5743695d51c zouxiaoh 2022-11-28  237  					(*old_sd)->i2c.board_info.platform_data;
cfb5743695d51c zouxiaoh 2022-11-28  238  
cfb5743695d51c zouxiaoh 2022-11-28  239  	struct sensor_platform_data *new_pdata =
cfb5743695d51c zouxiaoh 2022-11-28  240  					new_sd->i2c.board_info.platform_data;
cfb5743695d51c zouxiaoh 2022-11-28  241  
cfb5743695d51c zouxiaoh 2022-11-28  242  	/* csi2 */
cfb5743695d51c zouxiaoh 2022-11-28  243  	update_int(dev, "CSI2 port", &(*old_sd)->csi2->port, new_sd->csi2->port);
cfb5743695d51c zouxiaoh 2022-11-28  244  	update_int(dev, "CSI2 nlanes", &(*old_sd)->csi2->nlanes, new_sd->csi2->nlanes);
cfb5743695d51c zouxiaoh 2022-11-28  245  
cfb5743695d51c zouxiaoh 2022-11-28  246  	/* i2c */
cfb5743695d51c zouxiaoh 2022-11-28  247  	update_short(dev, "I2C board_info addr", &(*old_sd)->i2c.board_info.addr,
cfb5743695d51c zouxiaoh 2022-11-28  248  		new_sd->i2c.board_info.addr);
cfb5743695d51c zouxiaoh 2022-11-28  249  	update_str(dev, "I2C i2c_adapter_bdf", (*old_sd)->i2c.i2c_adapter_bdf,
cfb5743695d51c zouxiaoh 2022-11-28  250  		new_sd->i2c.i2c_adapter_bdf);
cfb5743695d51c zouxiaoh 2022-11-28  251  
cfb5743695d51c zouxiaoh 2022-11-28  252  	/* platform data */
cfb5743695d51c zouxiaoh 2022-11-28  253  	update_int(dev, "pdata port", &(old_pdata)->port, new_pdata->port);
cfb5743695d51c zouxiaoh 2022-11-28  254  	update_int(dev, "pdata lanes", &(old_pdata)->lanes, new_pdata->lanes);
cfb5743695d51c zouxiaoh 2022-11-28  255  	update_hex(dev, "pdata I2C slave addr", &(old_pdata)->i2c_slave_address,
cfb5743695d51c zouxiaoh 2022-11-28  256  		new_pdata->i2c_slave_address);
cfb5743695d51c zouxiaoh 2022-11-28  257  	update_int(dev, "pdata irq_pin", &(old_pdata)->irq_pin, new_pdata->irq_pin);
cfb5743695d51c zouxiaoh 2022-11-28  258  	update_str(dev, "pdata irq_pin_name", old_pdata->irq_pin_name, new_pdata->irq_pin_name);
cfb5743695d51c zouxiaoh 2022-11-28  259  	update_int(dev, "pdata reset_pin", &(old_pdata)->reset_pin, new_pdata->reset_pin);
cfb5743695d51c zouxiaoh 2022-11-28  260  	update_int(dev, "pdata detect_pin", &(old_pdata)->detect_pin, new_pdata->detect_pin);
9a2116b2763776 zouxiaoh 2022-11-09  261  	update_inta(dev, "pdata gpios", old_pdata->gpios, new_pdata->gpios, IPU_SPDATA_GPIO_NUM);
cfb5743695d51c zouxiaoh 2022-11-28  262  }
cfb5743695d51c zouxiaoh 2022-11-28  263  

:::::: The code at line 55 was first introduced by commit
:::::: cfb5743695d51c3d275a3646d140336c6e515358 media: intel-ipu6: implement new vc solution

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: renjiaox <jiaojiaox.ren@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
