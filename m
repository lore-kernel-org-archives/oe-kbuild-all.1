Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1A73D6A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 12:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674909271; x=1706445271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tD9zlKinVeYygLH6+EMfpUbg/vL4FVW5EngIfl/v0Pc=;
  b=Y5PwhYKObeaHXfRvEot5in+PBqYV0Tsr1z1IkVwLO8ixi/RNWpXAMT88
   Pq/Zl9vA1kANpeowZMysmcPC5bZVa8fOlM81ta5YTiw7funGGffFX62F9
   q7CEOkRGR47NMsWVYvFFxHC5VyAbfVXqAusydI3kg7V2PpWQezxOv7Vt2
   LpCIxubn2oHpr2RSCX2DhmRTlVUn1VE06GuNFpVXdBsltem8aYSg0nHuX
   9nr5HBOMyi7iZuQXBKxTP2C7IXK38+M+6f+Tx/haW0+52nLkMO7FTCKlj
   Dq419c3Pg6sOfCY9MyIp1MUlbhrRcg2g0rFCIcCIEDvaztqc2PxoyZUCD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="315241207"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="315241207"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 04:34:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="665554569"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="665554569"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jan 2023 04:34:29 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLkPc-0000e7-10;
	Sat, 28 Jan 2023 12:34:28 +0000
Date: Sat, 28 Jan 2023 20:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Subject: [nbd168-wireless:mt76 35/36]
 drivers/net/wireless/mediatek/mt76/mac80211.c:1732:16: error: variable
 'stats' has initializer but incomplete type
Message-ID: <202301282035.KetXZv91-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   6d672228aa610d9b8f3d8b277f5b95b05dc2c66a
commit: aff9d1f4e5ad02de773bf800e6af49e57adf7d25 [35/36] wifi: mt76: enable page_pool stats
config: openrisc-randconfig-r022-20230123 (https://download.01.org/0day-ci/archive/20230128/202301282035.KetXZv91-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/nbd168/wireless/commit/aff9d1f4e5ad02de773bf800e6af49e57adf7d25
        git remote add nbd168-wireless https://github.com/nbd168/wireless
        git fetch --no-tags nbd168-wireless mt76
        git checkout aff9d1f4e5ad02de773bf800e6af49e57adf7d25
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/net/wireless/mediatek/mt76/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mac80211.c: In function 'mt76_ethtool_page_pool_stats':
>> drivers/net/wireless/mediatek/mt76/mac80211.c:1732:16: error: variable 'stats' has initializer but incomplete type
    1732 |         struct page_pool_stats stats = {};
         |                ^~~~~~~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mac80211.c:1732:32: error: storage size of 'stats' isn't known
    1732 |         struct page_pool_stats stats = {};
         |                                ^~~~~
>> drivers/net/wireless/mediatek/mt76/mac80211.c:1736:17: error: implicit declaration of function 'page_pool_get_stats'; did you mean 'page_pool_put_page'? [-Werror=implicit-function-declaration]
    1736 |                 page_pool_get_stats(dev->q_rx[i].page_pool, &stats);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 page_pool_put_page
   drivers/net/wireless/mediatek/mt76/mac80211.c:1732:32: warning: unused variable 'stats' [-Wunused-variable]
    1732 |         struct page_pool_stats stats = {};
         |                                ^~~~~
   cc1: some warnings being treated as errors


vim +/stats +1732 drivers/net/wireless/mediatek/mt76/mac80211.c

  1729	
  1730	void mt76_ethtool_page_pool_stats(struct mt76_dev *dev, u64 *data, int *index)
  1731	{
> 1732		struct page_pool_stats stats = {};
  1733		int i;
  1734	
  1735		mt76_for_each_q_rx(dev, i)
> 1736			page_pool_get_stats(dev->q_rx[i].page_pool, &stats);
  1737	
  1738		page_pool_ethtool_stats_get(data, &stats);
  1739		*index += page_pool_ethtool_stats_get_count();
  1740	}
  1741	EXPORT_SYMBOL_GPL(mt76_ethtool_page_pool_stats);
  1742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
