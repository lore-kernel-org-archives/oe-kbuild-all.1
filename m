Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C55126BF1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 03:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760154010; cv=none; b=JL9ycn4T9wDPmYNsNTm11AubggQGaPILXYyr/bn1+fR0ObnRAvIvAY/YuceMzlxkSpxP2PNxvnOzCcGuLA5CwZY8yPpKYrDpLve9lCF8oXXzeE8kH8ZxcHgIM84xpMdbe60u5oG+F6f6j8Wbqbsju+fnYsz9UEwFBVfNcNDakn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760154010; c=relaxed/simple;
	bh=+0tVMD0ECz10TQv83pYtGjDlCsq0zdMWpU0emjtWiAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bRE9Aoek5xCJz8QnI/FxRL7d91bo1/ByZWyJMCySdsXGwPPbLQoUc4vVhnqp1T+2Eow/qgxg/+QJP3ISYkagyd0UW24ofglpKnJGNhJcAv+W7pWporUQUgwGzbJLaZD7RpYdS4RqV8dCQfvQuAbk6RdDu1SR42VgWnmxDaj4LUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiuegr6t; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiuegr6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760154008; x=1791690008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+0tVMD0ECz10TQv83pYtGjDlCsq0zdMWpU0emjtWiAg=;
  b=aiuegr6tDw7tYTDNA8KWbXmKh/SgMXuh8i/bF7yRMei+LHJM61/IeJ/s
   cK9/CKWTi7Q+db6dmXoTzYHL6MTgJm5Px9D2xGSqx8Orp5nTQMi4xC9Wl
   5uyXfpLKj+APplHVl3YwO/64z9SIz7P7S5F8c3Y4BlGjmmvRiJSFoSZnP
   RUiKGqlVltyIw+6aI2Mz4md7T2N1kc68Jkgc3s38jv1uev8cajVl1lJOK
   /AH0vOX/NoTGX8sK2KTKKSLGo0D/JKqPtMfC+pO7x+OU5K3bbhWpBJgsb
   8TWhOzI9me4ft25c6DSJqFjGKTsOrbjmHmMnhi6zyEY864OU6uf9O142E
   g==;
X-CSE-ConnectionGUID: i5iaC4X+QbahzcG6AMyjeQ==
X-CSE-MsgGUID: OM1S3wITRZKtkjBZLPp70w==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="72983267"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="72983267"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 20:40:07 -0700
X-CSE-ConnectionGUID: OmBb8xhJQaCIFd8L27gMPw==
X-CSE-MsgGUID: p3jaZwHlTj6p7yco+P8GnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="180955036"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Oct 2025 20:40:05 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7QSh-0003Ug-2A;
	Sat, 11 Oct 2025 03:40:03 +0000
Date: Sat, 11 Oct 2025 11:39:38 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2.2 6/19] include/linux/bpf.h:2024:50: warning:
 statement with no effect
Message-ID: <202510111155.zRaH18kP-lkp@intel.com>
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
config: csky-randconfig-001-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111155.zRaH18kP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111155.zRaH18kP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111155.zRaH18kP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_struct_ops_init':
>> include/linux/bpf.h:2024:50: warning: statement with no effect [-Wunused-value]
    2024 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   mm/bpf_oom.c:192:16: note: in expansion of macro 'register_bpf_struct_ops'
     192 |         return register_bpf_struct_ops(&bpf_oom_bpf_ops, bpf_oom_ops);
         |                ^~~~~~~~~~~~~~~~~~~~~~~


vim +2024 include/linux/bpf.h

