Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4191F164
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687443590; x=1718979590;
  h=date:from:cc:subject:message-id:mime-version;
  bh=lEFCANJCLCSyMBnMveAmezzyB/W1nXcp4y6e8wmvkkU=;
  b=FlcqSoGWKHsQflSYRLnwRCSRy4sCj8wNH8qMIVbP6oy2almgLOGAO43v
   JRFxNoUoI27o88dlFBGbA+uD2vUZMd2Rh7ExCxIn6da8eTTZqMUaEsTT0
   Dkrqub7ABF308rwtPq12MOSlM6bFNHLoP0KxxKVRpoS0UIbDnwhbsFKE9
   Gq74tFYud2k5bYtGZjlUsgF2+h6C8F1msVsZY05x5OW6y2UXBtyWBBC2/
   DiQD6uni+UPweHmuMqgiOGvA66t+/V/uB1wK9x1e43GYpE3Ks8aOH8Caj
   xVl5ok05QN5bt1rvbgWoMNuqvjXyQX9l+UoGCjM4PqG7QnMV7/QJWO7Zx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="426465482"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="426465482"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 06:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="744594136"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="744594136"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Jun 2023 06:47:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCKew-0007Zb-2A;
	Thu, 22 Jun 2023 13:47:38 +0000
Date: Thu, 22 Jun 2023 21:47:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 6432/7798]
 drivers/net/ethernet/pensando/ionic/ionic_main.c:557:9: warning: 'strncpy'
 output truncated before terminating nul copying 31 bytes from a string of
 the same length
