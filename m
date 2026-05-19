Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD4D3B27DE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218803; cv=none; b=A14YSau1AhPz+QitkZWTs3E3j522bnjfFekYRYsY9GnFgSTvYo6GAtDeM4GsD/KN8IXLpjMKF4pRLmINxTW+3QAKdFyzQ2S4n2raDfhYkQ7EwYwB4WIwhIk7ElYGyXdQuY2RMlAMiECL8z+ftjje9aT7gGHpfTEShwaB8veu+Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218803; c=relaxed/simple;
	bh=0IZA9sX5o/j9Jjifg1kLS0cbqvyn2lig9vzXROiCSEI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=STWwG85DguSoZbyprs9xt4xwqWpowh1bp/GtexdoJD50r9WfmJjcuroIkosWK7iJTeIcrDm1L4ICvBbgUxFm1wfkLUol8BIFrxYRa1CEDTs+0MiIjik2XK6krcVWTSnm0P6A5TMaFY+EwxLNGVs/BJfelNs4ntDOeY0mRPK1X6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTvtDWDl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTvtDWDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779218801; x=1810754801;
  h=date:from:to:cc:subject:message-id;
  bh=0IZA9sX5o/j9Jjifg1kLS0cbqvyn2lig9vzXROiCSEI=;
  b=XTvtDWDlTtCSHX5Brhmfgfm9+5cYgw8mlympVS7VVBlFly7R/h0kOBeT
   JkHzw3CnG+JNtwvhwo3NWoKM+MJ7dvuzacab1wmKoyxlJ4sMt5lICPtiw
   /9F8vgV1wlmv6yQuln5DsXBi9Y9ObyUXJjzSL32XiQpq4WmwrGVCjq00n
   36q20oP4V200xk31kCXJUrXAUEyqVGL90xkkuz/yhFqV9h3jbBsY0tfGo
   nUyCpPgwRprCjiHspDCOosA8Wh4LNQ9kQmRPvqn+oDM3QTGAFAVuSmH+8
   BPjjmb1DdC47LLEuM9L27+A7pQVRX2IV/CD2FB4FztP9KlPCM/QzZq2g4
   g==;
X-CSE-ConnectionGUID: +iA15gxlSrOtCmlrErig6g==
X-CSE-MsgGUID: LiQN9DK1QdOUvzSWYze7jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79134037"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79134037"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 12:26:41 -0700
X-CSE-ConnectionGUID: /xeTygRUQwO90dFkQXBLVQ==
X-CSE-MsgGUID: XwhCpGjuRnu0axaAO4iq7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235446408"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 May 2026 12:26:39 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPQ4i-000000001lP-2qkH;
	Tue, 19 May 2026 19:26:10 +0000
Date: Wed, 20 May 2026 03:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.exit_mm 3/4] mm/init-mm.c:46:10: error:
 'struct mm_struct' has no member named 'user_ns'
Message-ID: <202605200356.P2Rfqo9D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git work.exit_mm
head:   822aa51be2cae2813d42b998a12558fa76afbc4f
commit: a8f2b6f303fb0cdc7fef1b4e8966828a1dc7e10a [3/4] sched: move mm->user_ns to task->exec_state
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260520/202605200356.P2Rfqo9D-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200356.P2Rfqo9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200356.P2Rfqo9D-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/init-mm.c:46:10: error: 'struct mm_struct' has no member named 'user_ns'
      46 |         .user_ns        = &init_user_ns,
         |          ^~~~~~~
>> mm/init-mm.c:46:27: error: initialization of 'char' from 'struct user_namespace *' makes integer from pointer without a cast [-Wint-conversion]
      46 |         .user_ns        = &init_user_ns,
         |                           ^
   mm/init-mm.c:46:27: note: (near initialization for 'init_mm.flexible_array[0]')
>> mm/init-mm.c:46:27: error: initializer element is not computable at load time
   mm/init-mm.c:46:27: note: (near initialization for 'init_mm.flexible_array[0]')
