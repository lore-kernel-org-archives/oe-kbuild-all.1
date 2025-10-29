Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F8331BC91
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 08:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761726710; cv=none; b=Ks4vTo8vjM7O5COTEisJ9HKe0uleEhry2SvpFMJM6Fs2RJaogZ2xjEbCteGTgt1steJqs16zxu4TQwLF9BcWhsEa8qYVI5DNyBVQlMBAUPL6qUTAHflstyvf3iQGQ5yI4ugeKAW966uIdE4BjC9bT48EDw+0+n0eeWfCFEMQugc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761726710; c=relaxed/simple;
	bh=k0GwpkXPpzUw7sWZHcLPgKY667fZf9UBgS9Ft8KBy7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NaJNey3h+lcffLHp0dUaP+/7r3ru56ENTLAtGUmJSjZnPXaZWVT2HyupC+XPBZnzQv76NWYy3F7mHZu/h0xdt8xq3ksCUaQyphZUMHiRE9UPRsYqpZMwDcH1YTJTGhvxIq67xgoMRL4RfyuV3B2lzUltrzPjddUNzL/dajCPw+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZF9/BmI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZF9/BmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761726709; x=1793262709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k0GwpkXPpzUw7sWZHcLPgKY667fZf9UBgS9Ft8KBy7U=;
  b=fZF9/BmIlxHVblCT1KA+M1WHN4d0NL/mD5Y28nvUUHco4dJPKfFvIbqC
   1jGQfGLn1ys/1czDaNl2h8II+tZxg57vuw6EmhQ4cOv+oNfe1ir7mDd7X
   geRTTDmYKUq1Zia11o3X3R4U0dedYzLRM4sRw5cGTrpWgmabILbCoOV9Z
   UDVOmY0IyL0UdE9Yt3GMQs/QDTDBrlKlh8tkb+q5W+agUCHW+PVFjTAN9
   /m3jcV9yV0gQhrjH4FO6jxwsFceVLGP8rbL2QHAWbUTzfHFFGQvFwxCiA
   3aPheMvDxNJ1vn0Mv8CRVtmzq9zULWLrzDSbAFGi7l5qlL0V3B41WS71q
   A==;
X-CSE-ConnectionGUID: SLgnce06TcWE4M2uGn0ETA==
X-CSE-MsgGUID: a314nvB4RbmbjTDoHQ2VFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63936255"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63936255"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 01:31:47 -0700
X-CSE-ConnectionGUID: WcFz9xe+QyukxyI6wiwVdQ==
X-CSE-MsgGUID: ftYZQp1YS/KGFLFh/H/JyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185290349"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2025 01:31:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE1ap-000KP8-2I;
	Wed, 29 Oct 2025 08:31:43 +0000
Date: Wed, 29 Oct 2025 16:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix 43/83] lib/dynamic_debug.c:1880:14: warning:
 variable 'mod_ct' set but not used
Message-ID: <202510291619.a3zVQUhQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   7c56937db9e56927f30d9fdecccb793062970841
commit: c475b6f9cd3a5be561a68bf1309ac3384a2a57dd [43/83] dyndbg: simplify dynamic_debug_init()
config: arm-randconfig-002-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291619.a3zVQUhQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291619.a3zVQUhQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291619.a3zVQUhQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c:1386:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'struct _ddebug_class_param *' [-Wnon-literal-null-conversion]
    1386 |                 return false;
         |                        ^~~~~
   lib/dynamic_debug.c:1808:51: warning: shift count >= width of type [-Wshift-count-overflow]
    1808 |                ((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
         |                                                          ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:1880:14: warning: variable 'mod_ct' set but not used [-Wunused-but-set-variable]
    1880 |         int ret, i, mod_ct = 0;
         |                     ^
   3 warnings generated.


vim +/mod_ct +1880 lib/dynamic_debug.c

  1877	
  1878	static int __init dynamic_debug_init(void)
  1879	{
> 1880		int ret, i, mod_ct = 0;
  1881		void *mod_name;
  1882		char *cmdline;
  1883	
  1884		struct _ddebug_info di = {
  1885			.descs.start = __start___dyndbg_descs,
  1886			.sites.start = __start___dyndbg_sites,
  1887			.maps.start  = __start___dyndbg_class_maps,
  1888			.users.start = __start___dyndbg_class_users,
  1889			.descs.len = __stop___dyndbg_descs - __start___dyndbg_descs,
  1890			.sites.len = __stop___dyndbg_sites - __start___dyndbg_sites,
  1891			.maps.len  = __stop___dyndbg_class_maps - __start___dyndbg_class_maps,
  1892			.users.len = __stop___dyndbg_class_users - __start___dyndbg_class_users,
  1893		};
  1894	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
