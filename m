Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20D612B71
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 21:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751233753; cv=none; b=MX3A7uTK4QKb/bWgl7/0RmGFkZbEu0BUouBHZ2Z8G/IePV3jM9WF/herOdJP87Hh3wjrUHooOus3jkq4AXiPzTPwFDlTRL5X9Rx9augy1JFO2s0zHsJxOBt92nMQot03J1soApF9NBTkcCbfbns/0Ry5VV3qe+RiVe+bAoH2goE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751233753; c=relaxed/simple;
	bh=b+o6Ne7Miy8hOafmplSJBTQPQbURUNwxKfNxsXCaKDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qqPqErHbqiaEPtiW9l3F9isiD+DvZgDNiCfnEJo/roFoTEv2X1wMX21u2qLhH5/xnOdAkDjHElvQVFVORfurvONUmSug3X3JoAZFhT0rf2bFtLZnRh2FBinln6pdqtPDUsGnVRuJ/sEuqtO6lY2Pz6brsRoQ0Xjp4N7UAB1KZn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8Mf5wGr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8Mf5wGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751233751; x=1782769751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b+o6Ne7Miy8hOafmplSJBTQPQbURUNwxKfNxsXCaKDk=;
  b=i8Mf5wGroYha6O2nDZFO/SoBl1JnYBM91h45asH22Jo7h7OXCufN4MVq
   hOeyd1ubBD+rrIo7vtg1GyHqfi364EJigkkJCJlazVC36EfvlWe9hEfFj
   GyEPv7YLaJGeDjrEzPrU4kI2Q2QitSFq1+tkeSrbTLO8R+XbFDyHjR3Rx
   0aLQ/0QuiRglanZ5u2QmyQyomiSnLeVDnEAZ83TCveqNu4f90AsCPLR2J
   U5vByPTGU8LWLCqddihnt/M6wzZdZnXRmIEvtQqhcfi9+pQnhVfH5Kvfz
   qvhCIaw9GOaFuVv245sB6J8jqkkWJODh4gWnlJ9G61WQRbK7EADJAr/B6
   g==;
X-CSE-ConnectionGUID: uCeCL1obS2mujvith5dilg==
X-CSE-MsgGUID: I8zsbWxsQ2KbKjjCsqGa6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53552095"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="53552095"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 14:49:11 -0700
X-CSE-ConnectionGUID: 50J/rCo/SuawMjpQFoOC1g==
X-CSE-MsgGUID: fTXu2samTLes6g7WDbW4sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="153028995"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 29 Jun 2025 14:49:10 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVzta-0000yx-3A;
	Sun, 29 Jun 2025 21:49:06 +0000
Date: Sun, 29 Jun 2025 23:48:55 +0200
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.3 16/16] kernel/sched/bpf_psi.c:149:6: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is false
Message-ID: <202506292338.SPuyS0gJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.3
head:   2ad0d39d05d59bc3930ed54991a90d397fd498a8
commit: 2ad0d39d05d59bc3930ed54991a90d397fd498a8 [16/16] sched: psi: introduce BPF_PSI struct ops
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250629/202506292338.SPuyS0gJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506292338.SPuyS0gJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506292338.SPuyS0gJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
>> kernel/sched/bpf_psi.c:149:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     149 |         if (IS_ERR_OR_NULL(t)) {
         |             ^~~~~~~~~~~~~~~~~
   kernel/sched/bpf_psi.c:159:9: note: uninitialized use occurs here
     159 |         return ret;
         |                ^~~
   kernel/sched/bpf_psi.c:149:2: note: remove the 'if' if its condition is always true
     149 |         if (IS_ERR_OR_NULL(t)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/bpf_psi.c:123:9: note: initialize the variable 'ret' to silence this warning
     123 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +149 kernel/sched/bpf_psi.c

   114	
   115	static int bpf_psi_ops_reg(void *kdata, struct bpf_link *link)
   116	{
   117		struct bpf_psi_ops *ops = kdata;
   118		struct cgroup *cgroup = NULL;
   119		struct psi_group *group;
   120		struct bpf_psi *bpf_psi;
   121		struct psi_trigger *t;
   122		struct psi_trigger_params params;
   123		int ret;
   124	
   125		if (ops->cgroup_id) {
   126			cgroup = cgroup_get_from_id(ops->cgroup_id);
   127			if (IS_ERR_OR_NULL(cgroup))
   128				return PTR_ERR(cgroup);
   129	
   130			group = cgroup_psi(cgroup);
   131		} else {
   132			group = &psi_system;
   133		}
   134	
   135		bpf_psi = bpf_psi_create(ops, ops->cgroup_id);
   136		if (!bpf_psi) {
   137			ret = -ENOMEM;
   138			goto exit;
   139		}
   140	
   141		params.type = PSI_BPF;
   142		params.res = PSI_MEM;
   143		params.privileged = true;
   144		params.bpf_psi = bpf_psi;
   145		params.threshold_us = 100000;
   146		params.window_us = 1000000;
   147	
   148		t = psi_trigger_create(group, &params);
 > 149		if (IS_ERR_OR_NULL(t)) {
   150			bpf_psi_free(bpf_psi);
   151			ret = PTR_ERR(t);
   152			goto exit;
   153		}
   154	
   155		ops->bpf_psi = bpf_psi;
   156	exit:
   157		if (cgroup)
   158			cgroup_put(cgroup);
   159		return ret;
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
