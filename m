Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E7A1C01
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 01:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766282156; cv=none; b=IcTFYR9eYqB3KrzR0tHUwH07bCpC4qkPtZ2v6D7D09uomi7i2t0O40Xvvw2uVXbQbaGUGTqHuKfzwN4qbmH3PiNvJCG0rq+HNiXYKB/K4ZBKLt8KDzBD7KTOC8/R5aGwwRyRNUg/dmBmZkl1p4Ww3Hwxw87fsgeoB14UYemYnAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766282156; c=relaxed/simple;
	bh=RJtKqw3o5vPKYjAPbmN7ugvPBJVCSQKNSK54fzUQjJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rEBRB4aDG7tEZP8c0bfInTTJ8pLlUhZqaUbgZmlBiKpdB564vnHvOJMXUjPtxj0u6mUZhAFtw7oItEWYzt38ihdnmbU8ddGFKCm24s9nWu78LZs5qV5/rtLhZ6t4avoh/rp63zXCqd9C4E1p2iDf3aAqGrzVNFVVF4MFsCmhhtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5GGKXpK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5GGKXpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766282155; x=1797818155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RJtKqw3o5vPKYjAPbmN7ugvPBJVCSQKNSK54fzUQjJk=;
  b=G5GGKXpKLTDJwVTCJMhKRN3BwLO5SD1JdjIREPjvzw1LqaiUnMUh92RB
   PQdsg8LNbDb4I3n5kLASz6yeipahX74+Sgn4RfjfSTEcwd6eL/9uWgfW8
   2NcFC4jSJWvBcSOQpRdzs5gcSJVKNzwDC/gfEzwUS3okKF2UVv2Cwrr5O
   vLYFnUJZv6mZZO7QAZVTv0Z6/+2ArQxkIXFKte8UOTYG6KvLWw04+OhC1
   7RYJY66Jgx2x3cKGZ43DBTo3Ojtlhb+jh89VmlQVhjlkA3ZwDV4C0qiZY
   TaFB3hIfIMNAikE2zCNDJEqK6iNNoWsZQvqJZmOENUhICbD/jWQKwLyKf
   Q==;
X-CSE-ConnectionGUID: fJJ31qTJSuSSfjC/fZnjcA==
X-CSE-MsgGUID: REfU90hvRmKhwUYAylh7qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72051405"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72051405"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 17:55:54 -0800
X-CSE-ConnectionGUID: xhuXrbEKTnKuMmLMAA2ltg==
X-CSE-MsgGUID: pMWdvRwARcuZ975oKyu9mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198347205"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Dec 2025 17:55:54 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX8fm-000000004tU-2DSA;
	Sun, 21 Dec 2025 01:55:50 +0000
Date: Sun, 21 Dec 2025 02:55:35 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal:spec 130/131] Warning: kernel/sys.c:3490 expecting prototype
 for sys_setfsgid(). Prototype was for __sys_setfsgid() instead
Message-ID: <202512210207.9j8DJbUR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: ef6d3b3d9d43de47dc3cfaa386f7b1cb285e162a [130/131] kernel/api: add API specification for sys_setfsgid
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251221/202512210207.9j8DJbUR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210207.9j8DJbUR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210207.9j8DJbUR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/sys.c:1998 expecting prototype for sys_setuid(). Prototype was for __sys_setuid() instead
   Warning: kernel/sys.c:3251 expecting prototype for sys_setfsuid(). Prototype was for __sys_setfsuid() instead
>> Warning: kernel/sys.c:3490 expecting prototype for sys_setfsgid(). Prototype was for __sys_setfsgid() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
