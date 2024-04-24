Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82642158851
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 08:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713947170; cv=none; b=agshIZK5M6wD7cjMJyxjrtvi6/fKCST4m+SeU7fQs7mPXhNdSQ5Ryh1G+MMeAGhn8wX6IC6nq0BY0b0TbJx1YmwDthjyl6cKf7jh6qg6ivMyyAFwaqQf3NNCsYMC2lzOHmFTYFguTdE7/2a5b9/IEL+dQ4XVKp81rOvxQlnhJKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713947170; c=relaxed/simple;
	bh=EmHMPvgKAoQJDRWQwlm9jmDo8kEKQqcKd0ef85rUkXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=psa7W/HYd5FF5MqOTG+x053Xgtnd5ki/nccyd3BahpnZHcp98ERL6jAwtBmpf70atFdwdWrDsiIiCy+2A8dWkvK+K25L4cpkU2RcD7uwzhmrQ9THmQDTuQY6BuQhSdfZcUo14yhDmU2qPZ+KivFODc47JTYa/GYNLrtDStmgC70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nL/xHw2b; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nL/xHw2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713947168; x=1745483168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EmHMPvgKAoQJDRWQwlm9jmDo8kEKQqcKd0ef85rUkXc=;
  b=nL/xHw2bxo2psFNnF9wKIocSG9Ez+wjwRzXPW8/SV+ORhasKEPzdEP4n
   EDAJXLiN9GIyz455Po6CIhaC8Y0laisn2saiRlzd2R59faCQj/ECHV4yG
   mw1I7L9h7fUPpvEmeOQLduY7XPiVrxWtCk+bduIiqeu88wvHESzntVNLB
   PN/OSgOZ2aLjK4jGHj4BOjin0n3vI1l9mkYw3rE2sDscbmR5u5a+UMWqv
   5aafr9q5EXgWuAdC7GkpFf+mnrGSIEG37Ju5OXhOksWD3iYy5HGOvyC2H
   00w0dv0i0So3HKu+o1UQEWYmyEObGiJRG6FcGSakmdHgkC0BSNCiouA92
   w==;
X-CSE-ConnectionGUID: stwyK0v5T6uApDrosvRo0w==
X-CSE-MsgGUID: aAIg3MFWSmOz5wcuOe4B1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27079757"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="27079757"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 01:26:07 -0700
X-CSE-ConnectionGUID: vZo7Fr8TTHyOmC05hFvI9g==
X-CSE-MsgGUID: tEBgCSWzQbGOWqc+uJMFfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="29118475"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Apr 2024 01:26:05 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzXx5-00012Q-1J;
	Wed, 24 Apr 2024 08:26:03 +0000
Date: Wed, 24 Apr 2024 16:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data319'
 from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data319'
Message-ID: <202404241643.0athGlpO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d1ddab261f3e2af7c384dc02238784ce0cf9f98
commit: 7a50f76674f8b6f4f30a1cec954179f10e20110c sched: Simplify yield_to()
date:   7 months ago
config: powerpc-randconfig-s032-20220402 (https://download.01.org/0day-ci/archive/20240424/202404241643.0athGlpO-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241643.0athGlpO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241643.0athGlpO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data319' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data319'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data228' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data228'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data319' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data319'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data228' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data228'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data319' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data319'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data228' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data228'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
