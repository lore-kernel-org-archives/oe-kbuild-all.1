Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06170C8EE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 05:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694584206; x=1726120206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RtN0inprACrBGB3TzfvZhkNX3htDZ9aMSFqyFgjn4RY=;
  b=DMYkTO7+WDR8vVOMPEetJTGXKE234wNY1Fd5ij1IBdtP09uRSaEzjn1x
   Xq9hJZRamzMqzredGglrTwRdkQRECbmHR1Ztfrol/2+U5Wb4j2iJ3nHev
   lSIF3A19Lm35ExerLSubS3WFrOVXKLmbNo78yTGbMxofjC3JwVW+cRnoC
   oojqDAFifiYVkEZcux07Qa6fdwD88A5l8Jujb5lHk+l6oKX1JUVpMpoLy
   zJSV3KSzzamw6vktQzZcp5ni3M542p2Gx5e7iBVW6Qfky02PdH2Q3X5+Q
   DEO3hzX29lsShQlCSE2ryIo2f8NEyzOA+eqjeei/IrXpmAlrIWrfngAFq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464940880"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="464940880"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 22:50:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="867639475"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="867639475"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Sep 2023 22:50:03 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgIlE-00005t-2i;
	Wed, 13 Sep 2023 05:50:00 +0000
Date: Wed, 13 Sep 2023 13:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: ERROR: start_text address is c000000000000700, should be
 c000000000000100
Message-ID: <202309131336.uIwzjLmq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3669558bdf354cd352be955ef2764cde6a9bf5ec
commit: 5750121ae7382ebac8d47ce6d68012d6cd1d7926 kbuild: list sub-directories in ./Kbuild
date:   12 months ago
config: powerpc64-randconfig-r006-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131336.uIwzjLmq-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131336.uIwzjLmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131336.uIwzjLmq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: start_text address is c000000000000700, should be c000000000000100
   ERROR: try to enable LD_HEAD_STUB_CATCH config option
   ERROR: see comments in arch/powerpc/tools/head_check.sh

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
