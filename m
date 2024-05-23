Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38D45101A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716454555; cv=none; b=O5uII0sGGSaHcxsUoD5ogZX/3nouP8BfDaAmmBtXT8uSLfJ/+Qj4qThDJK7CUm4d+/vob5U2pYJOzik8CJMwZubGUv12AVscBVeOqjl1UJNlMwD0CA9ZvYrtE2BpCVPSJ8K8Lik5GSAKwbKuy3DMM9hYX7CleJrXQcGRuhaPt+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716454555; c=relaxed/simple;
	bh=25CcG6eu7njXOf5qRUnFeO6ep8b78Wh+lTqcyrNNiwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XqC5nwocIX6TPptIN8rxiDVFwq4KLv647aGcv34FC3lgPKu3Pdk1L+OSJIMP0pNaWr530SxQXI5blJdBV20k11dG35ICgZ8YX9ZbZHoNswLb8ziFdQVrWeig503nNj1iGm4krEr4jERaw/6kJ2OaloA2IzGNY4XWRjjhoxqB23I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONsQwtno; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONsQwtno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716454553; x=1747990553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=25CcG6eu7njXOf5qRUnFeO6ep8b78Wh+lTqcyrNNiwk=;
  b=ONsQwtnoY8tAhXqilSOsni255CNc5EwAN0U6+qefng9vcH5ms+JhSHYa
   8hAuXsc5IGc/CJmZJlU+uOU4MQO4h6yTGbATHCn12SLVfz8R/h/NCVIID
   MbeJcIn04GPi9dB09ygfUXJ/ix4YcLqFOp42y2dNrOueUgrfR3SUSPWpv
   KkvtY2UwAXa39n6bWKnhWxCCnLfkLh9cf5i6w4qdlmWKED9vNjie0kECE
   zo86MfJ7PzGFthfLd8Vb55JiIky0rqDurc+cgyZtb8Xf1blT51z2mYKSF
   Q6lW5/TXU3Fqb7A8I676rRcHn3dHhNWDs7iQRs6PBB8BAc3rxs+g+Ud96
   A==;
X-CSE-ConnectionGUID: NC8yU/IZSuGTVeoUbdRZog==
X-CSE-MsgGUID: Lois9yTbRVi1fMCYwSKbRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="16546034"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="16546034"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 01:55:53 -0700
X-CSE-ConnectionGUID: tJNc193qRlKXOZh5f2rSfw==
X-CSE-MsgGUID: iJSz/j5ARWaWAj4xkp93oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="38426065"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 May 2024 01:55:50 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA4El-0002eN-2M;
	Thu, 23 May 2024 08:55:47 +0000
Date: Thu, 23 May 2024 16:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [akpm-mm:mm-unstable 41/107] fs/f2fs/data.c:2060:28: error: call to
 undeclared function 'page_index'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202405231654.kL0A7Y39-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   c65920c76a977c2b73c3a8b03b4c0c00cc1285ed
