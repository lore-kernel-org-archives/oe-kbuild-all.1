Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FA81BB2E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691591481; x=1723127481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gEosZKW7EmEH+k6hp0q3nBhKt+XWUwDlEUKcWFGSv20=;
  b=cItIouX2lOZ/uy2aw+cHnj3DLfMHpliapqoYytSsAw4snz2powsi5a9H
   onBHxEmHZ7yv1/yUtPJRz6wCtofnraCl6EYyaVmbZCKCjrjnfKE2OiiLC
   kOsmFsa5Yslz5Gm3CP4s9FmmBQdydP1zenojZxHdoVMcnAueOxgruN8N3
   aC3L3APUchHb0BU4ouqIDbNGsoBpb8nCkxQ/stAodDck5rE4FSqcMcAq0
   uFoyWfE8o7fT/MgkCNZZxF6OTpAGijRpT5IgI8ZktzgD85JaeIStpOn7s
   rjzgnScVRm30uiFpZfETESejOM39xj5FVya7MSEdbqDQeIHn8m/pHigmi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="435029309"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="435029309"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 07:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="731847882"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="731847882"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Aug 2023 07:30:35 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTkCo-00069c-1L;
	Wed, 09 Aug 2023 14:30:34 +0000
Date: Wed, 9 Aug 2023 22:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 203/205]
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c:8:10: fatal error:
 'intel_execlists_submission.h' file not found
Message-ID: <202308092226.GrR4W2ik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   d30ed4ee0dcd740c1a0d8751ff34b32146e24dd6
commit: 57fdc14872db72b134f9003f96454ec05a5d5bbc [203/205] drm/i915: split gen8+ flush and bb_start emission functions
config: x86_64-randconfig-x004-20230809 (https://download.01.org/0day-ci/archive/20230809/202308092226.GrR4W2ik-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092226.GrR4W2ik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308092226.GrR4W2ik-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/gen8_engine_cs.c:8:10: fatal error: 'intel_execlists_submission.h' file not found
   #include "intel_execlists_submission.h" /* XXX */
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +8 drivers/gpu/drm/i915/gt/gen8_engine_cs.c

   > 8	#include "intel_execlists_submission.h" /* XXX */
     9	#include "intel_gpu_commands.h"
    10	#include "intel_ring.h"
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
