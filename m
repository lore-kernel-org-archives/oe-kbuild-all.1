Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D1C7F4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 20:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687035472; x=1718571472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hGu2IWjpx7AX/b/cZk/U16XIe2sGuY+x/4nWRxHHlX4=;
  b=J77vGsBCR6iCOP6nVFV10MKtCkjzjk0dgB8qdlxw7nqj3r38M84mfsSf
   n4MrN8uxUmVPfgxZAlfb+D0oXVuCYKwJEAVvsOC517IKQ3Tuwyy/2zTRI
   +O6fGmqwmxtq7IhKxP7YkmVanGb2UpqpiAanMIEPsysEirFjnUxCGJsy2
   9AH6Cb7py7SgVEKkOYilQlCOdGGHChbwUgvmLGXKDNBRD/2u/bR1AkiK9
   Bm3o+VXDOdAB3gyTJKjs8nKW/2iwUOYdg8p3Mg/V4CIMhajYAYHkyidAU
   j9ikFDj+hnz9OsmEQPdM0Ug1/PKehKrQoHaiCSyl/m3TRi1Jd5sco/0SR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="339759383"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="339759383"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 13:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="857772439"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="857772439"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2023 13:57:50 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAczW-00036W-0J;
	Sat, 17 Jun 2023 20:57:50 +0000
Date: Sun, 18 Jun 2023 04:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Subject: [asahilinux:pr/137 6/7] drivers/gpu/drm/adp/adp_drv.c:83:5: warning:
 no previous prototype for 'adp_open'
Message-ID: <202306180439.JYORFZCb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/137
head:   76b75538d804ebf2df27f871d68307892ac5d64b
commit: 62bf550c25df552048b0c3fd0e02ee41d86b0943 [6/7] gpu: drm: adp: Refuse X* as client in open()
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230618/202306180439.JYORFZCb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180439.JYORFZCb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180439.JYORFZCb-lkp@intel.com/

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
