Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1728688E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 06:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752647200; cv=none; b=qzjljN8/ZeYVJ3kX7cixvWX+MI+bT3XVr6iekd++ChEkp0yM5lvgLtwsdDfIVrqWqHlqXxTZ2im9STl446EVWKNaqsEwXXc/MVyH2ghNo5eR9B248G0ted7Y+GcyHrM1JTeLbpbudirAJEQ8ku98b8vDAas4W9v5B60/5OhjkVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752647200; c=relaxed/simple;
	bh=IvVdXq2aEwrAgqh560+M5Tg4EqeeKr6CCvZQwluR57U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EaXbVvB+QUGAidL72+WL1KMfJdahoGwt/oC4iKqObZFMTdsmkGVhCIzSE5mi112T+P6bgHkXa4tZdNoTt6nU/gI1V/W439hk2v96nCSksI3mZ4ilL5t5hiFTnqdwPozkJuJ3iFA7ZUsa+1ACTFf6KVbqzxn6u3O4esYiBj3iRw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QleYyv94; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QleYyv94"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752647198; x=1784183198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IvVdXq2aEwrAgqh560+M5Tg4EqeeKr6CCvZQwluR57U=;
  b=QleYyv94AjNcrri/XdX+lfRffhzX4GEkcrdLy+Vdodt2mQEhL7N37Rvu
   oCRqr0hjlt+3VYzI2arBHawVEEgroeJxzT7mu2zvjFBlm5bU6xDkVZMB2
   KfD2+GfCazBd+V46nUKbYZuruUCAYKPScd8slhGC14pZVRpispNEA/rrp
   McxVHIRPZZ8GAyQ1EYi6KOfZkNwydOIWcT3ynDeczef2ggO5n20EJObVI
   KAWU+fNlcQIEEw/7nNn3oQenK9kSyP4C0aDQ4fyiJJ450ZK4ZtroQNT5q
   cJmW5m+DUuEzemfglcvsnviNkJrPYV9onTWc6zMalsesm300pJpdCtMtA
   A==;
X-CSE-ConnectionGUID: 2YPy+AkRQQWWBpn9yZeZqA==
X-CSE-MsgGUID: g7xjJty5QgC4nPFyqIkTsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="80331772"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="80331772"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 23:26:37 -0700
X-CSE-ConnectionGUID: vH1tbknVStiMta+RSok6Ig==
X-CSE-MsgGUID: /R+9q68qSFGF29Ez3k0kow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="194559665"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jul 2025 23:26:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubvb6-000C0E-2U;
	Wed, 16 Jul 2025 06:26:32 +0000
Date: Wed, 16 Jul 2025 14:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/g3s/i3c 20/20] drivers/i3c/internals.h:58:9: error:
 passing 'const void *' to parameter of type 'void *' discards qualifiers
Message-ID: <202507161417.HXyjFQVL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c
head:   70e60a14f39358f6c1f26abab27dd4a78318e436
commit: 70e60a14f39358f6c1f26abab27dd4a78318e436 [20/20] test: try to fix lkp report
config: sparc64-randconfig-001-20250716 (https://download.01.org/0day-ci/archive/20250716/202507161417.HXyjFQVL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161417.HXyjFQVL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161417.HXyjFQVL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i3c/master.c:21:
>> drivers/i3c/internals.h:58:9: error: passing 'const void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      58 |         readsl(addr, buf, nbytes / 4);
         |                ^~~~
   arch/sparc/include/asm/io_64.h:265:41: note: passing argument to parameter 'port' here
     265 | static inline void readsl(void __iomem *port, void *buf, unsigned long count)
         |                                         ^
   1 error generated.


vim +58 drivers/i3c/internals.h

b7371ff9bdf7bd Jorge Marques 2025-06-24  48  
b7371ff9bdf7bd Jorge Marques 2025-06-24  49  /**
b7371ff9bdf7bd Jorge Marques 2025-06-24  50   * i3c_readl_fifo - Read data buffer from 32bit FIFO
b7371ff9bdf7bd Jorge Marques 2025-06-24  51   * @addr: FIFO Address to read from
b7371ff9bdf7bd Jorge Marques 2025-06-24  52   * @buf: Pointer to the buffer to store read bytes
b7371ff9bdf7bd Jorge Marques 2025-06-24  53   * @nbytes: Number of bytes to read
b7371ff9bdf7bd Jorge Marques 2025-06-24  54   */
b7371ff9bdf7bd Jorge Marques 2025-06-24  55  static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
b7371ff9bdf7bd Jorge Marques 2025-06-24  56  				  int nbytes)
b7371ff9bdf7bd Jorge Marques 2025-06-24  57  {
b7371ff9bdf7bd Jorge Marques 2025-06-24 @58  	readsl(addr, buf, nbytes / 4);

:::::: The code at line 58 was first introduced by commit
:::::: b7371ff9bdf7bd20065fbd9c487cbbdb542c7dda i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()

:::::: TO: Jorge Marques <jorge.marques@analog.com>
:::::: CC: Wolfram Sang <wsa+renesas@sang-engineering.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