>> mm/init-mm.c:32:28: warning: missing braces around initializer [-Wmissing-braces]
      32 | struct mm_struct init_mm = {
         |                            ^
>> mm/init-mm.c:32:28: warning: missing braces around initializer [-Wmissing-braces]


vim +46 mm/init-mm.c

9a9d0b829901125 Mateusz Guzik      2023-08-07  21  
c1a2f7f0c064543 Rik van Riel       2018-07-16  22  /*
c1a2f7f0c064543 Rik van Riel       2018-07-16  23   * For dynamically allocated mm_structs, there is a dynamically sized cpumask
c1a2f7f0c064543 Rik van Riel       2018-07-16  24   * at the end of the structure, the size of which depends on the maximum CPU
c1a2f7f0c064543 Rik van Riel       2018-07-16  25   * number the system can see. That way we allocate only as much memory for
c1a2f7f0c064543 Rik van Riel       2018-07-16  26   * mm_cpumask() as needed for the hundreds, or thousands of processes that
c1a2f7f0c064543 Rik van Riel       2018-07-16  27   * a system typically runs.
c1a2f7f0c064543 Rik van Riel       2018-07-16  28   *
c1a2f7f0c064543 Rik van Riel       2018-07-16  29   * Since there is only one init_mm in the entire system, keep it simple
c1a2f7f0c064543 Rik van Riel       2018-07-16  30   * and size this cpu_bitmask to NR_CPUS.
c1a2f7f0c064543 Rik van Riel       2018-07-16  31   */
bb1f17b0372de93 Alexey Dobriyan    2009-06-16 @32  struct mm_struct init_mm = {
d4af56c5c7c6781 Liam R. Howlett    2022-09-06  33  	.mm_mt		= MTREE_INIT_EXT(mm_mt, MM_MT_FLAGS, init_mm.mmap_lock),
bb1f17b0372de93 Alexey Dobriyan    2009-06-16  34  	.pgd		= swapper_pg_dir,
bb1f17b0372de93 Alexey Dobriyan    2009-06-16  35  	.mm_users	= ATOMIC_INIT(2),
bb1f17b0372de93 Alexey Dobriyan    2009-06-16  36  	.mm_count	= ATOMIC_INIT(1),
57efa1fe5957694 Jason Gunthorpe    2020-12-14  37  	.write_protect_seq = SEQCNT_ZERO(init_mm.write_protect_seq),
14c3656b7284a86 Michel Lespinasse  2020-06-08  38  	MMAP_LOCK_INITIALIZER(init_mm)
bb1f17b0372de93 Alexey Dobriyan    2009-06-16  39  	.page_table_lock =  __SPIN_LOCK_UNLOCKED(init_mm.page_table_lock),
88aa7cc688d48dd Yang Shi           2018-06-07  40  	.arg_lock	=  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
bb1f17b0372de93 Alexey Dobriyan    2009-06-16  41  	.mmlist		= LIST_HEAD_INIT(init_mm.mmlist),
5e31275cc997f8e Suren Baghdasaryan 2023-02-27  42  #ifdef CONFIG_PER_VMA_LOCK
f35ab95ca0af7a2 Suren Baghdasaryan 2025-02-13  43  	.vma_writer_wait = __RCUWAIT_INITIALIZER(init_mm.vma_writer_wait),
eb449bd96954b1c Suren Baghdasaryan 2024-11-22  44  	.mm_lock_seq	= SEQCNT_ZERO(init_mm.mm_lock_seq),
5e31275cc997f8e Suren Baghdasaryan 2023-02-27  45  #endif
bfedb589252c01f Eric W. Biederman  2016-10-13 @46  	.user_ns	= &init_user_ns,
12a6ddfc76bb8a6 Mathieu Desnoyers  2025-12-24  47  #ifdef CONFIG_SCHED_MM_CID
12a6ddfc76bb8a6 Mathieu Desnoyers  2025-12-24  48  	.mm_cid.lock = __RAW_SPIN_LOCK_UNLOCKED(init_mm.mm_cid.lock),
12a6ddfc76bb8a6 Mathieu Desnoyers  2025-12-24  49  #endif
6ac433f8b2590b0 Mathieu Desnoyers  2025-12-24  50  	.flexible_array	= MM_STRUCT_FLEXIBLE_ARRAY_INIT,
a1b200e27c0426e Heiko Carstens     2010-08-09  51  	INIT_MM_CONTEXT(init_mm)
bb1f17b0372de93 Alexey Dobriyan    2009-06-16  52  };
5748fbc533a3245 Kefeng Wang        2021-07-07  53  

:::::: The code at line 46 was first introduced by commit
:::::: bfedb589252c01fa505ac9f6f2a3d5d68d707ef4 mm: Add a user_ns owner to mm_struct and fix ptrace permission checks

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
