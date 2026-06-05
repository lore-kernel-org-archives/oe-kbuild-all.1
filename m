Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2893E3DBD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780656642; cv=none; b=a9faReAXWSPJspXPZ/HChLaPeJQIaJ/ze7t95MvgUPi8j8AH0Yu8sa2KTRfbO9DJJ4SSwt30qzcOO1CZbMFMNYTGPwOZ7dkdgcQ8qcSGL/rhj6b1ZYedkphgXnEWP5KHkdxNWdrPFsTsvTW1FLsW6XuU6UQdbxkCIjD8p2UkcoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780656642; c=relaxed/simple;
	bh=dP8YWUHyjBdIhczwzUDTm2FYKbbrs2ulgfXMuTfXmjQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MrGF53+02RmseDduGeolzB9pMpeYAWZkniMwq8SXbIlS4K4L2sElht8LkX7UYu2G6xbZv81WheW8ncoxBFYr7ZJhv2ntF2qecnovNavfroNpAMOBhC/OioGE+3lYT0iB3J5pReKa/1oNaUrBj8Qouv+BOhP6W5oQKAdt7+r3uQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJz4uYLs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJz4uYLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780656640; x=1812192640;
  h=date:from:to:cc:subject:message-id;
  bh=dP8YWUHyjBdIhczwzUDTm2FYKbbrs2ulgfXMuTfXmjQ=;
  b=AJz4uYLsYV8zwi5+3oUnPnsB1OKblZPTPDvOeFiOFgGlgr2UxG8DPouo
   5pUKqWUmsvh4OD9snptlNpzlklH7WfFwotw5A3XowAAKRBQ7gRl8CRCSv
   aS62ENuk/fL69O7IRM2dobpHmFiGaohpaIQmRhGmKolq/AE/oCUAK8zsa
   MvSjI83CvU10IXMfas79NctrGhBMUk8x9CflKYj5osvpzt2wfLclGKTke
   aXEbJCnHd8b1m55LIztIK9VA83hKchWX7fJ3FtqFKgn7N+qtCEhLcnm/T
   21JA4KeoiPwu7/xAqBZeFoXfzMHYELniunhhPzs0RnsOGnsbqqnt6zQAh
   w==;
X-CSE-ConnectionGUID: FPvlN3IIQcWBmPOJwaYlnQ==
X-CSE-MsgGUID: gjVoyAZxTXWTTOJOEZBLqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81236487"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81236487"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 03:50:39 -0700
X-CSE-ConnectionGUID: G/kpjcu5QPyt3mSaifmuiQ==
X-CSE-MsgGUID: okhOwTKLREu4kRSY0DtJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="246647507"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2026 03:50:36 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVS8I-00000000Ftu-0Gz5;
	Fri, 05 Jun 2026 10:50:34 +0000
Date: Fri, 05 Jun 2026 18:49:51 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: [brauner-vfs:vfs-7.2.iomap 6/10]
 fs/iomap/buffered-io.c:577:33: error: implicit declaration of function
 'fsverity_fill_zerohash'; did you mean 'fsverity_file_open'?
