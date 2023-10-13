Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8328B2B5F0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 22:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcYIgDpQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697235663; x=1728771663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GBOMjJLblQl5BdzLjzZZ/vnrcbHAogkQbKGduZAuf8s=;
  b=GcYIgDpQvDDC2wDP0quXWxwIzBScG01NliXoeifv2J1ERGA7Wk53Fmtv
   ZECddM5TTOMDN8YBQOCXNOqLeIacMfpRob63U2kiH/j1Q+m8j1kd+s/6V
   ClKAOo67TemtAs3FNfnbznfmgjDkLFBcfbHmZfHT2oZpKqqy2k4yS+p9Q
   lK9+gQG5Mo3Kw7RLa4ooc/b9wTzewi68V91HVup3djagzqaoSAOE//VNT
   qLKsJ0lByIYLzKHmHEUPYh7c3fRoOCopUn14OfqhwAAXzEmuCY32IsxGy
   yMVw9aN/eSAwthaN/5uSC3mUiDEpUUhhHA9C2cnvs2Qoyt9AgybLP3noc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364639898"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="364639898"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 15:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="928587227"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="928587227"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2023 15:20:56 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrQWc-0005Sa-1X;
	Fri, 13 Oct 2023 22:20:54 +0000
Date: Sat, 14 Oct 2023 06:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 4378/25021]
 drivers/crypto/caam/sm_test.c:505:6: warning: no previous prototype for
 'caam_sm_example_shutdown'
Message-ID: <202310140642.3rjbBVME-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steve,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: ea4b32b835174e520a45d12de5cdd18f9203658d [4378/25021] MLKU-25-3 crypto: caam - add Secure Memory support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231014/202310140642.3rjbBVME-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140642.3rjbBVME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140642.3rjbBVME-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/caam/sm_test.c:505:6: warning: no previous prototype for 'caam_sm_example_shutdown' [-Wmissing-prototypes]
     505 | void caam_sm_example_shutdown(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/caam_sm_example_shutdown +505 drivers/crypto/caam/sm_test.c

   504	
 > 505	void caam_sm_example_shutdown(void)
   506	{
   507		/* unused in present version */
   508		struct device_node *dev_node;
   509		struct platform_device *pdev;
   510	
   511		/*
   512		 * Do of_find_compatible_node() then of_find_device_by_node()
   513		 * once a functional device tree is available
   514		 */
   515		dev_node = of_find_compatible_node(NULL, NULL, "fsl,sec-v4.0");
   516		if (!dev_node) {
   517			dev_node = of_find_compatible_node(NULL, NULL, "fsl,sec4.0");
   518			if (!dev_node)
   519				return;
   520		}
   521	
   522		pdev = of_find_device_by_node(dev_node);
   523		if (!pdev)
   524			return;
   525	
   526		of_node_get(dev_node);
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