c196906d50e360d Hou Tao          2021-10-25  2014  
c196906d50e360d Hou Tao          2021-10-25  2015  int bpf_struct_ops_test_run(struct bpf_prog *prog, const union bpf_attr *kattr,
c196906d50e360d Hou Tao          2021-10-25  2016  			    union bpf_attr __user *uattr);
c196906d50e360d Hou Tao          2021-10-25  2017  #endif
f6be98d19985411 Kui-Feng Lee     2024-01-19  2018  int bpf_struct_ops_desc_init(struct bpf_struct_ops_desc *st_ops_desc,
f6be98d19985411 Kui-Feng Lee     2024-01-19  2019  			     struct btf *btf,
f6be98d19985411 Kui-Feng Lee     2024-01-19  2020  			     struct bpf_verifier_log *log);
1338b93346587a2 Kui-Feng Lee     2024-01-19  2021  void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map);
1611603537a4b88 Kui-Feng Lee     2024-02-08  2022  void bpf_struct_ops_desc_release(struct bpf_struct_ops_desc *st_ops_desc);
27ae7997a66174c Martin KaFai Lau 2020-01-08  2023  #else
f6be98d19985411 Kui-Feng Lee     2024-01-19 @2024  #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
85d33df357b6346 Martin KaFai Lau 2020-01-08  2025  static inline bool bpf_try_module_get(const void *data, struct module *owner)
85d33df357b6346 Martin KaFai Lau 2020-01-08  2026  {
85d33df357b6346 Martin KaFai Lau 2020-01-08  2027  	return try_module_get(owner);
85d33df357b6346 Martin KaFai Lau 2020-01-08  2028  }
85d33df357b6346 Martin KaFai Lau 2020-01-08  2029  static inline void bpf_module_put(const void *data, struct module *owner)
85d33df357b6346 Martin KaFai Lau 2020-01-08  2030  {
85d33df357b6346 Martin KaFai Lau 2020-01-08  2031  	module_put(owner);
85d33df357b6346 Martin KaFai Lau 2020-01-08  2032  }
e42ac14180554fa Martin KaFai Lau 2024-07-22  2033  static inline int bpf_struct_ops_supported(const struct bpf_struct_ops *st_ops, u32 moff)
e42ac14180554fa Martin KaFai Lau 2024-07-22  2034  {
e42ac14180554fa Martin KaFai Lau 2024-07-22  2035  	return -ENOTSUPP;
e42ac14180554fa Martin KaFai Lau 2024-07-22  2036  }
85d33df357b6346 Martin KaFai Lau 2020-01-08  2037  static inline int bpf_struct_ops_map_sys_lookup_elem(struct bpf_map *map,
85d33df357b6346 Martin KaFai Lau 2020-01-08  2038  						     void *key,
85d33df357b6346 Martin KaFai Lau 2020-01-08  2039  						     void *value)
85d33df357b6346 Martin KaFai Lau 2020-01-08  2040  {
85d33df357b6346 Martin KaFai Lau 2020-01-08  2041  	return -EINVAL;
85d33df357b6346 Martin KaFai Lau 2020-01-08  2042  }
68b04864ca425d1 Kui-Feng Lee     2023-03-22  2043  static inline int bpf_struct_ops_link_create(union bpf_attr *attr)
68b04864ca425d1 Kui-Feng Lee     2023-03-22  2044  {
68b04864ca425d1 Kui-Feng Lee     2023-03-22  2045  	return -EOPNOTSUPP;
68b04864ca425d1 Kui-Feng Lee     2023-03-22  2046  }
1338b93346587a2 Kui-Feng Lee     2024-01-19  2047  static inline void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map)
1338b93346587a2 Kui-Feng Lee     2024-01-19  2048  {
1338b93346587a2 Kui-Feng Lee     2024-01-19  2049  }
68b04864ca425d1 Kui-Feng Lee     2023-03-22  2050  

:::::: The code at line 2024 was first introduced by commit
:::::: f6be98d19985411ca1f3d53413d94d5b7f41c200 bpf, net: switch to dynamic registration

:::::: TO: Kui-Feng Lee <thinker.li@gmail.com>
:::::: CC: Martin KaFai Lau <martin.lau@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
