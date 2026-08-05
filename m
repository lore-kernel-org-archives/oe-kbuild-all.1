Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B134D47ACF9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785943672; cv=none; b=PFDjCDyG2Sb0rUIxrUUbO4V4LFC0GsFf/02GzGYaTXccKwKFlh46H6shHZObqOipKBnworHC+GMDOHQOAOpY+q3B/A4WAe1rNlFJgQ2wJhpq8Xa+kvQNu/JMZrULv3/ajW7Zo5tYDMcS1l7n529RCXd40HBAnL1loomqA0vcN5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785943672; c=relaxed/simple;
	bh=p0tDZm9kh+Da2g4yPQZ/R+ZhOLBgPf1nM9Hv2MIEYc8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=idh0BEgRg7hdGeZQ9wrGQ6Tf40LtKwae032YNfBqLnuBvUkkibBhEFpDctMzuVI5HBAK+YmR2Jwg3wxYZBM6tR6+mefuKVGWjPGrVYc2n3QUeRPhKCqX8KsOT+F6ncr5u6jWnn5zX6iDEWAmfzjB97SkqH4rhzZ5UmqzyzhhLjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2MrEYeP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2MrEYeP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785943669; x=1817479669;
  h=date:from:to:cc:subject:message-id;
  bh=p0tDZm9kh+Da2g4yPQZ/R+ZhOLBgPf1nM9Hv2MIEYc8=;
  b=G2MrEYePlghtlWw4u4HTUc1lqgwbqTtCw2etfzTXTMJ+UPwqAqJFvEwy
   1c3GWAuKs1ZfxITyMIN1OGvATFIb4Ypw8LiMm+JYqoqLSeYYmGmIaftcl
   cEoy8RDUhzjLb4wxiipdOahntnLX8HtH39jLEHDStSnfxL02IccmIxQbj
   Y92xxxCCikHWx7J57cwGsD+cbiSQW4c6Xefn0swubfSSuDcXR77Zkzn3Y
   6jYzAlOQmwRbyPRBAbLkSGD2nmyPemZoMw/KQossMuIyQdhU5kZgUNK7r
   0CzV4WO5dNmjJMn9Lkg+bPCoAKiIsgN026e36BMWB3WuhQaVVjVpgJkf1
   g==;
X-CSE-ConnectionGUID: W+VbHcrsTDOmBzkXQUBuFQ==
X-CSE-MsgGUID: wWW8KjhxRzqIPS/NvJAbog==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="90405096"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="90405096"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 08:27:46 -0700
X-CSE-ConnectionGUID: klolYoKqSYGLkS7wnSmGIA==
X-CSE-MsgGUID: yb4jGYq4Rn6LS1h9uBVeSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="257533559"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Aug 2026 08:27:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrdWl-00000000Cpt-4AuX;
	Wed, 05 Aug 2026 15:27:31 +0000
Date: Wed, 05 Aug 2026 23:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: {standard input}:1754: Error: register save offset not a
 multiple of 4
Message-ID: <202608052308.dcqXQnA4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Eduard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c21bb4193868a8de71fc4693fa741e195fdf5d86
commit: bf0c571f7feb6fa05a512e2a5e50702501849d61 bpf: introduce forward arg-tracking dataflow analysis
date:   4 months ago
config: m68k-randconfig-r051-20260805 (https://download.01.org/0day-ci/archive/20260805/202608052308.dcqXQnA4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608052308.dcqXQnA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bf0c571f7feb ("bpf: introduce forward arg-tracking dataflow analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608052308.dcqXQnA4-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:1754: Error: register save offset not a multiple of 4
   {standard input}:1755: Error: register save offset not a multiple of 4
   {standard input}:1756: Error: register save offset not a multiple of 4
   {standard input}:1757: Error: register save offset not a multiple of 4
   {standard input}:1758: Error: register save offset not a multiple of 4

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
