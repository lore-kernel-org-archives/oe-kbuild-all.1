Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91561B142D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 12:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760185137; cv=none; b=qsiRRCSZNumSvrMwMGWSL8r9Bh1+GWDP9vkzB8Aph9DejZ+Kv6SsOrWsVpFaG22K3M6Z48J8VAaqQNMpW6OJV/NWxiv4cWoFuZSRhN4ONCYThxKVqxR3/pv4e8r/SeaTVCGjv6NYH52ZXUZ3bOBNwnwNpBn1H+0oivnoKQJW54E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760185137; c=relaxed/simple;
	bh=dsD8WySaqGC0GebiDEW/YsVRIFC4VjHVpVmmZ/toX6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mExCRfp104tfWPOK+k7iSf5cieaWCjifaiQpQ7wmz5WfzVBLKxG+i/LYpundAMy9VyKtyLPdGB+eBeIliDrBCRuGIihQxtGUL5XuG2hWfhQ2DQ7ZwsQFjoRf4nqMV37Y9cqCByftFWTdy9MmoINVOayHHIs37v7L31jOsSQNxXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIbztUL3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIbztUL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760185132; x=1791721132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dsD8WySaqGC0GebiDEW/YsVRIFC4VjHVpVmmZ/toX6E=;
  b=cIbztUL3Ryu6U7be6UnJrl7Kmzej71zpZXu+TSHavF3XBj3QtkV3/Mmf
   QL0Rz9TxVSLXDUnbtBZXHtAEI6l5nAO+rcnZRAVfOkLQrh3njxHxNIGD+
   BIOvbaXXLij1GDuVlk+AbcJKs5d5znsKOe22EwV5MxirttInjTrJIRhHW
   TwpqGVfFc4+PFrvj2duHXdU90NO57sCnwGR1+LgwGN0gt/Iv75Ou/jlfa
   SAQc1l8KTkuF+wlant7Y1kaFVcvFF96CGXAZ/FNyoSOW9IsDlffPtYa3h
   l70ny7j3/jf86SdkIVaDXdDwvHX9Ibzr9Tott4wJw+uHzBTIP97hNvCjY
   Q==;
X-CSE-ConnectionGUID: h4zO0aRnRZGTi5DOg/tmww==
X-CSE-MsgGUID: IZpcXRO+QXuqkWXY3MDhjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="85011434"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="85011434"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 05:18:51 -0700
X-CSE-ConnectionGUID: dCNWzoBIT7CO5ZA9rr59wA==
X-CSE-MsgGUID: Wx5ee5AGRHyfV5t5fGWTQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="204865396"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Oct 2025 05:18:50 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7YYi-0003kx-0Q;
	Sat, 11 Oct 2025 12:18:48 +0000
Date: Sat, 11 Oct 2025 20:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 bpf-next 2/4] bpf: Support associating BPF program
 with struct_ops
Message-ID: <202510112055.riGV8zne-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Amery-Hung/bpf-Allow-verifier-to-fixup-kernel-module-kfuncs/20251011-015144
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251010174953.2884682-3-ameryhung%40gmail.com
patch subject: [RFC PATCH v1 bpf-next 2/4] bpf: Support associating BPF program with struct_ops
config: i386-buildonly-randconfig-004-20251011 (https://download.01.org/0day-ci/archive/20251011/202510112055.riGV8zne-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510112055.riGV8zne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510112055.riGV8zne-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/bpf.h: In function 'bpf_struct_ops_assoc_prog':
>> include/linux/bpf.h:2066:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
    2066 |         return -EOPNOTSUPP;
         |                ^
   include/linux/bpf.h:2064:20: note: declared here
    2064 | static inline void bpf_struct_ops_assoc_prog(struct bpf_map *map, struct bpf_prog *prog)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1 shuffle=2700263361
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=2700263361
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2700263361
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2700263361
   make: Target 'prepare' not remade because of errors.


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
