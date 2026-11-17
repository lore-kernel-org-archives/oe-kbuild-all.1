Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885921;
	b=ElVnXKDX/P5ZcMSyie0OTm5WptwS9ncaKHDHb6Uq2mZUlJs+DKPwvnAgjno34eWd9r48
	 J/yvcxmLQ7e/h88xtE8JyZA4b1zyV/7SZl1CBWcPWVnpuffo+P4nlsV30K9BpOnOxOQAH
	 M6a2kHOYavtnFqRHyyAIt1RrshgMrtjB9c9Yb4UwxTMGVeSIvCooQU4e/xJjPmjQxLMe7
	 r67lg7EUnDSXO4SynVut+HXcVbnOcE0mlAZzyZtYgf06IFwB0lzHQR1kIN0NMuLt5QOCu
	 CPaaM8wCv0v5oVDfjSXXUuf+zfx89Gt/N69PQcl57A3N2Twhwgu86iXtScLor3u6vJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885921;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yVDG1Gk7ygQKGUgRUjY7JW0UlA9/38KhGtrgtiZJ6mM=;
	b=R8pdAfb8REUGaVbgYI1ixLhtiHy0HzJhiZI6et1VUjaso25veoeQWOCe8W2rCFDT1jgR
	 vyzmuTLlPjxJMlKyWjWgZSI2mtK5JlW2N4RQLEAQpV48Z9pQX5x8uOuSwWT8i1MMWLHko
	 0JieTk1jVHLZNiSrwpljD0tHDQrSZeNAvqiE/uqBzLJhaVXqj4hVS3YObTyAJHNaRlBGn
	 TKn1fc+SOaoFP/T/ru6YzQ5C0ISvbyQF52/BjrsNfYHGqFvW8ggVz8FiqkUuGOvpf5OdH
	 S2qrGGlV9Kz2PWNKhMF3IgQwmhT+luteUyeoZGiDJ7+R/KPK41SFD+aPtliEqqZjjcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EdqskhVY;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA720606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 03:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA720606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EdqskhVY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794885921; x=1826421921;
  h=date:from:to:cc:subject:message-id;
  bh=tZjrE0dl/kmueE0aYfePheEESEL2jEBYnOeHoJrTD8c=;
  b=EdqskhVYFIQx/JlMu+m5hhNHfU8eDwdUGb20SPFJg7RjvZwzdZe3NA3+
   si3JCQG0Hf0aYLmXeMje0H956XaCDJpdrZ/TBrW3fgOUHrVr46vbp8uyo
   Hf0f+wB4iBTZSNocCfMxZzC7PWiBgPjimgMeaJ94mOr1dWV67rGpw2LXD
   QwYvyE/eV8AW+7+s0baHIjPIaojXj+aQ9h/1dxd2KmXxJgW3G/9nTRBJv
   nPNsDfu+9UibOu5o7MxHD2ZHMamxVofhBZUKYQWyOyhPTuHUTZ+1uenmN
   hEJEGy46E0naQqZz2dwoj4vjseOVxf3QNpNFHxOmHG7vvy5jKJejfGfbR
   Q==;
X-CSE-ConnectionGUID: NGjJlbmrTeCoRB4G7Xsz1g==
X-CSE-MsgGUID: vHL6vAhDSCih4JgAB62ujA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3538299"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3538299"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 19:25:15 -0800
X-CSE-ConnectionGUID: JYDOOPYPT7e7D9B6GC3UZw==
X-CSE-MsgGUID: z8d8tsxqRgOtibaU7IOrbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9507153"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 16 Nov 2026 19:25:13 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT9oj-000000002x0-1sCc;
	Tue, 17 Nov 2026 03:25:09 +0000
Date: Tue, 17 Nov 2026 04:24:16 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-07 1/1] ld.lld: error:
 undefined symbol: folio_total_mapcount
Message-ID: <202611170315.a8L5usKO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   72c13ffe75dfb4b732147ff48ad7b64d69fead3d
commit: 093bce68a3d77381073cf569c91da0c78a0fa8c6 [1/1] BACKPORT: mm: vmscan: put rotation-missed folios at the LRU tail
config: arm-randconfig-2001-20261116 (https://download.01.org/0day-ci/archive/20261117/202611170315.a8L5usKO-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7864c0736a8a09670dfbfc513f1e9649799f2486)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170315.a8L5usKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170315.a8L5usKO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: folio_total_mapcount
   >>> referenced by vmscan.c
   >>>               mm/vmscan.o:(move_folios_to_lru) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
