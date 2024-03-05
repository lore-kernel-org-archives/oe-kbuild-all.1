Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F2512BE98
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 21:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709673614; cv=none; b=Qz+XvdGlqXWMR3CqQLo9SgQLrW7dEgqL+t7K9lmpxrTPFIRW34eN0+n33/YnGl6NjKpTolOs42nY+rjFK1EsQGGscZPAvPX1Ycq53cilNE/GmnI7HocDjiI0lyyLrjS/QTyTq+4UVkEWAQcmi93BIBAavc0gQQBO29BjjR6Tidw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709673614; c=relaxed/simple;
	bh=wm5W97kGpr3LoxtF4lTuKELAGIDkwwQUifArJ2j2vvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dqk7dlB+s7P6ReBxAXpxVBM1Bx6bs5UWaWTkK6JgbuJTtw+CqNqvB3A4joGZH3CTGTTdG0dBOKPMZA0sY52VyL+CP093TfRVFFrCsYNkaZ1CRxRAoD6uMh9KwQEPTUNNy8x7AntMJH+c5mZqjXQY/urI5EzAE9+y8M7p7E/W3Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnuQwcJ5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnuQwcJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709673612; x=1741209612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wm5W97kGpr3LoxtF4lTuKELAGIDkwwQUifArJ2j2vvo=;
  b=SnuQwcJ5nCh/TwC5ZLMlzaYl9/NdBgF9SC/OcQygUkzgio+KR5dvAVxu
   xWKDRIK5NrL3hNcBr9TN9HCil3T+3RsDvVoOSHGetj8WeXbZvaZ05vzi/
   Ptd4Shefh8cXSU96++8kulKTvB6k4EkRO+uzL3xUqJjtxVxVe+RRtJNNg
   qZDRSQE94a3WnKnmA6eD6mwFVDnffrI49soDW3Pn3f/FoHCy37UAXkGwR
   IZdtnqHfi+9BUW2b2H5V5s7W2MVUy35r8VliA2jcJ4ex4Uoc4B1tcXY19
   O4138ZDOkpH4DN6nUkDS1j3F6LpGK5uNlMPIBQxTIbL4FG0Xve/wiV47I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="21776857"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="21776857"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 13:20:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="47051478"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Mar 2024 13:20:01 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhcCc-0003f1-0o;
	Tue, 05 Mar 2024 21:19:58 +0000
Date: Wed, 6 Mar 2024 05:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: arch/x86/include/asm/uv/uv_hub.h:892:24: error: use of undeclared
 identifier 'dest_Fixed'
Message-ID: <202403060540.8lHMYrdR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 459094d290f2c65b5ac433822a5094f5197b98d4 x86/apic: Cleanup delivery mode defines
date:   9 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240306/202403060540.8lHMYrdR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060540.8lHMYrdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060540.8lHMYrdR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/platform/uv/tlb_uv.c:17:
>> arch/x86/include/asm/uv/uv_hub.h:892:24: error: use of undeclared identifier 'dest_Fixed'
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^
>> arch/x86/include/asm/uv/uv_hub.h:895:11: error: use of undeclared identifier 'dest_NMI'
     895 |                 dmode = dest_NMI;
         |                         ^
   arch/x86/platform/uv/tlb_uv.c:1275:6: warning: no previous prototype for function 'uv_bau_message_interrupt' [-Wmissing-prototypes]
    1275 | void uv_bau_message_interrupt(struct pt_regs *regs)
         |      ^
   arch/x86/platform/uv/tlb_uv.c:1275:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1275 | void uv_bau_message_interrupt(struct pt_regs *regs)
         | ^
         | static 
   1 warning and 2 errors generated.
--
   In file included from arch/x86/platform/uv/bios_uv.c:15:
>> arch/x86/include/asm/uv/uv_hub.h:892:24: error: use of undeclared identifier 'dest_Fixed'
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^
>> arch/x86/include/asm/uv/uv_hub.h:895:11: error: use of undeclared identifier 'dest_NMI'
     895 |                 dmode = dest_NMI;
         |                         ^
   2 errors generated.
--
   In file included from arch/x86/platform/uv/uv_irq.c:19:
>> arch/x86/include/asm/uv/uv_hub.h:892:24: error: use of undeclared identifier 'dest_Fixed'
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^
>> arch/x86/include/asm/uv/uv_hub.h:895:11: error: use of undeclared identifier 'dest_NMI'
     895 |                 dmode = dest_NMI;
         |                         ^
>> arch/x86/platform/uv/uv_irq.c:38:31: error: no member named 'irq_delivery_mode' in 'struct apic'; did you mean 'delivery_mode'?
      38 |         entry->delivery_mode    = apic->irq_delivery_mode;
         |                                         ^~~~~~~~~~~~~~~~~
         |                                         delivery_mode
   arch/x86/include/asm/apic.h:303:27: note: 'delivery_mode' declared here
     303 |         enum apic_delivery_modes delivery_mode;
         |                                  ^
   3 errors generated.
--
   In file included from arch/x86/kernel/apic/x2apic_uv_x.c:20:
>> arch/x86/include/asm/uv/uv_hub.h:892:24: error: use of undeclared identifier 'dest_Fixed'
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^
>> arch/x86/include/asm/uv/uv_hub.h:895:11: error: use of undeclared identifier 'dest_NMI'
     895 |                 dmode = dest_NMI;
         |                         ^
>> arch/x86/kernel/apic/x2apic_uv_x.c:650:24: error: use of undeclared identifier 'dest_Fixed'
     650 |         .irq_delivery_mode              = dest_Fixed,
         |                                           ^
   3 errors generated.
--
   In file included from drivers/misc/sgi-gru/grufile.c:33:
>> arch/x86/include/asm/uv/uv_hub.h:892:24: error: use of undeclared identifier 'dest_Fixed'
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^
>> arch/x86/include/asm/uv/uv_hub.h:895:11: error: use of undeclared identifier 'dest_NMI'
     895 |                 dmode = dest_NMI;
         |                         ^
   drivers/misc/sgi-gru/grufile.c:240:51: warning: shift count >= width of type [-Wshift-count-overflow]
     240 |         gru->gs_cbr_map = (GRU_CBR_AU == 64) ? ~0 : (1UL << GRU_CBR_AU) - 1;
         |                                                          ^  ~~~~~~~~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/misc/sgi-gru/grufault.c:29:
>> arch/x86/include/asm/uv/uv_hub.h:892:24: error: use of undeclared identifier 'dest_Fixed'
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^
>> arch/x86/include/asm/uv/uv_hub.h:895:11: error: use of undeclared identifier 'dest_NMI'
     895 |                 dmode = dest_NMI;
         |                         ^
   drivers/misc/sgi-gru/grufault.c:362:54: warning: variable 'indexway' set but not used [-Wunused-but-set-variable]
     362 |         int pageshift = 0, asid, write, ret, atomic = !cbk, indexway;
         |                                                             ^
   1 warning and 2 errors generated.


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
