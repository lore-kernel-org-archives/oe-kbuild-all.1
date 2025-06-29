Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF101DB54C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 21:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751234353; cv=none; b=frK+qP7OrNK3WvUjRtNZE6E2nFDxaY5lu6ZCX7NrytnjphuqmqYcltQcsdUyCHtnw+EWNIhZtA/4xWJaZHmAucWIoZJGfQDtVBqbmrr7avOAsnXjkN2COxVgcUkmD0423unpxTGOz5oMC/zEuGG+MmQJFf8kcmv5OY4GpmXR5AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751234353; c=relaxed/simple;
	bh=YgW+sn1K0gx2kjEDKJ0/pdcespzXs6M1x8aw36JlNZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dMjnUHzitSLr8g43nTd+6OG9oED/bbZ+LS/P54/KeLaBA67EES2/hAnnenCAQD5IIaawFxOy2FU/5OE81Gx5YvFtDRqVH1ufz0GFBCSfU73dNllxL7tKg6lrZFnI21c3egy55Z7zw040lZcX3j992+K2+3xZFzJQqqgFUsbuAYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXLnVozR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXLnVozR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751234352; x=1782770352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YgW+sn1K0gx2kjEDKJ0/pdcespzXs6M1x8aw36JlNZA=;
  b=AXLnVozRxIzBdrOjhyP8VaXZZS5STFZZo2NNaZes6G/tjap7yw4WKFPS
   UZlo2di1Mn9oGnN57KapN65Lo8wrvGJO91eIAeg1tmhxrr/CSy+qwd7yF
   UDzX5slLsW8537MhLr8k43sJ6vx0H6ByoA3Z3zF7BrCMeS9JyxV3tDZpp
   Zmy7L5DIsbu+I3yoG8pOSxkQ940DiWPwlZcaDUtWjU9DEga/HeGzS5p/v
   r8IWpIlssjwjhoog99q+L30DmC0LFkDCnMX/5IbG1xdX7ZtKYApIn6FjN
   VMeUq5UTlrlAWvqDh08SISvZ+PJU7vV/v0ro56OESj0rUjN3yA0OFa/F3
   A==;
X-CSE-ConnectionGUID: 7i697Ms1SYqKPjLavI8GsQ==
X-CSE-MsgGUID: BL4xoLEbSF27/r4GqE6rYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="70895221"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="70895221"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 14:59:11 -0700
X-CSE-ConnectionGUID: OdPI9CZ6QlKt1XcfSSkqLQ==
X-CSE-MsgGUID: TFsY2HjtTB2pQDO6Y8ET+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="157311813"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jun 2025 14:59:09 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW03H-0000z1-2c;
	Sun, 29 Jun 2025 21:59:07 +0000
Date: Sun, 29 Jun 2025 23:58:20 +0200
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.3 2/16] include/linux/bpf.h:1946:50: warning:
 statement with no effect
Message-ID: <202506292300.zN1wbxYP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.3
head:   2ad0d39d05d59bc3930ed54991a90d397fd498a8
commit: 954f163d5cf03cb8f4ea7c9930265fc327c46a91 [2/16] mm: introduce a bpf hook for OOM handling
config: loongarch-randconfig-2006-20250625 (https://download.01.org/0day-ci/archive/20250629/202506292300.zN1wbxYP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506292300.zN1wbxYP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506292300.zN1wbxYP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_struct_ops_init':
>> include/linux/bpf.h:1946:50: warning: statement with no effect [-Wunused-value]
    1946 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   mm/bpf_oom.c:138:16: note: in expansion of macro 'register_bpf_struct_ops'
     138 |         return register_bpf_struct_ops(&bpf_oom_bpf_ops, bpf_oom_ops);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics


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
