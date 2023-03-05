Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37FA15A3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Mar 2023 02:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677984675; x=1709520675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KZoGVMEbcimYwCvAkAdLjmiQvuDG66RcEJgKBq6rohI=;
  b=F78oJ5g0PysgnImT88onPlBEZAhWR7NCaeineW1aN1tku3/zVWxCd6bJ
   5cbR8B09fEQKWKKjJsVCWU7NF+FVH0VZWAVzMJF/gTU9Pc/MZ/VV+sDzA
   IUXe8V04eMShotFQE0pYItExB56pm+wAuHqjyGJxLEA2Wq1LiIlmQMtfL
   7w2Fd1NaGeVUEgeHXcrZP1B0rHwNESjl1gugxor78Xc7FwDPCH8A7PFKC
   z5U8dunszH+hH3Q/quDT2i6lchBH5Oot/TyfvMOuORt4LhU/WHhpsNfXf
   gj0lq2/uF/1Jip4+GHWV1OEJHbH4bHyjNZ5w1KQ1kAAJBklnoMrO61Hcg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="421614963"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="421614963"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 18:51:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="1005007505"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="1005007505"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Mar 2023 18:51:13 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYeSv-0002W6-0U;
	Sun, 05 Mar 2023 02:51:13 +0000
Date: Sun, 5 Mar 2023 10:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Meng J <meng.j.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>,
	zouxiaoh <xiaohong.zou@intel.com>
Subject: [intel-lts:5.15/linux 26/38]
 drivers/media/platform/intel/ipu6-acpi-pdata.c:55:6: warning: no previous
 prototype for function 'print_serdes_sdinfo'
