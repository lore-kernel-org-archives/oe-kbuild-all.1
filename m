Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0C14C66
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 17:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677000093; x=1708536093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bbe0CmEPTl67ILU2glGg8N/Lhsmux09UHGqGLRS/H1Q=;
  b=fpncFx5G9vcgTbzpBFJSLPvnxSp0a6VSZItwHAKq3qRKvclGSNdFbBRR
   EtduJikEJUpskjw1D3WfnW+ul6Ljj8gJEdpIoaq1GOOwkdd3IcMoWDhZf
   WSKHDApMsj2w3n/zu4jRUQpsmbCTJk5bzdY+FlvPz7J8VPX5LsgliIIzg
   j7C/Xx0SOaQwYKxZsfa/kThBVOSl5HJ47RTLWk+QrDosCIjk6WoH65wpo
   +4ZUjYtI/Mp5tBCwD3eI6f96rqI2LqSlOBHLmVs/c/rotzvIiL83nv34u
   kYwyaJmt7Lrey0c5c4adjwPV77AjO5y0/l7dcFAKtNwS+IHi486a0l4mF
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="360172207"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="360172207"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 09:21:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="702079750"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="702079750"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Feb 2023 09:21:30 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUWKX-00004T-1x;
	Tue, 21 Feb 2023 17:21:29 +0000
Date: Wed, 22 Feb 2023 01:20:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ng Khai Wen <khai.wen.ng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Chen Meng J <meng.j.chen@intel.com>
Subject: [intel-lts:5.10/yocto 10474/30000]
 drivers/media/i2c/ti960-des.c:129:5: warning: no previous prototype for
 'bus_switch'
Message-ID: <202302220122.Z714MMWW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ng,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   e8844106f6fc41e1c8d5dbadbd62ac3e54030903
commit: bd8c7120c481ebe8e2e40e6b9308d689f8adfff7 [10474/30000] media: ti960: remove crlmodule dependency
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230222/202302220122.Z714MMWW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/bd8c7120c481ebe8e2e40e6b9308d689f8adfff7
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout bd8c7120c481ebe8e2e40e6b9308d689f8adfff7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220122.Z714MMWW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ti960-des.c:129:5: warning: no previous prototype for 'bus_switch' [-Wmissing-prototypes]
     129 | int bus_switch(struct ti960 *va)
         |     ^~~~~~~~~~
   drivers/media/i2c/ti960-des.c: In function 'ti960_init':
   drivers/media/i2c/ti960-des.c:1240:22: warning: unused variable 'reset_gpio' [-Wunused-variable]
    1240 |         unsigned int reset_gpio = va->pdata->reset_gpio;
         |                      ^~~~~~~~~~
   In file included from drivers/media/i2c/ti960-des.c:20:
   drivers/media/i2c/ti953.h: At top level:
   drivers/media/i2c/ti953.h:101:42: warning: 'ti953_FPD3_RX_ID' defined but not used [-Wunused-const-variable=]
     101 | static const struct ti953_register_devid ti953_FPD3_RX_ID[] = {
         |                                          ^~~~~~~~~~~~~~~~
   drivers/media/i2c/ti953.h:96:42: warning: 'ti953_init_settings_clk' defined but not used [-Wunused-const-variable=]
      96 | static const struct ti953_register_write ti953_init_settings_clk[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ti953.h:29:42: warning: 'ti953_init_settings' defined but not used [-Wunused-const-variable=]
      29 | static const struct ti953_register_write ti953_init_settings[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~


vim +/bus_switch +129 drivers/media/i2c/ti960-des.c

1aafb1e0df5527 Ng Khai Wen 2021-07-01  128  
d2753af810c799 Ng Khai Wen 2021-07-01 @129  int bus_switch(struct ti960 *va)
d2753af810c799 Ng Khai Wen 2021-07-01  130  {
d2753af810c799 Ng Khai Wen 2021-07-01  131  	int ret;
d2753af810c799 Ng Khai Wen 2021-07-01  132  	int retry, timeout = 10;
d2753af810c799 Ng Khai Wen 2021-07-01  133  	struct i2c_client *client = v4l2_get_subdevdata(&va->sd);
d2753af810c799 Ng Khai Wen 2021-07-01  134  
d2753af810c799 Ng Khai Wen 2021-07-01  135  	dev_dbg(&client->dev, "bus switch");
d2753af810c799 Ng Khai Wen 2021-07-01  136  	client->addr = 0x70;
d2753af810c799 Ng Khai Wen 2021-07-01  137  	for (retry = 0; retry < timeout; retry++) {
d2753af810c799 Ng Khai Wen 2021-07-01  138  		ret = i2c_smbus_write_byte(client, 0x01);
d2753af810c799 Ng Khai Wen 2021-07-01  139  		if (ret < 0)
d2753af810c799 Ng Khai Wen 2021-07-01  140  			usleep_range(5000, 6000);
d2753af810c799 Ng Khai Wen 2021-07-01  141  		else
d2753af810c799 Ng Khai Wen 2021-07-01  142  			break;
d2753af810c799 Ng Khai Wen 2021-07-01  143  	}
d2753af810c799 Ng Khai Wen 2021-07-01  144  
d2753af810c799 Ng Khai Wen 2021-07-01  145  	client->addr = TI960_I2C_ADDRESS;
d2753af810c799 Ng Khai Wen 2021-07-01  146  	if (retry >= timeout) {
d2753af810c799 Ng Khai Wen 2021-07-01  147  		dev_err(&client->dev, "bus switch failed");
d2753af810c799 Ng Khai Wen 2021-07-01  148  		return -EREMOTEIO;
d2753af810c799 Ng Khai Wen 2021-07-01  149  	}
d2753af810c799 Ng Khai Wen 2021-07-01  150  
d2753af810c799 Ng Khai Wen 2021-07-01  151  	return 0;
d2753af810c799 Ng Khai Wen 2021-07-01  152  }
d2753af810c799 Ng Khai Wen 2021-07-01  153  

:::::: The code at line 129 was first introduced by commit
:::::: d2753af810c79927ae6a70fd532a0b19d9816dc5 media: intel-ipu6: add ti960 driver

:::::: TO: Ng Khai Wen <khai.wen.ng@intel.com>
:::::: CC: Pan, Kris <kris.pan@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
