Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5601EA7F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685109455; x=1716645455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ICRQcZmSPGM6vVjOblO8+nTOPi9ihifjQxr50h+1ZVw=;
  b=hsdfcWnQsuJkLvmBL2lwhntgRjjJDXE3VsNghW0lp97aE6goYtmq6Di3
   5MJ7PEaguBZxHqJRH10yAcE+Jkk+WUhRnjkmzHqBCXA1HWrIgHPZ6hXcP
   dFFULGoS/bh0KwGqFU/8K/jhYPkicAhdZp5GNLr905LvDu+5pfCU94zhs
   OKweNMrvmQ7+PC9bi12tBBkJHwBYlh14PjiCS4B4ilOIMPTko07ZdzJtI
   Mk/A6SceeFu5QTZEkZf4TU3rsIw0vPfj8ZFS53KitgCN55jhz0cO8ABbR
   uNXMCj9y9RT5XUOU5RKt/eW9dsY18/OOn5Us/a/AjYH5UA4S2O1GYXEIG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="338798563"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="338798563"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 06:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="708415718"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="708415718"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 May 2023 06:57:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2Xwi-000JO0-36;
	Fri, 26 May 2023 13:57:32 +0000
Date: Fri, 26 May 2023 21:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 2940/9879]
 drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:174:27: warning:
 'synaptics_rmi4_suspend' used but never defined
Message-ID: <202305262138.dYihPSpB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: 33e6f8767e518ec7b352efc051ec00703f828cb9 [2940/9879] MLK-17829 touchscreen: Add synaptics_dsx S3508 i2c touch driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230526/202305262138.dYihPSpB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/33e6f8767e518ec7b352efc051ec00703f828cb9
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout 33e6f8767e518ec7b352efc051ec00703f828cb9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/firmware/imx/ drivers/gpu/drm/imx/ drivers/input/touchscreen/synaptics_dsx/ drivers/media/platform/chips-media/ drivers/mfd/ drivers/spi/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305262138.dYihPSpB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:791:5: warning: no previous prototype for 'tpd_i2c_read_data' [-Wmissing-prototypes]
     791 | int tpd_i2c_read_data(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client,
         |     ^~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:910:5: warning: no previous prototype for 'tpd_i2c_write_data' [-Wmissing-prototypes]
     910 | int tpd_i2c_write_data(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:174:27: warning: 'synaptics_rmi4_suspend' used but never defined
     174 | static int __maybe_unused synaptics_rmi4_suspend(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:176:27: warning: 'synaptics_rmi4_resume' used but never defined
     176 | static int __maybe_unused synaptics_rmi4_resume(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~~~~~~


vim +/synaptics_rmi4_suspend +174 drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c

   172	
   173	
 > 174	static int __maybe_unused synaptics_rmi4_suspend(struct device *dev);
   175	
 > 176	static int __maybe_unused synaptics_rmi4_resume(struct device *dev);
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
