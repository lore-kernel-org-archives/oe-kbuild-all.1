Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4248937D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 20:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694637491; x=1726173491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DAaAqoxVrEpWJvwa4m8JINDqPULKAbXPbm9a664XVDk=;
  b=mkPCid7PLd75woT00PdatbMo19wG/kycHMu5iD9syXNyprQkK7SVPxet
   S8s5UxTEtFTCpg3aK9r+cpKrIJqcx1LYQxoY8a4hPqvtarfeplXbK4tAU
   IqX3LcDqWnGGLfecoXsgqiqbhEQXJJ80Y/+isUjZr+iUCZO+uWY0RJlWk
   s9OLwvfpWm4MXb8+kVZkNLVIBiWf9KFQmSkQzXu98EktpzrZFM25+SS79
   iiJNOgAIa7N7oo8we05IGIM2+6ARA1iPVwjF7liCQUhKOmijAGY2XNxXJ
   oGoE43+tsTK8znpTyXOpzQlBaqhW550xpWazrKadNcY1hhG40LWVSF97Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="445214712"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="445214712"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 13:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="693975389"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="693975389"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Sep 2023 13:38:09 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgWch-0000bJ-1W;
	Wed, 13 Sep 2023 20:38:07 +0000
Date: Thu, 14 Sep 2023 04:37:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [frederic-dynticks:rcu/torture 1/8] locktorture.c:undefined
 reference to `torture_sched_setaffinity'
Message-ID: <202309140421.M3ncdosG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/torture
head:   8d86d4452a4cf36af59b79c3f646f5b7ebb823b1
commit: d559059c7e9a825bc42f97f9b89dbfc02c9214f9 [1/8] locktorture: Add readers_bind and writers_bind module parameters
config: nios2-randconfig-001-20230914 (https://download.01.org/0day-ci/archive/20230914/202309140421.M3ncdosG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140421.M3ncdosG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140421.M3ncdosG-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: kernel/locking/locktorture.o: in function `lock_torture_init':
>> locktorture.c:(.init.text+0x4fc): undefined reference to `torture_sched_setaffinity'
   locktorture.c:(.init.text+0x4fc): relocation truncated to fit: R_NIOS2_CALL26 against `torture_sched_setaffinity'
>> nios2-linux-ld: locktorture.c:(.init.text+0x598): undefined reference to `torture_sched_setaffinity'
   locktorture.c:(.init.text+0x598): relocation truncated to fit: R_NIOS2_CALL26 against `torture_sched_setaffinity'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
