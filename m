Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC763E3D90
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 12:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781353829; cv=none; b=NbRypsWFN2iRo53TyVnX4TCJb30o4XslATTUjASxRQuLeGdwoXNaL6TAis2l6vQEbL1Y5+z6zEzf60jTU90BZJ6UTIXrgrDCoyw+2m6ZO0ch8aUKHmyVO9Gtf1A+RdPsyAOkzCSSNBmo1DqlPhSm2FhFUlUgNDew7NpziPnZy9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781353829; c=relaxed/simple;
	bh=J3N7SiuWT1hEeLkEdgr6ForMdck17v2AU5gnQBtyn5E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uaVBGKrmAMuiBG1Up7x/u3vl694WSPro3t94n6hkMLf1ah51SqIa7emd/fbaHvEj1b/glhM9MNBruv9SX5Dw7qwIXgYQsJTjErqXR7MeLuOCbwHEvHFUaZ1d3At6zTqjkUECHkrONgPHbeuJvwOQC+X74Jm/jZqqzrWbg5Pxw0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=McTWRsFW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="McTWRsFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781353822; x=1812889822;
  h=date:from:to:cc:subject:message-id;
  bh=J3N7SiuWT1hEeLkEdgr6ForMdck17v2AU5gnQBtyn5E=;
  b=McTWRsFWG3ZusbZGbfz/JitVFRapbuVjJ7u07QIlU1fYY1Ed25KxbBNL
   nijGlosa7dXWqPPUdB5fJGqTGGJkv0QnNvsWb7cGsWAgjYYNoU/ma/5zV
   7RZpiDasxT+OoNQ9/rWrEsdffC/IzsRpcIwreUf3lgLoNG4sqXTyVIAcK
   vm++ICA38P+bWNu/N5OBB7hIDp0+WlROPG+VoKROYZCtQ5oekkvNtCOzX
   Kp+OFS7yIT6SLtn+QqdYIglethGB7rB4jBb9TUrLRtCAeM1CjaSklmuLs
   9VIcc2T3gsqfuy2QQlNLEiBwlVGL0vS46Pzlgt23JCZcfuijbqwFopyQf
   Q==;
X-CSE-ConnectionGUID: 3kxJAssNQ82fkWJ+oKoUng==
X-CSE-MsgGUID: vry4ORxrRDeJYmtpOBOufg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81300235"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="81300235"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 05:30:21 -0700
X-CSE-ConnectionGUID: CSkGawejTnSeQzV3uBlqqw==
X-CSE-MsgGUID: qL1unX6PRVaqnQUTTusY2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="244633531"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2026 05:30:20 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYNVB-000000004U9-2ztw;
	Sat, 13 Jun 2026 12:30:17 +0000
Date: Sat, 13 Jun 2026 14:29:51 +0200
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tsm_d0 1/1] drivers/crypto/ccp/sev-dev-tsm.c:43:45:
 error: passing argument 1 of 'class_pm_runtime_active_try_constructor' from
 incompatible pointer type
Message-ID: <202606131415.xLeJAoUX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux tsm_d0
head:   5d1328bf1d1aa1bfefc2aa97b82783e053dccfda
commit: 5d1328bf1d1aa1bfefc2aa97b82783e053dccfda [1/1] PCI/TSM: Resume device to D0 for CMA-SPDM operation
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260613/202606131415.xLeJAoUX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131415.xLeJAoUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131415.xLeJAoUX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pci/tsm.c: In function 'pci_tsm_doe_transfer':
>> drivers/pci/tsm.c:900:13: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
     900 |         if (rc = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |             ^~
--
   In file included from drivers/crypto/ccp/sev-dev-tsm.c:10:
   drivers/crypto/ccp/sev-dev-tsm.c: In function 'sev_tio_spdm_cmd':
>> drivers/crypto/ccp/sev-dev-tsm.c:43:45: error: passing argument 1 of 'class_pm_runtime_active_try_constructor' from incompatible pointer type [-Wincompatible-pointer-types]
      43 |         PM_RUNTIME_ACQUIRE(dsm->tsm.base_tsm.pdev, pm);
         |                            ~~~~~~~~~~~~~~~~~^~~~~
         |                                             |
         |                                             struct pci_dev *
   include/linux/pm_runtime.h:631:46: note: in definition of macro 'PM_RUNTIME_ACQUIRE'
     631 |         ACQUIRE(pm_runtime_active_try, _var)(_dev)
         |                                              ^~~~
   In file included from include/linux/string.h:7,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from drivers/crypto/ccp/sev-dev-tsm.c:5:
   include/linux/cleanup.h:407:40: note: expected 'class_pm_runtime_active_t' {aka 'struct device *'} but argument is of type 'struct pci_dev *'
     407 |                      class_##_name##_t _T) \
         |                      ~~~~~~~~~~~~~~~~~~^~
   include/linux/cleanup.h:294:75: note: in definition of macro 'EXTEND_CLASS_COND'
     294 | static __always_inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
         |                                                                           ^~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro 'DEFINE_GUARD_COND_4'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/cleanup.h:419:33: note: in expansion of macro 'CONCATENATE'
     419 | #define DEFINE_GUARD_COND(X...) CONCATENATE(DEFINE_GUARD_COND_, COUNT_ARGS(X))(X)
         |                                 ^~~~~~~~~~~
   include/linux/pm_runtime.h:619:1: note: in expansion of macro 'DEFINE_GUARD_COND'
     619 | DEFINE_GUARD_COND(pm_runtime_active, _try,
         | ^~~~~~~~~~~~~~~~~
>> drivers/crypto/ccp/sev-dev-tsm.c:44:13: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
      44 |         if (pm_ret = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |             ^~~~~~


vim +/class_pm_runtime_active_try_constructor +43 drivers/crypto/ccp/sev-dev-tsm.c

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
  > 44		if (pm_ret = PM_RUNTIME_ACQUIRE_ERR(&pm))
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
