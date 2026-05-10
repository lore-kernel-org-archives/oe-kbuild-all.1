Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F5F4502A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 04:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387681; cv=none; b=X2h53yH4/gEKM3hQXt3zvsSaNuZLnP5ubI9VkmYVg0997VCnlSnrDDfxKsdPIULFAGNGfYqw7A/fzZj6xy6qs3t+T47dehWpv9mV/2wsBcG4fG2o0WDGUutmyIUw743ltyLyC4OJm0GWPrRURM1A10GORjzsQjT670EHatN+jT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387681; c=relaxed/simple;
	bh=jxXqABV6lXWAu2LgwW96i/+UvbJlYnQaiJhD3Cn+AgM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B1h9zFEmShy2zE9xTr9S3nbbmjIxPsGQpy6sR4H72205/BF5HAArswk7mvgMj1vG86La8EWMayvpcyBJPZxjpyajgnE+ymYjYn418UujoV/DwFPAtgkSfU8m92l+jlC9NdodemK2MXWbfXMB2/JXD/DHtduwHCuc2kLvm7a+V34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQjKcuzf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQjKcuzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778387680; x=1809923680;
  h=date:from:to:cc:subject:message-id;
  bh=jxXqABV6lXWAu2LgwW96i/+UvbJlYnQaiJhD3Cn+AgM=;
  b=kQjKcuzfudWXUU5B8pmStXGbApHBQJbSudREcLoLLN8F64I6Dc5yRpeD
   vs4VvcEay+OX6RdxxtReJ68iPC04Yvsr28b+h52nwGJXk+q1JetVLGt/V
   P255Phvk7wvOMb5FqVtwE2AmhuFdBy18EQMk0y8zGE9LnJoVq30c+vaVb
   QDH5LY858MRG/Ps+VOKHA3/RRw0rw+2Uw6ZHHV8G7w3znKOkEgVu0eKZ3
   p5KlT6vShF2hVziu95x3aHL//KKuiN7YZCGngMCVAeqdEAuoThRLkFPMx
   N9tIghkMyN5s1DUnmtATuuQY1nSpBKT9dg0C8+sPIZIGJohmz/8iRukdQ
   Q==;
X-CSE-ConnectionGUID: ZiJ/rsrqQiW9EjxybzODAg==
X-CSE-MsgGUID: IcZQIBAYT8eMtmtkUjTT7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="96879456"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="96879456"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 21:34:38 -0700
X-CSE-ConnectionGUID: PZKtFAhvRgWT5i0gFJwd9Q==
X-CSE-MsgGUID: eKoXEf1iS7WhFzzpUoUGyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="260600177"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 09 May 2026 21:34:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLvsA-000000007dd-3dCH;
	Sun, 10 May 2026 04:34:34 +0000
Date: Sun, 10 May 2026 06:33:47 +0200
From: kernel test robot <lkp@intel.com>
To: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/net/netdevsim/bus.c:192:17: error: implicit
 declaration of function 'nsim_bus_dev_del'; did you mean 'nsim_bus_dev_new'?
Message-ID: <202605100648.HM7DHKhd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jiakai-Xu/netdevsim-Fix-task-hung-by-releasing-bus-lock-before-device-ops/20260510-070550
head:   93a12a4523b770bda0f952a4d3a44cbee0775bb4
commit: 93a12a4523b770bda0f952a4d3a44cbee0775bb4 netdevsim: Fix task hung by releasing bus lock before device ops
date:   5 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260510/202605100648.HM7DHKhd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100648.HM7DHKhd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100648.HM7DHKhd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/netdevsim/bus.c: In function 'new_device_store':
>> drivers/net/netdevsim/bus.c:192:17: error: implicit declaration of function 'nsim_bus_dev_del'; did you mean 'nsim_bus_dev_new'? [-Wimplicit-function-declaration]
     192 |                 nsim_bus_dev_del(nsim_bus_dev);
         |                 ^~~~~~~~~~~~~~~~
         |                 nsim_bus_dev_new
   drivers/net/netdevsim/bus.c: At top level:
>> drivers/net/netdevsim/bus.c:206:13: warning: conflicting types for 'nsim_bus_dev_del'; have 'void(struct nsim_bus_dev *)'
     206 | static void nsim_bus_dev_del(struct nsim_bus_dev *nsim_bus_dev);
         |             ^~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/bus.c:206:13: error: static declaration of 'nsim_bus_dev_del' follows non-static declaration
   drivers/net/netdevsim/bus.c:192:17: note: previous implicit declaration of 'nsim_bus_dev_del' with type 'void(struct nsim_bus_dev *)'
     192 |                 nsim_bus_dev_del(nsim_bus_dev);
         |                 ^~~~~~~~~~~~~~~~


vim +192 drivers/net/netdevsim/bus.c

   157	
   158	static ssize_t
   159	new_device_store(const struct bus_type *bus, const char *buf, size_t count)
   160	{
   161		unsigned int id, port_count, num_queues;
   162		struct nsim_bus_dev *nsim_bus_dev;
   163		int err;
   164	
   165		err = sscanf(buf, "%u %u %u", &id, &port_count, &num_queues);
   166		switch (err) {
   167		case 1:
   168			port_count = 1;
   169			fallthrough;
   170		case 2:
   171			num_queues = 1;
   172			fallthrough;
   173		case 3:
   174			if (id > INT_MAX) {
   175				pr_err("Value of \"id\" is too big.\n");
   176				return -EINVAL;
   177			}
   178			break;
   179		default:
   180			pr_err("Format for adding new device is \"id port_count num_queues\" (uint uint uint).\n");
   181			return -EINVAL;
   182		}
   183	
   184		nsim_bus_dev = nsim_bus_dev_new(id, port_count, num_queues);
   185		if (IS_ERR(nsim_bus_dev))
   186			return PTR_ERR(nsim_bus_dev);
   187	
   188		mutex_lock(&nsim_bus_dev_list_lock);
   189		/* Prevent to use resource before initialization. */
   190		if (!smp_load_acquire(&nsim_bus_enable)) {
   191			mutex_unlock(&nsim_bus_dev_list_lock);
 > 192			nsim_bus_dev_del(nsim_bus_dev);
   193			return -EBUSY;
   194		}
   195	
   196		/* Allow using nsim_bus_dev */
   197		smp_store_release(&nsim_bus_dev->init, true);
   198	
   199		list_add_tail(&nsim_bus_dev->list, &nsim_bus_dev_list);
   200		mutex_unlock(&nsim_bus_dev_list_lock);
   201	
   202		return count;
   203	}
   204	static BUS_ATTR_WO(new_device);
   205	
 > 206	static void nsim_bus_dev_del(struct nsim_bus_dev *nsim_bus_dev);
   207	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
