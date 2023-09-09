Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03E61101
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 01:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694222086; x=1725758086;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=U16NRrwwUS5t6aRL/8DeklbH6TFD7wfVVR78j5Vyf2Y=;
  b=Hm2aSxz/zueyy+XkLeRYMyNS47jL0BulDCbTUSWHUSJHQxwtbhj4mQbg
   YnIFfvYi5DPRHWgP8RJ8tFs4re3yJDB2ant8a4a92HylASX1BYWuq7O97
   AF0t8w2sL9IhxuDLFqS4kEIENodMEcQLjGAOb5DuDwzSvS3x+pwkHT9Ld
   rS42VuiN8j112+EAaBJ0dNfq064kuQQxLAs/dFq65XlvVSNWjmLPTEtS7
   sVz7Yt6PdtZeO+7qLFIkA/xkMxP/Wsb0gH5/Z4DFz31acV+ucrGY+kJnd
   X2SChfWqcQp5TAwUSnpJboU7tuxHbSE/ZnsV/U5wNjnrH/UlF/SYk+gGC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377689073"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="377689073"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 18:14:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="777771559"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="777771559"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Sep 2023 18:14:38 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qemYW-0002nS-1U;
	Sat, 09 Sep 2023 01:14:36 +0000
Date: Sat, 9 Sep 2023 09:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>
Subject: [peterz-queue:locking/futex 7/14] kernel/futex/core.c:222: warning:
 Function parameter or member 'flags' not described in 'get_futex_key'
Message-ID: <202309090910.4bIm0PiW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/futex
head:   7c287facd2acdaa99442761441202f4604d2646f
commit: c30be79f616a0810440007705e77a76f235fdb2a [7/14] futex: Propagate flags into get_futex_key()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230909/202309090910.4bIm0PiW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090910.4bIm0PiW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090910.4bIm0PiW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex/core.c:222: warning: Function parameter or member 'flags' not described in 'get_futex_key'
>> kernel/futex/core.c:222: warning: Excess function parameter 'fshared' description in 'get_futex_key'


vim +222 kernel/futex/core.c

