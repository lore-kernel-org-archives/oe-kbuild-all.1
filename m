Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CBA10E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 21:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680212815; x=1711748815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=itg25QpGRwVgL1DjeEmQwqbjU37j9kGLyMOUrMWHz3s=;
  b=J9MiOTtyrGaRrUB+chzSlHADWFb7Pwast0mIxcw1eWIwTpInRs1Gjajn
   eNDexkhETpU/0fBi82mZv+vgKqH1+o9GjR9AJtxTb29+U2pVeGx+bqvuf
   C5HLIIcqAScMJ5A2CTjG69VEOHpXULGjUO1ZOQc2N1+FRWWUtduFNwXfF
   BX5l7vr9mgADBr24jJzq23DKR2X4Esae3lEhwchlABNMlg6tA13wBhW8w
   4IKMLSOtu9wlJHAH1wV+fjd7JxArHmX5xLFJD5Zfopt80L8yoAkZu9n3R
   mqo3t4g5zICzbmJ/96jfcIpkILMgYXFCQaHtXr7AFZoGxq30M6JFLmtyu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="403991628"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="403991628"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 14:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="717481357"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="717481357"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Mar 2023 14:46:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi05z-000LEo-1L;
	Thu, 30 Mar 2023 21:46:11 +0000
Date: Fri, 31 Mar 2023 05:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/perf/thunderx2_pmu.c:556:9: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202303310503.uOPChyY0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8bb95a1662f8b97c443984550a7aefbe5a1a064e
commit: f3c0eba287049237b23d1300376768293eb89e69 perf: Add a few assertions
date:   7 months ago
config: loongarch-randconfig-s033-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310503.uOPChyY0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3c0eba287049237b23d1300376768293eb89e69
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f3c0eba287049237b23d1300376768293eb89e69
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash arch/loongarch/kernel/ drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310503.uOPChyY0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/thunderx2_pmu.c:556:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     expected void *ptr
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     got unsigned int [noderef] __percpu *
>> drivers/perf/thunderx2_pmu.c:556:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     expected void *ptr
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     got unsigned int [noderef] __percpu *
>> drivers/perf/thunderx2_pmu.c:556:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     expected void *ptr
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     got unsigned int [noderef] __percpu *
>> drivers/perf/thunderx2_pmu.c:556:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     expected void *ptr
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     got unsigned int [noderef] __percpu *
>> drivers/perf/thunderx2_pmu.c:556:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     expected void *ptr
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     got int [noderef] __percpu *
>> drivers/perf/thunderx2_pmu.c:556:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     expected void *ptr
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     got int [noderef] __percpu *
>> drivers/perf/thunderx2_pmu.c:556:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     expected void *ptr
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     got int [noderef] __percpu *
>> drivers/perf/thunderx2_pmu.c:556:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     expected void *ptr
   drivers/perf/thunderx2_pmu.c:556:9: sparse:     got int [noderef] __percpu *

vim +556 drivers/perf/thunderx2_pmu.c

69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  539  
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  540  /*
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  541   * Make sure the group of events can be scheduled at once
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  542   * on the PMU.
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  543   */
5e2c27e833bb924 Ganapatrao Prabhakerrao Kulkarni 2019-10-16  544  static bool tx2_uncore_validate_event_group(struct perf_event *event,
5e2c27e833bb924 Ganapatrao Prabhakerrao Kulkarni 2019-10-16  545  		int max_counters)
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  546  {
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  547  	struct perf_event *sibling, *leader = event->group_leader;
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  548  	int counters = 0;
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  549  
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  550  	if (event->group_leader == event)
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  551  		return true;
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  552  
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  553  	if (!tx2_uncore_validate_event(event->pmu, leader, &counters))
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  554  		return false;
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  555  
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06 @556  	for_each_sibling_event(sibling, leader) {
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  557  		if (!tx2_uncore_validate_event(event->pmu, sibling, &counters))
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  558  			return false;
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  559  	}
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  560  
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  561  	if (!tx2_uncore_validate_event(event->pmu, event, &counters))
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  562  		return false;
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  563  
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  564  	/*
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  565  	 * If the group requires more counters than the HW has,
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  566  	 * it cannot ever be scheduled.
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  567  	 */
5e2c27e833bb924 Ganapatrao Prabhakerrao Kulkarni 2019-10-16  568  	return counters <= max_counters;
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  569  }
69c32972d59388c Kulkarni, Ganapatrao             2018-12-06  570  

:::::: The code at line 556 was first introduced by commit
:::::: 69c32972d59388c041268e8206e8eb1acff29b9a drivers/perf: Add Cavium ThunderX2 SoC UNCORE PMU driver

:::::: TO: Kulkarni, Ganapatrao <Ganapatrao.Kulkarni@cavium.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
