Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5053C1360
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 04:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693457861; x=1724993861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y7+YhACJ6IpyVAQ7+y6w/ULpLNtZ5xWgR2TZulVtsBs=;
  b=UJ+/wUv8/f9Dfm0uuXXXJotNdAu9vL2g9UOz+Jk5EWH2JCY2EnGYFXQ+
   KDhhMaDG8/DF5He7dzCjbPgHpeR6R91rq3qCH8VS1pc9JsudqwpPpbMoo
   rJPnzK6WcNMtB+DWU6pedf335iivKUWUux32Ua2iyJUsHtLGsj77PCrBM
   3bwLGyOBTzvwDkHK6zdCDIL/d6/PJrKXjTiddHONKyY2hBAiZTar9VgCl
   H32T9ll1DxoH+Bua8w9/tU6vTrYuRPjs7FE9mVC22N4oLeJUTjwm5CwU7
   /XYUJ51BubqClDfNOH0kUjpkBQisWUsH7oUBU5XiDdgCc9HW4mFF9xz3X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360800875"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="360800875"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 21:57:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739333966"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="739333966"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Aug 2023 21:57:09 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbZjx-000Ad9-0X;
	Thu, 31 Aug 2023 04:57:09 +0000
Date: Thu, 31 Aug 2023 12:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/230-touchbar 4/9]
 drivers/gpu/drm/adp/adp_drv.c:83:5: warning: no previous prototype for
 'adp_open'
Message-ID: <202308311255.3lZDttcT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/230-touchbar
head:   91fe761a239f4bc5316f06588e6c5edd351c7576
commit: 5323639a48916e337e72bf9e25677c3540df5d1d [4/9] gpu: drm: adp: Refuse X* as client in open()
config: arm64-randconfig-r035-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311255.3lZDttcT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311255.3lZDttcT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311255.3lZDttcT-lkp@intel.com/

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
