Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B264382F10
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 18:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777745858; cv=none; b=GCwlK3LCtwvKcfz154iIWD9XAtznfcGroKKoegw+u1pzo+Ebcji8QUMmsDUjAgWuomHjYjctOj0RzKovMNY3NZm9o0ivnrayNVzhT5XyMraM+VlbvE9UlPy/V5gNa0ys81KustO4DVwQleFgGNHmzPGQe8DQoWYgR3KX8/Po+SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777745858; c=relaxed/simple;
	bh=2VTStoeJ5Scz/dTGMKPQtjiKowZIeu1ghp562fBeuWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gSVUbpDJt2RFvke7UUL6pIPFwqmTQCCyuC0skzfTOvKgO4qjwz85KALQj2/pIe3bwNY6+MIwkYY9HrhcybQrcabHoKFH0+9bNOA4BZwLIKzs1dXnBCgj+0qRv/tMwqh07zKFOuyoAWQVXDsh3/CavhBqHKiGRoWEdLz/Z5T07kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a//n7FPJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a//n7FPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777745856; x=1809281856;
  h=date:from:to:cc:subject:message-id;
  bh=2VTStoeJ5Scz/dTGMKPQtjiKowZIeu1ghp562fBeuWg=;
  b=a//n7FPJr+Hnpbiu4XsCw0FVz/nygmaMCP+Bos6hUTwwZmF4z4NkFD5X
   FQUSEKvMg6J/c+ET/rtzzvseaCYKDOnWv7hHusPnEI1qzF4to6jRjZwMj
   FtY2urR8PyijVs8ZUfFjVM1TuDpeS0h/jO3uz88f6BcAl7dJtZq4PhEPm
   ZjNgjU2SYPegVgMRZfqclazfbYs7sYYEyWuTrVbZDK6XPDxVSck9Pw4l5
   PWsOPED/shMxfGIecuIJ5FZpDZBG7AAvouCxDwnTwzneYuePQHYhry2GI
   QVVw16uayQVP2DUZ+APP/yUcA36UaU+lEdlfu/6sBfrPbfzF2AbCpmfAO
   w==;
X-CSE-ConnectionGUID: IDd+jektTYyD+qI+f9gBpA==
X-CSE-MsgGUID: IDORtOfmTl6hSal9wZnVgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="89259452"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="89259452"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 11:17:34 -0700
X-CSE-ConnectionGUID: Jd+e+1deScSil8ZiLgH9yw==
X-CSE-MsgGUID: uwR8xcQPSt2GSQojy3S08Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="240136450"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 May 2026 11:17:32 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJEuA-000000001iP-0MEO;
	Sat, 02 May 2026 18:17:30 +0000
Date: Sun, 03 May 2026 02:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-bpf 68/72]
 include/linux/bpf.h:2148:50: warning: statement with no effect
Message-ID: <202605030220.B4UAYrCH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-bpf
head:   a4274c904a1967dad21b56fbb0205704d55aab2d
commit: 99cae309d8d4dbe0fdedc879f4b35a1b64b844fb [68/72] fuse: enable fuse servers to upload BPF programs to handle iomap requests
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605030220.B4UAYrCH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030220.B4UAYrCH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030220.B4UAYrCH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/fuse/fuse_iomap_bpf.c:7:
   fs/fuse/fuse_iomap_bpf.c: In function 'fuse_iomap_init_bpf':
