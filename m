Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0862D1F1534
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764688117; cv=none; b=Bmo5/zkF/VIreZD3Qr0P4m/OygiovtvBEpmyvNUHCzKP/Cujt6fWdSpXJ6RKQuETc/5RWZlwSilTr4yyODWz4SXMCt5psdRIF6E5QzEbixhBS/3VLZaYJN1C+sQo25fpK4OGs8qiWnQqRA/nDV8EKSI5Sv4rG93LxDxudCqQN9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764688117; c=relaxed/simple;
	bh=bD45lVW6j5DCRMSm4jWziduFP4++mA53u4g6ublScpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQYHnXpdhnHXV5E+dsdO6Cnc3hBoMN0dQw2CQDtzK6/K5VfMvDV8ThclzlksWeVoU4keIDnrpZrpcUYnP939y9/FRFseJhpg7b1OVTs3WaUUrPlOG2wUm7Pkean7F2Cs+TEcFrLjDpnidKo9VhZv+rRFrAThrERbQmbmu1+Sr40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtLiHwOS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtLiHwOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764688116; x=1796224116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bD45lVW6j5DCRMSm4jWziduFP4++mA53u4g6ublScpw=;
  b=HtLiHwOS1miJfjvTP83XPLvmi3AFmz3JpIuX78Z9j1JnC/EHuWHZBtrh
   N0yCLIP2NrFuKd6ORQdH73m8U3ShQ/YCBkpereVxJ/OT76n3bN+iT1wUS
   Tj1iW5BrL8MtuhAatUUkjZM3FBHSFWcD+Vy7ltw7JEUTVSiqN8I5QO08e
   2y2/TNB/40/c29OsM/8j0DHf1ZbbmO+ocQwhR0xxiZyzbw9M6w4+fmcyQ
   VkeUOS+2RcKhABvynqAh2hDKM8wxDbk3P93E3QY2cWUDn13jgrSmMKBM0
   r3Yuweu6iuYlUtZzB3XioM2yu52wewZiZO+B0C58CaT3hI3VaLYbVPw6q
   w==;
X-CSE-ConnectionGUID: VwHSjs7YRAe8XgSB4L9Tjg==
X-CSE-MsgGUID: LfSc31SAQXu6AQ43adHzvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66372616"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66372616"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 07:08:34 -0800
X-CSE-ConnectionGUID: VVmpzrvFTJSagma+o5RYNA==
X-CSE-MsgGUID: QY6nbQoFR2ad0rUs/EZUKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194278797"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Dec 2025 07:08:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQRzS-000000009uv-1qWH;
	Tue, 02 Dec 2025 15:08:30 +0000
Date: Tue, 2 Dec 2025 23:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.1 28/28] mm/bpf_oom.c:26:1: warning: control
 reaches end of non-void function
Message-ID: <202512022350.avwAuLNW-lkp@intel.com>
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
config: xtensa-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512022350.avwAuLNW-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512022350.avwAuLNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512022350.avwAuLNW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/bpf_oom.c:31:57: error: implicit declaration of function 'bpf_struct_ops_link_to_ops'; did you mean 'bpf_struct_ops_link_create'? [-Werror=implicit-function-declaration]
      31 |         struct bpf_oom_ops *ops = (struct bpf_oom_ops *)bpf_struct_ops_link_to_ops(link);
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                         bpf_struct_ops_link_create
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
                    from ./arch/xtensa/include/generated/asm/bug.h:1,
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
                    from include/linux/bpf.h:7,
                    from mm/bpf_oom.c:8:
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
   mm/bpf_oom.c:144:28: error: passing argument 1 of 'bpf_oom_clear_link' from incompatible pointer type [-Werror=incompatible-pointer-types]
     144 |         bpf_oom_clear_link(st_link);
         |                            ^~~~~~~
         |                            |
         |                            struct bpf_struct_st_link *
   mm/bpf_oom.c:125:52: note: expected 'struct bpf_struct_st_link *' but argument is of type 'struct bpf_struct_st_link *'
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   In file included from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_struct_ops_init':
   include/linux/bpf.h:2066:50: warning: statement with no effect [-Wunused-value]
    2066 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   mm/bpf_oom.c:201:16: note: in expansion of macro 'register_bpf_struct_ops'
     201 |         return register_bpf_struct_ops(&bpf_oom_bpf_ops, bpf_oom_ops);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c: In function 'bpf_oom_memcg_to_link':
>> mm/bpf_oom.c:26:1: warning: control reaches end of non-void function [-Wreturn-type]
      26 | }
         | ^
   cc1: some warnings being treated as errors


vim +26 mm/bpf_oom.c

    13	
    14	DEFINE_MUTEX(bpf_oom_lock);
    15	/*
    16	 * Lock ordering:
    17	 *   bpf_oom_lock
    18	 *   cgroup_lock
    19	 */
    20	
    21	static struct bpf_struct_ops_link *bpf_oom_memcg_to_link(struct mem_cgroup *memcg)
    22	{
    23		struct cgroup_subsys_state *css = &memcg->css;
    24	
    25		return css->cgroup->bpf.bpf_oom_link;
  > 26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
