Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8285A125A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 12:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689250495; x=1720786495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZisGhE9sRpi8deoO2mNnuTWfUu6bz0H6g4gHfIODI9U=;
  b=BGYtyWpf7LEXXWStBsbNh4E8SmCkByL9++RrStUNvJsDi9/+MzbS6/xH
   6Cdihj1cgd7bP0SYaZNhwI8BuRt++ikKYMUSluoofcH1Tc2bWFC9rAyLe
   EbTdVctKv3gWyWZivfGBpOHU9Cq1v074mQWYm00gDKA20Twc4KzVktZfQ
   VFp+WeT/OAB499Zooq1p8BNhsyPFQgTU2FYFOxTKcagxqpYhRWhAlQNF4
   V4sPHz8PT3mbOkrhYIIw51xmKstK9i5ANNRxV+uqI4NX+91zG7mIxxuIa
   d6/LFIUp9rioy7Lto28Q5PrzsYQtUQb0mT/KLuxFUwh/gIV8Xa/R3jS/p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367792189"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="367792189"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 05:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="715917604"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="715917604"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Jul 2023 05:14:53 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJvDg-0006c5-2a;
	Thu, 13 Jul 2023 12:14:52 +0000
Date: Thu, 13 Jul 2023 20:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ranjan Dutta <ranjan.dutta@intel.com>,
	khaiwenn <khai.wen.ng@intel.com>,
	Chen Meng J <meng.j.chen@intel.com>
Subject: [intel-lts:5.15/linux 34/67]
 drivers/media/platform/intel/ipu6-acpi-pdata.c:513:6: warning: no previous
 prototype for 'set_common_gpio'
Message-ID: <202307132052.jDXOacDY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   4d44667fd3eca9633f0844bb09886fdc54f18539
commit: e284531507062cab2ca1b0378a97e118a74dc1e5 [34/67] media: intel: Updated ACPI driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230713/202307132052.jDXOacDY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307132052.jDXOacDY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307132052.jDXOacDY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/intel/ipu6-acpi-pdata.c:53:6: warning: no previous prototype for 'print_serdes_sdinfo' [-Wmissing-prototypes]
      53 | void print_serdes_sdinfo(struct serdes_subdev_info *sdinfo)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:80:6: warning: no previous prototype for 'print_serdes_subdev' [-Wmissing-prototypes]
      80 | void print_serdes_subdev(struct ipu_isys_subdev_info *sd)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:120:6: warning: no previous prototype for 'print_subdev' [-Wmissing-prototypes]
     120 | void print_subdev(struct ipu_isys_subdev_info *sd)
         |      ^~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:154:6: warning: no previous prototype for 'add_local_subdevs' [-Wmissing-prototypes]
     154 | void add_local_subdevs(struct ipu_isys_subdev_info *new_subdev_info)
         |      ^~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:169:6: warning: no previous prototype for 'update_short' [-Wmissing-prototypes]
     169 | void update_short(struct device *dev,
         |      ^~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:180:6: warning: no previous prototype for 'update_hex' [-Wmissing-prototypes]
     180 | void update_hex(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:191:6: warning: no previous prototype for 'update_int' [-Wmissing-prototypes]
     191 | void update_int(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:202:6: warning: no previous prototype for 'update_inta' [-Wmissing-prototypes]
     202 | void update_inta(struct device *dev,
         |      ^~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:218:6: warning: no previous prototype for 'update_str' [-Wmissing-prototypes]
     218 | void update_str(struct device *dev,
         |      ^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:229:6: warning: no previous prototype for 'update_subdev' [-Wmissing-prototypes]
     229 | void update_subdev(struct device *dev,
         |      ^~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:261:6: warning: no previous prototype for 'update_serdes_subdev' [-Wmissing-prototypes]
     261 | void update_serdes_subdev(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:320:5: warning: no previous prototype for 'compare_subdev' [-Wmissing-prototypes]
     320 | int compare_subdev(struct device *dev,
         |     ^~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:372:6: warning: no previous prototype for 'update_pdata' [-Wmissing-prototypes]
     372 | void update_pdata(struct device *dev,
         |      ^~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:462:6: warning: no previous prototype for 'set_ti960_gpio' [-Wmissing-prototypes]
     462 | void set_ti960_gpio(struct control_logic_data *ctl_data, struct serdes_platform_data **pdata)
         |      ^~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:482:6: warning: no previous prototype for 'set_lt_gpio' [-Wmissing-prototypes]
     482 | void set_lt_gpio(struct control_logic_data *ctl_data, struct sensor_platform_data **pdata,
         |      ^~~~~~~~~~~
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:513:6: warning: no previous prototype for 'set_common_gpio' [-Wmissing-prototypes]
     513 | void set_common_gpio(struct sensor_platform_data **pdata)
         |      ^~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:527:5: warning: no previous prototype for 'set_csi2' [-Wmissing-prototypes]
     527 | int set_csi2(struct ipu_isys_subdev_info **sensor_sd,
         |     ^~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:544:6: warning: no previous prototype for 'set_i2c' [-Wmissing-prototypes]
     544 | void set_i2c(struct ipu_isys_subdev_info **sensor_sd,
         |      ^~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:555:6: warning: no previous prototype for 'set_serdes_sd_pdata' [-Wmissing-prototypes]
     555 | void set_serdes_sd_pdata(struct serdes_module_pdata **module_pdata, char sensor_name[I2C_NAME_SIZE],
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:575:5: warning: no previous prototype for 'set_serdes_subdev' [-Wmissing-prototypes]
     575 | int set_serdes_subdev(struct ipu_isys_subdev_info **serdes_sd,
         |     ^~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:616:5: warning: no previous prototype for 'set_pdata' [-Wmissing-prototypes]
     616 | int set_pdata(struct ipu_isys_subdev_info **sensor_sd,
         |     ^~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:680:6: warning: no previous prototype for 'set_serdes_info' [-Wmissing-prototypes]
     680 | void set_serdes_info(struct device *dev, const char *serdes_name, struct sensor_bios_data *cam_data)
         |      ^~~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:701:5: warning: no previous prototype for 'populate_dummy' [-Wmissing-prototypes]
     701 | int populate_dummy(struct device *dev,
         |     ^~~~~~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:735:5: warning: no previous prototype for 'populate_sensor_pdata' [-Wmissing-prototypes]
     735 | int populate_sensor_pdata(struct device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~


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
https://github.com/intel/lkp-tests/wiki
