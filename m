Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC733C950
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679677590; x=1711213590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c0gLYvJRFgVZenePCU05K9Aknnits9zqz23A+CgttHo=;
  b=UGAyYYlMvC3SeNj+5f5irq05RC2cQVYIZU7DmsMMyqm36xqNJy6rDBdG
   3y6bkrVwK1jQqDdC+Wjg7iDKUFlEqVM+vhvmvQlFh0sISbFQzXXcl2U5V
   uyxgbTYWTBld7Xj1Z6quNLFQrfJ4Qfr/iXleQ7H+FpUObSIO1CgNJGsfY
   WHGM12fckze1IR2gWBIKJ+cwkds0MueA/wTDRCmXZYHk+UwLe5UCYQWRT
   0G1o0OWiHGd9zhIImxiURKATWHLZYBVumF1Is7l/zgGTjJiTBiASbjHiQ
   kg94pk51qSshfG6oShwVSAM0qzPbRevdG/8+8d7HvoO4iffq0Rpag4ps0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="337334748"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="337334748"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 10:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="1012343602"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="1012343602"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2023 10:06:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfkrw-000FUn-36;
	Fri, 24 Mar 2023 17:06:24 +0000
Date: Sat, 25 Mar 2023 01:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 5681/9072] kernel/sched/pelt.c:477:5:
 sparse: sparse: symbol 'sched_pelt_multiplier' was not declared. Should it
 be static?
Message-ID: <202303250113.2jgc42p6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   993b35e7e82fc3dd1fc7436b7aef6318778ae313
commit: 0baa11384bf87212556a5cdce26a471ccadd11c7 [5681/9072] FROMLIST: sched/pelt: Introduce PELT multiplier
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230325/202303250113.2jgc42p6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 0baa11384bf87212556a5cdce26a471ccadd11c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250113.2jgc42p6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:963:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:963:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:963:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2508:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2508:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2508:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1056:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1056:38: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1056:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1624:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1624:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1624:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2023:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:2023:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:2023:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1679:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1679:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1679:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1757:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1757:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1757:45: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1822:67: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1822:67: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1822:67: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2187:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2187:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2187:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2208:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2208:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2208:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2559:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2559:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2559:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2561:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2561:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2561:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2561:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2561:61: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2561:61: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/pelt.c:477:5: sparse: sparse: symbol 'sched_pelt_multiplier' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2315:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2315:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2315:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2325:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2325:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2325:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2433:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2433:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2433:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1954:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1954:42: sparse:     expected struct sched_dl_entity *b
   kernel/sched/deadline.c:1954:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1965:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1965:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:1965:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1182:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1182:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1182:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1309:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1309:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1309:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2174:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2174:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2174:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:1839:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1839:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1839:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1915:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1915:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1915:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2478:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2478:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2478:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2480:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2480:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2480:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2482:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2482:44: sparse:     expected struct sched_dl_entity *b
   kernel/sched/deadline.c:2482:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2646:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2646:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2646:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *

vim +/sched_pelt_multiplier +477 kernel/sched/pelt.c

   476	
 > 477	int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
   478				  size_t *lenp, loff_t *ppos)
   479	{
   480		static DEFINE_MUTEX(mutex);
   481		unsigned int old;
   482		int ret;
   483	
   484		mutex_lock(&mutex);
   485		old = sysctl_sched_pelt_multiplier;
   486		ret = proc_dointvec(table, write, buffer, lenp, ppos);
   487		if (ret)
   488			goto undo;
   489		if (!write)
   490			goto done;
   491	
   492		switch (sysctl_sched_pelt_multiplier)  {
   493		case 1:
   494			fallthrough;
   495		case 2:
   496			fallthrough;
   497		case 4:
   498			WRITE_ONCE(sched_pelt_lshift,
   499				   sysctl_sched_pelt_multiplier >> 1);
   500			goto done;
   501		default:
   502			ret = -EINVAL;
   503		}
   504	
   505	undo:
   506		sysctl_sched_pelt_multiplier = old;
   507	done:
   508		mutex_unlock(&mutex);
   509	
   510		return ret;
   511	}
   512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
