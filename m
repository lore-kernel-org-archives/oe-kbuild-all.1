Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9711A1366
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 11:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679225588; x=1710761588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8sPUdQlFj56VV30oVmy9lKRMdQgQw7tPPONtP9J14H0=;
  b=SjuZJjFJnLiQl18OxyhhRZ/fKzUX9HGrnJdF8fJLyidm5hA3uBDJs4xu
   AottZSd3FAvmC2lQ7CXvYyuGkSBrDoXcooZ1l6Dgl+elVF5RZ9+buAoD+
   nuoCrRMYd7/6PljFA7QdiTl5s5zg3I6Dx0VAb2d7f/uSaN61vhZ1OdvnD
   4xQ9p9dIs8VxPzkCASyZTpnJQ2aPjB87cZ+FxfNBqPakWrcpMYclJwpeb
   oLBsFhlvn/mg+mYyMrGiYIIdaEmHasHsnNvvrUv3t/AgC7QNGF8dILVnE
   XMWDQp8tY6vI0YyBWRTsTnHte1ivjHMnOclpu90OHykY9Km1BsJnf2+tl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="318154613"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="318154613"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 04:33:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="674064211"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="674064211"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Mar 2023 04:33:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdrHd-000AVy-2P;
	Sun, 19 Mar 2023 11:33:05 +0000
Date: Sun, 19 Mar 2023 19:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>
Subject: [intel-lts:5.15/linux 22/38]
 drivers/media/platform/intel/ipu6-acpi-pdata.c:220:36: warning: size
 argument in 'strlcpy' call appears to be size of the source; expected the
 size of the destination
