Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D932D9EC2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 21:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771537551; cv=none; b=ZX8v6jiFP4pZxHCY6tegVIIvaLa9toeK7zwYGx0oCITkE/4lSK2qCoxpYRijLxDIgo023r3YzBvN+5O3EoRBjjCJLXwruurn51ytgMxsE66Uyw+uRCBJWCuQitV5Ux40mH0iZjJ1hNgDS5SFibl8uCPRvRpZet2x/z4VJUmqGeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771537551; c=relaxed/simple;
	bh=XbfO/q0QeDEGqKXaajAVb+fiITuyeGQ1cIDmvsuxM5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TNezQfIv+IOAg2EQPtuNWm4QXeBqDe7otpZYgwKmwLtxiObkx7TQwM1xkoJkE2owk9bA8JksD23sWA7xLl6n3lYsauE47GIaZeiwtA4No8LLdVFuI0tD3cOiZEz76Od7SSze6RZmu4bIh2XbiWSkvpRjMrWNirTBtpoH3OGlNn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/pS1ZUk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/pS1ZUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771537550; x=1803073550;
  h=date:from:to:cc:subject:message-id;
  bh=XbfO/q0QeDEGqKXaajAVb+fiITuyeGQ1cIDmvsuxM5w=;
  b=f/pS1ZUktjIh/NMk8POeH/jKq9acduAt17qfrC78UB+8idYlT2JNp0kT
   BaxoBcJapXb0K0XVrTc0Y04VEAzCovsM5M82ek3HnsTb1+Ytgj2KcrTZ5
   5LkY1qKuYhheOvIlscxfUemiST2oQigwhi+7HLj5CuCFkPJWa0aOgk9/E
   FdP5eKRPQWkNMwsSVazUUjY/y/swBTsB+7FAP6LSBOvyZqaJ4PuPk3hwy
   KCtdUHf7ZfqHw4oJo0VMZ6Y1qViL5n/XD70CxneoECfJCPjJofUCCyA5j
   MJSQXESyX0Oqx8xL3pSqrenSNPGfSe58Tn/T5gEaaXTJjoOf9+wWoFkVS
   w==;
X-CSE-ConnectionGUID: e9oV1wF4Q5e3q1EvUFlNGw==
X-CSE-MsgGUID: fmBS5gWjSAGsg8DezneJZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72698815"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72698815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 13:45:50 -0800
X-CSE-ConnectionGUID: Lwe6nRfDTvuafxi6M54UtA==
X-CSE-MsgGUID: ARAmzX12TQS7fKFOc78PYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="213254054"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Feb 2026 13:45:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtBqE-000000013Zc-2FHM;
	Thu, 19 Feb 2026 21:45:46 +0000
Date: Fri, 20 Feb 2026 05:44:46 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:cleanups 6/8]
 kernel/../mm/internal.h:531:13: warning: 'sync_with_folio_pmd_zap' defined
 but not used
Message-ID: <202602200540.fBDqU7YB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux cleanups
head:   226aaf624b5bda2b1238ba0c4e289fc23c7d04fc
commit: 8e910a0e64c988f4e8a324d3da73c3b3004f5682 [6/8] mm: remove two leftover compound_mapcount() comments
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260220/202602200540.fBDqU7YB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200540.fBDqU7YB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200540.fBDqU7YB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:117:
>> kernel/../mm/internal.h:531:13: warning: 'sync_with_folio_pmd_zap' defined but not used [-Wunused-function]
     531 | static void sync_with_folio_pmd_zap(struct mm_struct *mm, pmd_t *pmdp)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/exec.c:82:
>> fs/../mm/internal.h:531:13: warning: 'sync_with_folio_pmd_zap' defined but not used [-Wunused-function]
     531 | static void sync_with_folio_pmd_zap(struct mm_struct *mm, pmd_t *pmdp)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from lib/vsprintf.c:50:
>> lib/../mm/internal.h:531:13: warning: 'sync_with_folio_pmd_zap' defined but not used [-Wunused-function]
     531 | static void sync_with_folio_pmd_zap(struct mm_struct *mm, pmd_t *pmdp)
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/sync_with_folio_pmd_zap +531 kernel/../mm/internal.h

   518	
   519	/**
   520	 * sync_with_folio_pmd_zap - sync with concurrent zapping of a folio PMD
   521	 * @mm: The mm_struct.
   522	 * @pmdp: Pointer to the pmd that was found to be pmd_none().
   523	 *
   524	 * When we stumble over a pmd_none() without holding the PTL while unmapping a
   525	 * folio that could have been mapped at that PMD, it could be that concurrent
   526	 * zapping of the PMD is not complete yet. While the PMD might be pmd_none()
   527	 * already, the folio might still appear to be mapped (folio_mapped()).
   528	 *
   529	 * Wait for concurrent zapping to complete by grabbing the PTL.
   530	 */
 > 531	static void sync_with_folio_pmd_zap(struct mm_struct *mm, pmd_t *pmdp)
   532	{
   533		spinlock_t *ptl = pmd_lock(mm, pmdp);
   534	
   535		spin_unlock(ptl);
   536	}
   537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
