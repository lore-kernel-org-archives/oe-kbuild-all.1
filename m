Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA42241686
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 14:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438341; cv=none; b=Yj1/vyasBtmo41O57bnMbBs/e47TH6yPNdc83h9CelHNtZhfJfAGB0DP+vcovWcFFUc0K6yCkRTKvq/Gq+4WBoIrzCyndduJe2csLAUwOskQqSz+/Kp4yVcoZ6GeL+cK8/QVg0vWcWqq5jvmE9YL/ZrGV8gKKQjCQLjbtgk3sLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438341; c=relaxed/simple;
	bh=1fyxGBR1cFv3fZhODi7o6GfYsIhxGIZiSXg3yO/sSvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ROwqRiIbjYA59zjud1GnldgTz6J4CrHv4bGh5GQxmTskfjpgThC/ia0UcpsRseWsfkOQSY3tXcsypWin21u2vp9nu1JYs+QnX3MS6P4vOWq1HMlsI1Hx1kz4ddJJsWs6qXX6CipOwv1hpO/e2CZRwKMjJnQ+ytxQswBHZjHn7Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFGnnZPL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFGnnZPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769438338; x=1800974338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1fyxGBR1cFv3fZhODi7o6GfYsIhxGIZiSXg3yO/sSvM=;
  b=bFGnnZPL5Cx04m5/fqStJMMIVsQxWU1ksGU2ON6zPERMLnYrTm9/YOeY
   JtPH7dC080mkX9K64IeIwvB8GBMcZnTklmZKeDGq+tDRPR2b0fKIqgY9/
   w/wia8s215PCu1Gz4EScRAlwVb+8i8BkEWXMz9hE0BIbPZqLbJvwuAzjx
   xp1QaIISZxlHDoOqroOHjgvD14NM3MfvrWnX5NkG83lRduh6UQJqT1Ngi
   S8f0BKNQghVU5fukTjrK5Z7HX3m5i+Gl9GNbqv4xz+62M7dAmyCdjo7pq
   HP3aFZc+Twn+hA1B8kYj4oXUrgW+0igVwFpvxfN92KFn/0yXEsxI5G6qy
   A==;
X-CSE-ConnectionGUID: IO+HC/YySkiqt5tgvNfJJw==
X-CSE-MsgGUID: mhPwsznOQC6n2oAlnUxkIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70582904"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70582904"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:38:57 -0800
X-CSE-ConnectionGUID: lf5H1uFyTOSECxk9nO4ovw==
X-CSE-MsgGUID: NliQE0hgSEaCNjJ3IdouZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207718905"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Jan 2026 06:38:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkNjw-00000000XOm-1GnG;
	Mon, 26 Jan 2026 14:38:52 +0000
Date: Mon, 26 Jan 2026 22:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix 74/76]
 drivers/accel/ethosu/ethosu_job.c:474:3: error: call to undeclared function
 '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202601262238.6OGCf2EK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   0fa692134ca9fc43e9c31c6e921abbeb89f56cf0
commit: 64b3b695e140610d80a4856b8dbe8e1dc928b2c8 [74/76] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
config: s390-randconfig-r073-20260126 (https://download.01.org/0day-ci/archive/20260126/202601262238.6OGCf2EK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262238.6OGCf2EK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601262238.6OGCf2EK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/ethosu/ethosu_job.c:474:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     474 |                 drm_dbg(dev, "Reserved field in drm_ethosu_submit struct should be 0.\n");
         |                 ^
   include/drm/drm_print.h:683:32: note: expanded from macro 'drm_dbg'
     683 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:665:2: note: expanded from macro 'drm_dbg_driver'
     665 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:580:2: note: expanded from macro 'drm_dev_dbg'
     580 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   drivers/accel/ethosu/ethosu_job.c:486:3: error: call to undeclared function '_dynamic_func_call_cls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     486 |                 drm_dbg(dev, "Failed to copy incoming job array\n");
         |                 ^
   include/drm/drm_print.h:683:32: note: expanded from macro 'drm_dbg'
     683 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^
   include/drm/drm_print.h:665:2: note: expanded from macro 'drm_dbg_driver'
     665 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:580:2: note: expanded from macro 'drm_dev_dbg'
     580 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^
   2 errors generated.


vim +/_dynamic_func_call_cls +474 drivers/accel/ethosu/ethosu_job.c

5a5e9c0228e613 Rob Herring (Arm  2025-10-20  466) 
5a5e9c0228e613 Rob Herring (Arm  2025-10-20  467) int ethosu_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file)
5a5e9c0228e613 Rob Herring (Arm  2025-10-20  468) {
5a5e9c0228e613 Rob Herring (Arm  2025-10-20  469) 	struct drm_ethosu_submit *args = data;
5a5e9c0228e613 Rob Herring (Arm  2025-10-20  470) 	int ret = 0;
5a5e9c0228e613 Rob Herring (Arm  2025-10-20  471) 	unsigned int i = 0;
5a5e9c0228e613 Rob Herring (Arm  2025-10-20  472) 
5a5e9c0228e613 Rob Herring (Arm  2025-10-20  473) 	if (args->pad) {
5a5e9c0228e613 Rob Herring (Arm  2025-10-20 @474) 		drm_dbg(dev, "Reserved field in drm_ethosu_submit struct should be 0.\n");

:::::: The code at line 474 was first introduced by commit
:::::: 5a5e9c0228e613f0ef2a58b9782d7c0ea8f1e58b accel: Add Arm Ethos-U NPU driver

:::::: TO: Rob Herring (Arm) <robh@kernel.org>
:::::: CC: Rob Herring (Arm) <robh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