8019ad13ef7f64be kernel/futex.c      Peter Zijlstra          2020-03-04  192  
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  193  /**
d96ee56ce0582967 kernel/futex.c      Darren Hart             2009-09-21  194   * get_futex_key() - Get parameters which are the keys for a futex
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  195   * @uaddr:	virtual address of the futex
9261308598ad28b9 kernel/futex.c      André Almeida           2020-07-02  196   * @fshared:	false for a PROCESS_PRIVATE futex, true for PROCESS_SHARED
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  197   * @key:	address where result is stored.
96d4f267e40f9509 kernel/futex.c      Linus Torvalds          2019-01-03  198   * @rw:		mapping needs to be read/write (values: FUTEX_READ,
96d4f267e40f9509 kernel/futex.c      Linus Torvalds          2019-01-03  199   *              FUTEX_WRITE)
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  200   *
6c23cbbd5056b155 kernel/futex.c      Randy Dunlap            2013-03-05  201   * Return: a negative error code or 0
6c23cbbd5056b155 kernel/futex.c      Randy Dunlap            2013-03-05  202   *
7b4ff1adb57ad96d kernel/futex.c      Mauro Carvalho Chehab   2017-05-11  203   * The key words are stored in @key on success.
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  204   *
8019ad13ef7f64be kernel/futex.c      Peter Zijlstra          2020-03-04  205   * For shared mappings (when @fshared), the key is:
03c109d66867767d kernel/futex.c      Mauro Carvalho Chehab   2020-04-14  206   *
8019ad13ef7f64be kernel/futex.c      Peter Zijlstra          2020-03-04  207   *   ( inode->i_sequence, page->index, offset_within_page )
03c109d66867767d kernel/futex.c      Mauro Carvalho Chehab   2020-04-14  208   *
8019ad13ef7f64be kernel/futex.c      Peter Zijlstra          2020-03-04  209   * [ also see get_inode_sequence_number() ]
8019ad13ef7f64be kernel/futex.c      Peter Zijlstra          2020-03-04  210   *
8019ad13ef7f64be kernel/futex.c      Peter Zijlstra          2020-03-04  211   * For private mappings (or when !@fshared), the key is:
03c109d66867767d kernel/futex.c      Mauro Carvalho Chehab   2020-04-14  212   *
8019ad13ef7f64be kernel/futex.c      Peter Zijlstra          2020-03-04  213   *   ( current->mm, address, 0 )
8019ad13ef7f64be kernel/futex.c      Peter Zijlstra          2020-03-04  214   *
8019ad13ef7f64be kernel/futex.c      Peter Zijlstra          2020-03-04  215   * This allows (cross process, where applicable) identification of the futex
8019ad13ef7f64be kernel/futex.c      Peter Zijlstra          2020-03-04  216   * without keeping the page pinned for the duration of the FUTEX_WAIT.
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  217   *
b2d0994b1301fc3a kernel/futex.c      Darren Hart             2009-03-12  218   * lock_page() might sleep, the caller should not hold a spinlock.
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  219   */
c30be79f616a0810 kernel/futex/core.c Peter Zijlstra          2023-07-14  220  int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
9261308598ad28b9 kernel/futex.c      André Almeida           2020-07-02  221  		  enum futex_access rw)
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16 @222  {
e2970f2fb6950183 kernel/futex.c      Ingo Molnar             2006-06-27  223  	unsigned long address = (unsigned long)uaddr;
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  224  	struct mm_struct *mm = current->mm;
077fa7aed17de502 kernel/futex.c      Mel Gorman              2016-06-08  225  	struct page *page, *tail;
14d27abd1d12a64c kernel/futex.c      Kirill A. Shutemov      2016-01-15  226  	struct address_space *mapping;
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  227  	int err, ro = 0;
c30be79f616a0810 kernel/futex/core.c Peter Zijlstra          2023-07-14  228  	bool fshared;
c30be79f616a0810 kernel/futex/core.c Peter Zijlstra          2023-07-14  229  
c30be79f616a0810 kernel/futex/core.c Peter Zijlstra          2023-07-14  230  	fshared = flags & FLAGS_SHARED;
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  231  
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  232  	/*
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  233  	 * The futex address must be "naturally" aligned.
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  234  	 */
e2970f2fb6950183 kernel/futex.c      Ingo Molnar             2006-06-27  235  	key->both.offset = address % PAGE_SIZE;
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  236  	if (unlikely((address % sizeof(u32)) != 0))
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  237  		return -EINVAL;
e2970f2fb6950183 kernel/futex.c      Ingo Molnar             2006-06-27  238  	address -= key->both.offset;
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  239  
96d4f267e40f9509 kernel/futex.c      Linus Torvalds          2019-01-03  240  	if (unlikely(!access_ok(uaddr, sizeof(u32))))
5cdec2d833748fbd kernel/futex.c      Linus Torvalds          2013-12-12  241  		return -EFAULT;
5cdec2d833748fbd kernel/futex.c      Linus Torvalds          2013-12-12  242  
ab51fbab39d864f3 kernel/futex.c      Davidlohr Bueso         2015-06-29  243  	if (unlikely(should_fail_futex(fshared)))
ab51fbab39d864f3 kernel/futex.c      Davidlohr Bueso         2015-06-29  244  		return -EFAULT;
ab51fbab39d864f3 kernel/futex.c      Davidlohr Bueso         2015-06-29  245  
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  246  	/*
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  247  	 * PROCESS_PRIVATE futexes are fast.
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  248  	 * As the mm cannot disappear under us and the 'key' only needs
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  249  	 * virtual address, we dont even have to find the underlying vma.
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  250  	 * Note : We do have to check 'uaddr' is a valid user address,
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  251  	 *        but access_ok() should be faster than find_vma()
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  252  	 */
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  253  	if (!fshared) {
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  254  		key->private.mm = mm;
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  255  		key->private.address = address;
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  256  		return 0;
34f01cc1f512fa78 kernel/futex.c      Eric Dumazet            2007-05-09  257  	}
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  258  
38d47c1b7075bd7e kernel/futex.c      Peter Zijlstra          2008-09-26  259  again:
ab51fbab39d864f3 kernel/futex.c      Davidlohr Bueso         2015-06-29  260  	/* Ignore any VERIFY_READ mapping (futex common case) */
9261308598ad28b9 kernel/futex.c      André Almeida           2020-07-02  261  	if (unlikely(should_fail_futex(true)))
ab51fbab39d864f3 kernel/futex.c      Davidlohr Bueso         2015-06-29  262  		return -EFAULT;
ab51fbab39d864f3 kernel/futex.c      Davidlohr Bueso         2015-06-29  263  
73b0140bf0fe9df9 kernel/futex.c      Ira Weiny               2019-05-13  264  	err = get_user_pages_fast(address, 1, FOLL_WRITE, &page);
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  265  	/*
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  266  	 * If write access is not required (eg. FUTEX_WAIT), try
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  267  	 * and get read-only access.
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  268  	 */
96d4f267e40f9509 kernel/futex.c      Linus Torvalds          2019-01-03  269  	if (err == -EFAULT && rw == FUTEX_READ) {
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  270  		err = get_user_pages_fast(address, 1, 0, &page);
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  271  		ro = 1;
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  272  	}
38d47c1b7075bd7e kernel/futex.c      Peter Zijlstra          2008-09-26  273  	if (err < 0)
38d47c1b7075bd7e kernel/futex.c      Peter Zijlstra          2008-09-26  274  		return err;
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  275  	else
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  276  		err = 0;
38d47c1b7075bd7e kernel/futex.c      Peter Zijlstra          2008-09-26  277  
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  278  	/*
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  279  	 * The treatment of mapping from this point on is critical. The page
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  280  	 * lock protects many things but in this context the page lock
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  281  	 * stabilizes mapping, prevents inode freeing in the shared
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  282  	 * file-backed region case and guards against movement to swap cache.
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  283  	 *
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  284  	 * Strictly speaking the page lock is not needed in all cases being
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  285  	 * considered here and page lock forces unnecessarily serialization
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  286  	 * From this point on, mapping will be re-verified if necessary and
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  287  	 * page lock will be acquired only if it is unavoidable
077fa7aed17de502 kernel/futex.c      Mel Gorman              2016-06-08  288  	 *
077fa7aed17de502 kernel/futex.c      Mel Gorman              2016-06-08  289  	 * Mapping checks require the head page for any compound page so the
077fa7aed17de502 kernel/futex.c      Mel Gorman              2016-06-08  290  	 * head page and mapping is looked up now. For anonymous pages, it
077fa7aed17de502 kernel/futex.c      Mel Gorman              2016-06-08  291  	 * does not matter if the page splits in the future as the key is
077fa7aed17de502 kernel/futex.c      Mel Gorman              2016-06-08  292  	 * based on the address. For filesystem-backed pages, the tail is
077fa7aed17de502 kernel/futex.c      Mel Gorman              2016-06-08  293  	 * required as the index of the page determines the key. For
077fa7aed17de502 kernel/futex.c      Mel Gorman              2016-06-08  294  	 * base pages, there is no tail page and tail == page.
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  295  	 */
077fa7aed17de502 kernel/futex.c      Mel Gorman              2016-06-08  296  	tail = page;
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  297  	page = compound_head(page);
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  298  	mapping = READ_ONCE(page->mapping);
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  299  
a5b338f2b0b1ff73 kernel/futex.c      Andrea Arcangeli        2011-01-13  300  	/*
14d27abd1d12a64c kernel/futex.c      Kirill A. Shutemov      2016-01-15  301  	 * If page->mapping is NULL, then it cannot be a PageAnon
e6780f7243eddb13 kernel/futex.c      Hugh Dickins            2011-12-31  302  	 * page; but it might be the ZERO_PAGE or in the gate area or
e6780f7243eddb13 kernel/futex.c      Hugh Dickins            2011-12-31  303  	 * in a special mapping (all cases which we are happy to fail);
e6780f7243eddb13 kernel/futex.c      Hugh Dickins            2011-12-31  304  	 * or it may have been a good file page when get_user_pages_fast
e6780f7243eddb13 kernel/futex.c      Hugh Dickins            2011-12-31  305  	 * found it, but truncated or holepunched or subjected to
e6780f7243eddb13 kernel/futex.c      Hugh Dickins            2011-12-31  306  	 * invalidate_complete_page2 before we got the page lock (also
e6780f7243eddb13 kernel/futex.c      Hugh Dickins            2011-12-31  307  	 * cases which we are happy to fail).  And we hold a reference,
1b8ddbeeb9b819e6 kernel/futex/core.c Matthew Wilcox (Oracle  2022-02-12  308) 	 * so refcount care in invalidate_inode_page's remove_mapping
e6780f7243eddb13 kernel/futex.c      Hugh Dickins            2011-12-31  309  	 * prevents drop_caches from setting mapping to NULL beneath us.
e6780f7243eddb13 kernel/futex.c      Hugh Dickins            2011-12-31  310  	 *
e6780f7243eddb13 kernel/futex.c      Hugh Dickins            2011-12-31  311  	 * The case we do have to guard against is when memory pressure made
e6780f7243eddb13 kernel/futex.c      Hugh Dickins            2011-12-31  312  	 * shmem_writepage move it from filecache to swapcache beneath us:
14d27abd1d12a64c kernel/futex.c      Kirill A. Shutemov      2016-01-15  313  	 * an unlikely race, but we do need to retry for page->mapping.
e6780f7243eddb13 kernel/futex.c      Hugh Dickins            2011-12-31  314  	 */
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  315  	if (unlikely(!mapping)) {
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  316  		int shmem_swizzled;
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  317  
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  318  		/*
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  319  		 * Page lock is required to identify which special case above
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  320  		 * applies. If this is really a shmem page then the page lock
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  321  		 * will prevent unexpected transitions.
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  322  		 */
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  323  		lock_page(page);
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  324  		shmem_swizzled = PageSwapCache(page) || page->mapping;
14d27abd1d12a64c kernel/futex.c      Kirill A. Shutemov      2016-01-15  325  		unlock_page(page);
14d27abd1d12a64c kernel/futex.c      Kirill A. Shutemov      2016-01-15  326  		put_page(page);
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  327  
e6780f7243eddb13 kernel/futex.c      Hugh Dickins            2011-12-31  328  		if (shmem_swizzled)
38d47c1b7075bd7e kernel/futex.c      Peter Zijlstra          2008-09-26  329  			goto again;
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  330  
e6780f7243eddb13 kernel/futex.c      Hugh Dickins            2011-12-31  331  		return -EFAULT;
38d47c1b7075bd7e kernel/futex.c      Peter Zijlstra          2008-09-26  332  	}
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  333  
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  334  	/*
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  335  	 * Private mappings are handled in a simple way.
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  336  	 *
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  337  	 * If the futex key is stored on an anonymous page, then the associated
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  338  	 * object is the mm which is implicitly pinned by the calling process.
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  339  	 *
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  340  	 * NOTE: When userspace waits on a MAP_SHARED mapping, even if
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  341  	 * it's a read-only handle, it's expected that futexes attach to
38d47c1b7075bd7e kernel/futex.c      Peter Zijlstra          2008-09-26  342  	 * the object not the particular process.
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  343  	 */
14d27abd1d12a64c kernel/futex.c      Kirill A. Shutemov      2016-01-15  344  	if (PageAnon(page)) {
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  345  		/*
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  346  		 * A RO anonymous page will never change and thus doesn't make
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  347  		 * sense for futex operations.
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  348  		 */
9261308598ad28b9 kernel/futex.c      André Almeida           2020-07-02  349  		if (unlikely(should_fail_futex(true)) || ro) {
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  350  			err = -EFAULT;
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  351  			goto out;
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  352  		}
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  353  
38d47c1b7075bd7e kernel/futex.c      Peter Zijlstra          2008-09-26  354  		key->both.offset |= FUT_OFF_MMSHARED; /* ref taken on mm */
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  355  		key->private.mm = mm;
e2970f2fb6950183 kernel/futex.c      Ingo Molnar             2006-06-27  356  		key->private.address = address;
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  357  
38d47c1b7075bd7e kernel/futex.c      Peter Zijlstra          2008-09-26  358  	} else {
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  359  		struct inode *inode;
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  360  
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  361  		/*
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  362  		 * The associated futex object in this case is the inode and
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  363  		 * the page->mapping must be traversed. Ordinarily this should
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  364  		 * be stabilised under page lock but it's not strictly
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  365  		 * necessary in this case as we just want to pin the inode, not
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  366  		 * update the radix tree or anything like that.
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  367  		 *
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  368  		 * The RCU read lock is taken as the inode is finally freed
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  369  		 * under RCU. If the mapping still matches expectations then the
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  370  		 * mapping->host can be safely accessed as being a valid inode.
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  371  		 */
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  372  		rcu_read_lock();
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  373  
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  374  		if (READ_ONCE(page->mapping) != mapping) {
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  375  			rcu_read_unlock();
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  376  			put_page(page);
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  377  
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  378  			goto again;
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  379  		}
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  380  
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  381  		inode = READ_ONCE(mapping->host);
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  382  		if (!inode) {
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  383  			rcu_read_unlock();
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  384  			put_page(page);
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  385  
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  386  			goto again;
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  387  		}
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  388  
38d47c1b7075bd7e kernel/futex.c      Peter Zijlstra          2008-09-26  389  		key->both.offset |= FUT_OFF_INODE; /* inode-based key */
8019ad13ef7f64be kernel/futex.c      Peter Zijlstra          2020-03-04  390  		key->shared.i_seq = get_inode_sequence_number(inode);
fe19bd3dae3d15d2 kernel/futex.c      Hugh Dickins            2021-06-24  391  		key->shared.pgoff = page_to_pgoff(tail);
65d8fc777f6dcfee kernel/futex.c      Mel Gorman              2016-02-09  392  		rcu_read_unlock();
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  393  	}
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  394  
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  395  out:
14d27abd1d12a64c kernel/futex.c      Kirill A. Shutemov      2016-01-15  396  	put_page(page);
9ea71503a8ed9184 kernel/futex.c      Shawn Bohrer            2011-06-30  397  	return err;
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  398  }
^1da177e4c3f4152 kernel/futex.c      Linus Torvalds          2005-04-16  399  

:::::: The code at line 222 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
