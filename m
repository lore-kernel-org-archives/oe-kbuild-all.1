Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339B923B612
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 04:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769315345; cv=none; b=E4XZY49nDtv4uguI/yj2MxAuNSbkm3kSSrZFqrHXLPB5moARYV8eZXw/9cUawoIPm5AHYX+j5SqEBJTy+u4knISZe2mKyVAODEfGbDy0q/Rmoth10q8HB3vcCtTyaATz42tDIiNYkeLNLo523TMqHCHdw/cdLcDMUe8znFapfDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769315345; c=relaxed/simple;
	bh=ACEvMzxgmCiyrX1EbLRtzOn+u7Q6stC20FG2semqdV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrvSjFcoBz6Kxd5ZZ46qrFV3Y2g/SUEA7G4IwbwV/xCd3jIMMr6gAlczDPVabaKOALcU8BmEuY6W1BJr/EgVgyG4BBN8nRdNNLQEGz1HqH8J/7lxqOGRZHTMkJpX30HdN2Faq1GzVqU2t/tB7Fmz9aQUELfkhkiKN+czdk1nJxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWzCxyOL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWzCxyOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769315334; x=1800851334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ACEvMzxgmCiyrX1EbLRtzOn+u7Q6stC20FG2semqdV0=;
  b=fWzCxyOLwc2WyCIwoAo1kKc8PaVCFEdMNcaf9rmmaUGw1/Q6yI9S9vFj
   He36QjEScbLYEUuAK6j2NIXlCew5TQje76jVt4od5Hlkn0NJ3gjlXtZwp
   FxvE92WxymnvySfvnwJkBk5zlJIcDbzrB5wbg1IlvjHPX/NaQ3TtQE4X3
   ZCRePH+7u1+psDtZRf7ldLa/SQ/NGtpvH5OoIZpwQbOsQg/nAcCLM/cn1
   z0gZnGSzjzafjsyQKeEZMJNs58SFJKxoTLdjqTtPX9/fyUnf+G/zAE1LF
   AGFD0rB1AiG/JWMttM7bNWIMJ6BaMMSF9TIBvjXmpMRTWQI9sXErrlEdG
   w==;
X-CSE-ConnectionGUID: GvkHF+3lQwK1yLpQfKBXuQ==
X-CSE-MsgGUID: EZYgCsjlQ8yjNDbJCiSmbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="69540381"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="69540381"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 20:28:49 -0800
X-CSE-ConnectionGUID: sa+XzBB1RkqXSOOgxhGRYA==
X-CSE-MsgGUID: Y64EPLR+SE6E1jpzSSckWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="206498225"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jan 2026 20:28:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjrjx-00000000Vm2-1VIV;
	Sun, 25 Jan 2026 04:28:45 +0000
Date: Sun, 25 Jan 2026 12:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next v3 08/12] mm: memcontrol: Add BPF struct_ops
 for memory controller
Message-ID: <202601251214.y5hDAoUJ-lkp@intel.com>
References: <863b91cb85097f137bc741e7cb686ff78d9bb95e.1769157382.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <863b91cb85097f137bc741e7cb686ff78d9bb95e.1769157382.git.zhuhui@kylinos.cn>

Hi Hui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[cannot apply to akpm-mm/mm-everything bpf-next/net bpf/master linus/master v6.19-rc6 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Zhu/bpf-move-bpf_struct_ops_link-into-bpf-h/20260123-170445
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/863b91cb85097f137bc741e7cb686ff78d9bb95e.1769157382.git.zhuhui%40kylinos.cn
patch subject: [RFC PATCH bpf-next v3 08/12] mm: memcontrol: Add BPF struct_ops for memory controller
config: loongarch-randconfig-002-20260125 (https://download.01.org/0day-ci/archive/20260125/202601251214.y5hDAoUJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251214.y5hDAoUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251214.y5hDAoUJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/loongarch/kernel/asm-offsets.c:13:
   include/linux/memcontrol.h: In function 'bpf_memcg_get_high_delay':
>> include/linux/memcontrol.h:644:62: error: expected ';' before '}' token
     644 | bpf_memcg_get_high_delay(struct mem_cgroup *memcg) { return 0 }
         |                                                              ^~
         |                                                              ;
   include/linux/memcontrol.h: At top level:
>> include/linux/memcontrol.h:645:15: error: return type defaults to 'int' [-Wimplicit-int]
     645 | static inline bpf_memcg_below_low(struct mem_cgroup *memcg) { return false }
         |               ^~~~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h: In function 'bpf_memcg_below_low':
   include/linux/memcontrol.h:645:75: error: expected ';' before '}' token
     645 | static inline bpf_memcg_below_low(struct mem_cgroup *memcg) { return false }
         |                                                                           ^~
         |                                                                           ;
   include/linux/memcontrol.h: At top level:
   include/linux/memcontrol.h:646:15: error: return type defaults to 'int' [-Wimplicit-int]
     646 | static inline bpf_memcg_below_min(struct mem_cgroup *memcg) { return false }
         |               ^~~~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h: In function 'bpf_memcg_below_min':
   include/linux/memcontrol.h:646:75: error: expected ';' before '}' token
     646 | static inline bpf_memcg_below_min(struct mem_cgroup *memcg) { return false }
         |                                                                           ^~
         |                                                                           ;
   make[3]: *** [scripts/Makefile.build:182: arch/loongarch/kernel/asm-offsets.s] Error 1 shuffle=1717507361
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1315: prepare0] Error 2 shuffle=1717507361
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1717507361
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1717507361
   make: Target 'prepare' not remade because of errors.


vim +644 include/linux/memcontrol.h

   642	
   643	static inline unsigned long
 > 644	bpf_memcg_get_high_delay(struct mem_cgroup *memcg) { return 0 }
 > 645	static inline bpf_memcg_below_low(struct mem_cgroup *memcg) { return false }
   646	static inline bpf_memcg_below_min(struct mem_cgroup *memcg) { return false }
   647	static inline void memcontrol_bpf_online(struct mem_cgroup *memcg) { }
   648	static inline void memcontrol_bpf_offline(struct mem_cgroup *memcg) { }
   649	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
