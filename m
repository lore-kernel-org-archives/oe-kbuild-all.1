Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7C4156D0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 13:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688132850; x=1719668850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n8Fz8lhOgYgYrvlf7VbnQJ26Pc+M6vTlGmcTtuem8qo=;
  b=CLvtM8YAu+3rrgyAmrDCdeZRWMfDFX71QvL+IaESkzoSWjvgV9eyrOE6
   VkM/igWEWS00s6rUP95VgUM+vl0/icWUnbfzXA0z7I4NWmT42piscH19N
   Z1mPBo/9CI9KJI6oeoePoEvpWIbQcz2eqvz+9DWnDWXV+l1mMZFNdMXCM
   t5xv3mDCxu3TtTTAtDaMFE07pXYguWr6RzOi5+vy1ubG77MG+eh34o1uG
   tkXVmuho6kC+THk0ZYyavTWUx6W+S4sGiPc13EO53/FdKGm7Hrr/mTkO4
   c73w8tu6zuDsDsQvpdWeZLkarapbIHZRS/FbQPsfq45K65CfyERVBaF6w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="352217781"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="352217781"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 06:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="783083986"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="783083986"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jun 2023 06:47:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFET9-000F08-0X;
	Fri, 30 Jun 2023 13:47:27 +0000
Date: Fri, 30 Jun 2023 21:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 21099/29940]
 arm-linux-gnueabi-gcc: error: unrecognized command line option
 '-ftrivial-auto-var-init=pattern'
Message-ID: <202306302111.7mpfdTdP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi glider,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   e8c1340cbb0f24693dd9056f8d5a7808e4597b80
commit: a7eda6eddca559c1c3a897a35692f9d49d46c9dd [21099/29940] BACKPORT: security: allow using Clang's zero initialization for stack variables
config: arm-randconfig-r046-20230629 (https://download.01.org/0day-ci/archive/20230630/202306302111.7mpfdTdP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302111.7mpfdTdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302111.7mpfdTdP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-gcc: error: unrecognized command line option '-ftrivial-auto-var-init=pattern'
   make[2]: *** [./Kbuild:22: kernel/bounds.s] Error 1 shuffle=2767728755
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1214: prepare0] Error 2 shuffle=2767728755
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:146: sub-make] Error 2 shuffle=2767728755
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
