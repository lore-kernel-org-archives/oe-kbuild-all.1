Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531B018A959
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 12:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734871324; cv=none; b=QXHTm5Vrtr+P6dTniG3mq16kDrGYw/vHeWKI8RTY4+rZBcoXk3Nh33iZEJSgy54ZRLQzWrlrXra2cX/4ePoeCUxH4Nn/qyWBa4R+txPoNYdEZ0bg4f4Ir+R/8eAFzIDufHLUREUUJsBYODIXJA9t+ds82N9EoCYSIVP4ksKYLiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734871324; c=relaxed/simple;
	bh=xiM7rbAoWHBPlkvNIz3OM0ZWEb7IbUM1qUKFq9P1drM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJXCIGZulEnK3sfxQGV1/kEofLJIzuwtbJRl8Xu9Ije4ra6jlGk/0cyOlxlrYQI85ppoQZyyy4WnWw8iex7QXZRkV0puK44p2zi1GWyDhQtqocBqqwwn4+ouQ/S0nrEZJ135u2uwv/nU6Uno5ZSOvEEEgGrloM2v5nqj31CjJNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8HDssLZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8HDssLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734871322; x=1766407322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xiM7rbAoWHBPlkvNIz3OM0ZWEb7IbUM1qUKFq9P1drM=;
  b=U8HDssLZK2rWm77wzb8BgI9RuBro+vKkFann6sILTDd0rbUjSPVuNEcU
   Z0utlB3N1braeJj9NlLSUBFAzkcvkRe7mqgsPkdqAw5NTAd7LQKtRjQE7
   /O9+wV+DfjoPTbFVlLWXq1M0IIFN6NV9mj+fhmPAYGYoDRBIIo+7surZk
   hC5k0txC+aiAxnQRPomx6Qn23BKDJ04dp7by7MO2Vs9/qtvotQAc0GzEz
   ZIr3la3i08ZLrzkLn7kjlZQRYFTUtCpa2bfr4S7xYzdpuj3CcTUpgqfDW
   8VxZqCKpwf3u3TdpRjPOW0Gb7dW2b2lm7XaGH4dQFjIAeZ50X1K7N07lD
   g==;
X-CSE-ConnectionGUID: ET/hhH+/T5qZnDwhBbM3Hw==
X-CSE-MsgGUID: GCb8I9eST8ucSZZErLc6hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35517262"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="35517262"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 04:42:01 -0800
X-CSE-ConnectionGUID: jJlkJhAWTmu5y40PpNHhQQ==
X-CSE-MsgGUID: GCW616ixSDej8XEwRZvn1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="98771381"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2024 04:42:01 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPLHS-0002x1-1i;
	Sun, 22 Dec 2024 12:41:58 +0000
Date: Sun, 22 Dec 2024 20:41:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3974/5236] pid_max.c:42:15: warning: implicit
 declaration of function 'mount'
Message-ID: <202412222015.lMBH62zB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: ef5bbd2a286805b0f97b5fa8616d28a84336ee7b [3974/5236] Merge branch 'vfs-6.14.mount' into vfs.all
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412222015.lMBH62zB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412222015.lMBH62zB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   pid_max.c: In function 'pid_max_cb':
>> pid_max.c:42:15: warning: implicit declaration of function 'mount' [-Wimplicit-function-declaration]
      42 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
         |               ^~~~~
   pid_max.c:42:36: error: 'MS_PRIVATE' undeclared (first use in this function); did you mean 'MAP_PRIVATE'?
      42 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
         |                                    ^~~~~~~~~~
         |                                    MAP_PRIVATE
   pid_max.c:42:36: note: each undeclared identifier is reported only once for each function it appears in
   pid_max.c:42:49: error: 'MS_REC' undeclared (first use in this function)
      42 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
         |                                                 ^~~~~~
>> pid_max.c:48:9: warning: implicit declaration of function 'umount2'; did you mean 'SYS_umount2'? [-Wimplicit-function-declaration]
      48 |         umount2("/proc", MNT_DETACH);
         |         ^~~~~~~
         |         SYS_umount2
   pid_max.c:48:26: error: 'MNT_DETACH' undeclared (first use in this function)
      48 |         umount2("/proc", MNT_DETACH);
         |                          ^~~~~~~~~~
   pid_max.c: In function 'pid_max_nested_inner':
   pid_max.c:88:36: error: 'MS_PRIVATE' undeclared (first use in this function); did you mean 'MAP_PRIVATE'?
      88 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
         |                                    ^~~~~~~~~~
         |                                    MAP_PRIVATE
   pid_max.c:88:49: error: 'MS_REC' undeclared (first use in this function)
      88 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
         |                                                 ^~~~~~
   pid_max.c:94:26: error: 'MNT_DETACH' undeclared (first use in this function)
      94 |         umount2("/proc", MNT_DETACH);
         |                          ^~~~~~~~~~
   pid_max.c: In function 'pid_max_nested_outer':
   pid_max.c:163:36: error: 'MS_PRIVATE' undeclared (first use in this function); did you mean 'MAP_PRIVATE'?
     163 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
         |                                    ^~~~~~~~~~
         |                                    MAP_PRIVATE
   pid_max.c:163:49: error: 'MS_REC' undeclared (first use in this function)
     163 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
         |                                                 ^~~~~~
   pid_max.c:169:26: error: 'MNT_DETACH' undeclared (first use in this function)
     169 |         umount2("/proc", MNT_DETACH);
         |                          ^~~~~~~~~~
   pid_max.c: In function 'pid_max_nested_limit_inner':
   pid_max.c:232:36: error: 'MS_PRIVATE' undeclared (first use in this function); did you mean 'MAP_PRIVATE'?
     232 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
         |                                    ^~~~~~~~~~
         |                                    MAP_PRIVATE
   pid_max.c:232:49: error: 'MS_REC' undeclared (first use in this function)
     232 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
         |                                                 ^~~~~~
   pid_max.c:238:26: error: 'MNT_DETACH' undeclared (first use in this function)
     238 |         umount2("/proc", MNT_DETACH);
         |                          ^~~~~~~~~~
   pid_max.c: In function 'pid_max_nested_limit_outer':
   pid_max.c:289:36: error: 'MS_PRIVATE' undeclared (first use in this function); did you mean 'MAP_PRIVATE'?
     289 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
         |                                    ^~~~~~~~~~
         |                                    MAP_PRIVATE
   pid_max.c:289:49: error: 'MS_REC' undeclared (first use in this function)
     289 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
         |                                                 ^~~~~~
   pid_max.c:295:26: error: 'MNT_DETACH' undeclared (first use in this function)
     295 |         umount2("/proc", MNT_DETACH);
         |                          ^~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
