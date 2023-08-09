Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0D263A2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 07:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691567810; x=1723103810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BM0NuKLGp+bTtLbDhRpaJ1fWlzwsCPu264ztcSxDUNg=;
  b=cbimUjMgiPmZ02l9fR9UcpNmOzzBwONy5slBeFt0yiR0b2eOyNq2WDlO
   cJsGPxsd4v218X3SMdA0sfaDa4sN16/DTfvLx2B4Md2mriZ9n0jqqriTd
   FBE0fetcHdjbJDtlw5MulvhBjItv8j8Ok7uH3oNZDEFVGq5CmGwDEleol
   gHptTeyQT3LJos4BpNWj2HhLuLxwc46YpJ33jCPklrXvnaNBBsaL0j+cs
   Yc8IKMNZxBkqqRbTj6Fh4eKuc1bcJZU8OwBOr7v4n7EqNN/hrVYp+f0UQ
   mEvJ3gJFhyj6tkuZb+YA/hU9+CLksLv5C/nPDFX8tRtd31cBWADcMChvX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="368513523"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="368513523"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 00:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801649172"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="801649172"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Aug 2023 00:55:27 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTe2Q-0005wE-0H;
	Wed, 09 Aug 2023 07:55:26 +0000
Date: Wed, 9 Aug 2023 15:54:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 203/205]
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c:8:10: fatal error:
 intel_execlists_submission.h: No such file or directory
Message-ID: <202308091537.lmaiLGCg-lkp@intel.com>
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
config: i386-randconfig-i013-20230808 (https://download.01.org/0day-ci/archive/20230809/202308091537.lmaiLGCg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091537.lmaiLGCg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091537.lmaiLGCg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/gen8_engine_cs.c:8:10: fatal error: intel_execlists_submission.h: No such file or directory
       8 | #include "intel_execlists_submission.h" /* XXX */
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +8 drivers/gpu/drm/i915/gt/gen8_engine_cs.c

   > 8	#include "intel_execlists_submission.h" /* XXX */
     9	#include "intel_gpu_commands.h"
    10	#include "intel_ring.h"
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
