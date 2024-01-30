Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AD9EC4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 00:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706573425; cv=none; b=J6KIQ28/NrIYgyJ9wxyVfinC0bd+RonzeshVgfeGNW/iYGFB+kfHPgaeDyio8oibsd5nq9yhEhqu9Tb+AvclYtfYuCcycARqdF7xy1fXRkYzYbWzjMCufNg7jNAF22ZA2O0zLOySa80sO2IFnY29elvqA7gTR3NyVfhGwA2yT/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706573425; c=relaxed/simple;
	bh=a9/ly5vo0bxzuyjS9MH84esNYhVaSEd/Jabn5f0MMY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LuV82oR8f613nKDJ0vU0M5Yy78TUfMCh8/F5rkzEUYRtXe0ar3omAGXR4bfyQGRlC5caMnIisjx3IGuVUAtIPo7AkR8kgNA79v1sH5TdG9SOdLOIpFpJZ01PXlIhknYV1wFrE27cqXvWaeN7Y7WM+/HwHf7T74poAOfBS6UhgO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJq0fDVz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJq0fDVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706573423; x=1738109423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a9/ly5vo0bxzuyjS9MH84esNYhVaSEd/Jabn5f0MMY8=;
  b=AJq0fDVz0bJ12m0ERm8/Urw3l4NrgdAcZahjd2Pq0SkRPeqQVDq7dzZW
   xVspwd98/4eaqj54o/m/KJ4k5uB+CrDGSohIeXJHV9nqmpsVCirIx1kaE
   aQTYHcJymHb22L3ybe9Z1jPC1rIVlOQKBtkS+efGQOAZeUlA/r4C/H7ti
   6U7AsiTRJDTLn03dO1agerk+thO1d/UIiDMgGHtweeV8jrh2qTIW3VtoC
   Ju4WX8K+8o0wto8boQZx0jwF+cyyw55behKzaHWHrPLJXX5yYzV+hFEzX
   kjNpmayx+oa/pxOjcpcAxpbNsaC6Z650nq/vo5iVJ0DiwRAr3Lg2/0w4q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="24594567"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="24594567"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 16:10:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="858288391"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="858288391"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2024 16:10:20 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUbhi-0004k8-1a;
	Tue, 30 Jan 2024 00:10:18 +0000
Date: Tue, 30 Jan 2024 08:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21052/21589]
 arch/x86/include/asm/paravirt.h:150:32: warning: 'mcu_ctrl' may be used
 uninitialized in this function
Message-ID: <202401300802.zocYeDrt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ef2982312942ba96fb8217df5d832051bae4afd2
commit: 204b824482ac7eec274458871cf25e9d5baea20e [21052/21589] x86/speculation: Add force option to GDS mitigation
config: x86_64-randconfig-013-20240129 (https://download.01.org/0day-ci/archive/20240130/202401300802.zocYeDrt-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300802.zocYeDrt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300802.zocYeDrt-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/irqflags.h:72:0,
                    from include/linux/irqflags.h:16,
                    from include/linux/rcupdate.h:39,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/utsname.h:6,
                    from arch/x86/kernel/cpu/bugs.c:12:
   arch/x86/kernel/cpu/bugs.c: In function 'update_gds_msr':
>> arch/x86/include/asm/paravirt.h:150:32: warning: 'mcu_ctrl' may be used uninitialized in this function [-Wmaybe-uninitialized]
     wrmsr(msr, (u32)val, (u32)(val>>32));
                                   ^~
   arch/x86/kernel/cpu/bugs.c:669:6: note: 'mcu_ctrl' was declared here
     u64 mcu_ctrl;
         ^~~~~~~~


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
