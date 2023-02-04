Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1753D7C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 23:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675552026; x=1707088026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JKlIFQWfs76p7Fuk6JroPAS6Agyhz5trBN9l5aTlKt4=;
  b=HuSNcMu6QiwkzEpsgAHLN3SBHvpAo8pKLHSHP9QFtpFtkMEUzLRWY1cp
   DEG8CMUMBcdfqxJnlciMnKJg73Bvc2AryeiDfX9DgD5oTbHv5bx59Rgq2
   uYnOQ5sO1/Tpp2QkT7yD9oD832zAvxpHOoz3XCKWW9s8cy2x8JR3UyP9j
   2NU2fXwyA0I4/o01zI8apVIand1Ydqmoju1s0665QrCehgf9cPVLFfA9u
   L2iPIEiFd669crebJ9CBwtfhBIJW+5d9qAMToG+f98E1FvGJA/U/akcWh
   vkd0NpC3QN8DFFCB/3Bo4jNnKhN/aBw5V2hgSPnYmAOiUwa+PTon9S71y
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="329013538"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="329013538"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 15:07:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="666106235"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="666106235"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Feb 2023 15:07:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pORcY-0001Za-2h;
	Sat, 04 Feb 2023 23:06:58 +0000
Date: Sun, 5 Feb 2023 07:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 4361/20209]
 drivers/i2c/busses/xen-i2cfront.c:148:5: warning: no previous prototype for
 'i2cfront_xfer'
Message-ID: <202302050714.U6KFkt6u-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: 278ca911463717ef3565b97b4e515c0269d6d22b [4361/20209] LF-191-2 i2c: introduce xen i2c paravirtualization driver
config: x86_64-rhel-8.3-syz (https://download.01.org/0day-ci/archive/20230205/202302050714.U6KFkt6u-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/278ca911463717ef3565b97b4e515c0269d6d22b
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout 278ca911463717ef3565b97b4e515c0269d6d22b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/xen-i2cfront.c:148:5: warning: no previous prototype for 'i2cfront_xfer' [-Wmissing-prototypes]
     148 | int i2cfront_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
         |     ^~~~~~~~~~~~~


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
