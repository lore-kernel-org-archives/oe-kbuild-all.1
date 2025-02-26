Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911FE222593
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 16:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588168; cv=none; b=Ns1AiwohXMPKk0yHUx/+VBOug0BB2bw4pESRTbCts7rG15nFIU2wEJQteDHaka89cxpYeuM+Z7BN84cMwJpKU23RGSqeaNxI941cp5tBmjmH4UHOFSBYuy8L5LgMxnRCVgjiDmtFInwMA1jRcmZp1PeWJEYQ1FLYqt8g2pO3dKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588168; c=relaxed/simple;
	bh=1DAw9xUI5gyUWh2AEqSYSgVNryfIJ6kfS2A9wDZuesQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gjW3X+idvo9V7jakzJLKzKbWYR/JnVP5pEvu5EPeLhCD4Dh+vD3Vqcp8JxvKD6S5Hng7Q+g7LTkquvEq75gPjvxz02D0c7zzpp5Eavf3kfhWOETeF1PU+9q8ySt39Oe2HFWJelquXwBbpVzTtsWjaULX9X4R7kAPkEaLOp+zZu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7WDYc/G; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7WDYc/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740588167; x=1772124167;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1DAw9xUI5gyUWh2AEqSYSgVNryfIJ6kfS2A9wDZuesQ=;
  b=n7WDYc/GLspB41njhxBwWZU4P7ZRxouOK6C3n43zjg3C7mhRHjkzqsQ6
   PCaYrooiSLe3FKeAHvcEh0HjSi96pI4YigAUFevGU7ZPxJ0ZyiLUGairn
   PDo92DsvWD9yKETignP8Vj+ldr+u02/zgX9kXDlxz57xVxHM9I7L1FkTE
   0I5C9GVXONzUxkx/cQzW2idBQcIKXjsEQx531cr//kXSuWgXyt+F7Ei5q
   tOpQwIqssJoaZzKvtY9ND9jTLhQIAaI3pk4LBesny1KQQKgL/Ht8MFuz/
   8/XumqIagWS36eg0z11CSwdhvTajgSzZwQNX8gqEFP4owTb5cMRYivCgp
   A==;
X-CSE-ConnectionGUID: Bj8JTPBxRR+eWjHgmPqNQg==
X-CSE-MsgGUID: IAVFCWKyQ9q8sphqcJ/M1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41293831"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41293831"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:42:46 -0800
X-CSE-ConnectionGUID: ILt1TSrzQhCFUhiAKw7LpQ==
X-CSE-MsgGUID: aE1a9ZWFSr+FHO3qe5iaxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="147574754"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Feb 2025 08:42:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnKUd-000C6B-0J
	for oe-kbuild-all@lists.linux.dev;
	Wed, 26 Feb 2025 16:42:43 +0000
Date: Thu, 27 Feb 2025 00:42:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1]
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:68:1: warning:
 'mt8183_mt6358_ts3a227_max98357_dapm_routes' defined but not used
Message-ID: <202502270027.0MnhgPlC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 11c0269017b212fd47c593307d2dc3eb9713b2d0 [1/1] ASoC: Mediatek: MT8183: Add machine driver with TS3A227
config: arm-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250227/202502270027.0MnhgPlC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270027.0MnhgPlC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270027.0MnhgPlC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c: In function 'mt8183_mt6358_ts3a227_max98357_dev_probe':
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:325:27: error: 'struct snd_soc_dai_link' has no member named 'platform'; did you mean 'platforms'?
     325 |                 dai_link->platform = NULL;
         |                           ^~~~~~~~
         |                           platforms
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c: At top level:
>> sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:68:1: warning: 'mt8183_mt6358_ts3a227_max98357_dapm_routes' defined but not used [-Wunused-const-variable=]
      68 | mt8183_mt6358_ts3a227_max98357_dapm_routes[] = {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:63:1: warning: 'mt8183_mt6358_ts3a227_max98357_dapm_widgets' defined but not used [-Wunused-const-variable=]
      63 | mt8183_mt6358_ts3a227_max98357_dapm_widgets[] = {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mt8183_mt6358_ts3a227_max98357_dapm_routes +68 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c

    61	
    62	static const struct snd_soc_dapm_widget
  > 63	mt8183_mt6358_ts3a227_max98357_dapm_widgets[] = {
    64		SND_SOC_DAPM_OUTPUT("IT6505_8CH"),
    65	};
    66	
    67	static const struct snd_soc_dapm_route
  > 68	mt8183_mt6358_ts3a227_max98357_dapm_routes[] = {
    69		{"IT6505_8CH", NULL, "TDM"},
    70	};
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
