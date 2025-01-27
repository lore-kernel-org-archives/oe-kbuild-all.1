Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49C01FECD8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984727; cv=none; b=LQFjFRPbUuu37UrjvSloNwBXqM6MeNE42Xrp5YFo7odAnVN7YX2JobyptQXZRGIUFzi2uneza+QZi0Sz2KNxpzzowtvAYpZTxOtN8yUHkXMQ+k+/UGj854LmtyLCmSW0Ee0rAxDOiLnDXiWiQbG0IsAQ+qihft6OmaMC6bufGQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984727; c=relaxed/simple;
	bh=tmEDA2m5HskvtZ7KWHl2frKKx/2NsBNRzglBdouThBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=st8UsmXPS9duecb80DCfCqGDZPht+ojSYY/vE5mh6utCHAwqJT20Lx/PGCn6gLYSKzgznzMHHZXsyREJA6Xnv4X2cErQmPmyleImtiURylaHKL6KMz2GB91Cwg16jwInVux+IGYsu88d0ks1VdqLy/o5GibAiVoy1Fpn7+dWPPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpykXfD5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpykXfD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737984726; x=1769520726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tmEDA2m5HskvtZ7KWHl2frKKx/2NsBNRzglBdouThBQ=;
  b=kpykXfD52AseQ6A8E9qDnP+PDU1n+4BZWrjzDTZgBOYlL3Yoi8Y8EHcB
   T9VYzfCpKX+0ssOFOBcfMiaZWl8Mq2y1Y/sdBkHcuUcoidoK6P/16Uxm9
   DFRIm/dyvs4alL+CxFf2XWt5897762PN35ntjC29+E6IRwefyWE+nBf/C
   drXD/qjhuVluEM/we7oSznh2God1oLQYEJPj1awZiNrFG3n2eGwrb5NoR
   UgJ91yV5TEVOoDPtqUrmaWbJj9Gffj43sI5g7VdG9psrAk4kX61v+4zI5
   NLPrZO/r7vB9jllxooncqLb50+HIcquo2PnJpGoVuzVNOLTJcbaRxEZCJ
   g==;
X-CSE-ConnectionGUID: gxdkcMJdSVet7ZL4fPyUzw==
X-CSE-MsgGUID: 95EzMmK1S8ecQtD3zk2Bfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38583127"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="38583127"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 05:32:05 -0800
X-CSE-ConnectionGUID: 9UNEc9noTJuW8KR/6tq+TQ==
X-CSE-MsgGUID: 8o6h8JA4QRWLnFp71Be5Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="108547454"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jan 2025 05:32:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcPDd-000gnt-1t;
	Mon, 27 Jan 2025 13:32:01 +0000
Date: Mon, 27 Jan 2025 21:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124 14/15]
 include/linux/container_of.h:19:15: warning: 'fnode' is used uninitialized
Message-ID: <202501272144.yqyXsRII-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250124
head:   86b653e4edef7b0f7b7afe5dd8e0241fc1165238
commit: f66219294267a2fba220f4f3118e11c5cda63d0b [14/15] fs: hpfs: Avoid multiple -Wflex-array-member-not-at-end warnings
config: arm64-randconfig-001-20250127 (https://download.01.org/0day-ci/archive/20250127/202501272144.yqyXsRII-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501272144.yqyXsRII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501272144.yqyXsRII-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/list.h:5,
                    from include/linux/mutex.h:15,
                    from fs/hpfs/hpfs_fn.h:18,
                    from fs/hpfs/anode.c:10:
   fs/hpfs/anode.c: In function 'hpfs_add_sector_to_btree':
>> include/linux/container_of.h:19:15: warning: 'fnode' is used uninitialized [-Wuninitialized]
      19 |         void *__mptr = (void *)(ptr);                                   \
         |               ^~~~~~
   fs/hpfs/anode.c:74:44: note: in expansion of macro 'container_of'
      74 |         struct bplus_header *fnode_btree = container_of(&fnode->btree, struct bplus_header, __hdr);
         |                                            ^~~~~~~~~~~~
   fs/hpfs/anode.c:65:23: note: 'fnode' was declared here
      65 |         struct fnode *fnode;
         |                       ^~~~~


vim +/fnode +19 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko  2021-11-08   9  
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  15   *
7376e561fd2e01 Sakari Ailus     2022-10-24  16   * WARNING: any const qualifier of @ptr is lost.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  17   */
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  18  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08 @19  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  20  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  21  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  22  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  23  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  24  

:::::: The code at line 19 was first introduced by commit
:::::: d2a8ebbf8192b84b11f1b204c4f7c602df32aeac kernel.h: split out container_of() and typeof_member() macros

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
