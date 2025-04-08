Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD5C26561C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 11:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744111124; cv=none; b=M3AbYaLEL3qWU9FE0/oEfYMKKOF7d4JmmLNUV0hWU6l40W6y7JOWZpqOsbMJB5a3TGDYW3W9v6hgJAu/DSZlgWkf1pDnWHWvUF/zyyBJOLBPY+L1ZyF5L8wTzkAakM+mnABdHY+W4S7xogNUrnxd6XbJWkE4nwHwSV42kQ0zZFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744111124; c=relaxed/simple;
	bh=aCxlPP44X6tOkYqoIWzqgoyLhBID/ISoQ9EcmL10Tqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DCqjYy94WQl7dYGmR4fzgdGxlDR3yrVjnnMZPKmexQ2iWRSc4w6LqqBsrzvQW04hG86wNiLvkTcuq1CfSMoKydC6UByn4oThW4uD+iEGGv3GNMfnRPkmaamzmoWQIonCVZIwmxBPpU8fiEIJVP0AJLEA/loZLIn5xTrKpThw9BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EaFdURFw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaFdURFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744111122; x=1775647122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aCxlPP44X6tOkYqoIWzqgoyLhBID/ISoQ9EcmL10Tqw=;
  b=EaFdURFwcT058j/edOTw2qh5GwfNdmWJh2N3fQHp1UMF7LQZfAT8NTcw
   c2EGhc/CHTcfx0r/Ja/nv7ElV5Xcly0dmg8GQ7vqHaQa6fj9LaC+rOkr+
   TewdhpjG1Kaj0Pr6k8zdfj+ViP0Nwd6EZColoBkxHQxBMraiCxDdIBiuS
   WItW4+0+boCZJDh6ZAdICy25BgbhDniVfv1go2WUZcAIR2vU0vStqPDtx
   3HRty0+87/s2H3JHUeY1x49VGEtghYYyL4wMjNLn1Ui4bwzx/err67+Tb
   7QDiRpzBiY5XvDWWWifhVYF6VfnvUpJ1Iav/5RmfXU4wZZsN3VQYyjqLr
   g==;
X-CSE-ConnectionGUID: 0FwP6cDPQoyKUMAvpVFSiQ==
X-CSE-MsgGUID: lnI3IdCrTv+HkjnIhDWLdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44678218"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="44678218"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:18:41 -0700
X-CSE-ConnectionGUID: u99VWdnbS/+NgPDIzEsSuw==
X-CSE-MsgGUID: DnIYha/RR/K5RhvqS6MFtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="159235938"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Apr 2025 04:18:41 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u26yT-0004op-2t;
	Tue, 08 Apr 2025 11:18:37 +0000
Date: Tue, 8 Apr 2025 19:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/slub.c:4017:7: warning: no
 previous prototype for 'oot___kmalloc_0'
Message-ID: <202504081937.9tD4Qkoq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   c55bd07f747cd457f58e5781279fa11a5fc0add1
commit: baa47e1aa754428b439764393f2d71fb6bce04bf [9/9] anolis: mm: introduce per module slab for oot memory isolation
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250408/202504081937.9tD4Qkoq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081937.9tD4Qkoq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081937.9tD4Qkoq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_0' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4040:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4040 | DEFINE_OOT_FUNC___kmalloc(0);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_1' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4041:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4041 | DEFINE_OOT_FUNC___kmalloc(1);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_2' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4042:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4042 | DEFINE_OOT_FUNC___kmalloc(2);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_3' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4043:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4043 | DEFINE_OOT_FUNC___kmalloc(3);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_4' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4044:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4044 | DEFINE_OOT_FUNC___kmalloc(4);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_5' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4045:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4045 | DEFINE_OOT_FUNC___kmalloc(5);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_6' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4046:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4046 | DEFINE_OOT_FUNC___kmalloc(6);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_7' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4047:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4047 | DEFINE_OOT_FUNC___kmalloc(7);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_8' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4048:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4048 | DEFINE_OOT_FUNC___kmalloc(8);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_9' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4049:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4049 | DEFINE_OOT_FUNC___kmalloc(9);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_10' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4050:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4050 | DEFINE_OOT_FUNC___kmalloc(10);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_11' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4051:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4051 | DEFINE_OOT_FUNC___kmalloc(11);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_12' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4052:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4052 | DEFINE_OOT_FUNC___kmalloc(12);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_13' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4053:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4053 | DEFINE_OOT_FUNC___kmalloc(13);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_14' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4054:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4054 | DEFINE_OOT_FUNC___kmalloc(14);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slub.c:4017:7: warning: no previous prototype for 'oot___kmalloc_15' [-Wmissing-prototypes]
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slub.c:4055:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    4055 | DEFINE_OOT_FUNC___kmalloc(15);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/oot___kmalloc_0 +4017 mm/slub.c

  4015	
  4016	#define DEFINE_OOT_FUNC___kmalloc(index)				\
> 4017	void *oot___kmalloc_ ## index(size_t size, gfp_t flags)			\
  4018	{									\
  4019		struct kmem_cache *s;						\
  4020		void *ret;							\
  4021										\
  4022		if (unlikely(size > KMALLOC_MAX_CACHE_SIZE))			\
  4023			return kmalloc_large(size, flags);			\
  4024										\
  4025		s = oot_kmalloc_slab(index, size, flags);			\
  4026										\
  4027		if (unlikely(ZERO_OR_NULL_PTR(s)))				\
  4028			return s;						\
  4029										\
  4030		ret = slab_alloc(s, flags, _RET_IP_, size);			\
  4031										\
  4032		trace_kmalloc(_RET_IP_, ret, size, s->size, flags);		\
  4033										\
  4034		ret = kasan_kmalloc(s, ret, size, flags);			\
  4035										\
  4036		return ret;							\
  4037	}									\
  4038	EXPORT_SYMBOL(oot___kmalloc_ ## index)
  4039	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
