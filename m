Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0F28836
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 03:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741059386; cv=none; b=YOJoL+ov1XB6MDHVQ2sfWcFYCFAQpCaB/C1jjW5ozmzwO08nen9Lf2r9jSrUddnORylVJ3cSQzRKeYPpZIhnxr35On6xvLs0MoQd/B5jtE1xvE17HHgAe+O8mo5HPaoqKunZsJsDnTklXl8dTzC4oqXKyFXx+4kWWDNn+xWJteA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741059386; c=relaxed/simple;
	bh=C/W1GyYvdYZj4wZLH3PW3LoXKDJC1fqZjRpYhfLj170=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yc/gKfvH3C5YeHz+97kC/AfLVgSSQ6kEIpIlP4FGDrYlnhk3qIKmw+s1iwliGLyP5eyg+AzLzitKJg0cSnYmI551ePYcz+U4IavdVFfw0Qtu5dnaLXkDh0XCd+tsxc71mXxE3V248eipZTv/5P1EMZ2dbUG2Z8KGI+zP51PiZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECgOPLZ8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECgOPLZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741059384; x=1772595384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C/W1GyYvdYZj4wZLH3PW3LoXKDJC1fqZjRpYhfLj170=;
  b=ECgOPLZ8Th4bEk6zYuDY1Us1cT4SWH0X8bLAMdGQ/e5JshV1lfdzjluz
   7B1G0r85o14nl+vv1O2W9KlgmqduBo7uN2CgjmubMuf3I33jsQdIpDpn4
   Q1veTyCF7UuWVQCOer0+5Ii+HxDGnqM8d1ziy0/MfZSmedkBk1iqJQ8uj
   BtDQc2oUtELIQ3K/fzkqk4FwYqp5Pddn0m4m1cCSf440NmE8INS5SFlt+
   WFZvQCjBcmU/kkmoosFnOs/bgLA9PFJRvdajOsJpwDHg7ijr8ETs4jGvh
   QvK90DL6LGwABBIEkz1sKQEgxRG/vIns2R4bvHLW8WNW6rTlWv1q703x8
   A==;
X-CSE-ConnectionGUID: BMufWxKGT+iie9AorCXeeg==
X-CSE-MsgGUID: gC9su8IaQByVxHUlM2DMkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41204532"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="41204532"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 19:36:24 -0800
X-CSE-ConnectionGUID: SqmF7XhqQK6ZvZNRkPiPUg==
X-CSE-MsgGUID: ab5xbJHYT/muRUFWLE62Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118726525"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2025 19:36:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpJ4u-000JDv-2g;
	Tue, 04 Mar 2025 03:36:20 +0000
Date: Tue, 4 Mar 2025 11:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 53/89] drivers/mfd/fsl-imx25-tsadc.c:68:29:
 warning: unused variable 'np'
Message-ID: <202503041147.rhI02OMl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   2e34f839068291b65952cdcabb82b977d40d165c
commit: 59da3790b5411205e18132392d6c8d78be1d9cd1 [53/89] irqdomain: mfd: Stop using irq_domain_add_simple()
config: x86_64-buildonly-randconfig-002-20250304 (https://download.01.org/0day-ci/archive/20250304/202503041147.rhI02OMl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503041147.rhI02OMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503041147.rhI02OMl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/fsl-imx25-tsadc.c: In function 'mx25_tsadc_setup_irq':
>> drivers/mfd/fsl-imx25-tsadc.c:68:29: warning: unused variable 'np' [-Wunused-variable]
      68 |         struct device_node *np = dev->of_node;
         |                             ^~


vim +/np +68 drivers/mfd/fsl-imx25-tsadc.c

e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  63  
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  64  static int mx25_tsadc_setup_irq(struct platform_device *pdev,
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  65  				struct mx25_tsadc *tsadc)
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  66  {
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  67  	struct device *dev = &pdev->dev;
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14 @68  	struct device_node *np = dev->of_node;
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  69  	int irq;
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  70  
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  71  	irq = platform_get_irq(pdev, 0);
75db7907355ca5 Dan Carpenter             2022-08-11  72  	if (irq < 0)
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  73  		return irq;
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  74  
59da3790b54112 Jiri Slaby (SUSE          2025-02-26  75) 	tsadc->domain = irq_domain_create_simple(of_fwnode_handle(np), 2, 0,
59da3790b54112 Jiri Slaby (SUSE          2025-02-26  76) 						 &mx25_tsadc_domain_ops, tsadc);
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  77  	if (!tsadc->domain) {
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  78  		dev_err(dev, "Failed to add irq domain\n");
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  79  		return -ENOMEM;
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  80  	}
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  81  
f132bc3f301efa Martin Kaiser             2017-09-12  82  	irq_set_chained_handler_and_data(irq, mx25_tsadc_irq_handler, tsadc);
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  83  
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  84  	return 0;
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  85  }
e2fccf5c151572 Markus Schneider-Pargmann 2015-12-14  86  

:::::: The code at line 68 was first introduced by commit
:::::: e2fccf5c15157218f0b6488168f98183f82c1eda mfd: fsl-imx25-tsadc: Register touchscreen ADC driver

:::::: TO: Markus Pargmann <mpa@pengutronix.de>
:::::: CC: Lee Jones <lee.jones@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
