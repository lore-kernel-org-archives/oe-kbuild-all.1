Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422710;
	b=eYNykiFgNn1Gej0BHjg/vmu2aPhfQL+7bfBNy3+An/RsodzzCAE8+HQ0dmluGTqXQnqT
	 t06jEG4C3xv9vM69Uk+/nNW6GXE6EXKI/i3UqCK/JmWJrQlSvHRCVdEiuT5s0dqpWIhD9
	 fqHlDxQ8dV4bopSvibo34A+HC5JsmMVyQEBi2O0PeXPirOyEXRyoZg5yDWtyqi6vVGs6y
	 W1q7hflEWTOMs/x8R9DQQEGww+rpjrJzsqsi56ci0dKyohn9rcshdQYo2BwVd6tvYCiyM
	 e1FgPL/gtKQwBtr+R9KOUfTPMWeYum8cNO65vBrTq9Zcz2rywSPXxovT3IFGpye+gdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422710;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KCrLashFMP9pKf59FX3I9IKUbcpdmWpr6rzqttWL5AA=;
	b=RQvHN+R2Ue/moCKg4hf5GL/hgnkgegLarsZZ1MiW0GEfKaS0/7VkMB0A/qfQhTdgY9wI
	 74uhGkHk0KIjA2yCZ6rNcuMQ+6IG1oKvcD3Mzab0hJ4/9xW6im5cBLG4YBP4bvSwP/VV5
	 6a83WbGKQiUcpX7IkEUdtRt6U9TyTeramICDYX3/xhjjL2iG10T5Kiu8pg176Ry0cIXhI
	 QbRmV8D72XEoSpO83nUSufheDt5y/XujY0xWAIiRw3H9NQO6ftM1Lhw5Ashu6WE98jty7
	 Ef9kONHQVfXW4fH6UX/bdl2fz6tRxrAd7EKjFfx13vIVGz4EzhBJXzZD+okxJZPH3cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EWTZtXcd;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E688060705C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 15:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E688060705C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EWTZtXcd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422709; x=1823958709;
  h=date:from:to:cc:subject:message-id;
  bh=SmkzNaE4if4jo6SpMbH/s/C46Xnye/kRD5iHn28a2bU=;
  b=EWTZtXcd7zSq6WMjC+PCg4RWXsKS7PETnOB4ANxeUZTJuZintN6mhs8e
   D3Ib0STcznTg+Drm1tS8I9A0xX+YTPeF6iV5GnKRVm/aT/OnsMh0GrkyG
   1Da37E/ccqmKg35Qcsfy5795hL8hhsnn/C2FTyXWPxchKaLQfIM3YmWUN
   XehzusxAS7tVCfbauiBJq7EkS+2Y1O9qQOXmv0UL9+q99rMv5beAzVnJt
   r0VkB2cazGw3cOdQNh5nwSy3hI97hs7oBJrgUr078wjK+HUoRjMlz4K61
   0KpKVVp5Rdd3mwaLxpRyiBlqHGieJiCClx+1Jv57oZcI8gzO4aydg3M1Z
   g==;
X-CSE-ConnectionGUID: V/LKzWo0S5WaNKW5Mz7X9A==
X-CSE-MsgGUID: jW2PQTOuR5G7nt6kPSVizw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="975291"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="975291"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:11:49 -0700
X-CSE-ConnectionGUID: 5HD7NlWPSLWTem8FsSej/A==
X-CSE-MsgGUID: mKRREz1RS2SF0T3n+ga7Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2448194"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 19 Oct 2026 08:11:47 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIp1d-000000005fT-0D3j;
	Mon, 19 Oct 2026 15:11:45 +0000
Date: Mon, 19 Oct 2026 17:11:18 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-rm-mmx 1/1] xor-core.c:undefined reference to
 `xor_block_avx'
Message-ID: <202610191755.gRsj0q6S-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-rm-mmx
head:   6f82cce65eef74ed32bdf4f86b884f3fabe950c6
commit: 6f82cce65eef74ed32bdf4f86b884f3fabe950c6 [1/1] raid: remove MMX optimized code
config: um-randconfig-2001-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191755.gRsj0q6S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191755.gRsj0q6S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191755.gRsj0q6S-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: lib/raid/xor/xor-core.o: in function `xor_init':
>> xor-core.c:(.init.text+0x3b6): undefined reference to `xor_block_avx'
>> /usr/bin/ld: xor-core.c:(.init.text+0x45c): undefined reference to `xor_block_sse'
>> /usr/bin/ld: xor-core.c:(.init.text+0x492): undefined reference to `xor_block_sse_pf64'
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
