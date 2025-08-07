Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4767B72622
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 04:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754542076; cv=none; b=hYLDFnQ/twCFzviFXlxeT9kdyWS3oXllx2AguIsVW4m7Oa2K7Hu1FWO5rXx5MbdjiJn6SHabz5YXjnk/rv+8+sG9W0vL297ITqeAR5o6Z/JMITuEcNm5tHKwjaUOz/F4bRmuxqjtEu7XngmmpDB7Eie8UYTRxmeyQQN8rD1yjGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754542076; c=relaxed/simple;
	bh=S8uhD1C28G4QD9n1rwJmG4X1bAE0FEUIrxhDGAtR0Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RCTiWAkzheacH9eYyYoHHE3fUs/JlAfVky4Rur21W+Kvzi9Oi7n7u6Ll21Uq66pHadY9MWhB0dwcCdKWZw80fXafRA/h6q7p0ve2mta911qUavVQ4HyKxy///zjFRKguHbg/KwyLWfJ9Pbwe1he2E68mbz1k+JDDsKgYGPfIACc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWNWTMbB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWNWTMbB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754542075; x=1786078075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S8uhD1C28G4QD9n1rwJmG4X1bAE0FEUIrxhDGAtR0Mc=;
  b=MWNWTMbB8gqlG/2LWW0mLNQSalSDSf86AZcS4jCCrOAQj44BoVPkpBsI
   KrfMjNpcNP5W8zpRNE2VmSai20X8QKb55qztYAY13Zjck75CNYRdltTNm
   MckjyrKGiqiLkyrlS6FEa4LC2bxaB5fsEtGDHXtpIJYqy+QbiSfvHKCOt
   rJY6t2xQSgDdMuz4tjvsNaCBGy8hFXZ5MbC/LzJPZgmT+9h6QH9Ih10Dn
   ORdD6oBXUWY566ZXfR4OplvCWWS0Rg6wccaDIyLC7qeE4lF14YmsiMp5y
   KK17sO7eAiDbynfORNzjMmVFuix3VlTh/yVWj0AyCJp+P2uejLiw5dhTj
   g==;
X-CSE-ConnectionGUID: D7n9AU2LQC2Q1CU5yo0NnA==
X-CSE-MsgGUID: qaQ3e23bQcuPj4/3zH1Zmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68319020"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="68319020"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 21:47:55 -0700
X-CSE-ConnectionGUID: zcteDYcYToi7GnSzrxUzMg==
X-CSE-MsgGUID: dVttxa0kSuGMKMQc4D7MtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="188621268"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 06 Aug 2025 21:47:53 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujsXf-0002L9-1q;
	Thu, 07 Aug 2025 04:47:51 +0000
Date: Thu, 7 Aug 2025 06:47:37 +0200
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.5 2/17] include/linux/bpf.h:1946:50: warning:
 statement with no effect
