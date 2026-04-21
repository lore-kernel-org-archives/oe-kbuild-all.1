Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CA6267B07
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 02:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776738439; cv=none; b=t/xeFSDvkqCboer6o0vtnuTEcHqHVvjz9JtRJ/eOycg2URVFGUxgVdjsnxXSQS5L7Rpjp8yGodt7Ns6FyUHL7VuD7DICPLlMep8B/Io9X5x697l0lAkYOjzgQpss/QAHbukVo2LOolz0SWnFyPhfe2Ez0PV75lvY0SNAxLiN3P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776738439; c=relaxed/simple;
	bh=9qr7aiY5yEH0eYOTIs1ueyE0u5lrrqD+iHGXOiq773E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GOd+vMLQM0MJhJjC9T9rm+Y57Rd5IMQI5G8rSCjdAMLhQP+x5Iv9Ey3G95G4BIcos21fySI3vrOgE8+Q5xymMjRgbfdb7XHHTkMVaBRbWtVPkbfK+PRso3mokXArGxI1D7Dk0Gab1cwYvyMejU7XEwQhZl5fuGUTl5ptM09nFMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eI6RMq0H; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eI6RMq0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776738436; x=1808274436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9qr7aiY5yEH0eYOTIs1ueyE0u5lrrqD+iHGXOiq773E=;
  b=eI6RMq0HFShm7Sq7EAhevG2nHzbVQD7x5YWETNYptYb24Ev24y0U9xhU
   btPuUB7TpL1VcjmWoAvGpfiNu+0Nfqy+NiCyWR+f/JfNTswtXtEWlccbL
   dnPjmqJnwsbvvWLkeU4j9P0ZXPK9sGUMkfQWRDrpZrWTvnrI/EOl1HZMQ
   7BvIt3vVmpMwCzLeiJr4/Vgaxw78B0ZFyrVR76OR8Tgju6KwGwzYbdq6k
   B2Cng0RW37gbb9gDgfUWdqkXwllDeHbTGxO9KeprbnB9R0vFELeIjvT8P
   9WD5F7kXNUMPObJxX0NUvbD0GZAhzqZAaLpSaUfOMknHOgB4lQgoab1Jz
   w==;
X-CSE-ConnectionGUID: L9ULp42gRyCg3tA1sPQwZw==
X-CSE-MsgGUID: SjnpPXrCQqCpeQeKd9YOJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81533370"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="81533370"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 19:27:15 -0700
X-CSE-ConnectionGUID: YZlxPlETTDS6QG3nXIgTjw==
X-CSE-MsgGUID: XENktPi8QWiFh5VQCHqqtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="232173577"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Apr 2026 19:27:14 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wF0pT-0000000036y-2CdO;
	Tue, 21 Apr 2026 02:27:11 +0000
Date: Tue, 21 Apr 2026 10:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:submit/dyndbg-classmap-foundation 61/69]
 drivers/gpu/drm/mediatek/mtk_drm_drv.c:25:10: fatal error: drm/drm_print.h.h:
 No such file or directory
Message-ID: <202604210922.tqoYbRYl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git submit/dyndbg-classmap-foundation
head:   ab4255e2a08294e2d0198ac8b9d6a68d47641930
commit: b3d9e13107ddea8f0f29bddfcd66df8b3566547d [61/69] drm/mediatek: Register DRM classmap
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260421/202604210922.tqoYbRYl-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604210922.tqoYbRYl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604210922.tqoYbRYl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:25:10: fatal error: drm/drm_print.h.h: No such file or directory
      25 | #include <drm/drm_print.h.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +25 drivers/gpu/drm/mediatek/mtk_drm_drv.c

    14	
    15	#include <drm/clients/drm_client_setup.h>
    16	#include <drm/drm_atomic.h>
    17	#include <drm/drm_atomic_helper.h>
    18	#include <drm/drm_drv.h>
    19	#include <drm/drm_fbdev_dma.h>
    20	#include <drm/drm_fourcc.h>
    21	#include <drm/drm_gem.h>
    22	#include <drm/drm_gem_framebuffer_helper.h>
    23	#include <drm/drm_ioctl.h>
    24	#include <drm/drm_of.h>
  > 25	#include <drm/drm_print.h.h>
    26	#include <drm/drm_probe_helper.h>
    27	#include <drm/drm_vblank.h>
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
