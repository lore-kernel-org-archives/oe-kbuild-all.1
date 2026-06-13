Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AB03002DD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 19:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781379738; cv=none; b=kDCiBO1+1oWWUuLntEUUqf6WiviM/4tYBlW2zwIWxRSiM1ewLOnkXM1lzf8/cPhB51pwHW215SXi3mPhTVDn1FKVVzhAS+0Uvd76jFSrqIzjozn/RrfHn17L+elgTneVJgIay6qbEapWnqpq9pcz7SWo19iGpsVlW+yt1mj40Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781379738; c=relaxed/simple;
	bh=QSEIYSglhwVJ6e9M7D6zqrUXZs2FjT11BgZpr+WCErM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NUxT1gAJlALKePSaXec6I2xSxSSJpNy/53b+CJCAdour0jrAQxw1AuF6zOPVQXHmMn/c7ctD6PjPCbY0y2H0SZBatwliGuTIal0k2ykrtOpoIqXa411DlFziK27P9OAJed3mr8m6GpnS4gCbfMxQLVBOFx/OQ2aZpgyZcDmp9CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKaXdH3Z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKaXdH3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781379736; x=1812915736;
  h=date:from:to:cc:subject:message-id;
  bh=QSEIYSglhwVJ6e9M7D6zqrUXZs2FjT11BgZpr+WCErM=;
  b=eKaXdH3ZugC16ygHe7Joi7YI8RfaCkvqm3g/yjPjAR0EdQ9/VMo1Yib/
   10MRga2ALNg14NE22ewV5VqKMq/EOWOmU9h5ugd6FNA8vLsNUdboBklC0
   u82pbjvMGoeVhSO/NMpeyB1UykAaOGibJDf4NxtQzONvmOrIJqgjgsDWD
   hC7ZS1Z+PkMvgZc/Knw5MRSELH8pxTlI4u+S8RfWxKdlWJmFJEF7qYEYk
   S22Ix2xwE/XQdrNzMUDzwaxe3bdwwRPell3CjOa8owFt6IvCl3W3X3ePi
   9P7ADE+iXdyLHv/XzXB88yaW5fC7Uy6XpoliWzlsaBsG3f3wLl3QFJOyT
   Q==;
X-CSE-ConnectionGUID: CPc+mXQQR+qghsOybbDJUQ==
X-CSE-MsgGUID: TBxnHpOFTpiKQ7XR0DV6uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="99598043"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="99598043"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 12:42:16 -0700
X-CSE-ConnectionGUID: 11WFh6o/S861THJO/AlmqQ==
X-CSE-MsgGUID: QtNKRNIuRpKHjTUdWiSMyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="252041617"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jun 2026 12:42:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYUF9-00000000QDy-3rIN;
	Sat, 13 Jun 2026 19:42:11 +0000
Date: Sun, 14 Jun 2026 03:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tsm_d0 1/1] drivers/crypto/ccp/sev-dev-tsm.c:43:21:
 error: passing 'struct device' to parameter of incompatible type
 'class_pm_runtime_active_t' (aka 'struct device *'); take the address with &
Message-ID: <202606140336.NtQepd8E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux tsm_d0
head:   fa810ae34a686da54dd1cbf128cc093c733ad01e
commit: fa810ae34a686da54dd1cbf128cc093c733ad01e [1/1] PCI/TSM: Resume device to D0 for CMA-SPDM operation
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260614/202606140336.NtQepd8E-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140336.NtQepd8E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140336.NtQepd8E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/crypto/ccp/sev-dev-tsm.c:43:21: error: passing 'struct device' to parameter of incompatible type 'class_pm_runtime_active_t' (aka 'struct device *'); take the address with &
      43 |         PM_RUNTIME_ACQUIRE(dsm->tsm.base_tsm.pdev->dev, pm);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                            &
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
   1 error generated.


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
  > 43		PM_RUNTIME_ACQUIRE(dsm->tsm.base_tsm.pdev->dev, pm);
    44		if ((pm_ret = PM_RUNTIME_ACQUIRE_ERR(&pm)))
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
