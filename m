Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE845391
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 00:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709597550; cv=none; b=KSIg6h4t87s8kEwIAB5Jfk0EVzZgadLQu0K+NlyrxmF79vVz9yBliMuQ3FxpbjIB89MCnM5JpOFU5KDtg/qhPdQCY1Y6/Y7VK8se0HVC5en8mds9G+0E6G/pmbqOjVR09Gllwq9+y7YILCwciuv8BhPkjUxHN7mEsMHCqWO8HIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709597550; c=relaxed/simple;
	bh=GY8KgaYi2Dl0Zsu1LjY6epjoRLYYRFhHYwxe74Uga9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iN9MCVcrc2/GZDQIY21y0pVjxZe54YRnEZyJRcSNT8Ps31Dh4I1LXTtVseQ/Wj36q2IuDjCqD8dnQ4yR5CDYwIoWaravgBIXQ5/zMmMhyzjjLUS1u8X7J9pvZR/UUQgetwKXgsfHbn1xjD5uPMcY17ou5g+Sbg7tKeTmLpcz3/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0uF7qrH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0uF7qrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709597549; x=1741133549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GY8KgaYi2Dl0Zsu1LjY6epjoRLYYRFhHYwxe74Uga9g=;
  b=I0uF7qrHnfvjdEfAV7bGNZLiNdPjq4iu1a/OBG1ZboFnJIBlb0z/Sl9p
   uSd1++6y7SxQLGbnzJdYh7HC2XtWrXi1QUdTVlEUwEEyuc/Z4mCcHx9EY
   oGZmkJpvjzKnKJW8J3chTL0wdswK7pPjOCmsET07IRQIP1HcXlixVloW6
   6SYPidC+ACWQWUMeGXui7BuOnWgAdh9BA7VliLAdbxE3AJKCJAYko2qWs
   TdVnb7Yx70sMjTza+Ua73/VuFaLN1WYn3ouFuRkpe6/xuve3ypHWmZGdW
   oZomqY1lVov/jw3EeO/mrxn6nRAza0yz7/KFcpnlc39Ka0qKmravFYCwc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7942858"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="7942858"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 16:12:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="13766048"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Mar 2024 16:12:25 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhIPu-0002qv-3C;
	Tue, 05 Mar 2024 00:12:22 +0000
Date: Tue, 5 Mar 2024 08:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.phytium 16/41]
 drivers/usb/phytium/platform.c:176:12: warning: 'phytium_driver_resume'
 defined but not used
Message-ID: <202403050828.6BLMCvLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.phytium
head:   974a90e098c75ef0e62d4bbbde4535368a61f98b
commit: cde7dabbe0c87fc60cd1ee483a20cf5c060fff0f [16/41] usb: phytium: Add support for Phytium USB controller This patch adds the Phytium USBHS DRD controller support.
config: arm64-randconfig-r051-20240305 (https://download.01.org/0day-ci/archive/20240305/202403050828.6BLMCvLE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050828.6BLMCvLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050828.6BLMCvLE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/phytium/platform.c:176:12: warning: 'phytium_driver_resume' defined but not used [-Wunused-function]
     176 | static int phytium_driver_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/phytium/platform.c:158:12: warning: 'phytium_driver_suspend' defined but not used [-Wunused-function]
     158 | static int phytium_driver_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/phytium_driver_resume +176 drivers/usb/phytium/platform.c

   156	
   157	#ifdef CONFIG_PM
 > 158	static int phytium_driver_suspend(struct device *dev)
   159	{
   160		struct phytium_cusb *config;
   161		int ret = 0;
   162	
   163		config = dev_get_drvdata(dev);
   164	
   165		if (config->dr_mode == USB_DR_MODE_HOST ||
   166				config->dr_mode == USB_DR_MODE_OTG)
   167			ret = phytium_host_suspend(config);
   168	
   169		if (config->dr_mode == USB_DR_MODE_PERIPHERAL ||
   170				config->dr_mode == USB_DR_MODE_OTG)
   171			ret = phytium_gadget_suspend(config);
   172	
   173		return ret;
   174	}
   175	
 > 176	static int phytium_driver_resume(struct device *dev)
   177	{
   178		struct phytium_cusb *config;
   179		int ret = 0;
   180	
   181		config = dev_get_drvdata(dev);
   182		if (config->dr_mode == USB_DR_MODE_HOST ||
   183				config->dr_mode == USB_DR_MODE_OTG)
   184			ret = phytium_host_resume(config);
   185	
   186		if (config->dr_mode == USB_DR_MODE_PERIPHERAL ||
   187				config->dr_mode == USB_DR_MODE_OTG)
   188			ret = phytium_gadget_resume(config);
   189	
   190		return ret;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
