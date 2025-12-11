Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5402831A543
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765481399; cv=none; b=JldwxvPG+iNcmrmiNBsACfGXsTYEREzBUlAJk5Cj+Y4a5tzagC4Zi7FVALyxquiOdE0xrTE6pXa4+MZZ3Q0kFYrqnixFx9qK30D9icbh/ixt5tEEZTgg7ADUJG1fEEugZ2l00nFmvXQj0LqToQ8nkavhB8aKwodmLqvBoDCNUUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765481399; c=relaxed/simple;
	bh=p54CILAE1NL+KktMZB32ATsjf38Jhmd6Yli7ubfjg0Q=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/H0HH/NEzY/BM7lk1TIfGvwV0m9ETPH0yHuV3dXfApU84KhTxLPVyxKBtctGwOh5d512Qb1Pp3O98xU76aNLwILWWoDHrkvzlWTmbtTGusYu7qTRHdvb/8uywRgEtODLI06iZc1fmA81lgHLr2NfrDxTUHpwNsnU7nw7SXuWjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8SxhK4/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8SxhK4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765481396; x=1797017396;
  h=date:from:cc:subject:message-id:mime-version;
  bh=p54CILAE1NL+KktMZB32ATsjf38Jhmd6Yli7ubfjg0Q=;
  b=W8SxhK4/aAQ1d8g+xwZZ57teUCWAQYvQX1sJRwfKNh02cICtzrCOF2zM
   9+foGfdqThoQDLpVBtv05FFVrFnjABrMzQE0eFmFEw8gJizStdVldJbb6
   CQ/kPAi0GYjuzVXRemoCUqGsG6hlHh2DFYlOQ9kuGeSa8vuzGsKvSo6l2
   GdEXwsq9m66JIvFjxZec5HXWod5gN0JcYQmMrpJJmrUT6eP+Kpu9UdP5s
   /s2GDtS9nB5N1cG3so2b/wwYDGxFmmrSXh+XK+6k4sEHlt7YbNS7t9lVS
   2oO3mmxhkVqgPiFnGUahAwYABy6bR/FCYW7TKkX0UrmGo6pakAx3+Yj/x
   A==;
X-CSE-ConnectionGUID: 2+djaNYkSUOnZbTd8JM0Gw==
X-CSE-MsgGUID: XzrisHsHR7izzhAj/ycpmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="90125136"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="90125136"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 11:29:53 -0800
X-CSE-ConnectionGUID: RXx4yKhXQPe+MFhB/KieoQ==
X-CSE-MsgGUID: JFTxIli9RZ+FRRxBJCCAww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201791278"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Dec 2025 11:29:51 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTmMH-000000001Bg-1jl1;
	Thu, 11 Dec 2025 19:29:49 +0000
Date: Thu, 11 Dec 2025 20:29:23 +0100
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kishor408 <kishorx.buchi@intel.com>,
	Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>,
	Aravindhan Gunasekaran <aravindhan.gunasekaran@intel.com>
Subject: [intel-lts:6.12/emt 9/9] xdp.c:4:9: warning: "_GNU_SOURCE" redefined
Message-ID: <202512112005.J5rR2skh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   aac28a88afc1d68448c7e5672fed4da83e10fe8b
commit: ce6a6d2988ee17b952e2ac9e1ae1868ad093e777 [9/9] tools/bpf: Add xdp set command for md btf
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512112005.J5rR2skh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112005.J5rR2skh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112005.J5rR2skh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> xdp.c:4:9: warning: "_GNU_SOURCE" redefined
       4 | #define _GNU_SOURCE
         |         ^~~~~~~~~~~
   <command-line>: note: this is the location of the previous definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
