Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3F014A4F9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 06:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736578334; cv=none; b=cP4njvzy2ja8Fztr22q+hsAQGgAlqFmTypRFDoWPLoQg0J3VfIynv4rN7ILokLjAgoQAuy9MdJo2xX32qCh1PjfqHnntqAkfrUJXibO/AFwog1PGoKRuhLSc7ByQiBqAD64Q9fbWefvr0fCfigJHUsqXHPrW0Jb9iuS/NvO4sps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736578334; c=relaxed/simple;
	bh=sgVMhYGigdBGl+PA0Vo9EIH1nd7IJ8Ccc3sX1zOD0vI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HBPYvtjeYpsIg6wPvbl/PdbhDOh4YVgRGVk9ODqDqzYgR13UNF4fgOPFxwOjvS/QxLtySi8Zo0XJxnSjCwJkotlthJdMMx3chzCxJKZrJCrOcdwgV6482e4WmB49KS5U+s2FY3gzfNadH1QUuORBUlu7Aq27NVV5/u7JexTRzZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WoACvk5s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WoACvk5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736578331; x=1768114331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sgVMhYGigdBGl+PA0Vo9EIH1nd7IJ8Ccc3sX1zOD0vI=;
  b=WoACvk5srYDRIgBkfOKxvveYgDBtnaedVTuNiKSMgZchx8VWuBSofKnC
   TejbI4PJsWgn0X2MNkjVbBDfGj3BWFOrZRDhg6uzEPhEW7b629APmPXNe
   B6wjI3Neggdb/riy9BTwoZTuWYpQYXy0aQ8+cGkVgyPSS4//8titC7iM+
   8C4NuFYN6eaG7a0WIECUEjOiMcI30kuTiakKOwChOoG3PdkUw+4kiRLvT
   8nqLESh24+PGEhE5OAdv0TYnKIqw8EvovZ53htYx5lTbAUMzlExKgo9zR
   VCKfhM5QHRYVFDyRIEfQQJgcnRUPAUDgXqx68Bq+DxgGieUxGq9dYJaHV
   Q==;
X-CSE-ConnectionGUID: I4EqSs+URfK5OlNg5wIewg==
X-CSE-MsgGUID: 6sEU3klCQY+XAXZJYJ186g==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36160463"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="36160463"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 22:52:08 -0800
X-CSE-ConnectionGUID: 86D7tuodRoSATI1F7R3X2g==
X-CSE-MsgGUID: S56Q/dC5SbeCnndReq/D0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134836053"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2025 22:52:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWVLp-000KJZ-0U;
	Sat, 11 Jan 2025 06:52:05 +0000
Date: Sat, 11 Jan 2025 14:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kunal Rane <kunal.rane@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.co>
Subject: [xilinx-xlnx:lkp_test 286/504]
 drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:1287:23: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202501111413.mdagQbci-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kunal,

First bad commit (maybe != root cause):

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 9be08bf6f7cab1202fc1167747dd2c79b1bf1523 [286/504] v4l2: xilinx: dprx: Add HDCP2x support
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501111413.mdagQbci-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111413.mdagQbci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111413.mdagQbci-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c: In function 'xhdcp2x_rx_hdcp2x_version_enable':
>> drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:1287:23: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
    1287 |                 buf = FIELD_PREP(XHDCP2X_RX_HDMI_HDCP22VERSION_EN_MASK, 1);
         |                       ^~~~~~~~~~


vim +/FIELD_PREP +1287 drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c

7eb00f18063f8b Kunal Rane 2023-09-04  1270  
7eb00f18063f8b Kunal Rane 2023-09-04  1271  int xhdcp2x_rx_hdcp2x_version_enable(void *ref, bool enable)
7eb00f18063f8b Kunal Rane 2023-09-04  1272  {
7eb00f18063f8b Kunal Rane 2023-09-04  1273  	struct xlnx_hdcp2x_config *xhdcp2x_rx =
7eb00f18063f8b Kunal Rane 2023-09-04  1274  				 (struct xlnx_hdcp2x_config *)ref;
7eb00f18063f8b Kunal Rane 2023-09-04  1275  	int status = 0;
7eb00f18063f8b Kunal Rane 2023-09-04  1276  	u8 buf = 0;
7eb00f18063f8b Kunal Rane 2023-09-04  1277  
7eb00f18063f8b Kunal Rane 2023-09-04  1278  	if (xhdcp2x_rx->protocol != XHDCP2X_RX_HDMI)
7eb00f18063f8b Kunal Rane 2023-09-04  1279  		return -EINVAL;
7eb00f18063f8b Kunal Rane 2023-09-04  1280  
7eb00f18063f8b Kunal Rane 2023-09-04  1281  	/*
7eb00f18063f8b Kunal Rane 2023-09-04  1282  	 * Indicates the receiver is HDCP22 capable as per Sec 2.14 of
7eb00f18063f8b Kunal Rane 2023-09-04  1283  	 * HDCP to HDMI specification. Attempting to disable this register
7eb00f18063f8b Kunal Rane 2023-09-04  1284  	 * write leads to HDCP22 authentication failure.
7eb00f18063f8b Kunal Rane 2023-09-04  1285  	 */
7eb00f18063f8b Kunal Rane 2023-09-04  1286  	if (enable)
7eb00f18063f8b Kunal Rane 2023-09-04 @1287  		buf = FIELD_PREP(XHDCP2X_RX_HDMI_HDCP22VERSION_EN_MASK, 1);
7eb00f18063f8b Kunal Rane 2023-09-04  1288  
7eb00f18063f8b Kunal Rane 2023-09-04  1289  	status =
7eb00f18063f8b Kunal Rane 2023-09-04  1290  		xhdcp2x_rx->handlers.wr_handler(xhdcp2x_rx->interface_ref,
7eb00f18063f8b Kunal Rane 2023-09-04  1291  						XHDCP2X_RX_HDMI_HDCP22VERSION_REG,
7eb00f18063f8b Kunal Rane 2023-09-04  1292  						&buf,
7eb00f18063f8b Kunal Rane 2023-09-04  1293  						1);
7eb00f18063f8b Kunal Rane 2023-09-04  1294  	if (status < 0)
7eb00f18063f8b Kunal Rane 2023-09-04  1295  		return -EINVAL;
7eb00f18063f8b Kunal Rane 2023-09-04  1296  
7eb00f18063f8b Kunal Rane 2023-09-04  1297  	return status;
7eb00f18063f8b Kunal Rane 2023-09-04  1298  }
7eb00f18063f8b Kunal Rane 2023-09-04  1299  EXPORT_SYMBOL_GPL(xhdcp2x_rx_hdcp2x_version_enable);
7eb00f18063f8b Kunal Rane 2023-09-04  1300  

:::::: The code at line 1287 was first introduced by commit
:::::: 7eb00f18063f8b5d42ed11e57a81443c632dfe3e v4l2: xilinx: Add HDCP2x Rx support

:::::: TO: Kunal Rane <kunal.rane@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
