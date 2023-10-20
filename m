Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847AF2106
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 04:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXMx9IrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697775652; x=1729311652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1NKJOgFiYp6r56S1j9JoAS1hb15ozvjmp/7fjK0pOnU=;
  b=YXMx9IrD67zMVuca9mzg+/8IkVN59mszq14DglV/bK6uwMUE3K6nsS5R
   4Ynkw26lAU0xsYg0NScySLajYpdmxBmHWWmesKTam+WmlqWjtgdLyg0QW
   jRAvg/q+idPolepCoB91Jyryyc23NC+Mi71ySX4+3uWw1oTPmDCgLf205
   UO5d9L2Feh0hLhAFVCdbDuGeomTcWsuT0WlFiUIX5r+QnaGq1Sf0+YmO+
   vckttA2eY/4+tV2Ckp78Hn09r51yv/gVl/zO2MurE1WehZTdvJ9+oL2P+
   ifxfj+daFrr//NkgmKx8PTGBX+rIAPi0tyLhoIolU+CRu++49iIS5uFZF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="472651382"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="472651382"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 21:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="823097251"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="823097251"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 19 Oct 2023 21:20:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qth09-0002zo-0K;
	Fri, 20 Oct 2023 04:20:45 +0000
Date: Fri, 20 Oct 2023 12:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Nagalla <hnagalla@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 4/6]
 drivers/remoteproc/ti_k3_r5_remoteproc.c:171: warning: Function parameter or
 member 'shut_comp' not described in 'k3_r5_rproc'
Message-ID: <202310201236.P30nlCqx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   38a98255160c16faffc9442c6f68f529852fc140
commit: 1db4571a37a91dac5c68e6bb3337151028e4d52f [4/6] remoteproc: k3-r5: support for graceful stop of remote cores
config: arm64-randconfig-004-20231020 (https://download.01.org/0day-ci/archive/20231020/202310201236.P30nlCqx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201236.P30nlCqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201236.P30nlCqx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/ti_k3_r5_remoteproc.c:171: warning: Function parameter or member 'shut_comp' not described in 'k3_r5_rproc'


vim +171 drivers/remoteproc/ti_k3_r5_remoteproc.c

6dedbd1d544389 Suman Anna   2020-10-02  149  
6dedbd1d544389 Suman Anna   2020-10-02  150  /**
6dedbd1d544389 Suman Anna   2020-10-02  151   * struct k3_r5_rproc - K3 remote processor state
6dedbd1d544389 Suman Anna   2020-10-02  152   * @dev: cached device pointer
6dedbd1d544389 Suman Anna   2020-10-02  153   * @cluster: cached pointer to parent cluster structure
6dedbd1d544389 Suman Anna   2020-10-02  154   * @mbox: mailbox channel handle
6dedbd1d544389 Suman Anna   2020-10-02  155   * @client: mailbox client to request the mailbox channel
6dedbd1d544389 Suman Anna   2020-10-02  156   * @rproc: rproc handle
6dedbd1d544389 Suman Anna   2020-10-02  157   * @core: cached pointer to r5 core structure being used
6dedbd1d544389 Suman Anna   2020-10-02  158   * @rmem: reserved memory regions data
6dedbd1d544389 Suman Anna   2020-10-02  159   * @num_rmems: number of reserved memory regions
6dedbd1d544389 Suman Anna   2020-10-02  160   */
6dedbd1d544389 Suman Anna   2020-10-02  161  struct k3_r5_rproc {
6dedbd1d544389 Suman Anna   2020-10-02  162  	struct device *dev;
6dedbd1d544389 Suman Anna   2020-10-02  163  	struct k3_r5_cluster *cluster;
6dedbd1d544389 Suman Anna   2020-10-02  164  	struct mbox_chan *mbox;
6dedbd1d544389 Suman Anna   2020-10-02  165  	struct mbox_client client;
6dedbd1d544389 Suman Anna   2020-10-02  166  	struct rproc *rproc;
6dedbd1d544389 Suman Anna   2020-10-02  167  	struct k3_r5_core *core;
6dedbd1d544389 Suman Anna   2020-10-02  168  	struct k3_r5_mem *rmem;
6dedbd1d544389 Suman Anna   2020-10-02  169  	int num_rmems;
1db4571a37a91d Hari Nagalla 2023-10-18  170  	struct completion shut_comp;
6dedbd1d544389 Suman Anna   2020-10-02 @171  };
6dedbd1d544389 Suman Anna   2020-10-02  172  

:::::: The code at line 171 was first introduced by commit
:::::: 6dedbd1d544389d6ab1727423348572a11e9df5d remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem

:::::: TO: Suman Anna <s-anna@ti.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
