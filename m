Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A07934BA50
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 20:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781297664; cv=none; b=AP1JCg0zRKjd2dF9ZFvAd2PIxSWyefV4JUvGyyhMKyXFN9xYubS44D9LzNDvsuvhuQsyYQzq8uTB7biBlI8RS98wV9I781tr7m7Cb3Lmw/9KUCYCJEWh2YTVlkqJGRYIJMqmHnPlBQEerGP1Lmui+opyY9/puWriXfhsThbSck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781297664; c=relaxed/simple;
	bh=Vf9zCZifBbK8Pyr/A9j0K9JCMXqTBz+7jLMOPk7bGw4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Liw0GwpwPzvoJiWWlhzz7bBLH4VlaDRYNiLvakak6DphIkcYEQ2PCab6gfiKiP4FIhT+yoPV9zYjFWGF9OxoZATJAMgTwz/2Fi2L2iekogOCC4EDtdzy2x6bg8fUFwI0gU2O8DCUupgg+5Rh5StxpHT2HATiFxPQf7kMYlAbFCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8mUxNOm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8mUxNOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781297664; x=1812833664;
  h=date:from:to:cc:subject:message-id;
  bh=Vf9zCZifBbK8Pyr/A9j0K9JCMXqTBz+7jLMOPk7bGw4=;
  b=i8mUxNOmezQubZhlt8s0AxDjZ58b/uJCW0Wp6Z0qDUvoRTgBjT2r9Uut
   Segit2A7B5U3U42iweZXyjd6RO52b/FxtE09CXB6rcHBAr51WIH+Dp7Iq
   QEldGtqB8zKNN5bYbnvr6ZPppJjELdZ1tIWhclN9KSd28DneOcYvMrBST
   lswFN+vyg+lcXk/Y8rMrIOnBl/u2/zD05IifWs9YnWDfIVbxXC+q9w+NN
   9Q6+6QHvo7JPcXqJXmLJ5V8Jz0D49SU1iFUVmeISb+l33nfGO6484VT0p
   48bdszTOK4nUG5xzk28dNItwVXs/wW7XFZ7JiakfDGMfiw2xtNdhAwB8s
   Q==;
X-CSE-ConnectionGUID: 432D+Zn8Tta4X1YsQ4Z85w==
X-CSE-MsgGUID: 0e48NzUfQzih5KUVq9Zrxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82198776"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="82198776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 13:54:23 -0700
X-CSE-ConnectionGUID: 9W9xmJrwQ76nNB4hFk5d/w==
X-CSE-MsgGUID: xFn+hcx7RaGTbKtQ3EdewQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="244498350"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jun 2026 13:54:21 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY8tP-00000000PJZ-0i0u;
	Fri, 12 Jun 2026 20:54:19 +0000
Date: Sat, 13 Jun 2026 04:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tsm_d0 1/1] drivers/pci/tsm.c:898:2: error: call to
 undeclared function 'PM_RUNTIME_ACQUIRE'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202606130425.int8kIRv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux tsm_d0
head:   1b171c8bdd4577ceb504cb77b4a6b51f98436722
commit: 1b171c8bdd4577ceb504cb77b4a6b51f98436722 [1/1] PCI/TSM: Resume device to D0 for CMA-SPDM operation
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260613/202606130425.int8kIRv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7d42028e806ab2b17af22ddb8417432e4781d4aa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130425.int8kIRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130425.int8kIRv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pci/tsm.c:898:2: error: call to undeclared function 'PM_RUNTIME_ACQUIRE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     898 |         PM_RUNTIME_ACQUIRE(&pdev->dev, pm);
         |         ^
>> drivers/pci/tsm.c:898:33: error: use of undeclared identifier 'pm'
     898 |         PM_RUNTIME_ACQUIRE(&pdev->dev, pm);
         |                                        ^~
>> drivers/pci/tsm.c:899:11: error: call to undeclared function 'PM_RUNTIME_ACQUIRE_ERR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     899 |         if (rc = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |                  ^
   drivers/pci/tsm.c:899:35: error: use of undeclared identifier 'pm'
     899 |         if (rc = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |                                          ^~
>> drivers/pci/tsm.c:899:9: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
     899 |         if (rc = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |             ~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/tsm.c:899:9: note: place parentheses around the assignment to silence this warning
     899 |         if (rc = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |                ^                            
         |             (                               )
   drivers/pci/tsm.c:899:9: note: use '==' to turn this assignment into an equality comparison
     899 |         if (rc = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |                ^
         |                ==
   drivers/pci/tsm.c:31:12: warning: variable 'pci_tsm_devsec_count' set but not used [-Wunused-but-set-global]
      31 | static int pci_tsm_devsec_count;
         |            ^
   2 warnings and 4 errors generated.


vim +/PM_RUNTIME_ACQUIRE +898 drivers/pci/tsm.c

   884	
   885	int pci_tsm_doe_transfer(struct pci_dev *pdev, u8 type, const void *req,
   886				 size_t req_sz, void *resp, size_t resp_sz)
   887	{
   888		struct pci_tsm_pf0 *tsm;
   889		int rc;
   890	
   891		if (!pdev->tsm || !is_pci_tsm_pf0(pdev))
   892			return -ENXIO;
   893	
   894		tsm = to_pci_tsm_pf0(pdev->tsm);
   895		if (!tsm->doe_mb)
   896			return -ENXIO;
   897	
 > 898		PM_RUNTIME_ACQUIRE(&pdev->dev, pm);
 > 899		if (rc = PM_RUNTIME_ACQUIRE_ERR(&pm))

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
