Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994D8137A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 03:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGT5Emr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697773309; x=1729309309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ADFcV8i0ViKMGkkNw/Ml+bUZGyZs09THd4XAZKiyn0M=;
  b=BGT5Emr4WQj4teO6BmccHSdTS0xfRVsrB74aV76g9oNbyKnGnxoxv5iK
   fPeCCxwGqk5jV9NLuBLvP3zUbevyntWmDxw+55I33HfxEH0FPThQh5W6m
   KcrzAUCU5nB6TH2JeTturGnRzXeb+dJ3kLOEhOocEpn9pptxC+TMzHupR
   5Vu0VVosbKorrItwXD0QZDqjTHvkG6lL4ODo2Is1pstmRtrIT9HJkIgWs
   CT6oh20yMNsw3QdNMJM8dNJ6F5twzleliWIpRtjuwkztyPt7p8pMW1z+c
   Nl14f5nqumtfsVinT04fU4dr/+78jN56RSdiunNbNu/KVE9HMay3whaCd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7987606"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="7987606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 20:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5245097"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2023 20:41:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtgON-0002wq-1D;
	Fri, 20 Oct 2023 03:41:43 +0000
Date: Fri, 20 Oct 2023 11:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.4-2.3.x-imx 2684/30000]
 drivers/staging/fsl_ppfe/pfe_firmware.c:218:24: error:
 'UTIL_FIRMWARE_FILENAME' undeclared; did you mean 'TMU_FIRMWARE_FILENAME'?
Message-ID: <202310201115.nk51UtyR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Calvin,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 5.4-2.3.x-imx
head:   bcde5677c4cabfef7080ffc2fef17275144a0517
commit: d736dfa7d054e98672782e299b766f53d5e14857 [2684/30000] staging: fsl_ppfe/eth: add pfe support to Kconfig and Makefile
config: x86_64-randconfig-161-20231020 (https://download.01.org/0day-ci/archive/20231020/202310201115.nk51UtyR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201115.nk51UtyR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201115.nk51UtyR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/fsl_ppfe/pfe_firmware.c:125:5: warning: no previous prototype for 'pfe_load_elf' [-Wmissing-prototypes]
     125 | int pfe_load_elf(int pe_mask, const struct firmware *fw, struct pfe *pfe)
         |     ^~~~~~~~~~~~
   drivers/staging/fsl_ppfe/pfe_firmware.c: In function 'pfe_firmware_init':
>> drivers/staging/fsl_ppfe/pfe_firmware.c:218:24: error: 'UTIL_FIRMWARE_FILENAME' undeclared (first use in this function); did you mean 'TMU_FIRMWARE_FILENAME'?
     218 |         util_fw_name = UTIL_FIRMWARE_FILENAME;
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        TMU_FIRMWARE_FILENAME
   drivers/staging/fsl_ppfe/pfe_firmware.c:218:24: note: each undeclared identifier is reported only once for each function it appears in


vim +218 drivers/staging/fsl_ppfe/pfe_firmware.c

520f8c5cf58632 Calvin Johnson 2017-09-16  216  
520f8c5cf58632 Calvin Johnson 2017-09-16  217  #if !defined(CONFIG_FSL_PPFE_UTIL_DISABLED)
520f8c5cf58632 Calvin Johnson 2017-09-16 @218  	util_fw_name = UTIL_FIRMWARE_FILENAME;
520f8c5cf58632 Calvin Johnson 2017-09-16  219  
520f8c5cf58632 Calvin Johnson 2017-09-16  220  	if (request_firmware(&util_fw, util_fw_name, pfe->dev)) {
520f8c5cf58632 Calvin Johnson 2017-09-16  221  		pr_err("%s: request firmware %s failed\n", __func__,
520f8c5cf58632 Calvin Johnson 2017-09-16  222  		       util_fw_name);
520f8c5cf58632 Calvin Johnson 2017-09-16  223  		rc = -ETIMEDOUT;
520f8c5cf58632 Calvin Johnson 2017-09-16  224  		goto err2;
520f8c5cf58632 Calvin Johnson 2017-09-16  225  	}
520f8c5cf58632 Calvin Johnson 2017-09-16  226  #endif
520f8c5cf58632 Calvin Johnson 2017-09-16  227  	rc = pfe_load_elf(CLASS_MASK, class_fw, pfe);
520f8c5cf58632 Calvin Johnson 2017-09-16  228  	if (rc < 0) {
520f8c5cf58632 Calvin Johnson 2017-09-16  229  		pr_err("%s: class firmware load failed\n", __func__);
520f8c5cf58632 Calvin Johnson 2017-09-16  230  		goto err3;
520f8c5cf58632 Calvin Johnson 2017-09-16  231  	}
520f8c5cf58632 Calvin Johnson 2017-09-16  232  

:::::: The code at line 218 was first introduced by commit
:::::: 520f8c5cf58632bf4c4f6608c1634a7ed20745ed staging: fsl_ppfe/eth: introduce pfe driver

:::::: TO: Calvin Johnson <calvin.johnson@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
