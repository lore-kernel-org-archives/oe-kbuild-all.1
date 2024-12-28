Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AAE155756
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 21:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735422230; cv=none; b=YFZx+n9tEtC+x9F0Z/HOABR+BTGPu9BCX6sTpdBhn/yW0fBMMLzIC0L5HpfXYWGOwb3AuOoKEDZ8mS8Jf0ONfLGc1ohgfltRzzD3H92ODudt4NjKoRRWw3ASSX4v4Ut2uB9JFDoQDkpiAPTtE5GNKL3lmUfdyy28u0SqffhL5Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735422230; c=relaxed/simple;
	bh=CXsiQBQwz4+kW0iyDGpEB8CyA5pxu+lK/EDMYaQKQaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkskaPxPY516bBUG9rOfryIO81ipvC/xExtsYCNDq2dK3X6PPxI1UwMpjPUbNBrMXvMrkzQZl6gFCuUdSdp1vlLOEvLIFoPwEELBsgRFDg1awuG5X+F4RM8vs771F4y0Qk9piO1DCp10nb1nvQcTTqkulQ8DK+TM3Uej12dCgEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoT4ljbU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoT4ljbU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735422228; x=1766958228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CXsiQBQwz4+kW0iyDGpEB8CyA5pxu+lK/EDMYaQKQaQ=;
  b=AoT4ljbUGgaDcaj/s2rzndsnrI14HwtPFlwa/m5WeVkcyO5UjnXdP2Tn
   yvAPEY3C+dOrHyOX7TEhJnzD7CpBUovcUUul+fBIKyfGKkxHC7D/XBeOO
   wZS23sNU2Ws6hWwHpd/x5OnV58R1n8mx/D32NF9BhYAmy+1K7RJyQJ0+3
   ZUEW65kCpYckaV2ux6lJ5FJraW0/tNlFI0uNJlTCUbE7vcyg4v7z9Wt3x
   1tLne/ZWvr7jC+kVHBgatI7RS+b59RC79MfKH+kYQy1qg4vDn+nnHx/cf
   9tLOnydYXgEWxZfNpR7/lL4t7WTamkuuxesadj6RebjfhehMHy7oKvx0i
   Q==;
X-CSE-ConnectionGUID: 3qdJ7lgxQX2EQt5cTCl6ug==
X-CSE-MsgGUID: Ka69WC1ESyKcvlukPQsDiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46766795"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="46766795"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 13:43:47 -0800
X-CSE-ConnectionGUID: ruuY8zzLQgOZTwIpT97UIA==
X-CSE-MsgGUID: zVjzC5uBRams3wu/NGbPiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105043595"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Dec 2024 13:43:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tReb1-0004Kc-25;
	Sat, 28 Dec 2024 21:43:43 +0000
Date: Sun, 29 Dec 2024 05:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/md/bcache/request.c:309: warning: Function parameter or
 struct member 'bch_data_insert' not described in 'CLOSURE_CALLBACK'
Message-ID: <202412290559.wDnxcBVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: d4e3b928ab487a8aecd1f6a140b40ac365116cfb closures: CLOSURE_CALLBACK() to fix type punning
date:   1 year, 1 month ago
config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241229/202412290559.wDnxcBVn-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290559.wDnxcBVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290559.wDnxcBVn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/bcache/request.c:309: warning: Function parameter or struct member 'bch_data_insert' not described in 'CLOSURE_CALLBACK'
>> drivers/md/bcache/request.c:309: warning: expecting prototype for bch_data_insert(). Prototype was for CLOSURE_CALLBACK() instead


vim +309 drivers/md/bcache/request.c

cafe563591446cf Kent Overstreet 2013-03-23  287  
cafe563591446cf Kent Overstreet 2013-03-23  288  /**
a34a8bfd4e6358c Kent Overstreet 2013-10-24  289   * bch_data_insert - stick some data in the cache
47344e330eabc15 Bart Van Assche 2018-03-18  290   * @cl: closure pointer.
cafe563591446cf Kent Overstreet 2013-03-23  291   *
cafe563591446cf Kent Overstreet 2013-03-23  292   * This is the starting point for any data to end up in a cache device; it could
cafe563591446cf Kent Overstreet 2013-03-23  293   * be from a normal write, or a writeback write, or a write to a flash only
cafe563591446cf Kent Overstreet 2013-03-23  294   * volume - it's also used by the moving garbage collector to compact data in
cafe563591446cf Kent Overstreet 2013-03-23  295   * mostly empty buckets.
cafe563591446cf Kent Overstreet 2013-03-23  296   *
cafe563591446cf Kent Overstreet 2013-03-23  297   * It first writes the data to the cache, creating a list of keys to be inserted
cafe563591446cf Kent Overstreet 2013-03-23  298   * (if the data had to be fragmented there will be multiple keys); after the
cafe563591446cf Kent Overstreet 2013-03-23  299   * data is written it calls bch_journal, and after the keys have been added to
cafe563591446cf Kent Overstreet 2013-03-23  300   * the next journal write they're inserted into the btree.
cafe563591446cf Kent Overstreet 2013-03-23  301   *
3db4d0783eaf2a2 Shenghui Wang   2018-12-13  302   * It inserts the data in op->bio; bi_sector is used for the key offset,
cafe563591446cf Kent Overstreet 2013-03-23  303   * and op->inode is used for the key inode.
cafe563591446cf Kent Overstreet 2013-03-23  304   *
3db4d0783eaf2a2 Shenghui Wang   2018-12-13  305   * If op->bypass is true, instead of inserting the data it invalidates the
3db4d0783eaf2a2 Shenghui Wang   2018-12-13  306   * region of the cache represented by op->bio and op->inode.
cafe563591446cf Kent Overstreet 2013-03-23  307   */
d4e3b928ab487a8 Kent Overstreet 2023-11-17  308  CLOSURE_CALLBACK(bch_data_insert)
cafe563591446cf Kent Overstreet 2013-03-23 @309  {
d4e3b928ab487a8 Kent Overstreet 2023-11-17  310  	closure_type(op, struct data_insert_op, cl);
cafe563591446cf Kent Overstreet 2013-03-23  311  
60ae81eee86dd7a Slava Pestov    2014-05-22  312  	trace_bcache_write(op->c, op->inode, op->bio,
60ae81eee86dd7a Slava Pestov    2014-05-22  313  			   op->writeback, op->bypass);
220bb38c21b83e2 Kent Overstreet 2013-09-10  314  
220bb38c21b83e2 Kent Overstreet 2013-09-10  315  	bch_keylist_init(&op->insert_keys);
220bb38c21b83e2 Kent Overstreet 2013-09-10  316  	bio_get(op->bio);
d4e3b928ab487a8 Kent Overstreet 2023-11-17  317  	bch_data_insert_start(&cl->work);
cafe563591446cf Kent Overstreet 2013-03-23  318  }
cafe563591446cf Kent Overstreet 2013-03-23  319  

:::::: The code at line 309 was first introduced by commit
:::::: cafe563591446cf80bfbc2fe3bc72a2e36cf1060 bcache: A block layer cache

:::::: TO: Kent Overstreet <koverstreet@google.com>
:::::: CC: Kent Overstreet <koverstreet@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
