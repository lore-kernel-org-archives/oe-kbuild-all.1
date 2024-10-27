Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25809DF5C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 06:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730008936; cv=none; b=YUTpkPROSW5vjdd7ZMHggMtNK9u2ywGpXWqgJPzkS7yMbxf70Heb9zgjyOldPWWhP8z9X0Sfj0tqIfZqJQnF6k8/bNCiho/pbY8X9WCSSRS5WJo3f7tJwh4EvkeuyFlXkMjnuPRlvxw8HX71WO5xjlGARevLYm12bNbLSDaz2og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730008936; c=relaxed/simple;
	bh=cU1tcy8pjiC+d5aWR9At/yULBb6cwWvq+Q/Gv8X24bI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ihD9kv3umc40MvE9GKqgd8Z59HE7HKATwqLTGZ7fBAszUYBaCpoQbvZWhkGAaNx+4uS4Yjj3jWI3uqy+R8L5K0O7/z80+cP++FXvRYBram5XeN/olxklpKcvSL18hgWZ0R6xM7kRpVYSNrk54yVBaYWhpSTtE/i9tPBOa6UXaT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lml/Gwm4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lml/Gwm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730008933; x=1761544933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cU1tcy8pjiC+d5aWR9At/yULBb6cwWvq+Q/Gv8X24bI=;
  b=lml/Gwm4Kb2XvmyKr2O30c3kPNVvhN0Nfeqi7q7Os+t14VlZpVCmMs7g
   rxH63LdFDbC2EHypDzDV8gGZ50niat3YBG0y0DzqVolD0d+WeIlx/EjnX
   ileboJGeNEG2nK5nUdhOKVwzKDdVwau4Y4oG4ZsOwkUXjQtaQ7if5G/M2
   jT4U6LSpST9k86AHRqRRsc25ClEBMK268F+SbvDTtaTZGKUPy+ChJrPoB
   YUHeuqdt+3aKhrDzOMMw+hXmS+DdCGa5+9MTlACU7m1zP7t4blYQSVPwX
   2diRgTIQodnNXrAbq7FMDUeK1ieBOE2hO4wOap7qPi0rxyKK/rvXyhX2U
   Q==;
X-CSE-ConnectionGUID: XlP9Jcf5TDmJR0l3emeUuA==
X-CSE-MsgGUID: Sp8TcAjiQb6/LNySYe1JIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29497488"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29497488"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 23:02:13 -0700
X-CSE-ConnectionGUID: bAbGkipWSo+oBs4amiuX3w==
X-CSE-MsgGUID: /+ImSAgTTJGtbG2sb4uGvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="81212677"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Oct 2024 23:02:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4wLp-000aQ8-0L;
	Sun, 27 Oct 2024 06:02:09 +0000
Date: Sun, 27 Oct 2024 14:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JiangShui <1175135535@qq.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 15679/30000]
 drivers/crypto/hisilicon/qm.c:2755:9: warning: 'strncpy' specified bound
 depends on the length of the source argument
Message-ID: <202410271351.DRedn4gy-lkp@intel.com>
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
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: a1666f44c2250f7413e73e2f4c02cb2c01f9e3b0 [15679/30000] crypto: hisilicon/qm - support no-sva feature
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241027/202410271351.DRedn4gy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271351.DRedn4gy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271351.DRedn4gy-lkp@intel.com/

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
