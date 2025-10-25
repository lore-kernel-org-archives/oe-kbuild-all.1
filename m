Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C6421A94F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 19:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761419904; cv=none; b=QmY/6s39PRTQxzPmkRX5Xuh2wZlPrTtauA6LPLEYOqXMe+tnZ7oY06erlVqw9B1SB+JIllGlYncvHbAzg83qN3UUqcySTV0IPbmwdpn/YkU8UhOyaR0cfgzCbo3NxZ7eNYFCeY8uglfMGH7oPUpu2z88kxrHEjDQXGyg3LrPrgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761419904; c=relaxed/simple;
	bh=YoTQuRZ8qeWL8cJHSuDJMvTHFyASo9Vgm0TSPcAqXj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JqrGjX87C7ZGbApXZpLUfyfF+6ZY4VhtT/6X9B/L8eCYgGstw2XXLtLmsd1EN54ZRJoUiq+bVU8T2wV4/HJ1jWjELeoTfay88xCE18i8TmqTq65IocMJWVCBe9sXjO126Hj54RusW/1bVLMPAsKuoe8R0krD9UYygjb7S5SjC6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6DUeFP+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6DUeFP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761419903; x=1792955903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YoTQuRZ8qeWL8cJHSuDJMvTHFyASo9Vgm0TSPcAqXj0=;
  b=e6DUeFP+5H6kKWxWJFYbkHIZnltPONVSOzLNCN4IDTGqZDq18ARg/pZn
   AKv2bUqQgIroPq4F/VI6NLN6Xt2u4LqdGUsFrHg2G9AC+w/ZRjerUZnc6
   Rsa+a1TO30huJWEBDk/1th1zfWH2YSbJqNoj+LyVbD3+tX0Vjbfd94fis
   DSdIo+Nm/WvA5cQqoBW71/Im9F5f35roRJ15amR5jYWUgtsqosY6qYEu6
   /0x0Hheh+cDbHD/1YnMw/FY9qMmNE7y012NHIwBYEHx5tHN1K0rNVyGXq
   4RTBIXnNsc/aFaNeSjLF/JlEZtmAD8RSF3+UeAVdNSgHngcVya7uXs7/s
   A==;
X-CSE-ConnectionGUID: +nV5NpZtS1yHPZWzvRSnMw==
X-CSE-MsgGUID: qNi1X3IYRES08cl3vwCgPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81188851"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="81188851"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 12:18:22 -0700
X-CSE-ConnectionGUID: RYIQOZYfQeikpcAz1/T0mw==
X-CSE-MsgGUID: N/We/cWJScKpSKX5dHRnug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="221891022"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Oct 2025 12:18:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCjlx-000FXN-0u;
	Sat, 25 Oct 2025 19:18:00 +0000
Date: Sun, 26 Oct 2025 03:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2 7/23] mm/bpf_oom.c:26:39: error: incomplete
 definition of type 'struct mem_cgroup'
Message-ID: <202510260310.6emG5dHp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2
head:   194ef7577149bb29fcf3275cc48daca598608313
commit: e70cb51b60e62a94b18bfc7fa711f3f3afd0a7c0 [7/23] mm: introduce BPF struct ops for OOM handling
config: hexagon-randconfig-r051-20251026 (https://download.01.org/0day-ci/archive/20251026/202510260310.6emG5dHp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260310.6emG5dHp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260310.6emG5dHp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/bpf_oom.c:26:39: error: incomplete definition of type 'struct mem_cgroup'
      26 |                 exec_ctx.cgroup_id = cgroup_id(memcg->css.cgroup);
         |                                                ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:49:32: error: incomplete definition of type 'struct mem_cgroup'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                         ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:49:32: error: incomplete definition of type 'struct mem_cgroup'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                         ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:49:32: error: incomplete definition of type 'struct mem_cgroup'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                         ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:49:32: error: incomplete definition of type 'struct mem_cgroup'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                         ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:49:32: error: incomplete definition of type 'struct mem_cgroup'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                         ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:49:32: error: incomplete definition of type 'struct mem_cgroup'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                         ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:49:32: error: incomplete definition of type 'struct mem_cgroup'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                         ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:49:32: error: incomplete definition of type 'struct mem_cgroup'
      49 |                 bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                         ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:120:27: error: incomplete definition of type 'struct mem_cgroup'
     120 |                 bpf_oom_ops_ptr = &memcg->bpf_oom;
         |                                    ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:151:27: error: incomplete definition of type 'struct mem_cgroup'
     151 |                 bpf_oom_ops_ptr = &memcg->bpf_oom;
         |                                    ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:178:31: error: incomplete definition of type 'struct mem_cgroup'
     178 |         bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                 ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:178:31: error: incomplete definition of type 'struct mem_cgroup'
     178 |         bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                 ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:178:31: error: incomplete definition of type 'struct mem_cgroup'
     178 |         bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                 ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:178:31: error: incomplete definition of type 'struct mem_cgroup'
     178 |         bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                 ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:178:31: error: incomplete definition of type 'struct mem_cgroup'
     178 |         bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                 ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;
         |        ^
   mm/bpf_oom.c:178:31: error: incomplete definition of type 'struct mem_cgroup'
     178 |         bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                 ~~~~~^
   include/linux/mm_types.h:35:8: note: forward declaration of 'struct mem_cgroup'
      35 | struct mem_cgroup;


vim +26 mm/bpf_oom.c

    17	
    18	static int bpf_ops_handle_oom(struct bpf_oom_ops *bpf_oom_ops,
    19				      struct mem_cgroup *memcg,
    20				      struct oom_control *oc)
    21	{
    22		struct bpf_oom_ctx exec_ctx;
    23		int ret;
    24	
    25		if (memcg)
  > 26			exec_ctx.cgroup_id = cgroup_id(memcg->css.cgroup);
    27		else
    28			exec_ctx.cgroup_id = 0;
    29	
    30		oc->bpf_policy_name = &bpf_oom_ops->name[0];
    31		oc->bpf_memory_freed = false;
    32		ret = bpf_oom_ops->handle_out_of_memory(oc, &exec_ctx);
    33		oc->bpf_policy_name = NULL;
    34	
    35		return ret;
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
