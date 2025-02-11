Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263881EDA0A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 07:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739259630; cv=none; b=oHnabYVO5oUEnhx+syLoz7h2STrLAeSXhv63yXHts7mzSYk5CUIqhITBDT+/0U37Is7MeDgvGE9OIZttYI1ERsZNmA/PD7FFkah2Q2diCqIxVIiV7ZYrdZH58xy0DitD0+RJE8Fl9ZMsjWLUv6uZr7cDlK8MxKpV88oMMTQLEp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739259630; c=relaxed/simple;
	bh=1C+fxOqxCBXm/bm0ZWBPoL0h69Bl9z62EQHnFVOcHqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YhOiDvcSptZeAngM97O82ie1rERneBpoW4zaR6dYnBx/uR9WfSJ2yXOuGrEUsYKHoi3BrXhpwvLdE8QqZiGAJJZQIiKYJF5VJt19hWJ4T0SSJNEqKDsxwRRHaFj/RTLwhaKrPnVIY1ByaD0vZcdCJmSFcCOkCZ7pBPGlhD8+DsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOwxV3Y0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOwxV3Y0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739259628; x=1770795628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1C+fxOqxCBXm/bm0ZWBPoL0h69Bl9z62EQHnFVOcHqw=;
  b=TOwxV3Y0vQMSuY5YhNbwCiiBMX3TI2Fk9fHow3mjcxZNRH2ymzp0Yote
   fu4Sryp+tgiOe5OsuEmx0KUYSeX6FkU4jdRXFKQSyf/nQIVvNZ/z6E1VB
   s7LFDHKMHuXesBSTSDk/4BM/ygCvK4JkubwJ/zLBFrul6PALcERYiNkSs
   VsOc6BA9Sh0nBK36A4rbHg8txlNPnbedW8fG30iMi8zxwN3RUjsz2tIjG
   JSTNIyR52uHyhAtdzHWEWM30DAkKSK3sMlCb4SlTEPLPJ+eaDLM1Uhdyl
   utLOu9V+7TbSjc7EEMOASdndOcK8LsRJ4UaZPhbUfRvxTzmw7x+To/pnP
   Q==;
X-CSE-ConnectionGUID: h+E7BfPgR1+WFF3mn4A+Ug==
X-CSE-MsgGUID: ZZzYBCqDSSmDQXpDoxAU5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39782767"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="39782767"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 23:40:28 -0800
X-CSE-ConnectionGUID: Fbki2W9HTpWXcYKZDYk5ig==
X-CSE-MsgGUID: qfwpQ4pSRViXI+CkpB3FkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="112403211"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2025 23:40:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thksa-0013t9-13;
	Tue, 11 Feb 2025 07:40:24 +0000
Date: Tue, 11 Feb 2025 15:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 18/26] drivers/cxl/core/features.c:58:undefined
 reference to `fwctl_unregister'
Message-ID: <202502111537.NuU3Uodp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   f1c28027be3e76704befbc3e0fdb1839b60e62dd
commit: 21969e46c91286ed183be11d5fd30cd28c7daf7b [18/26] cxl: Add FWCTL support to CXL
config: xtensa-randconfig-r064-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111537.NuU3Uodp-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111537.NuU3Uodp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111537.NuU3Uodp-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/cxl/core/features.o: in function `cxl_get_supported_features_count':
>> drivers/cxl/core/features.c:58:(.text+0x3e4): undefined reference to `fwctl_unregister'
>> xtensa-linux-ld: drivers/cxl/core/features.c:62:(.text+0x406): undefined reference to `fwctl_unregister'
   xtensa-linux-ld: drivers/cxl/core/features.o: in function `__devm_add_action_or_reset':
>> include/linux/device.h:427:(.text+0x43c): undefined reference to `_fwctl_alloc_device'
>> xtensa-linux-ld: include/linux/device.h:427:(.text+0x440): undefined reference to `fwctl_register'
   xtensa-linux-ld: include/linux/device.h:435:(.text+0x4b8): undefined reference to `_fwctl_alloc_device'
   xtensa-linux-ld: drivers/cxl/core/features.o: in function `free_memdev_fwctl':
>> include/linux/fwctl.h:114:(.text+0x4e7): undefined reference to `fwctl_register'


vim +58 drivers/cxl/core/features.c

6cef1150da7895 Dave Jiang 2024-06-24  38  
6cef1150da7895 Dave Jiang 2024-06-24  39  static int cxl_get_supported_features_count(struct cxl_mailbox *cxl_mbox)
6cef1150da7895 Dave Jiang 2024-06-24  40  {
6cef1150da7895 Dave Jiang 2024-06-24  41  	struct cxl_mbox_get_sup_feats_out mbox_out;
6cef1150da7895 Dave Jiang 2024-06-24  42  	struct cxl_mbox_get_sup_feats_in mbox_in;
6cef1150da7895 Dave Jiang 2024-06-24  43  	struct cxl_mbox_cmd mbox_cmd;
6cef1150da7895 Dave Jiang 2024-06-24  44  	int rc;
6cef1150da7895 Dave Jiang 2024-06-24  45  
6cef1150da7895 Dave Jiang 2024-06-24  46  	memset(&mbox_in, 0, sizeof(mbox_in));
6cef1150da7895 Dave Jiang 2024-06-24  47  	mbox_in.count = cpu_to_le32(sizeof(mbox_out));
6cef1150da7895 Dave Jiang 2024-06-24  48  	memset(&mbox_out, 0, sizeof(mbox_out));
6cef1150da7895 Dave Jiang 2024-06-24  49  	mbox_cmd = (struct cxl_mbox_cmd) {
6cef1150da7895 Dave Jiang 2024-06-24  50  		.opcode = CXL_MBOX_OP_GET_SUPPORTED_FEATURES,
6cef1150da7895 Dave Jiang 2024-06-24  51  		.size_in = sizeof(mbox_in),
6cef1150da7895 Dave Jiang 2024-06-24  52  		.payload_in = &mbox_in,
6cef1150da7895 Dave Jiang 2024-06-24  53  		.size_out = sizeof(mbox_out),
6cef1150da7895 Dave Jiang 2024-06-24  54  		.payload_out = &mbox_out,
6cef1150da7895 Dave Jiang 2024-06-24  55  		.min_out = sizeof(mbox_out),
6cef1150da7895 Dave Jiang 2024-06-24  56  	};
6cef1150da7895 Dave Jiang 2024-06-24  57  	rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
6cef1150da7895 Dave Jiang 2024-06-24 @58  	if (rc < 0)
6cef1150da7895 Dave Jiang 2024-06-24  59  		return rc;
6cef1150da7895 Dave Jiang 2024-06-24  60  
6cef1150da7895 Dave Jiang 2024-06-24  61  	return le16_to_cpu(mbox_out.supported_feats);
6cef1150da7895 Dave Jiang 2024-06-24 @62  }
6cef1150da7895 Dave Jiang 2024-06-24  63  

:::::: The code at line 58 was first introduced by commit
:::::: 6cef1150da7895e102e4a9e059504e38881836b8 cxl: Add Get Supported Features command for kernel usage

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Dave Jiang <dave.jiang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
