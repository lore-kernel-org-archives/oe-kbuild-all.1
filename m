Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C60612B99
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6Eozvk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697195540; x=1728731540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VTHn64YEiNbJn84hWhvC9dWpzIyrVNZTT9tmRW52IYk=;
  b=E6Eozvk2Fe8jgtZxhoZTX3ajO6JF3/1vj/bnYQVDUzyl7nbDKLsbkquT
   YUsYfYfMEKbumrKhrxVaDs5lQvP3VrkgHj8x7ZrU2P3Gyi77aEqQNyJ+J
   JYKGbW2WUn9EUtdypmPqSgpuY8wtptpV3SPvtwlFzxvr2hLXAggqXN8Ax
   hfEX07kzYHwcl7YwVHEgj80oO73p3nQe/9l6AhqqL/rzNo8ebAdRD242z
   uGyMKc/CTiBzYWBrQl5iE/7SJD11vi7TMX/BRhfoDrq/cMiPm6p7Lq6oG
   Bh9cgObo8nY3ernxGk8loH7DKrlzomnha07m9052gR87zxlX9HGsAVy0t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="471392133"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="471392133"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="871032997"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="871032997"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 04:12:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrG5T-0004fZ-34;
	Fri, 13 Oct 2023 11:12:11 +0000
Date: Fri, 13 Oct 2023 19:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4835/15768]
 drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:1459:12: warning:
 'hdmirx_runtime_resume' defined but not used
Message-ID: <202310131849.DUoPOw3X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: eb44a1a6115684ddd4f8001ff5b6156f18c296aa [4835/15768] Merge branch 'display/next' into next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310131849.DUoPOw3X-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131849.DUoPOw3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131849.DUoPOw3X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c: In function 'tmdsmon_fn':
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:904:58: warning: variable 'events' set but not used [-Wunused-but-set-variable]
     904 |                                                 uint32_t events;
         |                                                          ^~~~~~
   drivers/staging/media/imx/hdmirx/cdns-hdmirx.c: At top level:
>> drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:1459:12: warning: 'hdmirx_runtime_resume' defined but not used [-Wunused-function]
    1459 | static int hdmirx_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/hdmirx/cdns-hdmirx.c:1444:12: warning: 'hdmirx_runtime_suspend' defined but not used [-Wunused-function]
    1444 | static int hdmirx_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/hdmirx_runtime_resume +1459 drivers/staging/media/imx/hdmirx/cdns-hdmirx.c

5fe415c53f8c37 Sandor Yu 2020-12-09  1443  
5fe415c53f8c37 Sandor Yu 2020-12-09 @1444  static int hdmirx_runtime_suspend(struct device *dev)
5fe415c53f8c37 Sandor Yu 2020-12-09  1445  {
5fe415c53f8c37 Sandor Yu 2020-12-09  1446  	struct cdns_hdmirx_device *hdmirx = dev_get_drvdata(dev);
5fe415c53f8c37 Sandor Yu 2020-12-09  1447  
5fe415c53f8c37 Sandor Yu 2020-12-09  1448  	if (hdmirx->flags & HDMIRX_RUNTIME_SUSPEND)
5fe415c53f8c37 Sandor Yu 2020-12-09  1449  		return 0;
5fe415c53f8c37 Sandor Yu 2020-12-09  1450  
5fe415c53f8c37 Sandor Yu 2020-12-09  1451  	if (hdmirx->flags & HDMIRX_PM_POWERED) {
5fe415c53f8c37 Sandor Yu 2020-12-09  1452  		hdmirx_clock_disable(hdmirx);
5fe415c53f8c37 Sandor Yu 2020-12-09  1453  		hdmirx->flags |= HDMIRX_RUNTIME_SUSPEND;
5fe415c53f8c37 Sandor Yu 2020-12-09  1454  		hdmirx->flags &= ~HDMIRX_PM_POWERED;
5fe415c53f8c37 Sandor Yu 2020-12-09  1455  	}
5fe415c53f8c37 Sandor Yu 2020-12-09  1456  	return 0;
5fe415c53f8c37 Sandor Yu 2020-12-09  1457  }
5fe415c53f8c37 Sandor Yu 2020-12-09  1458  
5fe415c53f8c37 Sandor Yu 2020-12-09 @1459  static int hdmirx_runtime_resume(struct device *dev)
5fe415c53f8c37 Sandor Yu 2020-12-09  1460  {
5fe415c53f8c37 Sandor Yu 2020-12-09  1461  	struct cdns_hdmirx_device *hdmirx = dev_get_drvdata(dev);
5fe415c53f8c37 Sandor Yu 2020-12-09  1462  
5fe415c53f8c37 Sandor Yu 2020-12-09  1463  	if (hdmirx->flags & HDMIRX_PM_POWERED)
5fe415c53f8c37 Sandor Yu 2020-12-09  1464  		return 0;
5fe415c53f8c37 Sandor Yu 2020-12-09  1465  
5fe415c53f8c37 Sandor Yu 2020-12-09  1466  	if (hdmirx->flags & HDMIRX_RUNTIME_SUSPEND) {
5fe415c53f8c37 Sandor Yu 2020-12-09  1467  		hdmirx_clock_enable(hdmirx);
5fe415c53f8c37 Sandor Yu 2020-12-09  1468  		hdmirx->flags |= HDMIRX_PM_POWERED;
5fe415c53f8c37 Sandor Yu 2020-12-09  1469  		hdmirx->flags &= ~HDMIRX_RUNTIME_SUSPEND;
5fe415c53f8c37 Sandor Yu 2020-12-09  1470  	}
5fe415c53f8c37 Sandor Yu 2020-12-09  1471  	return 0;
5fe415c53f8c37 Sandor Yu 2020-12-09  1472  }
5fe415c53f8c37 Sandor Yu 2020-12-09  1473  

:::::: The code at line 1459 was first introduced by commit
:::::: 5fe415c53f8c3748600505f8fef001b37d516d57 MLK-24081-06: staging: media: imx: Add hdmi rx driver

:::::: TO: Sandor Yu <Sandor.yu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
