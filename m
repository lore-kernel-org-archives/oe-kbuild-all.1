Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3EE47768
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jan 2024 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPmub8en"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704722186; x=1736258186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3PJvlVZwPjO2KhnUOFTGmJGHXo2E/bIzpvK+S+Jxolg=;
  b=FPmub8enaeANABMpeK3YLW4LuwC1mudWywO5v1J7BQS5u9AQ/DMQFBFG
   BrKN8RbeaREHiJ64SWESb9LzcxMTm4WVIzBQl/Ttb4dIrBqvYPOHEb1JZ
   t7qKhXveJLvn/TxC6Mm2pAcrwpM+Cvwfyc7kzosoD5tsVHCNSSc1jQRlC
   d+Z/RRkEfMQJNDErUvc+TSbwogu3Un2+mxcw09zCk5fEqUzmFOUFjV73i
   kOmuHJafBrnZyj0W3DXJdKQlh0Fp+Utu+/Au9gWzAFt8ehxDFhKK1TMm0
   j2VcFP6O5x0ZgYEA5Hp4BptL0lEIqxpBs1dEzMkXNokBVvbsU93S27Lg1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="396768136"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; 
   d="scan'208";a="396768136"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 05:56:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="900384065"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; 
   d="scan'208";a="900384065"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 08 Jan 2024 05:56:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMq74-0004l6-2d;
	Mon, 08 Jan 2024 13:56:22 +0000
Date: Mon, 8 Jan 2024 21:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.7-dango-lro 11/11]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:4624:12: warning:
 'mtk_change_mtu' defined but not used
Message-ID: <202401082118.xqBjXnOI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.7-dango-lro
head:   1f5055a5dde9e8569dec53b0505ed5632e934357
commit: 1f5055a5dde9e8569dec53b0505ed5632e934357 [11/11] net: mediatek: update lro-code from balika
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240108/202401082118.xqBjXnOI-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401082118.xqBjXnOI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401082118.xqBjXnOI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:4624:12: warning: 'mtk_change_mtu' defined but not used [-Wunused-function]
    4624 | static int mtk_change_mtu(struct net_device *dev, int new_mtu)
         |            ^~~~~~~~~~~~~~


vim +/mtk_change_mtu +4624 drivers/net/ethernet/mediatek/mtk_eth_soc.c

656e705243fd0c John Crispin     2016-03-08  4623  
4fd59792097a6b DENG Qingfang    2021-01-25 @4624  static int mtk_change_mtu(struct net_device *dev, int new_mtu)
4fd59792097a6b DENG Qingfang    2021-01-25  4625  {
4fd59792097a6b DENG Qingfang    2021-01-25  4626  	int length = new_mtu + MTK_RX_ETH_HLEN;
4fd59792097a6b DENG Qingfang    2021-01-25  4627  	struct mtk_mac *mac = netdev_priv(dev);
4fd59792097a6b DENG Qingfang    2021-01-25  4628  	struct mtk_eth *eth = mac->hw;
4fd59792097a6b DENG Qingfang    2021-01-25  4629  
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4630  	if (rcu_access_pointer(eth->prog) &&
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4631  	    length > MTK_PP_MAX_BUF_SIZE) {
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4632  		netdev_err(dev, "Invalid MTU for XDP mode\n");
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4633  		return -EINVAL;
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4634  	}
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4635  
b677d6c7a695da Lorenzo Bianconi 2022-11-17  4636  	mtk_set_mcr_max_rx(mac, length);
4fd59792097a6b DENG Qingfang    2021-01-25  4637  	dev->mtu = new_mtu;
4fd59792097a6b DENG Qingfang    2021-01-25  4638  
4fd59792097a6b DENG Qingfang    2021-01-25  4639  	return 0;
4fd59792097a6b DENG Qingfang    2021-01-25  4640  }
4fd59792097a6b DENG Qingfang    2021-01-25  4641  

:::::: The code at line 4624 was first introduced by commit
:::::: 4fd59792097a6b2fb949d41264386a7ecade469e net: ethernet: mediatek: support setting MTU

:::::: TO: DENG Qingfang <dqfext@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
