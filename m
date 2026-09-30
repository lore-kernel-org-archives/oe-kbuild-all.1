Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBC14EC65C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775046; cv=none; b=fJtOBTzjKWtSYbbqckLvlx5PgY8TBpC1Xcdn4ZE21j0h55/8HmEmW/7BCeHB0Pff+jtAN9uscSm+K+XRBfgphSwdoTPyYF3B1Nwn0wayLTwH0FIT83d0hBfJtdLxbOaMsIxucFkVH/tT4V5nsFYXBuwIld2tyiJkt1rLGrGZjgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775046; c=relaxed/simple;
	bh=DEmnzdUKnAVwcu/9CYXlQoLPkm98A/fmH+ht5MhCkRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aEYn1A4gt/KapyuLT7rS+xTugiE6ZCAXIoC19VlwFNOHPUYfk5aro82eWxWj/N7YZ9jKXHrkULbvX1q2+0al6e/x6apyWZok/cIVSGEa1aD0q0apb+Bhf3raMbYA9tcJkVeAALxYHHqq+DaE7zLhH9jkfPpOYZtArcGr+rl1EMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGUHIk8E; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGUHIk8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790775038; x=1822311038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DEmnzdUKnAVwcu/9CYXlQoLPkm98A/fmH+ht5MhCkRc=;
  b=WGUHIk8Ef4dbm0jg3RmXlTrNbr5ofAJDoRS/N8hSkIQASr6PEkh8j5Pp
   DoZWFMZOvkFhZz8ezssHh73amx1u0kLeIoL9wamsJ9ldefMpVkLlby4rL
   3QPA7uYhiYIgJKutBEvEBG9o084fkZU8A45OcYna7DyaJXietw11aNqJp
   XvoK6Wg3IucG8rNAnMcLnOhg315iK5bWwcuxPeLMWzd9Gof4aiMZgwRGn
   LhU5NIC2yLSjaM2p2nylKTg7QziuiRiAnUr+NApRUk/7qKLUpy0czJyJ0
   5aJMes0PiKWqUddB37bPnzo2K9GCya2YJzKtoGwGRAejTIDWy4Gfe6jSu
   w==;
X-CSE-ConnectionGUID: sDLfZ7N5SfShGMzHv95yrQ==
X-CSE-MsgGUID: 8fT4xDylT7uTJi731FqKYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90466090"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90466090"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:30:35 -0700
X-CSE-ConnectionGUID: m10IeNcZTECogyS0Q60WFw==
X-CSE-MsgGUID: fIhfRusIQj6LZ7mnRWCuig==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2026 06:30:33 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBuOE-000000001sl-36tu;
	Wed, 30 Sep 2026 13:30:30 +0000
Date: Wed, 30 Sep 2026 15:30:29 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/futex/syscalls.c:204:22: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202609301514.dUuYTMaT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/futex-Skip-test_futex_robust_unlock-if-not-supported/20260925-145324
head:   0a151b703cae864a3bab66cc7fb5b8dc983658d3
commit: 8e4b5fd01bb4f8850e3f022e267d4fc53678c8fe futex: Create get_robust_list2() syscall
date:   5 days ago
config: m68k-randconfig-r2300-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301514.dUuYTMaT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301514.dUuYTMaT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301514.dUuYTMaT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/futex/syscalls.c:204:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct robust_list_head *head @@     got struct robust_list_head [noderef] __user * @@
   kernel/futex/syscalls.c:204:22: sparse:     expected struct robust_list_head *head
   kernel/futex/syscalls.c:204:22: sparse:     got struct robust_list_head [noderef] __user *
>> kernel/futex/syscalls.c:206:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *__x @@     got struct robust_list_head *head @@
   kernel/futex/syscalls.c:206:24: sparse:     expected void [noderef] __user *__x
   kernel/futex/syscalls.c:206:24: sparse:     got struct robust_list_head *head

vim +204 kernel/futex/syscalls.c

   164	
   165	SYSCALL_DEFINE4(get_robust_list2, int, pid,
   166			void __user * __user *, head_ptr,
   167			unsigned int, index, unsigned int, flags)
   168	{
   169		void __user *entry_ptr;
   170		uintptr_t entry;
   171	
   172		if (index >= FUTEX_ROBUST_LISTS_PER_USER)
   173			return -EINVAL;
   174	
   175		if (flags)
   176			return -EINVAL;
   177	
   178		/*
   179		 * The first two indexes are reserved for the kernel to be used with the
   180		 * legacy syscall, so we hide them from userspace.
   181		 *
   182		 * We map [0, FUTEX_ROBUST_LISTS_PER_USER) to
   183		 *  [FUTEX_ROBUST_LIST2_IDX, FUTEX_ROBUST_LIST2_MAX_IDX)
   184		 */
   185		index += FUTEX_ROBUST_LIST2_IDX;
   186	
   187		entry_ptr = futex_get_robust_list_common(pid, false, index);
   188		if (IS_ERR(entry_ptr))
   189			return PTR_ERR(entry_ptr);
   190	
   191		entry = (uintptr_t) entry_ptr;
   192	
   193		if (entry & FUTEX_ROBUST_LIST_ENTRY_32BIT) {
   194			entry &= FUTEX_ROBUST_LIST_ENTRY_MASK;
   195	
   196			if (copy_to_user(head_ptr, &entry, sizeof(u32)))
   197				return -EFAULT;
   198	
   199			return 0;
   200		} else {
   201			struct robust_list_head *head;
   202	
   203			entry &= FUTEX_ROBUST_LIST_ENTRY_MASK;
 > 204			head = (__force struct robust_list_head __user *)entry;
   205	
 > 206			return put_user(head, head_ptr);
   207		}
   208	}
   209	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
