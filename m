Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C1E38A712
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 19:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770666958; cv=none; b=bGEweqmXc/D+I5RB2IKyfk5ZOLzFzbT2CEv2P2GjPE36rczL9b2pASB8a5BK4QA19gj+8EMeOgSDq6QCLgdy/cmDzkqCePkpfF1/IpBUtnyDFUrC6XTLVcwVuGcUQ5Jmfn2q0cV664p1teTqlM1K8mrtJo10WnbQxohwuUNcPj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770666958; c=relaxed/simple;
	bh=F4ER3Zy8HzA97raMdTzBSMeOQny6Qr7Lboe+QjXJr8c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FYHw9WskAEJDeGPZbEKazgsAMOe1LNlNfpyV1G4MxZF/TKgjKaandwNk1uPsIIOB9uSUv8brVxhvdO9biGWDjmMbkwumO5H0fnbVUBrBnxcssV/5eytu6uk+2TLAd6QopdLc/Ez6maWsdSeg8A8DTPLHvAcTPYRM1O3Wclx7HDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEerw3Uy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEerw3Uy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770666959; x=1802202959;
  h=date:from:to:cc:subject:message-id;
  bh=F4ER3Zy8HzA97raMdTzBSMeOQny6Qr7Lboe+QjXJr8c=;
  b=OEerw3Uy2Nwm5B8YPggorcMDWdDLUuxFE5dvCOhLorQARkcL8W4oxX/c
   P3/WQQYAu7/dWVZPkLLmDcBEUO0W1is7jsWrsBLwsziBl6RvlDArNirp/
   N92p1sRvM3VjjsA/7ZdZms/DvLZg7d+foj+65sIJB+pjnYcmNBDb279DA
   tgWqBOhXrYCL0Ai1O2ECmwpmtQgZWtzAEkven6z2heFGESgZ5if0GUrKh
   dAZ/tVfK5azWORbrDWs9zKCNIpi72Ku0uf8/6OqzSfEyvCCJptmH6H4nq
   nHHjm7CKq5+sAky+hA6Y3pP3BRm4U0nEQwTktXQeyD+Zd7fs8srf6+yza
   A==;
X-CSE-ConnectionGUID: YqCcTbCCRaKLQxWQtEh0cg==
X-CSE-MsgGUID: NZpCwfR+QYGNxHZItmwz3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83228726"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="83228726"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 11:55:58 -0800
X-CSE-ConnectionGUID: BZIJE3weSKSEJ0NlLrbuGA==
X-CSE-MsgGUID: bHstyZAqQHimC/ZUGp0yXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211694787"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 11:55:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpXMP-00000000oHy-3VAv;
	Mon, 09 Feb 2026 19:55:53 +0000
Date: Tue, 10 Feb 2026 03:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
 JP Kobryn <inwardvessel@gmail.com>
Subject: [linux-next:master 1915/12313] mm/bpf_memcontrol.c:125:27:
 sparse: sparse: symbol 'bpf_mem_cgroup_memory_events' was not declared.
 Should it be static?
Message-ID: <202602100356.JsbxJfBW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   132737e360b4c0daa7f473faf0f55cb04ee3e15c
commit: 99430ab8b804c26b8a0dec93fcbfe75469f3edc7 [1915/12313] mm: introduce BPF kfuncs to access memcg statistics and events
config: alpha-randconfig-r123-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100356.JsbxJfBW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100356.JsbxJfBW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100356.JsbxJfBW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/bpf_memcontrol.c:125:27: sparse: sparse: symbol 'bpf_mem_cgroup_memory_events' was not declared. Should it be static?
   mm/bpf_memcontrol.c:68:9: sparse: sparse: context imbalance in 'bpf_get_mem_cgroup' - different lock contexts for basic block

vim +/bpf_mem_cgroup_memory_events +125 mm/bpf_memcontrol.c

   117	
   118	/**
   119	 * bpf_mem_cgroup_memory_events - Read memory cgroup's memory event value
   120	 * @memcg: memory cgroup
   121	 * @event: memory event id
   122	 *
   123	 * Return: The current value of the memory event counter.
   124	 */
 > 125	__bpf_kfunc unsigned long bpf_mem_cgroup_memory_events(struct mem_cgroup *memcg,
   126							       enum memcg_memory_event event)
   127	{
   128		if (unlikely(event >= MEMCG_NR_MEMORY_EVENTS))
   129			return (unsigned long)-1;
   130	
   131		return atomic_long_read(&memcg->memory_events[event]);
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
