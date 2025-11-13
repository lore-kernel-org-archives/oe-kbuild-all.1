Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A193009F1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 06:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763015974; cv=none; b=fEih2hnYCDYKWWlxEuxKykLWd/qbFiGGGXLlF32oo8/SHuL+/2Ef5eoafEKHaBRsVymJX9SM9oWJ7FUSuc6hV25ALkjealB+Ao7RpSX2cZO4zVoyQP5AQIFrDbMhZM8qoiY+g4qjAZH+wmTgUk4znmWpqtyN6rJoDk2YMR6nq94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763015974; c=relaxed/simple;
	bh=a1Uq1MUWWQNG3VkQgHPrsMsoUZD97gyuVOrw21MT5p4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jTujvyn6AkG9iEMa3TZxr8Rvj0ova69UiPY72tDHtoQut7KMvpXGxuap/AC7HECml9gcAelb1ZV4VPSkHJsORXHVEaUF/o1HDRREZhAvPhQ/2LIKggiqvahdf8LFOFB8zmX9aoEk67Qs43db7VrPbFttg0QdCDSLeSKvS1rf4Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bIyNtXgT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bIyNtXgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763015972; x=1794551972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a1Uq1MUWWQNG3VkQgHPrsMsoUZD97gyuVOrw21MT5p4=;
  b=bIyNtXgTMrbaiYv+8QXj7TdDEwjprUBWdcnR5O0LtSJ0PEO2OT/+AmdZ
   A/KRSLSfGkKZNRvRvFHajzByEa5ipyXKnNlDP5gpM8YfGdq4bP2O30Cfa
   K2x3e0UsG3hxfmBLcB3FIXvwMg6rzG7VQIMIWmnNDx73hxXeH28AAGVsA
   hC51lRCriA/Vy7UcQnyIeeKDVjz9EP52mxYg8qDJAa6qTd57Rq8JupP6i
   bvhFhZytI86m0sdHtJ4O5lneSclggbmTL0GLA+nqsCOF0RWy8CJTWX/pv
   byhueBbYiO44pCbSphC5qFD7OqInvhyR9icucJP5+8ItTU+c+iBsw3jWY
   Q==;
X-CSE-ConnectionGUID: 8IOu16uDQQ22MIDV2CsBLw==
X-CSE-MsgGUID: apBw89YlRZqfnuqMCOvRBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65125411"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65125411"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 22:39:32 -0800
X-CSE-ConnectionGUID: jUa2HLyRTYmTklxvZeRuBQ==
X-CSE-MsgGUID: 9epFBuWUSAG75+jhAoyzXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="193677650"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Nov 2025 22:39:30 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJQzQ-0004z1-2B;
	Thu, 13 Nov 2025 06:39:28 +0000
Date: Thu, 13 Nov 2025 14:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: "D. Wythe" <alibuda@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Martin KaFai Lau <martin.lau@kernel.org>,
	Dust Li <dust.li@linux.alibaba.com>
Subject: [linux-next:master 6896/8485] include/linux/bpf.h:2037:50: warning:
 statement with no effect
Message-ID: <202511131459.BdjDWNnG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
commit: 15f295f55656658e65bdbc9b901d6b2e49d68d72 [6896/8485] net/smc: bpf: Introduce generic hook for handshake flow
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20251113/202511131459.BdjDWNnG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131459.BdjDWNnG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131459.BdjDWNnG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bpf_verifier.h:7,
                    from net/smc/smc_hs_bpf.c:13:
   net/smc/smc_hs_bpf.c: In function 'bpf_smc_hs_ctrl_init':
>> include/linux/bpf.h:2037:50: warning: statement with no effect [-Wunused-value]
    2037 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   net/smc/smc_hs_bpf.c:139:16: note: in expansion of macro 'register_bpf_struct_ops'
     139 |         return register_bpf_struct_ops(&bpf_smc_hs_ctrl_ops, smc_hs_ctrl);
         |                ^~~~~~~~~~~~~~~~~~~~~~~


vim +2037 include/linux/bpf.h

