Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D3F3B775A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 20:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779220888; cv=none; b=Z/AYzm89pHZqDT8GKc4x7WY2rHZU4MFDqGcCo+wBNOVu5b98lM/n+bdWy6rvTvFIaZpLy4gAIK95pLI4WmpFnfcRiK45LXE4e96A6a4ZaBDyFs7ZJiDiWo5wn48nFfALDkx8SWYL2Abdi5PgWZ2fK/aeX1g9TKw0sa651GZk+Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779220888; c=relaxed/simple;
	bh=3s/QL5ml24R03m8V7F2fhSuCYy74TwJfOsEugzeokK4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QaPH7TYFqDpbCoE4xtC9UMf1Qt3tJiqM3SQQwQbMfr8Ey7bRW5iz6jEyRdlm/RocdOvj4BY7Er8xuJzjSLUTXg28aN4H3fsO+DQhnevx+Owu5RUARY24wmyjwM93OiA/aUYfw7AW8Ikv/816Kv39qg1puwUFjLRvId61fnMwBjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVb6UIZw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVb6UIZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779220887; x=1810756887;
  h=date:from:to:cc:subject:message-id;
  bh=3s/QL5ml24R03m8V7F2fhSuCYy74TwJfOsEugzeokK4=;
  b=fVb6UIZwScbcAg4yzrAT4t4gCM1Y2pMKZpdIh+WZEi3QBr2HhHe6hZtP
   h0vqxxE3kehxwSI3Tv3v5/UwZ/d00qgH2jyPfDTn08UP2JaKinLh5kYH8
   v+2BjgPDn8wZVV5DqIxGAUjNnAsH6CVxQ5zKJoz8tQ5kYvvddLZyE9iia
   3DNUSrwM98Kkvn9+bj1KppdGq5uK9DC4CbfoRDoQjxf6hA6+edrTxd2lK
   bHN8b4Mcr4ZXXt0WFv23+qTAn+Sd+l+MQa+9Jj9vr5qr13dzQto6NgF0O
   NEDfuW7RK6xkT3lrLQR/3RGxD36dSWmmwtN899hefZ09K1RpxoZIJhPuT
   g==;
X-CSE-ConnectionGUID: UX69fDJeRA2W6lqkPKt7YQ==
X-CSE-MsgGUID: 3o6Jj+KZTNSVa9/8XJkMnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80145437"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80145437"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 13:01:24 -0700
X-CSE-ConnectionGUID: 4r5zlWczR2GN1wrj0s6A9Q==
X-CSE-MsgGUID: X7YWXUOJT5OjxOEgpTfl1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="243889875"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 19 May 2026 13:01:22 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPQcx-00000000AI9-2pAL;
	Tue, 19 May 2026 20:01:19 +0000
Date: Tue, 19 May 2026 22:01:02 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.exit_mm 3/4] mm/init-mm.c:46:10: error:
 'struct mm_struct' has no member named 'user_ns'
Message-ID: <202605192115.tW5WHOPZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git work.exit_mm
head:   822aa51be2cae2813d42b998a12558fa76afbc4f
commit: a8f2b6f303fb0cdc7fef1b4e8966828a1dc7e10a [3/4] sched: move mm->user_ns to task->exec_state
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260519/202605192115.tW5WHOPZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605192115.tW5WHOPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605192115.tW5WHOPZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/init-mm.c:46:10: error: 'struct mm_struct' has no member named 'user_ns'
      46 |         .user_ns        = &init_user_ns,
         |          ^~~~~~~
>> mm/init-mm.c:46:27: error: initialization of 'char' from 'struct user_namespace *' makes integer from pointer without a cast [-Wint-conversion]
      46 |         .user_ns        = &init_user_ns,
         |                           ^
   mm/init-mm.c:46:27: note: (near initialization for 'init_mm.flexible_array[0]')
>> mm/init-mm.c:46:27: error: initializer element is not computable at load time
   mm/init-mm.c:46:27: note: (near initialization for 'init_mm.flexible_array[0]')
--
>> drivers/firmware/efi/efi.c:76:10: error: 'struct mm_struct' has no member named 'user_ns'
      76 |         .user_ns                = &init_user_ns,
         |          ^~~~~~~
>> drivers/firmware/efi/efi.c:76:35: error: initialization of 'char' from 'struct user_namespace *' makes integer from pointer without a cast [-Wint-conversion]
      76 |         .user_ns                = &init_user_ns,
         |                                   ^
   drivers/firmware/efi/efi.c:76:35: note: (near initialization for 'efi_mm.flexible_array[0]')
