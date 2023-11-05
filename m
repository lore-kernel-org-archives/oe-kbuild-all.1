Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB3115B7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 06:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOthCGBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699164235; x=1730700235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eahp2kbubkQuAzMafx2n44T6htvDW7oZRxOkgo7uesk=;
  b=MOthCGBTLR+MRv6WLARfB3i1fTNagIegy/Yb4OqZQyraIdSZXhVNQGCU
   PB1pi4AFoZRRYg3m+okfPAWVw2kjEAo/KS10tU3kewXfE3mKZ80pR3Klf
   1wspM0UxX7bslLNLWgwQbGHjHGNiBrcKj88iWn05xijj87at7MibzPOuc
   ZvvQk/ZoecxLwL/qDjuiHJ3lzqs+ZYopefVaWupaRDhZaXcerN8PB/p5q
   krygFBEbyGvjwo7J7ybdJAGvNKm9bCZhv3DeF4jdP6vGgouwDmrLM9G8G
   n0o1EA5Uumr+iU1/142VQUzOhmqNMNmxO3Q0hGPiY/DXoakY0PILieAp7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="455615633"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="455615633"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 23:03:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="765654929"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="765654929"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Nov 2023 23:03:53 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzWEh-00056G-1w;
	Sun, 05 Nov 2023 06:03:51 +0000
Date: Sun, 5 Nov 2023 14:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: Axel Lin <axel.lin@ingics.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: drivers/spi/spi-rockchip.c:891:34: warning: 'rockchip_spi_dt_match'
 defined but not used
Message-ID: <202311051312.XPufwrD5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Axel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aea6bf908d730b01bd264a8821159db9463c111c
commit: 46cb41534a1a1d1f75aae5eab0dd8c06a9461e6b spi: Drop unnecessary dependencies on relaxed I/O accessors
date:   8 years ago
config: i386-buildonly-randconfig-005-20231101 (https://download.01.org/0day-ci/archive/20231105/202311051312.XPufwrD5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051312.XPufwrD5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051312.XPufwrD5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-rockchip.c:891:34: warning: 'rockchip_spi_dt_match' defined but not used [-Wunused-const-variable=]
     891 | static const struct of_device_id rockchip_spi_dt_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~


vim +/rockchip_spi_dt_match +891 drivers/spi/spi-rockchip.c

64e36824b32b06 addy ke    2014-07-01  890  
64e36824b32b06 addy ke    2014-07-01 @891  static const struct of_device_id rockchip_spi_dt_match[] = {
64e36824b32b06 addy ke    2014-07-01  892  	{ .compatible = "rockchip,rk3066-spi", },
b839b785182497 Addy Ke    2014-07-11  893  	{ .compatible = "rockchip,rk3188-spi", },
b839b785182497 Addy Ke    2014-07-11  894  	{ .compatible = "rockchip,rk3288-spi", },
9b7a56221590ca Xu Jianqun 2016-02-18  895  	{ .compatible = "rockchip,rk3399-spi", },
64e36824b32b06 addy ke    2014-07-01  896  	{ },
64e36824b32b06 addy ke    2014-07-01  897  };
64e36824b32b06 addy ke    2014-07-01  898  MODULE_DEVICE_TABLE(of, rockchip_spi_dt_match);
64e36824b32b06 addy ke    2014-07-01  899  

:::::: The code at line 891 was first introduced by commit
:::::: 64e36824b32b061a9537dc2e026977806f75846f spi/rockchip: add driver for Rockchip RK3xxx SoCs integrated SPI

:::::: TO: addy ke <addy.ke@rock-chips.com>
:::::: CC: Mark Brown <broonie@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