c196906d50e360 Hou Tao          2021-10-25  2027  
c196906d50e360 Hou Tao          2021-10-25  2028  int bpf_struct_ops_test_run(struct bpf_prog *prog, const union bpf_attr *kattr,
c196906d50e360 Hou Tao          2021-10-25  2029  			    union bpf_attr __user *uattr);
c196906d50e360 Hou Tao          2021-10-25  2030  #endif
f6be98d1998541 Kui-Feng Lee     2024-01-19  2031  int bpf_struct_ops_desc_init(struct bpf_struct_ops_desc *st_ops_desc,
f6be98d1998541 Kui-Feng Lee     2024-01-19  2032  			     struct btf *btf,
f6be98d1998541 Kui-Feng Lee     2024-01-19  2033  			     struct bpf_verifier_log *log);
1338b93346587a Kui-Feng Lee     2024-01-19  2034  void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map);
1611603537a4b8 Kui-Feng Lee     2024-02-08  2035  void bpf_struct_ops_desc_release(struct bpf_struct_ops_desc *st_ops_desc);
27ae7997a66174 Martin KaFai Lau 2020-01-08  2036  #else
f6be98d1998541 Kui-Feng Lee     2024-01-19 @2037  #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
85d33df357b634 Martin KaFai Lau 2020-01-08  2038  static inline bool bpf_try_module_get(const void *data, struct module *owner)
85d33df357b634 Martin KaFai Lau 2020-01-08  2039  {
85d33df357b634 Martin KaFai Lau 2020-01-08  2040  	return try_module_get(owner);
85d33df357b634 Martin KaFai Lau 2020-01-08  2041  }
85d33df357b634 Martin KaFai Lau 2020-01-08  2042  static inline void bpf_module_put(const void *data, struct module *owner)
85d33df357b634 Martin KaFai Lau 2020-01-08  2043  {
85d33df357b634 Martin KaFai Lau 2020-01-08  2044  	module_put(owner);
85d33df357b634 Martin KaFai Lau 2020-01-08  2045  }
e42ac14180554f Martin KaFai Lau 2024-07-22  2046  static inline int bpf_struct_ops_supported(const struct bpf_struct_ops *st_ops, u32 moff)
e42ac14180554f Martin KaFai Lau 2024-07-22  2047  {
e42ac14180554f Martin KaFai Lau 2024-07-22  2048  	return -ENOTSUPP;
e42ac14180554f Martin KaFai Lau 2024-07-22  2049  }
85d33df357b634 Martin KaFai Lau 2020-01-08  2050  static inline int bpf_struct_ops_map_sys_lookup_elem(struct bpf_map *map,
85d33df357b634 Martin KaFai Lau 2020-01-08  2051  						     void *key,
85d33df357b634 Martin KaFai Lau 2020-01-08  2052  						     void *value)
85d33df357b634 Martin KaFai Lau 2020-01-08  2053  {
85d33df357b634 Martin KaFai Lau 2020-01-08  2054  	return -EINVAL;
85d33df357b634 Martin KaFai Lau 2020-01-08  2055  }
68b04864ca425d Kui-Feng Lee     2023-03-22  2056  static inline int bpf_struct_ops_link_create(union bpf_attr *attr)
68b04864ca425d Kui-Feng Lee     2023-03-22  2057  {
68b04864ca425d Kui-Feng Lee     2023-03-22  2058  	return -EOPNOTSUPP;
68b04864ca425d Kui-Feng Lee     2023-03-22  2059  }
1338b93346587a Kui-Feng Lee     2024-01-19  2060  static inline void bpf_map_struct_ops_info_fill(struct bpf_map_info *info, struct bpf_map *map)
1338b93346587a Kui-Feng Lee     2024-01-19  2061  {
1338b93346587a Kui-Feng Lee     2024-01-19  2062  }
68b04864ca425d Kui-Feng Lee     2023-03-22  2063  

:::::: The code at line 2037 was first introduced by commit
:::::: f6be98d19985411ca1f3d53413d94d5b7f41c200 bpf, net: switch to dynamic registration

:::::: TO: Kui-Feng Lee <thinker.li@gmail.com>
:::::: CC: Martin KaFai Lau <martin.lau@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
