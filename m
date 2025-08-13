Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637B715C158
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 12:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755087623; cv=none; b=XJCAVE4t7Mv2407zWXxNnUNtuWyMjUAhzvt53+moMLIH+14B82Km0IjDC3m0LL1uTF5v+EDvJB8vFx1DbHTHT3QzPzUS5+LU2C871l4hJOzqBCAdnWagU84l/57SlglrU2CJp3W+/lrhVc2D8JiYpZInuHcpqbvLaNJRNktqbv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755087623; c=relaxed/simple;
	bh=B6OFOVLeqPqj2UUKAwlHFKs/ljxmdeu6AuZsd7dIAUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WiD8EGJiHGF9UUpqFxxrY34jioeUsulERky3W5eP0MWcZVThqx0g28kQOuPdiKvauEkJ6soxkT0t2/miFoI0rK3jt5336F7EW9I5DDsIaQgn7N2QyvpftKXX3Z0ukn9f+mvClsh6nEttHRL3clinHjoON4AI4fPjt06zMrmARuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIETyKSh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIETyKSh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755087622; x=1786623622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B6OFOVLeqPqj2UUKAwlHFKs/ljxmdeu6AuZsd7dIAUw=;
  b=iIETyKShQmAhthH0PDws8Vs14yCRqWmmdLybZsFohSnFbib8kjdQQMrB
   10hVUwL3MedeFMUS0j2fXZlQTkxQSy9fVAsB9ZDRRyd9cprzrAH0StlTA
   4MVdxasfzCkhFoCVULhlO3FO7zC34b4mHhLE2ElGQJhmKu+TKBvCn+ATU
   UH7LwxbKli9oIM2oTB9KYFTBflvf1rTqzDTjOFdqe0fpnw/qjwDN7LCgU
   6eWiQVpqUVWRuZ1fhHej3BLwnQiqvvCjGnALcUlPuQmsgTat/wTsdpVWb
   afPAke3A8IEvJW/+lIoJfHlJwTx4b+MzrUQX0RiPw9ZwfnAcjXo7io3XK
   Q==;
X-CSE-ConnectionGUID: rz3iW2qYQvy+ZI+Rf0s0+A==
X-CSE-MsgGUID: dZwXc9EJSGu54fwy5tiS5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68455205"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="68455205"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 05:20:21 -0700
X-CSE-ConnectionGUID: IwpLApLkSeCDrzUhzIG43Q==
X-CSE-MsgGUID: H0Bu9bULSvWyMsbFN5USWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="197457182"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Aug 2025 05:20:20 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umASj-0009s6-1N;
	Wed, 13 Aug 2025 12:20:14 +0000
Date: Wed, 13 Aug 2025 20:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 2051/2153] alpha-linux-ld:
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.o:undefined reference to
 `stmmac_simple_pm_ops'
Message-ID: <202508132051.a7hJXkrd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   43c3c17f0c805882d1b48818b1085747a68c80ec
commit: 38772638d6d1989655f5a05b273dc62a026e0ef1 [2051/2153] net: stmmac: loongson: convert to suspend()/resume() methods
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250813/202508132051.a7hJXkrd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508132051.a7hJXkrd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508132051.a7hJXkrd-lkp@intel.com/

All errors (new ones prefixed by >>):

   `xe_configfs_exit' referenced in section `.data.rel.ro' of drivers/gpu/drm/xe/xe_module.o: defined in discarded section `.exit.text' of drivers/gpu/drm/xe/xe_configfs.o
>> alpha-linux-ld: drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.o:(.data.rel+0xe0): undefined reference to `stmmac_simple_pm_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
