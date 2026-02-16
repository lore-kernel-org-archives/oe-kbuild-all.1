Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DBF276050
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 11:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240301; cv=none; b=twO5GI+j0A4qLNNi5+Z6aTHJBi7E7knCkkC3AxcLyKCvaWXLO1YVDVCbkpkKj6oLFIWMfXdBxPuGHcmxF6jyspVnsjXuYYjumLuTHO/8M69Tif6QaN3TtBEOYN40xKDICsAQgIguP5jEqeQtx8LNLIy8ov1ldZodqImG7ov6GQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240301; c=relaxed/simple;
	bh=NgkwYyDsNWzrG1PfFk5YRfJ3Cl3/rpE8I9N/J0f9q8I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cYLaf8vGt5IhXOCmN6qRuN8cI5x9+we0U7hSzJwZbWGAnjVmevT+F3cMoHZbSg2xSoQIzXq/7MORtrkYPCG0YXBeeru85oCIs0w5YiVCYksE8n1aBZVR7Q8JeiwS/t6H+JEPxE4k4N+ZUg7wtLLAYK1Sy3/WA2Toqwi8z6wHaeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KD9W57f1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KD9W57f1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771240299; x=1802776299;
  h=date:from:to:cc:subject:message-id;
  bh=NgkwYyDsNWzrG1PfFk5YRfJ3Cl3/rpE8I9N/J0f9q8I=;
  b=KD9W57f17BTTmVi9kC6ihcDwiGqiYeygd+JCkLh8VZM/9Zq0zoB4s7RL
   y9uWEYz1Fhmasn2y1Fy4E4jwojSVsb5qWyAySfFjoA7oxSalOI1TLTdW3
   r14BwKicVlG3dJbRrjPn0mWweuek5lldgTqOKhBUuJ8o2pAl85zcq/7Hu
   xZJT1KRBxd1OIH/aOTdFJpPZtB94BhMadNAwClL3pWYFyY4OTHBu+LfnE
   5xUh0Tz12sLmBYzXwSqwJXD52hrV4eSo+ccRyTNsK4JRqTgI4QqsJMNSP
   8SJdj1S9+HtJicBSr/kaRlDvFY+OiDf6Rl0Lz3qKeIqEFhv49KHWA8L9l
   A==;
X-CSE-ConnectionGUID: HcGK/72tSlGfiWW1zxXFVw==
X-CSE-MsgGUID: M7NuQagHQgWPow2aM7SBuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83041993"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="83041993"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 03:11:38 -0800
X-CSE-ConnectionGUID: F6c5KHcDSMiyPN47nSCV7Q==
X-CSE-MsgGUID: yAYqhq6lQV64G5aHkOmHPA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Feb 2026 03:11:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrwVq-00000000zcb-3eda;
	Mon, 16 Feb 2026 11:11:34 +0000
Date: Mon, 16 Feb 2026 19:11:34 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.19/prjc 596/619] Warning: kernel/sched/alt_core.c:97
 cannot understand function prototype: 'int sched_yield_type __read_mostly =
 1;'
Message-ID: <202602161957.flXpXLeY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 6.19/prjc
head:   2eb924832611618327cc5f722e79e3a8e0fb348c
commit: 65307436a25692a4cb2faef4ebb88d26f4208bad [596/619] sched/alt: [Sync] 653fda7ae73d sched/mmcid: Switch over to the new mechanism
config: i386-buildonly-randconfig-001-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161957.flXpXLeY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161957.flXpXLeY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161957.flXpXLeY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/sched/alt_core.c:97 cannot understand function prototype: 'int sched_yield_type __read_mostly = 1;'
   Warning: kernel/sched/alt_core.c:3487 function parameter 'prev' not described in 'prepare_task_switch'
   Warning: kernel/sched/alt_core.c:3487 function parameter 'prev' not described in 'prepare_task_switch'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
