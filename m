Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571441F0E32
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 02:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764640853; cv=none; b=R6LHMQEFtj5+1kI5vJfjl1T44DNB8Ikqu9gm3xXbvcHEZ1ZPQTJYwjQsKnn9haPKw9h0NTKjh8uU63YRt2urmO1EyEZlS6PsCmkyN3pqApkv+zTX4gkL8TgkCYkUA/K/jOPiTm5FTAf8SDckzTJyN/niToGuldHYdX1phqo49VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764640853; c=relaxed/simple;
	bh=wZuMnOvr98vdP3exCR11H8Ta28H9lCEG5luzH6l46II=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F4UnoxtiIHeOLq9fAjgN0NZojPzSw8dWPPBj/RpKVzIA2PMF6D/fJbdCRGIQUZkvSlb7ExTzzAgpyYZuwc78TYETIrHjiehVD9zsxHCHPUtijzCz9anktkqtTXX8I1srkno+1WIzfMTt6+v0HexRWmgkzH599p5O284iUDByXtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdqvLBbc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdqvLBbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764640851; x=1796176851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wZuMnOvr98vdP3exCR11H8Ta28H9lCEG5luzH6l46II=;
  b=kdqvLBbc/9zzKCw06ily+7cRYVmOxIwfM60FbDuLyRmOAwdk3HRu0CcY
   o02zzs/yPfhkQzlw0zipqC9lUxrLIPFM/RMYGn4yJhIzSpHhDi2Lg1nR2
   tSf6KQBbCHAK2m5qSBMCQj6jJ+IrhEaF3Im9GPiAqiuGbpi1bC1QeO8T0
   VVzsnoJC8jix1rcUeKMpb/AUHBu8HpZxm6g3kfwRToDVROggVfEwC3KxG
   I0VpYJA95twaCODZwO584vAqsAju+OP68xKAMc7HHtzVrY+FleHiNZxsi
   Voa+Q8FucB02PvwahrP+sdVKOKeFtiGjFAzjKmzUnWWaZsESFslsA4SjO
   Q==;
X-CSE-ConnectionGUID: YeBfJON6SJ29FQVnB5RVkw==
X-CSE-MsgGUID: upUKdNiOTlqxB71YdNI4mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66554608"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66554608"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:00:51 -0800
X-CSE-ConnectionGUID: jwKTD0yHQQWrZqPp4L7i/w==
X-CSE-MsgGUID: SZ7RSP7jStKqRq29wImriw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="231546106"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Dec 2025 18:00:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQFh9-000000009JV-3NBM;
	Tue, 02 Dec 2025 02:00:47 +0000
Date: Tue, 2 Dec 2025 10:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.sched/misc 11/11] xtensa-linux-ld: fair.c:undefined
 reference to `__BUILD_BUG_vruntime_op'
Message-ID: <202512020903.gNQAcUaM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/misc
head:   c8dd0a78e3b31f8103c11d5e775dfaaf204ef458
commit: c8dd0a78e3b31f8103c11d5e775dfaaf204ef458 [11/11] sched/fair: Introduce and use the vruntime_cmp() and vruntime_op() wrappers for wrapped-signed aritmetics
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20251202/202512020903.gNQAcUaM-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020903.gNQAcUaM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020903.gNQAcUaM-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: kernel/sched/fair.o: in function `__calc_delta.constprop.0':
   fair.c:(.text+0x468): undefined reference to `__BUILD_BUG_vruntime_op'
>> xtensa-linux-ld: fair.c:(.text+0x4d4): undefined reference to `__BUILD_BUG_vruntime_op'
   xtensa-linux-ld: kernel/sched/fair.o: in function `vruntime_eligible':
   fair.c:(.text+0x522): undefined reference to `__BUILD_BUG_vruntime_op'
>> xtensa-linux-ld: fair.c:(.text+0x550): undefined reference to `__BUILD_BUG_vruntime_cmp'
   xtensa-linux-ld: kernel/sched/fair.o: in function `update_deadline.isra.0':
   fair.c:(.text+0x642): undefined reference to `__BUILD_BUG_vruntime_cmp'
   xtensa-linux-ld: kernel/sched/fair.o: in function `migrate_task_rq_fair':
   fair.c:(.text+0x1110): undefined reference to `__BUILD_BUG_vruntime_cmp'
   xtensa-linux-ld: kernel/sched/fair.o: in function `min_vruntime_cb_propagate':
   fair.c:(.text+0x1213): undefined reference to `__BUILD_BUG_vruntime_cmp'
   xtensa-linux-ld: kernel/sched/fair.o: in function `switched_from_fair':
   fair.c:(.text+0x1a25): undefined reference to `__BUILD_BUG_vruntime_cmp'
   xtensa-linux-ld: kernel/sched/fair.o:fair.c:(.text+0x1b30): more undefined references to `__BUILD_BUG_vruntime_cmp' follow
   xtensa-linux-ld: kernel/sched/fair.o: in function `sched_balance_find_src_rq':
   fair.c:(.text+0x3286): undefined reference to `__BUILD_BUG_vruntime_op'
   xtensa-linux-ld: kernel/sched/fair.o: in function `update_sg_lb_stats.isra.0':
   fair.c:(.text+0x3454): undefined reference to `__BUILD_BUG_vruntime_op'
   xtensa-linux-ld: fair.c:(.text+0x34dd): undefined reference to `__BUILD_BUG_vruntime_op'
   xtensa-linux-ld: kernel/sched/fair.o: in function `cfs_avg_vruntime':
   fair.c:(.text+0x361f): undefined reference to `__BUILD_BUG_vruntime_cmp'
   xtensa-linux-ld: kernel/sched/fair.o: in function `update_zero_vruntime.constprop.0':
   fair.c:(.text+0x3884): undefined reference to `__BUILD_BUG_vruntime_op'
   xtensa-linux-ld: kernel/sched/fair.o: in function `__enqueue_entity.constprop.0':
   fair.c:(.text+0x3a76): undefined reference to `__BUILD_BUG_vruntime_cmp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
