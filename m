Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1498B3749FB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 09:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564646; cv=none; b=KhYOEKPlDrP7CbvxP7ME/x05bYA6t89/J1bM/dSya4yE3Mru/rafRPssLFSsYxFvJwfYHkJw9K3PqkhefsoWM1flBaW2a+ZbaK9Ckezg0uvYzlKb7bTchF2gGkyPiJZV7jlZW1vbH5jZq/plOFzyRuA+RISms4j8Kyxf7+pAOyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564646; c=relaxed/simple;
	bh=nfpTI99HCYj4isYyYpsIiHJ/hY3IO2JQ2p2yXeg7sfU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QsX25rg4crKGfCBJKC3fFqr5TQHD0Xkl+IAO+Yg+eTRH260fhu/ztJQJeLeOGzkwxD79yfldTjYVB3E8ecUEtczh1spDin7a6V4B5dRl5yC1rXfBh25J+MAdEzRbljNWThhdEwy4s5atLT4cgdBUoLn76nU7b4zvXMenszyIREA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T68IUFnx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T68IUFnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787564644; x=1819100644;
  h=date:from:to:cc:subject:message-id;
  bh=nfpTI99HCYj4isYyYpsIiHJ/hY3IO2JQ2p2yXeg7sfU=;
  b=T68IUFnx8lY40CoPA33Z2azPvO6LiXb9CnjXZBB3OsA20K9zk0gyfhMW
   bsczfO6d0gmfIkGXr07Z+QL3/r+Y+Kjkcgm4aEItoFFgYb4AA5E3xuD4o
   thY9ioLExK5MSmOTEvu5XB9LzSrxZ9WunvT1nIR8UgUDPB15HWB2rc7KN
   uBn41HMSdNuh8UxTwsnba1AKebRMnofnwb43tqCVOPHgRZgjWYPPHuY7c
   zR7OeS3chXH2n/I4VuWGD6hkujwxMNlUZEgc9avZJdrzraG1qXQF4chJE
   aex4bmwLvg+bYuRvNTcGQFxGSzg/G/QicVALV2Bj0svtULlTzbBjjgte6
   A==;
X-CSE-ConnectionGUID: 0XV9fAA7SKWE1tLxhOWC9w==
X-CSE-MsgGUID: LBBbKxeaQIGH80rpjgqSYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87776938"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="87776938"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 02:44:04 -0700
X-CSE-ConnectionGUID: zwiDMC2GSjymShYHYzBzUA==
X-CSE-MsgGUID: 6a7dSBKgQRCCL4O884b4ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270417887"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 24 Aug 2026 02:44:03 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyRDk-000000000KB-0n0s;
	Mon, 24 Aug 2026 09:44:00 +0000
Date: Mon, 24 Aug 2026 11:43:20 +0200
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:dev-test 1/1] fs/f2fs/node.c:2019:45: error: 'folio'
 undeclared
Message-ID: <202608241149.6lPYS95K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   d0e9a2bbf6010f0200c392c5a2fe7b094cf0b3fc
commit: d0e9a2bbf6010f0200c392c5a2fe7b094cf0b3fc [1/1] f2fs: fix to avoid potential deadloop in f2fs_fsync_node_pages()
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260824/202608241149.6lPYS95K-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608241149.6lPYS95K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608241149.6lPYS95K-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/div64.h:27,
                    from ./arch/alpha/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from fs/f2fs/node.c:8:
   fs/f2fs/node.c: In function 'f2fs_fsync_node_pages':
