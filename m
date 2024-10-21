Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AC51FE0F8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 20:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729543073; cv=none; b=F2Elzi7W9BLYT0RVJ7kSg8JRF/sEWwFVd1Y0EC+o7LGFMLG6CU6EfjkXcpODcgGHdT52iLLGsJT3/yKBXlrxwpX/TGry/q4I2SphEKsJVAT0p6XD48BByejmrfuFIOFznIl4GYEeaT/Mqebjh+3xNRhuiD58TDuJM4pqtA798Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729543073; c=relaxed/simple;
	bh=6hRveDScrZLDALsMlvKNuQnnJ+KaxZavxg+3pBx0bV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F/hcEB6IedLuq0pzL6K9nFI9tt8KbN0hioD+G4LUIQUnQtmjhcXWBlKBNfnpxjrVkRJLryYHRXXnSsqwyj1qJGllqtDBprrzRuvf0+nGjaE/FJeT9Q8/iJTieeE8B4Em6V2UUhNnKQ2YuNl0GgiBayuXzCPAlqMymiA0Q0YpL+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8b8rlQ3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8b8rlQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729543071; x=1761079071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6hRveDScrZLDALsMlvKNuQnnJ+KaxZavxg+3pBx0bV8=;
  b=F8b8rlQ3/YqmJ8P0+gkKTSworWrt7/m5VF9xKKZa27nVq7wZSDEG20rK
   dbyL8K6OpWj4ucB8Y0fi/fQrqtCklhYNwc2fHDeeYXF4PjnigmT30753L
   1ayJ3NzZE6vDdW/osyyy63VR+PEgIVuWEIDxk0FQSx48jqhZ08+SZKK/3
   aenpnLIvv46E9NFb0+QbrId6MIw8BXbiu59kHhvlra+Bt23hqzmWPj1jC
   a722t8jG+VuC6hjNWaZ1NWXFxDlcihaF4qqEp2Bdny+BDZA5a3tA07RZE
   P8XexHyeyw5AENYbK0wfuLSBLBJ8+W7Dgzs+0rnyj3mbhne2NWJv/WzBX
   Q==;
X-CSE-ConnectionGUID: q47Mwv8KRPmuMhG1Fg9Shw==
X-CSE-MsgGUID: DA/vgzZJTOuWXs7VpJABKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28993941"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28993941"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 13:37:50 -0700
X-CSE-ConnectionGUID: O55jBu1hR/Kv4e1NSPI1EA==
X-CSE-MsgGUID: U+PW4kr3RFKiE6nWDHMe5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="84448780"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Oct 2024 13:37:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2z9s-000Sco-34;
	Mon, 21 Oct 2024 20:37:44 +0000
Date: Tue, 22 Oct 2024 04:37:39 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 352/2444]
 arch/x86/include/asm/uv/uv_hub.h:892:31: error: 'dest_Fixed' undeclared
Message-ID: <202410220445.8KK91UBZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: a85754284d976d53e6fc4d2a13436ad8839278f1 [352/2444] x86/apic: Cleanup delivery mode defines
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241022/202410220445.8KK91UBZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410220445.8KK91UBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410220445.8KK91UBZ-lkp@intel.com/

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


vim +/dest_Fixed +892 arch/x86/include/asm/uv/uv_hub.h

56abcf24ff99329 Jack Steiner 2009-12-15  888  
66666e50fcd69d8 Jack Steiner 2009-04-02  889  static inline void uv_hub_send_ipi(int pnode, int apicid, int vector)
66666e50fcd69d8 Jack Steiner 2009-04-02  890  {
66666e50fcd69d8 Jack Steiner 2009-04-02  891  	unsigned long val;
02dd0a0613e0d84 Robin Holt   2009-10-20 @892  	unsigned long dmode = dest_Fixed;
02dd0a0613e0d84 Robin Holt   2009-10-20  893  
02dd0a0613e0d84 Robin Holt   2009-10-20  894  	if (vector == NMI_VECTOR)
02dd0a0613e0d84 Robin Holt   2009-10-20 @895  		dmode = dest_NMI;
66666e50fcd69d8 Jack Steiner 2009-04-02  896  
56abcf24ff99329 Jack Steiner 2009-12-15  897  	val = uv_hub_ipi_value(apicid, vector, dmode);
66666e50fcd69d8 Jack Steiner 2009-04-02  898  	uv_write_global_mmr64(pnode, UVH_IPI_INT, val);
66666e50fcd69d8 Jack Steiner 2009-04-02  899  }
66666e50fcd69d8 Jack Steiner 2009-04-02  900  

:::::: The code at line 892 was first introduced by commit
:::::: 02dd0a0613e0d84c7dd8315e3fe6204d005b7c79 x86, UV: Set DELIVERY_MODE=4 for vector=NMI_VECTOR in uv_hub_send_ipi()

:::::: TO: Robin Holt <holt@sgi.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
