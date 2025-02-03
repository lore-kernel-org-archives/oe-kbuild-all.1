Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0988204C04
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 12:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587384; cv=none; b=TMc1smUsylyZAixBjXyqcfObi//hcmGXa5XQImvzFOlskDxvs2kUhCJzmLW7iy6q3lwjoK0FmLI8o8v5ASToBCDoSzE0QnaJDzONboj7KwpdIXsEKitpYuiyV8m3KyJSfs2ztscnv0gb8mSDUUJGrZ64OErMT/ODTymkni8FtWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587384; c=relaxed/simple;
	bh=MmNu73aJ24BP3/fEq3M2RmZ5oLXjqml1IUz/7E9LWTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OvM3dBANmGewidztiGswgnIKm2KxrIbd2UZmhbnVX22jtRXifBRU21YMLnrdCJk2g1h6UgLLiSPK/GCD4u23a+75qKa3UBIXCLJwk55WWLJBC03LJt4FnZc6yctU6afBhu/0rO2jPiwUK2UJfo2AnQqSGJ8HilfPKOVd6pRwl70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=io8/cHGn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="io8/cHGn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738587383; x=1770123383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MmNu73aJ24BP3/fEq3M2RmZ5oLXjqml1IUz/7E9LWTk=;
  b=io8/cHGnmcOSz3lXntJSsNdgDtTPsrsjn9hU0ECYWoHclFrUglIrfrWG
   GyQS9ZAkrLwh5bOm04uErqKbQuULgAPIVssZiKUPXT43bbYoBSgXOmugn
   FoJXkH8WbE5GBgzs/fA7Bdr5/uXtgRXcRqfNpRFjaVteRFT8XyXHlyqIx
   hJEmvZgTj1q/vb/T0A6tLfQF0qFaS0nFbpJ7QDQxrF7pXroBOoICrO0lJ
   3zNs4oW4fIrZ9JVkEtejBptNp6u/Vu+25kf5ff2PJNyRrIgM/jqEvgwSL
   cTPq66Wz+ondulQZAU+a2elgYdqmfmRHcBDS1f0giEEvVrac4iqVp0pm8
   g==;
X-CSE-ConnectionGUID: 7idJ6i1ATyiHPWcGNavOrw==
X-CSE-MsgGUID: rZV/c9sJSoWZ+ttObETfEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42999215"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="42999215"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:56:21 -0800
X-CSE-ConnectionGUID: O5h0GJXsQfKczz6vlcCWTQ==
X-CSE-MsgGUID: Aef8ezOeRuOPsoXzS4rVyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115312585"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Feb 2025 04:56:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tevzu-000qvH-0w;
	Mon, 03 Feb 2025 12:56:18 +0000
Date: Mon, 3 Feb 2025 20:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:xfs-data-crc 14/21] drivers/nvme/host/core.c:1852:13:
 warning: 'nvme_config_discard' defined but not used
Message-ID: <202502032035.y8rZ0FWA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git xfs-data-crc
head:   99d5f00e7209b1efbf51c27f4746718c27104289
commit: 1dee9fa528f6e3161f2217b6f78b2142e9dc2e54 [14/21] TEMP: nvme: disable discard
config: i386-buildonly-randconfig-001-20250203 (https://download.01.org/0day-ci/archive/20250203/202502032035.y8rZ0FWA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502032035.y8rZ0FWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502032035.y8rZ0FWA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/core.c:1852:13: warning: 'nvme_config_discard' defined but not used [-Wunused-function]
    1852 | static void nvme_config_discard(struct nvme_ns *ns, struct queue_limits *lim)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/nvme_config_discard +1852 drivers/nvme/host/core.c

1673f1f08c8876 Christoph Hellwig 2015-11-26  1851  
e6c9b130d68144 Christoph Hellwig 2024-03-04 @1852  static void nvme_config_discard(struct nvme_ns *ns, struct queue_limits *lim)
1673f1f08c8876 Christoph Hellwig 2015-11-26  1853  {
e6c9b130d68144 Christoph Hellwig 2024-03-04  1854  	struct nvme_ctrl *ctrl = ns->ctrl;
3831761eb859f5 Jens Axboe        2018-05-02  1855  
e6c9b130d68144 Christoph Hellwig 2024-03-04  1856  	if (ctrl->dmrsl && ctrl->dmrsl <= nvme_sect_to_lba(ns->head, UINT_MAX))
e6c9b130d68144 Christoph Hellwig 2024-03-04  1857  		lim->max_hw_discard_sectors =
e6c9b130d68144 Christoph Hellwig 2024-03-04  1858  			nvme_lba_to_sect(ns->head, ctrl->dmrsl);
e6c9b130d68144 Christoph Hellwig 2024-03-04  1859  	else if (ctrl->oncs & NVME_CTRL_ONCS_DSM)
e6c9b130d68144 Christoph Hellwig 2024-03-04  1860  		lim->max_hw_discard_sectors = UINT_MAX;
e6c9b130d68144 Christoph Hellwig 2024-03-04  1861  	else
e6c9b130d68144 Christoph Hellwig 2024-03-04  1862  		lim->max_hw_discard_sectors = 0;
e6c9b130d68144 Christoph Hellwig 2024-03-04  1863  
e6c9b130d68144 Christoph Hellwig 2024-03-04  1864  	lim->discard_granularity = lim->logical_block_size;
3831761eb859f5 Jens Axboe        2018-05-02  1865  
3b946fe1cc149b Christoph Hellwig 2023-12-26  1866  	if (ctrl->dmrl)
e6c9b130d68144 Christoph Hellwig 2024-03-04  1867  		lim->max_discard_segments = ctrl->dmrl;
3b946fe1cc149b Christoph Hellwig 2023-12-26  1868  	else
e6c9b130d68144 Christoph Hellwig 2024-03-04  1869  		lim->max_discard_segments = NVME_DSM_MAX_RANGES;
1673f1f08c8876 Christoph Hellwig 2015-11-26  1870  }
1673f1f08c8876 Christoph Hellwig 2015-11-26  1871  

:::::: The code at line 1852 was first introduced by commit
:::::: e6c9b130d68144381c097c90c517cc25e8f8924e nvme: use the atomic queue limits update API

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Keith Busch <kbusch@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
