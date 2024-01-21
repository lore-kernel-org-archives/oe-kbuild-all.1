Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123D235F1B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 01:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705802103; cv=none; b=far+dob8rVL6/QHC56GBk9DbXc28uzx/6bmCIZLvwH7O8tn0qx/Vk2Xd3YlizPYKsm8fpWHg5+3wuPSTKCcITqMEh1UmV2lDtZDobGk4clvYX1c6uBX9vcndoeqXNXAAufMgqTMniTI6cPPDd81KQdnNSpLAeKJNvuu+PGBpN4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705802103; c=relaxed/simple;
	bh=C6Fc53W/FWES4oXgOGzrmmBzUJFz7E/r+woxT5VL5Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bd76VZNL4xyrLKmx7MtVmmp8e3GGKV2knUF52AuN4czuAzS0Xl2mbMRI7wu3nBfGOJPHEE7oKTTJ/eIiGa4tR74U6lt08WDp42y1ICwjYH9gx1URGRsUYvWFYM3NSPmAKByBXWTAdRG+c5TnN3OjovQzz7XsnbdGm3Tj6p5lAn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6Fd2Rmj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6Fd2Rmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705802101; x=1737338101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C6Fc53W/FWES4oXgOGzrmmBzUJFz7E/r+woxT5VL5Ms=;
  b=K6Fd2RmjZOgc3uodKxsy/dLzfAWl0tJhaKYz38EP4Z2t42L5HiBWDCue
   lMygMqiFuAqWRV9q6MaUHDrt/oiN87hJW8k/GGdL2vvPGOTijYHxsLW7d
   m5vxWNJzVhV+tKT43ZX7Kkz6erJ1T90NA17XJJb+Q2JWrMiTnK0R6K4Pw
   CvvkxNEnnCPwFaQgQdt78ncxcUQPn6grB9kS1wnjYoBems8jiDOe1dao9
   eYuvXYd/Au6jcTocT9nJouoigQVx7+sRqnH8HO9jfSgc367EUpZU0p+yK
   x0B9mJMXejJqdx1YmtDdkgogY+HAwTHxYqYYSjDLegtCRdhhYniZWwLIW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="889897"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="889897"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 17:55:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="1116549687"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="1116549687"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2024 17:54:58 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRN32-0005b8-1e;
	Sun, 21 Jan 2024 01:54:56 +0000
Date: Sun, 21 Jan 2024 09:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 23099/30000]
 drivers/crypto/hisilicon/qm.c:2755:9: warning: 'strncpy' specified bound
 depends on the length of the source argument
Message-ID: <202401210922.YoP0poJX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   297307a8bbb354ddba271dfebf528961834ddf14
commit: a1666f44c2250f7413e73e2f4c02cb2c01f9e3b0 [23099/30000] crypto: hisilicon/qm - support no-sva feature
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240121/202401210922.YoP0poJX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210922.YoP0poJX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401210922.YoP0poJX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/hisilicon/qm.c: In function 'qm_alloc_uacce':
>> drivers/crypto/hisilicon/qm.c:2755:9: warning: 'strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
    2755 |         strncpy(interface.name, pdev->driver->name, name_len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/hisilicon/qm.c:2748:20: note: length computed here
    2748 |         name_len = strlen(pdev->driver->name);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +2755 drivers/crypto/hisilicon/qm.c

  2737	
  2738	static int qm_alloc_uacce(struct hisi_qm *qm)
  2739	{
  2740		struct pci_dev *pdev = qm->pdev;
  2741		struct uacce_interface interface;
  2742		struct uacce_device *uacce;
  2743		int name_len;
  2744	
  2745		if (!qm->use_uacce)
  2746			return 0;
  2747	
  2748		name_len = strlen(pdev->driver->name);
  2749		if (name_len >= UACCE_MAX_NAME_SIZE) {
  2750			pci_err(pdev, "The driver name(%d) is longer than %d!\n",
  2751				name_len, UACCE_MAX_NAME_SIZE);
  2752			return -EINVAL;
  2753		}
  2754	
> 2755		strncpy(interface.name, pdev->driver->name, name_len);
  2756		interface.name[name_len] = '\0';
  2757	
  2758		interface.flags = qm->use_iommu ? UACCE_DEV_IOMMU : UACCE_DEV_NOIOMMU;
  2759		if (qm->mode == UACCE_MODE_SVA) {
  2760			if (!qm->use_iommu) {
  2761				pci_err(pdev, "iommu not support sva!\n");
  2762				return -EINVAL;
  2763			}
  2764	
  2765			interface.flags |= UACCE_DEV_SVA;
  2766		}
  2767	
  2768		interface.ops = &uacce_qm_ops;
  2769		uacce = uacce_alloc(&pdev->dev, &interface);
  2770		if (IS_ERR(uacce)) {
  2771			pci_err(pdev, "fail to alloc uacce device\n!");
  2772			return PTR_ERR(uacce);
  2773		}
  2774		qm->uacce = uacce;
  2775	
  2776		qm_uacce_base_init(qm);
  2777		qm->uacce = uacce;
  2778		INIT_LIST_HEAD(&qm->isolate_data.qm_hw_errs);
  2779		mutex_init(&qm->isolate_data.isolate_lock);
  2780	
  2781		return 0;
  2782	}
  2783	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
