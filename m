Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1837C12D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 16:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693846349; x=1725382349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zp4H01Fmo9ppHLKAVOcrSmMeONLTbtGMLoaM/R8XghE=;
  b=I9zlfI1SsB6w/cGwsXRS88+CRu6PeqVMK65wii/7XYy6cl38eV2W3KO4
   OqCf5Xf/u+zs9Fjm2W8WqMdPRL/kF4O7zNZFzF78qGXlwSyza2ucHyewV
   13U60YXijaVZ+kgD+FMUgNrNQlEM9MYqOZ4BFyIDMcZ85XOdoRCFhCi/U
   TXkxDIH2eeosX/ioF3ky1cWmF+mVuqdNPsdpEDbt6WVhG4Y3J+LkJ/I4g
   SZh0qFkU74bE7h1Fu4JzoTPytbh+Pwk5Iiy/kFl2J8FhTKamjFtbRMPZl
   S37l6XH4U+Ql/SJBuvYDIUzQoOBzjzzSCU5LtVbMQlHuXLs7uvhR+tb+6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="463006313"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="463006313"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 09:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="810950467"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="810950467"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 04 Sep 2023 09:52:26 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdCoK-0000fW-2V;
	Mon, 04 Sep 2023 16:52:24 +0000
Date: Tue, 5 Sep 2023 00:51:41 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 27/30] arch/x86/kernel/apic/ipi.c:100:6:
 warning: no previous prototype for 'apic_send_nmi_to_offline_cpu'
Message-ID: <202309050026.1vz0jYFf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/microcode
head:   1e0a6155f60f402c59f26124cd743356417e3647
commit: 4577a747b1f101822f4b1b458788bc3a5f1494d4 [27/30] x86/apic: Provide apic_force_nmi_on_cpu()
config: x86_64-buildonly-randconfig-001-20230904 (https://download.01.org/0day-ci/archive/20230905/202309050026.1vz0jYFf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050026.1vz0jYFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050026.1vz0jYFf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/apic/ipi.c:100:6: warning: no previous prototype for 'apic_send_nmi_to_offline_cpu' [-Wmissing-prototypes]
     100 | void apic_send_nmi_to_offline_cpu(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:256,
                    from arch/x86/include/asm/string_64.h:6,
                    from arch/x86/include/asm/string.h:5,
                    from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from arch/x86/kernel/apic/ipi.c:3:
   arch/x86/kernel/apic/ipi.c: In function 'apic_send_nmi_to_offline_cpu':
   arch/x86/kernel/apic/ipi.c:102:31: error: 'struct apic' has no member named 'nmi_to_offline_cpu'
     102 |         if (WARN_ON_ONCE(!apic->nmi_to_offline_cpu))
         |                               ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~


vim +/apic_send_nmi_to_offline_cpu +100 arch/x86/kernel/apic/ipi.c

    99	
 > 100	void apic_send_nmi_to_offline_cpu(unsigned int cpu)
   101	{
   102		if (WARN_ON_ONCE(!apic->nmi_to_offline_cpu))
   103			return;
   104		if (WARN_ON_ONCE(!cpumask_test_cpu(cpu, &cpus_booted_once_mask)))
   105			return;
   106		apic->send_IPI(cpu, NMI_VECTOR);
   107	}
   108	#endif /* CONFIG_SMP */
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
