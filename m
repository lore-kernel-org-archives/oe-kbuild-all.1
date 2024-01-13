Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C14A2A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 00:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iiq494M5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705106608; x=1736642608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PpJeoeSGGFkqbdGun588LRZinzRZSQdj4PznJHSxEyg=;
  b=Iiq494M5LD9vFum8Y1MXjS2F/4y0x7d+SBqZ537s5Wm/HQG7mOhDgPGp
   ZjOcyjunZu0wQMiGr89A8MCX/zp49zyzIUZmna9m45JKVdj9VlGqtOfQp
   CXmJzWIsucIoqM7LbF+mU9gO+z0TbTCPiBFrlCZMGAnZiUJEgstW9qdl0
   7+0Dz8VvXIw2CxVn9s83R4elqKHZBUbYCJEfw1dtffE7f7jvpVFnllxOa
   tGEzlfnLncukl500ptEWLdWU94fObgZkJShQYbrtpHaq/iuB/99WnMVqf
   jFsRN+3U5hzYSwwcX1XbUz1TXvwb4u7/sUocDihhbvFdS8Gc46TilQAkH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="403091102"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="403091102"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 16:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="25171888"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jan 2024 16:43:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOS7Q-0009wI-15;
	Sat, 13 Jan 2024 00:43:24 +0000
Date: Sat, 13 Jan 2024 08:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21050/21544]
 arch/x86/include/asm/msr.h:272:9: warning: 'mcu_ctrl' may be used
 uninitialized
Message-ID: <202401130830.UR68iRGU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 99dec2700cf36e58d3fdb295e1fed7e9d04a916c [21050/21544] x86/speculation: Add Gather Data Sampling mitigation
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240113/202401130830.UR68iRGU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401130830.UR68iRGU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401130830.UR68iRGU-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/processor.h:21,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_bits.h:22,
                    from include/linux/thread_info.h:14,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:81,
                    from include/linux/rcupdate.h:40,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/utsname.h:6,
                    from arch/x86/kernel/cpu/bugs.c:12:
   In function 'wrmsrl',
       inlined from 'update_gds_msr' at arch/x86/kernel/cpu/bugs.c:689:2:
>> arch/x86/include/asm/msr.h:272:9: warning: 'mcu_ctrl' may be used uninitialized [-Wmaybe-uninitialized]
     272 |         native_write_msr(msr, (u32)(val & 0xffffffffULL), (u32)(val >> 32));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/bugs.c: In function 'update_gds_msr':
   arch/x86/kernel/cpu/bugs.c:667:13: note: 'mcu_ctrl' was declared here
     667 |         u64 mcu_ctrl;
         |             ^~~~~~~~


vim +/mcu_ctrl +272 arch/x86/include/asm/msr.h

be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  266  
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  267  #define rdmsrl(msr, val)			\
abb0ade013507c include/asm-x86/msr.h      Joe Perches     2008-03-23  268  	((val) = native_read_msr((msr)))
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  269  
5d07c2cc1962fa arch/x86/include/asm/msr.h Borislav Petkov 2016-11-02  270  static inline void wrmsrl(unsigned int msr, u64 val)
47edb65178cb70 arch/x86/include/asm/msr.h Andy Lutomirski 2015-07-23  271  {
679bcea857d728 arch/x86/include/asm/msr.h Borislav Petkov 2015-11-23 @272  	native_write_msr(msr, (u32)(val & 0xffffffffULL), (u32)(val >> 32));
47edb65178cb70 arch/x86/include/asm/msr.h Andy Lutomirski 2015-07-23  273  }
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  274  

:::::: The code at line 272 was first introduced by commit
:::::: 679bcea857d72868e3431dde3a0e158bf0ed9119 x86/MSR: Chop off lower 32-bit value

:::::: TO: Borislav Petkov <bp@suse.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