Message-ID: <202508070616.I4IluiSr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.5
head:   56067bc9ae98ae8d75fbb2506874ef96ee0396e5
commit: 4f870b9abac74bede0e873ae2b29091aab7bc533 [2/17] mm: introduce a bpf hook for OOM handling
config: m68k-randconfig-2003-20250807 (https://download.01.org/0day-ci/archive/20250807/202508070616.I4IluiSr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070616.I4IluiSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070616.I4IluiSr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_struct_ops_init':
>> include/linux/bpf.h:1946:50: warning: statement with no effect [-Wunused-value]
    1946 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   mm/bpf_oom.c:138:16: note: in expansion of macro 'register_bpf_struct_ops'
     138 |         return register_bpf_struct_ops(&bpf_oom_bpf_ops, bpf_oom_ops);
         |                ^~~~~~~~~~~~~~~~~~~~~~~


vim +1946 include/linux/bpf.h

c196906d50e360 Hou Tao          2021-10-25  1936  
c196906d50e360 Hou Tao          2021-10-25  1937  int bpf_struct_ops_test_run(struct bpf_prog *prog, const union bpf_attr *kattr,
c196906d50e360 Hou Tao          2021-10-25  1938  			    union bpf_attr __user *uattr);
c196906d50e360 Hou Tao          2021-10-25  1939  #endif
f6be98d1998541 Kui-Feng Lee     2024-01-19  1940  int bpf_struct_ops_desc_init(struct bpf_struct_ops_desc *st_ops_desc,
f6be98d1998541 Kui-Feng Lee     2024-01-19  1941  			     struct btf *btf,
f6be98d1998541 Kui-Feng Lee     2024-01-19  1942  			     struct bpf_verifier_log *log);
1338b93346587a Kui-Feng Lee     2024-01-19  1943  void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map);
1611603537a4b8 Kui-Feng Lee     2024-02-08  1944  void bpf_struct_ops_desc_release(struct bpf_struct_ops_desc *st_ops_desc);
27ae7997a66174 Martin KaFai Lau 2020-01-08  1945  #else
f6be98d1998541 Kui-Feng Lee     2024-01-19 @1946  #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
85d33df357b634 Martin KaFai Lau 2020-01-08  1947  static inline bool bpf_try_module_get(const void *data, struct module *owner)
85d33df357b634 Martin KaFai Lau 2020-01-08  1948  {
85d33df357b634 Martin KaFai Lau 2020-01-08  1949  	return try_module_get(owner);
85d33df357b634 Martin KaFai Lau 2020-01-08  1950  }
85d33df357b634 Martin KaFai Lau 2020-01-08  1951  static inline void bpf_module_put(const void *data, struct module *owner)
85d33df357b634 Martin KaFai Lau 2020-01-08  1952  {
85d33df357b634 Martin KaFai Lau 2020-01-08  1953  	module_put(owner);
85d33df357b634 Martin KaFai Lau 2020-01-08  1954  }
e42ac14180554f Martin KaFai Lau 2024-07-22  1955  static inline int bpf_struct_ops_supported(const struct bpf_struct_ops *st_ops, u32 moff)
e42ac14180554f Martin KaFai Lau 2024-07-22  1956  {
e42ac14180554f Martin KaFai Lau 2024-07-22  1957  	return -ENOTSUPP;
e42ac14180554f Martin KaFai Lau 2024-07-22  1958  }
85d33df357b634 Martin KaFai Lau 2020-01-08  1959  static inline int bpf_struct_ops_map_sys_lookup_elem(struct bpf_map *map,
85d33df357b634 Martin KaFai Lau 2020-01-08  1960  						     void *key,
85d33df357b634 Martin KaFai Lau 2020-01-08  1961  						     void *value)
85d33df357b634 Martin KaFai Lau 2020-01-08  1962  {
85d33df357b634 Martin KaFai Lau 2020-01-08  1963  	return -EINVAL;
85d33df357b634 Martin KaFai Lau 2020-01-08  1964  }
68b04864ca425d Kui-Feng Lee     2023-03-22  1965  static inline int bpf_struct_ops_link_create(union bpf_attr *attr)
68b04864ca425d Kui-Feng Lee     2023-03-22  1966  {
68b04864ca425d Kui-Feng Lee     2023-03-22  1967  	return -EOPNOTSUPP;
68b04864ca425d Kui-Feng Lee     2023-03-22  1968  }
1338b93346587a Kui-Feng Lee     2024-01-19  1969  static inline void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map)
1338b93346587a Kui-Feng Lee     2024-01-19  1970  {
1338b93346587a Kui-Feng Lee     2024-01-19  1971  }
68b04864ca425d Kui-Feng Lee     2023-03-22  1972  

:::::: The code at line 1946 was first introduced by commit
:::::: f6be98d19985411ca1f3d53413d94d5b7f41c200 bpf, net: switch to dynamic registration

:::::: TO: Kui-Feng Lee <thinker.li@gmail.com>
:::::: CC: Martin KaFai Lau <martin.lau@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
