Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7C81862
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Apr 2026 04:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777089794; cv=none; b=B2ne6LBpKUf7S1mhaCzB8IeNrwnOLa+RQfJHCI328oTI9R2RvmSFm/fCiRZqo0aH+gAQXjzUC5zyGWWB12gjQl1ZICSMrJh4J4VzjZSGQpp5HPIXWb0Nj91tmvwAEOUrmomLABbfQsQNjrQ0wd75BW3hIQEez/mCCo6Lf6QA+NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777089794; c=relaxed/simple;
	bh=r9VrwRm+hWAu2+G/xnauiKsrtiemeuinNcyzkT2EZDU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ru/pzQR1b/Im4Q34KY2+79/1ThHU1bUk8A92kXx4o/Re1VT0NJ2VqvIlXkO+T1UKCHMCv2V0SVjnZhWhxPcJ0WB9qRo/od7yzv4RKLGcJ9fqX/4DflmKy/ZC+F4qKpV2gm4ShlJtYd1Uri8FShBSq9eQUs6YtLg40qiHH72wloI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPtymWvS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPtymWvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777089792; x=1808625792;
  h=date:from:to:cc:subject:message-id;
  bh=r9VrwRm+hWAu2+G/xnauiKsrtiemeuinNcyzkT2EZDU=;
  b=UPtymWvSo4vrDpE1M2nt0d/3Vhk+HSH0VQLeNL1TtdhhzeP3jo2Rs+No
   rwpQI3HIaZ2qjZdalT890eV31KV9Z4I9UghRJeDqQ748z2adPBoB+nPsM
   /cKdrcvoj56m471yfMX8/x1rTSm3ClYsxtxb1A+t2cvYyGAqLBWLPp7N3
   TNehDMzFI20e8E1zkZT2miVo8piPX6mr/5/pcfYF4LEkqhSIzdsH/vWs3
   bF2PSySCrBLjJlLcGydpgZa+FdHdhU1zBRMzF4aHe8hhUxmBHbCDGFZIV
   nUBaxi+gZv5/DU9rHch07WVtYaeDSjjAe51H8nolnEFHQJf435JdwByK8
   Q==;
X-CSE-ConnectionGUID: F22GYggoRta0pvvanb7Hgg==
X-CSE-MsgGUID: bzwRFAorQieSN0Zr012Bng==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="89452417"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="89452417"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 21:03:11 -0700
X-CSE-ConnectionGUID: ZoDTj88cQTqrdnzRAX753Q==
X-CSE-MsgGUID: iJuhwX31SAOk3v9T3Zc2lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="232260679"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Apr 2026 21:03:10 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGUEV-000000006QH-3xGf;
	Sat, 25 Apr 2026 04:03:07 +0000
Date: Sat, 25 Apr 2026 12:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 79/79]
 drivers/soc/mediatek/apusys/power/mtk_aputop_drv.c:45:12: warning:
 'aputop_pwr_off_rpm_cb' defined but not used
Message-ID: <202604251116.oJRBeEbm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   3730da93290a5c1ed5e0d04b0dd5247e9a2e638c
commit: 537ddfa311d27daf0946b09f715747700a0b8671 [79/79] CHROMIUM: mediatek: NPU power control modification
config: arm-randconfig-r054-20260425 (https://download.01.org/0day-ci/archive/20260425/202604251116.oJRBeEbm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260425/202604251116.oJRBeEbm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604251116.oJRBeEbm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/apusys/power/mtk_aputop_drv.c:45:12: warning: 'aputop_pwr_off_rpm_cb' defined but not used [-Wunused-function]
      45 | static int aputop_pwr_off_rpm_cb(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/apusys/power/mtk_aputop_drv.c:36:12: warning: 'aputop_pwr_on_rpm_cb' defined but not used [-Wunused-function]
      36 | static int aputop_pwr_on_rpm_cb(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/aputop_pwr_off_rpm_cb +45 drivers/soc/mediatek/apusys/power/mtk_aputop_drv.c

    35	
  > 36	static int aputop_pwr_on_rpm_cb(struct device *dev)
    37	{
    38		int ret = 0;
    39		const struct apupwr_plat_data *pwr_data = of_device_get_match_data(dev);
    40	
    41		ret =  pwr_data->plat_aputop_on(dev);
    42		return ret;
    43	}
    44	
  > 45	static int aputop_pwr_off_rpm_cb(struct device *dev)
    46	{
    47		int ret = 0;
    48		const struct apupwr_plat_data *pwr_data = of_device_get_match_data(dev);
    49	
    50		ret = pwr_data->plat_aputop_off(dev);
    51		return ret;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
