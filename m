Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC51815C7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 02:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675565047; x=1707101047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wSj82pyuoZ/zQmLHV3D9sZyczLrCmUoogY4qjnjfdao=;
  b=KfxJTolAhGh0791fCaDbQCgMJ7dSsa7+7N2eS2eZZ2S4/YnK5CGcMyHM
   L5v1s9n085Yaw9aVqqDTvUFaqgqaJSTNhY5igd7psVpWJq4tlwCWAmGR3
   qVQ9v/ITINQT1+rDxC5gdYhAuCeRIIoQ15f/8L3Vkb0QGlYOrptVeZKIv
   77Ojmoc1u8O+mi5J/NT8pkBlna+8UQFzYIc8Nh8OrtXPedxIXxP6F3++z
   LXVMkctYL23J0T8riCT8+v8dG5hMfyDTx5rlPaQi9O4IT4TZC9cUZzvAt
   XBSibOsFQzxPfFWJe8XT6Lx/722jAAJXM9OJt/FIBt0T3BcGqmO1poS3A
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="326704894"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="326704894"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 18:44:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="790093346"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="790093346"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Feb 2023 18:44:05 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOV0f-0001gQ-0a;
	Sun, 05 Feb 2023 02:44:05 +0000
Date: Sun, 5 Feb 2023 10:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 4361/20208]
 drivers/i2c/busses/xen-i2cfront.c:148:5: warning: no previous prototype for
 function 'i2cfront_xfer'
Message-ID: <202302051044.3BU7fyjK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 278ca911463717ef3565b97b4e515c0269d6d22b [4361/20208] LF-191-2 i2c: introduce xen i2c paravirtualization driver
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230205/202302051044.3BU7fyjK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/278ca911463717ef3565b97b4e515c0269d6d22b
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 278ca911463717ef3565b97b4e515c0269d6d22b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/xen-i2cfront.c:148:5: warning: no previous prototype for function 'i2cfront_xfer' [-Wmissing-prototypes]
   int i2cfront_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
       ^
   drivers/i2c/busses/xen-i2cfront.c:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int i2cfront_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
   ^
   static 
   1 warning generated.


vim +/i2cfront_xfer +148 drivers/i2c/busses/xen-i2cfront.c

   147	
 > 148	int i2cfront_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
   149	{
   150		struct i2cfront_info *info = i2c_get_adapdata(adapter);
   151		int ret, i;
   152	
   153		if (!info || !info->i2cdev) {
   154			dev_err(&adapter->dev, "Not initialized\n");
   155			return -EIO;
   156		}
   157	
   158		if (info->i2cdev->state != XenbusStateConnected) {
   159			dev_err(&adapter->dev, "Not connected\n");
   160			return -EIO;
   161		}
   162	
   163		for (i = 0; i < num; i++) {
   164			if (msgs[i].flags & I2C_M_RD) {
   165				ret = i2cfront_do_req(adapter, &msgs[i], 1);
   166			} else if ((i + 1 < num) && (msgs[i + 1].flags & I2C_M_RD) &&
   167				(msgs[i].addr == msgs[i + 1].addr)) {
   168				ret = i2cfront_do_req(adapter, &msgs[i], 2);
   169				i++;
   170			} else {
   171				ret = i2cfront_do_req(adapter, &msgs[i], 1);
   172			}
   173	
   174			if (ret < 0)
   175				goto err;
   176		}
   177	err:
   178		return (ret < 0) ? ret : num;
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
