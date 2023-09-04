Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6336B3D8B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693846951; x=1725382951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K0EeoyNy2zX5O6FUXtxh2cHgZm5MCEtaYpOtSgLT4Yc=;
  b=V8tZpOeHyvNxYodJnFH+Une+QUDNdPA5q0lStHdKgOypX/3eoDvT3UjN
   k8cc4qgOkGE3Hf1f4V1EE8F2DUnjzCgTs0jwGO0HjTvfzsNi76UuvbKCf
   sy08oCs9WoOIbL2zAXrb+3LdPqhcCC+HnuiFd+s3VyBeYM+ixq5wLkWlQ
   QTFettYdOhkLGEKUMjum/gftYROJJGN645lpeUxZMfHmcEYkInTNN85Bv
   aehtSMzPgvlqiqQuo/a1tbqwnbNLsSkyRmB04LxKhiRVwx66/7p8pnZxu
   45dAwartT0fAqZ9j4GTw+4Ele6a3/lbuNNu86qj4I0FlBIYuYWOLK0DAY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356947931"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="356947931"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 10:02:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="806323304"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="806323304"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2023 10:02:28 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdCy1-0000gD-3A;
	Mon, 04 Sep 2023 17:02:25 +0000
Date: Tue, 5 Sep 2023 01:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 27/30] arch/x86/kernel/apic/ipi.c:100:6:
 warning: no previous declaration for 'apic_send_nmi_to_offline_cpu'
Message-ID: <202309050002.9c8NQ0K7-lkp@intel.com>
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
config: x86_64-randconfig-011-20230904 (https://download.01.org/0day-ci/archive/20230905/202309050002.9c8NQ0K7-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050002.9c8NQ0K7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050002.9c8NQ0K7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/apic/ipi.c:100:6: warning: no previous declaration for 'apic_send_nmi_to_offline_cpu' [-Wmissing-declarations]
    void apic_send_nmi_to_offline_cpu(unsigned int cpu)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/bug.h:87:0,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from arch/x86/kernel/apic/ipi.c:3:
   arch/x86/kernel/apic/ipi.c: In function 'apic_send_nmi_to_offline_cpu':
   arch/x86/kernel/apic/ipi.c:102:24: error: 'struct apic' has no member named 'nmi_to_offline_cpu'
     if (WARN_ON_ONCE(!apic->nmi_to_offline_cpu))
                           ^
   include/asm-generic/bug.h:111:25: note: in definition of macro 'WARN_ON_ONCE'
     int __ret_warn_on = !!(condition);   \
                            ^~~~~~~~~


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
