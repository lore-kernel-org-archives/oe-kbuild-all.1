Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0226510EB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 01:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693444359; x=1724980359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MMPLTsvYfQL2pXAOhpnZ50t/xkZ8x1KqMg+UHa7vHdo=;
  b=OnBM8BUWsKrTfLapAWs2mmousqk5+ojCXR4yNq6cVjYEMS2JSI4oGi7X
   HkHIjiVCh/98HJ6GaXnKZEVJ1rJwh36d9RHiLOQrAADsezx99OHaHGIIg
   pejkTuyDVKquiQXCqpa8dYjly0XI9/lOT9t85fYMKKUB7k6o+gIBxPIxN
   1/SBEOEU4txqBDJv5Ou+0WKWnIU9bcsydevgBtuocbzquR1VL5BRK54VY
   RujHrMFomYFGwinFE3Vsnlg1JqDgcUQY2OwVUaHcGLSjz2QVnsS+Cb3Y0
   mriNjqMHacK2bXhvKtPf5Qf4efCbRNxbs8+I7aJyg6Ou9gDrKEuAGqzSH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355286451"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="355286451"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 18:12:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="768611246"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="768611246"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Aug 2023 18:12:36 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbWEd-000AR9-2h;
	Thu, 31 Aug 2023 01:12:35 +0000
Date: Thu, 31 Aug 2023 09:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 103/24603]
 drivers/soc/imx/secvio/imx-secvio-audit.c:11:5: warning: no previous
 prototype for 'report_to_audit_notify'
Message-ID: <202308310950.tHIpAxmq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Franck,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: c3fac112cb1c6dd2081447740128870ab016d24c [103/24603] SSI-87: soc: imx: secvio: Report to audit FW all security violations
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308310950.tHIpAxmq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310950.tHIpAxmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310950.tHIpAxmq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/secvio/imx-secvio-audit.c:11:5: warning: no previous prototype for 'report_to_audit_notify' [-Wmissing-prototypes]
      11 | int report_to_audit_notify(struct notifier_block *nb, unsigned long status,
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/report_to_audit_notify +11 drivers/soc/imx/secvio/imx-secvio-audit.c

    10	
  > 11	int report_to_audit_notify(struct notifier_block *nb, unsigned long status,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
