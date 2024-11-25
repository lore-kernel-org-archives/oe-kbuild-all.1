Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD341C1AA9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732564809; cv=none; b=F9MP/wAtIix9vvcTvlSgvoCE29mBBKYqwxydsppxU7kQxdxAcFP4jHBPBrVEXtjfSU18LCBGt3yGpPmPcucgb6ulYlbs68z63vxnBVAZO0xxt45G2JlO13hYCzfRu39rtXgYTzQobwugdaXnYADuFPNUTwLlybK6dSTXVAWyTvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732564809; c=relaxed/simple;
	bh=CMBf9p4oT+FQLzXaZGVQAdEwUdmvAjcXvUqwZZsMyNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pcor1ULHgqLKJ0SnDXlQp555031EeVfZ1+dv1kCLPKSNG9aOqXmf86YRdfwEn+sD2kLAZorQgSpdA/j8U6rPMMsZfwiracTMXpGNp+13G4qwdNQ6h9YRptUHJKBnQ+e62QRYyKIqkayXnqiuAArXu3ElecOI8T7E8DlC4KfkxC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/alWqb7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/alWqb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732564808; x=1764100808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CMBf9p4oT+FQLzXaZGVQAdEwUdmvAjcXvUqwZZsMyNk=;
  b=h/alWqb7tHUF0WWqwKw5WSvumKnEdNNVKFc9W3edTSTMMPfC8I2/Rq79
   YNUr2kTHo7QyO9TROcgVeZjebDuuBqR0QeGG5vkxLUp9f3PpBVCCYBDUm
   r6zJT5ZLuE8Pv04j9cf5wuXtfwjANXclJc+kk9nXg4fUFGIw9NZAqpFIT
   fF5sHei316yNd4xAPrImZYyo60fxk2BJL3rrPHr0EeVCKyX02H4AJbFHP
   0T633UoNc1D8JLsdEUlc4J3vM+ZJGhjrt8wrgj1dLNKywfOowWNR3ReXn
   QvJdcIvHtk+8BGYTj8UNTdESdQZtUp5emYxhcAmmXHOvCZG2CARXjcUIZ
   w==;
X-CSE-ConnectionGUID: ofHsFAjJS7+90MAxlDVCsQ==
X-CSE-MsgGUID: parwAV4ER1uDoI3bFd2JYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50103466"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="50103466"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 12:00:07 -0800
X-CSE-ConnectionGUID: OYICEYlCTlCNZF+3Sxo23g==
X-CSE-MsgGUID: ZM/VbkDESmGFlOJKmuExDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="91002000"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2024 12:00:05 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFfFb-0006ko-2Z;
	Mon, 25 Nov 2024 20:00:03 +0000
Date: Tue, 26 Nov 2024 03:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2415/2415] kernel/watchdog_hld.c:502:12: sparse:
 sparse: symbol '__hardlockup_detector_perf_init' was not declared. Should it
 be static?
Message-ID: <202411260320.yKIJ0n9e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5d73ae1b79c0e467e87e2f0494211ff38732900d
commit: 364de98eacea8dbfe4f926f62085aebf8534f403 [2415/2415] watchdog: Fix sleeping function called from atomic context
config: x86_64-randconfig-121-20241111 (https://download.01.org/0day-ci/archive/20241126/202411260320.yKIJ0n9e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260320.yKIJ0n9e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260320.yKIJ0n9e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/watchdog_hld.c:502:12: sparse: sparse: symbol '__hardlockup_detector_perf_init' was not declared. Should it be static?

vim +/__hardlockup_detector_perf_init +502 kernel/watchdog_hld.c

   501	
 > 502	int __init __hardlockup_detector_perf_init(void *not_used)
   503	{
   504		int ret = hardlockup_detector_event_create();
   505	
   506		if (ret) {
   507			pr_info("Perf NMI watchdog permanently disabled\n");
   508		} else {
   509			perf_event_release_kernel(this_cpu_read(watchdog_ev));
   510			this_cpu_write(watchdog_ev, NULL);
   511		}
   512		return ret;
   513	}
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
