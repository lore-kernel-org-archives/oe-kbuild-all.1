Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF84D3FE49
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 18:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dqj9u2I6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697652318; x=1729188318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g957fJZy5PZDRbGJRyGRMc2LoBeCaHRqswDm4bjXZXg=;
  b=Dqj9u2I6XZO9Z3XXEZ/WX3UP/tfm90BcPwCX2Yn1dT/CO7DyYuACjbUT
   JyyAEO8RP5jxQ/x4zA4u9Hm0Yys/QUKu0Y5LnaG7zQQ6MHTdNJyXoOpKf
   xa1AdLcywqrcyE0RxqeFXPaouEKu65K53fDG6SgcfYqpC7QJnBY3uJJPw
   TICuCW2AIv5uUyWYqwAW/8bu86inT0Mtt8GP64Y6V/Bt/56YZbbyXF7N6
   5Nwv1VvhZRX69hCz3kxpK+gKX36bYcBZ5LmgqOh1SKzOcu3pnAWEdBjl1
   vxHzUFWNM+32t4yeC+Y+IA9M9mT8OufZ/28V6RJd6/aewdobFe2yxLoBk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452547164"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="452547164"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 11:05:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="4642972"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Oct 2023 11:05:17 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtAut-0000o1-1e;
	Wed, 18 Oct 2023 18:05:11 +0000
Date: Thu, 19 Oct 2023 02:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Meng J <meng.j.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>,
	zouxiaoh <xiaohong.zou@intel.com>
Subject: [intel-lts:5.15/linux 26/38]
 drivers/media/platform/intel/ipu6-acpi-pdata.c:243:9: warning: 'update_int'
 accessing 128 bytes in a region of size 10
