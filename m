Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5467F328B9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 19:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRv/2/zp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697483473; x=1729019473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mL32M8uxOx9jPK4ESATmm6U3EtTfFtBX6hg8PcLAKqs=;
  b=kRv/2/zpOZPiUlF9QE+DTI4vEdGAYNRd8Dlm4LYfx2POJ93fCQdwwvez
   2PVVCwD3CSnHHuA9d75t4Txf8VRSCKrcf6FtavVw6w9CXQoSn/uupx+Ea
   Zod29fVEarMxucMzyjZhn/LrPn8uaSwXz0feyzU5ZjuHGq9L7DZLnl1N7
   MbZNlivp9rPpoCjijJ60yJ6mrLih+FQPpBOapHjRUubBChwMEyNczWfRs
   NBVX06bOeSjSeRfLskvLCF2yr49MZ3vwXrLT46QYCgNpSDxA6r8YUNcaG
   BTCL38xATMkaSdnUT4bQVbuKuITT67HkyZB3boA5+Z3lMwyVRDC/Sk9y3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="375985403"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="375985403"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 12:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="821676894"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="821676894"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Oct 2023 12:11:11 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsSzd-0008cB-0K;
	Mon, 16 Oct 2023 19:11:09 +0000
Date: Tue, 17 Oct 2023 03:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 6126/30000]
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4112:5: warning: no
 previous declaration for 'stmmactc_setup_mqprio'
Message-ID: <202310170316.gqYdidiD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 44980ad6bb897f146cdf6e8133b20e99eaa4db91 [6126/30000] MLK-23251-01: net: stmac: tsn: add tc mqprio support
config: x86_64-randconfig-016-20231016 (https://download.01.org/0day-ci/archive/20231017/202310170316.gqYdidiD-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170316.gqYdidiD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170316.gqYdidiD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: In function 'stmmac_rx_buf1_len':
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3529:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret, coe = priv->hw->rx_csum;
         ^~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: At top level:
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4112:5: warning: no previous declaration for 'stmmactc_setup_mqprio' [-Wmissing-declarations]
    int stmmactc_setup_mqprio(struct net_device *ndev, void *type_data)
        ^~~~~~~~~~~~~~~~~~~~~


vim +/stmmactc_setup_mqprio +4112 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

  4111	
> 4112	int stmmactc_setup_mqprio(struct net_device *ndev, void *type_data)
  4113	{
  4114		struct tc_mqprio_qopt *mqprio = type_data;
  4115		u8 num_tc;
  4116		int i;
  4117	
  4118		num_tc = mqprio->num_tc;
  4119		netif_set_real_num_tx_queues(ndev, num_tc);
  4120		netdev_set_num_tc(ndev, num_tc);
  4121		for (i = 0; i < num_tc; i++)
  4122			netdev_set_tc_queue(ndev, i, 1, i);
  4123	
  4124		return 0;
  4125	}
  4126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
