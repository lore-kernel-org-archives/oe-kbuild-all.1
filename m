Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C9634575D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780158363; cv=none; b=ZrGOx6A7bXBk+3UjAek4kNg/CcZsMcbHOO5V3cvGvLAiEYSQiovvdX9YX2Us/y30Bs8I3geCNITb1ZOSZ+UAC75Zn2mutIcyUb0yDq907oZLUq5a3qlRXhcVO4Ier35kmeenRHj1u9as3HOhySq2O8zfRxOJWPY+CeU1kP18BjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780158363; c=relaxed/simple;
	bh=Ddww3+Y7G31arSPrf8U3We2LTkJF+qCYhuY4Pd7CNsE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pwEXzo3kkF5M1QMfrq9Tm/48IV1/lTu7WA2KwxVeGKMB+josjLcETeDmL1457jRqP4qPWLB4akKLfXNh69JsemGutZqOf73J83C2oDEo/Bicha8juIiv+GqJn7OTrl9X0teIupIsYdXccGuAvze2zAqakt5kyrzKbvIpms3LD7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjpYfWBx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjpYfWBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780158360; x=1811694360;
  h=date:from:to:cc:subject:message-id;
  bh=Ddww3+Y7G31arSPrf8U3We2LTkJF+qCYhuY4Pd7CNsE=;
  b=SjpYfWBx5eauMd/mGQU2B5Iz1ntoXTi6iD2d49q3zXDxghC1rL6x2rVG
   OSwQik6TrQ6+/pIOAY4/lqpvuqlii8KpNkbG3wGKhTpzUYBMGdHxNu8qu
   f0Pa/BOnOfTW4BZsDIEWnhCXDn5n67JFkFnPLOX1qBI4+U65EV73SsPQQ
   1AKMbzHnt4cZ/LSQVZANwzZ5E/ZjI4jqOC7dj7PtdPYwe9bUBuD9xDHwR
   6q5dgPM1P0kTdNU2IgqqvKJACg/YFU21iYrdaXDW58woZN8jcWi9ZDoTj
   4EqAoL9lBgxAN1gT0YgUX/mAUcOlUjDHvzAAahuglsrPfOM/E0rJ8Of4U
   g==;
X-CSE-ConnectionGUID: VqMyMxPsSx6egeNvrQZYrQ==
X-CSE-MsgGUID: TqBcmWcCTHeFAPPtp37GZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="80833015"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="80833015"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 09:25:59 -0700
X-CSE-ConnectionGUID: ExefeB9RTfem6oWecjwQ7A==
X-CSE-MsgGUID: MHLdjqIBSVikzogARrAXzA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 May 2026 09:25:58 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTMVY-000000008eg-2HDv;
	Sat, 30 May 2026 16:25:56 +0000
Date: Sun, 31 May 2026 00:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 17/23] kernel/rootns.c:68:36: error:
 incomplete definition of type 'struct mnt_namespace'
Message-ID: <202605310016.muOq6iCB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   86a21721c8c825e8a083fff56e37007e355c0bc1
commit: 9131624df850013a118122968debfcf59383172b [17/23] rootns: Implement rootns_enter()
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260531/202605310016.muOq6iCB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605310016.muOq6iCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605310016.muOq6iCB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rootns.c:68:36: error: incomplete definition of type 'struct mnt_namespace'
      68 |                 rootns_tag_ns(rootns, &ns->mnt_ns->ns);
         |                                        ~~~~~~~~~~^
   include/linux/nsproxy.h:9:8: note: forward declaration of 'struct mnt_namespace'
       9 | struct mnt_namespace;
         |        ^
   1 error generated.


vim +68 kernel/rootns.c

    61	
    62	void rootns_tag_nsproxy(struct rootns *rootns, struct nsproxy *ns, u64 flags)
    63	{
    64		if (!rootns || !ns)
    65			return;
    66	
    67		if (flags & CLONE_NEWNS)
  > 68			rootns_tag_ns(rootns, &ns->mnt_ns->ns);
    69	#ifdef CONFIG_UTS_NS
    70		if (flags & CLONE_NEWUTS)
    71			rootns_tag_ns(rootns, &ns->uts_ns->ns);
    72	#endif
    73	#ifdef CONFIG_IPC_NS
    74		if (flags & CLONE_NEWIPC)
    75			rootns_tag_ns(rootns, &ns->ipc_ns->ns);
    76	#endif
    77	#ifdef CONFIG_PID_NS
    78		if (flags & CLONE_NEWPID)
    79			rootns_tag_ns(rootns, &ns->pid_ns_for_children->ns);
    80	#endif
    81	#ifdef CONFIG_CGROUPS
    82		if (flags & CLONE_NEWCGROUP)
    83			rootns_tag_ns(rootns, &ns->cgroup_ns->ns);
    84	#endif
    85	#ifdef CONFIG_NET_NS
    86		if (flags & CLONE_NEWNET)
    87			rootns_tag_ns(rootns, &ns->net_ns->ns);
    88	#endif
    89	#ifdef CONFIG_TIME_NS
    90		if (flags & CLONE_NEWTIME)
    91			rootns_tag_ns(rootns, &ns->time_ns_for_children->ns);
    92	#endif
    93	}
    94	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
