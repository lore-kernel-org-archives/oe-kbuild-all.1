Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7311F5E7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 15:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDrulTe4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698420779; x=1729956779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9pCeRm1p/U8mW3PMl1F1Fktl+og9I8y7YgoS4ePHJ1s=;
  b=IDrulTe4lkkYO3mJTLqcc7/3jaVEzTkfhQc+hvTWdjuKiwTP/I05fvbA
   wzN6VZGNamKlJls09trbyyoMalGia/ZXMua4A+tK9Oj9wOavrI+6btBDl
   wayg1E+kQ6P1KiXlb3CplXOeiSFPWQXX6VnJBI7wnV+HXCid0fIqXKzkb
   zDEimgGt//1kYa6mO4ZgIvtyS839m/zIftXqzgBFoMPCtMmz8j8eWnIv+
   WUhcN5mOeVscR9U7z10gIDjcPpiFAM7UhCRyyVHSyd0YCMQTR45JG2KBs
   jXRuYPkb4jRA1vCT2YLVJS1OAMwoS9aDmcsiqMFBZSM3uXPxqxaaFEphY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="6419563"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="6419563"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 08:32:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="883214865"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="883214865"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Oct 2023 08:32:48 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwOpJ-000AxP-1n;
	Fri, 27 Oct 2023 15:32:45 +0000
Date: Fri, 27 Oct 2023 23:31:57 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 11/18] drivers/pci/cma.c:91:24: warning: the
 omitted middle operand in '?:' will always be 'true', suggest explicit
 middle operand
Message-ID: <202310272304.ZOG5ZvOY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   a3720b8976ae1053f25c81430732575874f79e4f
commit: 2096b5f2e6b7e9fb2402e669f14ea226d19e41bb [11/18] PCI/CMA: Reauthenticate devices on reset and resume
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231027/202310272304.ZOG5ZvOY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310272304.ZOG5ZvOY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310272304.ZOG5ZvOY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/cma.c: In function 'pci_cma_reauthenticate':
>> drivers/pci/cma.c:91:24: warning: the omitted middle operand in '?:' will always be 'true', suggest explicit middle operand [-Wparentheses]
      91 |         return rc < 0 ?: 0;
         |                        ^


vim +91 drivers/pci/cma.c

    79	
    80	int pci_cma_reauthenticate(struct pci_dev *pdev)
    81	{
    82		int rc;
    83	
    84		if (!pdev->cma_capable)
    85			return -ENOTTY;
    86	
    87		rc = spdm_authenticate(pdev->spdm_state);
    88		if (rc >= 0)
    89			pci_info(pdev, "authenticated with certificate slot %d\n", rc);
    90	
  > 91		return rc < 0 ?: 0;
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
