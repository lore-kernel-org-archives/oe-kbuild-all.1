Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D310E0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 00:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735949316; cv=none; b=bQHwQbXWX5igObL50BYjZaYUrAhcYtwshZLNrCcsD1KD3wPz5c60sBu4cMF/e6uxbBmKU3ocPc+M3ZkNDWPMZbLYzWtQReLzUdDKX886B21qKWxf3S5eaXqVxV7HuEsSrXPOYL/feCNo5RWrzNWGF6v/4oLufN2rPvq1B3WKxbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735949316; c=relaxed/simple;
	bh=FrVNX1QeTZjIEKD2PPfrjBfFpX0+mx4R6AsX7ob9Lmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uj0rLq2FBX2fqtwVMnWrIa3qZfUC06ogZHFvJeNEypI3t3gbSLSMHr6ARWjmoNnlBtwnni8MhRaoAnC9nAY2AZJ/P4LFgTSN3QR+XbKG/syS/ZNET6grz97sf+y7iBbwOo4TO94g5XxUYyfRHpL+sAztGYr1DPRB0WoTyosj4wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kir6UwTi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kir6UwTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735949314; x=1767485314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FrVNX1QeTZjIEKD2PPfrjBfFpX0+mx4R6AsX7ob9Lmo=;
  b=Kir6UwTizBxgM+iwZWBLzne7xFE5RvybOTksrbTeFXj9+VqGfCKI5NIG
   6zMSsGmng3GeOjBSJih724dtP3U8SZGEBERO0OL8LDxgvYcy6aKb0Zp11
   tQLFiUINjYBoN3Y1aaE/XcUnNQL+67j9as80j2Y5XA/EdNREWoEymjD/U
   TALnPRTsO99SO/Ve/rfOF+9CfFnNGHPj8OWZ+J2+y+4IJUY+LTdPKgdwd
   iPaYVnlGympSwuWpETIwn/MiPpy3VMGxj7FPzxmxBxj2qm0/RSC1n02Y5
   UKLWfaD5FamcJ/kVYhE+9HT518f7ff57dvBwne0qRGeXPusmXndt2m8kj
   w==;
X-CSE-ConnectionGUID: dlys/jnTSGy6LDp22WGhmg==
X-CSE-MsgGUID: DXk5SgQvSnSDN69sxeeoyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36353770"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="36353770"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 16:08:34 -0800
X-CSE-ConnectionGUID: c3CMCHB2QcSiw7xeqmYjQQ==
X-CSE-MsgGUID: QAfuyK/yS5+SktNloBsSGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101774225"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Jan 2025 16:08:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTriQ-000ATB-2J;
	Sat, 04 Jan 2025 00:08:30 +0000
Date: Sat, 4 Jan 2025 08:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2597/2597] kernel/watchdog_hld.c:502:12: sparse:
 sparse: symbol '__hardlockup_detector_perf_init' was not declared. Should it
 be static?
Message-ID: <202501040718.qdbBTetA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   d51fb86ce6a3a3e59d7cba58738b63903b8cb37c
commit: 364de98eacea8dbfe4f926f62085aebf8534f403 [2597/2597] watchdog: Fix sleeping function called from atomic context
config: x86_64-randconfig-123-20241225 (https://download.01.org/0day-ci/archive/20250104/202501040718.qdbBTetA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040718.qdbBTetA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040718.qdbBTetA-lkp@intel.com/

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
