Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049DE17738
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706966209; cv=none; b=HG+P1dafC7W7QayUeWlp2eNiP7kHg8Mj0Ma4Tu0rG73H43ZJaHq1K0VsLaS1tudgNY8fMbOk44TfCSKccRL1zGLNK7HFSSqdniQrfGNYxMRJ5oDr0g38JvRPKTgzHG0cS4VUOArrWwpHH9ZHeVc/t5z1H7GwPsaDTKP7eYS4mn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706966209; c=relaxed/simple;
	bh=NAYeIQ0ZA7glbIJHWpYWZbdZ6cWmDH/AnenVPZ+/kK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KQ5xkjqIMMqSdyBI6AEfrAEBUGJWwYzN1OIV+awH79tdTc8LiCmib6G6io0Z9W2kuNWw74rcGeZle5a7EZvfzAEwWahj3O5wW0vOqxzRlnf/0RChRyjGSkUuvrGwm4IlArVASTwKSD+E+wuXo+VuIQmoU84ydoT9CcFInHj3zC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4eXBCH5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4eXBCH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706966208; x=1738502208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NAYeIQ0ZA7glbIJHWpYWZbdZ6cWmDH/AnenVPZ+/kK8=;
  b=I4eXBCH5xtpYHthkX93XOUTK8P/w2OmzMHvM/3UoTznQ4BKI4J2NT7oz
   8idxZtNA6TMm2EvxtnRQYIA2amusWNtKMXOaeyBCidsPoeini10+mxw3z
   cLahdLsmYYIb1qVINUbsLOxlUI47Z5wGDlfPRAE7n2E/RCk1kRS2Xkeie
   rkyX//Y2DM2JxoqRrqOYKvedi66QSLGivw+vpCmZgRao71asZFu4VbbBM
   8fKu7L0rMCQsOhqf+kamfSIQcFaQAYjdLqvCaYymmOUS6rh3ylgLzAXu2
   oeSHi4JY6rla/2hiAjAcFJBx9zfndL6ViD/hTHeZzHj2aNn3qkkBo841i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17728806"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="17728806"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 05:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="4932023"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Feb 2024 05:16:45 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWFsx-00055X-0h;
	Sat, 03 Feb 2024 13:16:43 +0000
Date: Sat, 3 Feb 2024 21:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.6.y 17/51]
 drivers/gpu/drm/tiny/ili9488_pio.c:23:10: fatal error:
 drm/drm_fb_cma_helper.h: No such file or directory
Message-ID: <202402032142.TITwC0pM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   0ea9759612aba09cc99b50301b281417f70e847c
commit: d9d97a57ca4c689c91ba8d0ca0af61187dbe19f1 [17/51] ODROID-COMMON: gpu/drm: Add new Tiny DRM driver with Ili9488
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240203/202402032142.TITwC0pM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402032142.TITwC0pM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402032142.TITwC0pM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tiny/ili9488_pio.c:23:10: fatal error: drm/drm_fb_cma_helper.h: No such file or directory
      23 | #include <drm/drm_fb_cma_helper.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +23 drivers/gpu/drm/tiny/ili9488_pio.c

    19	
    20	#include <drm/drm_atomic_helper.h>
    21	#include <drm/drm_damage_helper.h>
    22	#include <drm/drm_drv.h>
  > 23	#include <drm/drm_fb_cma_helper.h>
    24	#include <drm/drm_fb_helper.h>
    25	#include <drm/drm_fourcc.h>
    26	#include <drm/drm_gem_atomic_helper.h>
    27	#include <drm/drm_gem_cma_helper.h>
    28	#include <drm/drm_gem_framebuffer_helper.h>
    29	#include <drm/drm_managed.h>
    30	#include <drm/drm_mipi_dbi.h>
    31	#include <drm/drm_rect.h>
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
