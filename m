Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0364291D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 20:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689451570; x=1720987570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kYezDaq07DFKiN+XxyqftV8HXxxN8rxz++vZdqeAVrI=;
  b=RjUFfp4yQlV6MkQRLvPvpqO5RQbNCF6R9y1kUKOPJTz1i69dtcUHTphg
   8yJePT5Jzn/6T7TvGAuzjFFvo4SDAYGK51Npd4xii+BzRVNkZnlanyLgf
   TSflj0plzPId2vkWMr3oYsm2118mugRx0xF+WQZuv6e2JyWgm9MmAa/qR
   1458puzKATpNoYFz+vWydeMMmDh8814fUh9tR6iqDi85pjXNl9wyTWPHr
   vuLpzqk+zlvrcNs0U/FOuGBeAZgUVFNGfwbBgO3Jm3dGb7ZeVkcHYS+/y
   NI08/797x1446OjhF9esbu3WwdfgwpPdxeXuMYHre6OSwsKkdJ8EFsvKZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="368338588"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="368338588"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 13:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="836409908"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="836409908"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2023 13:06:06 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKlWn-0008LV-07;
	Sat, 15 Jul 2023 20:06:05 +0000
Date: Sun, 16 Jul 2023 04:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 30/38]
 arch/x86/kernel/apic/x2apic_phys.c:11:30: error: expected '=', ',', ';',
 'asm' or '__attribute__' before '__refdatao'
Message-ID: <202307160342.dJuTr6EQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   59df0262d2da163a8281c806688cc62e4d919908
commit: e2f40f2fdd6f60db02638b295a11feaee036fe70 [30/38] x86/apic: Sanitize APID ID range validation
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230716/202307160342.dJuTr6EQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160342.dJuTr6EQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160342.dJuTr6EQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/apic/x2apic_phys.c:11:30: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__refdatao'
      11 | static u32 x2apic_max_apicid __refdatao;
         |                              ^~~~~~~~~~
   arch/x86/kernel/apic/x2apic_phys.c: In function 'x2apic_set_max_apicid':
>> arch/x86/kernel/apic/x2apic_phys.c:15:9: error: 'x2apic_max_apicid' undeclared (first use in this function); did you mean 'x2apic_set_apic_id'?
      15 |         x2apic_max_apicid = apicid;
         |         ^~~~~~~~~~~~~~~~~
         |         x2apic_set_apic_id
   arch/x86/kernel/apic/x2apic_phys.c:15:9: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/apic/x2apic_phys.c: In function 'x2apic_phys_probe':
   arch/x86/kernel/apic/x2apic_phys.c:99:40: error: 'x2apic_max_apicid' undeclared (first use in this function); did you mean 'x2apic_set_apic_id'?
      99 |         apic_x2apic_phys.max_apic_id = x2apic_max_apicid;
         |                                        ^~~~~~~~~~~~~~~~~
         |                                        x2apic_set_apic_id
   arch/x86/kernel/apic/x2apic_phys.c: At top level:
   arch/x86/kernel/apic/x2apic_phys.c:108:5: warning: no previous prototype for 'x2apic_apic_id_valid' [-Wmissing-prototypes]
     108 | int x2apic_apic_id_valid(u32 apicid)
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/apic/x2apic_phys.c: In function 'x2apic_apic_id_valid':
   arch/x86/kernel/apic/x2apic_phys.c:110:13: error: 'x2apic_max_apicid' undeclared (first use in this function); did you mean 'x2apic_set_apic_id'?
     110 |         if (x2apic_max_apicid && apicid > x2apic_max_apicid)
         |             ^~~~~~~~~~~~~~~~~
         |             x2apic_set_apic_id
--
   arch/x86/kernel/apic/x2apic_cluster.c: In function 'x2apic_cluster_probe':
>> arch/x86/kernel/apic/x2apic_cluster.c:220:43: error: 'x2apic_max_apicid' undeclared (first use in this function); did you mean 'x2apic_calc_apicid'?
     220 |         apic_x2apic_cluster.max_apic_id = x2apic_max_apicid;
         |                                           ^~~~~~~~~~~~~~~~~
         |                                           x2apic_calc_apicid
   arch/x86/kernel/apic/x2apic_cluster.c:220:43: note: each undeclared identifier is reported only once for each function it appears in


vim +11 arch/x86/kernel/apic/x2apic_phys.c

     9	
    10	static struct apic apic_x2apic_phys;
  > 11	static u32 x2apic_max_apicid __refdatao;
    12	
    13	void __init x2apic_set_max_apicid(u32 apicid)
    14	{
  > 15		x2apic_max_apicid = apicid;
    16	}
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
