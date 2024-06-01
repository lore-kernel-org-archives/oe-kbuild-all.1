Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AE61171D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717266031; cv=none; b=qK3YVhUcgAVq95VZvnALDTKvb3pPJVmCblhOo5T7jav9KPvT14P0GjetAngbAJRMGjzv+s81dCwLVT8MhDCb/E3poTtbSwn72PNXkMxdaAJhSnIQFUh3ojk8aXYblTK9upZKGz+9LeLVCTv57cnpAIrTl1t9XIRwVEU4JzXPYfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717266031; c=relaxed/simple;
	bh=Q3mad32EU8sQ+K9041sEMDYyV4a9PLsJY90WFQtx9CI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PTQaKKX/kbZK/VxKHrN3SYMvrD0IJ2pR8jU17x4ki1npGu4qamESKrtOATCLd3o5teeFKMOTa6HSqswwQl78csv6mSuae6X292c1Hcsqi8l5zM94pqlCQpqp9HSd/GP92scz7uysoqlYvqFt6ceI5nT+L9WqIhUlDoGs+x8JPq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7u875+w; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7u875+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717266029; x=1748802029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q3mad32EU8sQ+K9041sEMDYyV4a9PLsJY90WFQtx9CI=;
  b=S7u875+w17Mc86xirJ4B1aoFzRvlpvuozJXsYUWdr/NAlV0zUStja1rs
   /yyUSqwh+DglevIKLgwG1Zoj6ASkjY4AHBZGPN9LtEzQMNKXQ/30f4DmQ
   /57nnfHfDo2TSn9oF7aH+igdYxVcolFabRPlFxWbIs2PwWP7K18ZjE+B/
   zWUOAJGmIxKNQ2UAKsmyPTkcDyQjCBy2sdslh6/WW+ANDSCXHouh3nmbN
   nAo+BnFRytJmQpDs4jRfZzBzjpDc/76EhSJOffFyD2VT1VFCENymbGu5G
   TW7eei7kJGIqGG5mU4UTEZxkgaEhTAGdyCyW2qSg/SLaqfPJCMnKFbwSM
   Q==;
X-CSE-ConnectionGUID: fxUIDy8LRPCpyjRVfjZnwA==
X-CSE-MsgGUID: RvkAC8o/Rvi008eUwsEB+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="31294987"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="31294987"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 11:20:29 -0700
X-CSE-ConnectionGUID: TCRoo628QwCIM7LKGEnh/A==
X-CSE-MsgGUID: jLvbtuJNRdKn+3ZvrkROsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="37105759"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2024 11:20:28 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDTL8-000JEP-0Q;
	Sat, 01 Jun 2024 18:20:26 +0000
Date: Sun, 2 Jun 2024 02:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 95/106]
 drivers/media/platform/mediatek/aie/mtk_aie_53.c:1835:12: warning:
 'mtk_aie_runtime_resume' defined but not used
Message-ID: <202406020211.qByg1OGs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   48e85bb9c7f6237c1ae5c6826dc494ac7674935a
commit: 5cd0ae9700e0a1483b2fd161c7d7f120b643d953 [95/106] CHROMIUM: media: platform: mediatek: aie driver migration
config: x86_64-randconfig-122-20240602 (https://download.01.org/0day-ci/archive/20240602/202406020211.qByg1OGs-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406020211.qByg1OGs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406020211.qByg1OGs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/aie/mtk_aie_53.c:1835:12: warning: 'mtk_aie_runtime_resume' defined but not used [-Wunused-function]
    1835 | static int mtk_aie_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie_53.c:1826:12: warning: 'mtk_aie_runtime_suspend' defined but not used [-Wunused-function]
    1826 | static int mtk_aie_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/aie/mtk_aie_53.c:1804:12: warning: 'mtk_aie_resume' defined but not used [-Wunused-function]
    1804 | static int mtk_aie_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
   drivers/media/platform/mediatek/aie/mtk_aie_53.c:1770:12: warning: 'mtk_aie_suspend' defined but not used [-Wunused-function]
    1770 | static int mtk_aie_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/mtk_aie_runtime_resume +1835 drivers/media/platform/mediatek/aie/mtk_aie_53.c

d2e4e2025dedbc4 Copy Chou 2023-10-18  1825  
d2e4e2025dedbc4 Copy Chou 2023-10-18 @1826  static int mtk_aie_runtime_suspend(struct device *dev)
d2e4e2025dedbc4 Copy Chou 2023-10-18  1827  {
d2e4e2025dedbc4 Copy Chou 2023-10-18  1828  	struct mtk_aie_dev *fd = dev_get_drvdata(dev);
d2e4e2025dedbc4 Copy Chou 2023-10-18  1829  
d2e4e2025dedbc4 Copy Chou 2023-10-18  1830  	clk_bulk_disable_unprepare(fd->aie_clk.clk_num, fd->aie_clk.clks);
d2e4e2025dedbc4 Copy Chou 2023-10-18  1831  
d2e4e2025dedbc4 Copy Chou 2023-10-18  1832  	return 0;
d2e4e2025dedbc4 Copy Chou 2023-10-18  1833  }
d2e4e2025dedbc4 Copy Chou 2023-10-18  1834  
d2e4e2025dedbc4 Copy Chou 2023-10-18 @1835  static int mtk_aie_runtime_resume(struct device *dev)
d2e4e2025dedbc4 Copy Chou 2023-10-18  1836  {
d2e4e2025dedbc4 Copy Chou 2023-10-18  1837  	struct mtk_aie_dev *fd = dev_get_drvdata(dev);
d2e4e2025dedbc4 Copy Chou 2023-10-18  1838  	int ret = -EINVAL;
d2e4e2025dedbc4 Copy Chou 2023-10-18  1839  
d2e4e2025dedbc4 Copy Chou 2023-10-18  1840  	ret = clk_bulk_prepare_enable(fd->aie_clk.clk_num, fd->aie_clk.clks);
d2e4e2025dedbc4 Copy Chou 2023-10-18  1841  	if (ret) {
d2e4e2025dedbc4 Copy Chou 2023-10-18  1842  		dev_err(dev, "failed to enable clock:%d\n", ret);
d2e4e2025dedbc4 Copy Chou 2023-10-18  1843  		return ret;
d2e4e2025dedbc4 Copy Chou 2023-10-18  1844  	}
d2e4e2025dedbc4 Copy Chou 2023-10-18  1845  
d2e4e2025dedbc4 Copy Chou 2023-10-18  1846  	return 0;
d2e4e2025dedbc4 Copy Chou 2023-10-18  1847  }
d2e4e2025dedbc4 Copy Chou 2023-10-18  1848  

:::::: The code at line 1835 was first introduced by commit
:::::: d2e4e2025dedbc41046b5d9f4a8a209280f328f6 CHROMIUM: media: platform: mediatek: aie: Porting Kernel 6.1

:::::: TO: Copy Chou <copy.chou@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
