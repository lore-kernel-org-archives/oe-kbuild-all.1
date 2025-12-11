Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80DE30FF23
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 12:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765456744; cv=none; b=azImi/wBIy+guyyBvPGIAB62CokXPWtQWrwObS+G96ReKw2yUUODuEOx2hCvzoS7UDoe9aXAaE+V/cAnj66lpRAEzxSCw0qyVu4lXvg6MtWAgL4+P5MMrKvLhcAotkFPmIcgryqXJjfdcd3oAVCWof4/0Z6cPSxaQNvtXwIX6Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765456744; c=relaxed/simple;
	bh=KKItYuP2mPpFJgfpWCnl1GGzqvM/lLb3A0U5vZ8l8Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UgqLzcjIrla+K+n3gFX7xusFcPLbJxmE7vxhZxXz87nBrKRZ1FWjcetI9xvC2avVPNIj6U4b+Id+sfCppJd/FvQpfVc5fTS2lVGyXNvdtf2mly9n3E0Kl7HuQ/rQ9iAxvBkKLuCG6MCR7fy/xH7cPxtAYiEuJ8TgpBE1F4AJ2ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsTzQOLL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsTzQOLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765456743; x=1796992743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KKItYuP2mPpFJgfpWCnl1GGzqvM/lLb3A0U5vZ8l8Ic=;
  b=KsTzQOLLDnNsLV7LYUCq7jmaBdKKcFcDBkb1r9rkyOkxs38H/fmUdQ2B
   VMZPM3jnLn8tzD/HUA8t3MMwhMOgleuU3LQJbG3qOONpOd7N5hcNjWh2Q
   wKbGKyHV8r/06CFnwLPGNU0bewbu2PQvn4ZAGOwf+Iz30vZRY7ycBqFtX
   4JdvnudZOqjEsdul2nt1Bls+GZs8W3XaGg77bbOplYWe9LPKHXY4cfjWw
   a1+/BxGYWrghcoWVI2b7uAbFn6Ou1ZvNzaw0wjdQ+OJM35JUidJjWkGoO
   +dsrb86PDtzkYzdQ5Qwl1UMUc6EHhhzEv2wXWui6vquoVIJ9d0Ls4ouZC
   g==;
X-CSE-ConnectionGUID: xb8BD4rXRP6gRRTbUG7C0g==
X-CSE-MsgGUID: tKOCxVqaTp2b+cgZ5/IbFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="90083706"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="90083706"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 04:39:02 -0800
X-CSE-ConnectionGUID: nstSZjplR0yf0siOS48C9A==
X-CSE-MsgGUID: E+zUz4PWSW2bSWlZgq6O3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="196842851"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Dec 2025 04:39:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTfwg-000000004eF-0ICT;
	Thu, 11 Dec 2025 12:38:58 +0000
Date: Thu, 11 Dec 2025 20:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508]
 drivers/ub/urma/ubagg/ubagg_ioctl.c:70:6: sparse: sparse: symbol
 'ubagg_dev_ref_get' was not declared. Should it be static?
Message-ID: <202512112010.YtfZjYX3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 1fe6d02bf7ba2fb5c30d3c4bed50f127243f7128 [3508/3508] urma: add ubagg ioctl interface and topology management
config: arm64-randconfig-r112-20251210 (https://download.01.org/0day-ci/archive/20251211/202512112010.YtfZjYX3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112010.YtfZjYX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112010.YtfZjYX3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:70:6: sparse: sparse: symbol 'ubagg_dev_ref_get' was not declared. Should it be static?
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:75:6: sparse: sparse: symbol 'ubagg_dev_ref_put' was not declared. Should it be static?
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:446:5: sparse: sparse: symbol 'ubagg_user_ctl' was not declared. Should it be static?
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:483:5: sparse: sparse: symbol 'ubagg_config_device' was not declared. Should it be static?
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:514:19: sparse: sparse: symbol 'ubagg_create_jfc' was not declared. Should it be static?
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:550:5: sparse: sparse: symbol 'ubagg_destroy_jfc' was not declared. Should it be static?
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:568:19: sparse: sparse: symbol 'ubagg_create_jfs' was not declared. Should it be static?
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:609:5: sparse: sparse: symbol 'ubagg_destroy_jfs' was not declared. Should it be static?
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:626:19: sparse: sparse: symbol 'ubagg_create_jfr' was not declared. Should it be static?
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:718:5: sparse: sparse: symbol 'ubagg_destroy_jfr' was not declared. Should it be static?
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:737:21: sparse: sparse: symbol 'ubagg_create_jetty' was not declared. Should it be static?
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:829:5: sparse: sparse: symbol 'ubagg_destroy_jetty' was not declared. Should it be static?
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:849:5: sparse: sparse: symbol 'ubagg_query_device_status' was not declared. Should it be static?
>> drivers/ub/urma/ubagg/ubagg_ioctl.c:1831:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/ub/urma/ubagg/ubagg_ioctl.c:1831:37: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubagg/ubagg_ioctl.c:1831:37: sparse:     got void *
   drivers/ub/urma/ubagg/ubagg_ioctl.c:1562:13: sparse: sparse: context imbalance in 'rmv_dev_from_list' - wrong count at exit

vim +/ubagg_dev_ref_get +70 drivers/ub/urma/ubagg/ubagg_ioctl.c

    69	
  > 70	void ubagg_dev_ref_get(struct ubagg_device *dev)
    71	{
    72		kref_get(&dev->ref);
    73	}
    74	
  > 75	void ubagg_dev_ref_put(struct ubagg_device *dev)
    76	{
    77		kref_put(&dev->ref, ubagg_dev_release);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
