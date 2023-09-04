Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AB6C2DA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 18:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693853189; x=1725389189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/R5H7mY/PpRl6T61Fmq7J2SUXSLUvMZVFvERIW0KO0=;
  b=iwL4048NYHZs/aryz1Iu3oWTGGXiz/n17bVsEyHxPz4NCIM5b6xW5ZnF
   sVWpVg+qr7uWVoA4cG4JTqX3ll7RzTLpt1glbJ/0fosvx2Em/paMyTjvj
   B/27iDdF7BDyfS5M4pdh3TfCgj/jZRU+ja9dxyRzgcrooMVbu+DfZgnZ0
   a0hwfY1QMbYsF8KRKfdVt78KxVbys0xnY/z2FW4+qNdU2OLg6xPAfD1y6
   Q5hlvvZq0NShMompv3c/dH8FXDx5byBHBH3sgUHhUEqhE20srz1W/yX+g
   U9diGw1/Qk6voCdZdN9yRLannzrAPggVp+Pl/xFala9hv/ccnkjQotYvt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="375536756"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="375536756"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 11:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="914582164"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="914582164"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Sep 2023 11:46:27 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdEac-0000kv-26;
	Mon, 04 Sep 2023 18:46:23 +0000
Date: Tue, 5 Sep 2023 02:46:00 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 27/30] arch/x86/kernel/apic/ipi.c:102:31:
 error: 'struct apic' has no member named 'nmi_to_offline_cpu'
Message-ID: <202309050201.QVK10rak-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230905/202309050201.QVK10rak-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050201.QVK10rak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050201.QVK10rak-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/apic/ipi.c:100:6: warning: no previous prototype for 'apic_send_nmi_to_offline_cpu' [-Wmissing-prototypes]
     100 | void apic_send_nmi_to_offline_cpu(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/cpumask.h:14,
                    from arch/x86/kernel/apic/ipi.c:3:
   arch/x86/kernel/apic/ipi.c: In function 'apic_send_nmi_to_offline_cpu':
>> arch/x86/kernel/apic/ipi.c:102:31: error: 'struct apic' has no member named 'nmi_to_offline_cpu'
     102 |         if (WARN_ON_ONCE(!apic->nmi_to_offline_cpu))
         |                               ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
--
>> arch/x86/kernel/apic/apic_flat_64.c:106:10: error: 'struct apic' has no member named 'nmi_to_offline_cpu'
     106 |         .nmi_to_offline_cpu             = true,
         |          ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/apic/apic_flat_64.c:106:43: warning: implicit conversion from 'enum <anonymous>' to 'enum apic_delivery_modes' [-Wenum-conversion]
     106 |         .nmi_to_offline_cpu             = true,
         |                                           ^~~~
   arch/x86/kernel/apic/apic_flat_64.c:106:43: warning: initialized field overwritten [-Woverride-init]
   arch/x86/kernel/apic/apic_flat_64.c:106:43: note: (near initialization for 'apic_flat.delivery_mode')
   arch/x86/kernel/apic/apic_flat_64.c:179:10: error: 'struct apic' has no member named 'nmi_to_offline_cpu'
     179 |         .nmi_to_offline_cpu             = true,
         |          ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/apic/apic_flat_64.c:179:43: warning: implicit conversion from 'enum <anonymous>' to 'enum apic_delivery_modes' [-Wenum-conversion]
     179 |         .nmi_to_offline_cpu             = true,
         |                                           ^~~~
   arch/x86/kernel/apic/apic_flat_64.c:179:43: warning: initialized field overwritten [-Woverride-init]
   arch/x86/kernel/apic/apic_flat_64.c:179:43: note: (near initialization for 'apic_physflat.delivery_mode')


vim +102 arch/x86/kernel/apic/ipi.c

    99	
   100	void apic_send_nmi_to_offline_cpu(unsigned int cpu)
   101	{
 > 102		if (WARN_ON_ONCE(!apic->nmi_to_offline_cpu))
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
