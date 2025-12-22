Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6A231B825
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411439; cv=none; b=abcDQxkuaDaxiLsEuFE7jRq8R9OffQBr/USEMd7Jw71HvIuhO2AIzq52BZ2x6R827zTQYexRXLxG/JAqL/vCglU2C6Jq7/412uOf6/n9KKTf5exEL/rFtUhRoOfXZm5E/WSXyOzp11mf12iiFwooFaaXwsu2/Tjr6EcnHoYSnTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411439; c=relaxed/simple;
	bh=hsHhkh5LKy7MgXe+vgdt51lHHVOv9oHAylPXMpAcbc4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gkel1Oi6WDqWVQlKMVpYedqTRHeHE+t+1oQnVkSI+6rpfDzaFc+6EmSSpCqJiL9+4/XUOZIWpgtdP3/LL0C1nt8fbU1YoeIqoz8368jGEmZard0xzigFfh0Eztg4SWDW/My8ZGu5T3MRVCFkPDq9uQWwGecQbIfurGG3jThzNT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BwKeN9KI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwKeN9KI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766411439; x=1797947439;
  h=date:from:to:cc:subject:message-id;
  bh=hsHhkh5LKy7MgXe+vgdt51lHHVOv9oHAylPXMpAcbc4=;
  b=BwKeN9KIUapLppb/VomOzK/F3MUyPQGz9wyzLyUOj9yTXNc+g/+zCTUI
   ubPm3MGFKVhMH8elZVa6Qr6vQDz3+2CjUo4smHljbdcZD96lh78mbjj9q
   3s9aAsHCdgTfG5VetyhNwuTztrxFKzN+01QbmVmEwys8r1/WEd1wVvIP1
   2QC/IBieg1t23ItAx7dR70uYvAXfbRGVp4Dzw73xbhMkQGxn14BN4n0o8
   WSMCz9TSpvYBnzAMI0UxlzFSGPNVvOkz/DQviw4gzhL/aVqF8UtLjqBTG
   EC/4VdPZpL1PuAJ1Oe2T2VcB9UiUO5FhqoudhH9bi4x4v0O0MeDOggArR
   g==;
X-CSE-ConnectionGUID: BFRYn+MhRn+vpXJXQ0Ui1Q==
X-CSE-MsgGUID: yjh+oFKMRN6UIHqswgM1Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="71894999"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="71894999"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 05:50:38 -0800
X-CSE-ConnectionGUID: nnUMSUkpTaiaIrY9Wf/7Ig==
X-CSE-MsgGUID: /Xb205lxTXaILtVwAj5ASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199166721"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 05:50:35 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXgIz-000000000eJ-0mLr;
	Mon, 22 Dec 2025 13:50:33 +0000
Date: Mon, 22 Dec 2025 21:50:16 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: kernel/futex/core.c:1748:2-8: WARNING: NULL check before
 some freeing functions is not needed.
Message-ID: <202512222152.KF2aRkYU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: 56180dd20c19e5b0fa34822997a9ac66b517e7b3 futex: Use RCU-based per-CPU reference counting instead of rcuref_t
date:   5 months ago
config: arm-randconfig-r061-20251222 (https://download.01.org/0day-ci/archive/20251222/202512222152.KF2aRkYU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 789845e319bbf346d42ee2c0090a9b8e153797a2)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222152.KF2aRkYU-lkp@intel.com/

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
