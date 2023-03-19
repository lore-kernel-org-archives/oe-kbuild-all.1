Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AA4EA9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 06:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679206445; x=1710742445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WsegnY2Q+/AfP5PguuD/SZz5ggrTG+4NOdqfFsl7Cpg=;
  b=DOv5nXgVIZGPmSONk2zK3nJk6mGo7dNOHlXk7I4kiwEN0GVDZ+tt7XCW
   CGC5NJ2/9/RAfqfCzSjsORXEbdoX0mEpO67Y9b+nPFo1cm/B/KCb0sYyi
   5gQlk0pupbPZhpvl3bp6jCqI1uZgrOq9ib3sg0S29PnOmT0vkjUdN2ZMc
   0F6ItZVPGNRCnaWnya3UXItBAbhxpMng/gkpdIFjqYFD3ywYsC5NVQy91
   Jr1Hct/TKTreZT+WhkPjHSLK9Hx/nyVeeXJ4lHABHUFdraFnwpcpVCZrv
   ghAqZsyPeEEXOrXWWPRGcjx8RfBw4MnLvm5cRddujQVe52xQYL9Yx/iHO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="366193756"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="366193756"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 23:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="769828057"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="769828057"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2023 23:14:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdmIs-000AQc-0A;
	Sun, 19 Mar 2023 06:14:02 +0000
Date: Sun, 19 Mar 2023 14:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2023.03.17a 33/38] kernel/rcu/srcutree.c:1872:29:
 warning: variable 'ssp' set but not used
Message-ID: <202303191400.iO5BOqka-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.03.17a
head:   19d218a4b125a4dce12eb88097a9c55f7126ce8c
commit: 61eea4556e8cf92d4c9b483110a679d2652aa451 [33/38] srcu: Move work-scheduling fields from srcu_struct to srcu_usage
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230319/202303191400.iO5BOqka-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=61eea4556e8cf92d4c9b483110a679d2652aa451
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu dev.2023.03.17a
        git checkout 61eea4556e8cf92d4c9b483110a679d2652aa451
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash kernel/rcu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191400.iO5BOqka-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/rcu/srcutree.c: In function 'srcu_init':
>> kernel/rcu/srcutree.c:1872:29: warning: variable 'ssp' set but not used [-Wunused-but-set-variable]
    1872 |         struct srcu_struct *ssp;
         |                             ^~~


vim +/ssp +1872 kernel/rcu/srcutree.c

e0fcba9ac02af5 Paul E. McKenney    2018-08-14  1869  
e0fcba9ac02af5 Paul E. McKenney    2018-08-14  1870  void __init srcu_init(void)
e0fcba9ac02af5 Paul E. McKenney    2018-08-14  1871  {
aacb5d91ab1bfb Paul E. McKenney    2018-10-28 @1872  	struct srcu_struct *ssp;
61eea4556e8cf9 Paul E. McKenney    2023-03-17  1873  	struct srcu_usage *sup;
e0fcba9ac02af5 Paul E. McKenney    2018-08-14  1874  
a57ffb3c6b67e5 Paul E. McKenney    2022-01-31  1875  	/* Decide on srcu_struct-size strategy. */
a57ffb3c6b67e5 Paul E. McKenney    2022-01-31  1876  	if (SRCU_SIZING_IS(SRCU_SIZING_AUTO)) {
a57ffb3c6b67e5 Paul E. McKenney    2022-01-31  1877  		if (nr_cpu_ids >= big_cpu_lim) {
a57ffb3c6b67e5 Paul E. McKenney    2022-01-31  1878  			convert_to_big = SRCU_SIZING_INIT; // Don't bother waiting for contention.
a57ffb3c6b67e5 Paul E. McKenney    2022-01-31  1879  			pr_info("%s: Setting srcu_struct sizes to big.\n", __func__);
a57ffb3c6b67e5 Paul E. McKenney    2022-01-31  1880  		} else {
a57ffb3c6b67e5 Paul E. McKenney    2022-01-31  1881  			convert_to_big = SRCU_SIZING_NONE | SRCU_SIZING_CONTEND;
a57ffb3c6b67e5 Paul E. McKenney    2022-01-31  1882  			pr_info("%s: Setting srcu_struct sizes based on contention.\n", __func__);
a57ffb3c6b67e5 Paul E. McKenney    2022-01-31  1883  		}
a57ffb3c6b67e5 Paul E. McKenney    2022-01-31  1884  	}
a57ffb3c6b67e5 Paul E. McKenney    2022-01-31  1885  
8e9c01c717df7e Frederic Weisbecker 2021-04-09  1886  	/*
8e9c01c717df7e Frederic Weisbecker 2021-04-09  1887  	 * Once that is set, call_srcu() can follow the normal path and
8e9c01c717df7e Frederic Weisbecker 2021-04-09  1888  	 * queue delayed work. This must follow RCU workqueues creation
8e9c01c717df7e Frederic Weisbecker 2021-04-09  1889  	 * and timers initialization.
8e9c01c717df7e Frederic Weisbecker 2021-04-09  1890  	 */
e0fcba9ac02af5 Paul E. McKenney    2018-08-14  1891  	srcu_init_done = true;
e0fcba9ac02af5 Paul E. McKenney    2018-08-14  1892  	while (!list_empty(&srcu_boot_list)) {
61eea4556e8cf9 Paul E. McKenney    2023-03-17  1893  		sup = list_first_entry(&srcu_boot_list, struct srcu_usage,
4e6ea4ef56f942 Paul E. McKenney    2018-08-14  1894  				      work.work.entry);
61eea4556e8cf9 Paul E. McKenney    2023-03-17  1895  		ssp = sup->srcu_ssp;
61eea4556e8cf9 Paul E. McKenney    2023-03-17  1896  		list_del_init(&sup->work.work.entry);
4773cc9d1ce89d Paul E. McKenney    2023-03-17  1897  		if (SRCU_SIZING_IS(SRCU_SIZING_INIT) &&
61eea4556e8cf9 Paul E. McKenney    2023-03-17  1898  		    sup->srcu_size_state == SRCU_SIZE_SMALL)
61eea4556e8cf9 Paul E. McKenney    2023-03-17  1899  			sup->srcu_size_state = SRCU_SIZE_ALLOC;
61eea4556e8cf9 Paul E. McKenney    2023-03-17  1900  		queue_work(rcu_gp_wq, &sup->work.work);
e0fcba9ac02af5 Paul E. McKenney    2018-08-14  1901  	}
e0fcba9ac02af5 Paul E. McKenney    2018-08-14  1902  }
fe15b50cdeeebd Paul E. McKenney    2019-04-05  1903  

:::::: The code at line 1872 was first introduced by commit
:::::: aacb5d91ab1bfbb0e8123da59a2e333d52ba7f60 srcu: Use "ssp" instead of "sp" for srcu_struct pointer

:::::: TO: Paul E. McKenney <paulmck@linux.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
