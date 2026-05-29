Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD3C4028F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 18:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780078305; cv=none; b=bkI2k4L305SOfoqzhFQYsltw5ujffc0ol0NT3TUEfdM1clrzeTrAN4hkGlQ0nAwxDAUEJk6BAc+FO7BtzGyS125MR4MS4sKadiOybK7hW8uUfcfFfX5A3CmVtYeQ0P/MgdN7nYgfySC4SKRBZb1W1Dcy5ZwibFsDqTy9BmisTMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780078305; c=relaxed/simple;
	bh=tuu95JOPbA3WR1tay4OMx7WnOzk/GS1P17DEqvkbg3k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oTSZI9J9e+RUFwWF41O4Ff2otvmL+a8oZPhEsEp3L09zH/cUILSAZtPBUrkye6rI6oBOAdOL4LibtxYO0SvIqDi5xllQ10vyaP24HFkyijtV2LQAOBsx1ce+td5iKs2ntyjK3r9CMankdHc3lDSb7c5JmCO1mtBBAHTPT8uBAFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LzUYlNYG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzUYlNYG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780078300; x=1811614300;
  h=date:from:to:cc:subject:message-id;
  bh=tuu95JOPbA3WR1tay4OMx7WnOzk/GS1P17DEqvkbg3k=;
  b=LzUYlNYG1Bl278HnCbH7sqXCJxtQ2m5+ZZxBcHZSgdn96E43NIUHNVtQ
   9OyrfE2lx8EmvkEt8mIetobeRuVrshPtd/2tLylbQ3dXF+T8VNijF89n9
   UiSZkEMRg329oJQPQJ00IHwqGHElmHXYJsyr80B2tpnx3r59H8n+DVtO5
   NSKFlR+ZX5oEQL1wrp8A6WgvC+ytcEaGcdvpuv9CWsWTrfdfFNI727C8n
   8CwFWnhdMyMlG2jlb5IGHWx45s4XjXNPe7pKjOgD9HVL4+/WHILacJxyN
   mGlDsCwYywe7x4qyuswZhfJAriIHuXjmV61XA25hn/MEcczJGWhvYWOtV
   g==;
X-CSE-ConnectionGUID: 5Cujb+hVT2GBwkcxKCqVxQ==
X-CSE-MsgGUID: UtqE4MRRSimRDvsrRoqHpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="83513697"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="83513697"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 11:11:39 -0700
X-CSE-ConnectionGUID: GmdDz05JSnCYb205+T/iVA==
X-CSE-MsgGUID: M69pGmxsRemMZIJkWej6Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="247203054"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 29 May 2026 11:11:38 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT1gG-000000000vZ-1BKr;
	Fri, 29 May 2026 18:11:36 +0000
Date: Fri, 29 May 2026 20:10:55 +0200
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 17/23] kernel/rootns.c:68:36: error:
 incomplete definition of type 'struct mnt_namespace'
Message-ID: <202605292033.syEKH8mq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   86a21721c8c825e8a083fff56e37007e355c0bc1
commit: 9131624df850013a118122968debfcf59383172b [17/23] rootns: Implement rootns_enter()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260529/202605292033.syEKH8mq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605292033.syEKH8mq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605292033.syEKH8mq-lkp@intel.com/

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
