Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193AF261B82
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756728580; cv=none; b=pvB/aT/MIonPfI6X5HBhGqcjitwd+4Il9OBANbVUTEQlPpUPHZbPx6Ro2lLOHa9W13kfpKuFIMMTWv5Gl3mGACFvt6hh9lqU7JsI5YE7qM9e133lMygkQNglM5j4XAwph+Dx9U5WtmHVxCvPRe+aFRHVWOBvrehbfZR65kCPyos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756728580; c=relaxed/simple;
	bh=zcqbXvp1nsEnYBAEzbhBxEFUuvqdchGx6Q/bDZIjMNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KZb7RoljPUVzLslZp03P6rfazkeqaox/obmrVJdltUQ0piRhvOxXWm/yUCJAC9JtWPfWZIAwyJaIjJZB/ocYSlcwLD/iPQyu8Nyuri8KH6EEly2NRZRXjZCci0k6K7j5kX8rIZ2UhSwcYARYB/jf3YqSAmJ4QnUQpMPylA7KOQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+RXe5IU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+RXe5IU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756728579; x=1788264579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zcqbXvp1nsEnYBAEzbhBxEFUuvqdchGx6Q/bDZIjMNY=;
  b=b+RXe5IUOnK4x/1CSTSF1D0UhN3RcP9qHy0yV2F9TTqVgvlHNoqxGHdQ
   PscJiQEnDy0JO0TUIzdmsIAWckmY8L9MAwRE1MjCP2tdtDnYIiS87KuX4
   SmIh4CNRLPWYSVWws3Pjak6Aa+3/1FnlXUEW+uV8klfyw5nPArFww8Joq
   n2bxXN1F51AZ5ILgxSnsYf+2rECfXFTYpOq4L9M6FmDTU9SNsfaOHc4RB
   NlsvNBzkHFbLY3gmCSiEGX8KW5fnic7d9rCVqXpBk+QM3Dd3eVTKubrCG
   iSxiEk95DrKbqCLGWxNXo5LZOhmx2wq6752/2p0kH0lIsOTrmxL1PTIy5
   w==;
X-CSE-ConnectionGUID: 7I4729usThaeOA09UQZ9mA==
X-CSE-MsgGUID: OyBJHjGEQd6mo4tmLgH/sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="76433264"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="76433264"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 05:09:38 -0700
X-CSE-ConnectionGUID: u8zGY/mHTJGF/JTE4vI+ng==
X-CSE-MsgGUID: DaIHryrzTeKP9QkCmHre+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170979900"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Sep 2025 05:09:37 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ut3KT-0000ZR-2T;
	Mon, 01 Sep 2025 12:08:25 +0000
Date: Mon, 1 Sep 2025 20:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2.0 2/15] include/linux/bpf.h:2017:50: warning:
 statement with no effect
Message-ID: <202509011931.07ufhDWm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2.0
head:   1e64a12296a20cfcd5d09bbe019a59167542c0eb
commit: 94f4694e6ac8c51cbdeb6f8b51944ef03dd62984 [2/15] mm: introduce bpf struct ops for OOM handling
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20250901/202509011931.07ufhDWm-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250901/202509011931.07ufhDWm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509011931.07ufhDWm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_struct_ops_init':
>> include/linux/bpf.h:2017:50: warning: statement with no effect [-Wunused-value]
    2017 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   mm/bpf_oom.c:155:16: note: in expansion of macro 'register_bpf_struct_ops'
     155 |         return register_bpf_struct_ops(&bpf_oom_bpf_ops, bpf_oom_ops);
         |                ^~~~~~~~~~~~~~~~~~~~~~~


vim +2017 include/linux/bpf.h

