Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5751D432D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 13:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149029; cv=none; b=ovL4tZ5BinsuuMtcAhdInWibQnzFmLEF1UwxXPK9jUB6Zt4xOJFB7p+ckvtvATLmARtF6vMfkDjLLb0BO9+Z1vSr/4M4Cy4xxk1SBgzsL6sW83qZA0+jdxubvx1DWGaDfgez3/+kKzh6TjJYgU+ti4J7LpwtZbRsdahOK6Cy1hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149029; c=relaxed/simple;
	bh=B8NnLGCWJHWNFMUM3Aq2f7pI+vphReiU4ks8/15INyk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BINpAEvrGlIQctedWIcgjX7IXCvjNa2exhaIx1NgBy2DShOo/dHgID8pMQ0USxJdujBuNMh4PN+t9DEfjyaa+mhUlDCchnTIrM0l1WqMWUSfLMW2uxp5bAzer8zsf4jNvcQ0dCC+s6A/t4Uffbe1LlzkL3VsbA09d39YwCbtoP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncQki21L; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncQki21L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780149027; x=1811685027;
  h=date:from:to:cc:subject:message-id;
  bh=B8NnLGCWJHWNFMUM3Aq2f7pI+vphReiU4ks8/15INyk=;
  b=ncQki21L/Xy+L33w/r5fSAOVfc3UAchS+CLqHzFQioXVZYgAIq9spkei
   tWsr4p90B1MFSkKhcK1vCMfywCutxkC1IhWAag0EF1f4RYFx9y9DMOpoT
   cpflPkQOen8yIsc8eHcce1jFQnQqerd8gCy6swsCPF9hHko386ztNWv8n
   XNu5KHwop7KZ2XXiINMyWWnsrs+4Mgp6Hu5SYQ1WM+qhT1f1oU6uZfOZS
   o0+YsqDgMMf5HAMyB42QjqBOt9CMJG+VGB2Tce/ncu25qV5ukKgnJwrs4
   DL0+1Z5Qad/Xhza+AFt59tfkOzRiLYnS3Fx/7no1CxSNkJP5tYFWYlJqs
   Q==;
X-CSE-ConnectionGUID: tt3A67JSRhe/PkR5oRTLlw==
X-CSE-MsgGUID: 96jbeSHZT0iwndKWJzQEFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80118536"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="80118536"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 06:50:27 -0700
X-CSE-ConnectionGUID: J2kxakHIRcibf9CvTGJCNg==
X-CSE-MsgGUID: FcQBu+JyTp2Zp1tSktvQmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="240569150"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 May 2026 06:50:25 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTK51-000000008U6-1iKt;
	Sat, 30 May 2026 13:50:23 +0000
Date: Sat, 30 May 2026 21:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 17/23] kernel/rootns.c:68:50: error:
 invalid use of undefined type 'struct mnt_namespace'
Message-ID: <202605302121.Sx0wrc8z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   86a21721c8c825e8a083fff56e37007e355c0bc1
commit: 9131624df850013a118122968debfcf59383172b [17/23] rootns: Implement rootns_enter()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260530/202605302121.Sx0wrc8z-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605302121.Sx0wrc8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605302121.Sx0wrc8z-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rootns.c: In function 'rootns_tag_nsproxy':
>> kernel/rootns.c:68:50: error: invalid use of undefined type 'struct mnt_namespace'
      68 |                 rootns_tag_ns(rootns, &ns->mnt_ns->ns);
         |                                                  ^~


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
