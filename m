Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AB87F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 13:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692710475; x=1724246475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n2gAMHFAz24J0vHWRl+NrxZrmWdH0CqeHNF4AsICBIM=;
  b=P03aZcyjc13W33dRaBnlnngnna5Hu2tG83cFLNQYvTFnKqhHj3Wg/IeV
   k8981MByxOLMSXhQwWlCpOon1DNPD4TdT0uBLkeusQ5BlHTqe/cx9mHin
   P4j2JQtczYmeB46AOx8kD4pb8pToLrtQharQPgQu2DEsRAq5HaVii3k75
   yNgh37NBi/HVDh+2hDG+nv8AZFgCqE6VWfXgpD9/mSp4xeQR3EcmiJ/lQ
   1RA4c9DSDiJGiHBm7zwJ0gcIntFkP+IEOPC+xDk5UPlNhjNhyw0UerdBI
   swBU1iCUwLAHVsAzDVp3SJ31+O3HIQcTzy6SJXJW3K4Up+MwYTsJWPYX3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354214021"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="354214021"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 06:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="859919756"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="859919756"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Aug 2023 06:20:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYRJZ-0000D1-15;
	Tue, 22 Aug 2023 13:20:57 +0000
Date: Tue, 22 Aug 2023 21:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/5]
 drivers/irqchip/irq-gic-v3.c:1426:12: warning: 'gic_v3_suspend' defined but
 not used
Message-ID: <202308222156.QsG1CrXj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   722f6cc09c1d2f510f785fc9a1507d847a181618
commit: 275c8705e576de90245e23a3f8cf45c872d4e724 [1/5] ANDROID: irqchip/irq-gic-v3: Add vendor hook for gic suspend
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20230822/202308222156.QsG1CrXj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308222156.QsG1CrXj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308222156.QsG1CrXj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:1426:12: warning: 'gic_v3_suspend' defined but not used [-Wunused-function]
    1426 | static int gic_v3_suspend(void) { return 0; }
         |            ^~~~~~~~~~~~~~


vim +/gic_v3_suspend +1426 drivers/irqchip/irq-gic-v3.c

  1422	
  1423	#else
  1424	static inline void gic_syscore_init(void) { }
  1425	void gic_v3_resume(void) { }
> 1426	static int gic_v3_suspend(void) { return 0; }
  1427	#endif
  1428	
  1429	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
