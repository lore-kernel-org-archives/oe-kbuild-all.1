Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBC220E1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693588523; x=1725124523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4csUGcMbsbbmEYA9DzzUvDOCzwH3D5xxatGiNqMHsvk=;
  b=UnguNR1JKATfEvLAF54+V9jtdlkpvcufDYYlZMxqXTG/3GDNLYM5+37i
   YOIcTFMgoamg8+1YaCRS4VN5WwaqlF8e1cYJkiiidjVJNDdPqOO26Wn92
   kVpZb/6AFiVJ7ISZHmtYFjl+uakPMnxn7lwNnMW/s70dK2h14jdJ51bol
   6KO4Nrxzzo7dYm372t6rfVJIpd0N7E7zstZKx3/34LafhHGD+RE2pcxlj
   YBdsJaubOHMVAx0oigAHjxNwsg4vXLSeYQGnf9e5mtS363fUuhHbJOcQO
   07QmqnNd8F+MBBk52AZsvhxfTI6Hpn0XLmfXSM/jopYJgJksASMufDsHA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361290894"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="361290894"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 10:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883251212"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="883251212"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2023 10:14:50 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc7jK-0001Vc-2F;
	Fri, 01 Sep 2023 17:14:46 +0000
Date: Sat, 2 Sep 2023 01:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_3 19/19]
 drivers/thermal/mediatek/lvts_thermal.c:1198:13: warning: unused variable
 'irq'
Message-ID: <202309020114.sVLjReEh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_3
head:   cf7ba5ba41f644a2e26648583d3489c3f75245d0
commit: cf7ba5ba41f644a2e26648583d3489c3f75245d0 [19/19] lvts: disable interrupt in driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230902/202309020114.sVLjReEh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020114.sVLjReEh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020114.sVLjReEh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/mediatek/lvts_thermal.c: In function 'lvts_probe':
>> drivers/thermal/mediatek/lvts_thermal.c:1198:13: warning: unused variable 'irq' [-Wunused-variable]
    1198 |         int irq, ret;
         |             ^~~
   drivers/thermal/mediatek/lvts_thermal.c: At top level:
>> drivers/thermal/mediatek/lvts_thermal.c:514:20: warning: 'lvts_irq_handler' defined but not used [-Wunused-function]
     514 | static irqreturn_t lvts_irq_handler(int irq, void *data)
         |                    ^~~~~~~~~~~~~~~~


vim +/irq +1198 drivers/thermal/mediatek/lvts_thermal.c

f5f633b18234ce Balsam CHIHI 2023-02-09  1191  
f5f633b18234ce Balsam CHIHI 2023-02-09  1192  static int lvts_probe(struct platform_device *pdev)
f5f633b18234ce Balsam CHIHI 2023-02-09  1193  {
f5f633b18234ce Balsam CHIHI 2023-02-09  1194  	const struct lvts_data *lvts_data;
f5f633b18234ce Balsam CHIHI 2023-02-09  1195  	struct lvts_domain *lvts_td;
f5f633b18234ce Balsam CHIHI 2023-02-09  1196  	struct device *dev = &pdev->dev;
f5f633b18234ce Balsam CHIHI 2023-02-09  1197  	struct resource *res;
f5f633b18234ce Balsam CHIHI 2023-02-09 @1198  	int irq, ret;
f5f633b18234ce Balsam CHIHI 2023-02-09  1199  

:::::: The code at line 1198 was first introduced by commit
:::::: f5f633b18234cecb0e6ee6e5fbb358807dda15c3 thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver

:::::: TO: Balsam CHIHI <bchihi@baylibre.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
