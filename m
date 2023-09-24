Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A879E36D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 01:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695518299; x=1727054299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=68723DJbqZGLucbLwqBtZWOdh1tbHXyxjo3PzUoQ+Bc=;
  b=DWXaygmN0vWlDPo0qtSqXcWqbAayEb26DNS2XRPnzOtukU5+tCUbNJ+R
   wzlikGtEEXHKbY5AvKuEAcBd2yXxl7ZHO+8qJbx5ffKuQdZjM4/3xQ7rx
   7aiEOyLHDsLyJCHbaUuFZC4uAXONP8SL3/Q/T0U5u6AA/nHzHlTo5DJLJ
   +AfDHoP+1GAKEg2j+9KFVd0ANJLBlSr1kwbDA9juwkJbMEh0kP6yl0e6m
   vet+2G9kWk3G+pzCPPZy9IzA8q87uu43ajtWSJyVcaYlfF3/j8ED9H7MZ
   lnWOnDzGT+WiYznfFcjxKZxPYWJeZRe8UFDMch6Rp51jr/1vp9GyGPhCW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="411998594"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="411998594"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 18:18:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="863410737"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="863410737"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2023 18:18:17 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkDlH-00034T-2r;
	Sun, 24 Sep 2023 01:18:15 +0000
Date: Sun, 24 Sep 2023 09:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:uti260b 4/24] drivers/media/i2c/gc0308.c:1261:27: warning:
 'gc0308_effects_menu' defined but not used
Message-ID: <202309240951.25LvzWjW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git uti260b
head:   4e145d94d9d20e457f5aa3d51e765f7b1dd78a22
commit: 6c27014c45ea572d49dd42bb79b0ecb1fca39c33 [4/24] media: i2c: gc0308: new driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230924/202309240951.25LvzWjW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240951.25LvzWjW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240951.25LvzWjW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/gc0308.c:1261:27: warning: 'gc0308_effects_menu' defined but not used [-Wunused-const-variable=]
    1261 | static const char * const gc0308_effects_menu[] = {
         |                           ^~~~~~~~~~~~~~~~~~~


vim +/gc0308_effects_menu +1261 drivers/media/i2c/gc0308.c

  1260	
> 1261	static const char * const gc0308_effects_menu[] = {
  1262		"Normal", // V4L2_COLORFX_NONE = 0
  1263		"Grayscale", // V4L2_COLORFX_BW = 1
  1264		"Sepia", // V4L2_COLORFX_SEPIA = 2
  1265		"Color Invert", // V4L2_COLORFX_NEGATIVE = 3
  1266	};
  1267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