c196906d50e360 Hou Tao          2021-10-25  2007  
c196906d50e360 Hou Tao          2021-10-25  2008  int bpf_struct_ops_test_run(struct bpf_prog *prog, const union bpf_attr *kattr,
c196906d50e360 Hou Tao          2021-10-25  2009  			    union bpf_attr __user *uattr);
c196906d50e360 Hou Tao          2021-10-25  2010  #endif
f6be98d1998541 Kui-Feng Lee     2024-01-19  2011  int bpf_struct_ops_desc_init(struct bpf_struct_ops_desc *st_ops_desc,
f6be98d1998541 Kui-Feng Lee     2024-01-19  2012  			     struct btf *btf,
f6be98d1998541 Kui-Feng Lee     2024-01-19  2013  			     struct bpf_verifier_log *log);
1338b93346587a Kui-Feng Lee     2024-01-19  2014  void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map);
1611603537a4b8 Kui-Feng Lee     2024-02-08  2015  void bpf_struct_ops_desc_release(struct bpf_struct_ops_desc *st_ops_desc);
27ae7997a66174 Martin KaFai Lau 2020-01-08  2016  #else
f6be98d1998541 Kui-Feng Lee     2024-01-19 @2017  #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
85d33df357b634 Martin KaFai Lau 2020-01-08  2018  static inline bool bpf_try_module_get(const void *data, struct module *owner)
85d33df357b634 Martin KaFai Lau 2020-01-08  2019  {
85d33df357b634 Martin KaFai Lau 2020-01-08  2020  	return try_module_get(owner);
85d33df357b634 Martin KaFai Lau 2020-01-08  2021  }
85d33df357b634 Martin KaFai Lau 2020-01-08  2022  static inline void bpf_module_put(const void *data, struct module *owner)
85d33df357b634 Martin KaFai Lau 2020-01-08  2023  {
85d33df357b634 Martin KaFai Lau 2020-01-08  2024  	module_put(owner);
85d33df357b634 Martin KaFai Lau 2020-01-08  2025  }
e42ac14180554f Martin KaFai Lau 2024-07-22  2026  static inline int bpf_struct_ops_supported(const struct bpf_struct_ops *st_ops, u32 moff)
e42ac14180554f Martin KaFai Lau 2024-07-22  2027  {
e42ac14180554f Martin KaFai Lau 2024-07-22  2028  	return -ENOTSUPP;
e42ac14180554f Martin KaFai Lau 2024-07-22  2029  }
85d33df357b634 Martin KaFai Lau 2020-01-08  2030  static inline int bpf_struct_ops_map_sys_lookup_elem(struct bpf_map *map,
85d33df357b634 Martin KaFai Lau 2020-01-08  2031  						     void *key,
85d33df357b634 Martin KaFai Lau 2020-01-08  2032  						     void *value)
85d33df357b634 Martin KaFai Lau 2020-01-08  2033  {
85d33df357b634 Martin KaFai Lau 2020-01-08  2034  	return -EINVAL;
85d33df357b634 Martin KaFai Lau 2020-01-08  2035  }
68b04864ca425d Kui-Feng Lee     2023-03-22  2036  static inline int bpf_struct_ops_link_create(union bpf_attr *attr)
68b04864ca425d Kui-Feng Lee     2023-03-22  2037  {
68b04864ca425d Kui-Feng Lee     2023-03-22  2038  	return -EOPNOTSUPP;
68b04864ca425d Kui-Feng Lee     2023-03-22  2039  }
1338b93346587a Kui-Feng Lee     2024-01-19  2040  static inline void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map)
1338b93346587a Kui-Feng Lee     2024-01-19  2041  {
1338b93346587a Kui-Feng Lee     2024-01-19  2042  }
68b04864ca425d Kui-Feng Lee     2023-03-22  2043  

:::::: The code at line 2017 was first introduced by commit
:::::: f6be98d19985411ca1f3d53413d94d5b7f41c200 bpf, net: switch to dynamic registration

:::::: TO: Kui-Feng Lee <thinker.li@gmail.com>
:::::: CC: Martin KaFai Lau <martin.lau@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
