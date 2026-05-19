Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DDE369965
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 20:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779221412; cv=none; b=pc31zgyRAVTJDQ1+8zRIdKvYEGq7+WpBf/yBbk6gh+V0Yofcuww5gNy2tSgGDXr+NxLTnaLXyg4Rk3jB2xasj1iv7jV4E+otAzsqOfhAfcEMrcB1tUCSqeFdQ4tKLNMwEPFUxVwapCRLnYmo3akGxISZ1nmBTOtRs7tUbg3N00A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779221412; c=relaxed/simple;
	bh=GeMiB+c/NtnF+3FMWUSMM1idas6/YxPw3EFFnLKaEpA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qpG4m9+YUzdPR3lKvf5ETzETZQ7hvaXO7Lmbm8KzbxnQYMEl/DH7nnp8abln9efqzKYiCp96irV8q7dZGIS7Oln6KTGGjKSdeJKJoGopJMyM03NbNhSoNcl7OxAlcImKb8hs/+5aeKcamXB0mlwNg2LWQS4oq6dU2+xgpygN2BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pjwa08Vo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pjwa08Vo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779221410; x=1810757410;
  h=date:from:to:cc:subject:message-id;
  bh=GeMiB+c/NtnF+3FMWUSMM1idas6/YxPw3EFFnLKaEpA=;
  b=Pjwa08VoKS1oR0II7p785Jhn6uSK2fLj587WFNiL8TDguMh490U4diDN
   qmI1ZMnETQ5rLM2/eNBPjmZwHr/6pA4aey+3w1EiQgVo6To90f84JN9/G
   51VKIDbLF3W15JnkCp2bdnG/pOko1h66+Z9q1M99PEZidZVizF/YjMb4i
   BkzV77+WXcGZmmHI2FAmhk9rCo7gbHUWg92brZ0R6J90mO2vc4Zc9iQDc
   VJLii8RTltnXabBNebklnW+p7p7+9bwAdgd33I+my2H0udhFL4RKrAy0+
   cwKbxIX3wakh0K6QY63QnxX82kAdvqBweI3hZyRSzEBLw4yVXoGLT59jO
   g==;
X-CSE-ConnectionGUID: kmJhAF4YRa2LLq2AyNp6LQ==
X-CSE-MsgGUID: pTgbQzh2S82keECkq8R9Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91217894"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91217894"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 13:10:09 -0700
X-CSE-ConnectionGUID: 4pfu21fVQ9iGn4ols6ANGA==
X-CSE-MsgGUID: IM89K3lFQmCvucib8LLslQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="277999267"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2026 13:10:08 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPQk0-000000001ph-2Cty;
	Tue, 19 May 2026 20:09:05 +0000
Date: Wed, 20 May 2026 04:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.exit_mm 3/4] mm/init-mm.c:46:27:
 warning: initialization of 'char' from 'struct user_namespace *' makes
 integer from pointer without a cast
Message-ID: <202605200453.pGp57Ecf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git work.exit_mm
head:   822aa51be2cae2813d42b998a12558fa76afbc4f
commit: a8f2b6f303fb0cdc7fef1b4e8966828a1dc7e10a [3/4] sched: move mm->user_ns to task->exec_state
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260520/202605200453.pGp57Ecf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200453.pGp57Ecf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200453.pGp57Ecf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/init-mm.c:46:10: error: 'struct mm_struct' has no member named 'user_ns'
      46 |         .user_ns        = &init_user_ns,
         |          ^~~~~~~
