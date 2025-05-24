Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B66B1DA21
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 06:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748066667; cv=none; b=DMDG+f3ly9dTLjanIlPlFzit/1DPzYIAwyN02OqoKSxk6KCpG0gAnG5qHo7MgWNyG6IcWsAzhXg6W8eD3zXgq3eSJdCcwyY3g4A+qCZnXX7+fbG6o/VpMvMDchiJLlNYnhCQG/lF+yZhV0s/wJGoDn9TjTj9sC3eEjELoV9swoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748066667; c=relaxed/simple;
	bh=2awZlQbYllWdG8uxL3UIGI0+QJOBoTGciwkhTETw82M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bW2abqwBHJ1e+6/2q8xB2aNzqbe3aSwCi3AW1puOTjJkvM71OsVp/P2+sWF+dgDTW31jLH6SFiWBel6PNNWwnsIi1KvP12z2y27pK+/mN3+ztPSww39OJjvLuc6z2thclBZoWveClm1dPINdK4WXJS7oam1Dwz2OpKQGaAsOBWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2DsZlbc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2DsZlbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748066666; x=1779602666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2awZlQbYllWdG8uxL3UIGI0+QJOBoTGciwkhTETw82M=;
  b=n2DsZlbcwXakU4dAnSmvByZWuo+0ly0JSYSea/K+5/XLdFYL0sVe81QK
   2DGHRo1KntF6E45AAudRa5fU88eeZ2HJkIXZCVgCTM5AKuOxxUa9pIUsd
   +GgUamum2Al1KHPovNhp9MiPeUyubVE30omwIZKJxI4PzsB+XhZoA6DJ8
   pC4VtTb/bKogCthWWOmO4nWpCivfi/CIowotEjW2RO6llBLHxzcwd5TjM
   QTNQLt0rJL/yDEsq+ZNWFIg+pVtgTJoMf3FZubF2i3DeGVyVqp2NPnGdq
   r6JwgpLxkWKVXlAduDkfTxRnXjqhV0n7eypYESItPiX4C9w8DVPMrb9sh
   Q==;
X-CSE-ConnectionGUID: iGC26opkR/Ko8O9WUK0HMQ==
X-CSE-MsgGUID: +X3/ryAeTGuHDQbcTtyy2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60773655"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="60773655"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 23:04:26 -0700
X-CSE-ConnectionGUID: TZ5U5CxWSMC46uhzFWA1rQ==
X-CSE-MsgGUID: tRZWva38Rki1BCc9ZHdJGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="142005738"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 May 2025 23:04:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIhzZ-000QyU-0T;
	Sat, 24 May 2025 06:04:21 +0000
Date: Sat, 24 May 2025 14:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Nair <rohit.sajan.kumar@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Manjunath Patil <manjunath.b.patil@oracle.com>,
	=?iso-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>,
	Gerd Rausch <gerd.rausch@oracle.com>,
	William Kucharski <william.kucharski@oracle.com>
Subject: [jlayton:uek-localio 1722/2262] ./usr/include/linux/rds.h:237:9:
 error: unknown type name 'pid_t'
Message-ID: <202505241332.na44rQ9a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 46f3d11508e8b8fecc2813441fb2a474fcbf1d02 [1722/2262] rds: Include pid in the rds_sock structs.
config: x86_64-buildonly-randconfig-004-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241332.na44rQ9a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241332.na44rQ9a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241332.na44rQ9a-lkp@intel.com/

Note: the jlayton/uek-localio HEAD 65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/rds.h:237:9: error: unknown type name 'pid_t'
     237 |         pid_t           pid;
         |         ^~~~~
   ./usr/include/linux/rds.h:248:9: error: unknown type name 'pid_t'
     248 |         pid_t           pid;
         |         ^~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
