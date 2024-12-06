Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC6EB641
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733482799; cv=none; b=oXeOCf0kaAMRMHUzw9FRQSXxc4l32VAPNAHc1iqydePRzBx4VaDh+NyYFDJs/CHUUk8SdjyFcpu62aSpO4mD2iv9sr85OuMe+53YcjpZtpOK7F0y6AKCm3XD6WPLkoGG5Ey2+e5ceJacoIWOnw4g9RNInaGxY1Ou2dT6rSt2PPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733482799; c=relaxed/simple;
	bh=Tc3c0kQUVv/8jdJa5V8Ftb9wVLYIF3cGQ+E4FuP4gIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJ32kx4t7bHWGYAF+icTeGtifBvw7tSqCQzySDsXDWd+F7LN8th+G9c8GUl5lFfm2roYWjLCreptLvUs9E12tjcz8jPrQ8WthwfmsBiFPj7CodoxkI1D5a80T2M/asKZVlfCSVPWCPERcNdp4MEhnrgzdV3XUHrHJAk/dTRn2b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWIaCJeh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWIaCJeh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733482798; x=1765018798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tc3c0kQUVv/8jdJa5V8Ftb9wVLYIF3cGQ+E4FuP4gIE=;
  b=OWIaCJehSrWoowjT3Elj2J6HX6xsMUiNgd10M6RQJHnKx8tNOyx1dFTO
   wiEn+MPc9auy3FT1e7ajibtyjFcH0G3DL5uAGbYH/NvE6AbHYgr1W3vQW
   XwTmhVFXU4ZzXj4RiAcQ9XFR4tqRmNin72f+C1H5iX7oz2y0MksHehk4I
   jCumT4ioCW029YyumP8+Tg8jUpbdnWnRLLb3By0LhQkKlP2qTETuMu2zM
   ubHbSFHG0t1eHjLJsCzEyRyLSX9/WfsqyoLsrQ87EO3if5homZsLXvECY
   tbE1Ps2UlYpBxvfARja0vZWe+5b+J0ukiqBkhfbqbYsf/9zMROjXqyWZk
   Q==;
X-CSE-ConnectionGUID: zo1q+GNLSpmx47uB69uVvg==
X-CSE-MsgGUID: hMVCXBA+Tvy+KU5hy+yvRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37616922"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="37616922"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 02:59:57 -0800
X-CSE-ConnectionGUID: tJ5n0wQ+TF26wzye5N/z/A==
X-CSE-MsgGUID: 8tam1HpNTRi0enEj0me7iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="99441343"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Dec 2024 02:59:55 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJW3s-0000xV-29;
	Fri, 06 Dec 2024 10:59:52 +0000
Date: Fri, 6 Dec 2024 18:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JiangShui <1175135535@qq.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2564/2564] drivers/crypto/hisilicon/qm.c:2755:9:
 warning: 'strncpy' specified bound depends on the length of the source
 argument
Message-ID: <202412061809.pAIeGbw0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weili,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9cf5f60a8d57b2498fb9f9223825d6933b2d2fd5
commit: a1666f44c2250f7413e73e2f4c02cb2c01f9e3b0 [2564/2564] crypto: hisilicon/qm - support no-sva feature
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241206/202412061809.pAIeGbw0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061809.pAIeGbw0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061809.pAIeGbw0-lkp@intel.com/

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
