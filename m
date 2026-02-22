Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461583EBF00
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 01:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771722151; cv=none; b=UIXrn9ofCJjOQOMnG/u4pi7TdaR5O8KwW79pS/SmuWXhsUMQwa9tzUvV+7Tvq4xZZzAkQhop0wGcJuLGj6oxFd99Pdp8/oYxMz1Hsjg3tysN9XT8c7B2xGd3CfOZDgqMySaSvz/TSGJ6bAqMvjy/JAWIhjBLXEnnh1PligEmTRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771722151; c=relaxed/simple;
	bh=/4aUUiNRFqMNQWqblmOpxRmZTDlKuX+qkReroTLDa5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GZs+jVHfmWWFsAgaK+kAKq087y0ZvO/aLdYsiX66KCFHkBCjmE+unAgLNWkmqlTc+4fNh+06ikKBWEU8dIgNlurqouYzaDHPP1mkKK6dWTL8jt0eYWjs1nOwGkoPP7c1KuQd6AFuDEfOIoNoHqXG9i9bMMkvZPRu6J9G+I/FRZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYpaVGzO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYpaVGzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771722149; x=1803258149;
  h=date:from:to:cc:subject:message-id;
  bh=/4aUUiNRFqMNQWqblmOpxRmZTDlKuX+qkReroTLDa5k=;
  b=bYpaVGzOWZAo609z9uj7SxwK81FnjkqQdS8/G7ZQxe0MmcQfoGiMeHUU
   wBodJMOeSsU8ag+R2tjvpJp/eJJJ8j08kLdz6GbJM3o78qA92p6smwuiB
   +xRBgXy2b1Cs/eq95jKztQmOiSB0ti2E1HPMAVnLOFTSfPrVwfUUXjSnK
   vt/WqPHJZYydQFFyseEjIVvR8sKAWI7NspAPLr9/02j+iEcBy+J7sZsNz
   5m6Xj5E/5WEaDLYCDCVjGGT22Ul5n24ZDHqwihkspaUlqhbh3hcd478Nb
   e/NTYFvYS8ufoJDHrXO9Av8IF2c6ZMF4EsCdVeTuxPI8UcEYLwpe0Uyq5
   w==;
X-CSE-ConnectionGUID: Znh46wroQFqq4AU8RxGi5w==
X-CSE-MsgGUID: qabz6BIST82peU/K++L+Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72807253"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="72807253"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 17:02:29 -0800
X-CSE-ConnectionGUID: GEkkpa3XQ1SYNN6vEGQ83w==
X-CSE-MsgGUID: bwa1WoumR4GlEfnq9vLEbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="215330648"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Feb 2026 17:02:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtxrd-000000015H6-1sW0;
	Sun, 22 Feb 2026 01:02:25 +0000
Date: Sun, 22 Feb 2026 09:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 3/17] kernel/rootns.c:123:27: sparse:
 sparse: incorrect type in initializer (different base types)
Message-ID: <202602220841.kH94KaPJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   dce1ddc3d83a564ab8562b8b87539ad7565e6d7a
commit: 778d6635d0cb08dd9d914e90efff687f3d02e674 [3/17] rootns: Declare rootns shenanigans
config: i386-randconfig-r121-20260222 (https://download.01.org/0day-ci/archive/20260222/202602220841.kH94KaPJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602220841.kH94KaPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602220841.kH94KaPJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/rootns.c:123:27: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   kernel/rootns.c:123:27: sparse:     expected restricted __poll_t ( *poll )( ... )
   kernel/rootns.c:123:27: sparse:     got unsigned int ( * )( ... )

vim +123 kernel/rootns.c

   121	
   122	static const struct file_operations rootns_fops = {
 > 123		.poll		= rootns_poll,
   124		.release	= rootns_release,
   125	};
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