Message-ID: <202606051818.Y3MWKSfv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7.2.iomap
head:   7cf86a52cd64d21a9511f2659cb87d3aab2cc1d4
commit: 014c8fc41d92d1c48e9c08cb92ab3761f4956d4f [6/10] iomap: teach iomap to read files with fsverity
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260605/202606051818.Y3MWKSfv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051818.Y3MWKSfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051818.Y3MWKSfv-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/iomap/buffered-io.c: In function 'iomap_read_folio_iter':
>> fs/iomap/buffered-io.c:577:33: error: implicit declaration of function 'fsverity_fill_zerohash'; did you mean 'fsverity_file_open'? [-Wimplicit-function-declaration]
     577 |                                 fsverity_fill_zerohash(folio, poff, plen,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 fsverity_file_open


vim +577 fs/iomap/buffered-io.c

   526	
   527	static int iomap_read_folio_iter(struct iomap_iter *iter,
   528			struct iomap_read_folio_ctx *ctx, size_t *bytes_submitted)
   529	{
   530		const struct iomap *iomap = &iter->iomap;
   531		loff_t pos = iter->pos;
   532		loff_t length = iomap_length(iter);
   533		struct folio *folio = ctx->cur_folio;
   534		size_t folio_len = folio_size(folio);
   535		struct iomap_folio_state *ifs;
   536		size_t poff, plen;
   537		loff_t pos_diff;
   538		int ret;
   539	
   540		if (iomap->type == IOMAP_INLINE) {
   541			ret = iomap_read_inline_data(iter, folio);
   542			if (ret)
   543				return ret;
   544			return iomap_iter_advance(iter, length);
   545		}
   546	
   547		ifs = ifs_alloc(iter->inode, folio, iter->flags);
   548	
   549		length = min_t(loff_t, length, folio_len - offset_in_folio(folio, pos));
   550		while (length) {
   551			iomap_adjust_read_range(iter->inode, folio, &pos, length, &poff,
   552					&plen);
   553	
   554			pos_diff = pos - iter->pos;
   555			if (WARN_ON_ONCE(pos_diff + plen > length))
   556				return -EIO;
   557	
   558			ret = iomap_iter_advance(iter, pos_diff);
   559			if (ret)
   560				return ret;
   561	
   562			if (plen == 0)
   563				return 0;
   564	
   565			/*
   566			 * Handling of fsverity "holes". We hit this for two case:
   567			 *   1. No need to go further, the hole after fsverity
   568			 *	descriptor is the end of the fsverity metadata.
   569			 *
   570			 *   2. This folio contains merkle tree blocks which need to be
   571			 *	synthesized. If we already have fsverity info (ctx->vi)
   572			 *	synthesize these blocks.
   573			 */
   574			if ((iomap->flags & IOMAP_F_FSVERITY) &&
   575			    iomap->type == IOMAP_HOLE) {
   576				if (ctx->vi)
 > 577					fsverity_fill_zerohash(folio, poff, plen,
   578							       ctx->vi);
   579				iomap_set_range_uptodate(folio, poff, plen);
   580			} else if (iomap_block_needs_zeroing(iter, pos)) {
   581				/* zero post-eof blocks as the page may be mapped */
   582				folio_zero_range(folio, poff, plen);
   583				if (ctx->vi &&
   584				    !fsverity_verify_blocks(ctx->vi, folio, plen, poff))
   585					return -EIO;
   586				iomap_set_range_uptodate(folio, poff, plen);
   587			} else {
   588				if (!*bytes_submitted)
   589					iomap_read_init(folio);
   590				ret = ctx->ops->read_folio_range(iter, ctx, plen);
   591				if (ret < 0)
   592					fserror_report_io(iter->inode,
   593							  FSERR_BUFFERED_READ, pos,
   594							  plen, ret, GFP_NOFS);
   595				if (ret)
   596					return ret;
   597	
   598				*bytes_submitted += plen;
   599				/*
   600				 * Hand off folio ownership to the IO helper when:
   601				 * 1) The entire folio has been submitted for IO, or
   602				 * 2) There is no ifs attached to the folio
   603				 *
   604				 * Case (2) occurs when 1 << i_blkbits matches the folio
   605				 * size but the underlying filesystem or block device
   606				 * uses a smaller granularity for IO.
   607				 */
   608				if (*bytes_submitted == folio_len || !ifs)
   609					ctx->cur_folio = NULL;
   610			}
   611	
   612			ret = iomap_iter_advance(iter, plen);
   613			if (ret)
   614				return ret;
   615			length -= pos_diff + plen;
   616			pos = iter->pos;
   617		}
   618		return 0;
   619	}
   620	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
