Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851E93D646A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778933323; cv=none; b=YDUPXe4m4vOF3FuDg4BXjCX92f/fk4ogQj8bPOJXU1bVertW0o9Vvkd+Ifd6xbtmnJ/1I7Xfw493I3wdMwpI6d9kbgJpjXuynrZmTlL8f8qHRjm3t27WlxBegdxvRiEO+pvEmsCQKwXqZUyb52TBHjs6dTrhLygb+K8UW+F5buY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778933323; c=relaxed/simple;
	bh=ZGw2qyHgvTGPqSHTOfSXGjk6hvc9XKf2wHL2HVo7b54=;
	h=Date:From:To:Cc:Subject:Message-ID; b=udslpiXSuAl1CZ2NME1FyCrWm1yBlp35O/mPHulO08YnqNZOI/do1sJtHbLacSQyjngJ5eGLQrsRhvNLErsds4KfGi8qT3o67Vt9G52z2iAUqABB4/Ous0siCXHKfPYxKVnI+29gRZmWC9x1x5IXZJK7hjcjaxlGo3nq3d6+0kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTlRD33C; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTlRD33C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778933321; x=1810469321;
  h=date:from:to:cc:subject:message-id;
  bh=ZGw2qyHgvTGPqSHTOfSXGjk6hvc9XKf2wHL2HVo7b54=;
  b=CTlRD33C5N0u9h3HrlFcwlKR/hT99I7M4FcJ1K4odw5d/gQaFvZJooYA
   fGUJcQKzr1TPNX7FRYrMYZNxzxTGAsy2XDB1tueWeCpAUEJpy8oy6H0jB
   xQUJ/nE+phrTPMo4xvmHa3zRB8Li2DnGS2S+1OrouHWfSFxwmpP6YUX8d
   zr6tqk/bpWT+ozs2EhUnjOey6tQnVKyyDahRSDfafvOCor6bHUjRwheJD
   ZaYxbRiyJ9kJd4u9vP1v8oOjuOXwYLwXxTeLLoqX+JP3P2Btkwn9Q2SKQ
   5wk0SapzGk5P4c1PnzW6ql6cUZx4JX5h+7W9vCBRwhzWR8AmV1EKnZlCl
   Q==;
X-CSE-ConnectionGUID: 1KCHv48rSi6evFyEJlB+GA==
X-CSE-MsgGUID: igTFqAzTSACgP5PY9ugk/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90177039"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="90177039"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 05:08:38 -0700
X-CSE-ConnectionGUID: BrDLOovxSAiJ/MRTcFdgEg==
X-CSE-MsgGUID: YRMiEJj8TaW4zyJ3o2lPzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="239064559"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 May 2026 05:08:37 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wODon-000000000no-46Y8;
	Sat, 16 May 2026 12:08:33 +0000
Date: Sat, 16 May 2026 20:08:30 +0800
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:cgrp.struct_ops.v8 9/12]
 kernel/bpf/cgroup.c:31:6: warning: conflicting types for
 'bpf_cgroup_struct_ops_register' due to enum/integer mismatch; have
 'void(enum cgroup_bpf_attach_type,  u32,  void *, bool)' {aka 'void(enum
 cgroup_bpf_attach_type,  unsigned int,  void *, _Bool)'}
Message-ID: <202605162022.KKnVwAAL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git cgrp.struct_ops.v8
head:   1ae5eccb04d5d8c62c310b206b5e5dc4ff1d9c71
commit: 32e27daf9a1563276f88eb17d076f61f8cc8b502 [9/12] bpf: Add infrastructure to support attaching struct_ops to cgroups
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260516/202605162022.KKnVwAAL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605162022.KKnVwAAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605162022.KKnVwAAL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/cgroup.c:31:6: warning: conflicting types for 'bpf_cgroup_struct_ops_register' due to enum/integer mismatch; have 'void(enum cgroup_bpf_attach_type,  u32,  void *, bool)' {aka 'void(enum cgroup_bpf_attach_type,  unsigned int,  void *, _Bool)'} [-Wenum-int-mismatch]
      31 | void bpf_cgroup_struct_ops_register(enum cgroup_bpf_attach_type atype, u32 type_id,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/bpf/cgroup.c:16:
   include/linux/bpf-cgroup.h:115:6: note: previous declaration of 'bpf_cgroup_struct_ops_register' with type 'void(int,  u32,  void *, bool)' {aka 'void(int,  unsigned int,  void *, _Bool)'}
     115 | void bpf_cgroup_struct_ops_register(int atype, u32 type_id, void *cfi_stubs, bool tasks_trace);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +31 kernel/bpf/cgroup.c

    30	
  > 31	void bpf_cgroup_struct_ops_register(enum cgroup_bpf_attach_type atype, u32 type_id,
    32					    void *cfi_stubs, bool mult_rcu)
    33	{
    34		struct_ops_type_id[atype] = type_id;
    35		struct_ops_cfi_stubs[atype] = cfi_stubs;
    36		struct_ops_mult_rcu[atype] = mult_rcu;
    37	}
    38	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
