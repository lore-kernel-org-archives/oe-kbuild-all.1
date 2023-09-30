Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39DD1946E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 22:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696112037; x=1727648037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qc6KvivaqREMiwJdUtz5d3DTkFzcyti1tB6ECAWPkBU=;
  b=ijaj4zhOMf6rIN466qXgjYE1IzB4ToUYPi6c0odYzw4ye7u2TIONeQUO
   XOz2ObZvC+CyUt3C7qE56HfS8sqvcxi+vvyp4aLYASbGO1aiAtQ8AWuQF
   uqkC3ZL3W2nKxJCW/ehzNUCncqYprajsIJFHczQKQlfL7nF+whAo9OEiZ
   xYvNeZW3KMnwPyg3df90AFVrUTUwLbKGiXNiC0r0WL3RtS8t3sxxgijMt
   VMO7VY5P3jv8ykiRnTbZxJVVOKneoASTBnSR9VLAzVhkahvML/8AVuFvb
   nFpJAYswolo/TGckLsdsLrM02yfFg53g2NwT7E79NzJ4J5pdQkY8B3m14
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="413386098"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="413386098"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 15:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="743765088"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="743765088"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Sep 2023 15:13:55 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmiDg-0004Vv-35;
	Sat, 30 Sep 2023 22:13:52 +0000
Date: Sun, 1 Oct 2023 06:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 29/36]
 drivers/gpu/drm/mediatek/mtk_drm_gem.c:295:27: warning: format '%zu' expects
 argument of type 'size_t', but argument 2 has type 'uint64_t' {aka 'long
 long unsigned int'}
Message-ID: <202310010633.QSBbgTqG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   54b66591961ea15d06b1159c9c726d69c30177b0
commit: 4fc9c413ee09e3ce10ddead89c2c57f85007718a [29/36] CHROMIUM: drm/mediatek: Check allocation size
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231001/202310010633.QSBbgTqG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010633.QSBbgTqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310010633.QSBbgTqG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from drivers/gpu/drm/mediatek/mtk_drm_gem.c:12:
   drivers/gpu/drm/mediatek/mtk_drm_gem.c: In function 'mtk_gem_create_ioctl':
>> drivers/gpu/drm/mediatek/mtk_drm_gem.c:295:27: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'uint64_t' {aka 'long long unsigned int'} [-Wformat=]
     295 |                 DRM_ERROR("Invalid allocation size: %zu", args->size);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~
         |                                                               |
         |                                                               uint64_t {aka long long unsigned int}
   include/drm/drm_print.h:592:19: note: in definition of macro 'DRM_ERROR'
     592 |         __drm_err(fmt, ##__VA_ARGS__)
         |                   ^~~
   drivers/gpu/drm/mediatek/mtk_drm_gem.c:295:55: note: format string is defined here
     295 |                 DRM_ERROR("Invalid allocation size: %zu", args->size);
         |                                                     ~~^
         |                                                       |
         |                                                       long unsigned int
         |                                                     %llu


vim +295 drivers/gpu/drm/mediatek/mtk_drm_gem.c

   286	
   287	int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
   288				 struct drm_file *file_priv)
   289	{
   290		struct mtk_drm_gem_obj *mtk_gem;
   291		struct drm_mtk_gem_create *args = data;
   292		int ret;
   293	
   294		if (args->size == 0) {
 > 295			DRM_ERROR("Invalid allocation size: %zu", args->size);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
