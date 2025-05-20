Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E032586CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 04:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747715273; cv=none; b=RPg3j27X7RDKOC6vNlf3nsEk4UPsrIxz3KDf0cGZ7CKGzFIs2BXIAcbhDuaSZ72rPA3s2pVeQ81UoHDsBGPiaP7ia+xeNVt2vwLeJracyfimQjDMiLzxnO2bQ+0lckL+6YCKtGqRjjPnoDGR+ShQ9iqcvhdOjUBqGnVHOfFQdOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747715273; c=relaxed/simple;
	bh=wM+LOfQosy6StAeC60TEfwaJPggtq46SKno+E4c88E4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pCKFmjwXwED57BDavhO3r6iIMowuNbiUTgsMua/n4Nf3rzLeKoDFPMJ0Cu779qW1UjlN2D/i9b4SS5w1wpMAr/UK6wsmqucsMHl09By3BPA7rtg2K0daaliXFntmw1GMvU2rpL63MATCXKCB9I6hEOH+zzFZdy6loWSH3Q5gs10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjLcWDfd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjLcWDfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747715271; x=1779251271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wM+LOfQosy6StAeC60TEfwaJPggtq46SKno+E4c88E4=;
  b=AjLcWDfdoahNjsvpwp6dsNhO/bcNSHxY0W5ucTShmYFu/wCipYPOvuXE
   zEPuKapn4S2AjjZY05umFxcYSDApBgYHRPZELzYg3UT05bdsurUhsXrWb
   RbtAoYgQOfoUgov9WywQsvpRfq9WSu0wumbinlx0xaJvDjKo1rSfDqAGv
   zKmxgfLnoCspFDe2HKI/1mqTVgN5f1TSBoZXuGkEYC7ex1UDMzw3wmBOv
   6alIUlJJPRHOVH31CcQNcZ0v8PhcaJjOVeyufcxbqEjfs9lrp6TStLUIb
   5M+jJHhRaloxLK2ufh7ucUu0oOw1FhScuw6SYKJ5yRIMxLaXPr7KrjVMR
   g==;
X-CSE-ConnectionGUID: tmUmrkXgRCyLev8oPtj2BA==
X-CSE-MsgGUID: 5Yucz5O8R4ylvTjK+WdtkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60670214"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60670214"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 21:27:48 -0700
X-CSE-ConnectionGUID: PTUVS39GSSi5tvsnTbMhsQ==
X-CSE-MsgGUID: 8Xu/Jj5ET4WaeZblaxMHFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140578102"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 May 2025 21:27:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHEZt-000M9e-04;
	Tue, 20 May 2025 04:27:45 +0000
Date: Tue, 20 May 2025 12:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.2 2/15] include/linux/bpf.h:1946:50: warning:
 statement with no effect
Message-ID: <202505201209.29hVrWrH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.2
head:   1078570cd7bf92cc1b6d67e990786cfb9a717785
commit: 954f163d5cf03cb8f4ea7c9930265fc327c46a91 [2/15] mm: introduce a bpf hook for OOM handling
config: arc-randconfig-001-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201209.29hVrWrH-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201209.29hVrWrH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201209.29hVrWrH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_struct_ops_init':
>> include/linux/bpf.h:1946:50: warning: statement with no effect [-Wunused-value]
    1946 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   mm/bpf_oom.c:138:16: note: in expansion of macro 'register_bpf_struct_ops'
     138 |         return register_bpf_struct_ops(&bpf_oom_bpf_ops, bpf_oom_ops);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c: At top level:
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics


vim +1946 include/linux/bpf.h

