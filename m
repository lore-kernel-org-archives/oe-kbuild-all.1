Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDBBEC4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 00:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740960472; cv=none; b=j0Y7j7Hwm7Ox/xIu+3eZhTN2m3Ozfv5LOKLfFPAOUTTSZmSxdQPRLTtQ+BRniyWw2c1Y2q0Qhs7z9EW/yaiE7h+SzINq+ybtWUMTCVlu8QKMiDXNaMQ7BslcvACsKDLxQAJFOYSOhrbjOFhjRaZIrBKaTdeA4JM2fGzaVgYCCas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740960472; c=relaxed/simple;
	bh=yxggTVee9oB7EncBvRhtNqNAB1WMGp1j+Rw4J8Ciw9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t4lz89UL3Id99iTSH5KNOSs0UXiigbUeJVG5PFAxtcYAmOrZk7aTOeJMAraa5Zl6Z8IEfHtYbUVssGS5W9tua7l8+Bi+gygFCx3hkAGpJye2UPeQ3SZutQP/sao+hypR+W8JFiCgIvfyDnu4CfpZSq4Y+t3rHkAePmKXgufUsuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYtNqSPS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYtNqSPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740960470; x=1772496470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yxggTVee9oB7EncBvRhtNqNAB1WMGp1j+Rw4J8Ciw9s=;
  b=eYtNqSPSu/WvQX032LYR216RFhXyYLxvaGS74Arl25hub4RkmcROdynK
   EoiDcGNtaaaI/E4691l0mdE9Ebcw4591vQwIbVVCwdsKWGudQuq7xfKg1
   azZ+YxOLUBCcHCvqm9h5bSf7iMlk5esqtpY26IxxVCdBxA5jdlcG8yRjb
   9jkVkl5OMGdhGapEy38nvjJPQ93w/AEUESjrzi2iRT+dQuOXAZZbmH97/
   G+zuymUg4Zbk560EtAtNRiFAcdngPBP+cH/eJtfoEOXUWCXzroPGEWH7B
   Kwkxoe181kSS226opp5Qa6407NxaSzkrUoOGp5eMgKyqaXDlfCUv9VN1u
   w==;
X-CSE-ConnectionGUID: 96Kg3knNQ/SEWofObcWmcQ==
X-CSE-MsgGUID: pokCzv62Qkq3USyEio67Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="59368568"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="59368568"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 16:07:49 -0800
X-CSE-ConnectionGUID: FuOZQzvISN6/14r9NVN6rA==
X-CSE-MsgGUID: AD8ERwa5TLapL+zlfRud6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="155034245"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Mar 2025 16:07:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1totLV-000Hjs-1l;
	Mon, 03 Mar 2025 00:07:45 +0000
Date: Mon, 3 Mar 2025 08:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:futex/scope 16/18] kernel/futex/core.c:184:13: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202503030701.HtiCnva1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git futex/scope
head:   b37932a2988afdd932334774c6e7536f5f5e1f70
commit: f6f798343bebd692a667531bf0c1ceed46126354 [16/18] futex: Remove superfluous state
config: arc-randconfig-r111-20250303 (https://download.01.org/0day-ci/archive/20250303/202503030701.HtiCnva1-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250303/202503030701.HtiCnva1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503030701.HtiCnva1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/futex/core.c:184:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct futex_private_hash *fph @@     got struct futex_private_hash [noderef] __rcu *futex_phash @@
   kernel/futex/core.c:184:13: sparse:     expected struct futex_private_hash *fph
   kernel/futex/core.c:184:13: sparse:     got struct futex_private_hash [noderef] __rcu *futex_phash
>> kernel/futex/core.c:1374:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got struct futex_private_hash [noderef] __rcu *futex_phash @@
   kernel/futex/core.c:1374:18: sparse:     expected void const *addr
   kernel/futex/core.c:1374:18: sparse:     got struct futex_private_hash [noderef] __rcu *futex_phash
>> kernel/futex/core.c:1418:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct rcuref_t [usertype] *ref @@     got struct rcuref_t [noderef] __rcu * @@
   kernel/futex/core.c:1418:45: sparse:     expected struct rcuref_t [usertype] *ref
   kernel/futex/core.c:1418:45: sparse:     got struct rcuref_t [noderef] __rcu *
   kernel/futex/core.c:1535:58: sparse: sparse: Using plain integer as NULL pointer
   kernel/futex/core.c:807:9: sparse: sparse: context imbalance in 'futex_q_lockptr_lock' - wrong count at exit

vim +184 kernel/futex/core.c

   175	
   176	static bool futex_assign_new_hash(struct mm_struct *mm,
   177					  struct futex_private_hash *new)
   178	{
   179		struct futex_private_hash *fph;
   180	
   181		lockdep_assert_held(&mm->futex_hash_lock);
   182		WARN_ON_ONCE(mm->futex_phash_new);
   183	
 > 184		fph = mm->futex_phash;
   185		if (fph) {
   186			if (fph->hash_mask >= new->hash_mask) {
   187				/* It was increased again while we were waiting */
   188				kvfree(new);
   189				return true;
   190			}
   191	
   192			if (rcuref_read(&fph->users) != 0) {
   193				mm->futex_phash_new = new;
   194				return false;
   195			}
   196	
   197			futex_rehash_current_users(fph, new);
   198		}
   199		rcu_assign_pointer(mm->futex_phash, new);
   200		kvfree_rcu(fph, rcu);
   201		return true;
   202	}
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
