Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5081C68E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 18:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PR7J6Ry3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704306349; x=1735842349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6OxcLT2vOYMDQZFXhNSUqaaMu8PmYexc9NRpWVCbX18=;
  b=PR7J6Ry31iRH3sn5CVQHVDMEX+3tBGKTBcCY3U836u35IJK5sIs/xlXN
   9To8XKKRfUFOkmV+QHoYSJFl0IA0h8f3NLBnreu+MYATsnVKYWU4F9n5h
   roF5v5lo6r7BQXZzzFyXKto2Laa5vRgdM50PKl/Pl9YYOArMHx7maHrln
   vkGUp7QpcFrTmqdXLzyJWhQWKpirCqmt1NNLGB8Sg7YnCdEZsHTHFlw6J
   HF5eI7VlfctT+EuYiUrenhccdSW8B3sQpKFVSVqJ9XGnlxiBvC2xTYqYP
   0B7AldYRgH5MNwc/46IDgJ0vln826e1tCuBvoeu1mrtvtnM6hAdQBnA5R
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="461353264"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="461353264"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 10:25:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="780057577"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="780057577"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 03 Jan 2024 10:25:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL5w0-000MR2-0B;
	Wed, 03 Jan 2024 18:25:44 +0000
Date: Thu, 4 Jan 2024 02:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, "Song, Youquan" <youquan.song@intel.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Chen Zhuo <sagazchen@tencent.com>,
	Xinghui Li <korantli@tencent.com>
Subject: arch/x86/include/asm/uv/uv_hub.h:892:31: error: 'dest_Fixed'
 undeclared
Message-ID: <202401040053.Ivkk4vYw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009.spr
head:   2b05031ac9b7e23091affe1b717425ef76750bd9
commit: 459094d290f2c65b5ac433822a5094f5197b98d4 x86/apic: Cleanup delivery mode defines
date:   7 months ago
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20240104/202401040053.Ivkk4vYw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040053.Ivkk4vYw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401040053.Ivkk4vYw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/apic/x2apic_uv_x.c:20:
   arch/x86/include/asm/uv/uv_hub.h: In function 'uv_hub_send_ipi':
>> arch/x86/include/asm/uv/uv_hub.h:892:31: error: 'dest_Fixed' undeclared (first use in this function)
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^~~~~~~~~~
   arch/x86/include/asm/uv/uv_hub.h:892:31: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/include/asm/uv/uv_hub.h:895:25: error: 'dest_NMI' undeclared (first use in this function)
     895 |                 dmode = dest_NMI;
         |                         ^~~~~~~~
   arch/x86/kernel/apic/x2apic_uv_x.c: At top level:
>> arch/x86/kernel/apic/x2apic_uv_x.c:650:10: error: 'struct apic' has no member named 'irq_delivery_mode'; did you mean 'delivery_mode'?
     650 |         .irq_delivery_mode              = dest_Fixed,
         |          ^~~~~~~~~~~~~~~~~
         |          delivery_mode
>> arch/x86/kernel/apic/x2apic_uv_x.c:650:43: error: 'dest_Fixed' undeclared here (not in a function)
     650 |         .irq_delivery_mode              = dest_Fixed,
         |                                           ^~~~~~~~~~
--
   In file included from arch/x86/platform/uv/tlb_uv.c:17:
   arch/x86/include/asm/uv/uv_hub.h: In function 'uv_hub_send_ipi':
>> arch/x86/include/asm/uv/uv_hub.h:892:31: error: 'dest_Fixed' undeclared (first use in this function)
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^~~~~~~~~~
   arch/x86/include/asm/uv/uv_hub.h:892:31: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/include/asm/uv/uv_hub.h:895:25: error: 'dest_NMI' undeclared (first use in this function)
     895 |                 dmode = dest_NMI;
         |                         ^~~~~~~~
   arch/x86/platform/uv/tlb_uv.c: At top level:
   arch/x86/platform/uv/tlb_uv.c:1275:6: warning: no previous prototype for 'uv_bau_message_interrupt' [-Wmissing-prototypes]
    1275 | void uv_bau_message_interrupt(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/platform/uv/bios_uv.c:15:
   arch/x86/include/asm/uv/uv_hub.h: In function 'uv_hub_send_ipi':
>> arch/x86/include/asm/uv/uv_hub.h:892:31: error: 'dest_Fixed' undeclared (first use in this function)
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^~~~~~~~~~
   arch/x86/include/asm/uv/uv_hub.h:892:31: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/include/asm/uv/uv_hub.h:895:25: error: 'dest_NMI' undeclared (first use in this function)
     895 |                 dmode = dest_NMI;
         |                         ^~~~~~~~
--
   In file included from arch/x86/platform/uv/uv_irq.c:19:
   arch/x86/include/asm/uv/uv_hub.h: In function 'uv_hub_send_ipi':
>> arch/x86/include/asm/uv/uv_hub.h:892:31: error: 'dest_Fixed' undeclared (first use in this function)
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^~~~~~~~~~
   arch/x86/include/asm/uv/uv_hub.h:892:31: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/include/asm/uv/uv_hub.h:895:25: error: 'dest_NMI' undeclared (first use in this function)
     895 |                 dmode = dest_NMI;
         |                         ^~~~~~~~
   arch/x86/platform/uv/uv_irq.c: In function 'uv_program_mmr':
>> arch/x86/platform/uv/uv_irq.c:38:41: error: 'struct apic' has no member named 'irq_delivery_mode'; did you mean 'delivery_mode'?
      38 |         entry->delivery_mode    = apic->irq_delivery_mode;
         |                                         ^~~~~~~~~~~~~~~~~
         |                                         delivery_mode


vim +/dest_Fixed +892 arch/x86/include/asm/uv/uv_hub.h

^590eaf1fec755 Kaixu Xia 2021-03-16  888  
^590eaf1fec755 Kaixu Xia 2021-03-16  889  static inline void uv_hub_send_ipi(int pnode, int apicid, int vector)
^590eaf1fec755 Kaixu Xia 2021-03-16  890  {
^590eaf1fec755 Kaixu Xia 2021-03-16  891  	unsigned long val;
^590eaf1fec755 Kaixu Xia 2021-03-16 @892  	unsigned long dmode = dest_Fixed;
^590eaf1fec755 Kaixu Xia 2021-03-16  893  
^590eaf1fec755 Kaixu Xia 2021-03-16  894  	if (vector == NMI_VECTOR)
^590eaf1fec755 Kaixu Xia 2021-03-16 @895  		dmode = dest_NMI;
^590eaf1fec755 Kaixu Xia 2021-03-16  896  
^590eaf1fec755 Kaixu Xia 2021-03-16  897  	val = uv_hub_ipi_value(apicid, vector, dmode);
^590eaf1fec755 Kaixu Xia 2021-03-16  898  	uv_write_global_mmr64(pnode, UVH_IPI_INT, val);
^590eaf1fec755 Kaixu Xia 2021-03-16  899  }
^590eaf1fec755 Kaixu Xia 2021-03-16  900  

:::::: The code at line 892 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
