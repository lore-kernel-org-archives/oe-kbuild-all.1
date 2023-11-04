Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED37B154AD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2x3vNlY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699098536; x=1730634536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xS3FTJ90QAKgDzcV+OZDIlWpFbssrgAMTTv3AR+zXSA=;
  b=X2x3vNlY+vgD9frO1za+qwdNnx2NCtPUvM82LoMofglDWVvGal77156L
   w7aWxkMUkT5pUN0ojrOVYd5NKQ9cfnrPeZ+BEAJ2s5RbWU1w23Dxfg3xv
   2r6pTKqVCVd3xNc/2BL4XJR+qnNZ2ws1G+4fg9fqtMG+oGympLMgmOBBo
   abSshjRf8XVGSsaN1Hh6p3dGQZ8OHrPywj2K0GWMJBoI2CYD4IiMwe6SO
   Duce0LrYadNHlpsqWdAL+Auj5NmZBq5I9FurqPNawAnMLgjtj9zHD7xpC
   3ijFY90t8fvgFkOiC8M3NJWIwsNk1H4G6cnRQGFLvAAKdfCIye/MEjtER
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="10615226"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="10615226"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 04:48:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,277,1694761200"; 
   d="scan'208";a="9997434"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Nov 2023 04:48:54 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzF91-0004Id-1d;
	Sat, 04 Nov 2023 11:48:51 +0000
Date: Sat, 4 Nov 2023 19:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Geetha sowjanya <gakula@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sunil Goutham <sgoutham@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c:535:36:
 warning: '%d' directive writing between 1 and 11 bytes into a region of size
 7
Message-ID: <202311041952.XgfdAuan-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geetha,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90b0c2b2edd1adff742c621e246562fbefa11b70
commit: d06c2aba51631bf6cd32a2f8f1edd67c110ade8a octeontx2-af: cn10k: mcs: Add debugfs support
date:   1 year, 1 month ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231104/202311041952.XgfdAuan-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041952.XgfdAuan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041952.XgfdAuan-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c: In function 'rvu_dbg_mcs_init':
>> drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c:535:36: warning: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Wformat-overflow=]
     535 |                 sprintf(dname, "mcs%d", i);
         |                                    ^~
   drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c:535:32: note: directive argument in the range [-2147483641, 2147483646]
     535 |                 sprintf(dname, "mcs%d", i);
         |                                ^~~~~~~
   drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c:535:17: note: 'sprintf' output between 5 and 15 bytes into a destination of size 10
     535 |                 sprintf(dname, "mcs%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +535 drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c

   520	
   521	static void rvu_dbg_mcs_init(struct rvu *rvu)
   522	{
   523		struct mcs *mcs;
   524		char dname[10];
   525		int i;
   526	
   527		if (!rvu->mcs_blk_cnt)
   528			return;
   529	
   530		rvu->rvu_dbg.mcs_root = debugfs_create_dir("mcs", rvu->rvu_dbg.root);
   531	
   532		for (i = 0; i < rvu->mcs_blk_cnt; i++) {
   533			mcs = mcs_get_pdata(i);
   534	
 > 535			sprintf(dname, "mcs%d", i);
   536			rvu->rvu_dbg.mcs = debugfs_create_dir(dname,
   537							      rvu->rvu_dbg.mcs_root);
   538	
   539			rvu->rvu_dbg.mcs_rx = debugfs_create_dir("rx_stats", rvu->rvu_dbg.mcs);
   540	
   541			debugfs_create_file("flowid", 0600, rvu->rvu_dbg.mcs_rx, mcs,
   542					    &rvu_dbg_mcs_rx_flowid_stats_fops);
   543	
   544			debugfs_create_file("secy", 0600, rvu->rvu_dbg.mcs_rx, mcs,
   545					    &rvu_dbg_mcs_rx_secy_stats_fops);
   546	
   547			debugfs_create_file("sc", 0600, rvu->rvu_dbg.mcs_rx, mcs,
   548					    &rvu_dbg_mcs_rx_sc_stats_fops);
   549	
   550			debugfs_create_file("sa", 0600, rvu->rvu_dbg.mcs_rx, mcs,
   551					    &rvu_dbg_mcs_rx_sa_stats_fops);
   552	
   553			debugfs_create_file("port", 0600, rvu->rvu_dbg.mcs_rx, mcs,
   554					    &rvu_dbg_mcs_rx_port_stats_fops);
   555	
   556			rvu->rvu_dbg.mcs_tx = debugfs_create_dir("tx_stats", rvu->rvu_dbg.mcs);
   557	
   558			debugfs_create_file("flowid", 0600, rvu->rvu_dbg.mcs_tx, mcs,
   559					    &rvu_dbg_mcs_tx_flowid_stats_fops);
   560	
   561			debugfs_create_file("secy", 0600, rvu->rvu_dbg.mcs_tx, mcs,
   562					    &rvu_dbg_mcs_tx_secy_stats_fops);
   563	
   564			debugfs_create_file("sc", 0600, rvu->rvu_dbg.mcs_tx, mcs,
   565					    &rvu_dbg_mcs_tx_sc_stats_fops);
   566	
   567			debugfs_create_file("sa", 0600, rvu->rvu_dbg.mcs_tx, mcs,
   568					    &rvu_dbg_mcs_tx_sa_stats_fops);
   569	
   570			debugfs_create_file("port", 0600, rvu->rvu_dbg.mcs_tx, mcs,
   571					    &rvu_dbg_mcs_tx_port_stats_fops);
   572		}
   573	}
   574	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
