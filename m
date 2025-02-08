Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A915D1A0BF3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739004811; cv=none; b=bt1vK5Zg0vNw+wcaEm6dNQz5RVYfSei8NWbaokl7al2UHPSMm6crPtfyVZfErI0pJ7vak1HbhdbsulVXk5kfyIIwasLnu2dC9Ai6i65CAWXM8e2nEzVAtpD/Bqp707q90cRxyfaBhFNXD2/B/Gl5OtyZamII1D/V57K0fjQMhYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739004811; c=relaxed/simple;
	bh=JvJBIZPZ1aUGkl5fKpCkO5TrGVRSPBHBxFGEJtfGwUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KPMq01RBBjk5qhE6PtOa9OSPnJOFCfZTp8YMVBr906Lu2jPE8JTD5GucaBHwCza6R4Ft70RtkDQJUm8AAALIu8YwTgbOmw1zAlv1YNH9kkfDD/g01RUzUMWISnuqQzyDOFh/92dDS/5snPFvUmywh15EMnVpcqOgtbIueAD8+nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csPuLBuw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csPuLBuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739004809; x=1770540809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JvJBIZPZ1aUGkl5fKpCkO5TrGVRSPBHBxFGEJtfGwUo=;
  b=csPuLBuwBtpri0vuJcX+oPuphLV0XDRLrljVV61LIlV35k3wEjuAfOD2
   F/ZZ9FwTECuII58jcjwrLkMtSPfl0KDm3DNQs0Z4iSmWlB9FTpBB5pQ5Q
   tx4MQle0jT0b3lvDyLS78oUtlsWtw/0yyFFZyZEnCCWLWAYgSeh05l2I5
   dQ72WWw5KLv99VRR69CnK/ZGzarhZ7sbzaO9GE9Hcp9X8I3dbMJBJaXww
   tJj4tNalOT0q2VdQ32FiXeH0v9+tdsrq2ooz5TsB+GPvCwZGofeH0cU1A
   3kQpbelWnBDZOh7Pfy5nw5HkAzccmc5yE+0pgL6QtVQuDZdTn3Gbu977N
   g==;
X-CSE-ConnectionGUID: EnVcC67bSVa7DBo6QeyBqQ==
X-CSE-MsgGUID: 5LIgsd1iTsK6sMMHYL+A5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="51034825"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="51034825"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 00:53:29 -0800
X-CSE-ConnectionGUID: FiszI/iIQiedYp7YEXcrCg==
X-CSE-MsgGUID: +tarZ30LSeGVMoo3x2F9kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="111661041"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Feb 2025 00:53:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tggab-000zln-2q;
	Sat, 08 Feb 2025 08:53:25 +0000
Date: Sat, 8 Feb 2025 16:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_13 8/18]
 arch/sparc/kernel/uprobes.c:312:1: error: conflicting types for
 'arch_uretprobe_hijack_return_addr'; have 'long unsigned int(long unsigned
 int,  struct arch_uprobe *, struct pt_regs *)'
Message-ID: <202502081611.DZ3gwX8Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_13
head:   a264266ebd33899155a0cf37feac0ef4e300cec0
commit: 85aaa08bbe04ed3e8d2e4d5baa6325bff9cd6817 [8/18] uprobes: Add struct arch_uprobe to arch_uretprobe_hijack_return_addr
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20250208/202502081611.DZ3gwX8Y-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081611.DZ3gwX8Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081611.DZ3gwX8Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/sparc/kernel/uprobes.c:312:1: error: conflicting types for 'arch_uretprobe_hijack_return_addr'; have 'long unsigned int(long unsigned int,  struct arch_uprobe *, struct pt_regs *)'
     312 | arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr, struct arch_uprobe *auprobe,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/highmem.h:5,
                    from arch/sparc/kernel/uprobes.c:13:
   include/linux/uprobes.h:219:22: note: previous declaration of 'arch_uretprobe_hijack_return_addr' with type 'long unsigned int(struct arch_uprobe *, long unsigned int,  struct pt_regs *)'
     219 | extern unsigned long arch_uretprobe_hijack_return_addr(struct arch_uprobe *auprobe, unsigned long trampoline_vaddr,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +312 arch/sparc/kernel/uprobes.c

   310	
   311	unsigned long
 > 312	arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr, struct arch_uprobe *auprobe,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
