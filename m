Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544BC395AE3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 23:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787961327; cv=none; b=Y8tkk2I+c2k4/2FR68s336TujYRcA9/sjYpI/ygvlRG1z5y8XLMNDCMRUqRjLp56X/SXV0t8lO/Z/Ad3ZIeoIzX69V1MFxTCc6HpveP7t5rw1QnPmhfNJ9WmD5YZBv82wU84gV6ZBbk2v4BjWghq5LnphGcj1Ii72yHhdyeovQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787961327; c=relaxed/simple;
	bh=ZE+6U5FN43648MEvuVtlubeJPXwNOPm7ow0Cmp90R6I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a1RHuOgDsDrJakU63OAG/x5fG3bJC5DUlI96a2+/NBWL6ZJENrCAQ+CK2yAKszjjONfdmKIbuBJI8cWa4GzQ3SJ3gNFG4+VK4n0tL7Sy5AcE6NbroL0GMKJTOlEueRsl4yaLz/LNaeyJ0KDwGgQd7u0Z44rZeRnD79KOThdHF0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLhAaMXH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLhAaMXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787961325; x=1819497325;
  h=date:from:to:cc:subject:message-id;
  bh=ZE+6U5FN43648MEvuVtlubeJPXwNOPm7ow0Cmp90R6I=;
  b=MLhAaMXH7LFFy0d7fkMcT5r0hYQ5EbIxTFJ1BRZQbiynjlTKs12KbCyE
   +iP4pugzV4ZFzBVuVYLxMS/j1ZdzC1peEE9pVuZUk41kk3yYVPyaMcXvJ
   Cu4G39durIF7caMWZwg8Rvyc4eoWh5qB7/pgMwMfByCk//7HtcFbjUlSv
   qwjnG6nnX5MsoxcvhCfN2I9hT+KQRTZpokQihgTkI0khqvIPQY/HYJ4Ea
   ojproYX4m4DOVAcRbhukI3xOwrSRCN/IAtoOc2z21yThKt+M/G+TvnvmT
   jQh1grAjRLZ8LSP0lowAYTjLor6magB2cSDknEW9XQd/sTNt8swRHsHH6
   Q==;
X-CSE-ConnectionGUID: jRPz9u5GT5uXVtCEI/RTyQ==
X-CSE-MsgGUID: oqD9yC3iTUSOqyuS+NXfaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="87604982"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="87604982"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 16:55:22 -0700
X-CSE-ConnectionGUID: SE2aB/BkTHegmoDkJTzxxg==
X-CSE-MsgGUID: XD96oEm1TS+w7axuwo5Eow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="272506719"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Aug 2026 16:55:22 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x06Pm-00000000C72-3jP8;
	Fri, 28 Aug 2026 23:55:18 +0000
Date: Sat, 29 Aug 2026 07:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 648/754] Warning: kernel/sched/alt_core.c:102
 cannot understand function prototype: 'int sched_yield_type __read_mostly =
 1;'
Message-ID: <202608290722.9BDndlJM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   424b4e76ee0219c5022ca153c4aaf342166aef83
commit: ca8e0fde64fcfaf8691f1aa16d875770a5896ca5 [648/754] sched/alt: [Sync] dcb7416212e6 block: invalidate cached plug timestamp after task switch
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260829/202608290722.9BDndlJM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608290722.9BDndlJM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608290722.9BDndlJM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/sched/alt_core.c:102 cannot understand function prototype: 'int sched_yield_type __read_mostly = 1;'
>> Warning: kernel/sched/alt_core.c:3534 function parameter 'prev' not described in 'prepare_task_switch'
   Warning: kernel/sched/alt_core.c:3566 Excess function parameter 'rq' description in 'finish_task_switch'
>> Warning: kernel/sched/alt_core.c:3534 function parameter 'prev' not described in 'prepare_task_switch'
   Warning: kernel/sched/alt_core.c:3566 Excess function parameter 'rq' description in 'finish_task_switch'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
