Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41FC3E314A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781355544; cv=none; b=SbjMxCVRbCnZaHa8jbbq12cMUSO+43Gxn8qeYhxXm1E1c1nBBZf2AwtVb1bm2Rj9hhzUj6GfISMQ5QU7WQqW65r8hI9SeJHwT/RneDdcB4XsDBsimk0Kh3Ngie593PmHLBe37+6KfCJImexB60yMGWDx4vaHcmL9tpBT8rJlL2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781355544; c=relaxed/simple;
	bh=X2biqSM6GvmplfAvnX1Yf+ETcFwhxjt6pQkOwR8Vq0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bQTF/3yA0potTnjsi1W84ISDBsPVubSqYpvrEwYvU47bhrvYCqBoXGHyiIUjjT/Vo1ck7XdVYPuSIapHdMbr8GZYRU7drm9NixrKaMr2vU1A93R2+jzsQI578PkNwDnijicDZLF9h3HVBPOv2EJ/Xn171E+izxETGALWdkKaNKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LODV40/l; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LODV40/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781355544; x=1812891544;
  h=date:from:to:cc:subject:message-id;
  bh=X2biqSM6GvmplfAvnX1Yf+ETcFwhxjt6pQkOwR8Vq0c=;
  b=LODV40/lUkZU6IpJfwA9I1AbIfNOYl/ZIcgT3F6EEXd1I/OowH4MzdBN
   NTNV8rxipjvmXsUYsA9keBphPY2MCpXhoa7C/wEJO7LaKcpCP8CmrIgIX
   en2Z4lapiwSQD16GCd+w2wOARAXoENXn3c7oO0faI3NB/dB/ro7MSMy13
   FZ4XXoJT23GaERMbrBFNOup1RJ1z/LQLveFS10yGtbGBEsRQvN16Y9Niu
   ytJ8Jkx5iEL9FWEjo4c/RHryQiueUpF3lk29U4pHbbwmK86fpiPeqBQPr
   GR87t2LiSLOa+YQS8o5UiE06vDI9e0DvBUuk+M9m3nlI8NbPiilKhjLN1
   Q==;
X-CSE-ConnectionGUID: f5fUmNgYSj+chlPkolJ/ng==
X-CSE-MsgGUID: r5xuX54cRG2fEEliH1iI9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86065399"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="86065399"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 05:59:01 -0700
X-CSE-ConnectionGUID: w8ELAOy9SpGTqh6mWS1JeQ==
X-CSE-MsgGUID: ULD9mK+NQzKJGRB9O6iE3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="245937240"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2026 05:58:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYNwu-00000000Pus-0VlJ;
	Sat, 13 Jun 2026 12:58:56 +0000
Date: Sat, 13 Jun 2026 20:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tsm_d0 1/1] drivers/crypto/ccp/sev-dev-tsm.c:43:45:
 error: passing argument 1 of 'class_pm_runtime_active_try_constructor' from
 incompatible pointer type
Message-ID: <202606132048.PyOSDUgd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux tsm_d0
head:   5d1328bf1d1aa1bfefc2aa97b82783e053dccfda
commit: 5d1328bf1d1aa1bfefc2aa97b82783e053dccfda [1/1] PCI/TSM: Resume device to D0 for CMA-SPDM operation
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260613/202606132048.PyOSDUgd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606132048.PyOSDUgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606132048.PyOSDUgd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
