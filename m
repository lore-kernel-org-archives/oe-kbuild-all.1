Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F9922F07
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSIsUkrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697106464; x=1728642464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vqusKAZg3ROSrD/+PbEBt+DLqSKWImo1QgssvqJ4B+M=;
  b=BSIsUkrTGIiwkhgAO0cACkGTl4xphDGnBBeUypfW3TjFoGRiVOPenOXo
   g/lI8YXhxuyVpm8yUoUq/Y24E4qt0Ky01/GhLqKE7envvaVBJYPIOowaE
   hv2Hvi2bn4gccVsyWcVJXwdaOophbNnCT7t75h9Hdz9sVm3L5JxzEpHaK
   BlCEKxdjRXcVH2Q83hifS3/CMgS2wPdCpKa0IJKhO/sElv02OJLaqOirZ
   YzdbNdoqYI/2L3Wz0gq0hBXbfApt7JVTdNDFupezchpEnr0pn5dKKGXsj
   dWCNpR+sXVGRywzjla38PK28eC3qBa2nKxBY7xx/gQtCntvFIt1qB7Bn2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364253834"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="364253834"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 03:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870526160"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="870526160"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Oct 2023 03:27:42 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqsup-0003NJ-3C;
	Thu, 12 Oct 2023 10:27:39 +0000
Date: Thu, 12 Oct 2023 18:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 10163/11653]
 sound/soc/rockchip/rockchip_i2s_tdm.c:1315:34: warning:
 'rockchip_i2s_tdm_match' defined but not used
Message-ID: <202310121802.CDAGVdF2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9a6bea131849702d591d18d5c8b8a0eda6f62b3
commit: 9958d85968ed2df4b704105fd2a9c3669eb9cd97 [10163/11653] ASoC: Use device_get_match_data()
config: xtensa-randconfig-r035-20230401 (https://download.01.org/0day-ci/archive/20231012/202310121802.CDAGVdF2-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310121802.CDAGVdF2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121802.CDAGVdF2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/rockchip/rockchip_i2s_tdm.c:1315:34: warning: 'rockchip_i2s_tdm_match' defined but not used [-Wunused-const-variable=]
    1315 | static const struct of_device_id rockchip_i2s_tdm_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~


vim +/rockchip_i2s_tdm_match +1315 sound/soc/rockchip/rockchip_i2s_tdm.c

081068fd641403 Nicolas Frattaroli 2021-10-01  1314  
081068fd641403 Nicolas Frattaroli 2021-10-01 @1315  static const struct of_device_id rockchip_i2s_tdm_match[] = {
081068fd641403 Nicolas Frattaroli 2021-10-01  1316  	{ .compatible = "rockchip,px30-i2s-tdm", .data = &px30_i2s_soc_data },
081068fd641403 Nicolas Frattaroli 2021-10-01  1317  	{ .compatible = "rockchip,rk1808-i2s-tdm", .data = &rk1808_i2s_soc_data },
081068fd641403 Nicolas Frattaroli 2021-10-01  1318  	{ .compatible = "rockchip,rk3308-i2s-tdm", .data = &rk3308_i2s_soc_data },
081068fd641403 Nicolas Frattaroli 2021-10-01  1319  	{ .compatible = "rockchip,rk3568-i2s-tdm", .data = &rk3568_i2s_soc_data },
c619bd4268ff98 Nicolas Frattaroli 2022-10-25  1320  	{ .compatible = "rockchip,rk3588-i2s-tdm" },
081068fd641403 Nicolas Frattaroli 2021-10-01  1321  	{ .compatible = "rockchip,rv1126-i2s-tdm", .data = &rv1126_i2s_soc_data },
081068fd641403 Nicolas Frattaroli 2021-10-01  1322  	{},
081068fd641403 Nicolas Frattaroli 2021-10-01  1323  };
081068fd641403 Nicolas Frattaroli 2021-10-01  1324  

:::::: The code at line 1315 was first introduced by commit
:::::: 081068fd641403994f0505e6b91e021d3925f348 ASoC: rockchip: add support for i2s-tdm controller

:::::: TO: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
