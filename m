Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D416E3816E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 11:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302719; cv=none; b=ceMl058V2ieFUkUuj3ogviG6xYKMuaMwOtdxtqOqRrENE0cL0q/m+ZCK7XI0s+EiMTlsycZDCwhK0P5SQe2TVpwLu1WOL1r/ONUdw0vmQR9a6Obau1e8dnnItoz4KepSba39+98D4jW3vwqpqekCA81Qb0hJ4dmonrTeXoH0PTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302719; c=relaxed/simple;
	bh=0rjAqKUHcfzqGBIHo6ncRjFbV9Cym3/KP966XA/4YW8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gC0HYFyNrIlP1ZVzNDgv1ILWHWdUS2JDrfAdIgIkPsvnkgFbczlp+OLSGyoZFciI7axDOV9QCMChz2WDowYmMDX+prEcPZ39Ow+TtsDK5bgFb3wfIFcUfywYvTkFKPI7TufXnP58zjUJtmhYqlcx6OkD5x7mBrE1EUsFCCcUSPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0wUWyJI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0wUWyJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768302718; x=1799838718;
  h=date:from:to:cc:subject:message-id;
  bh=0rjAqKUHcfzqGBIHo6ncRjFbV9Cym3/KP966XA/4YW8=;
  b=Z0wUWyJIzMQnmteBNoSxs5YstkpYg6K2e59CGXh27vhZF3SonmYvzi53
   03rx/2TsR6La83K6PXWN0OPLXpy3k2MYBV+Q2MAm4w9FRzs3yCrykBbcT
   RPDJJDjxUcCJk6U0nWrMJxI1fCEbrI8Ea5fM7JsL4UxTX5ffQi5Zwpa1w
   XTOYjhktAeZ1KW7XOWzDt3HsEIrcmOifEYQAHSf8W37fA1y9Ee1FeoSmO
   AYWFcloMvn+arOjrhpLi3+do9+jhpKdV29h2aiLJtvNWsDUa51lIcR3Qu
   TJUPA8kLF4MA2qlW7+4RNNy/kouLa5dnS2KvtX5u42Erelr9V77qAZFkn
   w==;
X-CSE-ConnectionGUID: JqC891seSa2jaNuGyzp9jQ==
X-CSE-MsgGUID: vezjb0NwQFGGTXK9kSPLxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69493878"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69493878"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:11:57 -0800
X-CSE-ConnectionGUID: 5BZBrloQT0aAxmNjGS8SYQ==
X-CSE-MsgGUID: hvaB7WnYQM2BfulG5eKbCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204634449"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 03:11:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfcJV-00000000Ee0-3UBK;
	Tue, 13 Jan 2026 11:11:53 +0000
Date: Tue, 13 Jan 2026 19:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] fs/eventpoll.c:2148:
 warning: Function parameter or struct member 'ep' not described in
 'ep_get_upwards_depth_proc'
Message-ID: <202601131924.LjzFZVft-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jann,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   da2f8a0455be357d97f38510b842e713fe3fc796
commit: 7a2125962c42d5336ca0495a9ce4cb38a63e9161 [0/1] eventpoll: Fix semi-unbounded recursion
config: x86_64-randconfig-016-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131924.LjzFZVft-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131924.LjzFZVft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131924.LjzFZVft-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/eventpoll.c:2148: warning: Function parameter or struct member 'ep' not described in 'ep_get_upwards_depth_proc'
   fs/eventpoll.c:2148: warning: Function parameter or struct member 'depth' not described in 'ep_get_upwards_depth_proc'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m]


vim +2148 fs/eventpoll.c

  2143	
  2144	/**
  2145	 * ep_get_upwards_depth_proc - determine depth of @ep when traversed upwards
  2146	 */
  2147	static int ep_get_upwards_depth_proc(struct eventpoll *ep, int depth)
> 2148	{
  2149		int result = 0;
  2150		struct epitem *epi;
  2151	
  2152		if (ep->gen == loop_check_gen)
  2153			return ep->loop_check_depth;
  2154		hlist_for_each_entry_rcu(epi, &ep->refs, fllink)
  2155			result = max(result, ep_get_upwards_depth_proc(epi->ep, depth + 1) + 1);
  2156		ep->gen = loop_check_gen;
  2157		ep->loop_check_depth = result;
  2158		return result;
  2159	}
  2160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
