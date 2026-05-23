Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334942DC79F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779569809; cv=none; b=icH+b2INguu4eTdk/0mtY8medm86tx1Y5UDbCJPesHF+wYnp3QacwqSXVu49oZQInRHjpbN3X8ZfpyOV1u4SJX+HEGUoEA90gdDwuse5OBiVbx+MB0kIQATa8NglsvqRs4xz4TlI9Nz3ZmctuYK9GfE/CmK473amROYcMpTkDwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779569809; c=relaxed/simple;
	bh=PV15ZQ21Qok8gUnpHPilbCEw7U2MEjK34sj5g9hmWvc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jOzgKRYxIgx0qVrbxhs4Qz/7c3FINh49RETY6BX6tRJkbFlX82v0BUWn1i0oVcp8EvRaOMUpL16SD9GEQUvTPUGjs8TAwKcfErlXYAXivrV5ozy2jatAOU/XKBMNx1UwDFD7cyJQIxPdXJjN+4DutfgpNf03CX4jcGvnkUmbXA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khRjDTL4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khRjDTL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779569808; x=1811105808;
  h=date:from:to:cc:subject:message-id;
  bh=PV15ZQ21Qok8gUnpHPilbCEw7U2MEjK34sj5g9hmWvc=;
  b=khRjDTL4d9SJnoY65u44BpE0ZpV55p8Yqo96oNByfd/aglBAHA9wV5Zz
   OePmrlss1mfJdtyJjvtzge5OvAcgtqcTporUy61fbxtSstkZD939Kf4fO
   m1CU+NR6E0S7MXVIqullgvpvAz7S063bBLvh6hg9oIFPymt6K7m5rZmY8
   Yay/NvSDmEXX0i4celyhjPKgrHdC301nd5ZY5d63GKJb9qWW2LTIqg9yw
   baoCtEnFfqJ2ZHh23D0hwkyQYShvIvN4RFeK3c6wcrh1SAjNj9CiWJEnt
   QiM25+MMZSC4xBPHJNBWdYDVq49B3vyo5c6X9i/oHAWMP5a3bbECWNMlA
   A==;
X-CSE-ConnectionGUID: GD8J/eybQ4Wx6HStXPnTsA==
X-CSE-MsgGUID: OjCWp00KQi+bn5P1ic/7uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="84310568"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="84310568"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 13:56:47 -0700
X-CSE-ConnectionGUID: 6xxzQJvuR9aA9XPoQU0DrQ==
X-CSE-MsgGUID: Wwpyr09nQc6284DP/jcsDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="238654974"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 May 2026 13:56:46 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQtOm-000000000L3-0Z4A;
	Sat, 23 May 2026 20:56:44 +0000
Date: Sun, 24 May 2026 04:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 3/3]
 mm/mempolicy.c:488:6-25: WARNING: atomic_dec_and_test variation before object
 free at line 496.
Message-ID: <202605240432.Nkpxfux2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   554477e658c862dfc54b28a65fb7b35bc93bd8cd
commit: 190a8c48ff623c3d67cb295b4536a660db2012aa [3/3] futex: Fix UaF between futex_key_to_node_opt() and vma_replace_policy()
config: arm64-randconfig-r054-20260524 (https://download.01.org/0day-ci/archive/20260524/202605240432.Nkpxfux2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240432.Nkpxfux2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/mempolicy.c:488:6-25: WARNING: atomic_dec_and_test variation before object free at line 496.

vim +488 mm/mempolicy.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  484  
52cd3b074050dd Lee Schermerhorn 2008-04-28  485  /* Slow path of a mpol destructor. */
c36f6e6dff4d32 Hugh Dickins     2023-10-03  486  void __mpol_put(struct mempolicy *pol)
52cd3b074050dd Lee Schermerhorn 2008-04-28  487  {
c36f6e6dff4d32 Hugh Dickins     2023-10-03 @488  	if (!atomic_dec_and_test(&pol->refcnt))
52cd3b074050dd Lee Schermerhorn 2008-04-28  489  		return;
190a8c48ff623c Hao-Yu Yang      2026-03-13  490  	/*
190a8c48ff623c Hao-Yu Yang      2026-03-13  491  	 * Required to allow mmap_lock_speculative*() access, see for example
190a8c48ff623c Hao-Yu Yang      2026-03-13  492  	 * futex_key_to_node_opt(). All accesses are serialized by mmap_lock,
190a8c48ff623c Hao-Yu Yang      2026-03-13  493  	 * however the speculative lock section unbound by the normal lock
190a8c48ff623c Hao-Yu Yang      2026-03-13  494  	 * boundaries, requiring RCU freeing.
190a8c48ff623c Hao-Yu Yang      2026-03-13  495  	 */
190a8c48ff623c Hao-Yu Yang      2026-03-13 @496  	kfree_rcu(pol, rcu);
52cd3b074050dd Lee Schermerhorn 2008-04-28  497  }
f634f10809ec3d Shivank Garg     2025-08-27  498  EXPORT_SYMBOL_FOR_MODULES(__mpol_put, "kvm");
52cd3b074050dd Lee Schermerhorn 2008-04-28  499  

:::::: The code at line 488 was first introduced by commit
:::::: c36f6e6dff4d32ec8b6da8f553933727a57a7a4a mempolicy trivia: slightly more consistent naming

:::::: TO: Hugh Dickins <hughd@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
