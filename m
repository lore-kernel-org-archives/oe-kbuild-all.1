Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B51D33C8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 00:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726187912; cv=none; b=JiIb6/wxUwVkfhpIL08vD5F3Q9aibkRj6RWPW5H+1pqPcHRWV/UU8MNY9UWTR2/1t8gTdP84PJ1qYvtOFRcLeVAGDaRomy6AlK28Jf3oUBlPFLiJAkT3VOZZugEqLW/4Iw6hGOI/HOim9VYVdXzuMvJ0WbfASdR7wrpS5+ABVtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726187912; c=relaxed/simple;
	bh=rGOemtYchyU3F0Z1khILi29NfuBLVZXhy2lfdn8ObN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iS64UKgGFWouZR0wpPi1MY8KQfbvKBIntcLXlyjbEQNSBRXlYji2b9FUo7kpHKl3ZVIVRHYbPKzyznGYQj/I/Py3xWIvgwZUWla1CjmDmlLL9aBEEGPrfJg+FY5Vgbt7xL60Ww/Ugq00xSSBUbsqHCLVGFGpOwdYO9baxSVM+lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIrEfCXN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIrEfCXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726187910; x=1757723910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rGOemtYchyU3F0Z1khILi29NfuBLVZXhy2lfdn8ObN0=;
  b=jIrEfCXNLbYTCaG2EWO9U0oQXM4u1eTriWafb+rpaanx3/hrpd910HV9
   1/Ryc1+fM31XH6l15VEjPcE/ap2zm3H2qjY413Ie+Lv4neu/dDRxu9L0y
   900Rn245tgXvgIC6qnJIzapFoQMIJWf6x6F0aUx2ESSiPah5p6qYq7Ryf
   C5dchKiIfMyXn4F+nDc97iY+gn7Br1BfBfLap7EH/FaO8pkHwJWBguZi/
   2zEQCDgv06kklsnpl2XGhdomFh4q564JU5zPNywzka7avg2BAm2OZW2UZ
   JYo+FvsgdyZzAktQ3K5Ngtf8YfZiN+iB++AkAzNn0Hz/j4lbLkMSbg/tZ
   Q==;
X-CSE-ConnectionGUID: TkUSf0CnRWmVzWgUoJLd2Q==
X-CSE-MsgGUID: AJsWbssoSbizlBTEsqeJXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25199469"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="25199469"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 17:38:29 -0700
X-CSE-ConnectionGUID: tOtV4SkdSVC+52JO7IsYjQ==
X-CSE-MsgGUID: TQLT+2vbQaWLBi69/jgerQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="91150091"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Sep 2024 17:38:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1souKP-0005rY-0T;
	Fri, 13 Sep 2024 00:38:25 +0000
Date: Fri, 13 Sep 2024 08:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chiara Meiohas <cmeiohas@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Michael Guralnik <michaelgur@nvidia.com>
Subject: [leon-rdma:rdma-next 59/80]
 drivers/infiniband/core/nldev.c:2791:2-3: Unneeded semicolon
Message-ID: <202409130849.7dtRBxCn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   f1e3ad547cf0c19a02c067031cd16c70943a1052
commit: 9a13c8cffcf6e8b5897380124f747e85ae26fb44 [59/80] RDMA/nldev: Add support for RDMA monitoring
config: m68k-randconfig-r061-20240913 (https://download.01.org/0day-ci/archive/20240913/202409130849.7dtRBxCn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130849.7dtRBxCn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/infiniband/core/nldev.c:2791:2-3: Unneeded semicolon

vim +2791 drivers/infiniband/core/nldev.c

  2763	
  2764	static void rdma_nl_notify_err_msg(struct ib_device *device, u32 port_num,
  2765					    enum rdma_nl_notify_event_type type)
  2766	{
  2767		struct net_device *netdev;
  2768	
  2769		switch (type) {
  2770		case RDMA_REGISTER_EVENT:
  2771			dev_warn_ratelimited(&device->dev,
  2772					     "Failed to send RDMA monitor register device event\n");
  2773			break;
  2774		case RDMA_UNREGISTER_EVENT:
  2775			dev_warn_ratelimited(&device->dev,
  2776					     "Failed to send RDMA monitor unregister device event\n");
  2777			break;
  2778		case RDMA_NETDEV_ATTACH_EVENT:
  2779			netdev = ib_device_get_netdev(device, port_num);
  2780			dev_warn_ratelimited(&device->dev,
  2781					     "Failed to send RDMA monitor netdev attach event: port %d netdev %d\n",
  2782					     port_num, netdev->ifindex);
  2783			dev_put(netdev);
  2784			break;
  2785		case RDMA_NETDEV_DETACH_EVENT:
  2786			dev_warn_ratelimited(&device->dev,
  2787					     "Failed to send RDMA monitor netdev detach event: port %d\n",
  2788					     port_num);
  2789		default:
  2790			break;
> 2791		};
  2792	}
  2793	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
