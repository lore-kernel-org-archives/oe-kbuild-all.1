Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C92413CFBD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728031336; cv=none; b=B1tcFYN3Xr6sWzKkY+u+FWzTGEA7MvI4j8qB8QwqwHFo/NaJw3xntw2+4+EVZARpOImdpEphVNA8Wpj6Inoi5PGpYqGbSrg1pfDq2iRmAwVbzzsyO6BTxTuYfGPW/rEJ90B79fP6DiQ4wt55FrfiTfqgT3BPRLtbfz0rk+Dl/es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728031336; c=relaxed/simple;
	bh=cAS6OVMLl7ZYp/ahSWcbhOYMnxZCteeVgeCs1V11YoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bs6BPDtvCZuwhB77tN2qoGDtK5dPG9aLMVT3G5vpXrDtjX6ie5yH4HeNT55unZisKWm0H6qFgcc7HVxyoMsKyC6gjh81F6Jtk/bJtNsUAz3vwdnozYfwJeSiksEqr7ijP2Ca9K6gTWlHuko1I/QC/5kSlv+ixkYQAP5lFmsTH5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUC5Do1E; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUC5Do1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728031334; x=1759567334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cAS6OVMLl7ZYp/ahSWcbhOYMnxZCteeVgeCs1V11YoA=;
  b=JUC5Do1EEgKkoyEpBxLYrRCUmdRr1BQ27D7c+DnDFnJ1f7j/G0ogONHy
   ewFnZ7+YngWRl+1ppfLDN4EvBE51f/lw8E4x0IJzotGCZhc7hJAmBSrbj
   EJhmSS78EGh1MatbfURlRKd4QrPBuUsV78ecQPBaIDZYxxDW0RpErYLzV
   kiIuuSLbUN43tF389lo3IAD175dOz4NQVGARB0KoXidtvRz+HMWwqfw/z
   /Sy/DrlrJD4oayC1ufcuyfQHu+yH75n8KHviWLjuvy15L37oiBaSx+Tl7
   Z31zPB4it9Fzvv/GZB5hBaUsuCjeWZ4OP+Ad8zej5KETSgB7c77YDQ2zo
   Q==;
X-CSE-ConnectionGUID: SVdpMhKzSlSpdXHC571U5Q==
X-CSE-MsgGUID: zQlxUOqsTVeYKHhw+k8pmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37813232"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37813232"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 01:42:13 -0700
X-CSE-ConnectionGUID: zQyOMgu8R2SDFEvQ3ZoYcA==
X-CSE-MsgGUID: XgxwP0HtRyKwUnqcCoP6eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79198691"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Oct 2024 01:42:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swdt1-0001OI-2S;
	Fri, 04 Oct 2024 08:42:07 +0000
Date: Fri, 4 Oct 2024 16:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2192/2444]
 drivers/char/ipmi/bt_bmc_phytium.c:87:35: warning: 'bt_regmap_cfg' defined
 but not used
Message-ID: <202410041655.bdYlpWRg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   aabcc6dc6d7f9e12baf1f117341469c84afd545d
commit: 02235ffc6987c06265fff43eeda5e486583ef1de [2192/2444] Add Phytium BT BMC driver support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241004/202410041655.bdYlpWRg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041655.bdYlpWRg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041655.bdYlpWRg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/ipmi/bt_bmc_phytium.c:87:35: warning: 'bt_regmap_cfg' defined but not used [-Wunused-const-variable=]
      87 | static const struct regmap_config bt_regmap_cfg = {
         |                                   ^~~~~~~~~~~~~


vim +/bt_regmap_cfg +87 drivers/char/ipmi/bt_bmc_phytium.c

    86	
  > 87	static const struct regmap_config bt_regmap_cfg = {
    88		.reg_bits = 32,
    89		.val_bits = 32,
    90		.reg_stride = 4,
    91	};
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
