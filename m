Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D689C210FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTfgOQxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705154647; x=1736690647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sIagwPwOAueElpqqx8sL0/CYUj2+Uj8CJ1quEbZ/1po=;
  b=lTfgOQxS932bRtDXGdBDovqjhVWcBbaMLuMjfbUDQN3JaW3Z0nQgdOpA
   G7RHlKuTzK+Xz+LhtohzLeiaAE3mUiqE2OcEO/OKQD1RMMvnc4cDHTtqp
   /hg/OLJjsoqQaiBZQKSs5hEPpyWHRdPqMOr+uhTigtivdJrn6+oEfD8r6
   qpyr0tNNmle0lKKlL1a2UWdXyCZoi6x00cR8AcoIrp47Qqx+f9cAh46AE
   8ZifAKRhsv6JBBCnhp3ANSiW4XizsUviudrJHi4kyxsEOp5JuEV7DFczn
   sRIyVtwpe1HnSMvb8e60IbTsX+zcrAQl4jl4bsVzo4LcsmC5d98oRjDFB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6099277"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6099277"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 06:04:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="25012324"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2024 06:04:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOec8-000AYk-3B;
	Sat, 13 Jan 2024 14:04:00 +0000
Date: Sat, 13 Jan 2024 22:02:49 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Dang <nam.dang.uw@rvc.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dien Pham <dien.pham.ry@renesas.com>,
	Tho Vu <tho.vu.wh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [morimoto:renesas-bsp/v6.1.71-2024-01-10 281/551]
 drivers/soc/renesas/rcar-sysc.c:306:21: sparse: sparse: symbol
 'rcar_domains' was not declared. Should it be static?
Message-ID: <202401132124.75V3a080-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.71-2024-01-10
head:   7942223d600b4cbaffeb04e8a3d6695f7a46e49d
commit: 1975b0b1dfed22c19ac690e91a9663373801e9b7 [281/551] soc: renesas: rcar-sysc: Remove power domains always on for M3N v1.0
config: parisc-randconfig-r121-20240113 (https://download.01.org/0day-ci/archive/20240113/202401132124.75V3a080-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240113/202401132124.75V3a080-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401132124.75V3a080-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/renesas/rcar-sysc.c:306:21: sparse: sparse: symbol 'rcar_domains' was not declared. Should it be static?
   drivers/soc/renesas/rcar-sysc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false

vim +/rcar_domains +306 drivers/soc/renesas/rcar-sysc.c

dcc09fd143bb97 Geert Uytterhoeven 2016-04-20  305  
8d288f1e408132 Dien Pham          2018-03-15 @306  struct rcar_sysc_pd *rcar_domains[RCAR_PD_ALWAYS_ON + 1];
8d288f1e408132 Dien Pham          2018-03-15  307  

:::::: The code at line 306 was first introduced by commit
:::::: 8d288f1e408132a5e8cf92c56cd6133a85a2911a soc: renesas: rcar-sysc: Improve power domains always on implementation

:::::: TO: Dien Pham <dien.pham.ry@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
