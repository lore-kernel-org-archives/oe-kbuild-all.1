Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C116437D00
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 22:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQ/iuoCe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702764782; x=1734300782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wFLtp57tnBYCYhqY13rsLAftZV/oyMsivm6hbz0gHQw=;
  b=ZQ/iuoCeDm7DFmZ5masdjeNvHyPTDX3zIFGIr/vGuzvf98ukrV4Sbbn4
   yl8A6pmIihtv2L8CIRqgv+lBIGmQVvXA3AQtATEBbAUufAUFai63elcab
   wbnTaMRXZeXlXhncDv7iVRn3XEO3IHSrbTI7//P55WN+rgGFzHwuCaj6J
   mO7C2xktjntJTf4EbGJZJamJpys1BRcsBdZ1hqon7w1CjNyBwhLUDmld1
   pEzWl01WgnDxwd55NF0WSXrSZv11lJhLfCK94SgDPFhPndnRd6qtiEejY
   GSeSsBMb7pxkVe4yaeXfkCukhNY5oV/bhJoY8c2nQ+ILMKQ6sKS2eJfQy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="8815296"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="8815296"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 14:13:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="845504175"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="845504175"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2023 14:13:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEcu3-0002Gc-10;
	Sat, 16 Dec 2023 22:12:59 +0000
Date: Sun, 17 Dec 2023 06:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 96/16025]
 drivers/soc/imx/secvio/imx-secvio-audit.c:11:5: warning: no previous
 prototype for function 'report_to_audit_notify'
Message-ID: <202312170615.uVBLYNgr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: cd9683884471cc5198c0d1ca3098a52606f89c44 [96/16025] SSI-87: soc: imx: secvio: Report to audit FW all security violations
config: i386-buildonly-randconfig-004-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170615.uVBLYNgr-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170615.uVBLYNgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170615.uVBLYNgr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/secvio/imx-secvio-audit.c:11:5: warning: no previous prototype for function 'report_to_audit_notify' [-Wmissing-prototypes]
   int report_to_audit_notify(struct notifier_block *nb, unsigned long status,
       ^
   drivers/soc/imx/secvio/imx-secvio-audit.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int report_to_audit_notify(struct notifier_block *nb, unsigned long status,
   ^
   static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]


vim +/report_to_audit_notify +11 drivers/soc/imx/secvio/imx-secvio-audit.c

    10	
  > 11	int report_to_audit_notify(struct notifier_block *nb, unsigned long status,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
