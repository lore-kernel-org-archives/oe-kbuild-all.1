Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727F2274B43
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 16:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496182; cv=none; b=Sn7WESesWpuJ6rpSeyE1pJM4kSZpuXkqxO3F6QPd6O23j9zGW7CO8POEvetrvnFQq6aucXxeSt5ualnHvF9e5aBJA1oiqJ1q2bS+QS+I0m/1l/+I/DCMMCYI1DHfgwK1f8vt788nG5G9ZlK/sU03FMM1XqRaDtQKi4PhNJeUaf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496182; c=relaxed/simple;
	bh=+IunzpUm9nmBaZuJvNEG95w9KSGxuyIa1sINIs/GAvU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mLMJqJSqvKZ3y/GZgfD3FNDPvim02R3dEaCfhK3F1j42DONzigGdiKUqjtf5KjThFymOGDxfbtqr7fY48YZyqmAKCSY/iFiQA8LmpTM3fijXu4zAtfpfJiRSSisK3YmCHOncBj057E/n8ZQd7AzisP+is73ibTnW57u7l9P0ftE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=keAjhHYj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="keAjhHYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768496181; x=1800032181;
  h=date:from:to:cc:subject:message-id;
  bh=+IunzpUm9nmBaZuJvNEG95w9KSGxuyIa1sINIs/GAvU=;
  b=keAjhHYjINIKTl9PvSuzEGh4fAoP+S8Pf7AzVdwecGkwvJp4MrmfXC5b
   dRgI10XE+O42XoeeZ+258Y2l83S8EPjfjHthg+oaTRhK9Vpfal3OVdaFn
   aeiNlKgpKeG6+8uhqNZdBcbLHCdlXk4Y8Kyu4U4wTKwoNuvGUn9krw2la
   52HRkwcwroPtFWbiU1/iKzS3mmjv+lZxT3snT7RQylLcw7P1iTOoQovFm
   4V4KVZGt+Im/H4JHNf82SEaJ+1j2Whnqj3DGZJlhYrVXixrjScYVFFhqS
   OcznNvCTFqEM9b3fuNQu7dnfpMBuo+hiPMPR7NHgQkHT9AxMhEDh2HK1f
   g==;
X-CSE-ConnectionGUID: 5o6lml0MTsC55MHGWYeriw==
X-CSE-MsgGUID: qGulma2IQoSHdEKjR2CgxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69857201"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69857201"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 08:56:20 -0800
X-CSE-ConnectionGUID: EwjemFBZSp693phcPswzIg==
X-CSE-MsgGUID: /gvp0Ha2Tnm69vA/JWz61w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jan 2026 08:56:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgQds-00000000IIo-2Wun;
	Thu, 15 Jan 2026 16:56:16 +0000
Date: Fri, 16 Jan 2026 00:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.9 8/16] mm/bpf_oom.c:107:13: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202601160032.yInQO0DO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.9
head:   9d2b723568aae6a6f7e41fc66f65f8b009690b6e
commit: 36dfd96fa3fbd7d4057fe22dfa657b62a9b6865b [8/16] mm: introduce BPF OOM struct ops
config: x86_64-randconfig-123-20260115 (https://download.01.org/0day-ci/archive/20260116/202601160032.yInQO0DO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160032.yInQO0DO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160032.yInQO0DO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/bpf_oom.c:51:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct bpf_map *map @@     got struct bpf_map [noderef] __rcu *map @@
   mm/bpf_oom.c:51:58: sparse:     expected struct bpf_map *map
   mm/bpf_oom.c:51:58: sparse:     got struct bpf_map [noderef] __rcu *map
>> mm/bpf_oom.c:107:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct bpf_struct_ops_link [noderef] __rcu *__new @@     got struct bpf_struct_ops_link *st_link @@
   mm/bpf_oom.c:107:13: sparse:     expected struct bpf_struct_ops_link [noderef] __rcu *__new
   mm/bpf_oom.c:107:13: sparse:     got struct bpf_struct_ops_link *st_link
   mm/bpf_oom.c:125:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct bpf_struct_ops_link [noderef] __rcu *__old @@     got struct bpf_struct_ops_link *st_link @@
   mm/bpf_oom.c:125:9: sparse:     expected struct bpf_struct_ops_link [noderef] __rcu *__old
   mm/bpf_oom.c:125:9: sparse:     got struct bpf_struct_ops_link *st_link
   mm/bpf_oom.c:125:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/bpf_oom.c:125:9: sparse:    struct bpf_struct_ops_link [noderef] __rcu *
   mm/bpf_oom.c:125:9: sparse:    struct bpf_struct_ops_link *

vim +107 mm/bpf_oom.c

    93	
    94	static int bpf_oom_ops_reg(void *kdata, struct bpf_link *link)
    95	{
    96		struct bpf_struct_ops_link *st_link = (struct bpf_struct_ops_link *)link;
    97		struct cgroup *cgrp;
    98	
    99		/* The link is not yet fully initialized, but cgroup should be set */
   100		if (!link)
   101			return -EOPNOTSUPP;
   102	
   103		cgrp = st_link->cgroup;
   104		if (!cgrp)
   105			return -EINVAL;
   106	
 > 107		if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
   108			return -EEXIST;
   109	
   110		return 0;
   111	}
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
