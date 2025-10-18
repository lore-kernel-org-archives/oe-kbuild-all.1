Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146742566E9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 22:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760825965; cv=none; b=aS1PGzndK1CVVnOWv3mdcQ+rMIPBiW5k/JDcBlRzMV+tbBNlUHJyXEyGlAB12lUC8PMce/Q+Ant+7g2A5BwU+utMdB6gYlANTWKFqUxnTwlMc6jwXX0Rhp+cv7EPiGxJfpGov1pehue81i4GnPGtsOTzyPOvEwnM9mUpqhisaSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760825965; c=relaxed/simple;
	bh=AGcPX2vqwL+vJs9Fzlh0Lfhzj2eqjMIbIp57q5ox3VU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UGbodiCdIiDYXG5k6VDLQWxHvQ7qMSLwbjRjplO3fV+IaH6O4V5DL1xqxipyAuoNk8fayo37ppsIo3lODcJLpZBkFufFrN1/QzfaNEwoT5jMXuCjho/KCzVHWyVkE93T5CssczcmAZn5Bt/9JZB/nLLBk4LPSPYMOUg/PPziPpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpdNW0fb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpdNW0fb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760825963; x=1792361963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AGcPX2vqwL+vJs9Fzlh0Lfhzj2eqjMIbIp57q5ox3VU=;
  b=BpdNW0fb9p8Vws3klgQSivUi6PPc6ArX29W4pcZBc0jPP00hGSp9KtLf
   2NG+X8Gn4y51fxwdfStkmRQkRroi6WZmECTVjKtwYPyJm1HFf1GCAKkda
   tjOu0re7MBzxtS8IOIfNOMQx9J8CSZ+aBLWKU66Y3LG+b0gTV5X6bpYtl
   nZkebGx/nqo1I4I7CIGjBEU3EIE0X8qLwv2hMZ+DWrW0J5nYHjF23d7lu
   iWHu5WGFTpWud922GHXK+/BUE9m1WPqL+jvaWlmvrrV0GDCdG55wCOFi6
   t1uW76OIyJQBR1S+NIP2wmeTcxl/3gmERWn/1ovWgxzi9MBVFFZU1zWHv
   w==;
X-CSE-ConnectionGUID: yTog4qu0SgSziAaxdd/iYQ==
X-CSE-MsgGUID: LWebBFSsT7m8czmZxorpLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73676214"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="73676214"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 15:19:22 -0700
X-CSE-ConnectionGUID: d5H6GCa7Sm2QRSyfKDbDNQ==
X-CSE-MsgGUID: 9sEWmfusRHWFI9HvJyFjzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="220161932"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2025 15:19:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAFGg-0008fV-34;
	Sat, 18 Oct 2025 22:19:18 +0000
Date: Sun, 19 Oct 2025 06:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 13/18] kernel/locking/lockdep.c:3407:49:
 sparse: sparse: cast truncates bits from constant value (a0000 becomes 0)
Message-ID: <202510190621.tQC7FDW0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   e1bd1563f71cd7814575f327a42233a3a839fad6
commit: 7ef2386f796b854caa982459b1e6aabecfb513b9 [13/18] Increase MAX_LOCKDEP_CHAIN_HLOCKS
config: x86_64-randconfig-122-20251018 (https://download.01.org/0day-ci/archive/20251019/202510190621.tQC7FDW0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510190621.tQC7FDW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510190621.tQC7FDW0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/locking/lockdep.c:3407:49: sparse: sparse: cast truncates bits from constant value (a0000 becomes 0)
>> kernel/locking/lockdep.c:3407:49: sparse: sparse: cast truncates bits from constant value (a0000 becomes 0)

vim +3407 kernel/locking/lockdep.c

810507fe6fd5ff Waiman Long 2020-02-06  3399  
810507fe6fd5ff Waiman Long 2020-02-06  3400  static inline void init_chain_block(int offset, int next, int bucket, int size)
810507fe6fd5ff Waiman Long 2020-02-06  3401  {
810507fe6fd5ff Waiman Long 2020-02-06  3402  	chain_hlocks[offset] = (next >> 16) | CHAIN_BLK_FLAG;
810507fe6fd5ff Waiman Long 2020-02-06  3403  	chain_hlocks[offset + 1] = (u16)next;
810507fe6fd5ff Waiman Long 2020-02-06  3404  
810507fe6fd5ff Waiman Long 2020-02-06  3405  	if (size && !bucket) {
810507fe6fd5ff Waiman Long 2020-02-06  3406  		chain_hlocks[offset + 2] = size >> 16;
810507fe6fd5ff Waiman Long 2020-02-06 @3407  		chain_hlocks[offset + 3] = (u16)size;
810507fe6fd5ff Waiman Long 2020-02-06  3408  	}
810507fe6fd5ff Waiman Long 2020-02-06  3409  }
810507fe6fd5ff Waiman Long 2020-02-06  3410  

:::::: The code at line 3407 was first introduced by commit
:::::: 810507fe6fd5ff3de429121adff49523fabb643a locking/lockdep: Reuse freed chain_hlocks entries

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
