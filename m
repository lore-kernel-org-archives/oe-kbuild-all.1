Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536263AE70B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748194; cv=none; b=WVgcZmZRLNz09nNQyr/JryhGX/PHlH7F1sAcUC+6CP7VrnNq/HScZNgyAVltC7bPpEpQbYnjCl6QVKgKOA+ogqf+jc+W/GU/d1tjshOPnlU652vnDcRIt0F4Y8G4h4AcjbrbdRwNPwANfWZ/bQ8xQ2JkDYjilT/qfsCoHDYBCKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748194; c=relaxed/simple;
	bh=JJ507NrSjLz3EW2f1BQrAHvnh+CPDEumKx6tJ5H2IfI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A+Dj++0JGhhpGKNbhL8BhkUCEFnZeA4dl0OVuVpmV+3kCCBuVS1IxldXFJ87IDfL1DcMwLg023WDyJG8VCOkYglqoM+fV3CZoM4ONe9Z/Ax6Gp4PiOQDl1JqUH+dNJ1ArrjVQNfaV9GbTYUrEH46jPu4XlO5Ktlj9Vh0czlLtTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l62dOWPX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l62dOWPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773748193; x=1805284193;
  h=date:from:to:cc:subject:message-id;
  bh=JJ507NrSjLz3EW2f1BQrAHvnh+CPDEumKx6tJ5H2IfI=;
  b=l62dOWPX0MrhUkN6y6vyZdrMHpDXpdp6EoK5V2sJMBL7CJRCTEBQdnUV
   XnFIUYpB9c8Q01j/gHnMLuXueM1EEzCRO8L1aSdWiFTagH+KlHEWGzyfe
   wxQv3K5ff+TFJW/5waUUOA6bsAx2tPWlBzbcxVlpOYucYmVvFzRvf8JXe
   h7+mQ4lmZZPZthkyYKpu0Iz8UPE6mOHoH6IzDLwv+aErZLeiguRbsU+WK
   5ChChRPdct/ggqNqE5pE+T2jBg5O3gct2EcrBI7ynGDWr06us6aGvA+MG
   v8ChKsfwgJVfmVEW3yczagABgMz8CSJABfE1aIxSACxK1fVGvFNlOeC5W
   g==;
X-CSE-ConnectionGUID: cgQxI1U1TK6eIASG1D2sng==
X-CSE-MsgGUID: 09bTCG7dTYSOlIaIdA7W3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74856506"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74856506"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:49:52 -0700
X-CSE-ConnectionGUID: RNFSlCaSSR20pQGHoOJceA==
X-CSE-MsgGUID: nQudlbdRS3OBo6kp4yqD7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="218395902"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Mar 2026 04:49:51 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Svl-000000000Kx-11uq;
	Tue, 17 Mar 2026 11:49:49 +0000
Date: Tue, 17 Mar 2026 19:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 2/8]
 include/linux/futex_types.h:52:50: error: expected ':', ',', ';', '}' or
 '__attribute__' before '*' token
Message-ID: <202603171935.Wt7nTCaM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   226e6782e81c88b9263e006a356f58dd8c15bef5
commit: 2ace2e1df2b9de73d65c1a11bbb4183c42ba5752 [2/8] futex: Move futex related mm_struct data into a struct
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260317/202603171935.Wt7nTCaM-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171935.Wt7nTCaM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171935.Wt7nTCaM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:19,
                    from include/linux/delay.h:13,
                    from init/calibrate.c:8:
>> include/linux/futex_types.h:52:50: error: expected ':', ',', ';', '}' or '__attribute__' before '*' token
      52 |         unsigned int                    __percpu *phash_ref;
         |                                                  ^


vim +52 include/linux/futex_types.h

    33	
    34	/**
    35	 * struct futex_mm_data - Futex related per MM data
    36	 * @phash_lock:		Mutex to protect the private hash operations
    37	 * @phash:		RCU managed pointer to the private hash
    38	 * @phash_new:		Pointer to a newly allocated private hash
    39	 * @phash_batches:	Batch state for RCU synchronization
    40	 * @phash_rcu:		RCU head for call_rcu()
    41	 * @phash_atomic:	Aggregate value for @phash_ref
    42	 * @phash_ref:		Per CPU reference counter for a private hash
    43	 */
    44	struct futex_mm_data {
    45	#ifdef CONFIG_FUTEX_PRIVATE_HASH
    46		struct mutex			phash_lock;
    47		struct futex_private_hash	__rcu *phash;
    48		struct futex_private_hash	*phash_new;
    49		unsigned long			phash_batches;
    50		struct rcu_head			phash_rcu;
    51		atomic_long_t			phash_atomic;
  > 52		unsigned int			__percpu *phash_ref;
    53	#endif
    54	};
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
