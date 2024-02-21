Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0647786AD5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 20:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708547411; cv=none; b=iWcK3w9fvfLR9ogF3GtmtyIS8c2uRjI+p/0GOl5NisTpTcRhCrbtAd40XQj81TgCo8GU/++TCuLNTodPin9HRcaOhtfoeHYuqrXcea0+kKuPDitKit9OtMl+R9RCXd1hZnMJ6OBFKKfgC+ySkdX4pOOoziyzQPpu939b1brGQT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708547411; c=relaxed/simple;
	bh=TcGD3l6tIHiyM9ydfueVwC9eQNlDO5wUr7tDtd3IGjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XkMN7t+VvFZORMUsyY4/iS2UUEffeW8Prfx3jJh8K7X8VP62y5A4sIJ7IowE8Le+O2x/xdQeX/gaPULikGacwu9YR3j/uYFV2DduHOuQ5kSX7Fr6Xu7tIb00CR+MKPn8he2HCCT5BlHtsKoZEFtqFnMqTiCACGuMpyRdNCaVeOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2mn2eXJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2mn2eXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708547410; x=1740083410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TcGD3l6tIHiyM9ydfueVwC9eQNlDO5wUr7tDtd3IGjk=;
  b=b2mn2eXJ4/6YIvvLbpamYcNLmYEbWIzjkf/76JIq+RK3rnER0l6c9UTx
   J9tdOfIno1UY28CiF0v6/aVI1X93C0bzXrWO8TgwGPowhVrbetAi5psPA
   isdTMHYrExfUDNBqrkzRv1iCM6H+VwAqEp3K/K6ggznIetH+EoCNlCobQ
   T0xpKB1ykaCG8SZvqUvo7ML2uQqxUgo+954IRfJxG1MJvAZ7cB+d+uWH+
   OLhQ8uRFaEZ5w5LOyW5XLwlk2aAoUEHCTeOc5382wAA6CdzgJbFkAvWNS
   1ovCZ5H/MmTA3b3oqEjVG3XdGg8hn+q3d2Iy98ROaseZEqXqbal8mEmbj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14155093"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="14155093"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 12:30:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5544006"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Feb 2024 12:30:08 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rctEE-0005gy-0b;
	Wed, 21 Feb 2024 20:30:06 +0000
Date: Thu, 22 Feb 2024 04:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Chandan Babu R <chandanbabu@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8491/8619] fs/xfs/xfs.o: warning: objtool:
 xfs_da_grow_inode_int+0x6c1: stack state mismatch: reg1[12]=-2-48
 reg2[12]=-1+0
Message-ID: <202402220435.MGN0EV6l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4893c639cc3659cefaa675bf1e59f4e7571afb5c
commit: 5954d6aa1b01ac362d88df2f34073cd23e819c89 [8491/8619] Merge branch 'for-next' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
config: x86_64-randconfig-a016-20220509 (https://download.01.org/0day-ci/archive/20240222/202402220435.MGN0EV6l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220435.MGN0EV6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220435.MGN0EV6l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs.o: warning: objtool: xfs_da_grow_inode_int+0x6c1: stack state mismatch: reg1[12]=-2-48 reg2[12]=-1+0


objdump-func vmlinux.o xfs_da_grow_inode_int:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
