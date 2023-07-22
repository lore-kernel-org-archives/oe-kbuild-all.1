Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10C963A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 19:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690054544; x=1721590544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Qg6xxhaj2sxccWdzD6+JYbWit09n9QynIucPB3b+Ok=;
  b=XdpiyyzHBME3ZmU/8Rk0ap4xo3GneKOXaYD6OMbss8vcJo/vRium2rTx
   2mgmqUkUFhEHsyhGoDyW9yvLpLJ0R3HNYt1AZEdGTZG585Yg96zcoXjQu
   YzExoI5DluytPiKdnmYB/aZE4hv31QIgkBSVjAEaDzRnOmIX705DFHuZu
   gU3xh8zWJH2NB80XShzoFeuRYeJRiFvEq2agfXFLXoaF9uxpls8xy93FJ
   Dny4rCBXFXWe4yVmjgvFRUX7ypa0BikV9aWJIe2HpnCbJWWyxAgjbalYx
   e7A1hiQJ6OkOJEEP3GGNyW8FmTdJ3+61dACbaS9xezRnaDr9s5Zr1r91R
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="364683166"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="364683166"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 12:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="790531162"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="790531162"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Jul 2023 12:35:41 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNIOD-0008Y5-0y;
	Sat, 22 Jul 2023 19:35:41 +0000
Date: Sun, 23 Jul 2023 03:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 10/67]
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:101:6: warning: no
 previous prototype for 'bm_dwmac_exit'
Message-ID: <202307230315.78gyMiR4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: 3fc9ba07e5bfa5e8111bec33199a96237a3efd78 [10/67] driver: net: Add sophgo sg2042 soc support
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230723/202307230315.78gyMiR4-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230315.78gyMiR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230315.78gyMiR4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:101:6: warning: no previous prototype for 'bm_dwmac_exit' [-Wmissing-prototypes]
     101 | void bm_dwmac_exit(struct platform_device *pdev, void *priv)
         |      ^~~~~~~~~~~~~


vim +/bm_dwmac_exit +101 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

   100	
 > 101	void bm_dwmac_exit(struct platform_device *pdev, void *priv)
   102	{
   103		struct bm_mac *bsp_priv = priv;
   104	
   105		clk_disable_unprepare(bsp_priv->gate_clk_tx);
   106		clk_disable_unprepare(bsp_priv->gate_clk_ref);
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
