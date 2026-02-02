Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430C31C549F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 02:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769997924; cv=none; b=bXXHbfxOoE+W+ZAktS4+w30hUBB1hxRqG6/XGIJYxhF/Yt6G28dC3x6xwDkDAQoDeVh0+d7FEfruPMrBVlp5iSA4ciXkqV0CivUqgiBFEFZ+B2bsbhUkrRThPIalecTuiPl8oHn2tHIhRoUgK3IVCS6koyDo/nxRH4c1zaK9fpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769997924; c=relaxed/simple;
	bh=dubTfeMWyR38ZCodDyq2UNaK+f32THn8tTifdmXOTTg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g3Bw7EmyiSidk7V14oGV26Ilqw2Ma/Uk5v3PSl9Z3tS7NDWGZsZE3TlhtPOt10rSK+xSGsyYiLkB80DNowGVvw9kFmeUpJgR4CNzBpADCUUYP42HD/nOtFwpfBsKOzFBxVuW/bipc3HleRUI90aoRKUivL9G2HtDyU+vNj6keWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vei50lsZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vei50lsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769997922; x=1801533922;
  h=date:from:to:cc:subject:message-id;
  bh=dubTfeMWyR38ZCodDyq2UNaK+f32THn8tTifdmXOTTg=;
  b=Vei50lsZ630byeuqMihx5BxhLiDPnPfMVGwBliVyEYQnCiSSA0hKelKA
   ClPgDTh8URTUkVkNTYovB2fefViQBxyw/XfCznNACYHNl4ZmHuD/NgrdT
   0eOkOtOm4wggG9Qe5ICK0G6gb3zi44FCJzMEwVpmgVP0rtoxXwp7ewHgv
   MjPjkDdR3la4gU1UFqvEqS7AYsTBB7ub/SPgznsAJ6SaY7zQTOXQSv+U2
   3U+oJnvFB7JFfWRxt/ikLjm2UZBAbVjDNr8RvWG4OC0U2ugQpe6Nfo6Tx
   jeS7oClRaW4Eb/Lnme0VGnv37fUSBBAiP+ux8CRlTOzRvQveJFFWTK8uy
   Q==;
X-CSE-ConnectionGUID: Y65taQVpQruJJkMQxLfH1w==
X-CSE-MsgGUID: jhOO4l9tTpyan2BnCIZdMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="88577161"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="88577161"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 18:05:22 -0800
X-CSE-ConnectionGUID: N3p4nkOtTNyjo4ObSSNxlg==
X-CSE-MsgGUID: r5UThWkBQ3a09U5TqoK3JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="208647211"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Feb 2026 18:05:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmjJW-00000000fB4-07xY;
	Mon, 02 Feb 2026 02:05:18 +0000
Date: Mon, 02 Feb 2026 10:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: kernel/futex/core.c:1748:2-8: WARNING: NULL check before
 some freeing functions is not needed.
Message-ID: <202602021017.JuULzLgI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18f7fcd5e69a04df57b563360b88be72471d6b62
commit: 56180dd20c19e5b0fa34822997a9ac66b517e7b3 futex: Use RCU-based per-CPU reference counting instead of rcuref_t
date:   7 months ago
config: x86_64-randconfig-r061-20260201 (https://download.01.org/0day-ci/archive/20260202/202602021017.JuULzLgI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602021017.JuULzLgI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/futex/core.c:1748:2-8: WARNING: NULL check before some freeing functions is not needed.

vim +1748 kernel/futex/core.c

56180dd20c19e5 Peter Zijlstra            2025-07-10  1739  
80367ad01d93ac Sebastian Andrzej Siewior 2025-04-16  1740  void futex_hash_free(struct mm_struct *mm)
80367ad01d93ac Sebastian Andrzej Siewior 2025-04-16  1741  {
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16  1742  	struct futex_private_hash *fph;
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16  1743  
56180dd20c19e5 Peter Zijlstra            2025-07-10  1744  	free_percpu(mm->futex_ref);
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16  1745  	kvfree(mm->futex_phash_new);
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16  1746  	fph = rcu_dereference_raw(mm->futex_phash);
56180dd20c19e5 Peter Zijlstra            2025-07-10  1747  	if (fph)
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16 @1748  		kvfree(fph);
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16  1749  }
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16  1750  

:::::: The code at line 1748 was first introduced by commit
:::::: bd54df5ea7cadac520e346d5f0fe5d58e635b6ba futex: Allow to resize the private local hash

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
