Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D964253D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685639801; x=1717175801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UlXomx0LpGtimrE1GNCoJHUNdcnqBvFlD2s/tho2i9E=;
  b=WkRvvoRrs3ViDmtDCHwGjPpIlfGGlUFLWRh2sWHyKUh6MFIpNXBJbRTO
   3JtnvnHu+BehZ+PvQKCiMp7GKyEIY39w+rQBpfrRVtCWX/aXvPNEwc5dK
   /n9vRWuQPgBjbAHKB4mkJ9pZFg5gIblZtqc1huW5ktoRJCy+D6liNx90p
   zKIXOFaaih0dUrXDFJcFh7aP3MWUNzXwBy8Lhc9fnBBamneme/g4nQ/4R
   VFv9yPlW+zLogqFlZV/GJNc9kUIeDptDYBvLdiGnQjegd6LW99CK/EHXJ
   rR6Fe2hiCOTK43NpYE8jzpRZhTNmok36De3lKk6yytCzOQEnaQLcv6xhO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335244924"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="335244924"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 10:16:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="1037583743"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="1037583743"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Jun 2023 10:16:33 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4lua-0002WN-2m;
	Thu, 01 Jun 2023 17:16:32 +0000
Date: Fri, 2 Jun 2023 01:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	rcu <rcu@vger.kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
	Neeraj Upadhyay <quic_neeraju@quicinc.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Giovanni Gherdovich <ggherdovich@suse.cz>
Subject: Re: [PATCH 3/9] rcu: Rename jiffies_till_flush to jiffies_lazy_flush
Message-ID: <202306020130.M1c0QAFE-lkp@intel.com>
References: <20230531101736.12981-4-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531101736.12981-4-frederic@kernel.org>

Hi Frederic,

kernel test robot noticed the following build warnings:

[auto build test WARNING on paulmck-rcu/dev]
[also build test WARNING on linus/master v6.4-rc4 next-20230601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frederic-Weisbecker/rcu-Assume-IRQS-disabled-from-rcu_report_dead/20230531-182004
base:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
patch link:    https://lore.kernel.org/r/20230531101736.12981-4-frederic%40kernel.org
patch subject: [PATCH 3/9] rcu: Rename jiffies_till_flush to jiffies_lazy_flush
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230602/202306020130.M1c0QAFE-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c07a1bea9df8b80429d4e24052d83de94f5ee160
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Frederic-Weisbecker/rcu-Assume-IRQS-disabled-from-rcu_report_dead/20230531-182004
        git checkout c07a1bea9df8b80429d4e24052d83de94f5ee160
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020130.M1c0QAFE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:5018:
>> kernel/rcu/tree_nocb.h:271:6: warning: no previous prototype for 'rcu_lazy_set_jiffies_lazy_flush' [-Wmissing-prototypes]
     271 | void rcu_lazy_set_jiffies_lazy_flush(unsigned long jif)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/tree_nocb.h:277:15: warning: no previous prototype for 'rcu_lazy_get_jiffies_lazy_flush' [-Wmissing-prototypes]
     277 | unsigned long rcu_lazy_get_jiffies_lazy_flush(void)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rcu_lazy_set_jiffies_lazy_flush +271 kernel/rcu/tree_nocb.h

   268	
   269	#ifdef CONFIG_RCU_LAZY
   270	// To be called only from test code.
 > 271	void rcu_lazy_set_jiffies_lazy_flush(unsigned long jif)
   272	{
   273		jiffies_lazy_flush = jif;
   274	}
   275	EXPORT_SYMBOL(rcu_lazy_set_jiffies_lazy_flush);
   276	
 > 277	unsigned long rcu_lazy_get_jiffies_lazy_flush(void)
   278	{
   279		return jiffies_lazy_flush;
   280	}
   281	EXPORT_SYMBOL(rcu_lazy_get_jiffies_lazy_flush);
   282	#endif
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
