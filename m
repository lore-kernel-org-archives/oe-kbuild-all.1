Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED813FBAC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712918145; cv=none; b=h7yCL78wSRiby3gnMVRTjXBLtk5sGhI2xK7Pi9KLcJi0bG7bpEf0iRqG9Hq1zxh3nBGwmKDIuhMypuV8urEsHR1TFIpiFx3RrSwoYYuzdL+wHAr3ppPGT6EGQ287nLVjECmbNfY9l3beGUWrliDbZ3gYCT4Fn7fxJW60WFNDRz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712918145; c=relaxed/simple;
	bh=nY6SAb/q+RZabr5lbYUUwmPSIgnlwVYy+sAITqNdjXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RPVL+bpNjs80ngz0Q+cDCgu21UJ2gJ86Q1ckIT8x00gBe9/vmcJLuH15Jo1gI6Q3igX0o0EOI0wrX6AecNLIfg7LY/MHnCfOcHRB1jOVMxgjB1KOHyFUWq2NUW6Mqtrl6QrWHefTXNSFc4xW9R1wLqrH3AsmA1GTBJ5NiO93Fbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXFW4CaU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXFW4CaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712918143; x=1744454143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nY6SAb/q+RZabr5lbYUUwmPSIgnlwVYy+sAITqNdjXo=;
  b=JXFW4CaUWGlvohFYSIuzy+ItPJ4uHmQmrDoTEWnhdx/yk3S2ynO7ygIW
   xkmnhclh6vpNZ0NGhZx5nq2QMQNauA88Xy7sDsTzL18eViMkaYe6xWt2I
   AaDM3MOU7z8TyXHgueLGb1CcBtoGyj+E2Nf9l0JB59xk/PTqJoVLQrjrD
   sNUraRBlxFGPbSJd9IJAaUprrIeawCSR9E5RKB4M09pVqbFbE4s6ViMup
   Ru7OT+Krx7/RtF7fKu1IwkoQBE78saA1UhOVBfKKqStN8iwBx0HjmL0kR
   NeosdZAfLDPo7d29ZNTqS0rvwPBbzUcygw/Ulf+f/AO5+uEpxee8CE9fz
   g==;
X-CSE-ConnectionGUID: rVpzf7jiQYqbXIfl2ORKlg==
X-CSE-MsgGUID: AVUApS7cQeuIcNrsvUSh/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8285973"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8285973"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 03:35:43 -0700
X-CSE-ConnectionGUID: xdXjXFbGQHW6U7WaIlhLwg==
X-CSE-MsgGUID: D9gA3AOARsqsyFz1znTGwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="44459659"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Apr 2024 03:35:41 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvEFv-0009g9-1A;
	Fri, 12 Apr 2024 10:35:39 +0000
Date: Fri, 12 Apr 2024 18:35:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 427/438]
 drivers/firmware/xilinx/zynqmp-debug.c:165:21: error: implicit declaration
 of function 'iterdup_user'; did you mean 'vmemdup_user'?
Message-ID: <202404121859.gagUU746-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8e79f6c3d0a118031e843758491803e38794f6e8
commit: d57f49e14d599e3dbc6f2199fdded6bebb72ff2c [427/438] firmware: xilinx: convert to read/write iterators
config: arm64-randconfig-001-20240412 (https://download.01.org/0day-ci/archive/20240412/202404121859.gagUU746-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404121859.gagUU746-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404121859.gagUU746-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/firmware/xilinx/zynqmp-debug.c: In function 'zynqmp_pm_debugfs_api_write':
>> drivers/firmware/xilinx/zynqmp-debug.c:165:21: error: implicit declaration of function 'iterdup_user'; did you mean 'vmemdup_user'? [-Werror=implicit-function-declaration]
     165 |         kern_buff = iterdup_user(from, len);
         |                     ^~~~~~~~~~~~
         |                     vmemdup_user
>> drivers/firmware/xilinx/zynqmp-debug.c:165:19: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     165 |         kern_buff = iterdup_user(from, len);
         |                   ^
   cc1: some warnings being treated as errors


vim +165 drivers/firmware/xilinx/zynqmp-debug.c

   131	
   132	/**
   133	 * zynqmp_pm_debugfs_api_write() - debugfs write function
   134	 * @file:	User file
   135	 * @ptr:	User entered PM-API string
   136	 * @len:	Length of the userspace buffer
   137	 * @off:	Offset within the file
   138	 *
   139	 * Used for triggering pm api functions by writing
   140	 * echo <pm_api_id>	> /sys/kernel/debug/zynqmp_pm/power or
   141	 * echo <pm_api_name>	> /sys/kernel/debug/zynqmp_pm/power
   142	 *
   143	 * Return: Number of bytes copied if PM-API request succeeds,
   144	 *	   the corresponding error code otherwise
   145	 */
   146	static ssize_t zynqmp_pm_debugfs_api_write(struct kiocb *iocb,
   147						   struct iov_iter *from)
   148	{
   149		char *kern_buff, *tmp_buff;
   150		char *pm_api_req;
   151		u32 pm_id = 0;
   152		u64 pm_api_arg[4] = {0, 0, 0, 0};
   153		/* Return values from PM APIs calls */
   154		u32 pm_api_ret[4] = {0, 0, 0, 0};
   155		size_t len = iov_iter_count(from);
   156	
   157		int ret;
   158		int i = 0;
   159	
   160		strcpy(debugfs_buf, "");
   161	
   162		if (iocb->ki_pos != 0 || len <= 1 || len > PAGE_SIZE - 1)
   163			return -EINVAL;
   164	
 > 165		kern_buff = iterdup_user(from, len);
   166		if (IS_ERR(kern_buff))
   167			return PTR_ERR(kern_buff);
   168		tmp_buff = kern_buff;
   169	
   170		/* Read the API name from a user request */
   171		pm_api_req = strsep(&kern_buff, " ");
   172	
   173		ret = get_pm_api_id(pm_api_req, &pm_id);
   174		if (ret < 0)
   175			goto err;
   176	
   177		/* Read node_id and arguments from the PM-API request */
   178		pm_api_req = strsep(&kern_buff, " ");
   179		while ((i < ARRAY_SIZE(pm_api_arg)) && pm_api_req) {
   180			pm_api_arg[i++] = zynqmp_pm_argument_value(pm_api_req);
   181			pm_api_req = strsep(&kern_buff, " ");
   182		}
   183	
   184		ret = process_api_request(pm_id, pm_api_arg, pm_api_ret);
   185	
   186	err:
   187		kfree(tmp_buff);
   188		if (ret)
   189			return ret;
   190	
   191		return len;
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
