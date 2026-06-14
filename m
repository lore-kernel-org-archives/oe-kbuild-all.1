Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A66208D0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 01:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781400244; cv=none; b=GYebt9dsBsDdJpbhyk77OHzrjHha33IwrsXY/95Fy18ur3DzcMGFIqlrF0WrnO37lzeEirglySyjTMstuv/J9sKmn11BZKr0sYlpte+4POUGO5K560C/MTFtOy4U9zwIm9M8o99FKErhJAhzuAUMaNmEM0buYbFO3IEi6+Jq0Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781400244; c=relaxed/simple;
	bh=8KJ0lVz7h71Na9RTS7qyWzkqce+HiYgsQmaKhbAXrww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LHZJ41++kjRUwnesZ8JTyzmbeotSplN5bE8VhOfaDV1CrZ2/1hz/u9fMBNq85veQcuChNfXHdyESxod71ymKlEugIIE+PxQ77D3MJ4FfBKG8fiHnSgsGBKcX4N1WwNUpssxFhGaTAHn9UtBAg2s/jUQp9+AMHFEHIG0FsdLkWH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/EY5eWI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/EY5eWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781400242; x=1812936242;
  h=date:from:to:cc:subject:message-id;
  bh=8KJ0lVz7h71Na9RTS7qyWzkqce+HiYgsQmaKhbAXrww=;
  b=f/EY5eWIjdtwf0v1YxdE0fN/AC63BMURMsAAL6VzwGyR9tAOSrN6iyUT
   2x1Mqzx2ZrmyZBhswvbrRMe7TKToYPsKqWnOgCLjgAPUu5qWE2P7hH6VK
   secKrbbhhyWQq+5ydtfFVSHTwgo3/hNJ+yJB69j+TmnITwMCrTq8et8V0
   z1fWSbrrR4j0txtiQYJB8G3wGJJ3bMz5yyzXygCYamzT8ZPCijGoue9cU
   FP1V0iSZNatqC2dCSv0C8umya63jr3G3QeOz7GRtTHjmGgmDsrNgIGl+N
   FobT8JHrDTH0htMs1D8lBe1OxJQj1Q1T9HNAk+1Dn/wuB0EiMVNgt1OeV
   g==;
X-CSE-ConnectionGUID: Ofi4RRR9TGSTuRYCXnYRiw==
X-CSE-MsgGUID: MN4i4O0hQqiV009CNbmkuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82291338"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="82291338"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 18:24:01 -0700
X-CSE-ConnectionGUID: b5aCvzxSQdirfyqI+3ETAw==
X-CSE-MsgGUID: aG7NsRQGTou00YCj11mOcw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2026 18:24:00 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYZZt-00000000QSK-3ohy;
	Sun, 14 Jun 2026 01:23:57 +0000
Date: Sun, 14 Jun 2026 09:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tsm_d0 1/1] drivers/crypto/ccp/sev-dev-tsm.c:43:50:
 error: incompatible type for argument 1 of
 'class_pm_runtime_active_try_constructor'
Message-ID: <202606140945.OLRoxGWG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux tsm_d0
head:   fa810ae34a686da54dd1cbf128cc093c733ad01e
commit: fa810ae34a686da54dd1cbf128cc093c733ad01e [1/1] PCI/TSM: Resume device to D0 for CMA-SPDM operation
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260614/202606140945.OLRoxGWG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140945.OLRoxGWG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140945.OLRoxGWG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/crypto/ccp/sev-dev-tsm.c:10:
   drivers/crypto/ccp/sev-dev-tsm.c: In function 'sev_tio_spdm_cmd':
>> drivers/crypto/ccp/sev-dev-tsm.c:43:50: error: incompatible type for argument 1 of 'class_pm_runtime_active_try_constructor'
      43 |         PM_RUNTIME_ACQUIRE(dsm->tsm.base_tsm.pdev->dev, pm);
         |                            ~~~~~~~~~~~~~~~~~~~~~~^~~~~
         |                                                  |
         |                                                  struct device
   include/linux/pm_runtime.h:631:46: note: in definition of macro 'PM_RUNTIME_ACQUIRE'
     631 |         ACQUIRE(pm_runtime_active_try, _var)(_dev)
         |                                              ^~~~
   In file included from include/linux/string.h:7,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from drivers/crypto/ccp/sev-dev-tsm.c:5:
   include/linux/cleanup.h:407:40: note: expected 'class_pm_runtime_active_t' {aka 'struct device *'} but argument is of type 'struct device'
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
