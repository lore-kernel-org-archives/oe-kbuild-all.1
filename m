Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6A2EC5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 11:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682249890; x=1713785890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TeqaYoiAoiz0xh/K3TZc60/sX07qi9aC1tJejBrbxO8=;
  b=jVtKEKdtdp3660HUqU3WWGy5jLE7JmSk/SaLs/7JEAmJ39DobARnbhDf
   Go0KVT3DYwZHNqp2jTxBowksoORxxjlHZDkcVoS17YLP7dij7JztVdY1H
   SY+NrqEwSoa2mqr4TDjpEbPM2gE+zYrd0ClprcaAGDQldTHMeWOJS0AJO
   C/e/0GgWfg81DLe5lvw3KfscGG23lZ0EnGosG8xVDu4aRKkfz1/M1/QTt
   UhWkPQhD5dstcfz5mTWuGqzd8gRb4dnUzhftYRMaVOER3LuMstzLq+wtu
   TW9CY+WT3vfhZzhPwNI+gkLBC18SUVavS8Wy2i7GiFhwW7N/DuuURMxCb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="343759950"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="343759950"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 04:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="804265177"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="804265177"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Apr 2023 04:38:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqY2h-000hsC-2K;
	Sun, 23 Apr 2023 11:38:07 +0000
Date: Sun, 23 Apr 2023 19:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ranjan Dutta <ranjan.dutta@intel.com>,
	khaiwenn <khai.wen.ng@intel.com>,
	Chen Meng J <meng.j.chen@intel.com>
Subject: [intel-lts:5.15/linux 34/67]
 drivers/media/platform/intel/ipu6-acpi-pdata.c:513:6: warning: no previous
 prototype for function 'set_common_gpio'
