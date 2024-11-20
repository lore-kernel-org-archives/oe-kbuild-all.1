Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E330C145324
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 16:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732121296; cv=none; b=L1R3074QqLIvM29ys3wZfFlVdJ1nAym2ElWhSjK62yej2mHdJ8f7UT7dHCQL8MyASIgRXTHpOc+gsPVrvYFxh3DHTRcEod20lLrjbs7smxRmcx2eCZ4iq40ukwl3UhDISBVArf4OVgPvESuuDvGGPo62dSt7xVq6wBU3OYY6tfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732121296; c=relaxed/simple;
	bh=sig4+sdXIgiJHvLPcNS9WBIG6GOCC9PFfZHKZaGmEoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cLBVcNK/0giUOBOK6vgP8LpHwXlCVghDbdM9NgAATRmKxyQz/sZ0I3+XfWBy0j8IPCJ0hvNG2OOkbs7jqbUJtTaFtD4UjrxjIWSD1YK58AeDfvaQc3k/FL1eSUur1qgpUCvkXnT86VJ4GksWDfhwI2azTNEdln25mDHheD5nfF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqmzS4w+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqmzS4w+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732121295; x=1763657295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sig4+sdXIgiJHvLPcNS9WBIG6GOCC9PFfZHKZaGmEoY=;
  b=hqmzS4w+RTLkKFDloxYWkuTPVX+yi7k917N88jFTUt94ig7RcjCp6GyP
   2VyedoPBCGyc9yrBlkCTAfUh761Nifbxee1KCc96+psxbym+wHAkXZREs
   LgH2YFTskOoxIYWc4E/ylEn79/V/dyoWljkG48t6Zgk8nYMgyph83t7aw
   NBXfahH7yl4rU7ixzfWnCw3NhXpd7KMTegk3F+VAvOPDY7URy2RFShzXb
   eRP7k6Gl8kIai6IEzm3yi6JdT3B7GrTAhfFlKINULnOB6dZdus+Wl0wFg
   CQU3SY8CH1na+MipcI5cTJ8rUbciUNagBsiwIKjLrc2rY4P1uT8QpsIQe
   A==;
X-CSE-ConnectionGUID: 485qF2OTT7WdOOe42CSMZA==
X-CSE-MsgGUID: qY1RcZOQTx2AurBa5CTWyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32302907"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="32302907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 08:48:14 -0800
X-CSE-ConnectionGUID: 2U4138ISTPGkkU43U5Pv5Q==
X-CSE-MsgGUID: dcltU55zQlqSOWk7XqHhxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="94032471"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2024 08:48:13 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDnsB-00011p-1N;
	Wed, 20 Nov 2024 16:48:11 +0000
Date: Thu, 21 Nov 2024 00:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12329/12380] include/linux/perf_event.h:1700:22:
 error: 'perf_misc_flags' redeclared as different kind of symbol
Message-ID: <202411210044.yCE5vUvF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ac24e26aa08fe026804f678599f805eb13374a5d
commit: 53930361b9387665c09f2461ef481639491488c1 [12329/12380] Merge branch 'next' of git://git.kernel.org/pub/scm/virt/kvm/kvm.git
config: riscv-randconfig-002-20241120 (https://download.01.org/0day-ci/archive/20241121/202411210044.yCE5vUvF-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210044.yCE5vUvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210044.yCE5vUvF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/perf/riscv_pmu.h:12,
                    from arch/riscv/include/asm/kvm_vcpu_pmu.h:12,
                    from arch/riscv/include/asm/kvm_host.h:23,
                    from arch/riscv/kernel/asm-offsets.c:12:
   include/linux/perf_event.h:1700:84: error: macro "perf_misc_flags" passed 2 arguments, but takes just 1
    1700 | extern unsigned long perf_misc_flags(struct perf_event *event, struct pt_regs *regs);
         |                                                                                    ^
   In file included from include/linux/perf_event.h:25:
   arch/riscv/include/asm/perf_event.h:15:9: note: macro "perf_misc_flags" defined here
      15 | #define perf_misc_flags(regs) perf_misc_flags(regs)
         |         ^~~~~~~~~~~~~~~
>> include/linux/perf_event.h:1700:22: error: 'perf_misc_flags' redeclared as different kind of symbol
    1700 | extern unsigned long perf_misc_flags(struct perf_event *event, struct pt_regs *regs);
         |                      ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/perf_event.h:14:22: note: previous declaration of 'perf_misc_flags' with type 'long unsigned int(struct pt_regs *)'
      14 | extern unsigned long perf_misc_flags(struct pt_regs *regs);
         |                      ^~~~~~~~~~~~~~~
   include/linux/perf_event.h:1701:22: error: conflicting types for 'perf_instruction_pointer'; have 'long unsigned int(struct perf_event *, struct pt_regs *)'
    1701 | extern unsigned long perf_instruction_pointer(struct perf_event *event,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/perf_event.h:13:22: note: previous declaration of 'perf_instruction_pointer' with type 'long unsigned int(struct pt_regs *)'
      13 | extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=2485109412
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1255: prepare0] Error 2 shuffle=2485109412
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=2485109412
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=2485109412
   make: Target 'prepare' not remade because of errors.


vim +/perf_misc_flags +1700 include/linux/perf_event.h

0d905bca23aca5 include/linux/perf_counter.h Ingo Molnar  2009-05-04  1699  
2c47e7a74f4454 include/linux/perf_event.h   Colton Lewis 2024-11-13 @1700  extern unsigned long perf_misc_flags(struct perf_event *event, struct pt_regs *regs);
2c47e7a74f4454 include/linux/perf_event.h   Colton Lewis 2024-11-13  1701  extern unsigned long perf_instruction_pointer(struct perf_event *event,
2c47e7a74f4454 include/linux/perf_event.h   Colton Lewis 2024-11-13  1702  					      struct pt_regs *regs);
04782e63917dbc include/linux/perf_event.h   Colton Lewis 2024-11-13  1703  

:::::: The code at line 1700 was first introduced by commit
:::::: 2c47e7a74f445426d156278e339b7abb259e50de perf/core: Correct perf sampling with guest VMs

:::::: TO: Colton Lewis <coltonlewis@google.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
