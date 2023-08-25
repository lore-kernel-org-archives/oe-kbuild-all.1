Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086F3621
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 01:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692927508; x=1724463508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vc6TkaWfp3nBmpyCAq/GphRhzUTE2siTllpHUm74Wco=;
  b=ReoRrn/00JnzI7+1w9d8YkCcv6F87uC5LMJ41Sy3Oh7QMPg4/LdNbmav
   UhvkSSJJ5ZUEwIUkgriiZqoePUYqcm3CYuqerBkmP3+KeNqg5nXdOwiQf
   awpz7GGvob+2C2taQgHxDW5Z1e7xYqFI18+KeumNL+qCUmEMWcmHdNB3z
   CTUBTHySf5pnnrgPt7Tk9pDobd61KpnL4XgqOI2PF9r17UYo+djqIrRMz
   0dnCnkKhOLw8tLsg/1IKKL64JaWwVHPfi32/+o88RirrHqWVeaixx5I4h
   F1Wf+IFaFi1wb5flXbgWFbsVPNqZ2mmrQqRaRX/PaPRs93PKPWshYLzLD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="438548804"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="438548804"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 18:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="827406098"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="827406098"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Aug 2023 18:38:19 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZLmB-00037A-36;
	Fri, 25 Aug 2023 01:38:17 +0000
Date: Fri, 25 Aug 2023 09:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2023.08.22a 61/69]
 kernel/locking/locktorture.c:279:13: warning: no previous prototype for
 'spinlock_dump'
Message-ID: <202308250944.F8nVkKh9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.08.22a
head:   354957ec11dc80eac68c4b1e10c237d69adc1833
commit: bdd8d60bd4047aa4a7dc207789dc4ad0dfd5f07e [61/69] EXP qspinlock: Dump lock state, add call from locktorture
config: arm-randconfig-r031-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250944.F8nVkKh9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250944.F8nVkKh9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250944.F8nVkKh9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/locktorture.c:279:13: warning: no previous prototype for 'spinlock_dump' [-Wmissing-prototypes]
     279 | void __weak spinlock_dump(spinlock_t *sp, bool full)
         |             ^~~~~~~~~~~~~


vim +/spinlock_dump +279 kernel/locking/locktorture.c

   278	
 > 279	void __weak spinlock_dump(spinlock_t *sp, bool full)
   280	{
   281		pr_alert("%s __weak stub invoked.\n", __func__);
   282	}
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
