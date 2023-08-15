Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB3E101C1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692110174; x=1723646174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nvjTsvZfZl/hLGRCUdeDEkIxrOWcJoH/50zE6shRsys=;
  b=YJIFjWMmpAijErgU7a0Jr4W87/cx762vijKZhIFsk62ZpQ8ZZTULqVKt
   mTnJukpDkm75xA11Sn8yY0LXXdZt+73IRP5ocqZOMsiy8ec0lAxv5zQfQ
   SqZjyAfaFpWjo0IxEABBCLFjnp5dTevo7s3JYMO5kiSKUWsVCTVRULHOU
   t/qs/06DiB+6ewCVRgDmxIsHfoGPdWYSDjZ6qJ0H1Q28M/7grF8G3NXUL
   EKdNv+DtyCeXQX4rHJUDGOeqgKGi+R9/oVInQNT9esvNXTtv9PaPK9yje
   8oxLl4G9437vq2HmZArA7cB5jvgQ8jdY1RU2bJ4Mmqf/kmvv3BCG6glaL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="351878266"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="351878266"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 07:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1064483066"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="1064483066"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2023 07:36:11 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVv8N-00011X-1O;
	Tue, 15 Aug 2023 14:35:23 +0000
Date: Tue, 15 Aug 2023 22:34:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Sam Ravnborg <sam@ravnborg.org>
Subject: [linux-next:master 6241/10161] drivers/video/fbdev/g364fb.c:115:9:
 error: 'FB_DEFAULT_IOMEM_HELPERS' undeclared here (not in a function); did
 you mean 'FB_DEFAULT_IOMEM_OPS'?
Message-ID: <202308152224.138bLmbR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 5011260838551cefbf23d60b48c3243b6d5530a2 [6241/10161] fbdev/g364fb: Use fbdev I/O helpers
config: mips-jazz_defconfig (https://download.01.org/0day-ci/archive/20230815/202308152224.138bLmbR-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308152224.138bLmbR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308152224.138bLmbR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/g364fb.c:115:9: error: 'FB_DEFAULT_IOMEM_HELPERS' undeclared here (not in a function); did you mean 'FB_DEFAULT_IOMEM_OPS'?
     115 |         FB_DEFAULT_IOMEM_HELPERS,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         FB_DEFAULT_IOMEM_OPS


vim +115 drivers/video/fbdev/g364fb.c

   112	
   113	static const struct fb_ops g364fb_ops = {
   114		.owner		= THIS_MODULE,
 > 115		FB_DEFAULT_IOMEM_HELPERS,
   116		.fb_setcolreg	= g364fb_setcolreg,
   117		.fb_pan_display	= g364fb_pan_display,
   118		.fb_blank	= g364fb_blank,
   119	};
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
