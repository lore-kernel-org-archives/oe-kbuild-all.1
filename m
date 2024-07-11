Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8436E15ECE6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 14:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720706910; cv=none; b=eyB7LvP657l0DudeqUpTDYl4WSBDwNI3qY+XF2dN3lv56cSR6AH+bf0g6Je401N0mdh1yEO23iIt5gOh5HfupKpUqoyglNPIzVNqSC8w7lCKan+z306qslSQZjygsBXg0dfXM/Rrb7fL7cps7zRv5Tkf3ZzbcW1yxOZb6CdAhFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720706910; c=relaxed/simple;
	bh=+H+5/HFpD3To504i5/IL2vx2HcBIDWr52AeFjJHGooA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XOsneMY2MtJPUaOFp7C2JxnkNlIZyZX0XF78VcHTP8n95CcFtL6AMEjNWZmzqqFxzDZT+r3qEsWZw4CHz5E+ukKHpN28EDR0+EsqbPDmUMiU7EytFmdvATnU09SNq1TMGFlADfaGwPEa/KDx9LLM1p8yP3ZdwuyMTZ6NsA/lLko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dbv2v83z; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dbv2v83z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720706908; x=1752242908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+H+5/HFpD3To504i5/IL2vx2HcBIDWr52AeFjJHGooA=;
  b=Dbv2v83z9ck2GHbVm4JoCMRAnrA96Lnd22JkZQCUTUf9XedwkywpC9M1
   x8dQeumQGcBfnZgPFIX6lQzERcLzc1a2PngngzycYB/Ff9kkGo60tN6ze
   JkbGlyZjQky2Eqxm+C29gXvL0lRIU1Rd76uWfSY1LGZCsb6nGx4QedFUo
   Dvo04ZQWKleM+SIayD6TQVY9V705KeqEKg+3S2+ne2LDKgEV5bJloEPRj
   TYjZNSDq0luhNMOQsCuS0rJamzHZYCFoIpqzo6ZUxIoMfoU4zvoan1lDU
   1MV/4xct4NZ+YBYHGgnFGUNVfVblImjAfhxtzzjY1SbRXQoiHFiC1eSlq
   A==;
X-CSE-ConnectionGUID: AvzUuPSaTWmCmxUjGPd6XQ==
X-CSE-MsgGUID: TvQ3eFevTOCj3lINe68Exw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18294500"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="18294500"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 07:08:28 -0700
X-CSE-ConnectionGUID: RjTs1arpTsm6zoJ5Xnts5w==
X-CSE-MsgGUID: d5SGlARbR12jsaMAKxP4Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="53161518"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jul 2024 07:08:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRuTA-000ZM2-2w;
	Thu, 11 Jul 2024 14:08:24 +0000
Date: Thu, 11 Jul 2024 22:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:write-end 44/44] fs/libfs.c:950: warning: Function
 parameter or struct member 'folio' not described in 'simple_write_end'
Message-ID: <202407112240.E9d1ClR3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache write-end
head:   b88b8f43ca6661a6ee5e9cef00e15cdf93141141
commit: b88b8f43ca6661a6ee5e9cef00e15cdf93141141 [44/44] fs: Convert aops->write_end to take a folio
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240711/202407112240.E9d1ClR3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112240.E9d1ClR3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407112240.E9d1ClR3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/libfs.c:950: warning: Function parameter or struct member 'folio' not described in 'simple_write_end'
>> fs/libfs.c:950: warning: Excess function parameter 'page' description in 'simple_write_end'


vim +950 fs/libfs.c

