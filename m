Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72213CA58
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 13:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693055276; x=1724591276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aXGpKoTb6r32UkIxJtyvyBDHkQBstHeHh3ycXoOxLWo=;
  b=gUttiYApEP0zF/+xQgkCLykCgCOrlcm9wnhsshBjuRnoMWzWLDWjJWyX
   l57038A8T/QNvOOss5dD1TCSCyF/UvcCJzM8g+8ujwFV1OEOdQFkqc/ww
   Jwbg/7QpyCKjI29BnwkmJGGhe6twCfQXG52vl7KK6pm26q1WJaXzB+RPy
   WX+vSgHgSKRG/ViE7YI878+XwPFCodB0VceaN92HFs3nlQwL7Be5TSj+4
   vWsLVhW8tYlbDvjbsjBYqrpznPhWeVoDYLRJCzzciXugzSFKoWekwB21p
   +c2DPijXMl1CfdtViKs5AZyxjhDP9KmmA2ed8Dgx1VXgPvdSmAo3vYPOS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="374844334"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="374844334"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 06:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="852281514"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="852281514"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 26 Aug 2023 06:07:54 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZt17-0004jH-2J;
	Sat, 26 Aug 2023 13:07:53 +0000
Date: Sat, 26 Aug 2023 21:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/638 3816/12469]
 drivers/spi/spi-nxp-fspi.c:1295:12: warning: 'nxp_fspi_resume' defined but
 not used
Message-ID: <202308262118.4yy7jAlm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/638
head:   3f1f2ea7295505de340ba4089817ae1021920928
commit: e0b338dc8b0a33b70718899aa798738d157d0259 [3816/12469] spi: spi-nxp-fspi: enable runtime pm for fspi
config: i386-randconfig-r034-20230718 (https://download.01.org/0day-ci/archive/20230826/202308262118.4yy7jAlm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308262118.4yy7jAlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308262118.4yy7jAlm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-nxp-fspi.c:1295:12: warning: 'nxp_fspi_resume' defined but not used [-Wunused-function]
    1295 | static int nxp_fspi_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~
>> drivers/spi/spi-nxp-fspi.c:1282:12: warning: 'nxp_fspi_suspend' defined but not used [-Wunused-function]
    1282 | static int nxp_fspi_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~


vim +/nxp_fspi_resume +1295 drivers/spi/spi-nxp-fspi.c

  1281	
> 1282	static int nxp_fspi_suspend(struct device *dev)
  1283	{
  1284		int ret;
  1285	
  1286		ret = pinctrl_pm_select_sleep_state(dev);
  1287		if (ret) {
  1288			dev_err(dev, "select flexspi sleep pinctrl failed!\n");
  1289			return ret;
  1290		}
  1291	
  1292		return pm_runtime_force_suspend(dev);
  1293	}
  1294	
> 1295	static int nxp_fspi_resume(struct device *dev)
  1296	{
  1297		int ret;
  1298	
  1299		ret = pm_runtime_force_resume(dev);
  1300		if (ret)
  1301			return ret;
  1302	
  1303		ret = pinctrl_pm_select_default_state(dev);
  1304		if (ret)
  1305			dev_err(dev, "select flexspi default pinctrl failed!\n");
  1306	
  1307		return ret;
  1308	}
  1309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
