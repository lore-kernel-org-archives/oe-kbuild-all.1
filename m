Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC021B7FC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 22:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706393227; cv=none; b=BMyae/6dBpWRf3vfxn2x5Qd66tSJYdZviC4F2vTTaSJvnFEWfdh0jOpZXp5BNVtPtSm9LS10jiFrCchfgX2uvMGF29U9LljfwaSYsqHZgcMEOrb6unJIYaNA+S5vEr29U4PEYR1hqaKxe/HlJNJl2ZbWtV5kbFqazG7MpNEBTiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706393227; c=relaxed/simple;
	bh=NRzzWfPc7bpGVh0SRFCcSLuWptd3bOkdj5pOHP6Yjos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JU+SbowfvMDmGeEoHRN84QVrOHE9Ri5KeexJ3OZcaO2wYWQaR4hgwLcHWMwLzhQ3pN2X8ii+TMo+KMrgaB4rdwq88Xj8pNXYrfDauhotCFyPaFGsn55B1oV9CG2kMNXVlsyzLrQFuXkcGmBWERZ+ih3BPgo/+5TtffGlAlqt1Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfdKiWEk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfdKiWEk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706393225; x=1737929225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NRzzWfPc7bpGVh0SRFCcSLuWptd3bOkdj5pOHP6Yjos=;
  b=IfdKiWEkVJdjFOBGzML5MhmSWcACGVwe6rQtNNp9j3zvTglRXTIXESnR
   HibNHjDyIymxUhenYL3oLMrAe9oI01B3kvW0mKL2H0AFZSOsMrOBlovui
   iN5x96xbtjCiZiW+rxPukioNYAepZ+xMJOQcX1KFJ+Jih8grprjHqNxJf
   bwt3kukYqVEG9wHiFMcYweJXHgucSho85HQ3O1inMIOKWnxmgkLUFrXmY
   UJCig526xtAZWX1HC3TMaQc2WZh58ZKVEMb9tvSKQBFcVMD9ZEWCyb+ux
   SYZAjWHoaLFyhmC6SVRW6H/28Ll+eA/cigS2BSOIYmC3ClQ3yB5N4LuSt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="16242509"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="16242509"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 14:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="35771948"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jan 2024 14:07:03 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTqpI-0002mJ-1X;
	Sat, 27 Jan 2024 22:07:00 +0000
Date: Sun, 28 Jan 2024 06:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:buffered.46 19/90] fs/iomap/buffered-io.c:497: warning:
 Function parameter or struct member 'read_folio_ops' not described in
 'iomap_readahead'
Message-ID: <202401280615.8Y6HrUQy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux buffered.46
head:   9b93fddebc916105169c8a82d8f3f20fb30ff277
commit: a6554d1f87d5da065aa8aaedaca6b46e2c474e19 [19/90] iomap: Introduce iomap_read_folio_ops
config: i386-buildonly-randconfig-004-20240127 (https://download.01.org/0day-ci/archive/20240128/202401280615.8Y6HrUQy-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280615.8Y6HrUQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280615.8Y6HrUQy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/iomap/buffered-io.c:497: warning: Function parameter or struct member 'read_folio_ops' not described in 'iomap_readahead'


vim +497 fs/iomap/buffered-io.c

afc51aaa22f26c Darrick J. Wong         2019-07-15  479  
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  480) /**
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  481)  * iomap_readahead - Attempt to read pages from a file.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  482)  * @rac: Describes the pages to be read.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  483)  * @ops: The operations vector for the filesystem.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  484)  *
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  485)  * This function is for filesystems to call to implement their readahead
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  486)  * address_space operation.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  487)  *
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  488)  * Context: The @ops callbacks may submit I/O (eg to read the addresses of
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  489)  * blocks from disc), and may wait for it.  The caller may be trying to
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  490)  * access a different page, and so sleeping excessively should be avoided.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  491)  * It may allocate memory, but should avoid costly allocations.  This
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  492)  * function is called with memalloc_nofs set, so allocations will not cause
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  493)  * the filesystem to be reentered.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  494)  */
a6554d1f87d5da Goldwyn Rodrigues       2023-04-04  495  void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops,
a6554d1f87d5da Goldwyn Rodrigues       2023-04-04  496  		const struct iomap_read_folio_ops *read_folio_ops)
afc51aaa22f26c Darrick J. Wong         2019-07-15 @497  {
f6d480006cea3f Christoph Hellwig       2021-08-10  498  	struct iomap_iter iter = {
f6d480006cea3f Christoph Hellwig       2021-08-10  499  		.inode	= rac->mapping->host,
f6d480006cea3f Christoph Hellwig       2021-08-10  500  		.pos	= readahead_pos(rac),
f6d480006cea3f Christoph Hellwig       2021-08-10  501  		.len	= readahead_length(rac),
f6d480006cea3f Christoph Hellwig       2021-08-10  502  	};
afc51aaa22f26c Darrick J. Wong         2019-07-15  503  	struct iomap_readpage_ctx ctx = {
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  504) 		.rac	= rac,
a6554d1f87d5da Goldwyn Rodrigues       2023-04-04  505  		.ops	= read_folio_ops,
afc51aaa22f26c Darrick J. Wong         2019-07-15  506  	};
afc51aaa22f26c Darrick J. Wong         2019-07-15  507  
f6d480006cea3f Christoph Hellwig       2021-08-10  508  	trace_iomap_readahead(rac->mapping->host, readahead_count(rac));
9e91c5728cab3d Christoph Hellwig       2019-10-17  509  
f6d480006cea3f Christoph Hellwig       2021-08-10  510  	while (iomap_iter(&iter, ops) > 0)
f6d480006cea3f Christoph Hellwig       2021-08-10  511  		iter.processed = iomap_readahead_iter(&iter, &ctx);
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  512) 
a6554d1f87d5da Goldwyn Rodrigues       2023-04-04  513  	if (ctx.bio) {
a6554d1f87d5da Goldwyn Rodrigues       2023-04-04  514  		if (ctx.ops && ctx.ops->submit_io)
a6554d1f87d5da Goldwyn Rodrigues       2023-04-04  515  			ctx.ops->submit_io(iter.inode, &iter.iomap, ctx.bio);
a6554d1f87d5da Goldwyn Rodrigues       2023-04-04  516  		else
afc51aaa22f26c Darrick J. Wong         2019-07-15  517  			submit_bio(ctx.bio);
a6554d1f87d5da Goldwyn Rodrigues       2023-04-04  518  	}
3aa9c659bf821f Matthew Wilcox (Oracle  2021-04-28  519) 	if (ctx.cur_folio) {
3aa9c659bf821f Matthew Wilcox (Oracle  2021-04-28  520) 		if (!ctx.cur_folio_in_bio)
3aa9c659bf821f Matthew Wilcox (Oracle  2021-04-28  521) 			folio_unlock(ctx.cur_folio);
afc51aaa22f26c Darrick J. Wong         2019-07-15  522  	}
afc51aaa22f26c Darrick J. Wong         2019-07-15  523  }
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  524) EXPORT_SYMBOL_GPL(iomap_readahead);
afc51aaa22f26c Darrick J. Wong         2019-07-15  525  

:::::: The code at line 497 was first introduced by commit
:::::: afc51aaa22f26cb2894083c4f25097e0950f1609 iomap: move the buffered IO code into a separate file

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Darrick J. Wong <darrick.wong@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
