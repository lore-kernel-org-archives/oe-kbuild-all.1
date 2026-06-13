Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2465A20D4FC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781357486; cv=none; b=MccJqlKFBA8IOAF/pFdDhZF7hO3nUWpnq0G9SfKyxgxICHHf1wNx7uN4s7M2+oRCAdJx6SuHwgtLm/Mqz+rc/3/0Il3nq5kWoCJz5WqibMoWv03lijLZatm2z+y7SudnWssf/oS/u6k7YcyzbIQf+T1FdPHBBzbOh8v1PRAnyUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781357486; c=relaxed/simple;
	bh=O9Rj1drVpht4goQ2mBgI+a8uUBJw/0Dhmjv5Y24Wdys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pP9DNy+L4OrtwmWSY3QtcU3xHbC08/qcValD7ZK28D68Q+Wx2HMFI4Jrx4xT/15yiyj0//OeW4NaXJ9LPL7OE+W0zlN0plwBXu1bG33Td8UV8L2Byj188iS2cQC7mWVHE5d9Vmsx3/on79ytaNknATlz+X7oun+vGn1Zyu2nkVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gp22AE9V; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gp22AE9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781357483; x=1812893483;
  h=date:from:to:cc:subject:message-id;
  bh=O9Rj1drVpht4goQ2mBgI+a8uUBJw/0Dhmjv5Y24Wdys=;
  b=Gp22AE9VGylT07Lnyn5vDpsEVqkaVs7ia/Niw6b64JOWiLjKjjHISWVr
   Hy0UqqUubvAHzjuGWp35ad6Rf7oBjB/d7pxOp1hjIDY1wSjIm/vdSCY36
   Wkm51sqQKcCIgqkBOrpYE5sSABPwbMXZhOhhrpm8uMN/pOVXrUBpf5XRY
   tHUODbGVa/6XVsHv5oTh76hj/J7oa4JFuU+d0gfsQIXgK22ifaRMDbMVS
   7W4EplU70RZaV3oFCf7RYQguQK8FJEsrlizj6cfiQs8dBzrJZQdyDfi2Z
   AZMmGv663OwdwkY59DRmy/4UKyvz5L77gq5vKaORDGz6WPMoUZ1o3IP9c
   A==;
X-CSE-ConnectionGUID: QL0nts8CRnG3xQjmLSzQ4Q==
X-CSE-MsgGUID: JOymi2TFTgyWoxb4KfGD3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81182310"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="81182310"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 06:31:22 -0700
X-CSE-ConnectionGUID: qRFbmFAzTJ6ZeE5vfd6Z9w==
X-CSE-MsgGUID: RGOy89iiRIK6Z+sTc0DmZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="251993979"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Jun 2026 06:31:21 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYOSE-000000004UX-0Vjq;
	Sat, 13 Jun 2026 13:31:18 +0000
Date: Sat, 13 Jun 2026 15:31:11 +0200
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tsm_d0 /1] drivers/crypto/ccp/sev-dev-tsm.c:43:21:
 error: incompatible pointer types passing 'struct pci_dev *' to parameter of
 type 'class_pm_runtime_active_t' (aka 'struct device *')
Message-ID: <202606131533.YSYrW10P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux tsm_d0
head:   fa810ae34a686da54dd1cbf128cc093c733ad01e
commit: 5d1328bf1d1aa1bfefc2aa97b82783e053dccfda [/1] PCI/TSM: Resume device to D0 for CMA-SPDM operation
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260613/202606131533.YSYrW10P-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131533.YSYrW10P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131533.YSYrW10P-lkp@intel.com/

Note: the l1k/tsm_d0 HEAD fa810ae34a686da54dd1cbf128cc093c733ad01e builds fine.
      It only hurts bisectability.

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
