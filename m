Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E132F296BD8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764695025; cv=none; b=KDKUMK88swY7HK66GngFH/XhZYt7F20R1dqRNRy5BhIuXvs2QYyxBjoGXhyZPvmhccCt3vNeAIjwmKRSoqdoud1nCwAA1QWHfGhbsDLWPkBK970+JegJzLMJX1LdQCLXQGXkD/28+mXXwB1t9pcEqvNu0wZiI1kz0oIW3Rua4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764695025; c=relaxed/simple;
	bh=nEy3xzqPQ98uUDsWJfoQmYvj5vjYlX2ONzin9l9pRXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tv/+/yJg7yNHL2rOE93MpJnAqHGuAK0+Z9yCYhAQ0XvahTUeXo0mzfG7ZTvSL9lzOKZ4s/FRrz3g6+gPN3dHXBXavFt004/DCAGnch/HGhwQSPEq4g3pgPcjo+ivrDoDqd0Xk9+D+GCsr60g67SsSQKr735MPJikWDouBdtWxOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qm11XXg4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qm11XXg4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764695023; x=1796231023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nEy3xzqPQ98uUDsWJfoQmYvj5vjYlX2ONzin9l9pRXM=;
  b=Qm11XXg4BG6thV+2fAhQHgw7kRo78jcvgh+UAcIRdmVkzTdQu14XC4qo
   5jyV6+gVk9UnlTzMEffFaCGmcOJWhFpC6gXK54NXbFRYi1SXg0Fv5Sboo
   dPI3+pG6RUREOCBW8ZAfwT1zn/BqyBQCh9OCHAJAz9Q09ZFuOoBOh2Zpa
   qtYYAPP8hTIlUKrZ9+aoCVf5yIQajyl1J5G8fMjee4A9P9od4cw77/YRa
   WMQNC2GC4BI3dOWHwooVT1qwLFMPBM1aTLEgEhsoUO24vpW1aZaCxCdqJ
   yYO38wY22/52bFkIxa5lEuPTU0fjF/sLPaHd2rSTsdv0soAc8TXWxcd2P
   A==;
X-CSE-ConnectionGUID: FBwMFUDtRROycpKg9VspBA==
X-CSE-MsgGUID: zAo8wjZxRjivRuLqmOi8Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77777511"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="77777511"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 09:03:42 -0800
X-CSE-ConnectionGUID: KgS6oIzoQzS8tZrPAjsdCQ==
X-CSE-MsgGUID: 7T2CTsnMQ16euUE3yuzDSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="199555032"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Dec 2025 09:03:41 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQTms-00000000A29-3XNZ;
	Tue, 02 Dec 2025 17:03:38 +0000
Date: Wed, 3 Dec 2025 01:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.1 28/28] mm/bpf_oom.c:31:35: warning: cast to
 pointer from integer of different size
Message-ID: <202512030102.iQlX9FAo-lkp@intel.com>
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
config: x86_64-randconfig-003-20251202 (https://download.01.org/0day-ci/archive/20251203/202512030102.iQlX9FAo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030102.iQlX9FAo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030102.iQlX9FAo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/bpf_oom.c: In function 'bpf_oom_memcg_to_link':
   mm/bpf_oom.c:25:32: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
      25 |         return css->cgroup->bpf.bpf_oom_link;
         |                                ^
   mm/bpf_oom.c: In function 'bpf_ops_handle_oom':
   mm/bpf_oom.c:31:57: error: implicit declaration of function 'bpf_struct_ops_link_to_ops'; did you mean 'bpf_struct_ops_link_create'? [-Wimplicit-function-declaration]
      31 |         struct bpf_oom_ops *ops = (struct bpf_oom_ops *)bpf_struct_ops_link_to_ops(link);
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                         bpf_struct_ops_link_create
>> mm/bpf_oom.c:31:35: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      31 |         struct bpf_oom_ops *ops = (struct bpf_oom_ops *)bpf_struct_ops_link_to_ops(link);
         |                                   ^
   mm/bpf_oom.c: In function 'bpf_oom_ops_reg':
   mm/bpf_oom.c:111:34: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     111 |         if (ops_link->cgroup->bpf.bpf_oom_link) {
         |                                  ^
   mm/bpf_oom.c:116:30: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     116 |         ops_link->cgroup->bpf.bpf_oom_link = ops_link;
         |                              ^
   mm/bpf_oom.c: At top level:
   mm/bpf_oom.c:125:32: warning: 'struct bpf_struct_st_link' declared inside parameter list will not be visible outside of this definition or declaration
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |                                ^~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:125:6: warning: no previous prototype for 'bpf_oom_clear_link' [-Wmissing-prototypes]
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |      ^~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c: In function 'bpf_oom_clear_link':
   mm/bpf_oom.c:130:20: error: invalid use of undefined type 'struct bpf_struct_st_link'
     130 |         if (st_link->cgroup)
         |                    ^~
   mm/bpf_oom.c:131:24: error: invalid use of undefined type 'struct bpf_struct_st_link'
     131 |                 st_link->cgroup->bpf.bpf_oom_link = NULL;
         |                        ^~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:108,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_unreg':
   include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct bpf_struct_st_link'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   mm/bpf_oom.c:139:46: note: in expansion of macro 'container_of'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                                              ^~~~~~~~~~~~
   include/linux/compiler_types.h:532:27: error: expression in static assertion is not an integer
     532 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   mm/bpf_oom.c:139:46: note: in expansion of macro 'container_of'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                                              ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/uapi/linux/bpf.h:11,
                    from include/linux/bpf.h:7:
   include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct bpf_struct_st_link'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   mm/bpf_oom.c:139:46: note: in expansion of macro 'container_of'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                                              ^~~~~~~~~~~~
   mm/bpf_oom.c:141:21: error: invalid use of undefined type 'struct bpf_struct_st_link'
     141 |         if (!st_link->cgroup)
         |                     ^~
   mm/bpf_oom.c:144:28: error: passing argument 1 of 'bpf_oom_clear_link' from incompatible pointer type [-Wincompatible-pointer-types]
     144 |         bpf_oom_clear_link(st_link);
         |                            ^~~~~~~
         |                            |
         |                            struct bpf_struct_st_link *
   mm/bpf_oom.c:125:52: note: expected 'struct bpf_struct_st_link *' but argument is of type 'struct bpf_struct_st_link *'
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   mm/bpf_oom.c: In function 'bpf_oom_struct_ops_init':
   include/linux/bpf.h:2066:50: warning: statement with no effect [-Wunused-value]
    2066 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   mm/bpf_oom.c:201:16: note: in expansion of macro 'register_bpf_struct_ops'
     201 |         return register_bpf_struct_ops(&bpf_oom_bpf_ops, bpf_oom_ops);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c: In function 'bpf_oom_memcg_to_link':
   mm/bpf_oom.c:26:1: warning: control reaches end of non-void function [-Wreturn-type]
      26 | }
         | ^


vim +31 mm/bpf_oom.c

    27	
    28	static int bpf_ops_handle_oom(struct bpf_struct_ops_link *link,
    29				      struct oom_control *oc)
    30	{
  > 31		struct bpf_oom_ops *ops = (struct bpf_oom_ops *)bpf_struct_ops_link_to_ops(link);
    32		int ret;
    33	
    34		oc->bpf_handler_name = &ops->name[0];
    35		oc->bpf_memory_freed = false;
    36		ret = ops->handle_out_of_memory(link, oc);
    37		oc->bpf_handler_name = NULL;
    38	
    39		return ret;
    40	}
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
