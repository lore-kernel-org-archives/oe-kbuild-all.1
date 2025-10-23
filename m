Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAE617A30A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 02:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761187664; cv=none; b=ShfTCELo0SJQli3BJp0L1omUGojX4RWrmKBFQGSLQJ1rKfhmnm8dZ/cpcOsJ/kOG77RLv2QON/bcCJSST+cX6dW2An38F2BQKEUGGfX9hcrgtHjZ4HNQry+7kdxr8vVOvxkII5prCqlF2g6rGqovM8xuw+JrWvIC4expObUOfWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761187664; c=relaxed/simple;
	bh=gE2UclCIUBnnVL6NRgco9WwjOp03pGQCm6kSXY89IP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XDBLoegEdpKCHaWI33s5BOYtfuuapfL565iuG+HBzEazyXsKZ2dHU56Esw3ASax3ZDX9m7J78YvjGC4HpHsm+gFn3JFNjh2xsPAcKPPG/zHZJNWc0Qms9I6TvGmXrziAedQeb8uNVQyY1Siuxpqzp8N1RbWWOCOJzxH0vuwjOtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WS6f4o6V; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WS6f4o6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761187662; x=1792723662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gE2UclCIUBnnVL6NRgco9WwjOp03pGQCm6kSXY89IP0=;
  b=WS6f4o6Vf79Ly8BtZOnJ2XZonOb24rshHpYnK6Kbx5CD/iOfYmYcSq9s
   m9m0Pw31lVEzYrKY4qomvrkaq1eUqjgfmu0a4gLTa+V/Kufuxh1iKH0Sn
   mEA2KmLy7gdRcxvMSVA0JfxkYO4+OjhL5wK93AHPYppohb13T3gu8Bm1T
   LmGOCAfvTYHG+MOKreSfCn5v354O5gOjV6bMXF7VPc3fnfCV7wl82Yl+A
   ngsZXfoKAA6cAl4BYeNYT2n08H+TuMVXgmS0zLkmjrwAzzGh2C8LWwQF7
   8rcY2Ce7VsLWkXm8tUnaBR2CmFCdxf5rpVPb1X2XZOdwIT/vWnOj2I0xb
   g==;
X-CSE-ConnectionGUID: rHzDuiggTDexxKmcmiYXnQ==
X-CSE-MsgGUID: lQnhi4BXRMWIXDFBSqAtTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62556946"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="62556946"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 19:47:42 -0700
X-CSE-ConnectionGUID: axcoH6aNRZ6AvFwGPHPBKQ==
X-CSE-MsgGUID: L9zJLO46SEWWcXLHBGbD3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="188436965"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2025 19:47:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBlMY-000Cx7-2K;
	Thu, 23 Oct 2025 02:47:38 +0000
Date: Thu, 23 Oct 2025 10:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 3/9] (.text+0x130e): multiple
 definition of `update_ftrace_direct_del'; fs/netfs/main.o:(.text+0x26e6):
 first defined here
Message-ID: <202510231035.T1MUCplL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops
head:   3d31a310468694e4395d61e15c65edaa618fbb5c
commit: 6fc33ce4c35edf7fb4fd8c760ad1bb2e472d82cb [3/9] ftrace: Add update_ftrace_direct_del function
config: sh-randconfig-002-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231035.T1MUCplL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231035.T1MUCplL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231035.T1MUCplL-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/netfs/fscache_main.o: in function `update_ftrace_direct_add':
   (.text+0x12f0): multiple definition of `update_ftrace_direct_add'; fs/netfs/main.o:(.text+0x26c8): first defined here
   sh4-linux-ld: fs/netfs/fscache_main.o: in function `update_ftrace_direct_del':
>> (.text+0x130e): multiple definition of `update_ftrace_direct_del'; fs/netfs/main.o:(.text+0x26e6): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
