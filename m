Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F3C111A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jun 2023 23:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687820845; x=1719356845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PtJfTV7NFTjfe2cGvdkqQMzqh6pGRtKjWGqF0r8r08E=;
  b=Ul2i1FtzxZwwuvqxJ2x30gZi+5CaJnCHXjjd3gNbOeJB4E4gANdNE7fs
   zrHMoZv0+8uvBjt6DlN7ialXFRDsNOomUJ9avcF1QDvsIgj7Q/9lm+De7
   KqYia6X3XQ8+41fl5t4gNqFzmwuEI5MTrkpIrh3unDDBSj2dI9eSxiga0
   didufqQe2xoRWbtLpZO6GtSMFSdBIDqzT0sXf7QMQVqgETBqIKkhSde5K
   QTE3i47PJm2vNMkbLTmHJZk5VDnJqCy/Dc5DVibQw/KZo1VHKKQcBCY1t
   f7o/e9gMhvli8SbfPzpfx0bFXwrINbGCVaamNJs/fHZDerag4rRZ69jRG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="360276842"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="360276842"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 16:07:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="806245584"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="806245584"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jun 2023 16:07:23 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDvIo-000B0H-2f;
	Mon, 26 Jun 2023 23:07:22 +0000
Date: Tue, 27 Jun 2023 07:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2j 18/20] ld:
 drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x4): undefined
 reference to `drm_debug_classes'
Message-ID: <202306270725.MHoES0jZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2j
head:   e723a1fdae00c0e147dd20d003b14f9ec411a30b
commit: 49e02213788a5706c6ad6c0a4ab0a51f9f92941f [18/20] drm-dbg: isolate weird build prob
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230627/202306270725.MHoES0jZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306270725.MHoES0jZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306270725.MHoES0jZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x4): undefined reference to `drm_debug_classes'
>> ld: drivers/gpu/drm/drm_crtc_helper.o:(__dyndbg_class_users+0x4): undefined reference to `drm_debug_classes'
>> ld: drivers/gpu/drm/display/drm_dp_helper.o:(__dyndbg_class_users+0x4): undefined reference to `drm_debug_classes'
>> ld: drivers/gpu/drm/i915/i915_params.o:(__dyndbg_class_users+0x4): undefined reference to `drm_debug_classes'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
