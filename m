Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01B4C5F2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676404162; x=1707940162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RTf4aQSzU+TBu8+dYzCEsHyxvjMa4wlbBjnsQNSWxYY=;
  b=Cgh2sGiF+LBHNZEi2O/Q9w3YfIuIxdqTNhpHohHpsgQn2jCuRWT/m0kz
   UVMEJQTyDen2NDBli2rBM1n1WV3bAIvRfVhSXBvDNshHZUamO510c/2bn
   7H7bHjY/TEpKnn8dWnbPUnmjY7Vm0qwO7e2JVGhuk5NQukHwt7POsKyCg
   lnqRSO/a5Skm+vXoxyYPkGjf84p0acoKosQCiutSN2dDO358i9PGxHi5B
   MGjlrlLXOSt2R9Rn6jBLYRg6abR4RZCbF2o/2bFrRB+EsgFWi/GyVXuHX
   kkdGdYoYQhxoQ9TQ/mYD3vZHlQYjmIUflJmXixOaMoiQu5xcGugp9sL/l
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="311614751"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="311614751"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 11:49:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="778489705"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="778489705"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Feb 2023 11:49:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS1Im-0008kv-1H;
	Tue, 14 Feb 2023 19:49:20 +0000
Date: Wed, 15 Feb 2023 03:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.1/prjc-test 284/377] kernel/sched/alt_debug.c:23:6: warning:
 no previous prototype for function 'proc_sched_show_task'
Message-ID: <202302150306.KS5CZW3r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.1/prjc-test
head:   9f1d88c71fdf107b93a41d224d630b4dcd5f54a6
commit: a9a7c3ea10ad1e83f4f64714235401ac4861dbfd [284/377] sched/alt: Headers cleanup
config: i386-randconfig-a003-20230213 (https://download.01.org/0day-ci/archive/20230215/202302150306.KS5CZW3r-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/a9a7c3ea10ad1e83f4f64714235401ac4861dbfd
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.1/prjc-test
        git checkout a9a7c3ea10ad1e83f4f64714235401ac4861dbfd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302150306.KS5CZW3r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/alt_debug.c:23:6: warning: no previous prototype for function 'proc_sched_show_task' [-Wmissing-prototypes]
   void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
        ^
   kernel/sched/alt_debug.c:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
   ^
   static 
>> kernel/sched/alt_debug.c:30:6: warning: no previous prototype for function 'proc_sched_set_task' [-Wmissing-prototypes]
   void proc_sched_set_task(struct task_struct *p)
        ^
   kernel/sched/alt_debug.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void proc_sched_set_task(struct task_struct *p)
   ^
   static 
   2 warnings generated.


vim +/proc_sched_show_task +23 kernel/sched/alt_debug.c

570d4c77574657 Alfred Chen 2019-08-19  10  
570d4c77574657 Alfred Chen 2019-08-19  11  /*
570d4c77574657 Alfred Chen 2019-08-19  12   * This allows printing both to /proc/sched_debug and
570d4c77574657 Alfred Chen 2019-08-19  13   * to the console
570d4c77574657 Alfred Chen 2019-08-19  14   */
570d4c77574657 Alfred Chen 2019-08-19  15  #define SEQ_printf(m, x...)			\
570d4c77574657 Alfred Chen 2019-08-19  16   do {						\
570d4c77574657 Alfred Chen 2019-08-19  17  	if (m)					\
570d4c77574657 Alfred Chen 2019-08-19  18  		seq_printf(m, x);		\
570d4c77574657 Alfred Chen 2019-08-19  19  	else					\
570d4c77574657 Alfred Chen 2019-08-19  20  		pr_cont(x);			\
570d4c77574657 Alfred Chen 2019-08-19  21   } while (0)
570d4c77574657 Alfred Chen 2019-08-19  22  
570d4c77574657 Alfred Chen 2019-08-19 @23  void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
570d4c77574657 Alfred Chen 2019-08-19  24  			  struct seq_file *m)
570d4c77574657 Alfred Chen 2019-08-19  25  {
570d4c77574657 Alfred Chen 2019-08-19  26  	SEQ_printf(m, "%s (%d, #threads: %d)\n", p->comm, task_pid_nr_ns(p, ns),
570d4c77574657 Alfred Chen 2019-08-19  27  						get_nr_threads(p));
570d4c77574657 Alfred Chen 2019-08-19  28  }
570d4c77574657 Alfred Chen 2019-08-19  29  
570d4c77574657 Alfred Chen 2019-08-19 @30  void proc_sched_set_task(struct task_struct *p)

:::::: The code at line 23 was first introduced by commit
:::::: 570d4c77574657dc1df2ca8c54e6b4407de76fd5 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
