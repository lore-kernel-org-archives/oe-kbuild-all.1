Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB747E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 00:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Na160EcL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700095113; x=1731631113;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xAtbr3t/FMu8upyA61ypufTjUPljOPtor1qaFGcsgYw=;
  b=Na160EcLO+RysNl7q+ol/oUqDOT29IY6nSl6WTEQjVwR1atpzK5TceqL
   Fxr+ENHR1ogkeE8M5JxCDJpyKDzotZgLv6fSLprUfq1pZzJwLxExOm7Fb
   aLBZ+UgLy7p8BHZ+8NrylhwjNH9nfk/wxyXxlPLaIuhubhiui2hz9HRAB
   QF666x099JEQkGCz4WUE7mzal8Y4/k+uxwExtN604PY4q7ZEoKVAA0Q1r
   1xjIbu7DpuKJZmP85DdyjGXcavtskDPS5/PQCq4EHViNM5rnV+AXSEAma
   1buamRDRx/ChoeTl2dm31OIH6zavmGPZKFHsEtKRzejSk9hkgBlhLYLXB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="388150577"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="388150577"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 16:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="888739587"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="888739587"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Nov 2023 16:38:04 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3QOP-00013C-2H;
	Thu, 16 Nov 2023 00:38:01 +0000
Date: Thu, 16 Nov 2023 08:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 17/17]
 drivers/pci/controller/dwc/pcie-rcar-gen4.c:439:48: error: implicit
 declaration of function 'of_device_get_match_data'
Message-ID: <202311160839.XYaCE5h5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   30bd4c46bf0b9c85631b39f39c6bfc901846dbc9
commit: 30bd4c46bf0b9c85631b39f39c6bfc901846dbc9 [17/17] of: header cleanups
config: arc-randconfig-002-20231116 (https://download.01.org/0day-ci/archive/20231116/202311160839.XYaCE5h5-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160839.XYaCE5h5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160839.XYaCE5h5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/dwc/pcie-rcar-gen4.c: In function 'rcar_gen4_add_dw_pcie':
>> drivers/pci/controller/dwc/pcie-rcar-gen4.c:439:48: error: implicit declaration of function 'of_device_get_match_data' [-Werror=implicit-function-declaration]
     439 |         rcar->mode = (enum dw_pcie_device_mode)of_device_get_match_data(&rcar->pdev->dev);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_device_get_match_data +439 drivers/pci/controller/dwc/pcie-rcar-gen4.c

e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  435  
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  436  /* Common */
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  437  static int rcar_gen4_add_dw_pcie(struct rcar_gen4_pcie *rcar)
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  438  {
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18 @439  	rcar->mode = (enum dw_pcie_device_mode)of_device_get_match_data(&rcar->pdev->dev);
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  440  
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  441  	switch (rcar->mode) {
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  442  	case DW_PCIE_RC_TYPE:
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  443  		return rcar_gen4_add_dw_pcie_rp(rcar);
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  444  	case DW_PCIE_EP_TYPE:
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  445  		return rcar_gen4_add_dw_pcie_ep(rcar);
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  446  	default:
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  447  		return -EINVAL;
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  448  	}
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  449  }
e311b3834dfa73 Yoshihiro Shimoda 2023-10-18  450  

:::::: The code at line 439 was first introduced by commit
:::::: e311b3834dfa73e1f3b5ae2dad0346c37692a9b2 PCI: rcar-gen4: Add endpoint mode support

:::::: TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
:::::: CC: Krzysztof Wilczyński <kwilczynski@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
