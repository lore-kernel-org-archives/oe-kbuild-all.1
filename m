Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D1236C58F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 06:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768892159; cv=none; b=kKfbehemJoj94l5YNytM7VwRNyRB6UYQ4kKdZBkOuLYEUzFLkp9HNdrp0xxg+j5KfC8Qh+hT9iS6WIjAHdfFrFzXAizT3y4vuCNh2H4utH4qLQSKMBYYH33FlAJ9D6YFKmCn2IXdMi7QGV9QrAewnSSGjbXLF9AlqOTQegR4fSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768892159; c=relaxed/simple;
	bh=o7tURsxfIN9ifnfwSD1K3i+hMSz32M3022JGuEjr+MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pG0pp9teD/nMv90WzaBvGOJ+9CFwotFdP3EJaYLnDZNZ3uYc1/21RQxAFWldF9h6e7bC0O+YETEopX0k7qAr9/M7sTqFcPO1yVLa9KBhlM9W25GtMpvXrQiFJQFPJqRk838LnI9W2+MGJHaDXdFsCOt+yxqDEUAQYisrcmDQm9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kosjlPxP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kosjlPxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768892152; x=1800428152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o7tURsxfIN9ifnfwSD1K3i+hMSz32M3022JGuEjr+MU=;
  b=kosjlPxPKhiyWa9Yz1d6pYcRAa7TBZ2zh2Adimxz2+fI1rFr2dSNMANC
   hgaJr8fFgiH34uQqyxG2OTDt7kkCvxlS7smmJzESETFHp8jhVeg77+EA2
   QIBkqyOhZpmEOB4riVkkm8x1rzG75y7l9sRm8tp1G5phwAJ1PvxO2FPIQ
   b9bijek9HqgoODEcQDQ4+j0MyssQ3aut993QXn838Mafue/ORgR66+e9R
   GIaYoARhFugCJwcCtHdQYciLu2/lE9B++vgdqvGUCgl6xOwKZU0Lb8+L1
   lRJrliqNw1j71Yow6LS6pmcixS+5qWCVtLURbQyM9yp/l4PGPGZCh2Nri
   Q==;
X-CSE-ConnectionGUID: pzJRYGWjTrKXmxJstaAC9w==
X-CSE-MsgGUID: FTt2Edn9R+ypJA5EqWp/0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69294379"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="69294379"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 22:55:45 -0800
X-CSE-ConnectionGUID: 4rInt0JqRiOPXHkjqBglRQ==
X-CSE-MsgGUID: LbpBUIsFRDu8VCY+znQ0eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="211057150"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jan 2026 22:55:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi5eO-00000000OfB-3Ba9;
	Tue, 20 Jan 2026 06:55:40 +0000
Date: Tue, 20 Jan 2026 14:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Christian Brauner <brauner@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <202601201453.3N9V4NVP-lkp@intel.com>
References: <aW5AGPFq0HPi440m@sirena.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5AGPFq0HPi440m@sirena.org.uk>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260116]
[cannot apply to brauner-vfs/vfs.all xiang-erofs/dev-test xiang-erofs/dev xiang-erofs/fixes v6.19-rc6 v6.19-rc5 v6.19-rc4 linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/linux-next-build-failure-after-merge-of-the-vfs-brauner-tree/20260119-223859
base:   next-20260116
patch link:    https://lore.kernel.org/r/aW5AGPFq0HPi440m%40sirena.org.uk
patch subject: linux-next: build failure after merge of the vfs-brauner tree
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260120/202601201453.3N9V4NVP-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201453.3N9V4NVP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201453.3N9V4NVP-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ntfs3/inode.c: In function 'ntfs_read_folio':
>> fs/ntfs3/inode.c:678:9: error: too many arguments to function 'iomap_read_folio'; expected 2, have 3
     678 |         iomap_read_folio(&ntfs_iomap_ops, &ctx, NULL);
         |         ^~~~~~~~~~~~~~~~
   In file included from fs/ntfs3/inode.c:15:
   include/linux/iomap.h:347:6: note: declared here
     347 | void iomap_read_folio(const struct iomap_ops *ops,
         |      ^~~~~~~~~~~~~~~~
   fs/ntfs3/inode.c: In function 'ntfs_readahead':
>> fs/ntfs3/inode.c:702:9: error: too many arguments to function 'iomap_readahead'; expected 2, have 3
     702 |         iomap_readahead(&ntfs_iomap_ops, &ctx, NULL);
         |         ^~~~~~~~~~~~~~~
   include/linux/iomap.h:349:6: note: declared here
     349 | void iomap_readahead(const struct iomap_ops *ops,
         |      ^~~~~~~~~~~~~~~


vim +/iomap_read_folio +678 fs/ntfs3/inode.c

   647	
   648	static int ntfs_read_folio(struct file *file, struct folio *folio)
   649	{
   650		int err;
   651		struct address_space *mapping = folio->mapping;
   652		struct inode *inode = mapping->host;
   653		struct ntfs_inode *ni = ntfs_i(inode);
   654		loff_t vbo = folio_pos(folio);
   655		struct iomap_read_folio_ctx ctx = {
   656			.cur_folio = folio,
   657			.ops = &ntfs_iomap_bio_read_ops,
   658		};
   659	
   660		if (unlikely(is_bad_ni(ni))) {
   661			folio_unlock(folio);
   662			return -EIO;
   663		}
   664	
   665		if (ni->i_valid <= vbo) {
   666			folio_zero_range(folio, 0, folio_size(folio));
   667			folio_mark_uptodate(folio);
   668			folio_unlock(folio);
   669			return 0;
   670		}
   671	
   672		if (is_compressed(ni)) {
   673			/* ni_lock is taken inside ni_read_folio_cmpr after page locks */
   674			err = ni_read_folio_cmpr(ni, folio);
   675			return err;
   676		}
   677	
 > 678		iomap_read_folio(&ntfs_iomap_ops, &ctx, NULL);
   679		return 0;
   680	}
   681	
   682	static void ntfs_readahead(struct readahead_control *rac)
   683	{
   684		struct address_space *mapping = rac->mapping;
   685		struct inode *inode = mapping->host;
   686		struct ntfs_inode *ni = ntfs_i(inode);
   687		struct iomap_read_folio_ctx ctx = {
   688			.ops = &ntfs_iomap_bio_read_ops,
   689			.rac = rac,
   690		};
   691	
   692		if (is_resident(ni)) {
   693			/* No readahead for resident. */
   694			return;
   695		}
   696	
   697		if (is_compressed(ni)) {
   698			/* No readahead for compressed. */
   699			return;
   700		}
   701	
 > 702		iomap_readahead(&ntfs_iomap_ops, &ctx, NULL);
   703	}
   704	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
