Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D340F290F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678179539; x=1709715539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/wf8z0Kswyh7nBh4MC+8CEwmph1jrOImKF0o+pjSHig=;
  b=BnRXO3p2i7dVZfadbIB9wsf/YS0uKiM+zI3edktM44nx+Z+E7xs0utdT
   Jx/IqbEsuRs0SnelMts7UvQTpoGPMFQDn0wHbTPxvA3SjBJbcxmLsQd9d
   NfNoykovNbdogdo9dUnvyDZuW+ps4uwlwW2NkNuy2zZs4585awWbLYXf8
   eEHaF57P1U7zpnUawamWAERm9TN8rpYsz/yPaxcWeS5zW1V0VKdvr6qe0
   h/tE6nX1VAIC4ts0XFZAhty0XVPEyaGQoyWpaxsZCDL3vRWYVaarShAu/
   e5nkAzl1vpcZlfPPjU3Hr2u/qc4vWz6INljc29Bq43bC0xZ2btlagZ//G
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400624111"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="400624111"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 00:58:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="626464656"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="626464656"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Mar 2023 00:58:58 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZT9t-00019P-1b;
	Tue, 07 Mar 2023 08:58:57 +0000
Date: Tue, 7 Mar 2023 16:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.03.06a 112/116]
 arch/x86/kernel/nmi.c:441:6: warning: no previous prototype for
 'set_nmi_torture'
Message-ID: <202303071604.o6pvgZPl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2023.03.06a
head:   b5f34f7f546f7746ed4ca21da873aea5f408f295
commit: f8aba137fc5e5471910a5fcb5af74776b88d1070 [112/116] x86/nmi: Add a set_nmi_torture() function to control NMI testing
config: x86_64-randconfig-r002-20230306 (https://download.01.org/0day-ci/archive/20230307/202303071604.o6pvgZPl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/f8aba137fc5e5471910a5fcb5af74776b88d1070
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2023.03.06a
        git checkout f8aba137fc5e5471910a5fcb5af74776b88d1070
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071604.o6pvgZPl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/nmi.c:441:6: warning: no previous prototype for 'set_nmi_torture' [-Wmissing-prototypes]
     441 | void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
         |      ^~~~~~~~~~~~~~~


vim +/set_nmi_torture +441 arch/x86/kernel/nmi.c

   439	
   440	/* Set the test values as desired. */
 > 441	void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
   442	{
   443		WRITE_ONCE(nmi_delay, nmi_delay_in);
   444		WRITE_ONCE(nmi_halt1, nmi_halt1_in);
   445		WRITE_ONCE(nmi_halt2, nmi_halt2_in);
   446		WRITE_ONCE(nmi_halt3, nmi_halt3_in);
   447		pr_info("%s: Set NMI test parameters nmi_delay=%d nmi_halt1=%d nmi_halt2=%d nmi_halt3=%d\n",
   448			__func__, nmi_delay, nmi_halt1, nmi_halt2, nmi_halt3);
   449	}
   450	EXPORT_SYMBOL_GPL(set_nmi_torture);
   451	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