>> fs/f2fs/node.c:2019:45: error: 'folio' undeclared (first use in this function)
    2019 |                 if (unlikely(!is_node_folio(folio))) {
         |                                             ^~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/f2fs/node.c:2019:45: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^


vim +/folio +2019 fs/f2fs/node.c

  1914	
  1915	int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
  1916				struct writeback_control *wbc, bool atomic,
  1917				unsigned int *seq_id)
  1918	{
  1919		pgoff_t index;
  1920		struct folio_batch fbatch;
  1921		int ret = 0;
  1922		struct folio *last_folio = NULL;
  1923		bool marked = false;
  1924		nid_t ino = inode->i_ino;
  1925		int nr_folios;
  1926		int nwritten = 0;
  1927	
  1928		if (atomic) {
  1929			last_folio = last_fsync_dnode(sbi, ino);
  1930			if (IS_ERR_OR_NULL(last_folio))
  1931				return PTR_ERR_OR_ZERO(last_folio);
  1932		}
  1933	retry:
  1934		folio_batch_init(&fbatch);
  1935		index = 0;
  1936	
  1937		while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
  1938						(pgoff_t)-1, PAGECACHE_TAG_DIRTY,
  1939						&fbatch))) {
  1940			int i;
  1941	
  1942			for (i = 0; i < nr_folios; i++) {
  1943				struct folio *folio = fbatch.folios[i];
  1944				bool submitted = false;
  1945				bool do_fsync = false;
  1946	
  1947				if (unlikely(f2fs_cp_error(sbi))) {
  1948					f2fs_folio_put(last_folio, false);
  1949					folio_batch_release(&fbatch);
  1950					ret = -EIO;
  1951					goto out;
  1952				}
  1953	
  1954				if (!IS_DNODE(folio) || !is_cold_node(folio))
  1955					continue;
  1956				if (ino_of_node(folio) != ino)
  1957					continue;
  1958	
  1959				folio_lock(folio);
  1960	
  1961				if (unlikely(!is_node_folio(folio))) {
  1962	continue_unlock:
  1963					folio_unlock(folio);
  1964					continue;
  1965				}
  1966				if (ino_of_node(folio) != ino)
  1967					goto continue_unlock;
  1968	
  1969				if (!folio_test_dirty(folio) && folio != last_folio) {
  1970					/* someone wrote it for us */
  1971					goto continue_unlock;
  1972				}
  1973	
  1974				f2fs_folio_wait_writeback(folio, NODE, true, true);
  1975	
  1976				if (!atomic || folio == last_folio) {
  1977					do_fsync = true;
  1978					percpu_counter_inc(&sbi->rf_node_block_count);
  1979					if (IS_INODE(folio)) {
  1980						if (is_inode_flag_set(inode,
  1981									FI_DIRTY_INODE))
  1982							f2fs_update_inode(inode, folio);
  1983					}
  1984					/* may be written by other thread */
  1985					if (!folio_test_dirty(folio))
  1986						folio_mark_dirty(folio);
  1987				}
  1988	
  1989				if (!folio_clear_dirty_for_io(folio))
  1990					goto continue_unlock;
  1991	
  1992				if (!__write_node_folio(folio, atomic &&
  1993							folio == last_folio,
  1994							do_fsync, &submitted,
  1995							wbc, true, FS_NODE_IO,
  1996							seq_id)) {
  1997					f2fs_folio_put(last_folio, false);
  1998					folio_batch_release(&fbatch);
  1999					ret = -EIO;
  2000					goto out;
  2001				}
  2002				if (submitted)
  2003					nwritten++;
  2004	
  2005				if (folio == last_folio) {
  2006					f2fs_folio_put(folio, false);
  2007					folio_batch_release(&fbatch);
  2008					marked = true;
  2009					goto out;
  2010				}
  2011			}
  2012			folio_batch_release(&fbatch);
  2013			cond_resched();
  2014		}
  2015		if (atomic && !marked) {
  2016			f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
  2017				   ino, last_folio->index);
  2018			folio_lock(last_folio);
> 2019			if (unlikely(!is_node_folio(folio))) {
  2020				f2fs_folio_put(folio, true);
  2021				ret = -EAGAIN;
  2022				goto out;
  2023			}
  2024			f2fs_folio_wait_writeback(last_folio, NODE, true, true);
  2025			folio_mark_dirty(last_folio);
  2026			folio_unlock(last_folio);
  2027			goto retry;
  2028		}
  2029	out:
  2030		if (nwritten)
  2031			f2fs_submit_merged_write_cond(sbi, NULL, NULL, ino, NODE);
  2032		return ret;
  2033	}
  2034	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
