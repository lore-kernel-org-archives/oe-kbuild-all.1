Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B7984E14
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 16:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713371291; cv=none; b=CS//0TTGgTAkAepVF9NR/Z5cEpHL+Qx6Pue7VAFVKf4QRVKc6dQRcxeCbpBVyeEig8S4oFqTwcp/1liVHR5Oq9XyPZR5ant+31wfYnduZULkfi6gjfKMVuhRm6VTzHklBbzo8JRCac+mpjPnIbAQVGo41//Cc1cdhODU9Q3rabE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713371291; c=relaxed/simple;
	bh=6A9Oran8pxt/JmDCTFKunp35ak5IBVMtw2RRFluV+5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FpxHgx3ComVe/e7l3Qa90rQq9Nfcx6HKd1ZCYZ7mBkks0uoUUSvmKru0C0EWzn6a+xezr32e2QH3JGFrqUF0/Mxx2WsyDehBNWAnGWh1+LSSwvJBEpBkvy+rKnMNKc5b/FgmYwN3kjnNlPANfbDsCJ3RggnKFbPEsg9hwJiykhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhyaxZfp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhyaxZfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713371290; x=1744907290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6A9Oran8pxt/JmDCTFKunp35ak5IBVMtw2RRFluV+5I=;
  b=RhyaxZfpGHwWsV9acct1mij0vzmwfrNvIiM2MC3wkw1VChq/LUxAty/T
   TiQAcuLsO99kubJbSUIGdCiykDSYqTc3Evtl429+Ww06e8MHhFB9dzck7
   Vl71203gvxoRhMzLtCyJNL4eN6FlL1PNmrI3tnxhh6IN0lzM11EX7OBV/
   U9jbUIgktoGERxwlmpxSwrFc2OObmPYqyu5wuseg1W56zeojucGac68me
   OUlXuS95MGE4oUggeovMCppd4iftY8UaANq6A3S1yeApcwm1aaPAgiBf7
   SyrKr2vLwaxkKHO9b4Ow4vssJyXpfFLCBt1GMd4UL6uVAIu9z2bfIgEQy
   g==;
X-CSE-ConnectionGUID: cHNmgHQjQN6uiyqTuZ0SWw==
X-CSE-MsgGUID: oVDZ5noiQhieNIU4iMKEFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9098577"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9098577"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 09:28:09 -0700
X-CSE-ConnectionGUID: NouZrdnUQA6t50I7SnQ+tQ==
X-CSE-MsgGUID: DjK7G6RdTjC640H56JVPFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="22760227"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Apr 2024 09:28:06 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx88f-0006mQ-0k;
	Wed, 17 Apr 2024 16:28:03 +0000
Date: Thu, 18 Apr 2024 00:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21050/22135]
 arch/x86/include/asm/paravirt.h:150:39: warning: 'mcu_ctrl' may be used
 uninitialized
Message-ID: <202404180032.EJsgquDC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3fc54ba0707c8961810392aa8ed85e0d3f192d58
commit: 99dec2700cf36e58d3fdb295e1fed7e9d04a916c [21050/22135] x86/speculation: Add Gather Data Sampling mitigation
config: x86_64-buildonly-randconfig-002-20240417 (https://download.01.org/0day-ci/archive/20240418/202404180032.EJsgquDC-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404180032.EJsgquDC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404180032.EJsgquDC-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/bugs.c:2407:9: warning: no previous prototype for 'cpu_show_gds' [-Wmissing-prototypes]
    2407 | ssize_t cpu_show_gds(struct device *dev, struct device_attribute *attr, char *buf)
         |         ^~~~~~~~~~~~
   In file included from arch/x86/include/asm/irqflags.h:72,
                    from include/linux/irqflags.h:16,
                    from include/linux/rcupdate.h:39,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/utsname.h:6,
                    from arch/x86/kernel/cpu/bugs.c:12:
   In function 'wrmsrl',
       inlined from 'update_gds_msr' at arch/x86/kernel/cpu/bugs.c:689:2:
>> arch/x86/include/asm/paravirt.h:150:39: warning: 'mcu_ctrl' may be used uninitialized [-Wmaybe-uninitialized]
     150 |         wrmsr(msr, (u32)val, (u32)(val>>32));
         |                                   ~~~~^~~~~
   arch/x86/include/asm/paravirt.h:140:39: note: in definition of macro 'wrmsr'
     140 |         paravirt_write_msr(msr, val1, val2);    \
         |                                       ^~~~
   arch/x86/kernel/cpu/bugs.c: In function 'update_gds_msr':
   arch/x86/kernel/cpu/bugs.c:667:13: note: 'mcu_ctrl' was declared here
     667 |         u64 mcu_ctrl;
         |             ^~~~~~~~


vim +/mcu_ctrl +150 arch/x86/include/asm/paravirt.h

d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell   2006-12-07  147  
47edb65178cb70 arch/x86/include/asm/paravirt.h Andy Lutomirski 2015-07-23  148  static inline void wrmsrl(unsigned msr, u64 val)
47edb65178cb70 arch/x86/include/asm/paravirt.h Andy Lutomirski 2015-07-23  149  {
47edb65178cb70 arch/x86/include/asm/paravirt.h Andy Lutomirski 2015-07-23 @150  	wrmsr(msr, (u32)val, (u32)(val>>32));
47edb65178cb70 arch/x86/include/asm/paravirt.h Andy Lutomirski 2015-07-23  151  }
47edb65178cb70 arch/x86/include/asm/paravirt.h Andy Lutomirski 2015-07-23  152  

:::::: The code at line 150 was first introduced by commit
:::::: 47edb65178cb7056c2eea0b6c41a7d8c84547192 x86/asm/msr: Make wrmsrl() a function

:::::: TO: Andy Lutomirski <luto@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
