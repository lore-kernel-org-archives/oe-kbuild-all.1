Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937C6630
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 02:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681440674; x=1712976674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x1A3BsN0bFC7SUhnilXqJPlEVq2j7CwYldJhFwwC6qQ=;
  b=VRXXJn6Mnw722TD0QdGohVArO40Z1DfaE3p9g6Ofk+WTew0gDNJPCMt6
   IBjC7f0h5WcKmcS88hk4iqYmwQZZtFNKFrMa7ShETD7f7cB70aaF+mZ3A
   3i+NK7OzCoIDXoYD6xOX7j5iOygMy4Gi9Y8Q1phL7l9suAnHufgR+lTdG
   +yd+cpwFhxhU42TegoMw9tV95Z6gIViw13lhdxeYuOtpLCdbFJpvBFbhO
   CIIsc7TtCyIXKc7qtjNRy855tPfwlCisgu4qefhIqgwYw6juKv/zzT2oA
   6A8yoLWU6l69h59DlZI2mlYcoBOE5Gsct5cOdxQT0gtGvtFUogvKieYyC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="324722005"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="324722005"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 19:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="1019388195"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="1019388195"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Apr 2023 19:51:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn9Wp-000ZA3-1K;
	Fri, 14 Apr 2023 02:51:11 +0000
Date: Fri, 14 Apr 2023 10:50:56 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [atishp04:cove_integeration_v2 32/50]
 include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of
 type 'long long unsigned int', but argument 3 has type 'phys_addr_t' {aka
 'unsigned int'}
Message-ID: <202304141020.eAYyb9yb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux cove_integeration_v2
head:   94c0fb847a505a21d11c0de2e0acefc2e9965311
commit: e639ffb977b23909f9f5bd25aed7e8c41be39fc4 [32/50] RISC-V: KVM: Add AIA support for TVMs
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230414/202304141020.eAYyb9yb-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/e639ffb977b23909f9f5bd25aed7e8c41be39fc4
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 cove_integeration_v2
        git checkout e639ffb977b23909f9f5bd25aed7e8c41be39fc4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141020.eAYyb9yb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from arch/riscv/kvm/aia.c:11:
   arch/riscv/kvm/aia.c: In function 'kvm_riscv_aia_alloc_hgei':
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:498:16: note: in expansion of macro 'KERN_ERR'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   include/linux/kvm_host.h:811:9: note: in expansion of macro 'pr_err'
     811 |         pr_err("kvm [%i]: " fmt, task_pid_nr(current), ## __VA_ARGS__)
         |         ^~~~~~
   arch/riscv/kvm/aia.c:447:33: note: in expansion of macro 'kvm_err'
     447 |                                 kvm_err("Reclaim of imsic pa [%llx] failed for vcpu %d pcpu %d ret %d\n",
         |                                 ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
