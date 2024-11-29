Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0039C13DB9F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 20:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732911292; cv=none; b=QexW7sc4ib9iJDA2F5HI4auyS+rirwTkqXf7vfIfxrbEwja6AGYzQS8NgJEiMo9wOp2IIBwqj0tQHyPvOHyKqZudxXATFPtmFAFPWjEzWhERuGUnZr5Mfe5duOkM8BrXYYzq95HG9ezcT7lbC4gQFE9YsdnGmqqVS4cM1XDTZSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732911292; c=relaxed/simple;
	bh=ElAjPCh+tJLykm3F7USV6k1G1bQwdlMTUGXXdM5JEg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YnwSQO00qGZVFT78/x6x2RTqOg/yaqSI1+Fsw7s8tn3Cd0Tm54+0BZDu4warI6bXdHhz6tsjDyXG5alfb6ztM11Wdds7ftpi9uY6HP6t3E6eLZ8xSch96ndy1ekEMmc0RP2qJmfpwhsKaGLgL91mDY+ylMM2eSKT08jYvQBitVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bK8MSqaW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bK8MSqaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732911290; x=1764447290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ElAjPCh+tJLykm3F7USV6k1G1bQwdlMTUGXXdM5JEg4=;
  b=bK8MSqaW9dVwlSuGuBQSBxLQn8XKuVMWX1vhqBmKiQ5RudNSnyO4qmgq
   E0vbG5WMBxKFBkMZhDKO6qQAHN7Rc/mEdO/tHz6xBT0KSjX7PWuLl8TR7
   J/KBnrXnaGBU1YZLvY2FlSfbSYptpPlMRvVjfn706qJtOKneGA+j4Wh6L
   xxskX9BAWwbbJsNuxfD33TpGfxbOZnq/L20cWD3N5cKf3wbLnfkrX+lPM
   iIWdz7OTeSn/dZz6H9MX6CSd9jzd72c2WrD4Tfy3wiOZ5nUNL7jQ7XBcR
   T9pZXf/Ee4z9ge3tVdywrao5fllLkOujaE0sf118NR6NvQqpmQ2ycnl3j
   g==;
X-CSE-ConnectionGUID: btC+YkPHR1uwF2f2r7JXsw==
X-CSE-MsgGUID: 7jR72cRNTdeJlrti4LCMsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="44523097"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="44523097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 12:14:49 -0800
X-CSE-ConnectionGUID: 83sLVOQhS62yYS4mjuY+3A==
X-CSE-MsgGUID: NhSiJXSRQ9ulxrq3oO6Ucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="92733930"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Nov 2024 12:14:48 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH7O2-0000fZ-1D;
	Fri, 29 Nov 2024 20:14:46 +0000
Date: Sat, 30 Nov 2024 04:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 49/92] fs/afs/write.c:313:13: warning:
 'netfs_dump_sg' defined but not used
Message-ID: <202411300454.2MPbBgrd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   ae69436bf8db8f3a53edd0dfa379e753700240c0
commit: 60df3102afd636c54591818d78bc1b3965a9a6f3 [49/92] afs: [DON'T MERGE] Implement trivial content crypto for testing purposes
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241130/202411300454.2MPbBgrd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300454.2MPbBgrd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300454.2MPbBgrd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/afs/write.c:313:13: warning: 'netfs_dump_sg' defined but not used [-Wunused-function]
     313 | static void netfs_dump_sg(const char *prefix, struct scatterlist *sg, unsigned int n_sg)
         |             ^~~~~~~~~~~~~


vim +/netfs_dump_sg +313 fs/afs/write.c

   312	
 > 313	static void netfs_dump_sg(const char *prefix, struct scatterlist *sg, unsigned int n_sg)
   314	{
   315		unsigned int i;
   316	
   317		for (i = 0; i < n_sg; i++) {
   318			void *p = kmap_local_page(sg_page(sg));
   319			unsigned int l = min_t(size_t, sg->length, 16);
   320	
   321			printk("%s[%x] %016lx %04x %04x %*phN\n",
   322			       prefix, i, sg->page_link, sg->offset, sg->length,
   323			       l, p + sg->offset);
   324			kunmap_local(p);
   325			sg++;
   326		}
   327	}
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