Message-ID: <202310190114.BwnqLuhs-lkp@intel.com>
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
head:   c1f04fe08dbdb93b88865ffa356aa27c49b58d07
commit: 4de71cacfa75fc249aa6f79004ee09b3ae17ce41 [26/38] media: intel: correct dependency for PDATA and ACPI
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310190114.BwnqLuhs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190114.BwnqLuhs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190114.BwnqLuhs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/intel/ipu6-acpi-pdata.c:55:6: warning: no previous prototype for 'print_serdes_sdinfo' [-Wmissing-prototypes]
      55 | void print_serdes_sdinfo(struct serdes_subdev_info *sdinfo)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:83:6: warning: no previous prototype for 'print_serdes_subdev' [-Wmissing-prototypes]
      83 | void print_serdes_subdev(struct ipu_isys_subdev_info *sd)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:123:6: warning: no previous prototype for 'print_subdev' [-Wmissing-prototypes]
     123 | void print_subdev(struct ipu_isys_subdev_info *sd)
         |      ^~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:157:6: warning: no previous prototype for 'add_local_subdevs' [-Wmissing-prototypes]
     157 | void add_local_subdevs(struct ipu_isys_subdev_info *new_subdev_info)
         |      ^~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:172:6: warning: no previous prototype for 'update_short' [-Wmissing-prototypes]
     172 | void update_short(struct device *dev,
         |      ^~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:183:6: warning: no previous prototype for 'update_hex' [-Wmissing-prototypes]
     183 | void update_hex(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: warning: no previous prototype for 'update_int' [-Wmissing-prototypes]
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:205:6: warning: no previous prototype for 'update_inta' [-Wmissing-prototypes]
     205 | void update_inta(struct device *dev,
         |      ^~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:221:6: warning: no previous prototype for 'update_str' [-Wmissing-prototypes]
     221 | void update_str(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:232:6: warning: no previous prototype for 'update_subdev' [-Wmissing-prototypes]
     232 | void update_subdev(struct device *dev,
         |      ^~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:264:6: warning: no previous prototype for 'update_serdes_subdev' [-Wmissing-prototypes]
     264 | void update_serdes_subdev(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:325:5: warning: no previous prototype for 'compare_subdev' [-Wmissing-prototypes]
     325 | int compare_subdev(struct device *dev,
         |     ^~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:377:6: warning: no previous prototype for 'update_pdata' [-Wmissing-prototypes]
     377 | void update_pdata(struct device *dev,
         |      ^~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:448:6: warning: no previous prototype for 'set_ti960_gpio' [-Wmissing-prototypes]
     448 | void set_ti960_gpio(struct control_logic_data *ctl_data, struct serdes_platform_data **pdata)
         |      ^~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:468:6: warning: no previous prototype for 'set_lt_gpio' [-Wmissing-prototypes]
     468 | void set_lt_gpio(struct control_logic_data *ctl_data, struct sensor_platform_data **pdata,
         |      ^~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:499:6: warning: no previous prototype for 'set_ar0234_gpio' [-Wmissing-prototypes]
     499 | void set_ar0234_gpio(struct sensor_platform_data **pdata)
         |      ^~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:507:5: warning: no previous prototype for 'set_csi2' [-Wmissing-prototypes]
     507 | int set_csi2(struct ipu_isys_subdev_info **sensor_sd,
         |     ^~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:524:6: warning: no previous prototype for 'set_i2c' [-Wmissing-prototypes]
     524 | void set_i2c(struct ipu_isys_subdev_info **sensor_sd,
         |      ^~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:535:6: warning: no previous prototype for 'set_serdes_sd_pdata' [-Wmissing-prototypes]
     535 | void set_serdes_sd_pdata(struct serdes_module_pdata **module_pdata, char sensor_name[I2C_NAME_SIZE],
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:555:5: warning: no previous prototype for 'set_serdes_subdev' [-Wmissing-prototypes]
     555 | int set_serdes_subdev(struct ipu_isys_subdev_info **serdes_sd,
         |     ^~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:591:5: warning: no previous prototype for 'set_pdata' [-Wmissing-prototypes]
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
   drivers/media/platform/intel/ipu6-acpi-pdata.c: In function 'update_subdev':
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:243:9: warning: 'update_int' accessing 128 bytes in a region of size 10 [-Wstringop-overflow=]
     243 |         update_int(dev, "CSI2 port", &(*old_sd)->csi2->port, new_sd->csi2->port);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:243:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: note: in a call to function 'update_int'
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:244:9: warning: 'update_int' accessing 128 bytes in a region of size 12 [-Wstringop-overflow=]
     244 |         update_int(dev, "CSI2 nlanes", &(*old_sd)->csi2->nlanes, new_sd->csi2->nlanes);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:244:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: note: in a call to function 'update_int'
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:247:9: warning: 'update_short' accessing 128 bytes in a region of size 20 [-Wstringop-overflow=]
     247 |         update_short(dev, "I2C board_info addr", &(*old_sd)->i2c.board_info.addr,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     248 |                 new_sd->i2c.board_info.addr);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:247:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:172:6: note: in a call to function 'update_short'
     172 | void update_short(struct device *dev,
         |      ^~~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: warning: 'update_str' accessing 128 bytes in a region of size 20 [-Wstringop-overflow=]
     249 |         update_str(dev, "I2C i2c_adapter_bdf", (*old_sd)->i2c.i2c_adapter_bdf,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     250 |                 new_sd->i2c.i2c_adapter_bdf);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: warning: 'update_str' accessing 128 bytes in a region of size 32 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: note: referencing argument 3 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: warning: 'update_str' accessing 128 bytes in a region of size 32 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: note: referencing argument 4 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:221:6: note: in a call to function 'update_str'
     221 | void update_str(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:253:9: warning: 'update_int' accessing 128 bytes in a region of size 11 [-Wstringop-overflow=]
     253 |         update_int(dev, "pdata port", &(old_pdata)->port, new_pdata->port);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:253:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: note: in a call to function 'update_int'
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:254:9: warning: 'update_int' accessing 128 bytes in a region of size 12 [-Wstringop-overflow=]
     254 |         update_int(dev, "pdata lanes", &(old_pdata)->lanes, new_pdata->lanes);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:254:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: note: in a call to function 'update_int'
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:255:9: warning: 'update_hex' accessing 128 bytes in a region of size 21 [-Wstringop-overflow=]
     255 |         update_hex(dev, "pdata I2C slave addr", &(old_pdata)->i2c_slave_address,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     256 |                 new_pdata->i2c_slave_address);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:255:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:183:6: note: in a call to function 'update_hex'
     183 | void update_hex(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:257:9: warning: 'update_int' accessing 128 bytes in a region of size 14 [-Wstringop-overflow=]
     257 |         update_int(dev, "pdata irq_pin", &(old_pdata)->irq_pin, new_pdata->irq_pin);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:257:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: note: in a call to function 'update_int'
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: warning: 'update_str' accessing 128 bytes in a region of size 19 [-Wstringop-overflow=]
     258 |         update_str(dev, "pdata irq_pin_name", old_pdata->irq_pin_name, new_pdata->irq_pin_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: warning: 'update_str' accessing 128 bytes in a region of size 16 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: note: referencing argument 3 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: warning: 'update_str' accessing 128 bytes in a region of size 16 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: note: referencing argument 4 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:221:6: note: in a call to function 'update_str'
     221 | void update_str(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:259:9: warning: 'update_int' accessing 128 bytes in a region of size 16 [-Wstringop-overflow=]
     259 |         update_int(dev, "pdata reset_pin", &(old_pdata)->reset_pin, new_pdata->reset_pin);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:259:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: note: in a call to function 'update_int'
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:260:9: warning: 'update_int' accessing 128 bytes in a region of size 17 [-Wstringop-overflow=]
     260 |         update_int(dev, "pdata detect_pin", &(old_pdata)->detect_pin, new_pdata->detect_pin);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:260:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: note: in a call to function 'update_int'
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:261:9: warning: 'update_inta' accessing 128 bytes in a region of size 12 [-Wstringop-overflow=]
     261 |         update_inta(dev, "pdata gpios", old_pdata->gpios, new_pdata->gpios, IPU_SPDATA_GPIO_NUM);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:261:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:261:9: warning: 'update_inta' accessing 512 bytes in a region of size 16 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:261:9: note: referencing argument 3 of type 'int[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:261:9: warning: 'update_inta' accessing 512 bytes in a region of size 16 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:261:9: note: referencing argument 4 of type 'int[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:205:6: note: in a call to function 'update_inta'
     205 | void update_inta(struct device *dev,
         |      ^~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c: In function 'update_serdes_subdev':
   drivers/media/platform/intel/ipu6-acpi-pdata.c:279:9: warning: 'update_int' accessing 128 bytes in a region of size 10 [-Wstringop-overflow=]
     279 |         update_int(dev, "CSI2 port", &(*old_sd)->csi2->port, new_sd->csi2->port);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:279:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: note: in a call to function 'update_int'
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:280:9: warning: 'update_int' accessing 128 bytes in a region of size 12 [-Wstringop-overflow=]
     280 |         update_int(dev, "CSI2 nlanes", &(*old_sd)->csi2->nlanes, new_sd->csi2->nlanes);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:280:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: note: in a call to function 'update_int'
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:283:9: warning: 'update_short' accessing 128 bytes in a region of size 20 [-Wstringop-overflow=]
     283 |         update_short(dev, "I2C board_info addr", &(*old_sd)->i2c.board_info.addr,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     284 |                 new_sd->i2c.board_info.addr);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:283:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:172:6: note: in a call to function 'update_short'
     172 | void update_short(struct device *dev,
         |      ^~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: warning: 'update_str' accessing 128 bytes in a region of size 20 [-Wstringop-overflow=]
     285 |         update_str(dev, "I2C i2c_adapter_bdf", (*old_sd)->i2c.i2c_adapter_bdf,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     286 |                 new_sd->i2c.i2c_adapter_bdf);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: warning: 'update_str' accessing 128 bytes in a region of size 32 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: note: referencing argument 3 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: warning: 'update_str' accessing 128 bytes in a region of size 32 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: note: referencing argument 4 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:221:6: note: in a call to function 'update_str'
     221 | void update_str(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:288:9: warning: 'update_int' accessing 128 bytes in a region of size 21 [-Wstringop-overflow=]
     288 |         update_int(dev, "I2C Pdata reset_gpio", &old_pdata->reset_gpio,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     289 |                 new_pdata->reset_gpio);
         |                 ~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:288:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: note: in a call to function 'update_int'
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:290:9: warning: 'update_int' accessing 128 bytes in a region of size 19 [-Wstringop-overflow=]
     290 |         update_int(dev, "I2C Pdata FPD_gpio", &old_pdata->FPD_gpio, new_pdata->FPD_gpio);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:290:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: note: in a call to function 'update_int'
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:302:25: warning: 'update_short' accessing 128 bytes in a region of size 12 [-Wstringop-overflow=]
     302 |                         update_short(dev, "SdInfo port", &old_sdinfo->rx_port,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     303 |                                 new_sdinfo->rx_port);
         |                                 ~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:302:25: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:172:6: note: in a call to function 'update_short'
     172 | void update_short(struct device *dev,
         |      ^~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:304:25: warning: 'update_short' accessing 128 bytes in a region of size 20 [-Wstringop-overflow=]
     304 |                         update_short(dev, "SdInfo phy_i2c_addr", &old_sdinfo->phy_i2c_addr,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     305 |                                 new_sdinfo->phy_i2c_addr);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:304:25: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:172:6: note: in a call to function 'update_short'
     172 | void update_short(struct device *dev,
         |      ^~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:306:25: warning: 'update_short' accessing 128 bytes in a region of size 17 [-Wstringop-overflow=]
     306 |                         update_short(dev, "SdInfo ser_alias", &old_sdinfo->ser_alias,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     307 |                                 new_sdinfo->ser_alias);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:306:25: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:172:6: note: in a call to function 'update_short'
     172 | void update_short(struct device *dev,
         |      ^~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:308:25: warning: 'update_short' accessing 128 bytes in a region of size 23 [-Wstringop-overflow=]
     308 |                         update_short(dev, "SdInfo board_info.addr", &old_sdinfo->board_info.addr,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     309 |                                 new_sdinfo->board_info.addr);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:308:25: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:172:6: note: in a call to function 'update_short'
     172 | void update_short(struct device *dev,
         |      ^~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:312:33: warning: 'update_int' accessing 128 bytes in a region of size 13 [-Wstringop-overflow=]
     312 |                                 update_int(dev, "mPdata lanes", &old_mpdata->lanes,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     313 |                                         new_mpdata->lanes);
         |                                         ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:312:33: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: note: in a call to function 'update_int'
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:314:33: warning: 'update_int' accessing 128 bytes in a region of size 12 [-Wstringop-overflow=]
     314 |                                 update_int(dev, "mPdata fsin", &old_mpdata->fsin,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     315 |                                         new_mpdata->fsin);
         |                                         ~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:314:33: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: note: in a call to function 'update_int'
     194 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:316:33: warning: 'update_inta' accessing 128 bytes in a region of size 24 [-Wstringop-overflow=]
     316 |                                 update_inta(dev, "mPdata gpio_powerup_seq",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     317 |                                                 (int *)old_mpdata->gpio_powerup_seq,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     318 |                                                 (int *)new_mpdata->gpio_powerup_seq,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     319 |                                                 SERDES_MAX_GPIO_POWERUP_SEQ);
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:316:33: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:316:33: warning: 'update_inta' accessing 512 bytes in a region of size 4 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:316:33: note: referencing argument 3 of type 'int[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:316:33: warning: 'update_inta' accessing 512 bytes in a region of size 4 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:316:33: note: referencing argument 4 of type 'int[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:205:6: note: in a call to function 'update_inta'
     205 | void update_inta(struct device *dev,
         |      ^~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c: In function 'update_subdev':
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: warning: 'update_str' accessing 128 bytes in a region of size 20 [-Wstringop-overflow=]
     249 |         update_str(dev, "I2C i2c_adapter_bdf", (*old_sd)->i2c.i2c_adapter_bdf,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     250 |                 new_sd->i2c.i2c_adapter_bdf);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: warning: 'update_str' accessing 128 bytes in a region of size 32 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: note: referencing argument 3 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: warning: 'update_str' accessing 128 bytes in a region of size 32 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: note: referencing argument 4 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:221:6: note: in a call to function 'update_str'
     221 | void update_str(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: warning: 'update_str' accessing 128 bytes in a region of size 19 [-Wstringop-overflow=]
     258 |         update_str(dev, "pdata irq_pin_name", old_pdata->irq_pin_name, new_pdata->irq_pin_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: warning: 'update_str' accessing 128 bytes in a region of size 16 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: note: referencing argument 3 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: warning: 'update_str' accessing 128 bytes in a region of size 16 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: note: referencing argument 4 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:221:6: note: in a call to function 'update_str'
     221 | void update_str(struct device *dev,
         |      ^~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: warning: 'update_str' accessing 128 bytes in a region of size 20 [-Wstringop-overflow=]
     249 |         update_str(dev, "I2C i2c_adapter_bdf", (*old_sd)->i2c.i2c_adapter_bdf,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     250 |                 new_sd->i2c.i2c_adapter_bdf);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: warning: 'update_str' accessing 128 bytes in a region of size 32 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: note: referencing argument 3 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: warning: 'update_str' accessing 128 bytes in a region of size 32 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:249:9: note: referencing argument 4 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:221:6: note: in a call to function 'update_str'
     221 | void update_str(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: warning: 'update_str' accessing 128 bytes in a region of size 19 [-Wstringop-overflow=]
     258 |         update_str(dev, "pdata irq_pin_name", old_pdata->irq_pin_name, new_pdata->irq_pin_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: warning: 'update_str' accessing 128 bytes in a region of size 16 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: note: referencing argument 3 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: warning: 'update_str' accessing 128 bytes in a region of size 16 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:258:9: note: referencing argument 4 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:221:6: note: in a call to function 'update_str'
     221 | void update_str(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c: In function 'update_serdes_subdev':
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: warning: 'update_str' accessing 128 bytes in a region of size 20 [-Wstringop-overflow=]
     285 |         update_str(dev, "I2C i2c_adapter_bdf", (*old_sd)->i2c.i2c_adapter_bdf,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     286 |                 new_sd->i2c.i2c_adapter_bdf);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: warning: 'update_str' accessing 128 bytes in a region of size 32 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: note: referencing argument 3 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: warning: 'update_str' accessing 128 bytes in a region of size 32 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: note: referencing argument 4 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:221:6: note: in a call to function 'update_str'
     221 | void update_str(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: warning: 'update_str' accessing 128 bytes in a region of size 20 [-Wstringop-overflow=]
     285 |         update_str(dev, "I2C i2c_adapter_bdf", (*old_sd)->i2c.i2c_adapter_bdf,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     286 |                 new_sd->i2c.i2c_adapter_bdf);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: note: referencing argument 2 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: warning: 'update_str' accessing 128 bytes in a region of size 32 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: note: referencing argument 3 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: warning: 'update_str' accessing 128 bytes in a region of size 32 [-Wstringop-overflow=]
   drivers/media/platform/intel/ipu6-acpi-pdata.c:285:9: note: referencing argument 4 of type 'char[128]'
   drivers/media/platform/intel/ipu6-acpi-pdata.c:221:6: note: in a call to function 'update_str'
     221 | void update_str(struct device *dev,
         |      ^~~~~~~~~~


vim +/update_int +243 drivers/media/platform/intel/ipu6-acpi-pdata.c

cfb5743695d51c zouxiaoh 2022-11-28  231  
cfb5743695d51c zouxiaoh 2022-11-28  232  void update_subdev(struct device *dev,
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
cfb5743695d51c zouxiaoh 2022-11-28 @243  	update_int(dev, "CSI2 port", &(*old_sd)->csi2->port, new_sd->csi2->port);
cfb5743695d51c zouxiaoh 2022-11-28  244  	update_int(dev, "CSI2 nlanes", &(*old_sd)->csi2->nlanes, new_sd->csi2->nlanes);
cfb5743695d51c zouxiaoh 2022-11-28  245  
cfb5743695d51c zouxiaoh 2022-11-28  246  	/* i2c */
cfb5743695d51c zouxiaoh 2022-11-28 @247  	update_short(dev, "I2C board_info addr", &(*old_sd)->i2c.board_info.addr,
cfb5743695d51c zouxiaoh 2022-11-28  248  		new_sd->i2c.board_info.addr);
cfb5743695d51c zouxiaoh 2022-11-28 @249  	update_str(dev, "I2C i2c_adapter_bdf", (*old_sd)->i2c.i2c_adapter_bdf,
cfb5743695d51c zouxiaoh 2022-11-28  250  		new_sd->i2c.i2c_adapter_bdf);
cfb5743695d51c zouxiaoh 2022-11-28  251  
cfb5743695d51c zouxiaoh 2022-11-28  252  	/* platform data */
cfb5743695d51c zouxiaoh 2022-11-28  253  	update_int(dev, "pdata port", &(old_pdata)->port, new_pdata->port);
cfb5743695d51c zouxiaoh 2022-11-28  254  	update_int(dev, "pdata lanes", &(old_pdata)->lanes, new_pdata->lanes);
cfb5743695d51c zouxiaoh 2022-11-28 @255  	update_hex(dev, "pdata I2C slave addr", &(old_pdata)->i2c_slave_address,
cfb5743695d51c zouxiaoh 2022-11-28  256  		new_pdata->i2c_slave_address);
cfb5743695d51c zouxiaoh 2022-11-28  257  	update_int(dev, "pdata irq_pin", &(old_pdata)->irq_pin, new_pdata->irq_pin);
cfb5743695d51c zouxiaoh 2022-11-28  258  	update_str(dev, "pdata irq_pin_name", old_pdata->irq_pin_name, new_pdata->irq_pin_name);
cfb5743695d51c zouxiaoh 2022-11-28  259  	update_int(dev, "pdata reset_pin", &(old_pdata)->reset_pin, new_pdata->reset_pin);
cfb5743695d51c zouxiaoh 2022-11-28  260  	update_int(dev, "pdata detect_pin", &(old_pdata)->detect_pin, new_pdata->detect_pin);
9a2116b2763776 zouxiaoh 2022-11-09 @261  	update_inta(dev, "pdata gpios", old_pdata->gpios, new_pdata->gpios, IPU_SPDATA_GPIO_NUM);
cfb5743695d51c zouxiaoh 2022-11-28  262  }
cfb5743695d51c zouxiaoh 2022-11-28  263  

:::::: The code at line 243 was first introduced by commit
:::::: cfb5743695d51c3d275a3646d140336c6e515358 media: intel-ipu6: implement new vc solution

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: renjiaox <jiaojiaox.ren@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
