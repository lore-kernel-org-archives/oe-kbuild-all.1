Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDD010E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 00:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713399113; cv=none; b=VrPliMnZIwuWR+y9maJAtEUvGGCa8f3vQcYj+q1X/QHr0R7bGXDsDo5CuNiP44qsb5JXTLvwEFIa/Wu4NbverdA/uWHZZY2TV3JrVPqnUnna+lkPXzNkZb4cBUKpqolS3YYDu7STQfBnCsc6L8O+YAVLUgrtOxZXBXqX7Tx8Ijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713399113; c=relaxed/simple;
	bh=5Sj1p7fXmiBRzUJHuCuEwv2pSWxaA0eEmx/c+NbXC5s=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O1/Xfdu/rVNdBIZtCekg+nYRsFBuCj9+qUa6IS8m+qZUI2fUlPjGKAtXCuIII+Y/vEB3qntOEDcPv9u4CGK74Msf7mzwEGbwZ6IzRCrLhL1El5RN6kb9H3IgsgjfQo/KMtRaq4eivHuNNiMMXyPp56vPvfaK0DM8cd7QJeYcmt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsfixJpL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsfixJpL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713399112; x=1744935112;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5Sj1p7fXmiBRzUJHuCuEwv2pSWxaA0eEmx/c+NbXC5s=;
  b=IsfixJpLJLs02YsGIrQoSo6AtIqoqvckeLtjgOwZqS5fAIEV/DeS5hPZ
   oIepCuWdl/9bWrpdDhumBV2tL6h1YotNatpx1fiPMtrUhptrNuBizc3M+
   9LmMAhZT+u6BdNs6gXhpW7Yxv39/yu9eeneWrgWW0F+bwsk6SS3mPkL3g
   wTwuRmoSxmX7P351olxL4xzmPwDPzy3G0GZryvZFizbo4Xw90Gx8vFX4g
   f30XyL3Hm7WpPYzHINC4BfljI5nsW/tZsPKJwoN4vkOumg1xc+IB41DHl
   SC32qBXAPO7cd0TQM3KXxCmO9FttFM+VgOWkBovurdFvXxncY3/LbJGi7
   A==;
X-CSE-ConnectionGUID: bWwH9uUcQYKRzZ+vp0qMSg==
X-CSE-MsgGUID: eJPRuVylRDm+fxJgRUhBFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12701929"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="12701929"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 17:11:51 -0700
X-CSE-ConnectionGUID: oZYja1QMRKW1NkuzQ6BBYw==
X-CSE-MsgGUID: 0zpW4YCNT8WJnrW2vTzbDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="27216611"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Apr 2024 17:11:50 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxFNT-00076y-0b;
	Thu, 18 Apr 2024 00:11:47 +0000
Date: Thu, 18 Apr 2024 08:11:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:6.1/dovetail-xenomai 16953/19260]
 arch/arm/kernel/ptrace.c:208:9: error: implicit declaration of function
 'mark_trap_entry'
Message-ID: <202404180846.nPLMoj8D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philippe,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   aadad7185b99f2a8ede59357fbdc2ac6b17d95d4
commit: aa0b4997697a45275adce7baf2abc76a69973778 [16953/19260] ARM: dovetail: route traps
config: arm-randconfig-002-20240418 (https://download.01.org/0day-ci/archive/20240418/202404180846.nPLMoj8D-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404180846.nPLMoj8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404180846.nPLMoj8D-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/ptrace.c: In function 'break_trap':
>> arch/arm/kernel/ptrace.c:208:9: error: implicit declaration of function 'mark_trap_entry' [-Werror=implicit-function-declaration]
     208 |         mark_trap_entry(ARM_TRAP_BREAK, regs);
         |         ^~~~~~~~~~~~~~~
>> arch/arm/kernel/ptrace.c:208:25: error: 'ARM_TRAP_BREAK' undeclared (first use in this function)
     208 |         mark_trap_entry(ARM_TRAP_BREAK, regs);
         |                         ^~~~~~~~~~~~~~
   arch/arm/kernel/ptrace.c:208:25: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm/kernel/ptrace.c:210:9: error: implicit declaration of function 'mark_trap_exit'; did you mean 'early_trap_init'? [-Werror=implicit-function-declaration]
     210 |         mark_trap_exit(ARM_TRAP_BREAK, regs);
         |         ^~~~~~~~~~~~~~
         |         early_trap_init
   arch/arm/kernel/ptrace.c: At top level:
   arch/arm/kernel/ptrace.c:855:16: warning: no previous prototype for 'syscall_trace_enter' [-Wmissing-prototypes]
     855 | asmlinkage int syscall_trace_enter(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/ptrace.c:883:17: warning: no previous prototype for 'syscall_trace_exit' [-Wmissing-prototypes]
     883 | asmlinkage void syscall_trace_exit(struct pt_regs *regs)
         |                 ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mark_trap_entry +208 arch/arm/kernel/ptrace.c

   205	
   206	static int break_trap(struct pt_regs *regs, unsigned int instr)
   207	{
 > 208		mark_trap_entry(ARM_TRAP_BREAK, regs);
   209		ptrace_break(regs);
 > 210		mark_trap_exit(ARM_TRAP_BREAK, regs);
   211		return 0;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
