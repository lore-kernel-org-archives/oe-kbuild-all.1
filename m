Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A152D04C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 17:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705599928; cv=none; b=q9wJ4ivd0E4vw7lStklux4ZaWbLdFjIl4+9SgtKUqtaiT0NA7doG0UbK7VNovPSzXK6eumhMfCGOhtuXAgMPbF4/kyVLrzjI5R+cm/AZDAL8OK163mqRxarVw6Y0k9rYaglvCOIbf/9LmGgYs6U7M3YAFPFHGJNF4GtbR+MYiX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705599928; c=relaxed/simple;
	bh=cxHfVemDd28U6JZ4YRxUIShfEgo+O3t3q/s8l1cOUhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mYd2Nf7Ny17Hn2I9bwcMAJxrgbS9YdIB2R8LWFJ0J7A2y0jwRxgYXGgeILt1L/9hDYlcfxoqzfdeJYa6m50UCjIm3c3BMlVob/79ZuxRihyp2knUU50KXi7M/JME+o4ldKSGtXF82iUFoJcfgD0DNd3BctMogWlYNqo0/HqCCoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTRgCyM+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTRgCyM+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705599927; x=1737135927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cxHfVemDd28U6JZ4YRxUIShfEgo+O3t3q/s8l1cOUhE=;
  b=FTRgCyM+OOvNjGrUoy9G30T3PYfLzyRFJQyR2jT6lEqDGKs5oxvmE4T+
   8oLPqIAO/2Vt8IDav5viEQ+xWZUdmh1UFboKTt6oegxTRnPgxyuVRdYnn
   6ZkUf9ZEh3QkhDsD4mBRrLRYmuJk9Pu7Sn7b/T+Jtdzpqigx52HsTiRQ/
   N5fth+1Bn81K2MG9aA3+jvT7GDcfx004G3Z08s0MAtlCYFTQOPtgS/7Fe
   y6xv+UYvnqk/ti3me8xL6XFuNDBI1FKQxoIJbf8KWR9BHjaeBVJHVWJ+5
   9vptUYxJYjuROvpy9YDzVH09awOScH3jr7H+VP/QFWsduEdRo8N+ncIn1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="14036909"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="14036909"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 09:45:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="903895550"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="903895550"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2024 09:45:24 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQWSA-0003Bs-1g;
	Thu, 18 Jan 2024 17:45:22 +0000
Date: Fri, 19 Jan 2024 01:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
 15602/15673] drivers/spmi/hisi-spmi-controller.c:308:17: error: assignment
 from incompatible pointer type
Message-ID: <202401190139.zrs84T7P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
head:   5cac1bb64a0300d340c5e369489c731b30aa5e79
commit: ad3c44509074f9f896bcdec6d6b1f051b169dcf6 [15602/15673] spmi: Add support for multi-master
config: i386-randconfig-013-20240118 (https://download.01.org/0day-ci/archive/20240119/202401190139.zrs84T7P-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190139.zrs84T7P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190139.zrs84T7P-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spmi/hisi-spmi-controller.c: In function 'spmi_controller_probe':
>> drivers/spmi/hisi-spmi-controller.c:308:17: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
     ctrl->read_cmd = spmi_read_cmd;
                    ^
   drivers/spmi/hisi-spmi-controller.c:309:18: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
     ctrl->write_cmd = spmi_write_cmd;
                     ^
   cc1: some warnings being treated as errors


vim +308 drivers/spmi/hisi-spmi-controller.c

2ea3f6a03b155f drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  262  
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  263  static int spmi_controller_probe(struct platform_device *pdev)
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  264  {
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  265  	struct spmi_controller_dev *spmi_controller;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  266  	struct spmi_controller *ctrl;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  267  	struct resource *iores;
7f3ac6c502fd7f drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  268  	int ret;
6af364501949d9 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  269  
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  270  	ctrl = devm_spmi_controller_alloc(&pdev->dev, sizeof(*spmi_controller));
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  271  	if (IS_ERR(ctrl)) {
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  272  		dev_err(&pdev->dev, "can not allocate spmi_controller data\n");
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  273  		return PTR_ERR(ctrl);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  274  	}
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  275  	spmi_controller = spmi_controller_get_drvdata(ctrl);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  276  	spmi_controller->controller = ctrl;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  277  
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  278  	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  279  	if (!iores) {
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  280  		dev_err(&pdev->dev, "can not get resource!\n");
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  281  		return -EINVAL;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  282  	}
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  283  
dbbc8fdf2ad576 drivers/staging/hikey9xx/hisi-spmi-controller.c Dan Carpenter         2020-09-18  284  	spmi_controller->base = devm_ioremap(&pdev->dev, iores->start,
dbbc8fdf2ad576 drivers/staging/hikey9xx/hisi-spmi-controller.c Dan Carpenter         2020-09-18  285  					     resource_size(iores));
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  286  	if (!spmi_controller->base) {
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  287  		dev_err(&pdev->dev, "can not remap base addr!\n");
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  288  		return -EADDRNOTAVAIL;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  289  	}
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  290  
fcc84fe12fd827 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2021-06-24  291  	ret = of_property_read_u32(pdev->dev.of_node, "hisilicon,spmi-channel",
2ea3f6a03b155f drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  292  				   &spmi_controller->channel);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  293  	if (ret) {
6196331e79f361 drivers/staging/hikey9xx/hisi-spmi-controller.c Mauro Carvalho Chehab 2020-08-17  294  		dev_err(&pdev->dev, "can not get channel\n");
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  295  		return -ENODEV;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  296  	}
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  297  
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  298  	platform_set_drvdata(pdev, spmi_controller);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  299  	dev_set_drvdata(&ctrl->dev, spmi_controller);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  300  
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  301  	spin_lock_init(&spmi_controller->lock);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  302  
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  303  	ctrl->nr = spmi_controller->channel;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  304  	ctrl->dev.parent = pdev->dev.parent;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  305  	ctrl->dev.of_node = of_node_get(pdev->dev.of_node);
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  306  
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  307  	/* Callbacks */
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17 @308  	ctrl->read_cmd = spmi_read_cmd;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  309  	ctrl->write_cmd = spmi_write_cmd;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  310  
490d88ef548d46 drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  311  	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
12b38ea040b3bb drivers/staging/hikey9xx/hisi-spmi-controller.c Christophe JAILLET    2020-12-13  312  	if (ret) {
12b38ea040b3bb drivers/staging/hikey9xx/hisi-spmi-controller.c Christophe JAILLET    2020-12-13  313  		dev_err(&pdev->dev, "spmi_controller_add failed with error %d!\n", ret);
ffdfbafdc4f46a drivers/spmi/hisi-spmi-controller.c             Fei Shao              2023-12-06  314  		return ret;
12b38ea040b3bb drivers/staging/hikey9xx/hisi-spmi-controller.c Christophe JAILLET    2020-12-13  315  	}
12b38ea040b3bb drivers/staging/hikey9xx/hisi-spmi-controller.c Christophe JAILLET    2020-12-13  316  
12b38ea040b3bb drivers/staging/hikey9xx/hisi-spmi-controller.c Christophe JAILLET    2020-12-13  317  	return 0;
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  318  }
70f59c90c8199e drivers/staging/hikey9xx/hisi-spmi-controller.c Mayulong              2020-08-17  319  

:::::: The code at line 308 was first introduced by commit
:::::: 70f59c90c8199e888b306edb16e20f651a1fce55 staging: spmi: add Hikey 970 SPMI controller driver

:::::: TO: Mayulong <mayulong1@huawei.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
