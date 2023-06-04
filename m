Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152CC23A5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685898787; x=1717434787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K590VV3LmuuJBsx9zNm0us94QAhGBuRyp81RY9RoIv8=;
  b=Ox/6fIqE/PLhoETCjc7yPyqb5dPLxGleumka0cyqldfsm9FwHBN1/HhU
   LMF7vrgNRyWnqKhw7VFyQw/RU9zzxIPOtNZEkk36bT4HcvKNAq+u79r4q
   A6TF2lPTZBi1XItiNpJFBxDTIo8BJngwa6rXvYFK2VFL257TO7FCGVjZb
   A8J6MGt25e8CPNSvOO5aiqi7cd/Gs/9B6tS/kjqsd763EhvQ0wbPGHSM7
   OqYavOqQ7gNviX/I56oWPZwEA2874Y6FzOTiJoh1+iltaWcGSJ8M7nSdm
   md5EZ7fMJrgdo/Asddkj3tI8SFqIcQh19RZKKenULrkUnj6QvX/eR/xXu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="358655030"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="358655030"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 10:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="685874944"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="685874944"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Jun 2023 10:13:05 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5rHs-0003ER-22;
	Sun, 04 Jun 2023 17:13:04 +0000
Date: Mon, 5 Jun 2023 01:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wtarreau-nolibc:20230604-nolibc-rv32+stkp6 79/118]
 kernel/rcu/tasks.h:1265:21: warning: no previous prototype for
 'get_rcu_tasks_rude_gp_kthread'
Message-ID: <202306050138.4DPEHI1b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git 20230604-nolibc-rv32+stkp6
head:   a76324560e0f8f916d89452dd6aec1104e97a3c6
commit: b58a31cc1eba9ae59a47c986aa91009d27d9dbe6 [79/118] rcuscale: Add RCU Tasks Rude testing
config: microblaze-randconfig-r022-20230604 (https://download.01.org/0day-ci/archive/20230605/202306050138.4DPEHI1b-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git/commit/?id=b58a31cc1eba9ae59a47c986aa91009d27d9dbe6
        git remote add wtarreau-nolibc https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
        git fetch --no-tags wtarreau-nolibc 20230604-nolibc-rv32+stkp6
        git checkout b58a31cc1eba9ae59a47c986aa91009d27d9dbe6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306050138.4DPEHI1b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/update.c:649:
>> kernel/rcu/tasks.h:1265:21: warning: no previous prototype for 'get_rcu_tasks_rude_gp_kthread' [-Wmissing-prototypes]
    1265 | struct task_struct *get_rcu_tasks_rude_gp_kthread(void)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tasks.h:1937:21: warning: no previous prototype for 'get_rcu_tasks_gp_kthread' [-Wmissing-prototypes]
    1937 | struct task_struct *get_rcu_tasks_gp_kthread(void)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tasks.h: In function 'get_rcu_tasks_gp_kthread':
   kernel/rcu/tasks.h:1939:16: error: 'rcu_tasks' undeclared (first use in this function)
    1939 |         return rcu_tasks.kthread_ptr;
         |                ^~~~~~~~~
   kernel/rcu/tasks.h:1939:16: note: each undeclared identifier is reported only once for each function it appears in
   kernel/rcu/tasks.h:1940:1: error: control reaches end of non-void function [-Werror=return-type]
    1940 | }
         | ^
   cc1: some warnings being treated as errors


vim +/get_rcu_tasks_rude_gp_kthread +1265 kernel/rcu/tasks.h

  1264	
> 1265	struct task_struct *get_rcu_tasks_rude_gp_kthread(void)
  1266	{
  1267		return rcu_tasks_rude.kthread_ptr;
  1268	}
  1269	EXPORT_SYMBOL_GPL(get_rcu_tasks_rude_gp_kthread);
  1270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
