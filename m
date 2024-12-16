Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9EA10F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 05:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734327581; cv=none; b=VfxSuYESuFfvt0oHMzbO8euokL1Tmz0xDrDTlSW5hGqA/RDXUZOfMgTYCfp+AFFR72lULAS/orc5yN6GKRcyIRBau+yb++0h8yEVNOyBr+CeRw1Dg4vgyh484cNNJCtcomohGDHg6p+1t6dcgS0ang8K6wfb1un+aKr9UftTUUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734327581; c=relaxed/simple;
	bh=M9+H1GcsmFizG9RqclMVwOeS9rkccdkOQDewX3o4c/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mj35pbX+QeVufPgIGJPhNqQQSfb7GflDn4e3MEmkEJZY5VPA5xVwGQ7LSvoEKp3zpxzZSy8uQNTK3MNkfpI4+qk6BkWX6tHtfCf/rREnqjDGDZxSNS5lruoFIkUkjXwZG0HczQmG/d77h8f+CkaPu/hHmYvf037B9M018O7DTsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTTIGhSb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTTIGhSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734327579; x=1765863579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M9+H1GcsmFizG9RqclMVwOeS9rkccdkOQDewX3o4c/I=;
  b=CTTIGhSbMBTKVk2yuLe2Ho2EpCB0P2LULmyBXN96qIRQ/XH53W8RlG6Z
   FY1UcJr9FL6kZR+510SD9l94EkDqKK0d2tifvPKl8mkgs51sUo2McfuPX
   QhE/Tgv41eLrv6RJ4wZTlYGkJsNnmAzOYiLYMzZfuKyIE0XTwXTW0H8MQ
   5OsHnzECfpSBO0V/AbH063gaH9QHAWFe06enSGFxpiiq1GlU9k0jq8OWq
   QYRhLZwcMpaOyoo/c5O/IpMU6xNId1A7w6MR7/QXQVwL7rTX070XqlyqS
   /yCoMJe7O0omV/SSeVbSSjseKRtpdea6tZzPi6VgupnYpShPz8ll3aKoT
   A==;
X-CSE-ConnectionGUID: Y0APF5IlQlWjndPNBws0xg==
X-CSE-MsgGUID: JH0lyLu9QX6P2BNPxcrc1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34023675"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34023675"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 21:39:38 -0800
X-CSE-ConnectionGUID: BLJXIgTLQXGP0fUASCpJBA==
X-CSE-MsgGUID: eGPzEv0HRnShSapzv4qANQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="97002089"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Dec 2024 21:39:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN3pO-000E3E-0c;
	Mon, 16 Dec 2024 05:39:34 +0000
Date: Mon, 16 Dec 2024 13:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dongxu Sun <sundongxu3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2583/2583] drivers/misc/virt_plat_dev.c:37:43:
 warning: initialization of 'struct irq_domain *' from 'int' makes pointer
 from integer without a cast
Message-ID: <202412161357.rpwPDaPz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi wanghaibin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   dd14d8eb16732508135cd386c09cc747615571f7
commit: e4c0f18287a89cbdf34dffd6ac672d89e8add238 [2583/2583] virt_plat_dev: Register the virt platform device driver
config: arm64-randconfig-003-20241216 (https://download.01.org/0day-ci/archive/20241216/202412161357.rpwPDaPz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412161357.rpwPDaPz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161357.rpwPDaPz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/virt_plat_dev.c: In function 'virt_device_probe':
   drivers/misc/virt_plat_dev.c:37:43: error: implicit declaration of function 'vp_get_irq_domain'; did you mean 'dev_get_msi_domain'? [-Werror=implicit-function-declaration]
      37 |         struct irq_domain *vp_irqdomain = vp_get_irq_domain();
         |                                           ^~~~~~~~~~~~~~~~~
         |                                           dev_get_msi_domain
>> drivers/misc/virt_plat_dev.c:37:43: warning: initialization of 'struct irq_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +37 drivers/misc/virt_plat_dev.c

    31	
    32	static int virt_device_probe(struct platform_device *pdev)
    33	{
    34		struct msi_desc *desc;
    35		unsigned int *drvdata = dev_get_drvdata(&pdev->dev);
    36		unsigned int nvec = *drvdata;
  > 37		struct irq_domain *vp_irqdomain = vp_get_irq_domain();
    38		int ret;
    39	
    40		if (!vp_irqdomain)
    41			return -ENXIO;
    42	
    43		virtdev_info("Allocate platform msi irqs nvecs: %d\n", nvec);
    44		dev_set_msi_domain(&pdev->dev, vp_irqdomain);
    45	
    46		ret = platform_msi_domain_alloc_irqs(&pdev->dev, nvec,
    47						     virt_write_msi_msg);
    48		if (ret) {
    49			pr_err("Allocate platform msi irqs failed %d\n", ret);
    50			goto error;
    51		}
    52	
    53		virtdev_info("Allocate platform msi irqs succeed\n");
    54		for_each_msi_entry(desc, &pdev->dev) {
    55			virtdev_info("Request irq %d\n", desc->irq);
    56			ret = request_irq(desc->irq, virt_irq_handle, 0,
    57					  "virt_dev_host", pdev);
    58			if (ret) {
    59				pr_err("Request irq %d failed %d\n", desc->irq, ret);
    60				goto error_free_irqs;
    61			}
    62		}
    63	
    64		virtdev_info("Init virtual platform device driver successfully.\n");
    65		return 0;
    66	
    67	error_free_irqs:
    68		for_each_msi_entry(desc, &pdev->dev)
    69			free_irq(desc->irq, pdev);
    70	
    71		platform_msi_domain_free_irqs(&pdev->dev);
    72	error:
    73		return ret;
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
