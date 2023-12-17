Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BACA10F2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 01:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEAlIT53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702776730; x=1734312730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jTn4oOXiFmqXvyXmu+euEZ5soa1NMZV/kxCzLJN+nuE=;
  b=BEAlIT53YYeBDqJ8jsaQtTDjLpeaegsT/ydYX+ol+EL1m2gNU7bf2hyi
   cIGSK2aWhrVPaLSWehA7quXNlpBdXK6mb+qT0xxgkQSBXZgifgQ0K5MrO
   m6l+KtrWqZ5BnErcYpsW29R5Z2XeHsIFpvVz08I9QDgb83A4Wkmlf7OJU
   y8wtiJbJP6YvXOz33wwIORZYbv9BDonc+VGmhg8fq1Ppah+FjIklfdwzj
   702cRix/NVNnetoK23fyOzj1Eb/pNmsaTINE7Q0r9fRtX6S8MuIXCs196
   /a+5FPyTUJm9ug6VlX+bgNdesSnL2u/w7cJESl19S7QlNZZRk4f7FzQ2T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="385816055"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="385816055"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 17:32:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="778690802"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="778690802"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Dec 2023 17:32:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEg0k-0002SH-1J;
	Sun, 17 Dec 2023 01:32:06 +0000
Date: Sun, 17 Dec 2023 09:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4839/16025]
 drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype
 for function 'int_imx_secvio_sc_check_state'
Message-ID: <202312170930.jPKx0Kjo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: e5c2ac92c948f8eab9eab1fd89a5c15437168e7d [4839/16025] Merge branch 'firmware/next' into next
config: i386-buildonly-randconfig-004-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170930.jPKx0Kjo-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170930.jPKx0Kjo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170930.jPKx0Kjo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype for function 'int_imx_secvio_sc_check_state' [-Wmissing-prototypes]
   int int_imx_secvio_sc_check_state(struct device *dev)
       ^
   drivers/soc/imx/secvio/imx-secvio-sc.c:140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int int_imx_secvio_sc_check_state(struct device *dev)
   ^
   static 
   drivers/soc/imx/secvio/imx-secvio-sc.c:377:29: warning: variable 'data' set but not used [-Wunused-but-set-variable]
           struct imx_secvio_sc_data *data;
                                      ^
   2 warnings generated.
--
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:35:5: warning: no previous prototype for function 'fuse_reader' [-Wmissing-prototypes]
   int fuse_reader(struct device *dev, u32 id, u32 *value, u8 mul)
       ^
   drivers/soc/imx/secvio/imx-secvio-debugfs.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fuse_reader(struct device *dev, u32 id, u32 *value, u8 mul)
   ^
   static 
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:56:5: warning: no previous prototype for function 'snvs_reader' [-Wmissing-prototypes]
   int snvs_reader(struct device *dev, u32 id, u32 *value, u8 mul)
       ^
   drivers/soc/imx/secvio/imx-secvio-debugfs.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int snvs_reader(struct device *dev, u32 id, u32 *value, u8 mul)
   ^
   static 
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:95:5: warning: no previous prototype for function 'snvs_dgo_reader' [-Wmissing-prototypes]
   int snvs_dgo_reader(struct device *dev, u32 id, u32 *value, u8 mul)
       ^
   drivers/soc/imx/secvio/imx-secvio-debugfs.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int snvs_dgo_reader(struct device *dev, u32 id, u32 *value, u8 mul)
   ^
   static 
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]


vim +/int_imx_secvio_sc_check_state +140 drivers/soc/imx/secvio/imx-secvio-sc.c

16674772de567c Franck LENORMAND 2019-12-05  139  
16674772de567c Franck LENORMAND 2019-12-05 @140  int int_imx_secvio_sc_check_state(struct device *dev)
16674772de567c Franck LENORMAND 2019-12-05  141  {
16674772de567c Franck LENORMAND 2019-12-05  142  	struct secvio_sc_notifier_info info = {0};
16674772de567c Franck LENORMAND 2019-12-05  143  	int ret = 0;
16674772de567c Franck LENORMAND 2019-12-05  144  
16674772de567c Franck LENORMAND 2019-12-05  145  	ret = int_imx_secvio_sc_get_state(dev, &info);
16674772de567c Franck LENORMAND 2019-12-05  146  	if (ret) {
16674772de567c Franck LENORMAND 2019-12-05  147  		dev_err(dev, "Failed to get secvio state\n");
16674772de567c Franck LENORMAND 2019-12-05  148  		goto exit;
16674772de567c Franck LENORMAND 2019-12-05  149  	}
16674772de567c Franck LENORMAND 2019-12-05  150  
16674772de567c Franck LENORMAND 2019-12-05  151  	/* Call chain of CB registered to this module if status detected */
16674772de567c Franck LENORMAND 2019-12-05  152  	if (info.hpsvs || info.lps || info.lptds)
16674772de567c Franck LENORMAND 2019-12-05  153  		if (imx_secvio_sc_notifier_call_chain(&info))
16674772de567c Franck LENORMAND 2019-12-05  154  			dev_warn(dev,
16674772de567c Franck LENORMAND 2019-12-05  155  				 "Issues when calling the notifier chain\n");
16674772de567c Franck LENORMAND 2019-12-05  156  
16674772de567c Franck LENORMAND 2019-12-05  157  exit:
16674772de567c Franck LENORMAND 2019-12-05  158  	return ret;
16674772de567c Franck LENORMAND 2019-12-05  159  }
16674772de567c Franck LENORMAND 2019-12-05  160  

:::::: The code at line 140 was first introduced by commit
:::::: 16674772de567c3aa328f328af2ae484abc4edd0 SSI-87: soc: imx: secvio: Add support for SNVS secvio and tamper via SCFW

:::::: TO: Franck LENORMAND <franck.lenormand@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
