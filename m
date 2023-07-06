Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F54B9453
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688658640; x=1720194640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWMkyfakeRwB/SZ6JDQreE3pvO3DpeBVL6rK3NWtM24=;
  b=d0qtRw46PIZwICyeYnKVteAku2H75r7tRO+o5FvTJ6ya7YDo2rdwFT9V
   Bz9i240plKSyDaTPWcUCJtiXRPbtAuEgwCqnL5f40LnrMUbSynV54yLWv
   K2xzLSlCETbK1NoNYmj/myLG4vJ7CIFYTYsgHgAiQBpjpYXe0GnJmpHjT
   JZMDiWXpnts7hd2YzPiEOIDi5REUTQpm/xhZvLmZGzVcMWTfx4DDzBmdd
   9yHbL6DTGW/uZ8S/0paQcpKxLNG9HRHZZFNERjR2u5qsmIL0LJ9MScNcq
   V7CQ4t1F0YAETyTheIEcvznVe+cmTGBMSbeNdPsCZ0tN4pc1nCYkHhMJz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="362507724"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="362507724"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 08:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="754805151"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="754805151"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Jul 2023 08:50:37 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHRFc-0001QM-27;
	Thu, 06 Jul 2023 15:50:36 +0000
Date: Thu, 6 Jul 2023 23:50:25 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: [mips-linux:mips-next 61/63] arch/mips/kvm/stats.c:57:44: error:
 invalid type argument of '->' (have 'struct mips_coproc')
Message-ID: <202307062346.qFQwcnAo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
head:   826eeaf68b03e5b96bdbc11e3e796f8b562bc0e3
commit: e4de2057698636c0ee709e545d19b169d2069fa3 [61/63] MIPS: KVM: Fix NULL pointer dereference
config: mips-randconfig-r003-20230706 (https://download.01.org/0day-ci/archive/20230706/202307062346.qFQwcnAo-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307062346.qFQwcnAo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307062346.qFQwcnAo-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kvm/stats.c: In function 'kvm_mips_dump_stats':
>> arch/mips/kvm/stats.c:57:44: error: invalid type argument of '->' (have 'struct mips_coproc')
      57 |                         if (vcpu->arch.cop0->stat[i][j])
         |                                            ^~
   In file included from include/asm-generic/bug.h:22,
                    from arch/mips/include/asm/bug.h:42,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/mips/kvm/stats.c:12:
   arch/mips/kvm/stats.c:59:57: error: invalid type argument of '->' (have 'struct mips_coproc')
      59 |                                          vcpu->arch.cop0->stat[i][j]);
         |                                                         ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kvm_host.h:814:9: note: in expansion of macro 'pr_info'
     814 |         pr_info("kvm [%i]: " fmt, task_pid_nr(current), ## __VA_ARGS__)
         |         ^~~~~~~
   arch/mips/kvm/stats.c:58:33: note: in expansion of macro 'kvm_info'
      58 |                                 kvm_info("%s[%d]: %lu\n", kvm_cop0_str[i], j,
         |                                 ^~~~~~~~


vim +57 arch/mips/kvm/stats.c

3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  48  
d98403a525fe16 arch/mips/kvm/kvm_mips_stats.c Dengcheng Zhu 2014-06-26  49  void kvm_mips_dump_stats(struct kvm_vcpu *vcpu)
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  50  {
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  51  #ifdef CONFIG_KVM_MIPS_DEBUG_COP0_COUNTERS
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  52  	int i, j;
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  53  
6ad78a5c75c5bc arch/mips/kvm/kvm_mips_stats.c Dengcheng Zhu 2014-06-26  54  	kvm_info("\nKVM VCPU[%d] COP0 Access Profile:\n", vcpu->vcpu_id);
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  55  	for (i = 0; i < N_MIPS_COPROC_REGS; i++) {
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  56  		for (j = 0; j < N_MIPS_COPROC_SEL; j++) {
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21 @57  			if (vcpu->arch.cop0->stat[i][j])

:::::: The code at line 57 was first introduced by commit
:::::: 3c20ef526253da02348ec45768d5a90813577d88 KVM/MIPS32: COP0 accesses profiling.

:::::: TO: Sanjay Lal <sanjayl@kymasys.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
