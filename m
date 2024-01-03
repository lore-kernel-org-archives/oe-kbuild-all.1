Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E30D1D55B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 21:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmeECJ24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704316515; x=1735852515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j4d/lPO67BgxOwAhRW2s5AvzU64V5c+/GeLdF4SZoQ0=;
  b=cmeECJ24akCAxGnMYC31vURp4e25kQGskJ6jcCxN6b0muuFcXtwCAKic
   J80m/HQX8U4fYafVSGe2r0EKImo0BQpcHTzGCTBezUAreiMQHIT3dLch3
   fb9lvSouw7KaXivTYf1JLrJUqQBXgblPEivg34n0/M2YkZTV3Av9gTTJg
   EjE2C1Uxeok7bOn2qFyPF8LpMAPQICbyWtUSrHrEbm117jvWowdouN3zV
   n+tRxU9C6K0InIyWUZZnqYgtuSMcAsmUSj7izvLByyr1e9pexAEOZ5Mnt
   YlzYYVCbsIieHJX8n+U6Bfo4FKhq2uYuAPJlDIqaBDVXkq0qyX5UHz6px
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="428239823"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="428239823"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 13:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="756332151"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="756332151"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Jan 2024 13:15:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL8Zv-000MZk-1G;
	Wed, 03 Jan 2024 21:15:07 +0000
Date: Thu, 4 Jan 2024 05:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, "Song, Youquan" <youquan.song@intel.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Chen Zhuo <sagazchen@tencent.com>,
	Xinghui Li <korantli@tencent.com>
Subject: arch/x86/kernel/apic/x2apic_uv_x.c:654:10: error: 'struct apic' has
 no member named 'dest_logical'
Message-ID: <202401040540.7olrJ8bk-lkp@intel.com>
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
commit: f8183e143f04a3a91ff5cc420c0a053bd541cb3c x86/apic: Get rid of apic:: Dest_logical
date:   7 months ago
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20240104/202401040540.7olrJ8bk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040540.7olrJ8bk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401040540.7olrJ8bk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/apic/x2apic_uv_x.c:20:
   arch/x86/include/asm/uv/uv_hub.h: In function 'uv_hub_send_ipi':
   arch/x86/include/asm/uv/uv_hub.h:892:31: error: 'dest_Fixed' undeclared (first use in this function)
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^~~~~~~~~~
   arch/x86/include/asm/uv/uv_hub.h:892:31: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/include/asm/uv/uv_hub.h:895:25: error: 'dest_NMI' undeclared (first use in this function)
     895 |                 dmode = dest_NMI;
         |                         ^~~~~~~~
   arch/x86/kernel/apic/x2apic_uv_x.c: At top level:
   arch/x86/kernel/apic/x2apic_uv_x.c:650:10: error: 'struct apic' has no member named 'irq_delivery_mode'; did you mean 'delivery_mode'?
     650 |         .irq_delivery_mode              = dest_Fixed,
         |          ^~~~~~~~~~~~~~~~~
         |          delivery_mode
   arch/x86/kernel/apic/x2apic_uv_x.c:650:43: error: 'dest_Fixed' undeclared here (not in a function)
     650 |         .irq_delivery_mode              = dest_Fixed,
         |                                           ^~~~~~~~~~
>> arch/x86/kernel/apic/x2apic_uv_x.c:654:10: error: 'struct apic' has no member named 'dest_logical'
     654 |         .dest_logical                   = APIC_DEST_LOGICAL,
         |          ^~~~~~~~~~~~


vim +654 arch/x86/kernel/apic/x2apic_uv_x.c