Message-ID: <202306222109.9rRNHeCC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Clark,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   4726bcde59c98fc82bc674eb67a16ccf64347e7c
commit: 443e60197c8ffe05a0313bfef2d7bca7329bfaa3 [6432/7798] 'Linux 6.1.28-rt10'
config: alpha-randconfig-r035-20230622 (https://download.01.org/0day-ci/archive/20230622/202306222109.9rRNHeCC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306222109.9rRNHeCC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306222109.9rRNHeCC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/pensando/ionic/ionic_main.c: In function 'ionic_identify':
>> drivers/net/ethernet/pensando/ionic/ionic_main.c:557:9: warning: 'strncpy' output truncated before terminating nul copying 31 bytes from a string of the same length [-Wstringop-truncation]
     557 |         strncpy(ident->drv.driver_ver_str, UTS_RELEASE,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     558 |                 sizeof(ident->drv.driver_ver_str) - 1);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +557 drivers/net/ethernet/pensando/ionic/ionic_main.c

fbfb8031533c92 Shannon Nelson 2019-09-03  546  
fbfb8031533c92 Shannon Nelson 2019-09-03  547  int ionic_identify(struct ionic *ionic)
fbfb8031533c92 Shannon Nelson 2019-09-03  548  {
fbfb8031533c92 Shannon Nelson 2019-09-03  549  	struct ionic_identity *ident = &ionic->ident;
fbfb8031533c92 Shannon Nelson 2019-09-03  550  	struct ionic_dev *idev = &ionic->idev;
fbfb8031533c92 Shannon Nelson 2019-09-03  551  	size_t sz;
fbfb8031533c92 Shannon Nelson 2019-09-03  552  	int err;
fbfb8031533c92 Shannon Nelson 2019-09-03  553  
fbfb8031533c92 Shannon Nelson 2019-09-03  554  	memset(ident, 0, sizeof(*ident));
fbfb8031533c92 Shannon Nelson 2019-09-03  555  
fbfb8031533c92 Shannon Nelson 2019-09-03  556  	ident->drv.os_type = cpu_to_le32(IONIC_OS_TYPE_LINUX);
1fcbebf115d9ce Shannon Nelson 2020-03-06 @557  	strncpy(ident->drv.driver_ver_str, UTS_RELEASE,
fbfb8031533c92 Shannon Nelson 2019-09-03  558  		sizeof(ident->drv.driver_ver_str) - 1);
fbfb8031533c92 Shannon Nelson 2019-09-03  559  
fbfb8031533c92 Shannon Nelson 2019-09-03  560  	mutex_lock(&ionic->dev_cmd_lock);
fbfb8031533c92 Shannon Nelson 2019-09-03  561  
fbfb8031533c92 Shannon Nelson 2019-09-03  562  	sz = min(sizeof(ident->drv), sizeof(idev->dev_cmd_regs->data));
fbfb8031533c92 Shannon Nelson 2019-09-03  563  	memcpy_toio(&idev->dev_cmd_regs->data, &ident->drv, sz);
fbfb8031533c92 Shannon Nelson 2019-09-03  564  
fbfb8031533c92 Shannon Nelson 2019-09-03  565  	ionic_dev_cmd_identify(idev, IONIC_IDENTITY_VERSION_1);
fbfb8031533c92 Shannon Nelson 2019-09-03  566  	err = ionic_dev_cmd_wait(ionic, DEVCMD_TIMEOUT);
fbfb8031533c92 Shannon Nelson 2019-09-03  567  	if (!err) {
fbfb8031533c92 Shannon Nelson 2019-09-03  568  		sz = min(sizeof(ident->dev), sizeof(idev->dev_cmd_regs->data));
fbfb8031533c92 Shannon Nelson 2019-09-03  569  		memcpy_fromio(&ident->dev, &idev->dev_cmd_regs->data, sz);
fbfb8031533c92 Shannon Nelson 2019-09-03  570  	}
fbfb8031533c92 Shannon Nelson 2019-09-03  571  	mutex_unlock(&ionic->dev_cmd_lock);
fbfb8031533c92 Shannon Nelson 2019-09-03  572  
a21b5d49e77a2e Shannon Nelson 2020-10-01  573  	if (err) {
36b20b7fb1c3cb Shannon Nelson 2021-10-01  574  		dev_err(ionic->dev, "Cannot identify ionic: %d\n", err);
a21b5d49e77a2e Shannon Nelson 2020-10-01  575  		goto err_out;
a21b5d49e77a2e Shannon Nelson 2020-10-01  576  	}
fbfb8031533c92 Shannon Nelson 2019-09-03  577  
36b20b7fb1c3cb Shannon Nelson 2021-10-01  578  	if (isprint(idev->dev_info.fw_version[0]) &&
36b20b7fb1c3cb Shannon Nelson 2021-10-01  579  	    isascii(idev->dev_info.fw_version[0]))
36b20b7fb1c3cb Shannon Nelson 2021-10-01  580  		dev_info(ionic->dev, "FW: %.*s\n",
36b20b7fb1c3cb Shannon Nelson 2021-10-01  581  			 (int)(sizeof(idev->dev_info.fw_version) - 1),
36b20b7fb1c3cb Shannon Nelson 2021-10-01  582  			 idev->dev_info.fw_version);
36b20b7fb1c3cb Shannon Nelson 2021-10-01  583  	else
36b20b7fb1c3cb Shannon Nelson 2021-10-01  584  		dev_info(ionic->dev, "FW: (invalid string) 0x%02x 0x%02x 0x%02x 0x%02x ...\n",
36b20b7fb1c3cb Shannon Nelson 2021-10-01  585  			 (u8)idev->dev_info.fw_version[0],
36b20b7fb1c3cb Shannon Nelson 2021-10-01  586  			 (u8)idev->dev_info.fw_version[1],
36b20b7fb1c3cb Shannon Nelson 2021-10-01  587  			 (u8)idev->dev_info.fw_version[2],
36b20b7fb1c3cb Shannon Nelson 2021-10-01  588  			 (u8)idev->dev_info.fw_version[3]);
36b20b7fb1c3cb Shannon Nelson 2021-10-01  589  
a21b5d49e77a2e Shannon Nelson 2020-10-01  590  	err = ionic_lif_identify(ionic, IONIC_LIF_TYPE_CLASSIC,
a21b5d49e77a2e Shannon Nelson 2020-10-01  591  				 &ionic->ident.lif);
a21b5d49e77a2e Shannon Nelson 2020-10-01  592  	if (err) {
a21b5d49e77a2e Shannon Nelson 2020-10-01  593  		dev_err(ionic->dev, "Cannot identify LIFs: %d\n", err);
a21b5d49e77a2e Shannon Nelson 2020-10-01  594  		goto err_out;
a21b5d49e77a2e Shannon Nelson 2020-10-01  595  	}
fbfb8031533c92 Shannon Nelson 2019-09-03  596  
fbfb8031533c92 Shannon Nelson 2019-09-03  597  	return 0;
fbfb8031533c92 Shannon Nelson 2019-09-03  598  
a21b5d49e77a2e Shannon Nelson 2020-10-01  599  err_out:
fbfb8031533c92 Shannon Nelson 2019-09-03  600  	return err;
fbfb8031533c92 Shannon Nelson 2019-09-03  601  }
fbfb8031533c92 Shannon Nelson 2019-09-03  602  

:::::: The code at line 557 was first introduced by commit
:::::: 1fcbebf115d9ce077c2ba5ecfb521cc1eedcb467 ionic: drop ethtool driver version

:::::: TO: Shannon Nelson <snelson@pensando.io>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
