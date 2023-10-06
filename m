Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C231D69A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRWrvh/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696596274; x=1728132274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KDV9Q7v6w7NxbZwSmJ1KGY0KMmrRQm4pceT0Mes1vok=;
  b=LRWrvh/e89RuYE8jwNZIWGg4exVxhahefrLQ3Dt0PgNQ+d1SWd17CpbT
   gNbETyxrm3/HGs4drKZAJoXXFbyQvxrKTaO0oDD+FSNDTtCt7A4jw8H38
   82/R9HcNjJskY96QezRxyYMRYa6BiLw5Z4gk2+0MVDgjLAliYEFcav/R3
   +Cy2xOfX3hEP2//FJGqXmSKaSCDjolYKgVGIyHXnBL29fhIdbE/WbdJdD
   kZ2hycgndK8ff7/N2zIO1XrRlRZ71NCrnZ+NhXRqH6E/1lHJixtrw+21S
   9KSPZd7/S01NpGLByu1hke2lwhVNSKNjJ5czvxBl/xdYXjhbDV3Cfh58s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="381024895"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="381024895"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 05:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="752181743"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="752181743"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Oct 2023 05:44:29 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qokBv-00005d-0c;
	Fri, 06 Oct 2023 12:44:27 +0000
Date: Fri, 6 Oct 2023 20:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Sekhar Nori <nsekhar@ti.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: drivers/remoteproc/da8xx_remoteproc.c:80: warning: Function
 parameter or member 'dsp_reset' not described in 'da8xx_rproc'
Message-ID: <202310062044.AWGLMitV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bartosz,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b78b18fb8ee19f7a05f20c3abc865b3bfe182884
commit: b2201ee554a5811f569f31280b0079e7d6177606 remoteproc/davinci: use the reset framework
date:   5 years ago
config: arm-randconfig-004-20230928 (https://download.01.org/0day-ci/archive/20231006/202310062044.AWGLMitV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310062044.AWGLMitV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310062044.AWGLMitV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/da8xx_remoteproc.c:80: warning: Function parameter or member 'dsp_reset' not described in 'da8xx_rproc'
   drivers/remoteproc/da8xx_remoteproc.c:89: warning: Function parameter or member 'irq' not described in 'handle_event'
   drivers/remoteproc/da8xx_remoteproc.c:89: warning: Function parameter or member 'p' not described in 'handle_event'
   drivers/remoteproc/da8xx_remoteproc.c:109: warning: Function parameter or member 'irq' not described in 'da8xx_rproc_callback'
   drivers/remoteproc/da8xx_remoteproc.c:109: warning: Function parameter or member 'p' not described in 'da8xx_rproc_callback'


vim +80 drivers/remoteproc/da8xx_remoteproc.c

59b2355fc90e4a Suman Anna          2017-08-01  56  
13be5432d8721d Robert Tivy         2013-04-09  57  /**
13be5432d8721d Robert Tivy         2013-04-09  58   * struct da8xx_rproc - da8xx remote processor instance state
13be5432d8721d Robert Tivy         2013-04-09  59   * @rproc: rproc handle
59b2355fc90e4a Suman Anna          2017-08-01  60   * @mem: internal memory regions data
59b2355fc90e4a Suman Anna          2017-08-01  61   * @num_mems: number of internal memory regions
13be5432d8721d Robert Tivy         2013-04-09  62   * @dsp_clk: placeholder for platform's DSP clk
13be5432d8721d Robert Tivy         2013-04-09  63   * @ack_fxn: chip-specific ack function for ack'ing irq
13be5432d8721d Robert Tivy         2013-04-09  64   * @irq_data: ack_fxn function parameter
13be5432d8721d Robert Tivy         2013-04-09  65   * @chipsig: virt ptr to DSP interrupt registers (CHIPSIG & CHIPSIG_CLR)
13be5432d8721d Robert Tivy         2013-04-09  66   * @bootreg: virt ptr to DSP boot address register (HOST1CFG)
13be5432d8721d Robert Tivy         2013-04-09  67   * @irq: irq # used by this instance
13be5432d8721d Robert Tivy         2013-04-09  68   */
13be5432d8721d Robert Tivy         2013-04-09  69  struct da8xx_rproc {
13be5432d8721d Robert Tivy         2013-04-09  70  	struct rproc *rproc;
59b2355fc90e4a Suman Anna          2017-08-01  71  	struct da8xx_rproc_mem *mem;
59b2355fc90e4a Suman Anna          2017-08-01  72  	int num_mems;
13be5432d8721d Robert Tivy         2013-04-09  73  	struct clk *dsp_clk;
b2201ee554a581 Bartosz Golaszewski 2018-06-21  74  	struct reset_control *dsp_reset;
13be5432d8721d Robert Tivy         2013-04-09  75  	void (*ack_fxn)(struct irq_data *data);
13be5432d8721d Robert Tivy         2013-04-09  76  	struct irq_data *irq_data;
13be5432d8721d Robert Tivy         2013-04-09  77  	void __iomem *chipsig;
13be5432d8721d Robert Tivy         2013-04-09  78  	void __iomem *bootreg;
13be5432d8721d Robert Tivy         2013-04-09  79  	int irq;
13be5432d8721d Robert Tivy         2013-04-09 @80  };
13be5432d8721d Robert Tivy         2013-04-09  81  

:::::: The code at line 80 was first introduced by commit
:::::: 13be5432d8721d89cadae105663761f45f427842 remoteproc/davinci: add a remoteproc driver for OMAP-L13x DSP

:::::: TO: Robert Tivy <rtivy@ti.com>
:::::: CC: Ohad Ben-Cohen <ohad@wizery.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
