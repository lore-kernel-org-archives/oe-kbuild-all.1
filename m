Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524A75681
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 03:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfCwGqSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699674764; x=1731210764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sx/321IiezqO3pIgI86+mQL1tSKoa6eiEj06qRmMyTw=;
  b=VfCwGqSU1qx99ps7b8qIIwbFM4u7i3tqsko15P5RIMZ+fwifqt1A16em
   SQDr9x1TxgEoD94PoURfZKgbVW2txOl6oU9YLAIPP85uBolgiylI/ucvN
   M8PZDgWvJcVkp+MEZrRWYm5Eiuh5xDX7UAVA/kolUH2kI4Q85d9S1D85W
   Z/gMXrCEcftnSZWAJ8nxEk84mZHO7MkT4qQAbuB82jXENBMinqPJ+S//j
   1HfFbt2ZzpUrzwfm2/KoAayUCqwTATNbEZYCynbfHYoMyyhW4Ntq0Vsxq
   HpX85w/xGayDoZ2tjJINinhCvuW3UiD2pmaRR3NPWxLoErPFmiGX7n55A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="369585907"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="369585907"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 19:52:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="767458798"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="767458798"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Nov 2023 19:52:42 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1f32-000ABw-0V;
	Sat, 11 Nov 2023 03:52:40 +0000
Date: Sat, 11 Nov 2023 11:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:107:23: sparse:
 sparse: restricted __le32 degrades to integer
Message-ID: <202311111127.0cYR4j6Z-lkp@intel.com>
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
commit: 25e80cd05ff81e51750106f1ae12364449ec38e7 net: stmmac: Get correct timestamp values from XGMAC
date:   4 years, 3 months ago
config: i386-randconfig-062-20230914 (https://download.01.org/0day-ci/archive/20231111/202311111127.0cYR4j6Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111127.0cYR4j6Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111127.0cYR4j6Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:107:23: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:107:50: sparse: sparse: restricted __le32 degrades to integer

vim +107 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c

    94	
    95	static int dwxgmac2_rx_check_timestamp(void *desc)
    96	{
    97		struct dma_desc *p = (struct dma_desc *)desc;
    98		unsigned int rdes3 = le32_to_cpu(p->des3);
    99		bool desc_valid, ts_valid;
   100	
   101		dma_rmb();
   102	
   103		desc_valid = !(rdes3 & XGMAC_RDES3_OWN) && (rdes3 & XGMAC_RDES3_CTXT);
   104		ts_valid = !(rdes3 & XGMAC_RDES3_TSD) && (rdes3 & XGMAC_RDES3_TSA);
   105	
   106		if (likely(desc_valid && ts_valid)) {
 > 107			if ((p->des0 == 0xffffffff) && (p->des1 == 0xffffffff))
   108				return -EINVAL;
   109			return 0;
   110		}
   111	
   112		return -EINVAL;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