c196906d50e360d Hou Tao          2021-10-25  1936  
c196906d50e360d Hou Tao          2021-10-25  1937  int bpf_struct_ops_test_run(struct bpf_prog *prog, const union bpf_attr *kattr,
c196906d50e360d Hou Tao          2021-10-25  1938  			    union bpf_attr __user *uattr);
c196906d50e360d Hou Tao          2021-10-25  1939  #endif
f6be98d19985411 Kui-Feng Lee     2024-01-19  1940  int bpf_struct_ops_desc_init(struct bpf_struct_ops_desc *st_ops_desc,
f6be98d19985411 Kui-Feng Lee     2024-01-19  1941  			     struct btf *btf,
f6be98d19985411 Kui-Feng Lee     2024-01-19  1942  			     struct bpf_verifier_log *log);
1338b93346587a2 Kui-Feng Lee     2024-01-19  1943  void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map);
1611603537a4b88 Kui-Feng Lee     2024-02-08  1944  void bpf_struct_ops_desc_release(struct bpf_struct_ops_desc *st_ops_desc);
27ae7997a66174c Martin KaFai Lau 2020-01-08  1945  #else
f6be98d19985411 Kui-Feng Lee     2024-01-19 @1946  #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
85d33df357b6346 Martin KaFai Lau 2020-01-08  1947  static inline bool bpf_try_module_get(const void *data, struct module *owner)
85d33df357b6346 Martin KaFai Lau 2020-01-08  1948  {
85d33df357b6346 Martin KaFai Lau 2020-01-08  1949  	return try_module_get(owner);
85d33df357b6346 Martin KaFai Lau 2020-01-08  1950  }
85d33df357b6346 Martin KaFai Lau 2020-01-08  1951  static inline void bpf_module_put(const void *data, struct module *owner)
85d33df357b6346 Martin KaFai Lau 2020-01-08  1952  {
85d33df357b6346 Martin KaFai Lau 2020-01-08  1953  	module_put(owner);
85d33df357b6346 Martin KaFai Lau 2020-01-08  1954  }
e42ac14180554fa Martin KaFai Lau 2024-07-22  1955  static inline int bpf_struct_ops_supported(const struct bpf_struct_ops *st_ops, u32 moff)
e42ac14180554fa Martin KaFai Lau 2024-07-22  1956  {
e42ac14180554fa Martin KaFai Lau 2024-07-22  1957  	return -ENOTSUPP;
e42ac14180554fa Martin KaFai Lau 2024-07-22  1958  }
85d33df357b6346 Martin KaFai Lau 2020-01-08  1959  static inline int bpf_struct_ops_map_sys_lookup_elem(struct bpf_map *map,
85d33df357b6346 Martin KaFai Lau 2020-01-08  1960  						     void *key,
85d33df357b6346 Martin KaFai Lau 2020-01-08  1961  						     void *value)
85d33df357b6346 Martin KaFai Lau 2020-01-08  1962  {
85d33df357b6346 Martin KaFai Lau 2020-01-08  1963  	return -EINVAL;
85d33df357b6346 Martin KaFai Lau 2020-01-08  1964  }
68b04864ca425d1 Kui-Feng Lee     2023-03-22  1965  static inline int bpf_struct_ops_link_create(union bpf_attr *attr)
68b04864ca425d1 Kui-Feng Lee     2023-03-22  1966  {
68b04864ca425d1 Kui-Feng Lee     2023-03-22  1967  	return -EOPNOTSUPP;
68b04864ca425d1 Kui-Feng Lee     2023-03-22  1968  }
1338b93346587a2 Kui-Feng Lee     2024-01-19  1969  static inline void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map)
1338b93346587a2 Kui-Feng Lee     2024-01-19  1970  {
1338b93346587a2 Kui-Feng Lee     2024-01-19  1971  }
68b04864ca425d1 Kui-Feng Lee     2023-03-22  1972  

:::::: The code at line 1946 was first introduced by commit
:::::: f6be98d19985411ca1f3d53413d94d5b7f41c200 bpf, net: switch to dynamic registration

:::::: TO: Kui-Feng Lee <thinker.li@gmail.com>
:::::: CC: Martin KaFai Lau <martin.lau@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
