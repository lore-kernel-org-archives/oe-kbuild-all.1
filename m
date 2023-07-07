Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558AB17AD3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 23:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688771418; x=1720307418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=se0DsduSdJtZzyAvVnwqnWBTau2ZERGTLq6YO3AGKIA=;
  b=fUYtb3uNCekL5+i5IMOzXw5B8eq0jKtgQBjg80PHZi+7alP7mGDJMYkk
   XEQ+BUoTi6/W8tGEKOgkPKs/TneTwYyk8+3RLS9kc37xHgW+A364KHhj2
   D4eSukitoAmhd7d/n4teFFE7ljWcjbdml4rnIOJk+COMuQze2nr91rU45
   H5+gKzBwWi2nlT0cLYw+Z/v5jJUTh7mzhiMxGjciAMoio2nU6W3ghki2Q
   FU7qD57fsxk8a1aRbFHcO7dri2HQGaQrsGWLAyHlC/PIH0SS2tNl2LNNd
   nveX4xQ0ZczGxzKm1DVyZBjh7S/+hBZbuEBdpIrHqaqM4Zg+V27da4Qo0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="343586423"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="343586423"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 16:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="785506744"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="785506744"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Jul 2023 16:10:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHuaa-0002Mp-0Z;
	Fri, 07 Jul 2023 23:10:12 +0000
Date: Sat, 8 Jul 2023 07:09:58 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 1/38]
 drivers/net/ethernet/pensando/ionic/ionic_main.c:557:9: warning: 'strncpy'
 output truncated copying 31 bytes from a string of length 39
Message-ID: <202307080701.vKApJh3L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   72c34bd0b2a432506d992bdc1e3a89260461667d
commit: 1f2c0a3e162256e26cf9002c3c45c0d5f19890b3 [1/38] __folio_needs_release
config: alpha-randconfig-r014-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080701.vKApJh3L-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080701.vKApJh3L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080701.vKApJh3L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/pensando/ionic/ionic_main.c: In function 'ionic_identify':
>> drivers/net/ethernet/pensando/ionic/ionic_main.c:557:9: warning: 'strncpy' output truncated copying 31 bytes from a string of length 39 [-Wstringop-truncation]
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
f43a96d91df1a0 Shannon Nelson 2022-10-26  565  	ionic_dev_cmd_identify(idev, IONIC_DEV_IDENTITY_VERSION_2);
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
