Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FFC24B50
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706361358; cv=none; b=eyUAaugHllJAdCwNS+y4Qz4aFm9HIEiLF7lDV3pByKZq0I0pE/BeoXiRU5x9+retfeI4fe+zR7zl+4ublh+JC8dgppvUWBeMGpchPeBW0r8BmmVC5i24fsyd3cb5/WhB1eJiRoCuzOX4Eh8v/87SRduT9Qijie0PmfyeDnlgXPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706361358; c=relaxed/simple;
	bh=Rs6vnqf120KZO5EpsWcj394aglt+l7Yn6SWlyzxCY5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tnyk5exnreaXBCOajpdeFpjwcET0RoibEi5EWHmFkudupkq3IfM3dFYTgue+Kj+RaGH3ZInS6MqxlwYoodNzTKSLlkU1XDXxRLm3QLatSDQmU5F575zRZ+aKKIl6zHfW2ZANfpE6fAWu7s1SnaGBlEY2T7vvR/cecABWjHBTTSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtzxWySd; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtzxWySd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706361356; x=1737897356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rs6vnqf120KZO5EpsWcj394aglt+l7Yn6SWlyzxCY5I=;
  b=EtzxWySd6+42ZxTvDoFLrnm7f/ycSMuYVzIqdEWI5Mi7v5WACUHl5nUx
   PWWlBQZfZBc81HviWdEAGI/lJiLefHgcWDjvOeD734cgze6Yo268kDVDg
   MetzRZ3zDyYjzjXpS3MfHJ7vsBVS0+mqAOC7Su1adZ/nsf3BC8y4wqbOg
   FN+ENX+WNnEeJikg5rooau6Vtp1LQr+Hml7RCS1du9VB+cXD4NwiA33+f
   f/dvupHqHUC7veE5tZORTHovhQ75FFqT8kIdB9y28KwRsBbPwnHSlOxTt
   wbwRqe13sXQIMRACHOxRS4GtnXXyLwjMpQSkiXZX/NT5JPq0WyCgPGji7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="399838490"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="399838490"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 05:15:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="821425783"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="821425783"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Jan 2024 05:15:54 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTiXH-0002LD-35;
	Sat, 27 Jan 2024 13:15:51 +0000
Date: Sat, 27 Jan 2024 21:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:uptr_v3 4/8] kernel/bpf/arena.c:41:20: warning: large
 integer implicitly truncated to unsigned type
Message-ID: <202401272123.IEoTCUjU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git uptr_v3
head:   f3fb4035708d321fdf10508720d84fa6b917550c
commit: b0aa3d7371f1d22037e035410d6eafb29ec12dc4 [4/8] bpf: Introduce bpf arena.
config: i386-randconfig-002-20240127 (https://download.01.org/0day-ci/archive/20240127/202401272123.IEoTCUjU-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401272123.IEoTCUjU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401272123.IEoTCUjU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/arena.c: In function 'arena_map_alloc':
>> kernel/bpf/arena.c:41:20: warning: large integer implicitly truncated to unsigned type [-Woverflow]
    #define KERN_VM_SZ (1ull << 32) + GUARD_SZ
                       ^
   kernel/bpf/arena.c:98:24: note: in expansion of macro 'KERN_VM_SZ'
     kern_vm = get_vm_area(KERN_VM_SZ, VM_ALLOC);
                           ^~~~~~~~~~
   kernel/bpf/arena.c: In function 'arena_map_free':
>> kernel/bpf/arena.c:41:20: warning: large integer implicitly truncated to unsigned type [-Woverflow]
    #define KERN_VM_SZ (1ull << 32) + GUARD_SZ
                       ^
   kernel/bpf/arena.c:149:8: note: in expansion of macro 'KERN_VM_SZ'
           KERN_VM_SZ - GUARD_SZ / 2, for_each_pte, NULL);
           ^~~~~~~~~~
   kernel/bpf/arena.c: In function 'arena_free_page':
   kernel/bpf/arena.c:356:8: warning: variable 'entry' set but not used [-Wunused-but-set-variable]
     void *entry;
           ^~~~~


vim +41 kernel/bpf/arena.c

     9	
    10	/*
    11	 * bpf_arena is a sparsely populated shared memory region between bpf program and
    12	 * user space process.
    13	 *
    14	 * For example on x86-64 the values could be:
    15	 * user_vm_start 7f7d26200000     // picked by mmap()
    16	 * kern_vm_start ffffc90001e69000 // picked by get_vm_area()
    17	 * For user space all pointers within the arena are normal 8-byte addresses.
    18	 * In this example 7f7d26200000 is the address of the first page (pgoff=0).
    19	 * The bpf program will access it as: kern_vm_start + lower_32bit_of_user_ptr
    20	 * (u32)7f7d26200000 -> 26200000
    21	 * hence
    22	 * ffffc90001e69000 + 26200000 == ffffc90028069000 is "pgoff=0" within 4Gb
    23	 * kernel memory region.
    24	 *
    25	 * BPF JITs generate the following code to access arena:
    26	 *   mov eax, eax  // eax has lower 32-bit of user pointer
    27	 *   mov word ptr [rax + r12 + off], bx
    28	 * where r12 == kern_vm_start and off is s16.
    29	 * Hence allocate 4Gb + GUARD_SZ/2 on each side.
    30	 *
    31	 * Initially kernel vm_area and user vma are not populated.
    32	 * User space can fault-in any address which will insert the page
    33	 * into kernel and user vma.
    34	 * bpf program can allocate a page via bpf_uptr_alloc_pages() kfunc
    35	 * which will insert it into kernel vm_area.
    36	 * The later fault-in from user space will populate that page into user vma.
    37	 */
    38	
    39	/* number of bytes addressable by LDX/STX insn with 16-bit 'off' field */
    40	#define GUARD_SZ (1ull << sizeof(((struct bpf_insn *)0)->off) * 8)
  > 41	#define KERN_VM_SZ (1ull << 32) + GUARD_SZ
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
