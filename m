Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4144F280309
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768395045; cv=none; b=NwPLeshb50LzV//KbBXkT/jL8WjCA8fCy8J+0K5Xh6H5LzIunboH3zhHkbTptteBsbJfz9DCvZ0RlfC7tkpvLsp8wZmk/usyFnrU/QzMRtig2lnggWDdKmYDaYm4F2rNRJXCnwK+BG5UKfRH0mvzdS6wCtceWkMbpkHrnNK9f1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768395045; c=relaxed/simple;
	bh=QDBvKwGd296BxyRmHtz4aPHzXFdWazL7SeQGK5X75ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dFxwq4xMnyInxrmWcxaiZSStGsLAzzCFhvTYQGDIX6D3mHuh6Y/6oJljioCCXkuX4wdtR9vDoER6t9Bg+MRWCWCkh9GYpsk5F3ljvWKu9bF6giSdySKUzHnWzcYiSj949/C2v087JP1HDUfm+OMbUvGdda6894gnN5zv/lnCp68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhV94MBb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhV94MBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768395044; x=1799931044;
  h=date:from:to:cc:subject:message-id;
  bh=QDBvKwGd296BxyRmHtz4aPHzXFdWazL7SeQGK5X75ZQ=;
  b=BhV94MBbVwwmBjy8zlJM4UvDiBsXr35EztMayjeXyEjJJkmN1fz9z65g
   5SgzhT/s9SP+S9/z/p70r76bMGqqP/N5uSkVlkpR3VuDgzLUQ5Jb7O/Gt
   prKlAYqM1QPBDN/g47ldEucjhsD1xgWrtlfByEN5ZElqJU50RWK/S3gs6
   Rf4D7EfZXUATZRbi6sFZoPPNas71B2FdaWgFw+AVsHuH5IEY15Z6B79I+
   3fmczfR62fb4XYZV87VC+ZNOkJ7WnSOJajmCv1nM5p0cwQJguS75bgmty
   XpoEjTgPdydRynUzlL9KynTwYSgAGVv7ostTL9Ms6xu8/JHr5hT/+mhgy
   g==;
X-CSE-ConnectionGUID: m68nWL41SLqTOA1JwTmAmw==
X-CSE-MsgGUID: Is+JFvoSRyKgOJhAMfkUHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69775880"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69775880"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:50:44 -0800
X-CSE-ConnectionGUID: xyYhtGQHQZyVWDBAI8X/Ow==
X-CSE-MsgGUID: XPzXFUIZRlKm5VyjjfSPCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="203895172"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jan 2026 04:50:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg0Ke-00000000GOO-1QoQ;
	Wed, 14 Jan 2026 12:50:40 +0000
Date: Wed, 14 Jan 2026 20:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.6 10/15] ld.lld: error: undefined
 symbol: bpf_handle_oom
Message-ID: <202601142011.37GNxVwv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.6
head:   0096e4611728d881621b8fa5bf9f6cd849c88d14
commit: 77f0b096f685662730887bb2162e4f507c4986e1 [10/15] mm: introduce BPF OOM struct ops
config: arm-randconfig-001-20260114 (https://download.01.org/0day-ci/archive/20260114/202601142011.37GNxVwv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601142011.37GNxVwv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601142011.37GNxVwv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_handle_oom
   >>> referenced by oom_kill.c:1187 (mm/oom_kill.c:1187)
   >>>               mm/oom_kill.o:(out_of_memory) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
