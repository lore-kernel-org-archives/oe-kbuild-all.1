Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518472;
	b=qXwrCujCVXp/+wvyE2B8kHoJ8Qq+QRIITa1VJAtwo3sMr6BzhQ3BNO9kXy1rcSStS2wd
	 RM30R4LyVK13QaEw+3XB9H3koFfznPzB9T/hgzOtfk3RwpRohYBqVIDbkv3Olq9hKJogL
	 AIMWg+a1/ITVJW1zG5hDQfh1LluJN1UWaopG7QyHVZRDZ4oizcV+9Ztod5Xw0c9gaIrdy
	 UXyU5lz0CXHZQoTMgmjqc1gmUhqYMHpJPITrFsXxq7FRLaJYIo/KmpLiB4qhFvbaBfX93
	 3k0xQX5+qcjdcpaZqLZ/GJXMWJrbJdvSWhBRJQl0fzHIKNeCInTE8mYxDrA4aTb/oMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518472;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mtkUO4l/EDx0qjj08HflpQcLxDfz4VYpO2be4/eOvKU=;
	b=PSjS3oE/VcwgI6IQo6vVlW65TKff/B/wX4Gw5we3iUb4s2zyJ7VyWGg5bFm/lvXGP9tL
	 HG6jWdkN2KcryEeLT+sckIBNU5XlxNJorefBazXupn9FsgrXUCFEl1j6fH5EfYDipuJwi
	 KyD4nZE6131WOUkvKxZYAefi8E5V/cX1PqmXDhA2eGDhECrGGqgDvN/nTtjWY23wWBk5r
	 4oO3oUm2nX1VPrfelStMaqAy/dnUdDMNcaEocD0k9s0NgQS9bWvXy+TXuthmY54sAhKz6
	 tUez+5iTf63WVgMu0S7frTSPVNtkh34ertxYpqJreavQpKfVPGtcVoDZloaEMB+Cxpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KvvpJuA5;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24479606A321
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 21:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24479606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KvvpJuA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794518471; x=1826054471;
  h=date:from:to:cc:subject:message-id;
  bh=dbRmGMHAvM6mCZ7s56NaDMhVjgRmnrwVFnFgM/xI0UA=;
  b=KvvpJuA5OPwxP+o/3MZ2otY7kZWHft1Tbl5iQzncQkTr8QqcCSmGBzLi
   8QAStD06fsXUzSrKMd1CQNc4xnX1F0fOUhsIuTEjzM384PR4/uDcZ2CEJ
   Lp5v3sK7Tz8P3IDCgBUGFuHK65UvmGi2Ym095C/kyExeyIF+6Y+3BdqDG
   bRml0MAOtZXiCPNNMuP+FN7adb1caX1YtXOm0xdR7Q/8CFgfa2vrx4L0v
   WZZdwjVBwi3mziWjyhaIHZCsStMg1dUOTR6RUXEMEqVViIxG6DuuUqEEb
   s/AFB7QVDIUY/G8F2SXxCwX77EnheER3rXbbplBKeRusTcR4KW0WSacwv
   Q==;
X-CSE-ConnectionGUID: q0h7uZBgSreh75vZKCpP+g==
X-CSE-MsgGUID: TOWNS/FJSEOnsuyBeQKVWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3352850"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3352850"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 13:21:10 -0800
X-CSE-ConnectionGUID: 5KprF6oARuiz5Jh5d9dQeA==
X-CSE-MsgGUID: fDxc8okuR6OSQmpsW6pvTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8695515"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Nov 2026 13:21:09 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRcEE-000000000xq-3tuS;
	Thu, 12 Nov 2026 21:21:06 +0000
Date: Thu, 12 Nov 2026 22:20:26 +0100
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: drivers/misc/lkdtm/lkdtm.o: error: objtool:
 execute_location.specialized.1+0x34: can't find jump dest instruction at
 lkdtm_rodata_do_nothing+0x0
Message-ID: <202611122247.EuFOb7hi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ee83899302a0457a3ba47464a13e8682bd7ba27d
commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 kbuild: distributed build support for Clang ThinLTO
date:   6 months ago
config: loongarch-randconfig-r2106-20261112 (https://download.01.org/0day-ci/archive/20261112/202611122247.EuFOb7hi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611122247.EuFOb7hi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9f2aee8f7d18 ("kbuild: distributed build support for Clang ThinLTO")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611122247.EuFOb7hi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/lkdtm/lkdtm.o: error: objtool: execute_location.specialized.1+0x34: can't find jump dest instruction at lkdtm_rodata_do_nothing+0x0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
