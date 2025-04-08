Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B556E25FA1B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095768; cv=none; b=iH8wZZ8IVE6MLyfqsC8hpjFT5obnu4CqHKHvb6T5iTqnXaPPQTQtioDHejz/RcL/qaK5mb8Cmfroli7Uornmzx+K0eWV7Wf6HwfabcfLy0MtPdMnsPF0q55ahTPTmCvMOsx475nSY/nEPNrFlDratu7aeOKIUg3skJyyg4Mk9a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095768; c=relaxed/simple;
	bh=4IO+GQDBkLehlW2jP+GUWqTbOjfX7UjGpHWeGWZYEec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iSPfj0WSq5+w3ZibFqDTY1iVcKotv9v5tAb9ZdIuqAayuYa79GSOmbP9cyHE8IeaU530N9IBc5x9CHD4cgMO8kynFAa9hsrvni4rQCH2JJ0lkd7SVn6fHSK1sfZ3vdDcuIVYlEf8AmrLJS13E1WhLudokNJzmNGHzw9oBDKsKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+HJOSB/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+HJOSB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744095767; x=1775631767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4IO+GQDBkLehlW2jP+GUWqTbOjfX7UjGpHWeGWZYEec=;
  b=b+HJOSB/o0LpUbwnwEl10ILL9F/ijtd+KqayHwAsLczy5AV6Bd5zZf8A
   6+zFSg3VtWTDEz1+/FiRXN6kgzgHAgO69Wm1eiY78IE8rFcBgaZp4IwTK
   V3wBIBDxmABTMFDXJo4AyYqRX0SW1NTvNU3EYuMx7t9+KLMZm5YkD2MqY
   dTiDzJsluVxdwI/Y5TroqAtNBvJxQwWgmd8nq1gyHl27MoOWvE+7BeCGl
   r+G4NUlwnI9lAGGxzj8GNv5uk4UZWVsNoeuPw0Uu2NZIp9bXpUes0hwQ1
   /y4iaoAC+MehEpd2scc4PwC2ZNbF/MJYJhqLBhhWao70V+ryk8/3CEvl0
   g==;
X-CSE-ConnectionGUID: f1/4maa4S1y4cdFy2tL6dQ==
X-CSE-MsgGUID: Kmk9eyT8TNStfsvtPEg9FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="33117688"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="33117688"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 00:02:43 -0700
X-CSE-ConnectionGUID: 9nX52u/tTI+KQ4B2OM0wGg==
X-CSE-MsgGUID: xY5k0gJmSNe/q9skEWoVKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="128511444"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Apr 2025 00:02:42 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u22ym-0004DT-19;
	Tue, 08 Apr 2025 07:02:40 +0000
Date: Tue, 8 Apr 2025 15:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/slub.c:4106:7: warning: no
 previous prototype for 'oot___kmalloc_node_0'
Message-ID: <202504081416.EGys6UDL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   c55bd07f747cd457f58e5781279fa11a5fc0add1
commit: baa47e1aa754428b439764393f2d71fb6bce04bf [9/9] anolis: mm: introduce per module slab for oot memory isolation
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250408/202504081416.EGys6UDL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081416.EGys6UDL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081416.EGys6UDL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_0' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4040:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4040 | DEFINE_OOT_FUNC___kmalloc(0);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_1' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4041:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4041 | DEFINE_OOT_FUNC___kmalloc(1);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_2' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4042:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4042 | DEFINE_OOT_FUNC___kmalloc(2);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_3' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4043:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4043 | DEFINE_OOT_FUNC___kmalloc(3);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_4' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4044:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4044 | DEFINE_OOT_FUNC___kmalloc(4);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_5' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4045:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4045 | DEFINE_OOT_FUNC___kmalloc(5);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_6' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4046:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4046 | DEFINE_OOT_FUNC___kmalloc(6);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_7' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4047:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4047 | DEFINE_OOT_FUNC___kmalloc(7);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_8' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4048:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4048 | DEFINE_OOT_FUNC___kmalloc(8);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_9' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4049:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4049 | DEFINE_OOT_FUNC___kmalloc(9);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_10' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4050:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4050 | DEFINE_OOT_FUNC___kmalloc(10);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_11' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4051:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4051 | DEFINE_OOT_FUNC___kmalloc(11);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_12' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4052:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4052 | DEFINE_OOT_FUNC___kmalloc(12);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_13' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4053:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4053 | DEFINE_OOT_FUNC___kmalloc(13);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_14' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4054:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4054 | DEFINE_OOT_FUNC___kmalloc(14);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_15' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4055:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4055 | DEFINE_OOT_FUNC___kmalloc(15);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_0' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4136:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4136 | DEFINE_OOT_FUNC___kmalloc_node(0);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_1' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4137:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4137 | DEFINE_OOT_FUNC___kmalloc_node(1);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_2' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4138:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4138 | DEFINE_OOT_FUNC___kmalloc_node(2);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_3' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4139:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4139 | DEFINE_OOT_FUNC___kmalloc_node(3);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_4' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4140:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4140 | DEFINE_OOT_FUNC___kmalloc_node(4);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_5' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4141:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4141 | DEFINE_OOT_FUNC___kmalloc_node(5);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_6' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4142:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4142 | DEFINE_OOT_FUNC___kmalloc_node(6);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_7' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4143:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4143 | DEFINE_OOT_FUNC___kmalloc_node(7);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_8' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4144:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4144 | DEFINE_OOT_FUNC___kmalloc_node(8);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_9' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4145:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4145 | DEFINE_OOT_FUNC___kmalloc_node(9);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_10' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4146:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4146 | DEFINE_OOT_FUNC___kmalloc_node(10);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_11' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4147:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4147 | DEFINE_OOT_FUNC___kmalloc_node(11);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_12' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4148:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4148 | DEFINE_OOT_FUNC___kmalloc_node(12);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_13' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4149:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4149 | DEFINE_OOT_FUNC___kmalloc_node(13);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_14' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4150:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4150 | DEFINE_OOT_FUNC___kmalloc_node(14);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4106:7: warning: no previous prototype for 'oot___kmalloc_node_15' [-Wmissing-prototypes]
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slub.c:4151:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4151 | DEFINE_OOT_FUNC___kmalloc_node(15);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/oot___kmalloc_node_0 +4106 mm/slub.c

  4104	
  4105	#define DEFINE_OOT_FUNC___kmalloc_node(index)				\
> 4106	void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)	\
  4107	{									\
  4108		struct kmem_cache *s;						\
  4109		void *ret;							\
  4110										\
  4111		if (unlikely(size > KMALLOC_MAX_CACHE_SIZE)) {			\
  4112			ret = kmalloc_large_node(size, flags, node);		\
  4113										\
  4114			trace_kmalloc_node(_RET_IP_, ret,			\
  4115					   size, PAGE_SIZE << get_order(size),	\
  4116					   flags, node);			\
  4117										\
  4118			return ret;						\
  4119		}								\
  4120										\
  4121		s = oot_kmalloc_slab(index, size, flags);			\
  4122										\
  4123		if (unlikely(ZERO_OR_NULL_PTR(s)))				\
  4124			return s;						\
  4125										\
  4126		ret = slab_alloc_node(s, flags, node, _RET_IP_, size);		\
  4127										\
  4128		trace_kmalloc_node(_RET_IP_, ret, size, s->size, flags, node);	\
  4129										\
  4130		ret = kasan_kmalloc(s, ret, size, flags);			\
  4131										\
  4132		return ret;							\
  4133	}									\
  4134	EXPORT_SYMBOL(oot___kmalloc_node_ ## index)
  4135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
