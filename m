Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE2562B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 00:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693960543; x=1725496543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kF0obNDd3heXxseyCQwV3au5Yp8f/BVnGeqqPM8R+rc=;
  b=C2bL/FMeqUvMXR2xNlHr0qSUPDkmGgXhMj8p2l/54XdRKDBJRA6ZQD4R
   Zcqttqm4pNC5QkQ0xunmZybqDECBw1eTHHhmpzQ36Ab1KLnT1GeTFNJak
   4pSVeDGF8w0oF1nrwgKJjIaLoCvxgJby1FU0YYHTQ91M1UVu4KkoO4Sl1
   hfPkc3WFwSBEwAdUNhWhrqyKf8R2eTj7ptIQHkYCsTegic9WetMbKZFGn
   8CX+RXxlsd73CAKnd5MBU7A1w9sHpIZzsY/BZcpNXKsHfEBxC4QzislT3
   UkfHQ5efnGXZvQGRdMZc6jUXukjMjFbVAR0fKEV1A8VnF5w2oOHmu8sd6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="375836319"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="375836319"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 17:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="718038681"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="718038681"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Sep 2023 17:35:41 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdgW5-0002Gm-3B;
	Wed, 06 Sep 2023 00:35:36 +0000
Date: Wed, 6 Sep 2023 08:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:large-block-nobdev-20230825 33/33]
 drivers/net/ethernet/pensando/ionic/ionic_main.c:557:9: warning: 'strncpy'
 output truncated copying 31 bytes from a string of length 38
Message-ID: <202309060822.wzvKnPXD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-nobdev-20230825
head:   4a707e63025c7be7985c1c17198f6f8a9d2efcc1
commit: 4a707e63025c7be7985c1c17198f6f8a9d2efcc1 [33/33] large-block-nobdev-20230825
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230906/202309060822.wzvKnPXD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060822.wzvKnPXD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060822.wzvKnPXD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/pensando/ionic/ionic_main.c: In function 'ionic_identify':
>> drivers/net/ethernet/pensando/ionic/ionic_main.c:557:9: warning: 'strncpy' output truncated copying 31 bytes from a string of length 38 [-Wstringop-truncation]
     557 |         strncpy(ident->drv.driver_ver_str, UTS_RELEASE,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     558 |                 sizeof(ident->drv.driver_ver_str) - 1);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +557 drivers/net/ethernet/pensando/ionic/ionic_main.c

