Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84436E57F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693497598; x=1725033598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FhALCrDkruSFmkfreoSlUdPET91vVCBMnAAdbpL4cHc=;
  b=m6aO4DmKpXeBENx0BGovSdAETg2m/NeYIQflZvfaQig3wF7nQVz5xVuB
   PmcXWSGuYOuWdGO1XFDmMNUF6ktK916jC2QpcWRVjJuYqfBg2HNJyYwlJ
   SnPQ2fTKcwev0gY57j6P5ZohGxQl+Tx6RyU/I0br+01yiAV+jpATeXE0s
   csY8DnRqJGszbWi+KuICfEg95K1lZU8iO7B/jpfW9FQZMHOzvljt4CptI
   OdSIxuboeBQiW/cWhZiwzRZCEz3ETZBPTCIECaro5RIANAWjEQ5gxwyrD
   fH2gygmdUfHCz2emlxRMx/CVxzYzAyYvC8iiZyzmlSvl4s+k9bLL4p6Dd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462351464"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="462351464"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 08:59:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913335761"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="913335761"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Aug 2023 08:59:56 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbk5J-0000Jn-1W;
	Thu, 31 Aug 2023 15:59:53 +0000
Date: Thu, 31 Aug 2023 23:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 14036/24603]
 drivers/soc/imx/imx93-pd.c:113:34: warning: unused variable
 'imx93_power_domain_ids'
Message-ID: <202308312333.VlfUhjsY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: c7aa30ff9f1ace2dbacdb6cd2720606e7f74c4c5 [14036/24603] MLK-25894-4 soc: imx: add i.MX93 SRC power domain driver
config: riscv-randconfig-r015-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312333.VlfUhjsY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312333.VlfUhjsY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312333.VlfUhjsY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/imx93-pd.c:113:34: warning: unused variable 'imx93_power_domain_ids' [-Wunused-const-variable]
   static const struct of_device_id imx93_power_domain_ids[] = {
                                    ^
   1 warning generated.


vim +/imx93_power_domain_ids +113 drivers/soc/imx/imx93-pd.c

   112	
 > 113	static const struct of_device_id imx93_power_domain_ids[] = {
   114		{ .compatible = "fsl,imx93-src", .data = &imx93_plat_data, },
   115		{},
   116	};
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
