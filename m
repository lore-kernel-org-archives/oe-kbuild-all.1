Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A682B388
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 04:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696221259; x=1727757259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IN1P4XEG/33ojcCiylandiea7b3MLNFJc/TEYs1agHI=;
  b=UbAJ9dTpINxd52NOh/yrfp1lW1sY5Q3h6giCaT6v9HekUtLstkjHmjV5
   XgPXyI42qHPvu6qCkU2wYobF6T5aHW55Rbm7N9hmKvbaJUYfysVeEvv3W
   ytWjnYojtemy2RVq3Q0MJZ3gQysq1HaxyfUMEkpdis9ysdA8HJiyqGM0g
   o3/N+beDfj350RPOVo0DCYkgO7XDRejU4TxjdXg4s45aT9tKz34H/sTiT
   1ZTUzrllfxzRXDjWe2g12u6i8YUBl2nWwv9e2ML86JaKtAwzgYovOEZ92
   R1t0WDXd3chH8CRiq2VPJ2ADAQKOdY7b7LzwUyKimJtgNkw8CvTo3tNS1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="446736124"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="446736124"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 21:34:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="744025243"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="744025243"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 01 Oct 2023 21:34:17 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnAdL-0005l3-07;
	Mon, 02 Oct 2023 04:34:15 +0000
Date: Mon, 2 Oct 2023 12:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/230-touchbar 4/8]
 drivers/gpu/drm/adp/adp_drv.c:83:5: warning: no previous prototype for
 'adp_open'
Message-ID: <202310021214.o27jjtVz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/230-touchbar
head:   2041fd353895c61408325b6315a71787e1e3689f
commit: 696123920dec3c0384595c0b95fa348a622a5d2e [4/8] gpu: drm: adp: Refuse X* as client in open()
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231002/202310021214.o27jjtVz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310021214.o27jjtVz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310021214.o27jjtVz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/adp/adp_drv.c:83:5: warning: no previous prototype for 'adp_open' [-Wmissing-prototypes]
      83 | int adp_open(struct inode *inode, struct file *filp)
         |     ^~~~~~~~
   drivers/gpu/drm/adp/adp_drv.c:253:19: warning: no previous prototype for 'adp_plane_new' [-Wmissing-prototypes]
     253 | struct adp_plane *adp_plane_new(struct adp_drv_private *adp, u8 id)
         |                   ^~~~~~~~~~~~~
   drivers/gpu/drm/adp/adp_drv.c:435:5: warning: no previous prototype for 'adp_detect_ctx' [-Wmissing-prototypes]
     435 | int adp_detect_ctx(struct drm_connector *connector,
         |     ^~~~~~~~~~~~~~


vim +/adp_open +83 drivers/gpu/drm/adp/adp_drv.c

    82	
  > 83	int adp_open(struct inode *inode, struct file *filp)
    84	{
    85		/*
    86		 * The modesetting driver does not check the non-desktop connector
    87		 * property and keeps the device open and locked. If the touchbar daemon
    88		 * opens the device first modesetting breaks the whole X session.
    89		 * Simply refuse to open the device for X11 server processes as
    90		 * workaround.
    91		 */
    92		if (current->comm[0] == 'X')
    93			return -EBUSY;
    94	
    95		return drm_open(inode, filp);
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
