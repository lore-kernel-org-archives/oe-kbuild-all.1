Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185E438C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 01:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SI2SGFf5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697679341; x=1729215341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YbxBdLt2jRwbOHD32dl6BEbQXSt3yATd9AnUDY/4QH8=;
  b=SI2SGFf5EGyXgjkkfXfKOAzNsowOpCOeplrHMOXbVsV2MIfYi3wvLjpq
   IZnuPvvCpg3YwgT7jFFEfR3OndKyVo5FhjZSQPQk635KiHguu7P4X0i9e
   89cyXVaYyt/21NMQDHB651THxfwJAPWssryrApc6Xho/NUrKLX8SDoqrg
   B/J2IEybPwf+4fjgU0GTGvfAJh/dmx8uU7DBsnkhoCGp+e8TGbe3Wy/25
   bJu0RINVkOK0BWg4B0UWdKlYMlluXmYjNabbwUvrsTf9OoS97D6cL7jAZ
   UG6SutZ1N69AKaIy0iVPoJ5eBjQaOxy1usKVbmUN0bSypCy/nX7MuV3pV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="7703988"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="7703988"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 18:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930418296"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="930418296"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Oct 2023 18:35:39 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtHwm-0001OP-2p;
	Thu, 19 Oct 2023 01:35:36 +0000
Date: Thu, 19 Oct 2023 09:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V4 11/17] platform/x86/intel/pmc: Split
 pmc_core_ssram_get_pmc()
Message-ID: <202310190953.Gz1Li9Vn-lkp@intel.com>
References: <20231018231624.1044633-12-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018231624.1044633-12-david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3f720b21ec5af466e50e99dc517af267b67d248c]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/platform-x86-intel-vsec-Move-structures-to-header/20231019-071914
base:   3f720b21ec5af466e50e99dc517af267b67d248c
patch link:    https://lore.kernel.org/r/20231018231624.1044633-12-david.e.box%40linux.intel.com
patch subject: [PATCH V4 11/17] platform/x86/intel/pmc: Split pmc_core_ssram_get_pmc()
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310190953.Gz1Li9Vn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190953.Gz1Li9Vn-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#44: FILE: drivers/platform/x86/intel/pmc/core_ssram.c:73:
+	struct pci_dev *ssram_pcidev = pmcdev->ssram_pcidev;
+	void __iomem __free(iounmap) *main_ssram = NULL;

ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
#44: FILE: drivers/platform/x86/intel/pmc/core_ssram.c:73:
+	void __iomem __free(iounmap) *main_ssram = NULL;
 	                             ^

ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
#45: FILE: drivers/platform/x86/intel/pmc/core_ssram.c:74:
+	void __iomem __free(iounmap) *secondary_ssram = NULL;
 	                             ^

WARNING:LINE_SPACING: Missing a blank line after declarations
#89: FILE: drivers/platform/x86/intel/pmc/core_ssram.c:110:
+	struct pci_dev *ssram_pcidev = pmcdev->ssram_pcidev;
+	void __iomem __free(iounmap) *ssram;

ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
#89: FILE: drivers/platform/x86/intel/pmc/core_ssram.c:110:
+	void __iomem __free(iounmap) *ssram;
 	                             ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
