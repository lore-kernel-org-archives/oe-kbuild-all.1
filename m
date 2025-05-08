Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4D726FA6C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714612; cv=none; b=u7+Zyx35neUfKlC3LWbgi1c5kqvKltAVtwweer7o+ghlXyURWZCuKRbYrtvjF2VufYNIaueoAxQxvgI/zHx+70Y3C14oo4z+G+n30GyaHMmAWSbQwCZupnt6rWD4CHFySZ3P789Vqy7c4qONaXJ2/nWJVcYPI3rh5YOC45ssnyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714612; c=relaxed/simple;
	bh=pJqqkUgFhEyGRaUdH1kbBxQ1uxvxWWcjAFR03QOI4UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=igKy2/+Rxuvt3DIxab9Q5DShd4gCv3Nt9L0hilzD5xn/pGYMqWXhTTRQEBXAAsvclvqybqvg9GTj5V2cYrLWZb5/evZrvPi/laPW8y4uvicfa/so4YRIkUcifBXOL7OM82ydCPmOYlKlMmLXWXJ2VZTOcEs/5m1EzXqQaEq2Ppg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rzl6fbW0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rzl6fbW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746714611; x=1778250611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pJqqkUgFhEyGRaUdH1kbBxQ1uxvxWWcjAFR03QOI4UQ=;
  b=Rzl6fbW0Di9tVlMfRNZNXKU4X2SRa+c4W/RmoIExzNyIeIzsBw1aH9P7
   SQ2uOHvVqdF6FJb2+1jg6O13X5rj0JcnESGaFaASbjq1ipK9s7v6Z4Q+b
   raF5/PWlQhzFgfAGX9nG7LGY1CywbOg1gXU2n2bMotoauS9Fu+3bnzTAm
   bONITqxT4jyVjFiPTX84sCC2Re4I+m3M6oxobx8gFLZmtdPckL2B6Bcq6
   1L0Kx9gOpnBWWldxls9fD5WFwo9rGkyKVILHTYQEhqOGCvARjv23uicGd
   zR5JFdgGROoAi7PIPNJs4ynPzs0VeeXrIKx7wbAPGqZ6DzeC1qA688T5k
   w==;
X-CSE-ConnectionGUID: OL9sgfa7R8ihfD2b+ZfInw==
X-CSE-MsgGUID: djb0nbwJQouEiR6NP8Qnhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48515440"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48515440"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:30:09 -0700
X-CSE-ConnectionGUID: onD5U1CzSO6slEfQWVwgyg==
X-CSE-MsgGUID: qo2+n0GgQTCU0ShWrqJ+Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="167407539"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 May 2025 07:30:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD2GC-000B3D-1M;
	Thu, 08 May 2025 14:30:04 +0000
Date: Thu, 8 May 2025 22:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.coredump.socket 11/18]
 include/linux/coredump.h:84:13: error: missing binary operator before token
 "("
Message-ID: <202505082216.43SIteyI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.coredump.socket
head:   bc6c0c24d12262711c2c7f04f2f7fb37af6ee342
commit: 9a2c3e095ac2a5da426fca730cc1a8637006f458 [11/18] coredump: add coredump socket
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20250508/202505082216.43SIteyI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505082216.43SIteyI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505082216.43SIteyI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/signal.c:29:
>> include/linux/coredump.h:84:7: warning: "define" is not defined, evaluates to 0 [-Wundef]
      84 | #elif define(CONFIG_UNIX)
         |       ^~~~~~
>> include/linux/coredump.h:84:13: error: missing binary operator before token "("
      84 | #elif define(CONFIG_UNIX)
         |             ^


vim +84 include/linux/coredump.h

    80	
    81	#if defined(CONFIG_COREDUMP) && defined(CONFIG_UNIX)
    82	int unix_may_bind_coredump_addr(struct net *net, struct sockaddr_un *sunname,
    83					int len);
  > 84	#elif define(CONFIG_UNIX)
    85	static inline int unix_may_bind_coredump_addr(struct net *net,
    86						      struct sockaddr_un *sunname,
    87						      int len)
    88	{
    89		return 0;
    90	}
    91	#endif
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
