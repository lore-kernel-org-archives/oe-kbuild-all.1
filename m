Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973502405FD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 21:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767474837; cv=none; b=CdcpVX0PhXFR/WYJPDQKih7X8xlIX6JtmBWSLvhoh6SKTQHd6BuwO7QA6DAPXF41sa0O/KwR5PK08jla/iOCcETM47z9bKARFaXeKHqPPNq1pnTHRQGlR2V9io/eYSa3ytKJ4YhaYSCoNs9Y+51U+bqc7c2nV6hWrYNI030db3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767474837; c=relaxed/simple;
	bh=2+m0hepVaRxrJAVjmdqkMuAb/XP0D2EOb1NXk7+AXfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PKbS8LzBKb2k8u7joUT6RLwvb4e0O1VdZoLUn3qeV+iRgpRtvNvw5ISviT7RHCR0FBknIzz6ITtF3tRz5gN9Zf8G3ehKDg4set4EgE5DId8NZyiYS17oFdz5MHDQ2ZCUqyIAf0p8hGOtKgseop+UanmOV+VpP+M06nCt8vFSvPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYf4V2d0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYf4V2d0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767474835; x=1799010835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2+m0hepVaRxrJAVjmdqkMuAb/XP0D2EOb1NXk7+AXfU=;
  b=HYf4V2d0HPolHBK3d5QQzZBMebu8eIyipj4IJzj40FYQ4GuZVu1lYL+w
   R/ZYauw9tLHcKtgzHOh/Nh8p4HUqJWkP+bS0N9S15vtB/FrTRZrtiDZ8N
   sIMfjVEm2t/jRR2YZgsePd98h3/4h8aQeynyv+ckRhfx+j4IMzt38Cmlb
   4UOIy4FTa0+ACLGDI2QD28Q5X+OWvT6a6YN8qE/Gni2Gp2LtzJClg5TJ6
   vMM6jD4yPLXIWxo0drUq00CsfymhQ9swDhrnjxC0+I/HeysUHBwJMvMha
   iScFJYUd3xfbkPKC3KB0GrU5EEbtannwkfyThBtBwLukcDdLXPgUPJdBk
   Q==;
X-CSE-ConnectionGUID: Vj7VrOS8Rj2jpLbi1/yAjA==
X-CSE-MsgGUID: 4ytQtXNCSjWt/0M6cmIHMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="72536409"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="72536409"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 13:13:54 -0800
X-CSE-ConnectionGUID: 1z5BJfyqQiim2r7xHGiItQ==
X-CSE-MsgGUID: 6n/93BLdR8CjzHHxT/HlnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="201687589"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jan 2026 13:13:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc8wY-000000000FJ-0s5M;
	Sat, 03 Jan 2026 21:13:50 +0000
Date: Sun, 04 Jan 2026 05:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-maple-2 38/43] lib/dynamic_debug.c:1733:14:
 warning: variable 'mod_ct' set but not used
Message-ID: <202601040512.SmxNvopN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-shrink-maple-2
head:   549b560de653db8ff24a3813ab2e985a355c9d18
commit: cffb4613b9a2447fa853504009414cb92acd33cd [38/43] dyndbg: simplify dynamic_debug_init()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20260104/202601040512.SmxNvopN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601040512.SmxNvopN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601040512.SmxNvopN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c:1336:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'struct _ddebug_class_param *' [-Wnon-literal-null-conversion]
    1336 |                 return false;
         |                        ^~~~~
>> lib/dynamic_debug.c:1733:14: warning: variable 'mod_ct' set but not used [-Wunused-but-set-variable]
    1733 |         int ret, i, mod_ct = 0;
         |                     ^
   2 warnings generated.


vim +/mod_ct +1733 lib/dynamic_debug.c

  1730	
  1731	static int __init dynamic_debug_init(void)
  1732	{
> 1733		int ret, i, mod_ct = 0;
  1734		void *mod_name;
  1735		char *cmdline;
  1736	
  1737		struct _ddebug_info di = {
  1738			.descs.start = __start___dyndbg_descs,
  1739			.sites.start = __start___dyndbg_sites,
  1740			.maps.start  = __start___dyndbg_class_maps,
  1741			.users.start = __start___dyndbg_class_users,
  1742			.descs.len = __stop___dyndbg_descs - __start___dyndbg_descs,
  1743			.sites.len = __stop___dyndbg_sites - __start___dyndbg_sites,
  1744			.maps.len  = __stop___dyndbg_class_maps - __start___dyndbg_class_maps,
  1745			.users.len = __stop___dyndbg_class_users - __start___dyndbg_class_users,
  1746		};
  1747	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
