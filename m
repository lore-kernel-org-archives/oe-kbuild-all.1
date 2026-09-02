Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACA247ECC7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 20:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381908; cv=none; b=uagSQVAIGpaGr6MWxkJmfB17KSNF2ZGc4K+LJeaHl0ENj53PV4UHf+0G8a4WcboW1IszvseUXiCiW14k5qQOKZuTbd7nMuRkagvrzy5eLchO4z55ssr4BO3ToZ08VEypeHfkPIPfcrUDaBzT6El1FQ/EWWGkUZgq82QBEGHPmcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381908; c=relaxed/simple;
	bh=cJqtIbT+/edOKUncoX8184OUAae7prg1jC6ykyLgmKA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HE/zaBQy3RvcPP9wfXk+rqVq8l2M32rWM17M09ok3dRWADQgogCB9NBFkJJ09ESOMfufczg8ABSrJSO8uPTuVObUf/KEtHztNfJLsqAgMxJwEDMZK0QoXbyMznrNENQsCJ7mJl/OGldqIV/4P21u74rwvaFK7RmjOQ+mQpyA3CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuxEDgxW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuxEDgxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788381907; x=1819917907;
  h=date:from:to:cc:subject:message-id;
  bh=cJqtIbT+/edOKUncoX8184OUAae7prg1jC6ykyLgmKA=;
  b=nuxEDgxWoCex/5cr5x2+LP4iLFY1/pNHtTvNxXN6k1rAe3K5KqCg1n2b
   VK7Hng91WAag2pD0Nh6+4y9w4ggn1nNRXJtD9LhzcCOSX891HD8OIiwy2
   8RWI+9gQ0GzhJcuhgFsBXyYYwb6S7j7SWecXHcbOgi1RduL5m9LlryfKV
   mmL32gteGm49i5IUsILcu1F5D2kC5HeFZ43I8FQJ7Zdcglr5mlAi+Jm+x
   otHhzhycVhA0wkuGe0WjVj4IOrdQCgCTIOZkZe2ryrmBS6XppKm5ZFCSN
   jgmsNuBIvSl8iTRgMT2rK2NTwb8hTqJP0c+ZE9VfshAoFsqwhLzqE7ebA
   A==;
X-CSE-ConnectionGUID: HOeTO8UVT1SUntR3a3uY8w==
X-CSE-MsgGUID: nFHEG7XhQxivX+J/BsnY+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92554898"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92554898"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 13:45:06 -0700
X-CSE-ConnectionGUID: 1fXAzYBsQxeMsvvrk0qKvA==
X-CSE-MsgGUID: Se5KzlWBSgGRZDWhIKfHIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="265196699"
Received: from igk-lkp-server01.igk.intel.com (HELO 05545efcfdd3) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 02 Sep 2026 13:45:04 -0700
Received: from kbuild by 05545efcfdd3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1rpN-000000000UZ-3t5D;
	Wed, 02 Sep 2026 20:45:01 +0000
Date: Wed, 02 Sep 2026 22:44:27 +0200
From: kernel test robot <lkp@intel.com>
To: SJ Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 136/167] mm/damon/core.c:1418:2: warning:
 unannotated fall-through between switch labels
Message-ID: <202609022203.Jc30tB50-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   aeaf89c6296bfe16ada0b791acafc3859ab4e926
commit: 2770a25234fb67de711dfd89751ecb2afc0e654f [136/167] mm/damon/core: commit range_{min,max} for probe hits wsum filter
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260902/202609022203.Jc30tB50-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609022203.Jc30tB50-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609022203.Jc30tB50-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/core.c:1418:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    1418 |         default:
         |         ^
   mm/damon/core.c:1418:2: note: insert 'break;' to avoid fall-through
    1418 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +1418 mm/damon/core.c

63f5dec16760f2c Sang-Heon Jeon 2025-08-10  1398  
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1399  static void damos_commit_filter_arg(
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1400  		struct damos_filter *dst, struct damos_filter *src)
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1401  {
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1402  	switch (dst->type) {
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1403  	case DAMOS_FILTER_TYPE_MEMCG:
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1404  		dst->memcg_id = src->memcg_id;
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1405  		break;
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1406  	case DAMOS_FILTER_TYPE_ADDR:
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1407  		dst->addr_range = src->addr_range;
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1408  		break;
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1409  	case DAMOS_FILTER_TYPE_TARGET:
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1410  		dst->target_idx = src->target_idx;
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1411  		break;
0431c42622612a9 Usama Arif     2025-02-11  1412  	case DAMOS_FILTER_TYPE_HUGEPAGE_SIZE:
0431c42622612a9 Usama Arif     2025-02-11  1413  		dst->sz_range = src->sz_range;
0431c42622612a9 Usama Arif     2025-02-11  1414  		break;
2770a25234fb67d SJ Park        2026-08-25  1415  	case DAMOS_FILTER_TYPE_PROBE_HITS_WSUM:
2770a25234fb67d SJ Park        2026-08-25  1416  		dst->range_min = src->range_min;
2770a25234fb67d SJ Park        2026-08-25  1417  		dst->range_max = src->range_max;
9cb3d0b9dfce6a3 SJ Park        2024-06-18 @1418  	default:
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1419  		break;
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1420  	}
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1421  }
9cb3d0b9dfce6a3 SJ Park        2024-06-18  1422  

:::::: The code at line 1418 was first introduced by commit
:::::: 9cb3d0b9dfce6a3258d91e6d69e418d0b4cce46a mm/damon/core: implement DAMON context commit function

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
