Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9571231A056
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 13:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764682410; cv=none; b=u1/CnZPPatfzmLeh2UDlk0vdiK3kXubzF1bQm4AIDPKMSZPJLBvNBrtQFkJmG7z6/f2cNT0tRLgXa9uIJHGznfAaCbMKO0UyNjhbSFWhWc/vEJyMhnhSwssjifG5FHjqTbZBpznE7oEGDytOcl3XdP/uCW3x/G5KbfjoALkYQ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764682410; c=relaxed/simple;
	bh=Kj816YCfGkBwR59GasHaN56FL6lEtKGk/M7odgrbIK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e4GAQXBlZj+IC6nQs6/nE9WeOs5VjhWr6JXywgTdI544/AIE05rEIfTcjGBedtEsEXzhLKHTaaCGaPQZsB5atR/5S5iOGg/0XA3wQCZDifODwWokF5cTkckANx5kMVhBrFL29rAPlHcXW8MchrlGeDMF1C5XcRvlTSMcrkMSjqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbxMlNI9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbxMlNI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764682409; x=1796218409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kj816YCfGkBwR59GasHaN56FL6lEtKGk/M7odgrbIK0=;
  b=HbxMlNI9DLP0aniCkZUbAYSe2AaPFbAWwVuPO+12AtpDiF780+5xOQOl
   VE8EU3mwYU4GnXW0z5H0GnOSSvsKB3ABM7LCzdPmMvVJqB/gshVE/HgJq
   GwPpkytCjFhXrHvg6J2UHpFZosaLpCXTke1U5ADJBoQDhbRxf5UHow+3/
   Ta/2+ZvC4x0iHhZuM/Z71GuLQVH2wf6vc7Vn5V8VhgVZvgM4uD6vcSYut
   DmbQIcpLoAACqxUVjGSlUNj2JWnq6PHC1124Tm23Ja6liEv75fAQG+fHv
   uik5GGSGIDZxSU+AGRO8Ceq0opuLVe4McglOJU1muq5sXfxEs54nnKnFS
   g==;
X-CSE-ConnectionGUID: dTnvCoxGQTujOKymlZiHEw==
X-CSE-MsgGUID: 8ddTEG1UQ7uj43JtGUbvmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66592173"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66592173"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 05:33:29 -0800
X-CSE-ConnectionGUID: DXyajzkhT+O7sJyutSZ5bA==
X-CSE-MsgGUID: E+551Q0aRMuDUKkWAAnmQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="193671458"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Dec 2025 05:33:27 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQQVQ-000000009qn-1YEE;
	Tue, 02 Dec 2025 13:33:24 +0000
Date: Tue, 2 Dec 2025 21:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.1 28/28] kernel/bpf/bpf_struct_ops.c:1201:38:
 error: invalid use of undefined type 'struct cgroup'
Message-ID: <202512022152.gUxcfJzQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.3.1
head:   dca9f586d5471222d105b51cf2ceb5eb91fdda01
commit: dca9f586d5471222d105b51cf2ceb5eb91fdda01 [28/28] tmp
config: powerpc-randconfig-002-20251202 (https://download.01.org/0day-ci/archive/20251202/202512022152.gUxcfJzQ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512022152.gUxcfJzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512022152.gUxcfJzQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/bpf_struct_ops.c: In function 'bpf_struct_ops_link_attach_cgroup':
>> kernel/bpf/bpf_struct_ops.c:1201:38: error: invalid use of undefined type 'struct cgroup'
    1201 |  list_add(&st_link->links_list, &cgrp->bpf.struct_ops_links);
         |                                      ^~
   kernel/bpf/bpf_struct_ops.c: At top level:
   kernel/bpf/bpf_struct_ops.c:1205:32: warning: 'struct bpf_struct_st_link' declared inside parameter list will not be visible outside of this definition or declaration
    1205 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link);
         |                                ^~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_struct_ops.c: In function 'bpf_struct_ops_link_detach_cgroup':
   kernel/bpf/bpf_struct_ops.c:1211:21: error: passing argument 1 of 'bpf_oom_clear_link' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1211 |  bpf_oom_clear_link(st_link);
         |                     ^~~~~~~
         |                     |
         |                     struct bpf_struct_ops_link *
   kernel/bpf/bpf_struct_ops.c:1205:52: note: expected 'struct bpf_struct_st_link *' but argument is of type 'struct bpf_struct_ops_link *'
    1205 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   kernel/bpf/bpf_struct_ops.c:1219:2: error: implicit declaration of function 'cgroup_put'; did you mean 'cgroup_init'? [-Werror=implicit-function-declaration]
    1219 |  cgroup_put(st_link->cgroup);
         |  ^~~~~~~~~~
         |  cgroup_init
   kernel/bpf/bpf_struct_ops.c: In function 'bpf_struct_ops_link_create':
   kernel/bpf/bpf_struct_ops.c:1410:10: error: implicit declaration of function 'cgroup_get_from_fd'; did you mean 'cgroup_get_from_id'? [-Werror=implicit-function-declaration]
    1410 |   cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
         |          ^~~~~~~~~~~~~~~~~~
         |          cgroup_get_from_id
   kernel/bpf/bpf_struct_ops.c:1410:8: warning: assignment to 'struct cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1410 |   cgrp = cgroup_get_from_fd(attr->link_create.target_fd);
         |        ^
   cc1: some warnings being treated as errors


vim +1201 kernel/bpf/bpf_struct_ops.c

  1193	
  1194	static void bpf_struct_ops_link_attach_cgroup(struct bpf_struct_ops_link *st_link, struct cgroup *cgrp)
  1195	{
  1196		bpf_link_inc(&st_link->link);
  1197	
  1198		cgroup_lock();
  1199		WARN_ON(st_link->cgroup);
  1200		st_link->cgroup = cgrp;
> 1201		list_add(&st_link->links_list, &cgrp->bpf.struct_ops_links);
  1202		cgroup_unlock();
  1203	}
  1204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