>> include/linux/bpf.h:2148:50: warning: statement with no effect [-Wunused-value]
    2148 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   fs/fuse/fuse_iomap_bpf.c:237:16: note: in expansion of macro 'register_bpf_struct_ops'
     237 |         return register_bpf_struct_ops(&fuse_iomap_bpf_struct_ops,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from fuse_iomap_bpf.c:7:
   fuse_iomap_bpf.c: In function 'fuse_iomap_init_bpf':
>> include/linux/bpf.h:2148:50: warning: statement with no effect [-Wunused-value]
    2148 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   fuse_iomap_bpf.c:237:16: note: in expansion of macro 'register_bpf_struct_ops'
     237 |         return register_bpf_struct_ops(&fuse_iomap_bpf_struct_ops,
         |                ^~~~~~~~~~~~~~~~~~~~~~~


vim +2148 include/linux/bpf.h

c196906d50e360 Hou Tao          2021-10-25  2138  
c196906d50e360 Hou Tao          2021-10-25  2139  int bpf_struct_ops_test_run(struct bpf_prog *prog, const union bpf_attr *kattr,
c196906d50e360 Hou Tao          2021-10-25  2140  			    union bpf_attr __user *uattr);
c196906d50e360 Hou Tao          2021-10-25  2141  #endif
f6be98d1998541 Kui-Feng Lee     2024-01-19  2142  int bpf_struct_ops_desc_init(struct bpf_struct_ops_desc *st_ops_desc,
f6be98d1998541 Kui-Feng Lee     2024-01-19  2143  			     struct btf *btf,
f6be98d1998541 Kui-Feng Lee     2024-01-19  2144  			     struct bpf_verifier_log *log);
1338b93346587a Kui-Feng Lee     2024-01-19  2145  void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map);
1611603537a4b8 Kui-Feng Lee     2024-02-08  2146  void bpf_struct_ops_desc_release(struct bpf_struct_ops_desc *st_ops_desc);
27ae7997a66174 Martin KaFai Lau 2020-01-08  2147  #else
f6be98d1998541 Kui-Feng Lee     2024-01-19 @2148  #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
85d33df357b634 Martin KaFai Lau 2020-01-08  2149  static inline bool bpf_try_module_get(const void *data, struct module *owner)
85d33df357b634 Martin KaFai Lau 2020-01-08  2150  {
85d33df357b634 Martin KaFai Lau 2020-01-08  2151  	return try_module_get(owner);
85d33df357b634 Martin KaFai Lau 2020-01-08  2152  }
85d33df357b634 Martin KaFai Lau 2020-01-08  2153  static inline void bpf_module_put(const void *data, struct module *owner)
85d33df357b634 Martin KaFai Lau 2020-01-08  2154  {
85d33df357b634 Martin KaFai Lau 2020-01-08  2155  	module_put(owner);
85d33df357b634 Martin KaFai Lau 2020-01-08  2156  }
e42ac14180554f Martin KaFai Lau 2024-07-22  2157  static inline int bpf_struct_ops_supported(const struct bpf_struct_ops *st_ops, u32 moff)
e42ac14180554f Martin KaFai Lau 2024-07-22  2158  {
e42ac14180554f Martin KaFai Lau 2024-07-22  2159  	return -ENOTSUPP;
e42ac14180554f Martin KaFai Lau 2024-07-22  2160  }
85d33df357b634 Martin KaFai Lau 2020-01-08  2161  static inline int bpf_struct_ops_map_sys_lookup_elem(struct bpf_map *map,
85d33df357b634 Martin KaFai Lau 2020-01-08  2162  						     void *key,
85d33df357b634 Martin KaFai Lau 2020-01-08  2163  						     void *value)
85d33df357b634 Martin KaFai Lau 2020-01-08  2164  {
85d33df357b634 Martin KaFai Lau 2020-01-08  2165  	return -EINVAL;
85d33df357b634 Martin KaFai Lau 2020-01-08  2166  }
68b04864ca425d Kui-Feng Lee     2023-03-22  2167  static inline int bpf_struct_ops_link_create(union bpf_attr *attr)
68b04864ca425d Kui-Feng Lee     2023-03-22  2168  {
68b04864ca425d Kui-Feng Lee     2023-03-22  2169  	return -EOPNOTSUPP;
68b04864ca425d Kui-Feng Lee     2023-03-22  2170  }
b5709f6d26d65f Amery Hung       2025-12-03  2171  static inline int bpf_prog_assoc_struct_ops(struct bpf_prog *prog, struct bpf_map *map)
b5709f6d26d65f Amery Hung       2025-12-03  2172  {
b5709f6d26d65f Amery Hung       2025-12-03  2173  	return -EOPNOTSUPP;
b5709f6d26d65f Amery Hung       2025-12-03  2174  }
b5709f6d26d65f Amery Hung       2025-12-03  2175  static inline void bpf_prog_disassoc_struct_ops(struct bpf_prog *prog)
b5709f6d26d65f Amery Hung       2025-12-03  2176  {
b5709f6d26d65f Amery Hung       2025-12-03  2177  }
b5709f6d26d65f Amery Hung       2025-12-03  2178  static inline void *bpf_prog_get_assoc_struct_ops(const struct bpf_prog_aux *aux)
b5709f6d26d65f Amery Hung       2025-12-03  2179  {
b5709f6d26d65f Amery Hung       2025-12-03  2180  	return NULL;
b5709f6d26d65f Amery Hung       2025-12-03  2181  }
1338b93346587a Kui-Feng Lee     2024-01-19  2182  static inline void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map)
1338b93346587a Kui-Feng Lee     2024-01-19  2183  {
1338b93346587a Kui-Feng Lee     2024-01-19  2184  }
68b04864ca425d Kui-Feng Lee     2023-03-22  2185  

:::::: The code at line 2148 was first introduced by commit
:::::: f6be98d19985411ca1f3d53413d94d5b7f41c200 bpf, net: switch to dynamic registration

:::::: TO: Kui-Feng Lee <thinker.li@gmail.com>
:::::: CC: Martin KaFai Lau <martin.lau@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
