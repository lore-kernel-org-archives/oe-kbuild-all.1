Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7391512B86
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 15:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693495162; x=1725031162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YnKohp7zOnXg1MFFijO4yghnzjIVzYBZ9F1fHYA+e4Q=;
  b=nqegjKmSactbogbkAYUowqebaoAXEvGE4tvJUX7NeUkw+VVuAhXtLIhg
   N+4Opg/8MI4srFASHnhsnP1/hByNmAaWS5a/yG2wVY540kZ/nTjmzjEN5
   bGm8Cor3uG/GYGtVF49elNHnM3rKDZ1zTnXz3PYGVUUS1RCDKVqCp7mE2
   3UjahUBJ5NN46LkQNMtBDTxue2K9+xVlsApXGiSdWVYje2n5fMs298RwC
   YDc8J+iBDru1//tmkHbN9WdYanhXNJ1a/S1qFrPL/WXS8pWlRuXfEY0Lq
   kmCEyTsDX0Z0aTvg9uCgy7o783uWp1AkDubH5MpknkS+HOztRx5eqJj78
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375916164"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="375916164"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 08:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="986276139"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="986276139"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2023 08:17:54 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbjQe-0000He-0k;
	Thu, 31 Aug 2023 15:17:52 +0000
Date: Thu, 31 Aug 2023 23:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 4361/24603]
 drivers/i2c/busses/xen-i2cfront.c:148:5: warning: no previous declaration
 for 'i2cfront_xfer'
Message-ID: <202308312311.h0mlfEta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 278ca911463717ef3565b97b4e515c0269d6d22b [4361/24603] LF-191-2 i2c: introduce xen i2c paravirtualization driver
config: x86_64-randconfig-071-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312311.h0mlfEta-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312311.h0mlfEta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312311.h0mlfEta-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/xen-i2cfront.c:148:5: warning: no previous declaration for 'i2cfront_xfer' [-Wmissing-declarations]
    int i2cfront_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
        ^~~~~~~~~~~~~


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
