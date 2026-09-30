Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA74339386
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765098; cv=none; b=kop12FDRGjV1wRUcaP+4w1G69etMdwRaVttHfuD+QAkYvvKdBOu+rtg47g/m+yKvLhu6vOrXW+BnRm0rMhwV1eVRoqqsexadgwXsvwdJvLmFygZtMYQrccr2P30wMwacrl+Wwvr2UcNE6xXQ85YaL3jWVzCWC13lEfVUefG3u0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765098; c=relaxed/simple;
	bh=Mnce9X2G676YmGsmitT2/DLQyzfDcfUqNh5C34I1FDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Phit1rrvhwtHe30y297W+JZ3ROiK3NNIEHRp9fbcO4eaLesMTCbYcr+H4WUpo7+dsE83E6+XPUKXSqFlHDEhzj4jW8n0D2sBCt4k8D/KjI68Yh37qN5adBPSmwXhVX+d7ShzsROZgosCN+ngrmtMLMCLwmsLt7HOh/BiF6czq/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODzpN8qo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODzpN8qo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790765090; x=1822301090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mnce9X2G676YmGsmitT2/DLQyzfDcfUqNh5C34I1FDI=;
  b=ODzpN8qoAlEkuV3oblL+Ga67cddyZxxq05QsMlivUMGegov+ct7ZQvv+
   Q/stObxJZ8SQJwewu7eAjKckHLBMcmuogrgkfrVI3vbECs8pj8IQCD4Si
   cqVRDk+4/1RDmrbjm0raXzrZrHc30WD7xjHMD+1JLjdZGIoakc7OpUeNp
   JwaY1da62PCLApZ3h/dp5+kmN7HzC61/nYGtvYZMn8fc/J0TFaF6HHRxI
   LpeJxgOQ5xroihbcBmdjSe7jbGs79UT0YWtMnlPTTOVjeuNjLHzYOjYsH
   +G0ITmV/1f8GhjXYebdX8SS5OQgUB0W8dyCOSIcoyDgMrh88yqXG2scSB
   w==;
X-CSE-ConnectionGUID: MtK2xsMFRHWUcb6W/MXDxw==
X-CSE-MsgGUID: WNsJX/8/QOuuGQD/05bJ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102872655"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="102872655"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 03:44:42 -0700
X-CSE-ConnectionGUID: ASDIM+cgRruzVs5gI18tjQ==
X-CSE-MsgGUID: c1h423eMS/6SwLP5kXKXVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="283730820"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 30 Sep 2026 03:44:41 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBrni-000000001pj-3gRf;
	Wed, 30 Sep 2026 10:44:38 +0000
Date: Wed, 30 Sep 2026 12:44:26 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/futex/syscalls.c:206:24: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202609301249.Fc83MOzt-lkp@intel.com>
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
config: microblaze-randconfig-r2305-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301249.Fc83MOzt-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301249.Fc83MOzt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301249.Fc83MOzt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/futex/syscalls.c:204:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct robust_list_head *head @@     got struct robust_list_head [noderef] __user * @@
   kernel/futex/syscalls.c:204:22: sparse:     expected struct robust_list_head *head
   kernel/futex/syscalls.c:204:22: sparse:     got struct robust_list_head [noderef] __user *
>> kernel/futex/syscalls.c:206:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *volatile __pu_val @@     got struct robust_list_head *head @@
   kernel/futex/syscalls.c:206:24: sparse:     expected void [noderef] __user *volatile __pu_val
   kernel/futex/syscalls.c:206:24: sparse:     got struct robust_list_head *head

vim +206 kernel/futex/syscalls.c

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
   204			head = (__force struct robust_list_head __user *)entry;
   205	
 > 206			return put_user(head, head_ptr);
   207		}
   208	}
   209	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