commit: ca2b437e3fdab3a172e554095d9402113d2262a8 [41/107] mm: drop page_index and simplify folio_index
config: mips-randconfig-r081-20240523 (https://download.01.org/0day-ci/archive/20240523/202405231654.kL0A7Y39-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231654.kL0A7Y39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231654.kL0A7Y39-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/data.c:2060:28: error: call to undeclared function 'page_index'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           block_in_file = (sector_t)page_index(page);
                                     ^
   fs/f2fs/data.c:2060:28: note: did you mean 'pte_index'?
   include/linux/pgtable.h:67:29: note: 'pte_index' declared here
   static inline unsigned long pte_index(unsigned long address)
                               ^
   1 error generated.


vim +/page_index +2060 fs/f2fs/data.c

95ae251fe82838 Eric Biggers       2019-07-22  2044  
2df0ab045784a1 Chao Yu            2019-03-25  2045  static int f2fs_read_single_page(struct inode *inode, struct page *page,
2df0ab045784a1 Chao Yu            2019-03-25  2046  					unsigned nr_pages,
2df0ab045784a1 Chao Yu            2019-03-25  2047  					struct f2fs_map_blocks *map,
2df0ab045784a1 Chao Yu            2019-03-25  2048  					struct bio **bio_ret,
2df0ab045784a1 Chao Yu            2019-03-25  2049  					sector_t *last_block_in_bio,
2df0ab045784a1 Chao Yu            2019-03-25  2050  					bool is_readahead)
f1e8866016b53b Jaegeuk Kim        2015-04-09  2051  {
2df0ab045784a1 Chao Yu            2019-03-25  2052  	struct bio *bio = *bio_ret;
43b9d4b4d91c02 Jaegeuk Kim        2020-11-24  2053  	const unsigned blocksize = blks_to_bytes(inode, 1);
f1e8866016b53b Jaegeuk Kim        2015-04-09  2054  	sector_t block_in_file;
f1e8866016b53b Jaegeuk Kim        2015-04-09  2055  	sector_t last_block;
f1e8866016b53b Jaegeuk Kim        2015-04-09  2056  	sector_t last_block_in_file;
f1e8866016b53b Jaegeuk Kim        2015-04-09  2057  	sector_t block_nr;
2df0ab045784a1 Chao Yu            2019-03-25  2058  	int ret = 0;
f1e8866016b53b Jaegeuk Kim        2015-04-09  2059  
4969c06a0d83c9 Jaegeuk Kim        2019-07-01 @2060  	block_in_file = (sector_t)page_index(page);
f1e8866016b53b Jaegeuk Kim        2015-04-09  2061  	last_block = block_in_file + nr_pages;
43b9d4b4d91c02 Jaegeuk Kim        2020-11-24  2062  	last_block_in_file = bytes_to_blks(inode,
43b9d4b4d91c02 Jaegeuk Kim        2020-11-24  2063  			f2fs_readpage_limit(inode) + blocksize - 1);
f1e8866016b53b Jaegeuk Kim        2015-04-09  2064  	if (last_block > last_block_in_file)
f1e8866016b53b Jaegeuk Kim        2015-04-09  2065  		last_block = last_block_in_file;
f1e8866016b53b Jaegeuk Kim        2015-04-09  2066  
86109c9064daf2 Chao Yu            2019-03-07  2067  	/* just zeroing out page which is beyond EOF */
86109c9064daf2 Chao Yu            2019-03-07  2068  	if (block_in_file >= last_block)
86109c9064daf2 Chao Yu            2019-03-07  2069  		goto zero_out;
f1e8866016b53b Jaegeuk Kim        2015-04-09  2070  	/*
f1e8866016b53b Jaegeuk Kim        2015-04-09  2071  	 * Map blocks using the previous result first.
f1e8866016b53b Jaegeuk Kim        2015-04-09  2072  	 */
2df0ab045784a1 Chao Yu            2019-03-25  2073  	if ((map->m_flags & F2FS_MAP_MAPPED) &&
2df0ab045784a1 Chao Yu            2019-03-25  2074  			block_in_file > map->m_lblk &&
2df0ab045784a1 Chao Yu            2019-03-25  2075  			block_in_file < (map->m_lblk + map->m_len))
f1e8866016b53b Jaegeuk Kim        2015-04-09  2076  		goto got_it;
f1e8866016b53b Jaegeuk Kim        2015-04-09  2077  
f1e8866016b53b Jaegeuk Kim        2015-04-09  2078  	/*
f1e8866016b53b Jaegeuk Kim        2015-04-09  2079  	 * Then do more f2fs_map_blocks() calls until we are
f1e8866016b53b Jaegeuk Kim        2015-04-09  2080  	 * done with this page.
f1e8866016b53b Jaegeuk Kim        2015-04-09  2081  	 */
2df0ab045784a1 Chao Yu            2019-03-25  2082  	map->m_lblk = block_in_file;
2df0ab045784a1 Chao Yu            2019-03-25  2083  	map->m_len = last_block - block_in_file;
f1e8866016b53b Jaegeuk Kim        2015-04-09  2084  
cd8fc5226bef3a Christoph Hellwig  2022-11-28  2085  	ret = f2fs_map_blocks(inode, map, F2FS_GET_BLOCK_DEFAULT);
2df0ab045784a1 Chao Yu            2019-03-25  2086  	if (ret)
2df0ab045784a1 Chao Yu            2019-03-25  2087  		goto out;
f1e8866016b53b Jaegeuk Kim        2015-04-09  2088  got_it:
2df0ab045784a1 Chao Yu            2019-03-25  2089  	if ((map->m_flags & F2FS_MAP_MAPPED)) {
2df0ab045784a1 Chao Yu            2019-03-25  2090  		block_nr = map->m_pblk + block_in_file - map->m_lblk;
f1e8866016b53b Jaegeuk Kim        2015-04-09  2091  		SetPageMappedToDisk(page);
f1e8866016b53b Jaegeuk Kim        2015-04-09  2092  
c9b60788fc760d Chao Yu            2018-08-01  2093  		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
93770ab7a6e963 Chao Yu            2019-04-15  2094  						DATA_GENERIC_ENHANCE_READ)) {
10f966bbf521bb Chao Yu            2019-06-20  2095  			ret = -EFSCORRUPTED;
2df0ab045784a1 Chao Yu            2019-03-25  2096  			goto out;
2df0ab045784a1 Chao Yu            2019-03-25  2097  		}
f1e8866016b53b Jaegeuk Kim        2015-04-09  2098  	} else {
86109c9064daf2 Chao Yu            2019-03-07  2099  zero_out:
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  2100  		zero_user_segment(page, 0, PAGE_SIZE);
95ae251fe82838 Eric Biggers       2019-07-22  2101  		if (f2fs_need_verity(inode, page->index) &&
95ae251fe82838 Eric Biggers       2019-07-22  2102  		    !fsverity_verify_page(page)) {
95ae251fe82838 Eric Biggers       2019-07-22  2103  			ret = -EIO;
95ae251fe82838 Eric Biggers       2019-07-22  2104  			goto out;
95ae251fe82838 Eric Biggers       2019-07-22  2105  		}
237c0790e54020 Jaegeuk Kim        2016-06-30  2106  		if (!PageUptodate(page))
f1e8866016b53b Jaegeuk Kim        2015-04-09  2107  			SetPageUptodate(page);
f1e8866016b53b Jaegeuk Kim        2015-04-09  2108  		unlock_page(page);
2df0ab045784a1 Chao Yu            2019-03-25  2109  		goto out;
f1e8866016b53b Jaegeuk Kim        2015-04-09  2110  	}
f1e8866016b53b Jaegeuk Kim        2015-04-09  2111  
f1e8866016b53b Jaegeuk Kim        2015-04-09  2112  	/*
f1e8866016b53b Jaegeuk Kim        2015-04-09  2113  	 * This page will go to BIO.  Do we need to send this
f1e8866016b53b Jaegeuk Kim        2015-04-09  2114  	 * BIO off first?
f1e8866016b53b Jaegeuk Kim        2015-04-09  2115  	 */
27aacd28ea3b89 Satya Tangirala    2020-07-02  2116  	if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
27aacd28ea3b89 Satya Tangirala    2020-07-02  2117  				       *last_block_in_bio, block_nr) ||
27aacd28ea3b89 Satya Tangirala    2020-07-02  2118  		    !f2fs_crypt_mergeable_bio(bio, inode, page->index, NULL))) {
f1e8866016b53b Jaegeuk Kim        2015-04-09  2119  submit_and_realloc:
bc29835a9d4860 Christoph Hellwig  2022-11-28  2120  		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
f1e8866016b53b Jaegeuk Kim        2015-04-09  2121  		bio = NULL;
f1e8866016b53b Jaegeuk Kim        2015-04-09  2122  	}
f1e8866016b53b Jaegeuk Kim        2015-04-09  2123  	if (bio == NULL) {
e2e59414aae2c8 Jaegeuk Kim        2018-06-21  2124  		bio = f2fs_grab_read_bio(inode, block_nr, nr_pages,
0683728adab251 Chao Yu            2020-02-18  2125  				is_readahead ? REQ_RAHEAD : 0, page->index,
7f59b277f79e8a Eric Biggers       2021-01-04  2126  				false);
1d353eb7e43853 Jaegeuk Kim        2016-07-12  2127  		if (IS_ERR(bio)) {
2df0ab045784a1 Chao Yu            2019-03-25  2128  			ret = PTR_ERR(bio);
1d353eb7e43853 Jaegeuk Kim        2016-07-12  2129  			bio = NULL;
2df0ab045784a1 Chao Yu            2019-03-25  2130  			goto out;
4375a33664de17 Jaegeuk Kim        2015-04-23  2131  		}
f1e8866016b53b Jaegeuk Kim        2015-04-09  2132  	}
f1e8866016b53b Jaegeuk Kim        2015-04-09  2133  
0ded69f632bb71 Jaegeuk Kim        2018-08-22  2134  	/*
0ded69f632bb71 Jaegeuk Kim        2018-08-22  2135  	 * If the page is under writeback, we need to wait for
0ded69f632bb71 Jaegeuk Kim        2018-08-22  2136  	 * its completion to see the correct decrypted data.
0ded69f632bb71 Jaegeuk Kim        2018-08-22  2137  	 */
0ded69f632bb71 Jaegeuk Kim        2018-08-22  2138  	f2fs_wait_on_block_writeback(inode, block_nr);
0ded69f632bb71 Jaegeuk Kim        2018-08-22  2139  
f1e8866016b53b Jaegeuk Kim        2015-04-09  2140  	if (bio_add_page(bio, page, blocksize, 0) < blocksize)
f1e8866016b53b Jaegeuk Kim        2015-04-09  2141  		goto submit_and_realloc;
f1e8866016b53b Jaegeuk Kim        2015-04-09  2142  
5f9abab42b60e6 Jaegeuk Kim        2018-10-16  2143  	inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
34a23525601a16 Chao Yu            2022-08-20  2144  	f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
34a23525601a16 Chao Yu            2022-08-20  2145  							F2FS_BLKSIZE);
2df0ab045784a1 Chao Yu            2019-03-25  2146  	*last_block_in_bio = block_nr;
2df0ab045784a1 Chao Yu            2019-03-25  2147  out:
2df0ab045784a1 Chao Yu            2019-03-25  2148  	*bio_ret = bio;
2df0ab045784a1 Chao Yu            2019-03-25  2149  	return ret;
2df0ab045784a1 Chao Yu            2019-03-25  2150  }
2df0ab045784a1 Chao Yu            2019-03-25  2151  

:::::: The code at line 2060 was first introduced by commit
:::::: 4969c06a0d83c9c3dc50b8efcdc8eeedfce896f6 f2fs: support swap file w/ DIO

:::::: TO: Jaegeuk Kim <jaegeuk@kernel.org>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
