Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40127CA4B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 19:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745263921; cv=none; b=XjCoTbf7wq6u3QwB2I3oidmKguzSAmc68CwfRiwShd7MvDxV6xhmxf7686UnuhPoxXwAhEFI/lPaWJIVQN0R8NS2Q8TSxewv6g6ZzlzypbiDmfvIzLM5x1TVujoSsQ/nz+VNQpgKGHslLhts54XuBIj3ArIw5uOtLHfEYWwqoAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745263921; c=relaxed/simple;
	bh=kfWldk9veq250ds4vvJPQelSOPBfNQeBzjpC1xz+Mgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/96jDd5dizdbXuwbGLckPNbrRIeltJUwzYFUilKF+9jsl+fuIf1T/xz4gHd0X7IvNMOYYUOQuKSFcj5FFJjHbPtHk2I/vF1JDfgq2nHUwu+h8bc/rTmTyrKNmNl1gqFTP9nTAI0cFjqSosDDmNfud9ZHKeDFFO+vrFhYr1Mffs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOFyQUpi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOFyQUpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745263919; x=1776799919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kfWldk9veq250ds4vvJPQelSOPBfNQeBzjpC1xz+Mgs=;
  b=aOFyQUpi/UjBEIuS4daDs5R7BQl4ylr/aXBrK1zFRacAoQS/l12It4+o
   QoIl+S21JTWZ1V9JkvMBWQpyaONV2+8X66cZu5fXl5OThV0AM3oApvrWR
   9Y7cBKBE9Orbh7UX5HyXqMrCol8vKiZF8q48N/HnzMqmi5v8mWOnX4O1O
   qFVPk6OYUhIQv1i8aOdu/xSlJCeSfBWjvvi/wYh0p0prSLwntyDB/vcID
   OYH9+BJbYSqrTInxKWf4u5h5d7P9TiTGlcuy8eLOJ3r7503rECBR2UH1A
   dWBTopCyVtiaZtVFci8IwrpMAAqPTBvUjOI/I/fnsS4QMpotsUPWOwP7p
   A==;
X-CSE-ConnectionGUID: mg6synf5QDaT8UT2ivl72A==
X-CSE-MsgGUID: kJcInY96ScqinebAKzIC8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46813758"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="46813758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 12:31:59 -0700
X-CSE-ConnectionGUID: IRzatZUgT9yK/KwSNsG4Xw==
X-CSE-MsgGUID: cJIxlEeKQNCKUU/xgZG/Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="131800778"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Apr 2025 12:31:57 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6wrz-0000Lj-14;
	Mon, 21 Apr 2025 19:31:55 +0000
Date: Tue, 22 Apr 2025 03:31:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-new-helpers 18/18] kernel/power/swap.c:381:6:
 warning: variable 'src' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202504220332.MiiqLjIT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git block-new-helpers
head:   280d8b7173282de4cf4857624def142ed24fad63
commit: 280d8b7173282de4cf4857624def142ed24fad63 [18/18] PM: hibernate: split and simplify hib_submit_io
config: i386-buildonly-randconfig-001-20250422 (https://download.01.org/0day-ci/archive/20250422/202504220332.MiiqLjIT-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220332.MiiqLjIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220332.MiiqLjIT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/swap.c:381:6: warning: variable 'src' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     381 |         if (!hb)
         |             ^~~
   kernel/power/swap.c:397:61: note: uninitialized use occurs here
     397 |         return hib_submit_io_sync(REQ_OP_WRITE | REQ_SYNC, offset, src);
         |                                                                    ^~~
   kernel/power/swap.c:381:2: note: remove the 'if' if its condition is always false
     381 |         if (!hb)
         |         ^~~~~~~~
     382 |                 goto sync_io;
         |                 ~~~~~~~~~~~~
   kernel/power/swap.c:375:11: note: initialize the variable 'src' to silence this warning
     375 |         void *src;
         |                  ^
         |                   = NULL
   1 warning generated.


vim +381 kernel/power/swap.c

   364	
   365	/**
   366	 *	write_page - Write one page to given swap location.
   367	 *	@buf:		Address we're writing.
   368	 *	@offset:	Offset of the swap page we're writing to.
   369	 *	@hb:		bio completion batch
   370	 */
   371	
   372	static int write_page(void *buf, sector_t offset, struct hib_bio_batch *hb)
   373	{
   374		gfp_t gfp = GFP_NOIO | __GFP_NOWARN | __GFP_NORETRY;
   375		void *src;
   376		int ret;
   377	
   378		if (!offset)
   379			return -ENOSPC;
   380	
 > 381		if (!hb)
   382			goto sync_io;
   383	
   384		src = (void *)__get_free_page(gfp);
   385		if (!src) {
   386			ret = hib_wait_io(hb); /* Free pages */
   387			if (ret)
   388				return ret;
   389			src = (void *)__get_free_page(gfp);
   390			if (WARN_ON_ONCE(!src))
   391				goto sync_io;
   392		}
   393	
   394		copy_page(src, buf);
   395		return hib_submit_io_async(REQ_OP_WRITE | REQ_SYNC, offset, src, hb);
   396	sync_io:
   397		return hib_submit_io_sync(REQ_OP_WRITE | REQ_SYNC, offset, src);
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
