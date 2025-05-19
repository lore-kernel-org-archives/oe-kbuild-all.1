Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5FB79FE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 19:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747682522; cv=none; b=TitbV1EQT2uEfsQ8KAGy3nFyIBrYENb/hmaa8P9sMExM2QaRyosHAmffrvXK+3iA87drcA7aoYE6DVWH8TL5xRspxIXY/3Nsu1W+gEPlWOJjSM3EsDDZH7qpOm6zyhuNb1jbXoTt4izAtqVlGtzzBTeRUBF0WPkoT5Zebikzqvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747682522; c=relaxed/simple;
	bh=A2Q61QVg5QlbIJYeb5dE89oY2Bo2wJt01ZFw69wyD6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aZg4AwsXi5VnJbF/nNN7kGH1Kqxf7mCMt0Vvx1gT1jnIWbMsyeT/cl1MbY6jH9yGlbeClQEkZKnS2OqgeCFiBvpEqiTwRSX5Olz6eI3FxDvXcaYyO9T92vkxl1+9W9/AiJPoPq9RGO4MToUYI23bCPsL5GW1aClgrj+EpqyqMxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DD4JSzuX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DD4JSzuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747682521; x=1779218521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A2Q61QVg5QlbIJYeb5dE89oY2Bo2wJt01ZFw69wyD6k=;
  b=DD4JSzuXPx2c0NP1Knlpews+O5uov0ITyLI+vqnHzcDR8IDkQbu0GlPa
   qJhS2voKInm9vCNx1tkxieJ3Vnl+gw6w8l6tWyGUW+qIsrWp5wMAuDSiq
   4+6bn+bNw0+vqgKStdItb77b9DSxcjc6tSjcM9DXRzo7AHKagBxkBgwzv
   t3tP85izsn0rcNvwRuwzZ/3w4xXeVKHe52dBI4FzsfXlaWvArbn9TLqsn
   bf4ruh3cDQ/xAQD5Fe1VbAj6pvAzXiagkTuagQ7+GPNdTLCm9ENTh4o22
   B98zqXjjLQECDRPwKyxGSu3l8anc8zQtcCIXWVrGiEyKEjGBolQg87kVq
   A==;
X-CSE-ConnectionGUID: +pAgGJ2mRoq0Sm7jUgoQTQ==
X-CSE-MsgGUID: raUEiT/UT5Kw3lpBiN5nvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49471137"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49471137"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 12:22:00 -0700
X-CSE-ConnectionGUID: 44lTzKFST62JOvufxrlf6w==
X-CSE-MsgGUID: RqT7KmWkRn2Rg0V9oyZClQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="140358983"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 May 2025 12:22:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH63g-000LmI-26;
	Mon, 19 May 2025 19:21:56 +0000
Date: Tue, 20 May 2025 03:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 248/248]
 fs/bcachefs/namei.c:931:13: error: 'c' undeclared
Message-ID: <202505200315.wODchHdN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   b6aa7bcff58f6bbc4df105abb8a25032d70db69e
commit: b6aa7bcff58f6bbc4df105abb8a25032d70db69e [248/248] fixup! bcachefs: BCH_INODE_has_case_insensitive
config: i386-buildonly-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250520/202505200315.wODchHdN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200315.wODchHdN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200315.wODchHdN-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/namei.c: In function 'bch2_check_inode_has_case_insensitive':
>> fs/bcachefs/namei.c:931:13: error: 'c' undeclared (first use in this function)
     931 |         if (c->sb.version < bcachefs_metadata_version_inode_has_case_insensitive)
         |             ^
   fs/bcachefs/namei.c:931:13: note: each undeclared identifier is reported only once for each function it appears in


vim +/c +931 fs/bcachefs/namei.c

   909	
   910	int bch2_check_inode_has_case_insensitive(struct btree_trans *trans,
   911						  struct bch_inode_unpacked *inode,
   912						  snapshot_id_list *snapshot_overwrites,
   913						  bool *do_update)
   914	{
   915		struct printbuf buf = PRINTBUF;
   916		bool repairing_parents = false;
   917		int ret = 0;
   918	
   919		if (!S_ISDIR(inode->bi_mode)) {
   920			/*
   921			 * Old versions set bi_casefold for non dirs, but that's
   922			 * unnecessary and wasteful
   923			 */
   924			if (inode->bi_casefold) {
   925				inode->bi_casefold = 0;
   926				*do_update = true;
   927			}
   928			return 0;
   929		}
   930	
 > 931		if (c->sb.version < bcachefs_metadata_version_inode_has_case_insensitive)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
