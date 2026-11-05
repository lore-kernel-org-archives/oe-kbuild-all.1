Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855131;
	b=a8JN6FM0IkN43bbFZEN8xRrxktLoEaAznmnIoKLTGZbLvIcqW87HxruPakGZD9/zyWSL
	 lp6IFzl8LBkCaKIXZfxWbFrE1xqfs95FMXhlnrHZvH7EpXK5Z4IwKQla8z6dHQbAqsxcK
	 TZJeEfMKyFqOyvPUGTU98Re0eLkLTksp9TiPokSvB4/zM5qZYlFDusSY5FLu+2fxovkQF
	 yf6vudpYpYoYWJl133xDB/zt4HkXe0WWYXDYJVZ1HJoE/uX9bOU1UVLDddSf2M0TkHVVX
	 TyMHgZUHHup3CjLyN6Y8+ih1dbk5w7X3t2CaH2/cT1BSIgwPyPRN8dMKHb7cw5jHGJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855131;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=3Si1laCIrdESkx7Ps8vRaAmyVMtLPikz8ZBClVXS7x4=;
	b=XMDyFPdCvd5BaTRcKDXqHNi3FwKmhCfLQarDYHgA62iEPijHiqfk9WzLPm+kaA/taIiF
	 VIDGdKwferTx20VJ+DbsZzrYuZ5OqA3hzBtFuvJvFTGmDUbCK524hq6/GJq7t+Sc3f5S8
	 19+5q8padpXQmLtF3um/s4au2fnhggM357TTkTXXG88fKkhszVJfcyFb2EjMV0e9Gu2TA
	 iom927MYb8pcFUHXraGeA5jlGwQuZrue2p5TOT1Y4fGkvAxnxLnmfUNy/kJ7WmmYZtVCx
	 qLFUZkBSPTDJlREVnPkX1NM5VbjGPjQklYG3pAKhm5YTJlXI3uwUQ1nivvD8D+iAk9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QStC45lA;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F682606A33B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 05:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F682606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QStC45lA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793855129; x=1825391129;
  h=date:from:to:cc:subject:message-id;
  bh=R3HeUoUk8B0B3yPQSzUQW8NQF5DLo1dYi+IPwDQb2h4=;
  b=QStC45lATjqo8JjB+FuxDjEFIDLaKQwIFbhE0pPUUxWyeqFibrLeBEg/
   sqtwVC1coXaOs/hXHp1hicV0mnmFf5Mw3F8fW5DxDjp0huYf7jT1eZVH7
   pq9Gc0c/dpgTVYgh+xugbcT/omFXEVqXexEEsOgrhAQqlFzKhdLHJ/8SU
   YGa7jEQ1CxBVHM5eSYxoiTGojRfrBhCv0Svm5ZvACvRaSHLncKa3XM3k+
   yYrYiGdTVAVLZ2X+wnoNmbhCTanhrhCFE7oyz4SbxdJkueXCdpVKzvr11
   7j/tQ0uSxpU66mqDkiZDIxgk91R33MJ33AUSaFB2vl5TkIatxEGtcKF2h
   Q==;
X-CSE-ConnectionGUID: cw+H7AWwSB6SOdtpvvRCAA==
X-CSE-MsgGUID: IpwQZ/c1TeaxNLvw65sRMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2532072"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2532072"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 21:05:28 -0800
X-CSE-ConnectionGUID: CES5uHkKTdqMUFKcEBx/HQ==
X-CSE-MsgGUID: E8k3cTQ7QT2cNS7bV+AFgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6808398"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 04 Nov 2026 21:05:26 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOpfA-000000009WN-0nxW;
	Thu, 05 Nov 2026 05:05:24 +0000
