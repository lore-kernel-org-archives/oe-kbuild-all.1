Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85492652B6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 11:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765452841; cv=none; b=IT8bH1Fasgfw3Ygs7xMgCkKNB5r3IHSpJh58QLDJYtW8Q+oU5uTeyfKB8CIeiD2v4m94nTBx1UNwIGfin+1WiRPltceAp4J89mVmUsQpozg1KW4HAK1N7Gnhg1bM4Ak11FtUR9CyIO8M/KpvaSZKfXqMvkcAzDZTr7X9g/X3yE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765452841; c=relaxed/simple;
	bh=waIVsE3AZuKy6WYVFitXdjukMEsP6i1SennUpObHZOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WW3/1dQByxwSX7gEhy6Wqqipq6IGqVNr6PVchmk54lYgx6CmbLnlbq4SoYNRFlawgUb5tqr/svOYEo5maLG9+O+kOOFh0Vq6upTE1/7To7+KgoybxsTgSbnJavjWBry8BVk4k54zfyXdk4YgBCbjZ0YcAWO9y+UWbHiGcmmkEjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJLDTgVN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJLDTgVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765452840; x=1796988840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=waIVsE3AZuKy6WYVFitXdjukMEsP6i1SennUpObHZOc=;
  b=KJLDTgVNPDpgvmlSRGFRFJPGuk2OJ6/3+CzBqMXK6IEeQuIklUvO6Qor
   OS+Mg5sPE2XN7EFYz7iFYg9ZiIDRISk/ZL/iT2J1OM2KYg9cl74vkWjLN
   ZLmj7BGmjDd2rzgYdPwP2BFkUMeUw+CE0EGL4Ya27gv0AEcM5/ICsNpJh
   jWPjcc3vKjfes/WXO2ZltiP6Y6hkcDNMUCPVMoT38lXTMsGynu6GzF6ss
   X+keXq88dT2I/AGj4ILogG4ChSKTqEZv5B+PxT47GmnTRdHwOHOsc2hYS
   j4GU5Rhoa7lwoj9KTg+zZgjYbHuNHIti2lc1LlvEgDc+ejeKJa6mgncbF
   Q==;
X-CSE-ConnectionGUID: fd/mmF1GSPeTPQdeiiwABA==
X-CSE-MsgGUID: RVLraB+fQsS4INeeHbdlZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67318330"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67318330"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 03:33:59 -0800
X-CSE-ConnectionGUID: jhywaMXlQ/aTHvODiKtyQQ==
X-CSE-MsgGUID: 6pJeyGNqTju0MZJ5fy8wVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196832616"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Dec 2025 03:33:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTevj-000000004aX-1tYg;
	Thu, 11 Dec 2025 11:33:55 +0000
Date: Thu, 11 Dec 2025 19:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Lingfeng <lilingfeng3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3536/3536] kernel/power/swap.c:1573: warning:
 Excess function parameter 'exclusive' description in 'swsusp_close'
Message-ID: <202512111912.9dS3N6D9-lkp@intel.com>
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
commit: 35143f27ceecf215984b938d1fe192e0e66e41b2 [3536/3536] PM: hibernate: Drop unused snapshot_test argument
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512111912.9dS3N6D9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111912.9dS3N6D9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111912.9dS3N6D9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/power/swap.c:544: warning: Function parameter or member 'handle' not described in 'save_image'
   kernel/power/swap.c:544: warning: Function parameter or member 'snapshot' not described in 'save_image'
   kernel/power/swap.c:544: warning: Function parameter or member 'nr_to_write' not described in 'save_image'
   kernel/power/swap.c:891: warning: Function parameter or member 'nr_pages' not described in 'enough_swap'
   kernel/power/swap.c:1062: warning: Function parameter or member 'handle' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or member 'snapshot' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or member 'nr_to_read' not described in 'load_image'
>> kernel/power/swap.c:1573: warning: Excess function parameter 'exclusive' description in 'swsusp_close'


vim +1573 kernel/power/swap.c

61159a314bca64 Rafael J. Wysocki 2006-03-23  1566  
61159a314bca64 Rafael J. Wysocki 2006-03-23  1567  /**
61159a314bca64 Rafael J. Wysocki 2006-03-23  1568   * swsusp_close - close swap device.
40d84e198b0ae6 Chen Yu           2023-09-06  1569   * @exclusive: Close the resume device which is exclusively opened.
61159a314bca64 Rafael J. Wysocki 2006-03-23  1570   */
61159a314bca64 Rafael J. Wysocki 2006-03-23  1571  
35143f27ceecf2 Jan Kara          2023-11-30  1572  void swsusp_close(void)
61159a314bca64 Rafael J. Wysocki 2006-03-23 @1573  {
7f17d15e3e01ac Jan Kara          2023-11-30  1574  	if (IS_ERR(hib_resume_bdev_handle)) {
64ec72a1ece37d Joe Perches       2017-09-27  1575  		pr_debug("Image device not initialised\n");
61159a314bca64 Rafael J. Wysocki 2006-03-23  1576  		return;
61159a314bca64 Rafael J. Wysocki 2006-03-23  1577  	}
61159a314bca64 Rafael J. Wysocki 2006-03-23  1578  
7f17d15e3e01ac Jan Kara          2023-11-30  1579  	bdev_release(hib_resume_bdev_handle);
61159a314bca64 Rafael J. Wysocki 2006-03-23  1580  }
1b29c1643c0d82 Vivek Goyal       2007-05-02  1581  

:::::: The code at line 1573 was first introduced by commit
:::::: 61159a314bca6408320c3173c1282c64f5cdaa76 [PATCH] swsusp: separate swap-writing/reading code

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
