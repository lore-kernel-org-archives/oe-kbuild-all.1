Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA1155792
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 19:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710186779; cv=none; b=R5Cogw5/aZ9YvBZpOOYxc64cMOkeaquEKykwvzHe0Ciav/MttbhDqxKEONX/USDqbChpWcfTKfRY6orAr+JXzx8cEieIBJtNDA8GYTOX+EtATVnYL5pk6XMXVUp/EhKNRUJB447ZIPAZ9ea6ApN2waaAuDHRlWvYwiM6Qv4x9k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710186779; c=relaxed/simple;
	bh=VQ5airRyukx9l8P1GlBKabCIZiSZqjN/GJ1tTpWhemI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9OLhc11Xt/LfYE5+nG1yIEWtZ8GiZ9qAcnkemclPWNEXMZvO5kSLBuFDJ9dEA3HzAawHqjNEU8iWLtJhvFI4vMn1xbT3gQb7246xnekv7mv5k2kTpAPuAXPMUtJozWEKsQt0n7nyx99aiYLZ6AVjy48RW8SCGbVVaFhgpEoRk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpyaqPPP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpyaqPPP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710186777; x=1741722777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VQ5airRyukx9l8P1GlBKabCIZiSZqjN/GJ1tTpWhemI=;
  b=dpyaqPPPveuMg6wXIc5/6gV0k4LOOpy2g4xkZ4f/BqEKOOujumCyfZGj
   OnaFUMXfd9uBU5nZssx4XEDdHGMTjAQHRRd3rTcHlrrZmio9opFcCJGWQ
   sgR/qUllSCIgNXuwFCHTDzACS3xy8gOL11qCmIW6MhBtV3/44ZZTIbLU+
   iN5PfmPjwoELpoG0tqe9iyFZWHhIFkuKhZbyTEQiRXspPasnKN7VIteTK
   cELkAVp7jsnIkzFj2z3H1Mg0DXzLowSew7dz6AHX1kS14JR3d3UVnsmaB
   OE0PGzOlhpkH6HolZN3YzmQqWC7MwobtuRUlIbQL5yDOPc2s1FWexm2qv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4724166"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4724166"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 12:52:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="11369956"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Mar 2024 12:52:56 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjlhd-0009PJ-1R;
	Mon, 11 Mar 2024 19:52:53 +0000
Date: Tue, 12 Mar 2024 03:52:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_uprobe_6 1/2]
 arch/x86/kernel/uprobes.c:1110:44: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202403120333.TR6DS6bp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_uprobe_6
head:   89ec186aa763b7de4f2846f57d5f7ffc38d72077
commit: c46975c90ceef8ec72cfa1826b02ebea142c1787 [1/2] uprobe: Add syscall to speed up return probe
config: x86_64-randconfig-121-20240311 (https://download.01.org/0day-ci/archive/20240312/202403120333.TR6DS6bp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120333.TR6DS6bp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120333.TR6DS6bp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/uprobes.c:1110:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   arch/x86/kernel/uprobes.c:1110:44: sparse:     expected void const [noderef] __user *from
   arch/x86/kernel/uprobes.c:1110:44: sparse:     got void *

vim +1110 arch/x86/kernel/uprobes.c

  1102	
  1103	SYSCALL_DEFINE1(uprobe, unsigned long, cmd)
  1104	{
  1105		struct pt_regs *regs = task_pt_regs(current);
  1106		unsigned long ax, err;
  1107	
  1108		uprobe_handle_trampoline(regs);
  1109	
> 1110		err = copy_from_user((void*) &ax, (void *) regs->sp, sizeof(ax));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
