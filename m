Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB28341ACB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902896; cv=none; b=E0f50wuY2psTrtiuzzM7awM77vW9mUuj0Uanj5Zgke9vHGFtLUJ5lxxhDp3SEut9Yqu1dO068xFEaA9e0im1PxVncTlSdHwMOW6BNIA3/JtelC0O2sVfNIvb6cu2RnQ1YGqNqqTEcRDCcLz6pvvlrIDBq3Kapwi7ERJOnQilpSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902896; c=relaxed/simple;
	bh=8o+zQy6ei534piTW63QI+s95pFWqgNWcaD6mGfKWrKI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qmcicLynQHas78bxrxHML8YWKFwenqV81ToG+h/JeF3K/cCzE/Vvo5R1dnCRHFCvV8lHh6urekOJ+ZzmyQw63UmJHMpDCaMFRU4ZdoW5d8CVoe6/OZ/3g0wIFouVneas7RaHJUGb42jbBFaip+XOSkXrw5IqSf7Gy0wGGuAKabs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=foPcdmve; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="foPcdmve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768902895; x=1800438895;
  h=date:from:to:cc:subject:message-id;
  bh=8o+zQy6ei534piTW63QI+s95pFWqgNWcaD6mGfKWrKI=;
  b=foPcdmveHvgiBaUwsEFBoWJP6uFeozbMAdznMsPD299lg62DnEHMZqls
   ZFZrdR4dyYbSfeRtCH8fuWpxRWuY9rkBRIVgX4TLZKRLaD/kXn2IF8IVl
   O6AIc9iADISFjcIBN2my+00KCVNyUZgIjzNtLJbjkzZRVXW3XySi+vlM8
   WUPXrN2D24v+qwx3bu8bK4AiWTFdKoNUgPCQsGRm7SNW51B3uzM18m5mZ
   GfskO+S8CuEea3YA3Upav4AcdXHQzYJtsCHIwjc9r4cKc11wQEd/jnJ6x
   6dYYKMe3K2aHYG/7EUMh7VQmwOmn812oumW2ETjmAYS4lWfs75YRE2CLg
   w==;
X-CSE-ConnectionGUID: EYsPg5LETA2WTlIygU3p5A==
X-CSE-MsgGUID: oqK9ox1pQIq7eg0ARzwB9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="72694329"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="72694329"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 01:54:54 -0800
X-CSE-ConnectionGUID: 4LRj4DALS/eANtlDfCbA1g==
X-CSE-MsgGUID: tGkD5SvaQsSQsqEaROHE+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210222198"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jan 2026 01:54:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi8Rm-00000000OnJ-0fgj;
	Tue, 20 Jan 2026 09:54:50 +0000
Date: Tue, 20 Jan 2026 17:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-debug 231/231]
 core.c:(.sched.text+0x7c4): relocation truncated to fit: R_OR1K_INSN_REL_26
 against undefined symbol `bch2_account_sched_blocked'
Message-ID: <202601201719.OGrHUlUP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-debug
head:   7cd4e8f9f8f13d9c5a2bbc98b80ca164430d6062
commit: 7cd4e8f9f8f13d9c5a2bbc98b80ca164430d6062 [231/231] BCH_SB_COUNTER_blocked_with_btree_locks_held
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260120/202601201719.OGrHUlUP-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201719.OGrHUlUP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201719.OGrHUlUP-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: kernel/sched/core.o: in function `schedule':
   core.c:(.sched.text+0x7c4): undefined reference to `bch2_account_sched_blocked'
>> core.c:(.sched.text+0x7c4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `bch2_account_sched_blocked'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
