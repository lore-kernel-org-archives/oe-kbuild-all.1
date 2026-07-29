Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23534CA285
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336673; cv=none; b=InMy1Q0BO5tUGikABzbTjpcm2eyiAGwhcUpnLcp94GNF01+YeVqMR7q3Hc9XMHuGfyAa0yEgvjIp01aEg/PtqKq5Z2UHe5G7cOBjxIRS85mcpYlAQ7/YWuu91Bq8NuVlEDFmd/kF3JDwpxdRdDFEtRiNP45EWZPV/+25DmoYln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336673; c=relaxed/simple;
	bh=l6RXg87jxWaiWXyCyMgUM6khnIxVG19ELolq5LpwNKA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LOB/cmMtfqH6gzCXYbGYDEpSyLIEDTrrRK1JsSo4fVVn+/GXzfx5RIT/qSXcZ6KGarWBtqJgmDhFM+YpHxJV9cke5hfekM8wHXV+GrajD/5CgQF8jJH5X7mHoMRft3mrURnfmy6NiEAeTI1eV7CQg60ErGpoPAGxZoReVmXD9jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2q335oj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2q335oj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785336670; x=1816872670;
  h=date:from:to:cc:subject:message-id;
  bh=l6RXg87jxWaiWXyCyMgUM6khnIxVG19ELolq5LpwNKA=;
  b=N2q335ojiDTmFcBt7QnYtavGBsC4Vw2Yjl1YuRFmK5Hjl89n/ZO9TCRg
   Zf7xo/zcUZ1gMnj/29kzhzJ+x3FQ2nEs1WGzpmKQ/UeljQPY5tbBLFctC
   IfHrhqM9FoNhZYr1eD3j5un4OqnYAMbE1HS9KORn4e3fVELPx6zqpoyu5
   Vwg30lZUO8kzne8Vh0r7xIBOfoHX5eTclQjLq+X15UIdTyzQtSIgZY6w2
   ku4hW5ElDnI+CpFCqbqzBRItkdoD9jK4oWtkc/HKfz0/T6cYQuOC75Ip/
   XUZd1+E9Psf+d7SE299aXWZY4hCgPN7dzc2JRv1NWKkoG6vvJAO+nPNNq
   Q==;
X-CSE-ConnectionGUID: Tv/L5AVMQ4Smi1m7ngYBcw==
X-CSE-MsgGUID: zrZ/unf6RKy8etXiJ5tG/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96303694"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="96303694"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 07:51:08 -0700
X-CSE-ConnectionGUID: tU5Xc5FuRnyKGueZYS9Khg==
X-CSE-MsgGUID: JBTUZBYTSJyTMhypoUfunw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="256694025"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2026 07:51:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp5ce-00000000fQR-13vL;
	Wed, 29 Jul 2026 14:51:04 +0000
Date: Wed, 29 Jul 2026 22:51:01 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 363/700]
 drivers/dma/mstar/mstar-msc313-bdma.c:782:13: warning: unused variable 'ret'
Message-ID: <202607292228.jMoOE7k1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 26178975043b0a83d96b42a14c44bb70fdb84d4b [363/700] dma: mstar: msc313 bdma driver
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260729/202607292228.jMoOE7k1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607292228.jMoOE7k1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607292228.jMoOE7k1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/mstar/mstar-msc313-bdma.c: In function 'msc313_bdma_remove':
>> drivers/dma/mstar/mstar-msc313-bdma.c:782:13: warning: unused variable 'ret' [-Wunused-variable]
     782 |         int ret, i;
         |             ^~~
   drivers/dma/mstar/mstar-msc313-bdma.c:781:24: warning: unused variable 'dev' [-Wunused-variable]
     781 |         struct device *dev = &pdev->dev;
         |                        ^~~


vim +/ret +782 drivers/dma/mstar/mstar-msc313-bdma.c

   777	
   778	static int msc313_bdma_remove(struct platform_device *pdev)
   779	{
   780		struct msc313_bdma *bdma = platform_get_drvdata(pdev);
   781		struct device *dev = &pdev->dev;
 > 782		int ret, i;
   783	
   784		of_dma_controller_free(pdev->dev.of_node);
   785	
   786		for (i = 0; i < bdma->info->channels; i++){
   787			struct msc313_bdma_chan *chan = &bdma->chans[i];
   788			tasklet_kill(&chan[i].tasklet);
   789		}
   790	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
