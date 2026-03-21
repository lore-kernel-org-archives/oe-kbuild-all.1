Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF7222A817
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 13:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100293; cv=none; b=RchU5Nsd7WBqUlukab7961SE6MCLSpZkkbxU9CrK1QL5VaoTGyZ2wM6pibCvbD/JeMTJzBePQrna7PW+9owHv6yZKhwkSvLOg41qcdTNdsWdgJBZMtCZlmSObg9nFjJWcpG9TBdWStCEOYLgaFyntaC5YLmLMyqkSKMYPaK07Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100293; c=relaxed/simple;
	bh=4/z0nKByGi+Co4inpq4hOfsa50rZ5qh7Sa+/CLQBnMU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dli0XJUk1rkC3wi/muwWWqz3u9hdEGLntKTZRFKO8TH6voyCyNe6gXlX6BHCk58d7YXLxZzA5JwwSs5ETBJjukRmASQkAQh/aq8G6sjxM87yGfNeouNTQyp61oEOVB7ob3RL6vUKftXpcJoqsSuerLiDWdb/sGHd5CQjNEGNgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/MB8xob; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/MB8xob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774100291; x=1805636291;
  h=date:from:to:cc:subject:message-id;
  bh=4/z0nKByGi+Co4inpq4hOfsa50rZ5qh7Sa+/CLQBnMU=;
  b=T/MB8xob871R5JyZHDnh1JSQFKNvH/juGn/JqENMiU6DahCO+n9QtZ9a
   GH0sXIfhTRxn2Klgs2pr61I7oFPJUmZ/VA1O/7xmPHYmYD2P70OPSNucK
   8DQW/zrV50JDsGvV0HJWE/RTxKWvZthxITAX0RFms/VnNSXzfdjYqO1N4
   NPTGJS3cSth07jgJn4MmcX4uVk093C+aSuAtlehiEvAlN6bY7Csh3dG+P
   mC5j+qhV9GuqfOzcp8iECsNjglFWS3+mEqC7iVc42I/JBlSwXoGUSCK/U
   JrykNNxPRlA4JlE2IOPRUUUBJDqE2cMuGID5pOu84vchs7ggc9zb+HE8h
   Q==;
X-CSE-ConnectionGUID: QI5dnOmXQ9GgtT6w4sfB+Q==
X-CSE-MsgGUID: yb03/s/NRGmxrSIemIcGjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86245549"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="86245549"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 06:38:11 -0700
X-CSE-ConnectionGUID: SK6gfv4qR1GKudbAqsyCGg==
X-CSE-MsgGUID: h7CWsEwOS4GFFeMl7XoHGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="246590016"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Mar 2026 06:38:09 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3wWl-000000000pH-1fVB;
	Sat, 21 Mar 2026 13:38:07 +0000
Date: Sat, 21 Mar 2026 21:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:lib-raid6 29/33] lib/raid/raid6/arm/neon1.c:28:10:
 fatal error: 'neon.h' file not found
Message-ID: <202603212125.haCKM5r2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git lib-raid6
head:   83a13a72f6f47b7ba7d26a200575edb70bf23c70
commit: 252652e3d689463259c19e406e5de766a6674d0f [29/33] raid6: move to lib/raid/
config: arm64-randconfig-004-20260321 (https://download.01.org/0day-ci/archive/20260321/202603212125.haCKM5r2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603212125.haCKM5r2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603212125.haCKM5r2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/raid/raid6/arm/neon1.c:28:10: fatal error: 'neon.h' file not found
      28 | #include "neon.h"
         |          ^~~~~~~~
   1 error generated.
--
>> lib/raid/raid6/arm/neon4.c:28:10: fatal error: 'neon.h' file not found
      28 | #include "neon.h"
         |          ^~~~~~~~
   1 error generated.
--
>> lib/raid/raid6/arm/neon2.c:28:10: fatal error: 'neon.h' file not found
      28 | #include "neon.h"
         |          ^~~~~~~~
   1 error generated.
--
>> lib/raid/raid6/arm/neon8.c:28:10: fatal error: 'neon.h' file not found
      28 | #include "neon.h"
         |          ^~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