^590eaf1fec755 Kaixu Xia 2021-03-16  643  
^590eaf1fec755 Kaixu Xia 2021-03-16  644  	.name				= "UV large system",
^590eaf1fec755 Kaixu Xia 2021-03-16  645  	.probe				= uv_probe,
^590eaf1fec755 Kaixu Xia 2021-03-16  646  	.acpi_madt_oem_check		= uv_acpi_madt_oem_check,
^590eaf1fec755 Kaixu Xia 2021-03-16  647  	.apic_id_valid			= uv_apic_id_valid,
^590eaf1fec755 Kaixu Xia 2021-03-16  648  	.apic_id_registered		= uv_apic_id_registered,
^590eaf1fec755 Kaixu Xia 2021-03-16  649  
^590eaf1fec755 Kaixu Xia 2021-03-16 @650  	.irq_delivery_mode		= dest_Fixed,
^590eaf1fec755 Kaixu Xia 2021-03-16  651  	.irq_dest_mode			= 0, /* Physical */
^590eaf1fec755 Kaixu Xia 2021-03-16  652  
^590eaf1fec755 Kaixu Xia 2021-03-16  653  	.disable_esr			= 0,
^590eaf1fec755 Kaixu Xia 2021-03-16 @654  	.dest_logical			= APIC_DEST_LOGICAL,
^590eaf1fec755 Kaixu Xia 2021-03-16  655  	.check_apicid_used		= NULL,
^590eaf1fec755 Kaixu Xia 2021-03-16  656  
^590eaf1fec755 Kaixu Xia 2021-03-16  657  	.init_apic_ldr			= uv_init_apic_ldr,
^590eaf1fec755 Kaixu Xia 2021-03-16  658  
^590eaf1fec755 Kaixu Xia 2021-03-16  659  	.ioapic_phys_id_map		= NULL,
^590eaf1fec755 Kaixu Xia 2021-03-16  660  	.setup_apic_routing		= NULL,
^590eaf1fec755 Kaixu Xia 2021-03-16  661  	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
^590eaf1fec755 Kaixu Xia 2021-03-16  662  	.apicid_to_cpu_present		= NULL,
^590eaf1fec755 Kaixu Xia 2021-03-16  663  	.check_phys_apicid_present	= default_check_phys_apicid_present,
^590eaf1fec755 Kaixu Xia 2021-03-16  664  	.phys_pkg_id			= uv_phys_pkg_id,
^590eaf1fec755 Kaixu Xia 2021-03-16  665  
^590eaf1fec755 Kaixu Xia 2021-03-16  666  	.get_apic_id			= x2apic_get_apic_id,
^590eaf1fec755 Kaixu Xia 2021-03-16  667  	.set_apic_id			= set_apic_id,
^590eaf1fec755 Kaixu Xia 2021-03-16  668  
^590eaf1fec755 Kaixu Xia 2021-03-16  669  	.calc_dest_apicid		= apic_uv_calc_apicid,
^590eaf1fec755 Kaixu Xia 2021-03-16  670  
^590eaf1fec755 Kaixu Xia 2021-03-16  671  	.send_IPI			= uv_send_IPI_one,
^590eaf1fec755 Kaixu Xia 2021-03-16  672  	.send_IPI_mask			= uv_send_IPI_mask,
^590eaf1fec755 Kaixu Xia 2021-03-16  673  	.send_IPI_mask_allbutself	= uv_send_IPI_mask_allbutself,
^590eaf1fec755 Kaixu Xia 2021-03-16  674  	.send_IPI_allbutself		= uv_send_IPI_allbutself,
^590eaf1fec755 Kaixu Xia 2021-03-16  675  	.send_IPI_all			= uv_send_IPI_all,
^590eaf1fec755 Kaixu Xia 2021-03-16  676  	.send_IPI_self			= uv_send_IPI_self,
^590eaf1fec755 Kaixu Xia 2021-03-16  677  
^590eaf1fec755 Kaixu Xia 2021-03-16  678  	.wakeup_secondary_cpu		= uv_wakeup_secondary,
^590eaf1fec755 Kaixu Xia 2021-03-16  679  	.inquire_remote_apic		= NULL,
^590eaf1fec755 Kaixu Xia 2021-03-16  680  
^590eaf1fec755 Kaixu Xia 2021-03-16  681  	.read				= native_apic_msr_read,
^590eaf1fec755 Kaixu Xia 2021-03-16  682  	.write				= native_apic_msr_write,
^590eaf1fec755 Kaixu Xia 2021-03-16  683  	.eoi_write			= native_apic_msr_eoi_write,
^590eaf1fec755 Kaixu Xia 2021-03-16  684  	.icr_read			= native_x2apic_icr_read,
^590eaf1fec755 Kaixu Xia 2021-03-16  685  	.icr_write			= native_x2apic_icr_write,
^590eaf1fec755 Kaixu Xia 2021-03-16  686  	.wait_icr_idle			= native_x2apic_wait_icr_idle,
^590eaf1fec755 Kaixu Xia 2021-03-16  687  	.safe_wait_icr_idle		= native_safe_x2apic_wait_icr_idle,
^590eaf1fec755 Kaixu Xia 2021-03-16  688  };
^590eaf1fec755 Kaixu Xia 2021-03-16  689  

:::::: The code at line 654 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
