Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95CA126BF1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 03:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760154012; cv=none; b=l4oPlShlk7t9QZvuSCDl1pas2C9eM1o+npHyyBMZFUfwRP2hM4EXKvIZRPcgB9R+45hu37fdwaQMA3HGFD8ChMPAIk2EQUl287snhyC6Fh+ItjrJcSnlO/43fsW0t/YEKXOp5SnyfhtWkMixJsjn3XfD726qMvIwUBaV8XwmsDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760154012; c=relaxed/simple;
	bh=076kTuT3wAzW9Qb9W6cDbCP1nQSKGGJoes4eK1PXH+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hc7MbEsAdNOiisSBp/uJ5j0vCPJcDRUSop1gKIRTvPvjdwMHNb8+31e2Y2ZEitzoMRYfHB9xiKOeXVq4qzTgb4X2Gt1BGE+fgwn4QvUbZDj9MyCGRs6MEvYsskbnyl4fdbcepp/uqOZ65f2SbxXHp5eb0E7v4E6ZsGdibkv9Khk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THwAwnML; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THwAwnML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760154011; x=1791690011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=076kTuT3wAzW9Qb9W6cDbCP1nQSKGGJoes4eK1PXH+s=;
  b=THwAwnMLlgGlLUMxYQeDNnba6NXDIhr4sc1P24tVxcDOGAycKvnYCDEi
   6dtznkqCYhp4KmPY9DQXLYMxoniQNM4hZrK4mf9Zlc7VlmVBChbD1wcpq
   XY+Ev6ZgYyaUJi/iUWJ1yqsFkobSLxfBjD8Hgkk1I9gqiOGlnzkltrSIs
   16Tr771sHFTO/I9eMHRh+pwb36h0VAwHYHCZFku3AOo5/BSiGTEDX5aCB
   dqS9c4+AAYmyh4NwWLm/bDSSW23H5sRArByRPm285qByS16Qnbd4ZOReN
   SSw3GLJVyOaytMA2DVhbRg4w8c0VaoV2iHzII24/Ajpj+b8ktn2JkeqdZ
   Q==;
X-CSE-ConnectionGUID: HVeh3AGGQ/+poNHZHcF3WA==
X-CSE-MsgGUID: KOlpEbHvSBeUtvvbdwj3cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="72983269"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="72983269"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 20:40:07 -0700
X-CSE-ConnectionGUID: Baeu2jhiT82UEJDHFvNHzA==
X-CSE-MsgGUID: Kt86RfUNQkixsJQ1+cpdsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="180955037"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Oct 2025 20:40:06 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7QSh-0003Uj-2E;
	Sat, 11 Oct 2025 03:40:03 +0000
Date: Sat, 11 Oct 2025 11:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2.2 6/19] mm/bpf_oom.c:41:32: error: dereferencing
 pointer to incomplete type 'struct mem_cgroup'
Message-ID: <202510111140.XBAcBxad-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2.2
head:   5a340f010fe5e9a9807ff0f23ff40b57b184948a
commit: 2be3bd65f4b13d8ba378182e5e15a7195890d573 [6/19] mm: introduce bpf struct ops for OOM handling
config: arc-randconfig-001-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111140.XBAcBxad-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111140.XBAcBxad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111140.XBAcBxad-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/filter.h:9,
                    from include/linux/bpf.h:8,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_handle_oom':
>> mm/bpf_oom.c:41:32: error: dereferencing pointer to incomplete type 'struct mem_cgroup'
      41 |   bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                                ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/compiler_types.h:552:3: note: in expansion of macro 'if'
     552 |   if (!(condition))     \
         |   ^~
   include/linux/compiler_types.h:560:2: note: in expansion of macro '__compiletime_assert'
     560 |  __compiletime_assert(condition, msg, prefix, suffix)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:572:2: note: in expansion of macro '_compiletime_assert'
     572 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:41:17: note: in expansion of macro 'READ_ONCE'
      41 |   bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
         |                 ^~~~~~~~~


vim +41 mm/bpf_oom.c

    29	
    30	bool bpf_handle_oom(struct oom_control *oc)
    31	{
    32		struct bpf_oom_ops *bpf_oom_ops = NULL;
    33		struct mem_cgroup *memcg;
    34		int idx, ret = 0;
    35	
    36		/* All bpf_oom_ops structures are protected using bpf_oom_srcu */
    37		idx = srcu_read_lock(&bpf_oom_srcu);
    38	
    39		/* Find the nearest bpf_oom_ops traversing the cgroup tree upwards */
    40		for (memcg = oc->memcg; memcg; memcg = parent_mem_cgroup(memcg)) {
  > 41			bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
    42			if (!bpf_oom_ops)
    43				continue;
    44	
    45			/* Call BPF OOM handler */
    46			ret = bpf_ops_handle_oom(bpf_oom_ops, oc);
    47			if (ret && oc->bpf_memory_freed)
    48				goto exit;
    49		}
    50		/*
    51		 * System-wide OOM or per-memcg BPF OOM handler wasn't successful?
    52		 * Try system_bpf_oom.
    53		 */
    54		bpf_oom_ops = READ_ONCE(system_bpf_oom);
    55		if (!bpf_oom_ops)
    56			goto exit;
    57	
    58		/* Call BPF OOM handler */
    59		ret = bpf_ops_handle_oom(bpf_oom_ops, oc);
    60	exit:
    61		srcu_read_unlock(&bpf_oom_srcu, idx);
    62		return ret && oc->bpf_memory_freed;
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
