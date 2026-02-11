Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6590C1D5147
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 19:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770838276; cv=none; b=Rhjb1bey4kiQs+as7kY7PJenxSayJnczZRstI6yQc9C3idnTp0z0ea2UUMKPBu5QwuoC2YB4/tJSBNEbpBHaWqC52xySDCPqlHuD95vo7+4WBqnA/iL8Qv7KEy462wXTDj0zSsGpvunJW6zKeyoijSGFEyCf8Jv9K5H9w5ryowQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770838276; c=relaxed/simple;
	bh=eXtqXWOAiLp1HxCXzi5P3EqHCoB5PtSA/CMSftpYGWY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GPecvrglNRRwAuvWHYvGRVzppaOrAoPyYkeoizSz93imcGiNIP9VjGS9vpPUJdk98xu5AesesICQISi9FvdndzANYCn2l5XQm8XiNmzv/AjEVEKbR6ut/4T/BIinQilWuXahw/CipvaUAM3ZmvJ8HMh5X9c0CivJggmhAgKbVZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfoAqeBe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfoAqeBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770838275; x=1802374275;
  h=date:from:to:cc:subject:message-id;
  bh=eXtqXWOAiLp1HxCXzi5P3EqHCoB5PtSA/CMSftpYGWY=;
  b=AfoAqeBeLtuta4UEwp9ZBwaKYrXSteXWzEjPUhfuD0nNi25VWm7cGh7J
   6d/S+DZFWu9QdleHdwc0Ii+0eIchAMjH2+iG02UMkkA6BjEtrOgtsV5Kz
   wI2FgVPGrA6S+L9UshXM+bwYdNmPWSIpnyxGkslp53SEcSXqLkTPeScJU
   qxi/cMSP3U996JBDDsM0OrsWH5KbJf7sxlO9Hi/QhRGoO9yb5j1ttDHVK
   MWH+7M8+3GI0BqCDWALmvEOgJ3QMluQjsgjUbCMS9Q1ZrABA2MVkoHUzR
   F7FQ1zpJrahzTGKDCiEzaI9tayME/svazq8TNyzS4OfBlHAZ6qQdQxgVV
   Q==;
X-CSE-ConnectionGUID: AS97l0dDTy+5mrBkPCQP2g==
X-CSE-MsgGUID: QkuzBQp3RQ6hZpiK/2Yw7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75620991"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="75620991"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 11:30:48 -0800
X-CSE-ConnectionGUID: isMCfWKPTnK6xRdkgQdwkw==
X-CSE-MsgGUID: SQtnr8x+Q8GjsqDis9gJJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="216603325"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Feb 2026 11:30:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqFvA-00000000qJ8-0Zm0;
	Wed, 11 Feb 2026 19:30:44 +0000
Date: Thu, 12 Feb 2026 03:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 7/11] ld: fair.c:undefined
 reference to `__udivdi3'
Message-ID: <202602120334.u3lyYCh4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   0900b7ccd9fd82ebb9af824a43994c4d20c7cca8
commit: 5f7dcdadf71c0b5c475bc3ffe4d4f69be7bb87b5 [7/11] sched/fair: Use full weight to __calc_delta()
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260212/202602120334.u3lyYCh4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120334.u3lyYCh4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120334.u3lyYCh4-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/sched/fair.o: in function `entity_lag.constprop.0':
   fair.c:(.text+0x631): undefined reference to `__udivdi3'
   ld: kernel/sched/fair.o: in function `update_curr':
   fair.c:(.text+0x19d4): undefined reference to `__udivdi3'
>> ld: fair.c:(.text+0x19f4): undefined reference to `__udivdi3'
   ld: kernel/sched/fair.o: in function `yield_task_fair':
   fair.c:(.text+0x1b41): undefined reference to `__udivdi3'
   ld: kernel/sched/fair.o: in function `wakeup_preempt_fair':
   fair.c:(.text+0x3aa6): undefined reference to `__udivdi3'
   ld: kernel/sched/fair.o:fair.c:(.text+0x3e04): more undefined references to `__udivdi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
