Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4241326ACC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 04:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776746729; cv=none; b=ZZVko8J6LyPevjr3usQgoraK/zoMrnmYA4ktrLHKUiFAJykdsrK/Ge4oXouiBfctnpRsC/RnmqFpDEr4HgPaAMM82YWba3Gzu2SCyUSDqmVQEievPkZwtLxCf7YBppXB0vrOWlZopJUeG9/agj7fIOiVL9Qipiq2eZujMm7B4y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776746729; c=relaxed/simple;
	bh=s8aKnAygGC6FG1jVlfOD9oir4CJvI/w4As7zos3et10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DfFmwQnFQPuzOOD2sbKQ9YjSXNK49mg6hS58aQTv+0KoWQTklj/jXaihjceJSubrYBIPA8Ld3iV+h5vIuOSjv5PeQNrvfJhKpdqAApZsCKauGiC+9eGNXxOHqWQmiiqKu+KjZRkYvbQB/zQcPZkdwch7AqPtmzcZpZD2YVRFzJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXT0cYnl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXT0cYnl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776746727; x=1808282727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s8aKnAygGC6FG1jVlfOD9oir4CJvI/w4As7zos3et10=;
  b=SXT0cYnlcY0ATXVMV7P5/qFovUV5rMXoNOhEPQY4WysQBpIyoIf3C6/1
   Edd/dMm53WaW6W1jBrBxbvt9mxuafLTsYXd96pdNQTqj3qMEjHQbKpB5K
   4G41cRjwX0IWJOIjNHF2DhVHQ1JmTBBvt0QRMlmSbNGBCk8OcJ3yq2P/Y
   /MUb/VQNsuJIuyDBmd7uFuwA0Er+99LT9fK9VxaDyq6RpoVritffENIuq
   oEDAwGlcTfwf2ThHOU4L/BymUHPjgu81iO7TW2G1KL49Fu/EprmmeB2Rp
   avnV5NqdOCn1HM6rZoXC97mlkpf/C4qiUSN5Z5zK510+Z5wW9TtNVDUwQ
   w==;
X-CSE-ConnectionGUID: eqUlWzGDRImr4cVWlHc1BQ==
X-CSE-MsgGUID: FcltNbhqQQKrQ4CtSR/WPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77545212"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="77545212"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 21:45:26 -0700
X-CSE-ConnectionGUID: 7PynAJ8DTIyBPPJZbcsIGw==
X-CSE-MsgGUID: KF1PXVw3Q3qAOmOUP05pTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="236905258"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Apr 2026 21:45:25 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wF2zC-000000003EW-3LZB;
	Tue, 21 Apr 2026 04:45:22 +0000
Date: Tue, 21 Apr 2026 12:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:submit/dyndbg-classmap-foundation /69]
 drivers/gpu/drm/mediatek/mtk_drm_drv.c:25:10: fatal error:
 'drm/drm_print.h.h' file not found
Message-ID: <202604211211.D7PrX84h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git submit/dyndbg-classmap-foundation
head:   0ba4d1a0dd9a629e3e284b001a85c5fa4b027326
commit: b3d9e13107ddea8f0f29bddfcd66df8b3566547d [/69] drm/mediatek: Register DRM classmap
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260421/202604211211.D7PrX84h-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604211211.D7PrX84h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604211211.D7PrX84h-lkp@intel.com/

Note: the jimc/submit/dyndbg-classmap-foundation HEAD 0ba4d1a0dd9a629e3e284b001a85c5fa4b027326 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:25:10: fatal error: 'drm/drm_print.h.h' file not found
      25 | #include <drm/drm_print.h.h>
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.


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