>> drivers/firmware/efi/efi.c:76:35: error: initializer element is not computable at load time
   drivers/firmware/efi/efi.c:76:35: note: (near initialization for 'efi_mm.flexible_array[0]')


vim +46 mm/init-mm.c

9a9d0b82990112 Mateusz Guzik      2023-08-07  21  
c1a2f7f0c06454 Rik van Riel       2018-07-16  22  /*
c1a2f7f0c06454 Rik van Riel       2018-07-16  23   * For dynamically allocated mm_structs, there is a dynamically sized cpumask
c1a2f7f0c06454 Rik van Riel       2018-07-16  24   * at the end of the structure, the size of which depends on the maximum CPU
c1a2f7f0c06454 Rik van Riel       2018-07-16  25   * number the system can see. That way we allocate only as much memory for
c1a2f7f0c06454 Rik van Riel       2018-07-16  26   * mm_cpumask() as needed for the hundreds, or thousands of processes that
c1a2f7f0c06454 Rik van Riel       2018-07-16  27   * a system typically runs.
c1a2f7f0c06454 Rik van Riel       2018-07-16  28   *
c1a2f7f0c06454 Rik van Riel       2018-07-16  29   * Since there is only one init_mm in the entire system, keep it simple
c1a2f7f0c06454 Rik van Riel       2018-07-16  30   * and size this cpu_bitmask to NR_CPUS.
c1a2f7f0c06454 Rik van Riel       2018-07-16  31   */
bb1f17b0372de9 Alexey Dobriyan    2009-06-16  32  struct mm_struct init_mm = {
d4af56c5c7c678 Liam R. Howlett    2022-09-06  33  	.mm_mt		= MTREE_INIT_EXT(mm_mt, MM_MT_FLAGS, init_mm.mmap_lock),
bb1f17b0372de9 Alexey Dobriyan    2009-06-16  34  	.pgd		= swapper_pg_dir,
bb1f17b0372de9 Alexey Dobriyan    2009-06-16  35  	.mm_users	= ATOMIC_INIT(2),
bb1f17b0372de9 Alexey Dobriyan    2009-06-16  36  	.mm_count	= ATOMIC_INIT(1),
57efa1fe595769 Jason Gunthorpe    2020-12-14  37  	.write_protect_seq = SEQCNT_ZERO(init_mm.write_protect_seq),
14c3656b7284a8 Michel Lespinasse  2020-06-08  38  	MMAP_LOCK_INITIALIZER(init_mm)
bb1f17b0372de9 Alexey Dobriyan    2009-06-16  39  	.page_table_lock =  __SPIN_LOCK_UNLOCKED(init_mm.page_table_lock),
88aa7cc688d48d Yang Shi           2018-06-07  40  	.arg_lock	=  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
bb1f17b0372de9 Alexey Dobriyan    2009-06-16  41  	.mmlist		= LIST_HEAD_INIT(init_mm.mmlist),
5e31275cc997f8 Suren Baghdasaryan 2023-02-27  42  #ifdef CONFIG_PER_VMA_LOCK
f35ab95ca0af7a Suren Baghdasaryan 2025-02-13  43  	.vma_writer_wait = __RCUWAIT_INITIALIZER(init_mm.vma_writer_wait),
eb449bd96954b1 Suren Baghdasaryan 2024-11-22  44  	.mm_lock_seq	= SEQCNT_ZERO(init_mm.mm_lock_seq),
5e31275cc997f8 Suren Baghdasaryan 2023-02-27  45  #endif
bfedb589252c01 Eric W. Biederman  2016-10-13 @46  	.user_ns	= &init_user_ns,
12a6ddfc76bb8a Mathieu Desnoyers  2025-12-24  47  #ifdef CONFIG_SCHED_MM_CID
12a6ddfc76bb8a Mathieu Desnoyers  2025-12-24  48  	.mm_cid.lock = __RAW_SPIN_LOCK_UNLOCKED(init_mm.mm_cid.lock),
12a6ddfc76bb8a Mathieu Desnoyers  2025-12-24  49  #endif
6ac433f8b2590b Mathieu Desnoyers  2025-12-24  50  	.flexible_array	= MM_STRUCT_FLEXIBLE_ARRAY_INIT,
a1b200e27c0426 Heiko Carstens     2010-08-09  51  	INIT_MM_CONTEXT(init_mm)
bb1f17b0372de9 Alexey Dobriyan    2009-06-16  52  };
5748fbc533a324 Kefeng Wang        2021-07-07  53  

:::::: The code at line 46 was first introduced by commit
:::::: bfedb589252c01fa505ac9f6f2a3d5d68d707ef4 mm: Add a user_ns owner to mm_struct and fix ptrace permission checks

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
