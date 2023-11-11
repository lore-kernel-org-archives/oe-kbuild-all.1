Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B0063DA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 05:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuF5W6eN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699680065; x=1731216065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v50fumIhq4iWRcwZ5YxILAyDIk4L36sd+mVh07TwtNw=;
  b=iuF5W6eNTiu5oH3FSDz2N5HB5wjYQ7OXXnOHOEgqKM9HO+CvBAESGwpk
   rVohGkPWsgHkiXa3gDJItDjPfoeZYW11xDn1luF6MdIHXggei561VlSAz
   CjrQzes8vl6Pp0sGltc4+5+fjk7heGJEEpGJzdsT1Cuh+X/9GTo9nUNay
   fB+8Oe9+fpOzPZTLQ2V5Y6Jo63Ii2cjdUvmnuKHyuz9OWsJ2Tq2Ztnoh4
   1qge87mr8e3pldReb18u6IS9yki6sb0PoA3PcN3neOu0XVGpyzuoo3Lcp
   +wOvKe/jrybYOQACzNpxR+g1AE+FilzvsNjsqu/GfePIX5a9iKsUWP2lo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="421353364"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="421353364"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 21:21:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="767467545"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="767467545"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Nov 2023 21:21:03 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1gQX-000AEe-1r;
	Sat, 11 Nov 2023 05:21:01 +0000
Date: Sat, 11 Nov 2023 13:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/start-BRA-support 41/43]
 sound/soc/sof/intel/hda-sdw-bpt.c:14:10: fatal error: sound/hda-sdw-bpt.h:
 No such file or directory
Message-ID: <202311111355.wNjyu3lQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/start-BRA-support
head:   2992436cd89b1c406e5fe2d512ab38271223f844
commit: c62f474e74dae9988e10144c634f6541c9c42267 [41/43] ASoC: SOF: Intel: hda-sdw-bpt: add helpers for SoundWire BPT DMA
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231111/202311111355.wNjyu3lQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111355.wNjyu3lQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111355.wNjyu3lQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/intel/hda-sdw-bpt.c:14:10: fatal error: sound/hda-sdw-bpt.h: No such file or directory
      14 | #include <sound/hda-sdw-bpt.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +14 sound/soc/sof/intel/hda-sdw-bpt.c

     8	
     9	/*
    10	 * Hardware interface for SoundWire BPT support with HDA DMA
    11	 */
    12	
    13	#include <sound/hdaudio_ext.h>
  > 14	#include <sound/hda-sdw-bpt.h>
    15	#include <sound/sof.h>
    16	#include "../ops.h"
    17	#include "../sof-priv.h"
    18	#include "hda.h"
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
