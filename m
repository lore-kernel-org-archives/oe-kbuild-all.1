Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF5A1DFD8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 01:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733102486; cv=none; b=tMJybAJTFaImMOzj/PAbleBBsMGX+vI0Sx2ryNxRxrhUBlHLIv0evOTvK1ivYDWveBe9kMxVvThxRByvLptHpXJkQHclgg3uTAYalRAaAruZtY7M5rIYT05JS2a+JwJ4Uu5GcobB6B8hEVefANOo7/A/fxSXI9vFVrKX9cZjgbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733102486; c=relaxed/simple;
	bh=hLoMaypYZnaI4cs7Bp9ZDv86FtdMuA1pqSZ8plCY1mU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D3Z42yg8h4KdVMZQkpkrgOXs9zS6SYKHonBH6A6Oe5B9e5y9OWSA+J1KIs4f/ps0aPovBkmeldJ4qz4qM6ITvJZHnlQj0BwqabAnbG/WwogMGP4TUrKKUGPBCm7QB+xXYNSAVZFKiok+bg/lbgssQbquxGmem+c1evAFPqw174I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a74CRRXO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a74CRRXO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733102484; x=1764638484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLoMaypYZnaI4cs7Bp9ZDv86FtdMuA1pqSZ8plCY1mU=;
  b=a74CRRXOMfWsGIfzW1ajHYuVq12/PRHQOE1ppPT+iXGqas9+yEbOf6Y9
   dgCTtwWUwJBoMW3dji2wqPn2ZazYH8QBCGT0PuMfafQOh7d/YJIKjcNwp
   Om09cYrmVv2mvgkxcvupXzzRwyb0+ztwSssn8LC4eoDc6POMAWD9U6hDR
   HnH1fDd7pUgOC+vnyENjRAa1WN98FIbcddDG0zt3BLru+9UylCumo5qV7
   WKov5FnOnxbfHRPBLvADzr6mtAknHuNMUK7a3sJhtKszfxRyeE9PZYJ23
   BjNuVxYW0wWJzmaAGidArSCcuDVPO4YY6nKjuLvytLH5j0BuLLaLEJgQC
   g==;
X-CSE-ConnectionGUID: QNfQoscjR0KzKaDW/N6Mew==
X-CSE-MsgGUID: NyC9o0JKQPC6bJejO0WC2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="36119814"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="36119814"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 17:21:23 -0800
X-CSE-ConnectionGUID: Te9a1TrjQgegmFcFyU4JrA==
X-CSE-MsgGUID: v+CdLLe+Ql+U0+Cp1juWeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="92604934"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Dec 2024 17:21:22 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHv6l-0001z1-34;
	Mon, 02 Dec 2024 01:20:27 +0000
Date: Mon, 2 Dec 2024 09:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1298/1298]
 arch/x86/include/asm/msr.h:272:9: warning: 'mcu_ctrl' may be used
 uninitialized
Message-ID: <202412020932.YwT4OkOM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 99dec2700cf36e58d3fdb295e1fed7e9d04a916c [1298/1298] x86/speculation: Add Gather Data Sampling mitigation
config: x86_64-buildonly-randconfig-006-20241118 (https://download.01.org/0day-ci/archive/20241202/202412020932.YwT4OkOM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020932.YwT4OkOM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020932.YwT4OkOM-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/bugs.c:2407:9: warning: no previous prototype for 'cpu_show_gds' [-Wmissing-prototypes]
    2407 | ssize_t cpu_show_gds(struct device *dev, struct device_attribute *attr, char *buf)
         |         ^~~~~~~~~~~~
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
