Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A862228ED
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 05:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXTq59RY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699248477; x=1730784477;
  h=date:from:cc:subject:message-id:mime-version;
  bh=WPPSWcbLuU+Tw/gjueop9lEY/xwCI3iReVaG+RJba6A=;
  b=fXTq59RYRa+41YSuSkFj0Y/LpOWDv1GWt6otfLlFSxgsr5IpyTmoYb5q
   fOQcMijZROsF1dy02lNs1kapmxykl3lbhH8+FXRYLZ7trszTeM9dH+iHY
   1EnVXMASrVYqPfljVGn75RW6HIRWDjI5+gaojaACblfIJg454Ka1MRn2L
   LnWs5rfPDkyvZDb7pMTgp8fIvn4h2dBq8q6WkCUEGCeWHJN2b7BqCJEDG
   gTVSovC+6yv7drboGn+A1YF6HJD+Ec9RS8UGUmzWxWfN2BmJ0/1WADOq8
   ZzHrR31bdhLaOsyYm2LnrgcOrEy1CKUXb/H05IdMljkerMcqv2B587r2B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379601389"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="379601389"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 21:27:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3510888"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2023 21:27:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzs9R-00068a-0T;
	Mon, 06 Nov 2023 05:27:53 +0000
Date: Mon, 6 Nov 2023 13:27:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	MD Danish Anwar <danishanwar@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 41/69]
 drivers/net/ethernet/ti/icssg_prueth.c:680:5: warning: no previous prototype
 for function 'prueth_tx_ts_cookie_get'
Message-ID: <202311061330.pQJEYjYA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   765670365233dc7ad139e5e96c437d333ae94543
commit: 4536a8709a68251b9676cbb4fdf54a01d764e76e [41/69] net: ti: icssg_prueth: Support multiple TX timestamp requests
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311061330.pQJEYjYA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061330.pQJEYjYA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061330.pQJEYjYA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/ti/icssg_prueth.c:680:5: warning: no previous prototype for function 'prueth_tx_ts_cookie_get' [-Wmissing-prototypes]
     680 | int prueth_tx_ts_cookie_get(struct prueth_emac *emac)
         |     ^
   drivers/net/ethernet/ti/icssg_prueth.c:680:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     680 | int prueth_tx_ts_cookie_get(struct prueth_emac *emac)
         | ^
         | static 
   1 warning generated.


vim +/prueth_tx_ts_cookie_get +680 drivers/net/ethernet/ti/icssg_prueth.c

   679	
 > 680	int prueth_tx_ts_cookie_get(struct prueth_emac *emac)
   681	{
   682		int i;
   683	
   684		/* search and get the next free slot */
   685		for (i = 0; i < PRUETH_MAX_TX_TS_REQUESTS; i++) {
   686			if (!emac->tx_ts_skb[i]) {
   687				emac->tx_ts_skb[i] = ERR_PTR(-EBUSY); /* reserve slot */
   688				return i;
   689			}
   690		}
   691	
   692		return -EBUSY;
   693	}
   694	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
