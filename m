Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CD9613F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 06:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADGcgKO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697091063; x=1728627063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dMYOe6khgfmpMadkmFnaAtx1YSK58XVpiLVsnCjOhJ8=;
  b=ADGcgKO1ZCU/e51sXvHF69C5VFNt23eNSIirjYiatSafCiXMse3SzZUN
   vKXFUqqP4CHeJH1umhsfmxNX3gRec5EKm4kZte1Dp/A2ufZek9PRLO3ks
   adTKXHjoI8KINUbbJS3qmqWFaLW9qrcbxNwxLb9dfHQwuJ6wKF5bRr5/Q
   uif+8TSiqt/XjCvKZ+6zzUyvqAuzJ7scYrmP7WwS0V3LEC0112mMm8N3s
   mYpg6neAg/C7vJ079hEkxjEIARVLmQQqbis1exXaltAg94hIV7o8Huz0I
   SIYtuz+IH+/Kv5xIM2CqELjIbdvPG2FZAl6W0AkZt2P8dmmspftlMh4VV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451334310"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="451334310"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 23:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870439355"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="870439355"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2023 23:10:56 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqouM-0003Fl-0c;
	Thu, 12 Oct 2023 06:10:54 +0000
Date: Thu, 12 Oct 2023 14:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V3 10/16] platform/x86/intel/pmc: Split
 pmc_core_ssram_get_pmc()
Message-ID: <202310121440.7QuDXOng-lkp@intel.com>
References: <20231012023840.3845703-11-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012023840.3845703-11-david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on acce85a7dd28eac3858d44230f4c65985d0f271c]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/platform-x86-intel-vsec-Move-structures-to-header/20231012-104217
base:   acce85a7dd28eac3858d44230f4c65985d0f271c
patch link:    https://lore.kernel.org/r/20231012023840.3845703-11-david.e.box%40linux.intel.com
patch subject: [PATCH V3 10/16] platform/x86/intel/pmc: Split pmc_core_ssram_get_pmc()
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121440.7QuDXOng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121440.7QuDXOng-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#52: FILE: drivers/platform/x86/intel/pmc/core_ssram.c:75:
+	struct pci_dev *ssram_pcidev = pmcdev->ssram_pcidev;
+	void __iomem __free(pmc_core_iounmap) *main_ssram = NULL;

ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
#52: FILE: drivers/platform/x86/intel/pmc/core_ssram.c:75:
+	void __iomem __free(pmc_core_iounmap) *main_ssram = NULL;
 	                                      ^

ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
#53: FILE: drivers/platform/x86/intel/pmc/core_ssram.c:76:
+	void __iomem __free(pmc_core_iounmap) *secondary_ssram = NULL;
 	                                      ^

WARNING:LINE_SPACING: Missing a blank line after declarations
#97: FILE: drivers/platform/x86/intel/pmc/core_ssram.c:112:
+	struct pci_dev *ssram_pcidev = pmcdev->ssram_pcidev;
+	void __iomem __free(pmc_core_iounmap) *ssram;

ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
#97: FILE: drivers/platform/x86/intel/pmc/core_ssram.c:112:
+	void __iomem __free(pmc_core_iounmap) *ssram;
 	                                      ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