afddba49d18f34 Nicholas Piggin         2007-10-16  924  
ad2a722f196d2b Boaz Harrosh            2010-01-12  925  /**
ad2a722f196d2b Boaz Harrosh            2010-01-12  926   * simple_write_end - .write_end helper for non-block-device FSes
8e88bfba77eec6 Randy Dunlap            2019-10-14  927   * @file: See .write_end of address_space_operations
ad2a722f196d2b Boaz Harrosh            2010-01-12  928   * @mapping: 		"
ad2a722f196d2b Boaz Harrosh            2010-01-12  929   * @pos: 		"
ad2a722f196d2b Boaz Harrosh            2010-01-12  930   * @len: 		"
ad2a722f196d2b Boaz Harrosh            2010-01-12  931   * @copied: 		"
ad2a722f196d2b Boaz Harrosh            2010-01-12  932   * @page: 		"
ad2a722f196d2b Boaz Harrosh            2010-01-12  933   * @fsdata: 		"
ad2a722f196d2b Boaz Harrosh            2010-01-12  934   *
ad2a722f196d2b Boaz Harrosh            2010-01-12  935   * simple_write_end does the minimum needed for updating a page after writing is
ad2a722f196d2b Boaz Harrosh            2010-01-12  936   * done. It has the same API signature as the .write_end of
ad2a722f196d2b Boaz Harrosh            2010-01-12  937   * address_space_operations vector. So it can just be set onto .write_end for
ad2a722f196d2b Boaz Harrosh            2010-01-12  938   * FSes that don't need any other processing. i_mutex is assumed to be held.
ad2a722f196d2b Boaz Harrosh            2010-01-12  939   * Block based filesystems should use generic_write_end().
ad2a722f196d2b Boaz Harrosh            2010-01-12  940   * NOTE: Even though i_size might get updated by this function, mark_inode_dirty
ad2a722f196d2b Boaz Harrosh            2010-01-12  941   * is not called, so a filesystem that actually does store data in .write_inode
ad2a722f196d2b Boaz Harrosh            2010-01-12  942   * should extend on what's done here with a call to mark_inode_dirty() in the
ad2a722f196d2b Boaz Harrosh            2010-01-12  943   * case that i_size has changed.
04fff6416cb787 Al Viro                 2016-08-29  944   *
a77f580a2d4645 Matthew Wilcox (Oracle  2022-04-29  945)  * Use *ONLY* with simple_read_folio()
^1da177e4c3f41 Linus Torvalds          2005-04-16  946   */
c1e3dbe9818e3c Christoph Hellwig       2021-06-28  947  static int simple_write_end(struct file *file, struct address_space *mapping,
afddba49d18f34 Nicholas Piggin         2007-10-16  948  			loff_t pos, unsigned len, unsigned copied,
b88b8f43ca6661 Matthew Wilcox (Oracle  2024-07-10  949) 			struct folio *folio, void *fsdata)
afddba49d18f34 Nicholas Piggin         2007-10-16 @950  {
5522d9f7b2e6d2 Matthew Wilcox (Oracle  2023-08-21  951) 	struct inode *inode = folio->mapping->host;
ad2a722f196d2b Boaz Harrosh            2010-01-12  952  	loff_t last_pos = pos + copied;
afddba49d18f34 Nicholas Piggin         2007-10-16  953  
5522d9f7b2e6d2 Matthew Wilcox (Oracle  2023-08-21  954) 	/* zero the stale part of the folio if we did a short copy */
5522d9f7b2e6d2 Matthew Wilcox (Oracle  2023-08-21  955) 	if (!folio_test_uptodate(folio)) {
afddba49d18f34 Nicholas Piggin         2007-10-16  956  		if (copied < len) {
5522d9f7b2e6d2 Matthew Wilcox (Oracle  2023-08-21  957) 			size_t from = offset_in_folio(folio, pos);
ad2a722f196d2b Boaz Harrosh            2010-01-12  958  
5522d9f7b2e6d2 Matthew Wilcox (Oracle  2023-08-21  959) 			folio_zero_range(folio, from + copied, len - copied);
afddba49d18f34 Nicholas Piggin         2007-10-16  960  		}
5522d9f7b2e6d2 Matthew Wilcox (Oracle  2023-08-21  961) 		folio_mark_uptodate(folio);
04fff6416cb787 Al Viro                 2016-08-29  962  	}
ad2a722f196d2b Boaz Harrosh            2010-01-12  963  	/*
ad2a722f196d2b Boaz Harrosh            2010-01-12  964  	 * No need to use i_size_read() here, the i_size
ad2a722f196d2b Boaz Harrosh            2010-01-12  965  	 * cannot change under us because we hold the i_mutex.
ad2a722f196d2b Boaz Harrosh            2010-01-12  966  	 */
ad2a722f196d2b Boaz Harrosh            2010-01-12  967  	if (last_pos > inode->i_size)
ad2a722f196d2b Boaz Harrosh            2010-01-12  968  		i_size_write(inode, last_pos);
afddba49d18f34 Nicholas Piggin         2007-10-16  969  
5522d9f7b2e6d2 Matthew Wilcox (Oracle  2023-08-21  970) 	folio_mark_dirty(folio);
5522d9f7b2e6d2 Matthew Wilcox (Oracle  2023-08-21  971) 	folio_unlock(folio);
5522d9f7b2e6d2 Matthew Wilcox (Oracle  2023-08-21  972) 	folio_put(folio);
afddba49d18f34 Nicholas Piggin         2007-10-16  973  
afddba49d18f34 Nicholas Piggin         2007-10-16  974  	return copied;
afddba49d18f34 Nicholas Piggin         2007-10-16  975  }
c1e3dbe9818e3c Christoph Hellwig       2021-06-28  976  

:::::: The code at line 950 was first introduced by commit
:::::: afddba49d18f346e5cc2938b6ed7c512db18ca68 fs: introduce write_begin, write_end, and perform_write aops

:::::: TO: Nick Piggin <npiggin@suse.de>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
