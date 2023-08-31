Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA86C257D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 14:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693492436; x=1725028436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q21GvmGjAWkqEjXKgbnRm42zuowxgp9S/CdBsFKsGNA=;
  b=Iti3TcvCYvjbHqe0fAGhlTnA8oyK6fO613Gvt4WOREJlEdKbTbD6lk4p
   /fb3FLWGMEqRC8+DA34PThwnK+Tw8pta/mVXVXoYIMZut3lhjPorhoFqz
   Z4sDGjKR4ign8f0M/jQiPBHscDp6hHSimpYOeoDCCiVGSUvISN1rGZTGU
   8kK5J3asKs9ArHpD4Mf6DmQ7Mux3oWMn+7iG35v27G7D5CiG1rPa7Sr/n
   ZePFGvaonT1eWlJ/YHYE75CYzhEKvXGPzSO+ExVMfCrby1+5SBU6QX/My
   1PQIaeQoaNLf8W9EsTmB7Tb192ho20HfYLzWAKEsqUackxjeUcahBAKkL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356274412"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="356274412"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:33:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854308003"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="854308003"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2023 07:33:52 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbik2-0000F5-1r;
	Thu, 31 Aug 2023 14:33:50 +0000
Date: Thu, 31 Aug 2023 22:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 4361/24603]
 drivers/i2c/busses/xen-i2cfront.c:148:5: warning: no previous prototype for
 function 'i2cfront_xfer'
Message-ID: <202308312218.flSXKSw8-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 278ca911463717ef3565b97b4e515c0269d6d22b [4361/24603] LF-191-2 i2c: introduce xen i2c paravirtualization driver
config: x86_64-randconfig-r016-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312218.flSXKSw8-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312218.flSXKSw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312218.flSXKSw8-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
