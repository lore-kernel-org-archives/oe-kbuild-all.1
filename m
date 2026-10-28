Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793231203;
	b=z6XC8WeiC4YIqQKiFrofxOsF4+NaJo4HYRmeyu/h9OnYCLGO5skd5+VwIxGkdWcYms89
	 K942H1c8FlVc7EyUhlXZ3yeuUd702TEejEvwN82nIgNOA5hPNG8gNtqsg/cJdYT9iBxLI
	 rML2cf3SoW0XJJzeeLoYx9498ofjFudyQpP+ZrGFyJ+ZrRiP6uns0QEa91MURciUfsc12
	 px5LBzz3bDI8CyN2QPuwmPn5S5/007hbFjSOTw7Tye3k9j11YNZoeAy1aM1+yfo7J/Jrn
	 1QPDPqm3J1u8T/ZEjcSTefE9zrzUieDpvtZw7Tu7bEwAh5ZzuXxnu/hBFxg85Ij9wew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231203;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Ep3O9TofcptMggpqhlKbBH4iUDS+3G773U/Hdvf+qec=;
	b=0z+QihNjPhZPvYYzGgjKTpR6Q1TZLF1+p06dGMo0C9YwvwJQ0yfyiFuTjlRyoXg1skyG
	 +F4OUqzDjLJodXDw447Lxp4dzB3UK2qssFj1iL1yWLhy6BcmItKn5dL0wwoWOmD7LFYRM
	 qks3YAxJPZMFEZ6bkBELS7CapV4tFfL48d7gyf/xV7BclyyZBTrdzSVpo7cqV2msafEZ6
	 Ax7AcFk09IidY2FeVVlZd4W1KRTHF+Z2OBVxI6ZMYICeuJ6saSfUE2nVJomFHxlxddZwx
	 2L4VL9RPJdqyTJ39jvPL5IZH9iyGqo6+eYl7AkYkbYp9bHwjtcOtTGgnqlGlIeBIdUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L24pIaIC;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576CF606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 23:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 576CF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L24pIaIC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793231203; x=1824767203;
  h=date:from:to:cc:subject:message-id;
  bh=2c/KuAPRDyBfR9dKl9ddqp17sFSq4n+R+IWJcOMJi74=;
  b=L24pIaICX7660030ZMKgg3LiiKNdfAkeK1GfYn81ZyvUxcLM9OwgXVIB
   1cZTrVrtIcc93p3MTG9kUColxdp+rJ51EYqw8SJWy7rne6gFmQ7QBrE4O
   74Tv1KivGraSu5kSuDVVtf4in7GZXnip1L5ihUOD24JqLobzL8CGZ+W2o
   DFu533uTY46RqtPkkhjujWCtdWKL4W4UHWSS4EW9qa5V2SGzGBj0uoDEC
   2iSdRLI+CqOyqHYVVvt9P+03/0+5xZXYYv/PlyUaITnqz0hm/NZDE5J8S
   NXKmwgUgkcYLUZtDZzpgsYPzBAH7Jo1J+0tefvc26Fjm40NGzWT7HtSrH
   Q==;
X-CSE-ConnectionGUID: flHvRwIkTiuglh3c8LMDrw==
X-CSE-MsgGUID: IAR4AsIYTKSalYRui67MTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1869075"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1869075"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 16:46:38 -0700
X-CSE-ConnectionGUID: zHPtiV6yTHyTnDKMKThgSg==
X-CSE-MsgGUID: w/zF6Y4gR8uBmRZ9ugI/IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4968742"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Oct 2026 16:46:36 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMDLm-00000000ZLQ-0Mm2;
	Wed, 28 Oct 2026 23:46:34 +0000
Date: Thu, 29 Oct 2026 07:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-lazy-pte 4/6] kernel/bpf/arena.c:319:17:
 error: implicit declaration of function 'set_pte'; did you mean 'set_ptes'?
Message-ID: <202610290611.oQawVDDO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux arena-lazy-pte
head:   ce19d941e895a85d7dc1e7d49e6b90b1262f7e79
commit: 71ddc46be0a854bf80bacf6c588aefd04049b95e [4/6] bpf: arena: Add the scratch PTE table and PMD-level fault recovery
config: sparc-randconfig-1000-20261028 (https://download.01.org/0day-ci/archive/20261029/202610290611.oQawVDDO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290611.oQawVDDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290611.oQawVDDO-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/arena.c: In function 'arena_alloc_scratch_pt':
>> kernel/bpf/arena.c:319:17: error: implicit declaration of function 'set_pte'; did you mean 'set_ptes'? [-Wimplicit-function-declaration]
     319 |                 set_pte(&arena->scratch_pt[i], pteval);
         |                 ^~~~~~~
         |                 set_ptes


vim +319 kernel/bpf/arena.c

   309	
   310	static int arena_alloc_scratch_pt(struct bpf_arena *arena)
   311	{
   312		pte_t pteval = mk_pte(arena->scratch_page, PAGE_KERNEL);
   313		unsigned long i;
   314	
   315		arena->scratch_pt = arena_alloc_pt(arena, true);
   316		if (!arena->scratch_pt)
   317			return -ENOMEM;
   318		for (i = 0; i < PTRS_PER_PTE; i++)
 > 319			set_pte(&arena->scratch_pt[i], pteval);
   320		/*
   321		 * The table is published much later, by the atomic PMD install in the
   322		 * fault handler, which orders these stores before the entry becomes
   323		 * visible. Make that explicit here, where the table is filled.
   324		 */
   325		smp_wmb();
   326		return 0;
   327	}
   328	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
