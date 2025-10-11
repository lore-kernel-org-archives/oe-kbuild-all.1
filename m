Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9B417D2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760187121; cv=none; b=m8mKcKOleNO/bxZCA2QHsODmapc3YDjh72fgiMrhhB1iYBbxJZIK5BK3PNTC2JUDNnKKBcbQdq9DPeQCOxlyanc0WfAFr8IlG5C/i5WU7kTISMEByZJaQxG7Q+Tu8CTlryM+HAF29Zj2n8r7dCvYSbt68rn1qN//yV6ZfqqnSmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760187121; c=relaxed/simple;
	bh=PESBe6nFiTxtg0VuEJRHxZlN5eH+AI+b43TxzZ19yDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWCdST/9HEM10Jexqrj+Z0Ze//IuwU+UDIHIpBSiJZtsV2CTEgLFLswZx8RSvLkfSAQUZw7CtDX7AqZdmR0ofi8y64qtfOx8UeBqEZdwYl9M7laClcwmIEAuHbhOpeOjCObvKy6U83Aua3zYQiBss0g7xmR8SzmU4kZWgK189yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZEOU0J0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZEOU0J0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760187115; x=1791723115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PESBe6nFiTxtg0VuEJRHxZlN5eH+AI+b43TxzZ19yDA=;
  b=GZEOU0J0MYJmrtHekWjxvYTuSu8WyM8DJQ3DMJbpSTt5RK1py6cEYt2/
   O24N2PLgc7ZATw7/6Cm2nhpU3n4yOlKMjz1o/2N+3ZFQBtyyaAg4iJeg2
   8yTIuSxFYHinYHXpP360draY5N18aQVF3sFOLkKrXYK5S3l2r+doT8/y4
   Lxq53edomvoMH0phTEWSQlfBUrpmwQ3NH6msm90GMflCJCQMkhYUjcJmN
   Dnu3E/rGKAerGRbNqbMR3qs4JlsnrnU7DhbrEYUKdbrIrCOt+e/tGeLHv
   +45NZPXS+rnGo45gN0WzTHpN3aV4ZF7f4G69UZwa2/ZDzwFHnMR5utKAj
   Q==;
X-CSE-ConnectionGUID: mJjWov5mRJOjDltZ3T3xXg==
X-CSE-MsgGUID: 0OC58TUdRNuio+JDf2QZlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62418775"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="62418775"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 05:51:54 -0700
X-CSE-ConnectionGUID: aaXcXFb0QBqoFJArMnOEMg==
X-CSE-MsgGUID: 7r5jfcZCS/mXNz+BRE+D4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="186477027"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2025 05:51:53 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Z4h-0003mB-0l;
	Sat, 11 Oct 2025 12:51:51 +0000
Date: Sat, 11 Oct 2025 20:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 bpf-next 2/4] bpf: Support associating BPF program
 with struct_ops
Message-ID: <202510112008.3v7Qw36U-lkp@intel.com>
References: <20251010174953.2884682-3-ameryhung@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010174953.2884682-3-ameryhung@gmail.com>

Hi Amery,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Amery-Hung/bpf-Allow-verifier-to-fixup-kernel-module-kfuncs/20251011-015144
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251010174953.2884682-3-ameryhung%40gmail.com
patch subject: [RFC PATCH v1 bpf-next 2/4] bpf: Support associating BPF program with struct_ops
config: i386-buildonly-randconfig-001-20251011 (https://download.01.org/0day-ci/archive/20251011/202510112008.3v7Qw36U-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510112008.3v7Qw36U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510112008.3v7Qw36U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/bpf.h: In function 'bpf_struct_ops_assoc_prog':
>> include/linux/bpf.h:2066:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
    2066 |         return -EOPNOTSUPP;
         |                ^
   include/linux/bpf.h:2064:20: note: declared here
    2064 | static inline void bpf_struct_ops_assoc_prog(struct bpf_map *map, struct bpf_prog *prog)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/build_policy.c:41:
   include/linux/bpf.h: In function 'bpf_struct_ops_assoc_prog':
>> include/linux/bpf.h:2066:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
    2066 |         return -EOPNOTSUPP;
         |                ^
   include/linux/bpf.h:2064:20: note: declared here
    2064 | static inline void bpf_struct_ops_assoc_prog(struct bpf_map *map, struct bpf_prog *prog)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c: At top level:
   kernel/sched/rt.c:12:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
      12 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~
--
   In file included from include/linux/filter.h:9,
                    from kernel/bpf/core.c:22:
   include/linux/bpf.h: In function 'bpf_struct_ops_assoc_prog':
>> include/linux/bpf.h:2066:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
    2066 |         return -EOPNOTSUPP;
         |                ^
   include/linux/bpf.h:2064:20: note: declared here
    2064 | static inline void bpf_struct_ops_assoc_prog(struct bpf_map *map, struct bpf_prog *prog)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c: In function 'bpf_prog_free_deferred':
   kernel/bpf/core.c:2881:17: error: implicit declaration of function 'bpf_struct_ops_put'; did you mean 'bpf_struct_ops_find'? [-Werror=implicit-function-declaration]
    2881 |                 bpf_struct_ops_put(aux->st_ops_assoc);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 bpf_struct_ops_find
   cc1: some warnings being treated as errors
--
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/bpf.h: In function 'bpf_struct_ops_assoc_prog':
>> include/linux/bpf.h:2066:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
    2066 |         return -EOPNOTSUPP;
         |                ^
   include/linux/bpf.h:2064:20: note: declared here
    2064 | static inline void bpf_struct_ops_assoc_prog(struct bpf_map *map, struct bpf_prog *prog)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/return +2066 include/linux/bpf.h

  2031	
  2032	int bpf_struct_ops_test_run(struct bpf_prog *prog, const union bpf_attr *kattr,
  2033				    union bpf_attr __user *uattr);
  2034	#endif
  2035	int bpf_struct_ops_desc_init(struct bpf_struct_ops_desc *st_ops_desc,
  2036				     struct btf *btf,
  2037				     struct bpf_verifier_log *log);
  2038	void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map);
  2039	void bpf_struct_ops_desc_release(struct bpf_struct_ops_desc *st_ops_desc);
  2040	#else
  2041	#define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
  2042	static inline bool bpf_try_module_get(const void *data, struct module *owner)
  2043	{
  2044		return try_module_get(owner);
  2045	}
  2046	static inline void bpf_module_put(const void *data, struct module *owner)
  2047	{
  2048		module_put(owner);
  2049	}
  2050	static inline int bpf_struct_ops_supported(const struct bpf_struct_ops *st_ops, u32 moff)
  2051	{
  2052		return -ENOTSUPP;
  2053	}
  2054	static inline int bpf_struct_ops_map_sys_lookup_elem(struct bpf_map *map,
  2055							     void *key,
  2056							     void *value)
  2057	{
  2058		return -EINVAL;
  2059	}
  2060	static inline int bpf_struct_ops_link_create(union bpf_attr *attr)
  2061	{
  2062		return -EOPNOTSUPP;
  2063	}
  2064	static inline void bpf_struct_ops_assoc_prog(struct bpf_map *map, struct bpf_prog *prog)
  2065	{
> 2066		return -EOPNOTSUPP;
  2067	}
  2068	static inline void bpf_struct_ops_disassoc_prog(struct bpf_prog *prog)
  2069	{
  2070	}
  2071	static inline void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map)
  2072	{
  2073	}
  2074	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