Message-ID: <202303191925.Gg4PD3if-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   b1388db89e541f91eb8a746d0dd95f3f92159de0
commit: cfb5743695d51c3d275a3646d140336c6e515358 [22/38] media: intel-ipu6: implement new vc solution
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230319/202303191925.Gg4PD3if-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/cfb5743695d51c3d275a3646d140336c6e515358
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/linux
        git checkout cfb5743695d51c3d275a3646d140336c6e515358
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/platform/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191925.Gg4PD3if-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/intel/ipu6-acpi-pdata.c:16:
   include/media/ipu-acpi.h:33:31: warning: no previous prototype for function 'get_built_in_pdata' [-Wmissing-prototypes]
   struct ipu_isys_subdev_pdata *get_built_in_pdata(void)
                                 ^
   include/media/ipu-acpi.h:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct ipu_isys_subdev_pdata *get_built_in_pdata(void)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:47:6: warning: no previous prototype for function 'print_serdes_sdinfo' [-Wmissing-prototypes]
   void print_serdes_sdinfo(struct serdes_subdev_info *sdinfo)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void print_serdes_sdinfo(struct serdes_subdev_info *sdinfo)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:75:6: warning: no previous prototype for function 'print_serdes_subdev' [-Wmissing-prototypes]
   void print_serdes_subdev(struct ipu_isys_subdev_info *sd)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void print_serdes_subdev(struct ipu_isys_subdev_info *sd)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:115:6: warning: no previous prototype for function 'print_subdev' [-Wmissing-prototypes]
   void print_subdev(struct ipu_isys_subdev_info *sd)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:115:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void print_subdev(struct ipu_isys_subdev_info *sd)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:149:6: warning: no previous prototype for function 'add_local_subdevs' [-Wmissing-prototypes]
   void add_local_subdevs(struct ipu_isys_subdev_info *new_subdev_info)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void add_local_subdevs(struct ipu_isys_subdev_info *new_subdev_info)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:164:6: warning: no previous prototype for function 'update_short' [-Wmissing-prototypes]
   void update_short(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:164:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_short(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:175:6: warning: no previous prototype for function 'update_hex' [-Wmissing-prototypes]
   void update_hex(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:175:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_hex(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:186:6: warning: no previous prototype for function 'update_int' [-Wmissing-prototypes]
   void update_int(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:186:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_int(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:197:6: warning: no previous prototype for function 'update_inta' [-Wmissing-prototypes]
   void update_inta(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:197:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_inta(struct device *dev,
   ^
   static 
>> drivers/media/platform/intel/ipu6-acpi-pdata.c:220:36: warning: size argument in 'strlcpy' call appears to be size of the source; expected the size of the destination [-Wstrlcpy-strlcat-size]
                   strlcpy(old_str, new_str, strlen(new_str)+1);
                                             ~~~~~~~^~~~~~~~~~
   drivers/media/platform/intel/ipu6-acpi-pdata.c:213:6: warning: no previous prototype for function 'update_str' [-Wmissing-prototypes]
   void update_str(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:213:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_str(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:224:6: warning: no previous prototype for function 'update_subdev' [-Wmissing-prototypes]
   void update_subdev(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_subdev(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:256:6: warning: no previous prototype for function 'update_serdes_subdev' [-Wmissing-prototypes]
   void update_serdes_subdev(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:256:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_serdes_subdev(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:317:5: warning: no previous prototype for function 'compare_subdev' [-Wmissing-prototypes]
   int compare_subdev(struct device *dev,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:317:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int compare_subdev(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:369:6: warning: no previous prototype for function 'update_pdata' [-Wmissing-prototypes]
   void update_pdata(struct device *dev,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:369:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_pdata(struct device *dev,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:443:6: warning: no previous prototype for function 'set_ti960_gpio' [-Wmissing-prototypes]
   void set_ti960_gpio(struct control_logic_data *ctl_data, struct serdes_platform_data **pdata)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:443:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_ti960_gpio(struct control_logic_data *ctl_data, struct serdes_platform_data **pdata)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:463:6: warning: no previous prototype for function 'set_lt_gpio' [-Wmissing-prototypes]
   void set_lt_gpio(struct control_logic_data *ctl_data, struct sensor_platform_data **pdata,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:463:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_lt_gpio(struct control_logic_data *ctl_data, struct sensor_platform_data **pdata,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:494:6: warning: no previous prototype for function 'set_ar0234_gpio' [-Wmissing-prototypes]
   void set_ar0234_gpio(struct sensor_platform_data **pdata)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:494:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_ar0234_gpio(struct sensor_platform_data **pdata)
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:502:5: warning: no previous prototype for function 'set_csi2' [-Wmissing-prototypes]
   int set_csi2(struct ipu_isys_subdev_info **sensor_sd,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:502:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_csi2(struct ipu_isys_subdev_info **sensor_sd,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:519:6: warning: no previous prototype for function 'set_i2c' [-Wmissing-prototypes]
   void set_i2c(struct ipu_isys_subdev_info **sensor_sd,
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:519:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_i2c(struct ipu_isys_subdev_info **sensor_sd,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:530:6: warning: no previous prototype for function 'set_serdes_sd_pdata' [-Wmissing-prototypes]
   void set_serdes_sd_pdata(struct serdes_module_pdata **module_pdata, char sensor_name[I2C_NAME_SIZE],
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:530:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_serdes_sd_pdata(struct serdes_module_pdata **module_pdata, char sensor_name[I2C_NAME_SIZE],
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:550:5: warning: no previous prototype for function 'set_serdes_subdev' [-Wmissing-prototypes]
   int set_serdes_subdev(struct ipu_isys_subdev_info **serdes_sd,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:550:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_serdes_subdev(struct ipu_isys_subdev_info **serdes_sd,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:586:5: warning: no previous prototype for function 'set_pdata' [-Wmissing-prototypes]
   int set_pdata(struct ipu_isys_subdev_info **sensor_sd,
       ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:586:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_pdata(struct ipu_isys_subdev_info **sensor_sd,
   ^
   static 
   drivers/media/platform/intel/ipu6-acpi-pdata.c:647:6: warning: no previous prototype for function 'set_serdes_info' [-Wmissing-prototypes]
   void set_serdes_info(struct device *dev, const char *serdes_name, struct sensor_bios_data *cam_data)
        ^
   drivers/media/platform/intel/ipu6-acpi-pdata.c:647:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_serdes_info(struct device *dev, const char *serdes_name, struct sensor_bios_data *cam_data)
   ^
   static 


vim +/strlcpy +220 drivers/media/platform/intel/ipu6-acpi-pdata.c

   212	
   213	void update_str(struct device *dev,
   214			char msg[MSG_LEN],
   215			char old_str[MSG_LEN],
   216			char new_str[MSG_LEN])
   217	{
   218		if (strcmp(old_str, new_str) != 0) {
   219			dev_info(dev, "%s %s -> %s", msg, old_str, new_str);
 > 220			strlcpy(old_str, new_str, strlen(new_str)+1);
   221		}
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
