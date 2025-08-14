Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F187B22ACF3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 06:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755151217; cv=none; b=cwGs6atX8riFLqwOEp9X7WEeZwvaD34CBMDVXnhg7k2kR47CnwprDUlqxgZ7ZXlIQlGp8yaQ4ONxVQRYTqMIDQrmWR0LIGY0WjZgxJChTjvRwo8g470b1GKJUv+mTbbz6exb+0nh2n9zBZsRJGprksERrXjGCMzu2sPOGDxABbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755151217; c=relaxed/simple;
	bh=Dr6gvhYoW/9FI+31CkvnPb86IizPIk2Usp0dlkV9WBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kicGtUv3O1YMyV8nIirckLzgtcaLwHcDovcePC0sfET+hEz0jBm6syWASimC4dXQNrSQjw1ZdBMS9ioGFt5+72zDRMtS6quuvIFCQK15K27kimmECD2W4c87VZMDffWR20jMkmLfqfTAm3Pa/436cJ6MwFP2PwVxE0s9tv67R+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGInqHv7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGInqHv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755151215; x=1786687215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dr6gvhYoW/9FI+31CkvnPb86IizPIk2Usp0dlkV9WBQ=;
  b=AGInqHv7i4R/0VwSHQObnSH2bY17SPnq8hsXdye5AeJzDF0+D/IBAV5u
   PQDXqJk8w+qlS0MNBoUaRAXeGVMOeH1TWTGi3iIbREVlKDRcHpLVcXJGl
   xI5DtKpbQ0KrNbrzaCCkIBpoXaYBFgcWPYUtrbkr4W269nFfSsmPlYiQB
   jrIdQ4hRz5uBMN20i+9hoKoPf9aCxKI+tfkvhVghfgKzTBL0aKO5OLZsr
   4dw0SRg01IH+J067Z0QLiXhs8v6oe/4ZvJUJxYuCZhyVDLXKPyfXLNsRD
   qOsv3+OfJnOKehQ0j1Yy0GV1JtcIYSyCXiT+t22EbojT7Ce2V4AnoNFBL
   A==;
X-CSE-ConnectionGUID: bMyOg7puSOSjOHLywGxRtA==
X-CSE-MsgGUID: CXdsQF5vTnitNtOZjsis2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57528117"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57528117"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 23:00:14 -0700
X-CSE-ConnectionGUID: SxbNaTRRQde7MG4fv24fIA==
X-CSE-MsgGUID: 6jdxnBPJRZywRLqUXB5WbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="170807492"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2025 23:00:13 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umR0V-0000DD-1g;
	Thu, 14 Aug 2025 06:00:11 +0000
Date: Thu, 14 Aug 2025 08:00:03 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1755/1755]
 arch/x86/kernel/apic/apic.c:2202: warning: Function parameter or member
 'apicid' not described in 'apic_id_is_primary_thread'
Message-ID: <202508140748.SO4qfB0e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8723dc57de6371f9cc8764e15d4cc9e57ae592ee
commit: d0055f351e647f33f3b0329bff022213bf8aa085 [1755/1755] x86/smp: fix non-SMP broken build due to redefinition of apic_id_is_primary_thread
config: x86_64-buildonly-randconfig-2002-20250811 (https://download.01.org/0day-ci/archive/20250814/202508140748.SO4qfB0e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140748.SO4qfB0e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140748.SO4qfB0e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/apic/apic.c:1040:28: warning: no previous prototype for function 'smp_apic_timer_interrupt' [-Wmissing-prototypes]
    1040 | __visible void __irq_entry smp_apic_timer_interrupt(struct pt_regs *regs)
         |                            ^
   arch/x86/kernel/apic/apic.c:1040:11: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1040 | __visible void __irq_entry smp_apic_timer_interrupt(struct pt_regs *regs)
         |           ^
         |           static 
   arch/x86/kernel/apic/apic.c:2021:28: warning: no previous prototype for function 'smp_spurious_interrupt' [-Wmissing-prototypes]
    2021 | __visible void __irq_entry smp_spurious_interrupt(struct pt_regs *regs)
         |                            ^
   arch/x86/kernel/apic/apic.c:2021:11: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2021 | __visible void __irq_entry smp_spurious_interrupt(struct pt_regs *regs)
         |           ^
         |           static 
   arch/x86/kernel/apic/apic.c:2051:28: warning: no previous prototype for function 'smp_error_interrupt' [-Wmissing-prototypes]
    2051 | __visible void __irq_entry smp_error_interrupt(struct pt_regs *regs)
         |                            ^
   arch/x86/kernel/apic/apic.c:2051:11: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2051 | __visible void __irq_entry smp_error_interrupt(struct pt_regs *regs)
         |           ^
         |           static 
   3 warnings generated.
>> arch/x86/kernel/apic/apic.c:2202: warning: Function parameter or member 'apicid' not described in 'apic_id_is_primary_thread'
>> arch/x86/kernel/apic/apic.c:2202: warning: Excess function parameter 'id' description in 'apic_id_is_primary_thread'


vim +2202 arch/x86/kernel/apic/apic.c

8f54969dc8d670 Gu Zheng        2016-08-25  2195  
d0055f351e647f Vlastimil Babka 2018-08-14  2196  #ifdef CONFIG_SMP
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2197  /**
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2198   * apic_id_is_primary_thread - Check whether APIC ID belongs to a primary thread
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2199   * @id:	APIC ID to check
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2200   */
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2201  bool apic_id_is_primary_thread(unsigned int apicid)
6a4d2657e048f0 Thomas Gleixner 2018-05-29 @2202  {
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2203  	u32 mask;
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2204  
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2205  	if (smp_num_siblings == 1)
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2206  		return true;
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2207  	/* Isolate the SMT bit(s) in the APICID and check for 0 */
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2208  	mask = (1U << (fls(smp_num_siblings) - 1)) - 1;
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2209  	return !(apicid & mask);
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2210  }
d0055f351e647f Vlastimil Babka 2018-08-14  2211  #endif
6a4d2657e048f0 Thomas Gleixner 2018-05-29  2212  

:::::: The code at line 2202 was first introduced by commit
:::::: 6a4d2657e048f096c7ffcad254010bd94891c8c0 x86/smp: Provide topology_is_primary_thread()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
