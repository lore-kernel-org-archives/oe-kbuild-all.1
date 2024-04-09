Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931107D094
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 11:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712663701; cv=none; b=msJG6s/Yd8r1jFFapwxprq0wEaofNOTiWu7F91viRKk6SSDAY7DP9KfDp+C+9cK9Jj7A+dP2YkHny3kZFUxfgE3ZWyvr44vu/GwV2t5/e4bApxFhZtB0qqd7P4MX5p5Q6O8Zu5ZnvTseDa+81yz4V64brz3qmDBO+bgAXDqsI2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712663701; c=relaxed/simple;
	bh=4Rj6IuCv56b5ziJeMh4MOc+pb+mq01ZYl2LKL6sHWNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pkSItG5MWnna+hjZBBGpFyadznuv2GaltM4psNUtaG5Qumv6rWiA6oKSZegZ19RUsdRXo6iD9zuEAdp+L1Z60IOAqx/kDIbCwIpkql0zVFjuyzHb/qirC3w0UH04HQpdZHkkQ00OJ4kecJA6jYvgLHKqU2y2fOjdR5Hs6W04pq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cph+fbyE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cph+fbyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712663700; x=1744199700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Rj6IuCv56b5ziJeMh4MOc+pb+mq01ZYl2LKL6sHWNI=;
  b=cph+fbyEhoivnFsgYMwgqaZiRlaT+yLtxXASgy61nRItVtwR1J03zrdz
   1dS2THGT7ryz0O9shOXYdpgYAM1EZgdnr0gs0XYlbsM24oOuZgIc0vuz0
   ST6ibvFYI3ugBOWk9n9S2LMW/usoHWfhqecmnKjj8LJMKZdSadPGkqr6G
   D/fCpcX9hEBuorxXPxol/x8ewDuLY3nLuIW0TmYagtc/Zjs2i/U1DCrd9
   yUILEniDWeWyu1yLnHcYLYRna2MrUci5Zgc4N/9XvAZx8lg6oCNV61rER
   FKLQGly+GHa5qERUsgKM+ihv2BuZFTWGr6Q7HuSurypWkL6NFcVnHT/QQ
   g==;
X-CSE-ConnectionGUID: n4twqf4cRfK/Eth38QHSSg==
X-CSE-MsgGUID: TqCaiNa5QeaJRfhDoreO+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7885278"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7885278"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:54:59 -0700
X-CSE-ConnectionGUID: ikVFSzjiRGiYK8vMXGTIOQ==
X-CSE-MsgGUID: p+r4QCJDRiaPJaJCpwvL1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="43411319"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Apr 2024 04:54:58 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruA3z-00062c-25;
	Tue, 09 Apr 2024 11:54:55 +0000
Date: Tue, 9 Apr 2024 19:54:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 451/456] lib/sort.c:328: multiple
 definition of `eytzinger0_sort_r';
 fs/bcachefs/eytzinger.o:fs/bcachefs/eytzinger.c:173: first defined here
Message-ID: <202404091928.W1EO5tIF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   7a558c88692bfaf587bfeb687ea9fe0d4d98632c
commit: 14c3048e0c1aad74af0692c5312d4e4fc4edf7cf [451/456] eytzinger: Promote to include/linux/
config: i386-randconfig-002-20240409 (https://download.01.org/0day-ci/archive/20240409/202404091928.W1EO5tIF-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404091928.W1EO5tIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404091928.W1EO5tIF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: lib/sort.o: in function `eytzinger0_sort_r':
>> lib/sort.c:328: multiple definition of `eytzinger0_sort_r'; fs/bcachefs/eytzinger.o:fs/bcachefs/eytzinger.c:173: first defined here
   ld: lib/sort.o: in function `eytzinger0_sort':
>> lib/sort.c:383: multiple definition of `eytzinger0_sort'; fs/bcachefs/eytzinger.o:fs/bcachefs/eytzinger.c:227: first defined here


vim +328 lib/sort.c

   323	
   324	void eytzinger0_sort_r(void *base, size_t n, size_t size,
   325			       cmp_r_func_t cmp_func,
   326			       swap_r_func_t swap_func,
   327			       const void *priv)
 > 328	{
   329		int i, c, r;
   330	
   331		/* called from 'sort' without swap function, let's pick the default */
   332		if (swap_func == SWAP_WRAPPER && !((struct wrapper *)priv)->swap)
   333			swap_func = NULL;
   334	
   335		if (!swap_func) {
   336			if (is_aligned(base, size, 8))
   337				swap_func = SWAP_WORDS_64;
   338			else if (is_aligned(base, size, 4))
   339				swap_func = SWAP_WORDS_32;
   340			else
   341				swap_func = SWAP_BYTES;
   342		}
   343	
   344		/* heapify */
   345		for (i = n / 2 - 1; i >= 0; --i) {
   346			for (r = i; r * 2 + 1 < n; r = c) {
   347				c = r * 2 + 1;
   348	
   349				if (c + 1 < n &&
   350				    eytzinger0_do_cmp(base, n, size, cmp_func, priv, c, c + 1) < 0)
   351					c++;
   352	
   353				if (eytzinger0_do_cmp(base, n, size, cmp_func, priv, r, c) >= 0)
   354					break;
   355	
   356				eytzinger0_do_swap(base, n, size, swap_func, priv, r, c);
   357			}
   358		}
   359	
   360		/* sort */
   361		for (i = n - 1; i > 0; --i) {
   362			eytzinger0_do_swap(base, n, size, swap_func, priv, 0, i);
   363	
   364			for (r = 0; r * 2 + 1 < i; r = c) {
   365				c = r * 2 + 1;
   366	
   367				if (c + 1 < i &&
   368				    eytzinger0_do_cmp(base, n, size, cmp_func, priv, c, c + 1) < 0)
   369					c++;
   370	
   371				if (eytzinger0_do_cmp(base, n, size, cmp_func, priv, r, c) >= 0)
   372					break;
   373	
   374				eytzinger0_do_swap(base, n, size, swap_func, priv, r, c);
   375			}
   376		}
   377	}
   378	EXPORT_SYMBOL_GPL(eytzinger0_sort_r);
   379	
   380	void eytzinger0_sort(void *base, size_t n, size_t size,
   381			     cmp_func_t cmp_func,
   382			     swap_func_t swap_func)
 > 383	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
