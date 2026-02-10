Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EA133D4F4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717076; cv=none; b=Bx0pgxDoF88qtru1BgVZnALhbVEX9VE3Z9cnFK9y+VAyX0QIxl4E5riIHnyRL4xqWX6j5kfidFUJCdbxxHu0nXR5lfsKUJituhKfwDIzSpWgAW/ebcXkqDD03K0ORtUzJpO28qOJZbtcXGLdb56RWkTekhFi2IK6miay0wsrKGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717076; c=relaxed/simple;
	bh=jK+6VafxyfwIc9LyqyTDtEgz9ANZqONoTvIqvvVrsXU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nO4MgXwzeqVgJRoLirTBYlTIUA0MyV5+yvPnUzw2wM7LY6JCy020MpCduZOGMeqsDsQxMoblEeXdB1A5CqMfo+C276XEnejazBTpWzMyxTQ1WmrFN+R8pJKpikwMw4uHEzwZJevulbQIs9g21DKEHuO2URDAyRna0BBR5vwdR68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biB2iTrS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biB2iTrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770717074; x=1802253074;
  h=date:from:to:cc:subject:message-id;
  bh=jK+6VafxyfwIc9LyqyTDtEgz9ANZqONoTvIqvvVrsXU=;
  b=biB2iTrS15F37kcp20R9ILCaxx/AJGHNZgQaYmVt+ppJZpwD8M57UYKV
   4AXtPiMK4865etkUtYdv+uS+IjKkMracfb44WmTrnksn7aq2xXgXGOU3M
   GrAZAcblRHUXDN9/sItT6dcF8UPm1eKgotzkv5cVRC9kONopzgHSCOBM3
   lnfWLhmmIlTCEeCMGNl31/34YDAy9JebGkDdsNvqtQo454huldqh/WLVa
   ysaikAeUtMZfMD11iBDwbE0GN4GcMqrsA1U8EgIP3qSoiNqL+ZgL3oZit
   xW0HwjcKTUwh0Wy33oXo5w57Evxl80pW4FAQi4n74r2Fdp4RUfpjMMfup
   Q==;
X-CSE-ConnectionGUID: eNb2s7FxSjqtMEl5Yeg32Q==
X-CSE-MsgGUID: /4iAAij3S1ih/ueH0KW83A==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74443935"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="74443935"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:51:13 -0800
X-CSE-ConnectionGUID: w7o5xwV9Ri+qbf4rnfxEjA==
X-CSE-MsgGUID: jYJgD+W9QSWe3KpDjbYBvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211197611"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 10 Feb 2026 01:51:12 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpkOk-000000000l7-0LAF;
	Tue, 10 Feb 2026 09:51:10 +0000
Date: Tue, 10 Feb 2026 10:51:02 +0100
From: kernel test robot <lkp@intel.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: test_memcontrol.c:1654:17: warning: unused variable 'len'
Message-ID: <202602101034.nFsiZ949-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/T-J-Mercier/kernfs-allow-passing-fsnotify-event-types/20260210-084203
head:   5a5c17e0d4369a7012108067f9f74381fdc664fb
commit: 5a5c17e0d4369a7012108067f9f74381fdc664fb selftests: memcg: Add tests IN_DELETE_SELF and IN_IGNORED on memory.events
date:   9 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260210/202602101034.nFsiZ949-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101034.nFsiZ949-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101034.nFsiZ949-lkp@intel.com/

All warnings (new ones prefixed by >>):

   test_memcontrol.c: In function 'test_memcg_inotify_delete_file':
>> test_memcontrol.c:1654:17: warning: unused variable 'len' [-Wunused-variable]
    1654 |         ssize_t len = 0;
         |                 ^~~
>> test_memcontrol.c:1653:30: warning: unused variable 'event' [-Wunused-variable]
    1653 |         struct inotify_event event;
         |                              ^~~~~
   test_memcontrol.c: In function 'test_memcg_inotify_delete_rmdir':
   test_memcontrol.c:1711:17: warning: unused variable 'len' [-Wunused-variable]
    1711 |         ssize_t len = 0;
         |                 ^~~
   test_memcontrol.c:1710:30: warning: unused variable 'event' [-Wunused-variable]
    1710 |         struct inotify_event event;
         |                              ^~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
