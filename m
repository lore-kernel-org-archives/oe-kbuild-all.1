Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D8922C352
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738753411; cv=none; b=flz3ZO/j7Yk/WBJb5Kti76uuseuCHr0vrRkkR3avCtdHwT5iwo2dJ8p05EYidmaMeeN4coho+YpG7dVQkgN5KTHBWNFGPjCb5lnBP5v12b+h2lD1Ahi6TGdLhkixrBIsJWI9Y2lk3+tbLHm7soA7M2x07eSRpDpv7jAscC0zNAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738753411; c=relaxed/simple;
	bh=leaiF/so6b5z6/VHjvldFgLODzFtYNlRv7jeWdjHIQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XuB2VoB6R94pTLCcVNFFM8VGTWr0l9dqCSz5YE/R2HsSRRB5ShPf1L7+gXdskkI23UBeVLx3Ud+8k1qucM9LvsXuA3JOithH5WHVWfV5dBNm/fEsVrUGTpyWZ1eyjjokuybrNlROG3ThscypWFAVXUIzdcjDIyn8VbvysT29J6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBPdNsyd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBPdNsyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738753410; x=1770289410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=leaiF/so6b5z6/VHjvldFgLODzFtYNlRv7jeWdjHIQ0=;
  b=YBPdNsydCcqSqk0jtkSg7ITMfLyIIJ6AYv5PfKB4V9pAGMQKzdBz2ohw
   ql2GyeWcKyV4ZWq2wWI8sxNc9G3jlBVPRqM8IeN8xAvrleRJM0Uy045XI
   knt0qwZEiren2RaTlUvjCv+rxZiQ4DJDEAR3PLX0gstIiqRgu/ZQZb8Lk
   14R+HKrJWFjj1nCiDgJHYX5dHBL+je35rnRdxkM6kH1Fq4IFAVBTcsbuw
   icmIQRJx9LpE/iACsXDRHE5N2QVvKg1WHY9HCPsSXEK9e0o6T2gkGz8+I
   dlOcyRnbGlSyp+u3jaKNpc8MMOY2lO70A5/V2z4ShXIV0FSGv2wouPHnW
   g==;
X-CSE-ConnectionGUID: MwEICHfySVqgTlI0J0O2VQ==
X-CSE-MsgGUID: X20V//r+TSWWmVSVL5P9CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50733229"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50733229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 03:03:27 -0800
X-CSE-ConnectionGUID: DwSOsnJ4Q9CMLVYFJkqsPQ==
X-CSE-MsgGUID: aMWpFRy1SUu2/pEPkGaRqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114941021"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Feb 2025 03:03:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfdBj-000tnp-0v;
	Wed, 05 Feb 2025 11:03:23 +0000
Date: Wed, 5 Feb 2025 19:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 303/504] drivers/fpga/fpga-mgr.c:911:undefined
 reference to `dma_buf_get'
Message-ID: <202502051801.Bh2O0V87-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   4bb3217d050fc4871623ae6035fa7b73d33d90ad
commit: d236213bdfc45e8d0eb37c483f74339eae9bb69e [303/504] fpga: support loading from a pre-allocated buffer
config: arm-socfpga_defconfig (https://download.01.org/0day-ci/archive/20250205/202502051801.Bh2O0V87-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051801.Bh2O0V87-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051801.Bh2O0V87-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/fpga/fpga-mgr.o: in function `fpga_dmabuf_fd_get':
>> drivers/fpga/fpga-mgr.c:911:(.text+0x834): undefined reference to `dma_buf_get'
   arm-linux-gnueabi-ld: drivers/fpga/fpga-mgr.o: in function `fpga_dmabuf_load':
>> drivers/fpga/fpga-mgr.c:536:(.text+0x1284): undefined reference to `dma_buf_attach'
>> arm-linux-gnueabi-ld: drivers/fpga/fpga-mgr.c:543:(.text+0x1298): undefined reference to `dma_buf_map_attachment'
>> arm-linux-gnueabi-ld: drivers/fpga/fpga-mgr.c:551:(.text+0x12cc): undefined reference to `dma_buf_unmap_attachment'
>> arm-linux-gnueabi-ld: drivers/fpga/fpga-mgr.c:554:(.text+0x12d8): undefined reference to `dma_buf_detach'
>> arm-linux-gnueabi-ld: drivers/fpga/fpga-mgr.c:556:(.text+0x12e0): undefined reference to `dma_buf_put'


vim +911 drivers/fpga/fpga-mgr.c

   902	
   903	static int fpga_dmabuf_fd_get(struct file *file, char __user *argp)
   904	{
   905		struct fpga_manager *mgr =  (struct fpga_manager *)(file->private_data);
   906		int buffd;
   907	
   908		if (copy_from_user(&buffd, argp, sizeof(buffd)))
   909			return -EFAULT;
   910	
 > 911		mgr->dmabuf = dma_buf_get(buffd);
   912		if (IS_ERR_OR_NULL(mgr->dmabuf))
   913			return -EINVAL;
   914	
   915		mgr->flags = FPGA_MGR_CONFIG_DMA_BUF;
   916	
   917		return 0;
   918	}
   919	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
