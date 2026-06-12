Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B59331ED6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 20:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781297176; cv=none; b=RinL2qgY3VVJHVT/6f5wk7pao7U6yIJLJDeTqUgbbcvtBmy6C/QlDYM+hq9fmiStQJNRwPRKWesqCn9hpOXT4JW7GmivmBPLr0BPts1B326hm8Xv1smZnVK7gYfK+8hTHpELq5dfm12srVnJxQr5JdJ9G0lvmpr4o+Sumb5qzyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781297176; c=relaxed/simple;
	bh=QvysVPylaZaVA9O1rX5nXbqOjpzk5FciXzJ6ZQSWTRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LIi/xt2QBmCmL9ZCgaYAWSCVNom93AJ6alNoT3S2Cp3U02KHhJbZtvdcoKpmJ+aZu8QbBVPS1BVCCNMi8k9eDh523VLAVlEML0mv3jsUwzJI+OMz0JxBUkJkG9F76xNj7Y7AxHzWZrP07GBeR/gfF+NJdTEoYHdUKQKoMKC2l7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1d3ziHe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1d3ziHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781297175; x=1812833175;
  h=date:from:to:cc:subject:message-id;
  bh=QvysVPylaZaVA9O1rX5nXbqOjpzk5FciXzJ6ZQSWTRU=;
  b=P1d3ziHeNetrUimeDu41V2+AcyvtGJrE5ZLIw2Z53HySv3cRQVf4hP2x
   O0EbVH2UsqwC371DAfzwzJ0T0sKJwKmB7++FslVWYrtcaZvVRkhlPWMvs
   0NQHBXL5xhhpnxo3Ax5B1CC2JHygCfA8y0lhRx4dHCaSPjys1GnT+r8U9
   WMNE6mzcHxnHZs11vP4RTN2Hj9AiaUsOSR1FQ3X76jGH7wzzjNxisc5Zc
   IYWsEsJVHIL0MrshQIbeOnN1fHhIAala/DY0qiglJ5l4zrKk3HgbfT1V6
   JCIpSK8Nd5EHyThPbz0cy28X3doAg/tWxmNULbXnivBkkegHtQujrWQbJ
   A==;
X-CSE-ConnectionGUID: yy5imtBnQgmYY/5TfMyu3Q==
X-CSE-MsgGUID: 1/uckc/sQi2aS9pY84Ghdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="99556676"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="99556676"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 13:46:12 -0700
X-CSE-ConnectionGUID: 1mdUIipMTWyvD/m3JpXliw==
X-CSE-MsgGUID: wgoUoNAgQ7Kq5h33iuoesA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="242537657"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jun 2026 13:46:10 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY8lU-000000004Jz-2nnN;
	Fri, 12 Jun 2026 20:46:08 +0000
Date: Fri, 12 Jun 2026 22:45:14 +0200
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tsm_d0 1/1] drivers/pci/tsm.c:898:2: error: call to
 undeclared function 'PM_RUNTIME_ACQUIRE'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202606122214.J53RVsGd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux tsm_d0
head:   1b171c8bdd4577ceb504cb77b4a6b51f98436722
commit: 1b171c8bdd4577ceb504cb77b4a6b51f98436722 [1/1] PCI/TSM: Resume device to D0 for CMA-SPDM operation
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260612/202606122214.J53RVsGd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606122214.J53RVsGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606122214.J53RVsGd-lkp@intel.com/

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
   1 warning and 4 errors generated.
--
>> drivers/crypto/ccp/sev-dev-tsm.c:42:2: error: call to undeclared function 'PM_RUNTIME_ACQUIRE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      42 |         PM_RUNTIME_ACQUIRE(dsm->tsm.base_tsm.pdev, pm);
         |         ^
>> drivers/crypto/ccp/sev-dev-tsm.c:42:45: error: use of undeclared identifier 'pm'
      42 |         PM_RUNTIME_ACQUIRE(dsm->tsm.base_tsm.pdev, pm);
         |                                                    ^~
>> drivers/crypto/ccp/sev-dev-tsm.c:43:15: error: call to undeclared function 'PM_RUNTIME_ACQUIRE_ERR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      43 |         if (pm_ret = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |                      ^
   drivers/crypto/ccp/sev-dev-tsm.c:43:39: error: use of undeclared identifier 'pm'
      43 |         if (pm_ret = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |                                              ^~
>> drivers/crypto/ccp/sev-dev-tsm.c:43:13: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
      43 |         if (pm_ret = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |             ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccp/sev-dev-tsm.c:43:13: note: place parentheses around the assignment to silence this warning
      43 |         if (pm_ret = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |                    ^                            
         |             (                                   )
   drivers/crypto/ccp/sev-dev-tsm.c:43:13: note: use '==' to turn this assignment into an equality comparison
      43 |         if (pm_ret = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |                    ^
         |                    ==
   1 warning and 4 errors generated.


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