Date: Thu, 05 Nov 2026 06:04:57 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 net/xfrm/xfrm_state.c:3320:17: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202611050658.xBo8x7Hq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   e1b556eb2d11c07ede833cd0a20d9b02914dec3c
commit: f2bc8231fd43a02f9d97252b3435869727054d60 [1/1] xfrm: check all hash buckets for leftover states during netns deletion
config: arm64-randconfig-r2302-20261104 (https://download.01.org/0day-ci/archive/20261105/202611050658.xBo8x7Hq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050658.xBo8x7Hq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f2bc8231fd43 ("xfrm: check all hash buckets for leftover states during netns deletion")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050658.xBo8x7Hq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/xfrm/xfrm_state.c:1737:9: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:1744:17: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:1744:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:1751:17: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:1751:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:1871:17: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:1871:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:1874:17: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:1874:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:2605:25: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:2605:25: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3270:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head [noderef] __rcu *state_bydst @@     got struct hlist_head * @@
   net/xfrm/xfrm_state.c:3270:31: sparse:     expected struct hlist_head [noderef] __rcu *state_bydst
   net/xfrm/xfrm_state.c:3270:31: sparse:     got struct hlist_head *
   net/xfrm/xfrm_state.c:3273:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head [noderef] __rcu *state_bysrc @@     got struct hlist_head * @@
   net/xfrm/xfrm_state.c:3273:31: sparse:     expected struct hlist_head [noderef] __rcu *state_bysrc
   net/xfrm/xfrm_state.c:3273:31: sparse:     got struct hlist_head *
   net/xfrm/xfrm_state.c:3276:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head [noderef] __rcu *state_byspi @@     got struct hlist_head * @@
   net/xfrm/xfrm_state.c:3276:31: sparse:     expected struct hlist_head [noderef] __rcu *state_byspi
   net/xfrm/xfrm_state.c:3276:31: sparse:     got struct hlist_head *
   net/xfrm/xfrm_state.c:3279:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head [noderef] __rcu *state_byseq @@     got struct hlist_head * @@
   net/xfrm/xfrm_state.c:3279:31: sparse:     expected struct hlist_head [noderef] __rcu *state_byseq
   net/xfrm/xfrm_state.c:3279:31: sparse:     got struct hlist_head *
   net/xfrm/xfrm_state.c:3297:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_byseq @@
   net/xfrm/xfrm_state.c:3297:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3297:33: sparse:     got struct hlist_head [noderef] __rcu *state_byseq
   net/xfrm/xfrm_state.c:3299:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_byspi @@
   net/xfrm/xfrm_state.c:3299:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3299:33: sparse:     got struct hlist_head [noderef] __rcu *state_byspi
   net/xfrm/xfrm_state.c:3301:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_bysrc @@
   net/xfrm/xfrm_state.c:3301:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3301:33: sparse:     got struct hlist_head [noderef] __rcu *state_bysrc
   net/xfrm/xfrm_state.c:3303:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_bydst @@
   net/xfrm/xfrm_state.c:3303:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3303:33: sparse:     got struct hlist_head [noderef] __rcu *state_bydst
>> net/xfrm/xfrm_state.c:3320:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head const *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:3320:17: sparse:     expected struct hlist_head const *h
   net/xfrm/xfrm_state.c:3320:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3321:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head const *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:3321:17: sparse:     expected struct hlist_head const *h
   net/xfrm/xfrm_state.c:3321:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3322:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head const *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:3322:17: sparse:     expected struct hlist_head const *h
   net/xfrm/xfrm_state.c:3322:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3323:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head const *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:3323:17: sparse:     expected struct hlist_head const *h
   net/xfrm/xfrm_state.c:3323:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3327:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_byseq @@
   net/xfrm/xfrm_state.c:3327:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3327:33: sparse:     got struct hlist_head [noderef] __rcu *state_byseq
   net/xfrm/xfrm_state.c:3328:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_byspi @@
   net/xfrm/xfrm_state.c:3328:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3328:33: sparse:     got struct hlist_head [noderef] __rcu *state_byspi
   net/xfrm/xfrm_state.c:3329:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_bysrc @@
   net/xfrm/xfrm_state.c:3329:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3329:33: sparse:     got struct hlist_head [noderef] __rcu *state_bysrc
   net/xfrm/xfrm_state.c:3330:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_bydst @@
   net/xfrm/xfrm_state.c:3330:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3330:33: sparse:     got struct hlist_head [noderef] __rcu *state_bydst
   net/xfrm/xfrm_state.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'xfrm_register_type' - unexpected unlock
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'xfrm_unregister_type' - unexpected unlock
   net/xfrm/xfrm_state.c:362:13: sparse: sparse: context imbalance in 'xfrm_get_type' - unexpected unlock
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'xfrm_register_type_offload' - unexpected unlock
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'xfrm_unregister_type_offload' - unexpected unlock
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'xfrm_set_type_offload' - unexpected unlock
   net/xfrm/xfrm_state.c:934:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:976:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:1655:9: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:1778:9: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:1814:9: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:2094:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:2113:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:2315:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c: note: in included file:
   include/net/xfrm.h:1971:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/net/xfrm.h:1971:16: sparse:    struct sock [noderef] __rcu *
   include/net/xfrm.h:1971:16: sparse:    struct sock *

vim +3320 net/xfrm/xfrm_state.c

  3307	
  3308	void xfrm_state_fini(struct net *net)
  3309	{
  3310		unsigned int sz;
  3311		int i;
  3312	
  3313		flush_work(&net->xfrm.state_hash_work);
  3314		xfrm_state_flush(net, 0, false);
  3315		flush_work(&xfrm_state_gc_work);
  3316	
  3317		WARN_ON(!list_empty(&net->xfrm.state_all));
  3318	
  3319		for (i = 0; i <= net->xfrm.state_hmask; i++) {
> 3320			WARN_ON(!hlist_empty(net->xfrm.state_byseq + i));
  3321			WARN_ON(!hlist_empty(net->xfrm.state_byspi + i));
  3322			WARN_ON(!hlist_empty(net->xfrm.state_bysrc + i));
  3323			WARN_ON(!hlist_empty(net->xfrm.state_bydst + i));
  3324		}
  3325	
  3326		sz = (net->xfrm.state_hmask + 1) * sizeof(struct hlist_head);
  3327		xfrm_hash_free(net->xfrm.state_byseq, sz);
  3328		xfrm_hash_free(net->xfrm.state_byspi, sz);
  3329		xfrm_hash_free(net->xfrm.state_bysrc, sz);
  3330		xfrm_hash_free(net->xfrm.state_bydst, sz);
  3331		free_percpu(net->xfrm.state_cache_input);
  3332	}
  3333	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
