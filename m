Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6872C7464
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I08SCLX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699692269; x=1731228269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XJzvc/HnB6HejA88UZR+n8Iur2kLa1wnHb5ufhhkSk4=;
  b=I08SCLX01UM4Qn/yhFmw797sKedJjqez8ULmOJvGM+E1DIS2oFETXGIp
   Y5roEi+Rud6yXYh0RtrbrjOQUTSzN2ky2I+QBlWDfNtfWVgE8Q+V6P/Wr
   ywa+efRENYqlWdRpc9RXlNKTVzknVBn0GP3Uo8yvexth6U6pLEGQ1l6oA
   3kbylCWMgT6yr4OpTpo2PC/ZptDkJ8Ff1VuAYpIxiJYGEimuJFMlw6sra
   f1mTswnTnDpd6OZaoadGTJUyzx4hVU+D3U8+JRM4jlpO22bJIDzw4w3fB
   wdDWwMO1cdjhC1SBQyYGRBtbbv9ZSzF93bCfB6YNYay6jKr7/m4U8zQbP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="369594840"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="369594840"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 00:44:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="757380936"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="757380936"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Nov 2023 00:44:27 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1jbM-000AL0-1y;
	Sat, 11 Nov 2023 08:44:24 +0000
Date: Sat, 11 Nov 2023 16:43:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:760:32: sparse:
 sparse: restricted __le16 degrades to integer
Message-ID: <202311111644.CXvKwJam-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: a24cae7012b59bfe1aed01fe3fc13d81b7b97b08 net: stmmac: Fix sparse warning
date:   4 years ago
config: i386-randconfig-062-20230914 (https://download.01.org/0day-ci/archive/20231111/202311111644.CXvKwJam-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111644.CXvKwJam-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111644.CXvKwJam-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:760:32: sparse: sparse: restricted __le16 degrades to integer
--
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:594:32: sparse: sparse: restricted __le16 degrades to integer

vim +760 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c

4ce84f4da7c472 Jose Abreu 2019-05-24  734  
c1be0022df0dae Jose Abreu 2019-09-10  735  static void dwmac4_update_vlan_hash(struct mac_device_info *hw, u32 hash,
a24cae7012b59b Jose Abreu 2019-11-11  736  				    __le16 perfect_match, bool is_double)
c1be0022df0dae Jose Abreu 2019-09-10  737  {
c1be0022df0dae Jose Abreu 2019-09-10  738  	void __iomem *ioaddr = hw->pcsr;
c1be0022df0dae Jose Abreu 2019-09-10  739  
c1be0022df0dae Jose Abreu 2019-09-10  740  	writel(hash, ioaddr + GMAC_VLAN_HASH_TABLE);
c1be0022df0dae Jose Abreu 2019-09-10  741  
c1be0022df0dae Jose Abreu 2019-09-10  742  	if (hash) {
c1be0022df0dae Jose Abreu 2019-09-10  743  		u32 value = GMAC_VLAN_VTHM | GMAC_VLAN_ETV;
c1be0022df0dae Jose Abreu 2019-09-10  744  		if (is_double) {
c1be0022df0dae Jose Abreu 2019-09-10  745  			value |= GMAC_VLAN_EDVLP;
c1be0022df0dae Jose Abreu 2019-09-10  746  			value |= GMAC_VLAN_ESVL;
c1be0022df0dae Jose Abreu 2019-09-10  747  			value |= GMAC_VLAN_DOVLTC;
c1be0022df0dae Jose Abreu 2019-09-10  748  		}
c1be0022df0dae Jose Abreu 2019-09-10  749  
c1be0022df0dae Jose Abreu 2019-09-10  750  		writel(value, ioaddr + GMAC_VLAN_TAG);
c7ab0b8088d7f0 Jose Abreu 2019-10-06  751  	} else if (perfect_match) {
c7ab0b8088d7f0 Jose Abreu 2019-10-06  752  		u32 value = GMAC_VLAN_ETV;
c7ab0b8088d7f0 Jose Abreu 2019-10-06  753  
c7ab0b8088d7f0 Jose Abreu 2019-10-06  754  		if (is_double) {
c7ab0b8088d7f0 Jose Abreu 2019-10-06  755  			value |= GMAC_VLAN_EDVLP;
c7ab0b8088d7f0 Jose Abreu 2019-10-06  756  			value |= GMAC_VLAN_ESVL;
c7ab0b8088d7f0 Jose Abreu 2019-10-06  757  			value |= GMAC_VLAN_DOVLTC;
c7ab0b8088d7f0 Jose Abreu 2019-10-06  758  		}
c7ab0b8088d7f0 Jose Abreu 2019-10-06  759  
c7ab0b8088d7f0 Jose Abreu 2019-10-06 @760  		writel(value | perfect_match, ioaddr + GMAC_VLAN_TAG);
c1be0022df0dae Jose Abreu 2019-09-10  761  	} else {
c1be0022df0dae Jose Abreu 2019-09-10  762  		u32 value = readl(ioaddr + GMAC_VLAN_TAG);
c1be0022df0dae Jose Abreu 2019-09-10  763  
c1be0022df0dae Jose Abreu 2019-09-10  764  		value &= ~(GMAC_VLAN_VTHM | GMAC_VLAN_ETV);
c1be0022df0dae Jose Abreu 2019-09-10  765  		value &= ~(GMAC_VLAN_EDVLP | GMAC_VLAN_ESVL);
c1be0022df0dae Jose Abreu 2019-09-10  766  		value &= ~GMAC_VLAN_DOVLTC;
c1be0022df0dae Jose Abreu 2019-09-10  767  		value &= ~GMAC_VLAN_VID;
c1be0022df0dae Jose Abreu 2019-09-10  768  
c1be0022df0dae Jose Abreu 2019-09-10  769  		writel(value, ioaddr + GMAC_VLAN_TAG);
c1be0022df0dae Jose Abreu 2019-09-10  770  	}
c1be0022df0dae Jose Abreu 2019-09-10  771  }
c1be0022df0dae Jose Abreu 2019-09-10  772  

:::::: The code at line 760 was first introduced by commit
:::::: c7ab0b8088d7f023f543013963f23aecc7e47efb net: stmmac: Fallback to VLAN Perfect filtering if HASH is not available

:::::: TO: Jose Abreu <joabreu@synopsys.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