Message-ID: <202304231901.8GJ3NnnW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   dfff915012ab62c58f33603bb3eeb3e21027b332
commit: e284531507062cab2ca1b0378a97e118a74dc1e5 [34/67] media: intel: Updated ACPI driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230423/202304231901.8GJ3NnnW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/e284531507062cab2ca1b0378a97e118a74dc1e5
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/linux
        git checkout e284531507062cab2ca1b0378a97e118a74dc1e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/platform/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304231901.8GJ3NnnW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:80:6: warning: no previous prototype for function 'print_serdes_subdev' [-Wmissing-prototypes]
   void print_serdes_subdev(struct ipu_isys_subdev_info *sd)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void print_serdes_subdev(struct ipu_isys_subdev_info *sd)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:120:6: warning: no previous prototype for function 'print_subdev' [-Wmissing-prototypes]
   void print_subdev(struct ipu_isys_subdev_info *sd)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:120:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void print_subdev(struct ipu_isys_subdev_info *sd)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:154:6: warning: no previous prototype for function 'add_local_subdevs' [-Wmissing-prototypes]
   void add_local_subdevs(struct ipu_isys_subdev_info *new_subdev_info)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:154:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void add_local_subdevs(struct ipu_isys_subdev_info *new_subdev_info)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:169:6: warning: no previous prototype for function 'update_short' [-Wmissing-prototypes]
   void update_short(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:169:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_short(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:180:6: warning: no previous prototype for function 'update_hex' [-Wmissing-prototypes]
   void update_hex(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:180:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_hex(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:191:6: warning: no previous prototype for function 'update_int' [-Wmissing-prototypes]
   void update_int(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:191:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_int(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:202:6: warning: no previous prototype for function 'update_inta' [-Wmissing-prototypes]
   void update_inta(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:202:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_inta(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:218:6: warning: no previous prototype for function 'update_str' [-Wmissing-prototypes]
   void update_str(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:218:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_str(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:229:6: warning: no previous prototype for function 'update_subdev' [-Wmissing-prototypes]
   void update_subdev(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:229:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_subdev(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:261:6: warning: no previous prototype for function 'update_serdes_subdev' [-Wmissing-prototypes]
   void update_serdes_subdev(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:261:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_serdes_subdev(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:320:5: warning: no previous prototype for function 'compare_subdev' [-Wmissing-prototypes]
   int compare_subdev(struct device *dev,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:320:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int compare_subdev(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:372:6: warning: no previous prototype for function 'update_pdata' [-Wmissing-prototypes]
   void update_pdata(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:372:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_pdata(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:462:6: warning: no previous prototype for function 'set_ti960_gpio' [-Wmissing-prototypes]
   void set_ti960_gpio(struct control_logic_data *ctl_data, struct serdes_platform_data **pdata)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:462:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_ti960_gpio(struct control_logic_data *ctl_data, struct serdes_platform_data **pdata)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:482:6: warning: no previous prototype for function 'set_lt_gpio' [-Wmissing-prototypes]
   void set_lt_gpio(struct control_logic_data *ctl_data, struct sensor_platform_data **pdata,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:482:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_lt_gpio(struct control_logic_data *ctl_data, struct sensor_platform_data **pdata,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:513:6: warning: no previous prototype for function 'set_common_gpio' [-Wmissing-prototypes]
   void set_common_gpio(struct sensor_platform_data **pdata)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:513:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_common_gpio(struct sensor_platform_data **pdata)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:527:5: warning: no previous prototype for function 'set_csi2' [-Wmissing-prototypes]
   int set_csi2(struct ipu_isys_subdev_info **sensor_sd,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:527:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_csi2(struct ipu_isys_subdev_info **sensor_sd,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:544:6: warning: no previous prototype for function 'set_i2c' [-Wmissing-prototypes]
   void set_i2c(struct ipu_isys_subdev_info **sensor_sd,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:544:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_i2c(struct ipu_isys_subdev_info **sensor_sd,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:555:6: warning: no previous prototype for function 'set_serdes_sd_pdata' [-Wmissing-prototypes]
   void set_serdes_sd_pdata(struct serdes_module_pdata **module_pdata, char sensor_name[I2C_NAME_SIZE],
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:555:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_serdes_sd_pdata(struct serdes_module_pdata **module_pdata, char sensor_name[I2C_NAME_SIZE],
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:575:5: warning: no previous prototype for function 'set_serdes_subdev' [-Wmissing-prototypes]
   int set_serdes_subdev(struct ipu_isys_subdev_info **serdes_sd,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:575:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_serdes_subdev(struct ipu_isys_subdev_info **serdes_sd,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:616:5: warning: no previous prototype for function 'set_pdata' [-Wmissing-prototypes]
   int set_pdata(struct ipu_isys_subdev_info **sensor_sd,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:616:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_pdata(struct ipu_isys_subdev_info **sensor_sd,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:680:6: warning: no previous prototype for function 'set_serdes_info' [-Wmissing-prototypes]
   void set_serdes_info(struct device *dev, const char *serdes_name, struct sensor_bios_data *cam_data)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:680:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_serdes_info(struct device *dev, const char *serdes_name, struct sensor_bios_data *cam_data)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:701:5: warning: no previous prototype for function 'populate_dummy' [-Wmissing-prototypes]
   int populate_dummy(struct device *dev,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:701:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int populate_dummy(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:735:5: warning: no previous prototype for function 'populate_sensor_pdata' [-Wmissing-prototypes]
   int populate_sensor_pdata(struct device *dev,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:735:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int populate_sensor_pdata(struct device *dev,
   ^
   static 
   24 warnings generated.


vim +/set_common_gpio +513 drivers/media/platform/intel/ipu6-acpi-pdata.c

   512	
 > 513	void set_common_gpio(struct sensor_platform_data **pdata)
   514	{
   515		/* TODO: consider remove specific naming such as irq_pin, and use gpios[] */
   516	
   517		(*pdata)->irq_pin = -1;
   518		(*pdata)->reset_pin = -1;
   519		(*pdata)->detect_pin = -1;
   520	
   521		(*pdata)->gpios[0] = -1;
   522		(*pdata)->gpios[1] = 0;
   523		(*pdata)->gpios[2] = 0;
   524		(*pdata)->gpios[3] = 0;
   525	}
   526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