Message-ID: <202303051033.oiyLpANP-lkp@intel.com>
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
head:   25cecc1dca44bc66edfba4448f0d970ca6bcbe63
commit: 4de71cacfa75fc249aa6f79004ee09b3ae17ce41 [26/38] media: intel: correct dependency for PDATA and ACPI
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20230305/202303051033.oiyLpANP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/4de71cacfa75fc249aa6f79004ee09b3ae17ce41
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 4de71cacfa75fc249aa6f79004ee09b3ae17ce41
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/platform/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303051033.oiyLpANP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/intel/ipu6-acpi-pdata.c:55:6: warning: no previous prototype for function 'print_serdes_sdinfo' [-Wmissing-prototypes]
   void print_serdes_sdinfo(struct serdes_subdev_info *sdinfo)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:55:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void print_serdes_sdinfo(struct serdes_subdev_info *sdinfo)
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:83:6: warning: no previous prototype for function 'print_serdes_subdev' [-Wmissing-prototypes]
   void print_serdes_subdev(struct ipu_isys_subdev_info *sd)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void print_serdes_subdev(struct ipu_isys_subdev_info *sd)
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:123:6: warning: no previous prototype for function 'print_subdev' [-Wmissing-prototypes]
   void print_subdev(struct ipu_isys_subdev_info *sd)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:123:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void print_subdev(struct ipu_isys_subdev_info *sd)
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:157:6: warning: no previous prototype for function 'add_local_subdevs' [-Wmissing-prototypes]
   void add_local_subdevs(struct ipu_isys_subdev_info *new_subdev_info)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:157:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void add_local_subdevs(struct ipu_isys_subdev_info *new_subdev_info)
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:172:6: warning: no previous prototype for function 'update_short' [-Wmissing-prototypes]
   void update_short(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:172:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_short(struct device *dev,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:183:6: warning: no previous prototype for function 'update_hex' [-Wmissing-prototypes]
   void update_hex(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_hex(struct device *dev,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:194:6: warning: no previous prototype for function 'update_int' [-Wmissing-prototypes]
   void update_int(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:194:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_int(struct device *dev,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:205:6: warning: no previous prototype for function 'update_inta' [-Wmissing-prototypes]
   void update_inta(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:205:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_inta(struct device *dev,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:221:6: warning: no previous prototype for function 'update_str' [-Wmissing-prototypes]
   void update_str(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_str(struct device *dev,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:232:6: warning: no previous prototype for function 'update_subdev' [-Wmissing-prototypes]
   void update_subdev(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:232:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_subdev(struct device *dev,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:264:6: warning: no previous prototype for function 'update_serdes_subdev' [-Wmissing-prototypes]
   void update_serdes_subdev(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:264:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_serdes_subdev(struct device *dev,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:325:5: warning: no previous prototype for function 'compare_subdev' [-Wmissing-prototypes]
   int compare_subdev(struct device *dev,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:325:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int compare_subdev(struct device *dev,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:377:6: warning: no previous prototype for function 'update_pdata' [-Wmissing-prototypes]
   void update_pdata(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:377:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_pdata(struct device *dev,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:448:6: warning: no previous prototype for function 'set_ti960_gpio' [-Wmissing-prototypes]
   void set_ti960_gpio(struct control_logic_data *ctl_data, struct serdes_platform_data **pdata)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:448:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_ti960_gpio(struct control_logic_data *ctl_data, struct serdes_platform_data **pdata)
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:468:6: warning: no previous prototype for function 'set_lt_gpio' [-Wmissing-prototypes]
   void set_lt_gpio(struct control_logic_data *ctl_data, struct sensor_platform_data **pdata,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:468:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_lt_gpio(struct control_logic_data *ctl_data, struct sensor_platform_data **pdata,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:499:6: warning: no previous prototype for function 'set_ar0234_gpio' [-Wmissing-prototypes]
   void set_ar0234_gpio(struct sensor_platform_data **pdata)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:499:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_ar0234_gpio(struct sensor_platform_data **pdata)
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:507:5: warning: no previous prototype for function 'set_csi2' [-Wmissing-prototypes]
   int set_csi2(struct ipu_isys_subdev_info **sensor_sd,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:507:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_csi2(struct ipu_isys_subdev_info **sensor_sd,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:524:6: warning: no previous prototype for function 'set_i2c' [-Wmissing-prototypes]
   void set_i2c(struct ipu_isys_subdev_info **sensor_sd,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:524:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_i2c(struct ipu_isys_subdev_info **sensor_sd,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:535:6: warning: no previous prototype for function 'set_serdes_sd_pdata' [-Wmissing-prototypes]
   void set_serdes_sd_pdata(struct serdes_module_pdata **module_pdata, char sensor_name[I2C_NAME_SIZE],
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:535:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_serdes_sd_pdata(struct serdes_module_pdata **module_pdata, char sensor_name[I2C_NAME_SIZE],
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:555:5: warning: no previous prototype for function 'set_serdes_subdev' [-Wmissing-prototypes]
   int set_serdes_subdev(struct ipu_isys_subdev_info **serdes_sd,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:555:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_serdes_subdev(struct ipu_isys_subdev_info **serdes_sd,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:591:5: warning: no previous prototype for function 'set_pdata' [-Wmissing-prototypes]
   int set_pdata(struct ipu_isys_subdev_info **sensor_sd,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:591:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_pdata(struct ipu_isys_subdev_info **sensor_sd,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:652:6: warning: no previous prototype for function 'set_serdes_info' [-Wmissing-prototypes]
   void set_serdes_info(struct device *dev, const char *serdes_name, struct sensor_bios_data *cam_data)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:652:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_serdes_info(struct device *dev, const char *serdes_name, struct sensor_bios_data *cam_data)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:672:5: warning: no previous prototype for function 'populate_dummy' [-Wmissing-prototypes]
   int populate_dummy(struct device *dev,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:672:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int populate_dummy(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:706:5: warning: no previous prototype for function 'populate_sensor_pdata' [-Wmissing-prototypes]
   int populate_sensor_pdata(struct device *dev,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:706:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int populate_sensor_pdata(struct device *dev,
   ^
   static 
   24 warnings generated.
--
>> drivers/media/platform/intel/ipu6-acpi-common.c:77:5: warning: no previous prototype for function 'ipu_acpi_get_gpio_data' [-Wmissing-prototypes]
   int ipu_acpi_get_gpio_data(struct device *dev, struct ipu_gpio_info *gpio, int size,
       ^
   drivers/media/platform/intel/ipu6-acpi-common.c:77:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ipu_acpi_get_gpio_data(struct device *dev, struct ipu_gpio_info *gpio, int size,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-common.c:160:5: warning: no previous prototype for function 'ipu_acpi_get_i2c_info' [-Wmissing-prototypes]
   int ipu_acpi_get_i2c_info(struct device *dev, struct ipu_i2c_info *i2c, int size, u64 *num)
       ^
   drivers/media/platform/intel/ipu6-acpi-common.c:160:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ipu_acpi_get_i2c_info(struct device *dev, struct ipu_i2c_info *i2c, int size, u64 *num)
   ^
   static 
   2 warnings generated.


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
https://github.com/intel/lkp-tests
