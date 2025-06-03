Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9D6128395
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 20:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748981329; cv=none; b=QDf+9Hj3DGryBiFwUMK2zd5LS4XQyQarn7f04Rl6LwKUQdcqo2iwjBhdOD6Iy5TRnLQkK3xkdXrsCzcwNnayh6pVO54yGC8fFLa2jNxURAsA1N5RhcsxwD9e59MFXAg/UOD5I1INK0lA2hhXzYwgLCcHoAbEcV8v0yyLbtK3fPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748981329; c=relaxed/simple;
	bh=hBA2pxPVtH6C30Z0qiGOsMSKZC0uDtfT8M00YQ0TZrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nXAOMHDytXbIWvbeF0kVqBCD0EL067+iRY2giJpZC52lcfLI7ETwOs5yX0Vtq4h+Maym/jcSoN1t0hoMQKmkpTyQKr/xqpAUQ7uDmzdI/AL8RUDoZn0tQ083fpORGrLTcil9B1/erTZtg445Pcr5XskrVrNUiMKJKKG1RMiWrqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kuicqdxw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kuicqdxw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748981327; x=1780517327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hBA2pxPVtH6C30Z0qiGOsMSKZC0uDtfT8M00YQ0TZrM=;
  b=Kuicqdxw12Yv8H8hjnBet3QPLfSeaEuJPIzh6dFqCUOlU9GAg0avzQIW
   wL1tOzAM2knNqvgxdI9m2axAOVc43AfZgrKXC2J4mC+cULx8oZhRAmqGh
   nCn1+vKiWGjvbD+bBqJSWiBj8xLrbx3MKqxdJZ/nHJ+UrNpaxMUjw/1vQ
   HbjQdUbTeTaNcG8XTbKN8ZmGzW7kwV04y9iFm6p9shYYwIYMpFUDZuTYl
   q7XgtocJwsNTd2zU+AjJbEEg0uYD62qTJtdx+JuhOTKkQ2X434T53gHhg
   JzJ8RBWVbL+HAZUADabQbuYflqf4NE5zsVy60HY1LBKOa9HqDnHHs877N
   A==;
X-CSE-ConnectionGUID: 7/kHzVqlTsWj0ig1tGxdJw==
X-CSE-MsgGUID: b/pFOXkxSo6nlXkxP6u4cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50952352"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="50952352"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 13:08:46 -0700
X-CSE-ConnectionGUID: 5YDURWzYTaWm1m6jBFBlww==
X-CSE-MsgGUID: RLevlWXvSzKd4eGwrUCpcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="144983886"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jun 2025 13:08:46 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMXwB-0001Z0-0g;
	Tue, 03 Jun 2025 20:08:43 +0000
Date: Wed, 4 Jun 2025 04:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882]
 drivers/gpu/drm/loongson/lsdc_plane.c:444:7: warning: variable
 'format_count' is used uninitialized whenever switch case is taken
Message-ID: <202506040411.rMDpRs4Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b5ec139da1a4916dfc9644ee3d9426dbd6f23c13
commit: 80764bc784413eb604c7d472db55b1ca72d4bbc5 [2882/2882] drm/loongson: add kernel modesetting driver support for ls7a1000/ls7a2000
config: x86_64-buildonly-randconfig-2004-20250502 (https://download.01.org/0day-ci/archive/20250604/202506040411.rMDpRs4Q-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506040411.rMDpRs4Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506040411.rMDpRs4Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/loongson/lsdc_plane.c:98:13: warning: variable 'lo32_addr_reg' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      98 |         } else if (index == 1) {
         |                    ^~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:114:33: note: uninitialized use occurs here
     114 |         writel(paddr, ldev->reg_base + lo32_addr_reg);
         |                                        ^~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:98:9: note: remove the 'if' if its condition is always true
      98 |         } else if (index == 1) {
         |                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:77:19: note: initialize the variable 'lo32_addr_reg' to silence this warning
      77 |         u32 lo32_addr_reg;
         |                          ^
         |                           = 0
   drivers/gpu/drm/loongson/lsdc_plane.c:98:13: warning: variable 'hi32_addr_reg' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      98 |         } else if (index == 1) {
         |                    ^~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:115:48: note: uninitialized use occurs here
     115 |         writel((paddr >> 32) & 0xFF, ldev->reg_base + hi32_addr_reg);
         |                                                       ^~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:98:9: note: remove the 'if' if its condition is always true
      98 |         } else if (index == 1) {
         |                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:78:19: note: initialize the variable 'hi32_addr_reg' to silence this warning
      78 |         u32 hi32_addr_reg;
         |                          ^
         |                           = 0
   drivers/gpu/drm/loongson/lsdc_plane.c:98:13: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      98 |         } else if (index == 1) {
         |                    ^~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:120:9: note: uninitialized use occurs here
     120 |         writel(val | CFG_PAGE_FLIP_BIT, ldev->reg_base + cfg_reg);
         |                ^~~
   drivers/gpu/drm/loongson/lsdc_plane.c:98:9: note: remove the 'if' if its condition is always true
      98 |         } else if (index == 1) {
         |                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:80:9: note: initialize the variable 'val' to silence this warning
      80 |         u32 val;
         |                ^
         |                 = 0
   drivers/gpu/drm/loongson/lsdc_plane.c:98:13: warning: variable 'cfg_reg' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      98 |         } else if (index == 1) {
         |                    ^~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:120:51: note: uninitialized use occurs here
     120 |         writel(val | CFG_PAGE_FLIP_BIT, ldev->reg_base + cfg_reg);
         |                                                          ^~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:98:9: note: remove the 'if' if its condition is always true
      98 |         } else if (index == 1) {
         |                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:79:13: note: initialize the variable 'cfg_reg' to silence this warning
      79 |         u32 cfg_reg;
         |                    ^
         |                     = 0
>> drivers/gpu/drm/loongson/lsdc_plane.c:444:7: warning: variable 'format_count' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     444 |         case DRM_PLANE_TYPE_OVERLAY:
         |              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:451:21: note: uninitialized use occurs here
     451 |                                        formats, format_count,
         |                                                 ^~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:428:27: note: initialize the variable 'format_count' to silence this warning
     428 |         unsigned int format_count;
         |                                  ^
         |                                   = 0
   5 warnings generated.


vim +/format_count +444 drivers/gpu/drm/loongson/lsdc_plane.c

   420	
   421	int lsdc_plane_init(struct lsdc_device *ldev,
   422			    struct drm_plane *plane,
   423			    enum drm_plane_type type,
   424			    unsigned int index)
   425	{
   426		struct drm_device *ddev = ldev->ddev;
   427		int zpos = lsdc_plane_get_default_zpos(type);
   428		unsigned int format_count;
   429		const u32 *formats;
   430		const char *name;
   431		int ret;
   432	
   433		switch (type) {
   434		case DRM_PLANE_TYPE_PRIMARY:
   435			formats = lsdc_primary_formats;
   436			format_count = ARRAY_SIZE(lsdc_primary_formats);
   437			name = "primary-%u";
   438			break;
   439		case DRM_PLANE_TYPE_CURSOR:
   440			formats = lsdc_cursor_formats;
   441			format_count = ARRAY_SIZE(lsdc_cursor_formats);
   442			name = "cursor-%u";
   443			break;
 > 444		case DRM_PLANE_TYPE_OVERLAY:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