>> mm/init-mm.c:46:27: warning: initialization of 'char' from 'struct user_namespace *' makes integer from pointer without a cast [-Wint-conversion]
      46 |         .user_ns        = &init_user_ns,
         |                           ^
   mm/init-mm.c:46:27: note: (near initialization for 'init_mm.flexible_array[0]')
   mm/init-mm.c:46:27: error: initializer element is not computable at load time
   mm/init-mm.c:46:27: note: (near initialization for 'init_mm.flexible_array[0]')
   mm/init-mm.c:32:28: warning: missing braces around initializer [-Wmissing-braces]
      32 | struct mm_struct init_mm = {
         |                            ^
   mm/init-mm.c:32:28: warning: missing braces around initializer [-Wmissing-braces]


vim +46 mm/init-mm.c

9a9d0b8299011255 Mateusz Guzik      2023-08-07  21  
c1a2f7f0c0645438 Rik van Riel       2018-07-16  22  /*
c1a2f7f0c0645438 Rik van Riel       2018-07-16  23   * For dynamically allocated mm_structs, there is a dynamically sized cpumask
c1a2f7f0c0645438 Rik van Riel       2018-07-16  24   * at the end of the structure, the size of which depends on the maximum CPU
c1a2f7f0c0645438 Rik van Riel       2018-07-16  25   * number the system can see. That way we allocate only as much memory for
c1a2f7f0c0645438 Rik van Riel       2018-07-16  26   * mm_cpumask() as needed for the hundreds, or thousands of processes that
c1a2f7f0c0645438 Rik van Riel       2018-07-16  27   * a system typically runs.
c1a2f7f0c0645438 Rik van Riel       2018-07-16  28   *
c1a2f7f0c0645438 Rik van Riel       2018-07-16  29   * Since there is only one init_mm in the entire system, keep it simple
c1a2f7f0c0645438 Rik van Riel       2018-07-16  30   * and size this cpu_bitmask to NR_CPUS.
c1a2f7f0c0645438 Rik van Riel       2018-07-16  31   */
bb1f17b0372de937 Alexey Dobriyan    2009-06-16  32  struct mm_struct init_mm = {
d4af56c5c7c6781c Liam R. Howlett    2022-09-06  33  	.mm_mt		= MTREE_INIT_EXT(mm_mt, MM_MT_FLAGS, init_mm.mmap_lock),
bb1f17b0372de937 Alexey Dobriyan    2009-06-16  34  	.pgd		= swapper_pg_dir,
bb1f17b0372de937 Alexey Dobriyan    2009-06-16  35  	.mm_users	= ATOMIC_INIT(2),
bb1f17b0372de937 Alexey Dobriyan    2009-06-16  36  	.mm_count	= ATOMIC_INIT(1),
57efa1fe5957694f Jason Gunthorpe    2020-12-14  37  	.write_protect_seq = SEQCNT_ZERO(init_mm.write_protect_seq),
14c3656b7284a864 Michel Lespinasse  2020-06-08  38  	MMAP_LOCK_INITIALIZER(init_mm)
bb1f17b0372de937 Alexey Dobriyan    2009-06-16  39  	.page_table_lock =  __SPIN_LOCK_UNLOCKED(init_mm.page_table_lock),
88aa7cc688d48ddd Yang Shi           2018-06-07  40  	.arg_lock	=  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
bb1f17b0372de937 Alexey Dobriyan    2009-06-16  41  	.mmlist		= LIST_HEAD_INIT(init_mm.mmlist),
5e31275cc997f8ec Suren Baghdasaryan 2023-02-27  42  #ifdef CONFIG_PER_VMA_LOCK
f35ab95ca0af7a27 Suren Baghdasaryan 2025-02-13  43  	.vma_writer_wait = __RCUWAIT_INITIALIZER(init_mm.vma_writer_wait),
eb449bd96954b1c1 Suren Baghdasaryan 2024-11-22  44  	.mm_lock_seq	= SEQCNT_ZERO(init_mm.mm_lock_seq),
5e31275cc997f8ec Suren Baghdasaryan 2023-02-27  45  #endif
bfedb589252c01fa Eric W. Biederman  2016-10-13 @46  	.user_ns	= &init_user_ns,
12a6ddfc76bb8a6d Mathieu Desnoyers  2025-12-24  47  #ifdef CONFIG_SCHED_MM_CID
12a6ddfc76bb8a6d Mathieu Desnoyers  2025-12-24  48  	.mm_cid.lock = __RAW_SPIN_LOCK_UNLOCKED(init_mm.mm_cid.lock),
12a6ddfc76bb8a6d Mathieu Desnoyers  2025-12-24  49  #endif
6ac433f8b2590b09 Mathieu Desnoyers  2025-12-24  50  	.flexible_array	= MM_STRUCT_FLEXIBLE_ARRAY_INIT,
a1b200e27c0426ea Heiko Carstens     2010-08-09  51  	INIT_MM_CONTEXT(init_mm)
bb1f17b0372de937 Alexey Dobriyan    2009-06-16  52  };
5748fbc533a32459 Kefeng Wang        2021-07-07  53  

:::::: The code at line 46 was first introduced by commit
:::::: bfedb589252c01fa505ac9f6f2a3d5d68d707ef4 mm: Add a user_ns owner to mm_struct and fix ptrace permission checks

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
