Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6436A36E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 05:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674279899; x=1705815899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JPAr5K3HqV01EW8DxLRf1rOfKiklhQvv4QuomZnybgs=;
  b=F6nPX0wTSlg9MdpybpthGkpvbYkG1xz4o2Vh3ju2z7uCtgpYSH0vzC6C
   N30X39CZ5txQCwivtbQF73ZYEpuDcSu7BdTxTOCaF1vmhH6rEfezuS2SJ
   Vfnpldk9uU35M3zox8RWIz3/LN6VdDgI127gwDDYYBuwKaSAERlKK5z4W
   Irn2NcS3sVkJigYbE6KA+KdZsgpzf2fBQPI/USjuBy0E0ZeIHeu3O9KTL
   nuOJqW70iTSDbhO6yY7vWwZXw96trrf/HxUmuYtxUPWC21+uvn6t6cLAr
   eWceud/uoTHCJlewf02oQkxWUXf/S5teVnpjyDhrjtOi949h3pArA24j1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="309336052"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="309336052"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 21:44:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834659714"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="834659714"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Jan 2023 21:44:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ6gR-0003at-3D;
	Sat, 21 Jan 2023 05:44:55 +0000
Date: Sat, 21 Jan 2023 13:44:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/nmitest.2023.01.20a 5/5]
 kernel/rcu/rcutorture.c:3291: undefined reference to `set_nmi_torture'
Message-ID: <202301211331.RMgsACsP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/nmitest.2023.01.20a
head:   53e298568bde2c728ee2aac4ac634cca8550a4b4
commit: 53e298568bde2c728ee2aac4ac634cca8550a4b4 [5/5] rcutorture: Test NMI diagnostics
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230121/202301211331.RMgsACsP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/53e298568bde2c728ee2aac4ac634cca8550a4b4
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/nmitest.2023.01.20a
        git checkout 53e298568bde2c728ee2aac4ac634cca8550a4b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/rcu/rcutorture.o: in function `rcutorture_test_nmis':
>> kernel/rcu/rcutorture.c:3291: undefined reference to `set_nmi_torture'
>> s390-linux-ld: kernel/rcu/rcutorture.c:3303: undefined reference to `set_nmi_torture'


vim +3291 kernel/rcu/rcutorture.c

  3284	
  3285	static void rcutorture_test_nmis(int n)
  3286	{
  3287		int cpu;
  3288		int dumpcpu;
  3289		int i;
  3290	
> 3291		set_nmi_torture(nmi_delay, nmi_halt1, nmi_halt2, nmi_halt3);
  3292		for (i = 0; i < n; i++) {
  3293			preempt_disable();
  3294			cpu = smp_processor_id();
  3295			dumpcpu = cpu + 1;
  3296			if (dumpcpu >= nr_cpu_ids)
  3297				dumpcpu = 0;
  3298			pr_alert("%s: CPU %d invoking dump_cpu_task(%d)\n", __func__, cpu, dumpcpu);
  3299			dump_cpu_task(dumpcpu);
  3300			preempt_enable();
  3301			schedule_timeout_uninterruptible(15 * HZ);
  3302		}
> 3303		set_nmi_torture(0, false, false, false);
  3304	}
  3305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
