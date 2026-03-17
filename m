Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0682630EF92
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 16:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773764367; cv=none; b=OiyCVMf93LwBg50JUIWlaC0A+q2LyhvO59GVNoREQw24chbxmL2Kku1YjtC/2MCEGl3+lovuPn9qavO+6i1MHkJf4IJhMHQMvYN4fqpUIZtrYLeA6ruc9ozFuDKXP7gP4xE5xFmvDlsLj+j5ulORlLExKY34NxynZp7L5ceyk00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773764367; c=relaxed/simple;
	bh=Gx0bEiNqSL2TS4XXYIKGw5UHoDMQvL4lkc942bd8ZK4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RJIzWxRdNlnlb8jcgZdjByY5aXLkbuvwwT+Xu5QfbBCZCM7ZHX5DEwqGOr7XZdufw+DIKw4S/M4aCwPGCtM+r74XCmzdKliy6xq6mUp8PLu93Hyb61Da69HOGjwFaq62VMLpWnlbpcRSK422gLmyC+c88qESC16UGyY72RCxMoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XH44Kb5k; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XH44Kb5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773764366; x=1805300366;
  h=date:from:to:cc:subject:message-id;
  bh=Gx0bEiNqSL2TS4XXYIKGw5UHoDMQvL4lkc942bd8ZK4=;
  b=XH44Kb5kpm7nYjCl/TQV2jIKjSbd/baONthCmfgch8qmSR2qxfn6SU05
   IB018lhWS3t/jc7ORyCSFMu62+FSQfb83WEGiMe/nALR3bMGj8RteIxI1
   466B03/K6MK/Ti2+jL3Ji5j1r0+aQKWM+qoya9pf/ZBbE3Bw2/o0TBPtz
   BLb5p3DVhnlDuZaQv50Q2xXXJ9lCc8BzjKLircdWNsokGZU4IOVrWi5bT
   uN9nEyKYSE9duQAhmP4ltwKPcOFGn+HmQvmK1ItE7uCshedWhWsW2O8Gr
   3cUz/SdKP6VxjGaNb2e8zg+aNUl1fCiRTP7+ZouKrimZjr2qhR67l9XHf
   w==;
X-CSE-ConnectionGUID: z2bFeptWShO/4pQh+4aZag==
X-CSE-MsgGUID: 8Il8K7QvRAOj+ZaQul+WQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85880434"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85880434"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 09:19:25 -0700
X-CSE-ConnectionGUID: hDqJm06dRGW0bl0/qPs5zQ==
X-CSE-MsgGUID: 6aloCnQETU2gbBlVzyzvNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="217994078"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Mar 2026 09:19:23 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2X8b-000000000mL-1NpP;
	Tue, 17 Mar 2026 16:19:21 +0000
Date: Wed, 18 Mar 2026 00:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 30/30]
 drivers/cma_test/cma_alloc_test_drv.c:93:30: error: 'struct device' has no
 member named 'cma_area'
Message-ID: <202603180043.unVmBw6V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   339bea17e1ccb695cddcbc39f88955c85e45d97a
commit: f13d84382b42c33d4a27e09136721a997da6b225 [30/30] ANDROID: cma: Init the CMA reserved memory during probing
config: x86_64-randconfig-002-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180043.unVmBw6V-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180043.unVmBw6V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180043.unVmBw6V-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cma_test/cma_alloc_test_drv.c: In function 'cma_test_probe':
>> drivers/cma_test/cma_alloc_test_drv.c:93:30: error: 'struct device' has no member named 'cma_area'
      93 |         if (ret || !pdev->dev.cma_area) {
         |                              ^
   drivers/cma_test/cma_alloc_test_drv.c: At top level:
   drivers/cma_test/cma_alloc_test_drv.c:140:19: error: initialization of 'int (*)(struct platform_device *)' from incompatible pointer type 'void (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
     140 |         .remove = cma_test_remove,
         |                   ^~~~~~~~~~~~~~~
   drivers/cma_test/cma_alloc_test_drv.c:140:19: note: (near initialization for 'cma_test_driver.remove')
   cc1: some warnings being treated as errors


vim +93 drivers/cma_test/cma_alloc_test_drv.c

    78	
    79	static int cma_test_probe(struct platform_device *pdev)
    80	{
    81		int ret;
    82		const struct of_device_id *of_id;
    83	
    84		pr_info("Probing device");
    85	
    86		of_id = of_match_device(cma_test_dt_ids, &pdev->dev);
    87		if (!of_id) {
    88			pr_info("The node was not found in DTB");
    89			return -ENODEV;
    90		}
    91	
    92		ret = of_reserved_mem_device_init(&pdev->dev);
  > 93		if (ret || !pdev->dev.cma_area) {
    94			dev_err(&pdev->dev,
    95				"The CMA reserved area is not assigned (ret %d)\n",
    96				ret);
    97			return -EINVAL;
    98		}
    99	
   100		ret = devm_add_action(&pdev->dev, rmem_remove_callback, &pdev->dev);
   101		if (ret) {
   102			of_reserved_mem_device_release(&pdev->dev);
   103			return ret;
   104		}
   105	
   106		return 0;
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
