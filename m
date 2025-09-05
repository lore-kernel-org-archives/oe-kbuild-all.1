Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23452345753
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757072592; cv=none; b=VmLKRlyjrn+e220jbj/zLH13p3ezqlZfIS74yNuLxgyKGiysAq7oed4gzYylUbaitr4B8pfQGw0PwV6/1k97gSdgwHoYyTMmIvEPF1cBhYdsBwEywpwoLHJZ23cD4CNvLoJR/M5S1TLFejbTpIk96BsieTFhu7IcMP6CnPIONG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757072592; c=relaxed/simple;
	bh=eC7oqYluVp1hsdmkDmsX1W5POE8hg1amtAYIRd1GUjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UonopC8e9+ixwyzicDrFZgANAbPpaGIMrnONf22jSI1d88/yPic4D4YE+IsWuDcBj2III3vQIdY2fpKV2wfzUZno7LWbN9YUq8FUq9CGe6+mZOdvco6fun+R3qjhJ5uXONM7wbag4r65sjIFI0Z+khSUilvSEonLx0VaIofRmhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TR8ATNol; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TR8ATNol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757072590; x=1788608590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eC7oqYluVp1hsdmkDmsX1W5POE8hg1amtAYIRd1GUjU=;
  b=TR8ATNolv+O84ts6WJvv3knMRJByK+aiiAvNW4N/GhS5qo8maoKwY7kW
   ii1mBbhEWIZdd5rY5ZXDKF5OTRXssHVWaalmQtG+Hnun+pGK3DEZx0m+i
   FUOOfo8ByIRzMQaTaCH/7hGsn2DH5uCich0t+1CwTbS6JFZDm5sGhMFc1
   SqTnBOxpe/x/alsBM3QCWxtHbiT9gOqy0HKKJjA+y69TtAvp15V5Lm/3D
   +wyoyRpSf9MV4g3vwSf7i4JDk6fs38cHyiH2tkTsQ+qAicm3B1R3J+nER
   BG1TJhzD7SVGkaA+gxXiePLQmA9ZWIyfCyl0rvStdDHyBuMn5xwamC1yr
   Q==;
X-CSE-ConnectionGUID: dM7JM0wFTiS9pUBhuIbTAg==
X-CSE-MsgGUID: JzGoW/S9QWu6V+nVY1Twnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59343247"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59343247"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 04:43:10 -0700
X-CSE-ConnectionGUID: yTFzJ8aIT3+pX+5EQBbiNw==
X-CSE-MsgGUID: CRUqrZIoQaGQsBBoBRk2Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="176486060"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Sep 2025 04:43:09 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuUqQ-0000NN-2a;
	Fri, 05 Sep 2025 11:43:06 +0000
Date: Fri, 5 Sep 2025 19:43:02 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:aer_reset_v1 16/16] drivers/usb/host/ehci-pci.c:359:34:
 warning: unused variable 'ehci'
Message-ID: <202509051921.JLsXjwJQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux aer_reset_v1
head:   76e612016586489e46c4afcf0bd8fcfb356f863f
commit: 76e612016586489e46c4afcf0bd8fcfb356f863f [16/16] PCI/PM: Move Asus quirk to USB EHCI driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250905/202509051921.JLsXjwJQ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509051921.JLsXjwJQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509051921.JLsXjwJQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/ehci-pci.c: In function 'ehci_pci_suspend':
>> drivers/usb/host/ehci-pci.c:359:34: warning: unused variable 'ehci' [-Wunused-variable]
     359 |         struct ehci_hcd         *ehci = hcd_to_ehci(hcd);
         |                                  ^~~~


vim +/ehci +359 drivers/usb/host/ehci-pci.c

   349	
   350	/* These routines rely on the PCI bus glue
   351	 * to handle powerdown and wakeup, and currently also on
   352	 * transceivers that don't need any software attention to set up
   353	 * the right sort of wakeup.
   354	 * Also they depend on separate root hub suspend/resume.
   355	 */
   356	
   357	static int ehci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
   358	{
 > 359		struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
   360		struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
   361		int			retval;
   362	
   363		retval = ehci_suspend(hcd, do_wakeup);
   364	
   365		/*
   366		 * Some BIOSes from ASUS have a bug: If a USB EHCI host controller's
   367		 * PCI Command register isn't 0, the BIOS assumes that the controller
   368		 * hasn't been quiesced and tries to turn it off.  If the controller
   369		 * is already in D3, this can hang or cause memory corruption.
   370		 *
   371		 * The only bit set in the Command register on suspend is Memory Space
   372		 * Enable, so clear it to work around the BIOS issue.
   373		 */
   374		if (!retval && IS_ENABLED(CONFIG_X86))
   375			pci_disable_resources(pdev);
   376	
   377		return retval;
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
