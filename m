Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173273D0939
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Apr 2026 14:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298567; cv=none; b=p0X1HEJy3yZjVLsQAOnxlGVTh+wK48Oo7B5Fe2QVu/VrApgN14mEJVJj1iEArIz3mSKJP2LYywF/suDLg24Ers0qTNY7iJYFjAYk9fHEivnC2OIidF4fB/+9+bTImPv+kRIS3iAR4bQPq910Tcd1L1uzbF3TKQhueiJDXhtr1X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298567; c=relaxed/simple;
	bh=exHfeGygamQnQAoZsLSa8v/mogN1KQpZaVyRVyRZ84g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tApayt3PaOrizDVu68wl6m8gz26BbE63e3x25Hf9PGhzS1Kboi3EVVQ/OP7fAi/+YHCRbuyiBD5m6sWcL+y70piPfE23lCqAhDkIul4wb+DK4rWHWEGCMUkypPYV0sTq09dhbOXlIJ/ZD+m63+Br8BM0nNZOG/L6KPp2XLIRASY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6yDVwaW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6yDVwaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777298566; x=1808834566;
  h=date:from:to:cc:subject:message-id;
  bh=exHfeGygamQnQAoZsLSa8v/mogN1KQpZaVyRVyRZ84g=;
  b=j6yDVwaWtBeDe/wMTh3eReEtbb15CB0+egOdJ9LK1i8Cv1cNyVTlgeRk
   Lqz8Qh+g1QpUjwGNgMH0nU01ol/1V1fzuA7yKhARDVaODmv3kCmFvQgx0
   9C7X/P0ZZLY6g+Dy8E87SDqxqgtZiUD+sZj0q2nCXzQGeurJbXlqTKWcI
   J/8vRUX4N261arIw2411pjyrdLq5J/d/IS4T6MsiH109qUifvOrQI0C8o
   08pwl3e/RCgiWRHEz95Xvx3zAvy0gmd9rwm9sIiAdFcvkMEErWvA5SdDy
   uTqUtL2nlm+AXdX9Lr+x19utDg/mqgw2P6Yqt78Wd8ZA+roqR6Ge+dBca
   Q==;
X-CSE-ConnectionGUID: RaSTtV7TTDOt9xKwT4t2LA==
X-CSE-MsgGUID: csSpdR98RJG+7W3Ku7SQBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77891902"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="77891902"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 07:02:45 -0700
X-CSE-ConnectionGUID: k69p2l4+S1+AHM6ce0USIA==
X-CSE-MsgGUID: 3nSiPJRNSwuNFrl7PwEXUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="235409377"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 27 Apr 2026 07:02:44 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHMXq-0000000042H-0CHa;
	Mon, 27 Apr 2026 14:02:42 +0000
Date: Mon, 27 Apr 2026 16:02:11 +0200
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: fs/dcache.c:2833 function parameter 'parent' not
 described in 'd_alloc_parallel'
Message-ID: <202604271541.VrjdPgYk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/NeilBrown/VFS-fix-various-typos-in-documentation-for-start_creating-start_removing-etc/20260427-151003
head:   989c95f0a551cdbd2b85117c355692edaee0ce66
commit: 85041e0d39975f9db0db7d4ca310edaad54a310a VFS: introduce d_alloc_noblock()
date:   7 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260427/202604271541.VrjdPgYk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260427/202604271541.VrjdPgYk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604271541.VrjdPgYk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/dcache.c:2833 function parameter 'parent' not described in 'd_alloc_parallel'
>> Warning: fs/dcache.c:2833 function parameter 'name' not described in 'd_alloc_parallel'
>> Warning: fs/dcache.c:2861 function parameter 'parent' not described in 'd_alloc_noblock'
>> Warning: fs/dcache.c:2861 function parameter 'name' not described in 'd_alloc_noblock'
>> Warning: fs/dcache.c:2833 function parameter 'parent' not described in 'd_alloc_parallel'
>> Warning: fs/dcache.c:2833 function parameter 'name' not described in 'd_alloc_parallel'
>> Warning: fs/dcache.c:2861 function parameter 'parent' not described in 'd_alloc_noblock'
>> Warning: fs/dcache.c:2861 function parameter 'name' not described in 'd_alloc_noblock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
