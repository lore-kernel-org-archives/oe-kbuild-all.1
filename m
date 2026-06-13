Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3283DEAE0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781355544; cv=none; b=Fjhlt+Eo+Z0FQ32ew5BLNJ4mTRjD8kYUQbtWAgMKADqMPgor1/ytOYFJBgR9VYbKFrj4oRx8NwG9LNXDanXkxHf9sspDxIz3wNETl2HS848m15gvZgxGFFogzGbIjgPVXHobJmEnHHI9ZdHWESv6EhZPaqnYf+cNyMdswFADHEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781355544; c=relaxed/simple;
	bh=umJKx7CF5PLT1IbX/SYNHZuDaZZqvIGSuCbpzu+27dk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E2DCEqrbC3WgbQyd4J+uCR/nl0q8yvCenxt1bwZ2HR27PlF+HPRBSan6hSIinZcefyjsl/jFiInDrjyf/7IwQYYz3mgfgI9q0b9t/9R1C4tLT/CBJMEtN1hni9A9Fo8wB4P+65jXKXJvTORxlQffquWcm5dmtW+uXvnQBtXD5UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVoe/WV6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVoe/WV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781355543; x=1812891543;
  h=date:from:to:cc:subject:message-id;
  bh=umJKx7CF5PLT1IbX/SYNHZuDaZZqvIGSuCbpzu+27dk=;
  b=BVoe/WV6Tksa4AJ2zKw9GDxAoQBev6hp+IV9tBwfKCI6JsZC3mDauoe6
   CBh1lceRRSHvYjeQfxwOcLXDSmaWb3vjrrja1LdxEd6T5XAwGDRKaeASc
   clhODtG0OLqmTuIf2B4g5DFBo2T47dxSwYHL01LNtiv5Zatdo1r7vt6er
   oUIICGoAwmR4Co85ruApSOjw5tRRFaL66Xq3J47AfZU4VwWmFw0SAKd4A
   DnliNtmwIjiH4WIQko6q3NgXl5fZo5qTYmKtLwlHS1cWz+YHEZU1r6Tw8
   wte9YBUVPkh7/0MIYwt/tkmakOksQ2Ijh5kVG6ZNDvoLnUjxRuBWhMX/J
   w==;
X-CSE-ConnectionGUID: KFNFlR3gTwu5ABhrMpGdgQ==
X-CSE-MsgGUID: MgoJaGhLQ7iAdsVVsfYVMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86065397"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="86065397"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 05:59:01 -0700
X-CSE-ConnectionGUID: C224lds0S22c9A0pX5o1/A==
X-CSE-MsgGUID: tFMAtUBDSNOTFCC3ujJ35A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="245937238"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2026 05:58:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYNwu-00000000Puq-0M1T;
	Sat, 13 Jun 2026 12:58:56 +0000
Date: Sat, 13 Jun 2026 20:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tsm_d0 1/1] drivers/crypto/ccp/sev-dev-tsm.c:43:21:
 error: incompatible pointer types passing 'struct pci_dev *' to parameter of
 type 'class_pm_runtime_active_t' (aka 'struct device *')
Message-ID: <202606132016.W3OZXlo2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux tsm_d0
head:   5d1328bf1d1aa1bfefc2aa97b82783e053dccfda
commit: 5d1328bf1d1aa1bfefc2aa97b82783e053dccfda [1/1] PCI/TSM: Resume device to D0 for CMA-SPDM operation
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260613/202606132016.W3OZXlo2-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606132016.W3OZXlo2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606132016.W3OZXlo2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/crypto/ccp/sev-dev-tsm.c:43:21: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'class_pm_runtime_active_t' (aka 'struct device *') [-Wincompatible-pointer-types]
      43 |         PM_RUNTIME_ACQUIRE(dsm->tsm.base_tsm.pdev, pm);
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm_runtime.h:631:39: note: expanded from macro 'PM_RUNTIME_ACQUIRE'
     631 |         ACQUIRE(pm_runtime_active_try, _var)(_dev)
         |                                              ^~~~
   include/linux/pm_runtime.h:619:1: note: passing argument to parameter '_T' here
     619 | DEFINE_GUARD_COND(pm_runtime_active, _try,
         | ^
   include/linux/cleanup.h:419:33: note: expanded from macro 'DEFINE_GUARD_COND'
     419 | #define DEFINE_GUARD_COND(X...) CONCATENATE(DEFINE_GUARD_COND_, COUNT_ARGS(X))(X)
         |                                 ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:135:1: note: expanded from here
     135 | DEFINE_GUARD_COND_4
         | ^
   include/linux/cleanup.h:407:26: note: expanded from macro 'DEFINE_GUARD_COND_4'
     407 |                      class_##_name##_t _T) \
         |                                        ^
   drivers/crypto/ccp/sev-dev-tsm.c:44:13: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
      44 |         if (pm_ret = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |             ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccp/sev-dev-tsm.c:44:13: note: place parentheses around the assignment to silence this warning
      44 |         if (pm_ret = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |                    ^                            
         |             (                                   )
   drivers/crypto/ccp/sev-dev-tsm.c:44:13: note: use '==' to turn this assignment into an equality comparison
      44 |         if (pm_ret = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |                    ^
         |                    ==
   1 warning and 1 error generated.


vim +43 drivers/crypto/ccp/sev-dev-tsm.c

    29	
    30	static int sev_tio_spdm_cmd(struct tio_dsm *dsm, int ret)
    31	{
    32		struct tsm_dsm_tio *dev_data = &dsm->data;
    33		struct tsm_spdm *spdm = &dev_data->spdm;
    34		int pm_ret;
    35	
    36		/* Check the main command handler response before entering the loop */
    37		if (ret == 0 && dev_data->psp_ret != SEV_RET_SUCCESS)
    38			return -EINVAL;
    39	
    40		if (ret <= 0)
    41			return ret;
    42	
  > 43		PM_RUNTIME_ACQUIRE(dsm->tsm.base_tsm.pdev, pm);
    44		if (pm_ret = PM_RUNTIME_ACQUIRE_ERR(&pm))
    45			return pm_ret;
    46	
    47		/* ret > 0 means "SPDM requested" */
    48		while (ret == PCI_DOE_FEATURE_CMA || ret == PCI_DOE_FEATURE_SSESSION) {
    49			ret = pci_doe(dsm->tsm.doe_mb, PCI_VENDOR_ID_PCI_SIG, ret,
    50				      spdm->req, spdm->req_len, spdm->rsp, spdm->rsp_len);
    51			if (ret < 0)
    52				break;
    53	
    54			WARN_ON_ONCE(ret == 0); /* The response should never be empty */
    55			spdm->rsp_len = ret;
    56			ret = sev_tio_continue(dev_data);
    57		}
    58	
    59		return ret;
    60	}
    61	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
