Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DFE17591
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 03:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713758331; cv=none; b=AgIlSrglBVDFEYZngNtxWTuXxGZ05PV2AQFP493m6TsVUWoCHHCk58PETaQsfvATeymhhywaul5CNT90qhqcCeo749GmIVx9HEDSmuAc/abmDR5zSQ67sNs1LYnZZqxma8iiWGO5zQq/TNy5T7595m29oj0h8jfQBKUC9q2Z+Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713758331; c=relaxed/simple;
	bh=mKv3gF66SBz/JuPhITA5Jr59fDeXEpqKR8ucTm2508k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X0wO2bzy8shoPrcpy6mABDIeXd7rY0NVs1BU667zC0rlC3p/ngLEIxx9xKYWjaOX8RPSUmAweioo3LfaZwBbKgS2DnX4o3a5pU5V60Zy0Cko6na7nb8Ogc8smNYeOuhHgrNud0YoIH6QWAovDITGo+bSFhXTKzavEKcJWf0wVFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDLpl115; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDLpl115"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713758330; x=1745294330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mKv3gF66SBz/JuPhITA5Jr59fDeXEpqKR8ucTm2508k=;
  b=ZDLpl115TvwC2TcygmfmI1CU9A77xsGbXKCCj92sd/rLfwJYpYOttExv
   A8ZSI0DMCe9ucLJxrf8Di+DojL1rQeTLrgY61/E4nVx4X9fl0PJWz1eTd
   2KMSmVQsMk/b8tUECLFX2KvJgA7zySbiKe5SH0Ru0tzodLDP/9TQzvdsk
   a5toWsieOgkelzbaBmGdyD1CegTAQh4MqFyUtrcsdrxItJrqnUAFCW9mL
   n+tauWs6nm4Y4O7MlZPTsfIemIep+BAdbXD7+MjwJKm60MNOM7+FdaV79
   UjdwExq/6VtC1SZH4VGEQOAYhVsybbQVACOHb5804HHt4NCzlwpHnl0yF
   A==;
X-CSE-ConnectionGUID: OctzBl5aRZWz0m9yGtFMgg==
X-CSE-MsgGUID: NgfS2YNaTRSXFSsCbNx+Yw==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9434723"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9434723"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 20:58:49 -0700
X-CSE-ConnectionGUID: TnIZ/X5BS1yZU6IG34soxQ==
X-CSE-MsgGUID: /i78PRu8SVWIkEUmN5MxhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="28396738"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Apr 2024 20:58:48 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rykpK-000CIQ-0c;
	Mon, 22 Apr 2024 03:58:46 +0000
Date: Mon, 22 Apr 2024 11:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.9-netdma 9/36]
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:610
 mtk_pinconf_bias_set_pd() warn: inconsistent indenting
Message-ID: <202404221148.3x6QuBo9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-netdma
head:   e97002339b4433e39a2d1294ae5dcc2f6e679295
commit: dcb73c2f8544a27b001945fc6c6412ba2c7155cd [9/36] pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
config: openrisc-randconfig-r071-20240422 (https://download.01.org/0day-ci/archive/20240422/202404221148.3x6QuBo9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404221148.3x6QuBo9-lkp@intel.com/

smatch warnings:
drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:610 mtk_pinconf_bias_set_pd() warn: inconsistent indenting

vim +610 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c

   603	
   604	static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
   605					const struct mtk_pin_desc *desc,
   606					u32 pullup, u32 arg)
   607	{
   608	    int err, pd;
   609	
 > 610		if (arg == MTK_DISABLE)
   611			pd = 0;
   612		else if ((arg == MTK_ENABLE) && pullup)
   613			pd = 0;
   614		else if ((arg == MTK_ENABLE) && !pullup)
   615			pd = 1;
   616		else {
   617			err = -EINVAL;
   618			goto out;
   619		}
   620	
   621		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
   622	
   623	out:
   624		return err;
   625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
