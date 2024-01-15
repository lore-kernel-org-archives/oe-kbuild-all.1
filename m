Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C343C15
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 03:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3Uum/An"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705290474; x=1736826474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RSkMcAZgkf0J5925Njn6IKbE7us+jf4ENoCMp+aPdzM=;
  b=g3Uum/AnViyQG+Jg0tDBVlAPJGoSsB4JdqhtMcVh0eFFIhBun3swvA8P
   eKK2egvzhDu0Rq1ubBALqvwZVR6V/Zl3DHMmovkYQJLZRv5ugHsP++Dbn
   r0CrsbvaXScd2P4lIiEzS404CGd88E9ywlDEvRuOSyKoIUE6cOuhcSGvR
   +cKdgv5xshIWTtZRdH2+5mgrasqtGRXeJHQ856bGQHUtHNLdBTk06G8W6
   W653NrnPMIPe5AiS2g3pzUISDIuO5MTIogM18fBjN/DVPgmtu6lNaiNa2
   9gHs5q7PGOPpuV7iUeq9abeTN4MFDlAsn6e1uKKw2XIIm2q4y2aOzildz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="485689339"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="485689339"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 19:47:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="853873098"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="853873098"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jan 2024 19:47:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPDwu-000C5v-2i;
	Mon, 15 Jan 2024 03:47:48 +0000
Date: Mon, 15 Jan 2024 11:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/bbr3 1/1] ld: net/ipv4/tcp_bbr.c:500: undefined reference
 to `__udivdi3'
Message-ID: <202401151118.bdk5YpbE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/bbr3
head:   5d8376057790252b220d3a5eea2b628106f69d38
commit: 5d8376057790252b220d3a5eea2b628106f69d38 [1/1] tcp/bbr3: initial import
config: i386-randconfig-063-20240115 (https://download.01.org/0day-ci/archive/20240115/202401151118.bdk5YpbE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401151118.bdk5YpbE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401151118.bdk5YpbE-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs_generic':
   net/ipv4/tcp_bbr.c:500: undefined reference to `__udivdi3'
>> ld: net/ipv4/tcp_bbr.c:500: undefined reference to `__udivdi3'
>> ld: net/ipv4/tcp_bbr.c:500: undefined reference to `__udivdi3'
>> ld: net/ipv4/tcp_bbr.c:500: undefined reference to `__udivdi3'

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/tcp_bbr.c:1315:5: sparse: sparse: symbol 'bbr_ecn_cut' was not declared. Should it be static?
>> net/ipv4/tcp_bbr.c:2036:18: sparse: sparse: symbol 'bbr_main' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
