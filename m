Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA62826B955
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 21:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752528983; cv=none; b=WcpwDf7d4SLHpKiYei6yoG/PoUjtbBIudT2xAHjBCyAC6hVp0EjzFdD1mMzr/cTs7UxwZXnEBSASni2N4SYAiJJS5AweCqNoSzevPzULQvjRrpJvz57JhGUzfDKwBDDiENb/Wdmv5iid85Gt1z/rrUOxaC0q/45t6LrUcACkbRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752528983; c=relaxed/simple;
	bh=4wC+EksvjEOlRLAdnyvW9FdWHR9DrbgRyU075fwvPQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=InFHS62sKMnFl1VL/DbTxrIi5XQfjGt36s22E3CTz/16ZboE8zyuHpPZrOfealu+FRc26R1rdxLfezURfJsmd3lBpM+PXTiVW2hxxqfzocVUFV7izCAKPQiyWa7Ct3LujiMSYHp3SdUpeQPCQ9BM9fv7TayFP/A5QmHyY5QAweM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIadE7PS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIadE7PS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752528982; x=1784064982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4wC+EksvjEOlRLAdnyvW9FdWHR9DrbgRyU075fwvPQ0=;
  b=mIadE7PSEMW1I4tPlcA2uw4207HOrRRrA/fkcO2rM5znOyNZHnvU6wUm
   STG2CAdpSI6CeWXYF/Ex3f8IhMgIpXGZCK7iP3yRsiu0ENDZTrJ4Ug4v/
   YyOgn/UXP4yM5mhQvizkuRLmCH8E4ZuNN7u39hQ2CEno5japj9F2ppoQf
   5/bk6eqY970MuJbNRjxsL1AXw57tvovfz1CpCu4gmUPyt6azXE897ktb6
   IEC5YCGz3T2lN0Bt0DQZeMNXhAnu0g1RQRKnkDEtBIcrBZEUErk8MT47y
   jheVd02CNtL7XTeFV1YWuXMCrJ90mf5KueOzSytjsL2f+n12mCKvgbQra
   w==;
X-CSE-ConnectionGUID: WPSUNW9pRx2oyTpjodPqAg==
X-CSE-MsgGUID: 92ieGfovR7ePjad/v5t66g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54604964"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="54604964"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 14:36:21 -0700
X-CSE-ConnectionGUID: 1B0fUSR8SG6yic36PfLS/A==
X-CSE-MsgGUID: su105dm7TwiNbN+zH8SMJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="157137328"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jul 2025 14:36:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubQqP-0009Mv-2z;
	Mon, 14 Jul 2025 21:36:17 +0000
Date: Tue, 15 Jul 2025 05:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/g3s/i3c 14/19] drivers/i3c/master/../internals.h:57:16:
 warning: passing argument 1 of 'readsl' discards 'const' qualifier from
 pointer target type
Message-ID: <202507150507.zP6CCoji-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c
head:   96358bcce0f6b8c20c9453ca17d3ad1d16515fd4
commit: 6abea8611079638fcdd60f8a7fb719db07ca1d2e [14/19] i3c: add driver for Renesas I3C controller
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250715/202507150507.zP6CCoji-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150507.zP6CCoji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150507.zP6CCoji-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i3c/master/renesas-i3c.c:26:
   drivers/i3c/master/../internals.h: In function 'i3c_readl_fifo':
>> drivers/i3c/master/../internals.h:57:16: warning: passing argument 1 of 'readsl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      57 |         readsl(addr, buf, nbytes / 4);
         |                ^~~~
   In file included from arch/sparc/include/asm/io.h:5,
                    from include/linux/io.h:12,
                    from include/linux/iopoll.h:14,
                    from drivers/i3c/master/renesas-i3c.c:19:
   arch/sparc/include/asm/io_64.h:265:41: note: expected 'void *' but argument is of type 'const void *'
     265 | static inline void readsl(void __iomem *port, void *buf, unsigned long count)
         |                           ~~~~~~~~~~~~~~^~~~


vim +57 drivers/i3c/master/../internals.h

8af3723cb0b4ec Jorge Marques 2025-06-24  47  
8af3723cb0b4ec Jorge Marques 2025-06-24  48  /**
8af3723cb0b4ec Jorge Marques 2025-06-24  49   * i3c_readl_fifo - Read data buffer from 32bit FIFO
8af3723cb0b4ec Jorge Marques 2025-06-24  50   * @addr: FIFO Address to read from
8af3723cb0b4ec Jorge Marques 2025-06-24  51   * @buf: Pointer to the buffer to store read bytes
8af3723cb0b4ec Jorge Marques 2025-06-24  52   * @nbytes: Number of bytes to read
8af3723cb0b4ec Jorge Marques 2025-06-24  53   */
8af3723cb0b4ec Jorge Marques 2025-06-24  54  static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
8af3723cb0b4ec Jorge Marques 2025-06-24  55  				  int nbytes)
8af3723cb0b4ec Jorge Marques 2025-06-24  56  {
8af3723cb0b4ec Jorge Marques 2025-06-24 @57  	readsl(addr, buf, nbytes / 4);

:::::: The code at line 57 was first introduced by commit
:::::: 8af3723cb0b4ec9f1f4442b617b1990ec0302c8e i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()

:::::: TO: Jorge Marques <jorge.marques@analog.com>
:::::: CC: Wolfram Sang <wsa+renesas@sang-engineering.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
