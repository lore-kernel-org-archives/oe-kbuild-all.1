Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3983D20E8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689342999; x=1720878999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1py2PaNx1RRwM8CX4hVtIenmtZ0piDjDFslR4tyDf/k=;
  b=W687ee11K0O9VrQRocyvgQLPwaWovJKF6r+dHmapBpGk5dSs/4LvwZG2
   rLLSOH+swVnW45km1xL7b9e2yFN2wHo6phSA9JJ1Nl+R/VbCrfGWOYmcp
   v/jXeSGJX1y15LKNnn7RtXQeBGGLQRkfRCv28E1ypNhHFbK2IjCu/Hkgh
   FdyP1SOtiBBfHTzXez/QZwgnA7HLyDjCUK0U3VNXZeakbarHzQ6Lt26Z/
   dxORUHUYTnR8xY9unK45Iv7ha3PpL8TH+LRuJJmMiWAdVXmmyop9eO3lD
   3GdOLaN9nG9NUFitmtXV3+bQq7hFyP9wsCot0eeH25AJbxILP6grirH5K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="364350988"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="364350988"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 06:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="752047315"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="752047315"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Jul 2023 06:56:37 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKJHg-0007Ub-1X;
	Fri, 14 Jul 2023 13:56:36 +0000
Date: Fri, 14 Jul 2023 21:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ulfh-pm:genpd_create_dir 12/18] scripts/Makefile.build:41:
 drivers/soc/starfive/Makefile: No such file or directory
Message-ID: <202307142126.eXh2qgOo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git genpd_create_dir
head:   b43f11e5b453a9c48159d7121c88d79d81901276
commit: f3fb16291f48638e9eda4f249970d34061906ba3 [12/18] soc: starfive: Move the power-domain driver to the genpd dir
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230714/202307142126.eXh2qgOo-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142126.eXh2qgOo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307142126.eXh2qgOo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/Makefile.build:41: drivers/soc/starfive/Makefile: No such file or directory
>> make[6]: *** No rule to make target 'drivers/soc/starfive/Makefile'.
   scripts/Makefile.build:41: Failed to remake makefile 'drivers/soc/starfive/Makefile'.


vim +41 scripts/Makefile.build

^1da177e4c3f41 Linus Torvalds  2005-04-16  38  
3204a7fb98a3bc Masahiro Yamada 2021-02-28  39  include $(srctree)/scripts/Kbuild.include
57fd251c789647 Masahiro Yamada 2021-02-28  40  include $(srctree)/scripts/Makefile.compiler
a2430b25c31840 Masahiro Yamada 2022-11-19 @41  include $(kbuild-file)
3204a7fb98a3bc Masahiro Yamada 2021-02-28  42  include $(srctree)/scripts/Makefile.lib
^1da177e4c3f41 Linus Torvalds  2005-04-16  43  

:::::: The code at line 41 was first introduced by commit
:::::: a2430b25c31840a6dcbf95c65415d5fee2984dbc kbuild: add kbuild-file macro

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
