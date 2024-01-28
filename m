Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CC92E400
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 18:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706467961; cv=none; b=IpWI2CNG7ZD0HSjjLNKZejsVmeYzYD2bP1eKuGuBGQzM6Lvrt4YEoLGFZrqqN1ApDEitTrSSShkCS2BEzhqCGARw1RQxBe9XuflpsEPb3KKO+M523UIbeIRdf15HTnxbvOUefZyFGcjF9n5OHTdTl+ZhZbURxPA+ugI3rT7iSN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706467961; c=relaxed/simple;
	bh=qyN3VV6hiBP1V8jpYGnzeXZR7P8JiFlN5tMzpN/9c5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pNnmXbHFKX+dNijIL1CxXKttmroif+97r3wcN8/TLwzVXufGO2QASsYaJ1r48lcZUlB/K3zyPJG01zcSuXazdGVrdVzIOtcxVW9YXj7kvvVHrtlC8+oiPQWADDdhVVf8jZsFEvtHQRlX0Oj00Rj1bj544194OSuSnA8CkqbHFV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmzISAi2; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmzISAi2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706467958; x=1738003958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qyN3VV6hiBP1V8jpYGnzeXZR7P8JiFlN5tMzpN/9c5Y=;
  b=RmzISAi26aXxDYXPCr25XpZF20mOm5ntRtSg4lF8fKKb702jwnlJ/AV4
   tQcOrGeQPewKX00WMdkGV0bSofCpvGlaT5yBdvz4LaLwdK0SYXesZiGW5
   pJjfXpmmPiIfdM+7IhtxQV8w650ZipTE3QvftLlwAY4I/ev8d0MkX2bCF
   mJnZL0BUepnHa/4tRobHsg3EsGznUAweVHoPxms0/o2/L2p1MvK8oRPTT
   z7AuXot65GMDNRkhPwHFJ7cCWu40eHnmsqDIBsDqhNRrnA6zdAuVdBhSf
   zs7LS4Dt6FiQA2HOBRwomiu7S8L2tPQwb14J45XnO1iDrGGTvK3A0ReQl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="401661964"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="401661964"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 10:52:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="1118733656"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="1118733656"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2024 10:52:36 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUAGg-0003fU-39;
	Sun, 28 Jan 2024 18:52:34 +0000
Date: Mon, 29 Jan 2024 02:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/enable-unsigned-sanitizer 30/100]
 scripts/dtc/dtc-parser.tab.c:1722:72: error: 'U64_MAX' undeclared; did you
 mean 'UINT64_MAX'?
Message-ID: <202401290241.dsi4Gry1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/enable-unsigned-sanitizer
head:   a7e79409b1cc59a7f181e2b04e0cb4835b620b81
commit: b414edfafc072130d9b37c3587fce0182a7c4388 [30/100] [WIP] treewide: negative unsigned constant -1ULL: use U64_MAX
config: i386-randconfig-011-20240128 (https://download.01.org/0day-ci/archive/20240129/202401290241.dsi4Gry1-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290241.dsi4Gry1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290241.dsi4Gry1-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/dtc/dtc-parser.tab.c: In function 'yyparse':
>> scripts/dtc/dtc-parser.tab.c:1722:72: error: 'U64_MAX' undeclared (first use in this function); did you mean 'UINT64_MAX'?
    1722 |     if (((yyvsp[0].integer) > mask) && (((yyvsp[0].integer) | mask) != U64_MAX)) {
         |                                                                        ^~~~~~~
         |                                                                        UINT64_MAX
   scripts/dtc/dtc-parser.tab.c:1722:72: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [scripts/Makefile.host:133: scripts/dtc/dtc-parser.tab.o] Error 1 shuffle=1229955285
   make[3]: Target 'scripts/dtc/' not remade because of errors.
   make[2]: *** [Makefile:1420: scripts_dtc] Error 2 shuffle=1229955285
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=1229955285
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=1229955285
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
