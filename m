Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51122B9A9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 06:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709878002; cv=none; b=DXQETPH981MIlG4K5udegS40HvpNwUbWdI0HD1SM81ABOyoQnyMxYFh+SVcrXjN68JcorkXNmdmPi8leMxLsHTyrmAGqzICvXTade6u1aShENZlDHAb1roU9mdbFEJeXbOCg/L7Ln1DfDCw4ywS4W9oCzJT3XWAfON33mp7X/34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709878002; c=relaxed/simple;
	bh=UZ+rBbBpMNP0ZM9RkjpdRtWsc85OLMMP6OfLJh24V+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oeTFAE0YLS7PklYuNWo2tXuZaFF/sZ+ha8MDCBwzaWangoGUagipEf6/+3cFo8TiM25NAYbPbTFlOrUWYYb41IMH3yFK2V9eNEKwAkNio0+lZddKkbSB+qZktN9pvRvonJy1ZDe6/QpBntWPFs7EEJOjVkhbjPfSzyKyl4FXIes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShYZbIJT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShYZbIJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709878000; x=1741414000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZ+rBbBpMNP0ZM9RkjpdRtWsc85OLMMP6OfLJh24V+k=;
  b=ShYZbIJTOFpAiABChUXBg40SABpsdcGKK5EwZ3ykofEOcH3qaQcghWwT
   HNuzBnhqeLN/w6PhYi1hlXXO3L+ObVENTG/Nwhuntk5gbCDS6x/oGg4LL
   gUmJj43b8AuEGsNI1lpbX6wEpOBuWLRG12U9d0xKgSizEXJFpUs1y+Yvx
   4ok0vzzbd/eLeZj6F2JKJRrNVHwtE/pbXkk9PppAB3J5a2fiTX+HqadKg
   nL2gnsUR01f7W/kOfdy3+BkTSdP96h9K0xznG4jJXhAFK+wRJBtUvb4Gs
   HEFV08yyKzQtDSgdQrctqoqeIoML0lNznjNrpWQOuV/8D/FgDPEo6AuW3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4711620"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4711620"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 22:06:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="10302015"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Mar 2024 22:06:39 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riTNM-00065P-2a;
	Fri, 08 Mar 2024 06:06:36 +0000
Date: Fri, 8 Mar 2024 14:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fsverity-cleanups-6.9 10/37] fs/iomap/buffered-io.c:545:
 warning: Excess function parameter 'wq' description in 'iomap_readahead'
Message-ID: <202403081302.tvY9Y5qs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fsverity-cleanups-6.9
head:   0dbdaafd38ae4f4af18c8650ff875d6a39f50bc4
commit: 975b2d2cf956c84cd91bbf1ba93bbcbcb76ad113 [10/37] iomap: integrate fs-verity verification into iomap's read path
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240308/202403081302.tvY9Y5qs-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081302.tvY9Y5qs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081302.tvY9Y5qs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/iomap/buffered-io.c:545: warning: Excess function parameter 'wq' description in 'iomap_readahead'


vim +545 fs/iomap/buffered-io.c

afc51aaa22f26c Darrick J. Wong         2019-07-15  527  
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  528) /**
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  529)  * iomap_readahead - Attempt to read pages from a file.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  530)  * @rac: Describes the pages to be read.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  531)  * @ops: The operations vector for the filesystem.
975b2d2cf956c8 Andrey Albershteyn      2023-06-14  532   * @wq: Workqueue for post-I/O processing (only need for fsverity)
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  533)  *
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  534)  * This function is for filesystems to call to implement their readahead
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  535)  * address_space operation.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  536)  *
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  537)  * Context: The @ops callbacks may submit I/O (eg to read the addresses of
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  538)  * blocks from disc), and may wait for it.  The caller may be trying to
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  539)  * access a different page, and so sleeping excessively should be avoided.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  540)  * It may allocate memory, but should avoid costly allocations.  This
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  541)  * function is called with memalloc_nofs set, so allocations will not cause
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  542)  * the filesystem to be reentered.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  543)  */
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  544) void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops)
afc51aaa22f26c Darrick J. Wong         2019-07-15 @545  {
f6d480006cea3f Christoph Hellwig       2021-08-10  546  	struct iomap_iter iter = {
f6d480006cea3f Christoph Hellwig       2021-08-10  547  		.inode	= rac->mapping->host,
f6d480006cea3f Christoph Hellwig       2021-08-10  548  		.pos	= readahead_pos(rac),
f6d480006cea3f Christoph Hellwig       2021-08-10  549  		.len	= readahead_length(rac),
f6d480006cea3f Christoph Hellwig       2021-08-10  550  	};
afc51aaa22f26c Darrick J. Wong         2019-07-15  551  	struct iomap_readpage_ctx ctx = {
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  552) 		.rac	= rac,
afc51aaa22f26c Darrick J. Wong         2019-07-15  553  	};
afc51aaa22f26c Darrick J. Wong         2019-07-15  554  
f6d480006cea3f Christoph Hellwig       2021-08-10  555  	trace_iomap_readahead(rac->mapping->host, readahead_count(rac));
9e91c5728cab3d Christoph Hellwig       2019-10-17  556  
f6d480006cea3f Christoph Hellwig       2021-08-10  557  	while (iomap_iter(&iter, ops) > 0)
f6d480006cea3f Christoph Hellwig       2021-08-10  558  		iter.processed = iomap_readahead_iter(&iter, &ctx);
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  559) 
afc51aaa22f26c Darrick J. Wong         2019-07-15  560  	if (ctx.bio)
afc51aaa22f26c Darrick J. Wong         2019-07-15  561  		submit_bio(ctx.bio);
3aa9c659bf821f Matthew Wilcox (Oracle  2021-04-28  562) 	if (ctx.cur_folio) {
3aa9c659bf821f Matthew Wilcox (Oracle  2021-04-28  563) 		if (!ctx.cur_folio_in_bio)
3aa9c659bf821f Matthew Wilcox (Oracle  2021-04-28  564) 			folio_unlock(ctx.cur_folio);
afc51aaa22f26c Darrick J. Wong         2019-07-15  565  	}
afc51aaa22f26c Darrick J. Wong         2019-07-15  566  }
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  567) EXPORT_SYMBOL_GPL(iomap_readahead);
afc51aaa22f26c Darrick J. Wong         2019-07-15  568  

:::::: The code at line 545 was first introduced by commit
:::::: afc51aaa22f26cb2894083c4f25097e0950f1609 iomap: move the buffered IO code into a separate file

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Darrick J. Wong <darrick.wong@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