fbfb8031533c924 Shannon Nelson 2019-09-03  546  
fbfb8031533c924 Shannon Nelson 2019-09-03  547  int ionic_identify(struct ionic *ionic)
fbfb8031533c924 Shannon Nelson 2019-09-03  548  {
fbfb8031533c924 Shannon Nelson 2019-09-03  549  	struct ionic_identity *ident = &ionic->ident;
fbfb8031533c924 Shannon Nelson 2019-09-03  550  	struct ionic_dev *idev = &ionic->idev;
fbfb8031533c924 Shannon Nelson 2019-09-03  551  	size_t sz;
fbfb8031533c924 Shannon Nelson 2019-09-03  552  	int err;
fbfb8031533c924 Shannon Nelson 2019-09-03  553  
fbfb8031533c924 Shannon Nelson 2019-09-03  554  	memset(ident, 0, sizeof(*ident));
fbfb8031533c924 Shannon Nelson 2019-09-03  555  
fbfb8031533c924 Shannon Nelson 2019-09-03  556  	ident->drv.os_type = cpu_to_le32(IONIC_OS_TYPE_LINUX);
1fcbebf115d9ce0 Shannon Nelson 2020-03-06 @557  	strncpy(ident->drv.driver_ver_str, UTS_RELEASE,
fbfb8031533c924 Shannon Nelson 2019-09-03  558  		sizeof(ident->drv.driver_ver_str) - 1);
fbfb8031533c924 Shannon Nelson 2019-09-03  559  
fbfb8031533c924 Shannon Nelson 2019-09-03  560  	mutex_lock(&ionic->dev_cmd_lock);
fbfb8031533c924 Shannon Nelson 2019-09-03  561  
fbfb8031533c924 Shannon Nelson 2019-09-03  562  	sz = min(sizeof(ident->drv), sizeof(idev->dev_cmd_regs->data));
fbfb8031533c924 Shannon Nelson 2019-09-03  563  	memcpy_toio(&idev->dev_cmd_regs->data, &ident->drv, sz);
fbfb8031533c924 Shannon Nelson 2019-09-03  564  
f43a96d91df1a09 Shannon Nelson 2022-10-26  565  	ionic_dev_cmd_identify(idev, IONIC_DEV_IDENTITY_VERSION_2);
fbfb8031533c924 Shannon Nelson 2019-09-03  566  	err = ionic_dev_cmd_wait(ionic, DEVCMD_TIMEOUT);
fbfb8031533c924 Shannon Nelson 2019-09-03  567  	if (!err) {
fbfb8031533c924 Shannon Nelson 2019-09-03  568  		sz = min(sizeof(ident->dev), sizeof(idev->dev_cmd_regs->data));
fbfb8031533c924 Shannon Nelson 2019-09-03  569  		memcpy_fromio(&ident->dev, &idev->dev_cmd_regs->data, sz);
fbfb8031533c924 Shannon Nelson 2019-09-03  570  	}
fbfb8031533c924 Shannon Nelson 2019-09-03  571  	mutex_unlock(&ionic->dev_cmd_lock);
fbfb8031533c924 Shannon Nelson 2019-09-03  572  
a21b5d49e77a2ec Shannon Nelson 2020-10-01  573  	if (err) {
36b20b7fb1c3cba Shannon Nelson 2021-10-01  574  		dev_err(ionic->dev, "Cannot identify ionic: %d\n", err);
a21b5d49e77a2ec Shannon Nelson 2020-10-01  575  		goto err_out;
a21b5d49e77a2ec Shannon Nelson 2020-10-01  576  	}
fbfb8031533c924 Shannon Nelson 2019-09-03  577  
36b20b7fb1c3cba Shannon Nelson 2021-10-01  578  	if (isprint(idev->dev_info.fw_version[0]) &&
36b20b7fb1c3cba Shannon Nelson 2021-10-01  579  	    isascii(idev->dev_info.fw_version[0]))
36b20b7fb1c3cba Shannon Nelson 2021-10-01  580  		dev_info(ionic->dev, "FW: %.*s\n",
36b20b7fb1c3cba Shannon Nelson 2021-10-01  581  			 (int)(sizeof(idev->dev_info.fw_version) - 1),
36b20b7fb1c3cba Shannon Nelson 2021-10-01  582  			 idev->dev_info.fw_version);
36b20b7fb1c3cba Shannon Nelson 2021-10-01  583  	else
36b20b7fb1c3cba Shannon Nelson 2021-10-01  584  		dev_info(ionic->dev, "FW: (invalid string) 0x%02x 0x%02x 0x%02x 0x%02x ...\n",
36b20b7fb1c3cba Shannon Nelson 2021-10-01  585  			 (u8)idev->dev_info.fw_version[0],
36b20b7fb1c3cba Shannon Nelson 2021-10-01  586  			 (u8)idev->dev_info.fw_version[1],
36b20b7fb1c3cba Shannon Nelson 2021-10-01  587  			 (u8)idev->dev_info.fw_version[2],
36b20b7fb1c3cba Shannon Nelson 2021-10-01  588  			 (u8)idev->dev_info.fw_version[3]);
36b20b7fb1c3cba Shannon Nelson 2021-10-01  589  
a21b5d49e77a2ec Shannon Nelson 2020-10-01  590  	err = ionic_lif_identify(ionic, IONIC_LIF_TYPE_CLASSIC,
a21b5d49e77a2ec Shannon Nelson 2020-10-01  591  				 &ionic->ident.lif);
a21b5d49e77a2ec Shannon Nelson 2020-10-01  592  	if (err) {
a21b5d49e77a2ec Shannon Nelson 2020-10-01  593  		dev_err(ionic->dev, "Cannot identify LIFs: %d\n", err);
a21b5d49e77a2ec Shannon Nelson 2020-10-01  594  		goto err_out;
a21b5d49e77a2ec Shannon Nelson 2020-10-01  595  	}
fbfb8031533c924 Shannon Nelson 2019-09-03  596  
fbfb8031533c924 Shannon Nelson 2019-09-03  597  	return 0;
fbfb8031533c924 Shannon Nelson 2019-09-03  598  
a21b5d49e77a2ec Shannon Nelson 2020-10-01  599  err_out:
fbfb8031533c924 Shannon Nelson 2019-09-03  600  	return err;
fbfb8031533c924 Shannon Nelson 2019-09-03  601  }
fbfb8031533c924 Shannon Nelson 2019-09-03  602  

:::::: The code at line 557 was first introduced by commit
:::::: 1fcbebf115d9ce077c2ba5ecfb521cc1eedcb467 ionic: drop ethtool driver version

:::::: TO: Shannon Nelson <snelson@pensando.io>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
