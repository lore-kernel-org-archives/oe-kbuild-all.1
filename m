Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0FC163
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734865735; cv=none; b=nHptQkeRq0/LaMOACyZflhOzpzLb9fOw1clwd1VSGUwjOVxxGxGfsF0B6nEAGXwYSnnDqGWeozGWQ6cHmEGWFLoRr5CrbFqm8YXymtr2k/GfGx2P/t32znA/1jzVf2b78ckBUoE5NvPMqh0q0vQGPw1SJcfduMLwiDr/UdailuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734865735; c=relaxed/simple;
	bh=XF0jjvdcsW3flH4DHpRy9nJAdVwYK9qkxhsArHKcn6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LjPKJVrRUMglqTbgQhzn6ndb/iBcNuU0wOcShMnjkI4e6J7YP13CrkGyDpkiHKOINX0uj5nnDYegeVt7PrlgIZz7EajQ6FRuYxpI4HpuErXCPcb+bIkCNKV+GF819lkCgLWb3bQtx3j5JH7ErAWP6PcghBQmkNE/TSbyOc8+uB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8QLXsXh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8QLXsXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734865734; x=1766401734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XF0jjvdcsW3flH4DHpRy9nJAdVwYK9qkxhsArHKcn6k=;
  b=Q8QLXsXhWSQTAdtAIVjL4prgiEhy86FvIMw/rMYrJ2rsyaEViwbjMOve
   dK/YVP8KexVJSJUVVTDgjtpL4wsa6TUgzEPCfiph3XnFEOvQavVSr2UCE
   ScbLFUuLEsBzL7Xgxhxhh9FcJ/pPDZFdP0AoE4XSvb2lWFO1fXxmU7o7C
   b363F9myQihxMai/ZGIVCzMQB6ggD5Yso8XVozCU2rC4AgfAUgx3oqsRN
   z8DcbqzYOREeIKUCICfFeiP/vZUWE2WrxNLSvX0MSzbo2J56RTrbJES6H
   DqkFTtnsPZeS9PtLEPbytzxNuhkhdiVjsSjIEIzGh9CpuglGCTBvTa1XT
   Q==;
X-CSE-ConnectionGUID: NdvPdopIR7qnSR51Ec0FPw==
X-CSE-MsgGUID: 2UqxFaNpT2+pz9gBgqOplQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46363025"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="46363025"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 03:08:53 -0800
X-CSE-ConnectionGUID: hc5lNjaFRq+KyL6Wr63ckQ==
X-CSE-MsgGUID: eYsUONEWQ9+g1q6QdQiZSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99806930"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2024 03:08:52 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPJpJ-0002sT-2B;
	Sun, 22 Dec 2024 11:08:49 +0000
Date: Sun, 22 Dec 2024 19:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Derek Kiernan <derek.kiernan@xilinx.com>
Subject: drivers/misc/xilinx_sdfec.c:92:57: warning: '%d' directive output
 may be truncated writing between 1 and 10 bytes into a region of size 6
Message-ID: <202412221944.uWX2XEkG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dragan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: 76d83e1c32334a793e50de6f955c2eefcc60bb8e misc: xilinx-sdfec: add core driver
date:   6 years ago
config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241222/202412221944.uWX2XEkG-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221944.uWX2XEkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221944.uWX2XEkG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/xilinx_sdfec.c: In function 'xsdfec_probe':
>> drivers/misc/xilinx_sdfec.c:92:57: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Wformat-truncation=]
      92 |         snprintf(xsdfec->dev_name, DEV_NAME_LEN, "xsdfec%d", xsdfec->dev_id);
         |                                                         ^~
   drivers/misc/xilinx_sdfec.c:92:50: note: directive argument in the range [0, 2147483647]
      92 |         snprintf(xsdfec->dev_name, DEV_NAME_LEN, "xsdfec%d", xsdfec->dev_id);
         |                                                  ^~~~~~~~~~
   drivers/misc/xilinx_sdfec.c:92:9: note: 'snprintf' output between 8 and 17 bytes into a destination of size 12
      92 |         snprintf(xsdfec->dev_name, DEV_NAME_LEN, "xsdfec%d", xsdfec->dev_id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +92 drivers/misc/xilinx_sdfec.c

    59	
    60	static int xsdfec_probe(struct platform_device *pdev)
    61	{
    62		struct xsdfec_dev *xsdfec;
    63		struct device *dev;
    64		struct resource *res;
    65		int err;
    66	
    67		xsdfec = devm_kzalloc(&pdev->dev, sizeof(*xsdfec), GFP_KERNEL);
    68		if (!xsdfec)
    69			return -ENOMEM;
    70	
    71		xsdfec->dev = &pdev->dev;
    72		spin_lock_init(&xsdfec->error_data_lock);
    73	
    74		dev = xsdfec->dev;
    75		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
    76		xsdfec->regs = devm_ioremap_resource(dev, res);
    77		if (IS_ERR(xsdfec->regs)) {
    78			err = PTR_ERR(xsdfec->regs);
    79			return err;
    80		}
    81	
    82		/* Save driver private data */
    83		platform_set_drvdata(pdev, xsdfec);
    84	
    85		mutex_lock(&dev_idr_lock);
    86		err = idr_alloc(&dev_idr, xsdfec->dev_name, 0, 0, GFP_KERNEL);
    87		mutex_unlock(&dev_idr_lock);
    88		if (err < 0)
    89			goto err_xsddev_idr;
    90		xsdfec->dev_id = err;
    91	
  > 92		snprintf(xsdfec->dev_name, DEV_NAME_LEN, "xsdfec%d", xsdfec->dev_id);
    93		xsdfec->miscdev.minor = MISC_DYNAMIC_MINOR;
    94		xsdfec->miscdev.name = xsdfec->dev_name;
    95		xsdfec->miscdev.fops = &xsdfec_fops;
    96		xsdfec->miscdev.parent = dev;
    97		err = misc_register(&xsdfec->miscdev);
    98		if (err) {
    99			dev_err(dev, "error:%d. Unable to register device", err);
   100			return err;
   101		}
   102		return 0;
   103	
   104	err_xsddev_idr:
   105		xsdfec_idr_remove(xsdfec);
   106	
   107		return err;
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
