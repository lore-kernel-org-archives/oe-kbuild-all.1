Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AB937A4B8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780072180; cv=none; b=IE0UaVQJuEHoWTWy6N3WPLcuI7XxTiaX6lAkSNwLner/I0uqb6qD5qYIFPuIh6cTDgeBffhvhe5eCCnAD9kygq0r8x7lnaqvsWV5tDmxQbp/KCMhet9St+BL/m8sl6Hyo12lo+VoE9Dr1W1emLV9VedHLjF1iGaG+Yprxc1MsxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780072180; c=relaxed/simple;
	bh=iFG7AzXxHX76C8ipF5tnzlHN5cLnnrGJZBvsb92nY7I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SwyxkemO2x5WKCujop2j+LOvFHrDjBkVppLYh786/sU9lKnYJJej9h/qWFKl0aOcob1AGgv7zAGzJafhFDQ6CHkveQtwr7AJeNrnAenYhSnJRC1wGKxgqgoLZ/Dc8D5IfazoD3SRiznWNehSuthkZFr4Xeg4UQ/IL8haa/rthj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXdafSrT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXdafSrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780072179; x=1811608179;
  h=date:from:to:cc:subject:message-id;
  bh=iFG7AzXxHX76C8ipF5tnzlHN5cLnnrGJZBvsb92nY7I=;
  b=IXdafSrToK69VWThZcAGIigY4zcFnnxlkQnZWKsOWcwbtOSyZn6d1+ZM
   ovapCO0YVmgYpagFMBSFDIRmY/+yQhyniNKKMEjwgFgKFkIISFlczSBiE
   1hIY+DRLGORwGgz+f7R+yLfWMrUuQjSNJ+jcq/+WQoPnEhCyNf4QR2nZf
   /qVuhJeSCNhIYLy2kRvzejVW8R5FP8oJRN35sXSS9GlLOHXQRt86IAqLv
   wWrX3HQHs5gGSY4SxgKNAk3ns7V+WohNjj+Ia4GFe2y37XEZ4Gengr0TJ
   2U5QAr+nnb/wOJp78AyMRU8nIe8OGlpwDfLGKzMq77WhfPRUUaBiu2QGE
   Q==;
X-CSE-ConnectionGUID: sI+i29qzTXKhCOXF57YGXw==
X-CSE-MsgGUID: gXmnbMGxT8iT4GjQQkrwmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="84786906"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="84786906"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 09:29:39 -0700
X-CSE-ConnectionGUID: Lfb/K5WfQx+mKffq5ersTA==
X-CSE-MsgGUID: zbTZci9SQQOjuxRmlbJt1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="238712433"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 29 May 2026 09:29:38 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT05X-000000000ut-36XT;
	Fri, 29 May 2026 16:29:35 +0000
Date: Fri, 29 May 2026 18:29:19 +0200
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 17/23] kernel/rootns.c:68:50: error:
 invalid use of undefined type 'struct mnt_namespace'
Message-ID: <202605291850.XlPlB9JH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   86a21721c8c825e8a083fff56e37007e355c0bc1
commit: 9131624df850013a118122968debfcf59383172b [17/23] rootns: Implement rootns_enter()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260529/202605291850.XlPlB9JH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291850.XlPlB9JH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291850.XlPlB9JH-lkp@intel.com/

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
