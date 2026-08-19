Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F60C304BB2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 04:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787113105; cv=none; b=gHRuf+DnCjZeu/x4sWG7/JlqbeXKJm743daOYjcQq0EgaNqMmvwhiypN1vDQK6DYcXY5xNMttp2d5QF824+13X1HzT1rNa2sji4Qqaa8N58eVAUxyovdFX3ZMIy9HkdINiWOdfF1LwGwjBgn0FUguA/+WUfCs53O4kprj9Zyku8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787113105; c=relaxed/simple;
	bh=XPLw6YkZrOW0sx5xTgNlRw3EltyhnNiMUDVDSCCnpJk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uodFmZyEL6ELB4zrts6QYTJHu3eUM5LhWkObtOutufH6gFpf0+/Sa6E+qErfM//my8HUwdPvb45bYuako9NJ8NRJ38CBfc92kILza4jscfAe2ZiEuFfaK0prhabx7XolQozxGuVpbnU+s7qyZe75Mpd1UqM66eloxjeR275NhIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jq0pvR/H; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jq0pvR/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787113102; x=1818649102;
  h=date:from:to:cc:subject:message-id;
  bh=XPLw6YkZrOW0sx5xTgNlRw3EltyhnNiMUDVDSCCnpJk=;
  b=jq0pvR/H9gBgxIuJPnsZku5rryNc5NGk/Bq78ACGRPAWVl0qq/xvqagw
   zjqDIltbAa6kZFlrwNowISNzmwNgXAt/nWfytCXnIi9xd+JaXw5hQkj8W
   68EsP0CJQuy+rkHECAdbSWaOoCh+8zsFCFaJN23Lu+co89hY+HBmlFeo5
   gQO6Ad6zgwbRmkGKPY98jSr9C4QYJXXcFF6qgK3DQDDK3ap5Mzdm9n8sJ
   4sYNYPbgRuOdBm3BDGixDwrq78Mp08x1LGXTjlxG5KazhLjS6oB6DYinO
   ji7VZeF/4aRdSifOOmLUrAOQzgcRuHQZTJfx3fL8FgAxuEtO3y//BpCg2
   A==;
X-CSE-ConnectionGUID: Es/FJM9lQeClSKz0Rfim3w==
X-CSE-MsgGUID: vXsyGaoyQ/6z/IyB6vP9lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98208143"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="98208143"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 21:18:21 -0700
X-CSE-ConnectionGUID: dmat8gNLQ0Cyg/LdcKGftQ==
X-CSE-MsgGUID: aPKrCQxIRgayu4FIorxwig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="268936417"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Aug 2026 21:18:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwXkn-00000000esM-22aM;
	Wed, 19 Aug 2026 04:18:17 +0000
Date: Wed, 19 Aug 2026 12:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 648/740] Warning: kernel/sched/alt_core.c:3566
 Excess function parameter 'rq' description in 'finish_task_switch'
Message-ID: <202608191233.rYFoGOU6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   b735d8ec47d31db8e62d1925521a44d98c1cac2d
commit: ca8e0fde64fcfaf8691f1aa16d875770a5896ca5 [648/740] sched/alt: [Sync] dcb7416212e6 block: invalidate cached plug timestamp after task switch
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260819/202608191233.rYFoGOU6-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191233.rYFoGOU6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191233.rYFoGOU6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/sched/alt_core.c:102 cannot understand function prototype: 'int sched_yield_type __read_mostly = 1;'
   Warning: kernel/sched/alt_core.c:3534 function parameter 'prev' not described in 'prepare_task_switch'
>> Warning: kernel/sched/alt_core.c:3566 Excess function parameter 'rq' description in 'finish_task_switch'
   Warning: kernel/sched/alt_core.c:3534 function parameter 'prev' not described in 'prepare_task_switch'
>> Warning: kernel/sched/alt_core.c:3566 Excess function parameter 'rq' description in 'finish_task_switch'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
