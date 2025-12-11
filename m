Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1C62D97AB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 08:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440537; cv=none; b=mMr033GWxEURHf+aCmVgzRwxp3sToTW6nY6hR5/RKwyAy1A4EsUHuETQGgEsKQFKs3QAcc0VBskFJmsI/BEioGlR7HQAqVHNQtmwoguLYRv3Ssjko8zBQjY4WAmiOM4Yb2etWQx3j6fMLhPZif5fVRDXtcdxahLmuTx1IdhI7EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440537; c=relaxed/simple;
	bh=8J8Et7SvSVfNj713kS2hWSAAvrb3uWpasbqsemI9zW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lBGbqPsL81gYbr0qv8qRnXR2Z5x2iNSGtb3yeL8gYxfnUAFokcRBno4JQ06UVX5BAYkBWovVhTc20qZSv4JKzpqwkH+HNAqcpVy+AG5GNi7eEYAQVJFpBvxUKC6vsbFdncWAO1pNeG+kAlXnpgLbwDAhNEiBmLWhtPdBpOEO/UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bn3iGhcZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bn3iGhcZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765440530; x=1796976530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8J8Et7SvSVfNj713kS2hWSAAvrb3uWpasbqsemI9zW8=;
  b=bn3iGhcZxjJza2nVU8groJNv9R7KrEugffwCcowhfV4bIkhfMM9ac9K8
   rp89VbyZe5ES2T/c0LS/BIIU8MbSeA4wNby/20EUONzM6wcpSsJzwGCeW
   C/m3OY0u753gMY4NXk67Ayfvfr0ZcQKAMXRk2IiyK83Q8ZcDeSwI7+nZI
   sm4myH2KrPsFbEZTNJgjQUP6phRo+ijK5626Q9/uH1dnzqEGcjMTGEob4
   Tx3DbswI3z5ialfSypzOZ6gSC82YkynzR0+6XurVGeDr77qa+mS4GvRQ7
   3VXt+YAj1hcHLvGKzr/car8I6munt82L8WM6dgDP448KlckyaMFkUGycx
   Q==;
X-CSE-ConnectionGUID: YUPySBKqTWOg2O8OEmtJSw==
X-CSE-MsgGUID: 6KkwThhjR0SEIflnTzcK4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67354366"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67354366"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 00:08:49 -0800
X-CSE-ConnectionGUID: vnxlz0f/QAmrLO5YCYG7pg==
X-CSE-MsgGUID: oCjyCjkLQ0mLmwpQWoJanA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="227795653"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2025 00:08:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTbjB-000000004ON-30PF;
	Thu, 11 Dec 2025 08:08:45 +0000
Date: Thu, 11 Dec 2025 16:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: kernel/futex/core.c:505:38: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <202512111555.3X7kd9T0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: cec199c5e39bde7191a08087cc3d002ccfab31ff futex: Implement FUTEX2_NUMA
date:   7 months ago
config: x86_64-randconfig-121-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111555.3X7kd9T0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111555.3X7kd9T0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111555.3X7kd9T0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/futex/core.c:505:38: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:505:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
   kernel/futex/core.c:505:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
   kernel/futex/core.c:505:51: sparse:     got void *
   kernel/futex/core.c:894:9: sparse: sparse: context imbalance in 'futex_q_lockptr_lock' - wrong count at exit

vim +/__user +505 kernel/futex/core.c

   446	
   447	/**
   448	 * get_futex_key() - Get parameters which are the keys for a futex
   449	 * @uaddr:	virtual address of the futex
   450	 * @flags:	FLAGS_*
   451	 * @key:	address where result is stored.
   452	 * @rw:		mapping needs to be read/write (values: FUTEX_READ,
   453	 *              FUTEX_WRITE)
   454	 *
   455	 * Return: a negative error code or 0
   456	 *
   457	 * The key words are stored in @key on success.
   458	 *
   459	 * For shared mappings (when @fshared), the key is:
   460	 *
   461	 *   ( inode->i_sequence, page->index, offset_within_page )
   462	 *
   463	 * [ also see get_inode_sequence_number() ]
   464	 *
   465	 * For private mappings (or when !@fshared), the key is:
   466	 *
   467	 *   ( current->mm, address, 0 )
   468	 *
   469	 * This allows (cross process, where applicable) identification of the futex
   470	 * without keeping the page pinned for the duration of the FUTEX_WAIT.
   471	 *
   472	 * lock_page() might sleep, the caller should not hold a spinlock.
   473	 */
   474	int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
   475			  enum futex_access rw)
   476	{
   477		unsigned long address = (unsigned long)uaddr;
   478		struct mm_struct *mm = current->mm;
   479		struct page *page;
   480		struct folio *folio;
   481		struct address_space *mapping;
   482		int node, err, size, ro = 0;
   483		bool fshared;
   484	
   485		fshared = flags & FLAGS_SHARED;
   486		size = futex_size(flags);
   487		if (flags & FLAGS_NUMA)
   488			size *= 2;
   489	
   490		/*
   491		 * The futex address must be "naturally" aligned.
   492		 */
   493		key->both.offset = address % PAGE_SIZE;
   494		if (unlikely((address % size) != 0))
   495			return -EINVAL;
   496		address -= key->both.offset;
   497	
   498		if (unlikely(!access_ok(uaddr, size)))
   499			return -EFAULT;
   500	
   501		if (unlikely(should_fail_futex(fshared)))
   502			return -EFAULT;
   503	
   504		if (flags & FLAGS_NUMA) {
 > 505			u32 __user *naddr = (void *)uaddr + size / 2;
   506	
   507			if (futex_get_value(&node, naddr))
   508				return -EFAULT;
   509	
   510			if (node == FUTEX_NO_NODE) {
   511				node = numa_node_id();
   512				if (futex_put_value(node, naddr))
   513					return -EFAULT;
   514	
   515			} else if (node >= MAX_NUMNODES || !node_possible(node)) {
   516				return -EINVAL;
   517			}
   518	
   519			key->both.node = node;
   520	
   521		} else {
   522			key->both.node = FUTEX_NO_NODE;
   523		}
   524	
   525		/*
   526		 * PROCESS_PRIVATE futexes are fast.
   527		 * As the mm cannot disappear under us and the 'key' only needs
   528		 * virtual address, we dont even have to find the underlying vma.
   529		 * Note : We do have to check 'uaddr' is a valid user address,
   530		 *        but access_ok() should be faster than find_vma()
   531		 */
   532		if (!fshared) {
   533			/*
   534			 * On no-MMU, shared futexes are treated as private, therefore
   535			 * we must not include the current process in the key. Since
   536			 * there is only one address space, the address is a unique key
   537			 * on its own.
   538			 */
   539			if (IS_ENABLED(CONFIG_MMU))
   540				key->private.mm = mm;
   541			else
   542				key->private.mm = NULL;
   543	
   544			key->private.address = address;
   545			return 0;
   546		}
   547	
   548	again:
   549		/* Ignore any VERIFY_READ mapping (futex common case) */
   550		if (unlikely(should_fail_futex(true)))
   551			return -EFAULT;
   552	
   553		err = get_user_pages_fast(address, 1, FOLL_WRITE, &page);
   554		/*
   555		 * If write access is not required (eg. FUTEX_WAIT), try
   556		 * and get read-only access.
   557		 */
   558		if (err == -EFAULT && rw == FUTEX_READ) {
   559			err = get_user_pages_fast(address, 1, 0, &page);
   560			ro = 1;
   561		}
   562		if (err < 0)
   563			return err;
   564		else
   565			err = 0;
   566	
   567		/*
   568		 * The treatment of mapping from this point on is critical. The folio
   569		 * lock protects many things but in this context the folio lock
   570		 * stabilizes mapping, prevents inode freeing in the shared
   571		 * file-backed region case and guards against movement to swap cache.
   572		 *
   573		 * Strictly speaking the folio lock is not needed in all cases being
   574		 * considered here and folio lock forces unnecessarily serialization.
   575		 * From this point on, mapping will be re-verified if necessary and
   576		 * folio lock will be acquired only if it is unavoidable
   577		 *
   578		 * Mapping checks require the folio so it is looked up now. For
   579		 * anonymous pages, it does not matter if the folio is split
   580		 * in the future as the key is based on the address. For
   581		 * filesystem-backed pages, the precise page is required as the
   582		 * index of the page determines the key.
   583		 */
   584		folio = page_folio(page);
   585		mapping = READ_ONCE(folio->mapping);
   586	
   587		/*
   588		 * If folio->mapping is NULL, then it cannot be an anonymous
   589		 * page; but it might be the ZERO_PAGE or in the gate area or
   590		 * in a special mapping (all cases which we are happy to fail);
   591		 * or it may have been a good file page when get_user_pages_fast
   592		 * found it, but truncated or holepunched or subjected to
   593		 * invalidate_complete_page2 before we got the folio lock (also
   594		 * cases which we are happy to fail).  And we hold a reference,
   595		 * so refcount care in invalidate_inode_page's remove_mapping
   596		 * prevents drop_caches from setting mapping to NULL beneath us.
   597		 *
   598		 * The case we do have to guard against is when memory pressure made
   599		 * shmem_writepage move it from filecache to swapcache beneath us:
   600		 * an unlikely race, but we do need to retry for folio->mapping.
   601		 */
   602		if (unlikely(!mapping)) {
   603			int shmem_swizzled;
   604	
   605			/*
   606			 * Folio lock is required to identify which special case above
   607			 * applies. If this is really a shmem page then the folio lock
   608			 * will prevent unexpected transitions.
   609			 */
   610			folio_lock(folio);
   611			shmem_swizzled = folio_test_swapcache(folio) || folio->mapping;
   612			folio_unlock(folio);
   613			folio_put(folio);
   614	
   615			if (shmem_swizzled)
   616				goto again;
   617	
   618			return -EFAULT;
   619		}
   620	
   621		/*
   622		 * Private mappings are handled in a simple way.
   623		 *
   624		 * If the futex key is stored in anonymous memory, then the associated
   625		 * object is the mm which is implicitly pinned by the calling process.
   626		 *
   627		 * NOTE: When userspace waits on a MAP_SHARED mapping, even if
   628		 * it's a read-only handle, it's expected that futexes attach to
   629		 * the object not the particular process.
   630		 */
   631		if (folio_test_anon(folio)) {
   632			/*
   633			 * A RO anonymous page will never change and thus doesn't make
   634			 * sense for futex operations.
   635			 */
   636			if (unlikely(should_fail_futex(true)) || ro) {
   637				err = -EFAULT;
   638				goto out;
   639			}
   640	
   641			key->both.offset |= FUT_OFF_MMSHARED; /* ref taken on mm */
   642			key->private.mm = mm;
   643			key->private.address = address;
   644	
   645		} else {
   646			struct inode *inode;
   647	
   648			/*
   649			 * The associated futex object in this case is the inode and
   650			 * the folio->mapping must be traversed. Ordinarily this should
   651			 * be stabilised under folio lock but it's not strictly
   652			 * necessary in this case as we just want to pin the inode, not
   653			 * update i_pages or anything like that.
   654			 *
   655			 * The RCU read lock is taken as the inode is finally freed
   656			 * under RCU. If the mapping still matches expectations then the
   657			 * mapping->host can be safely accessed as being a valid inode.
   658			 */
   659			rcu_read_lock();
   660	
   661			if (READ_ONCE(folio->mapping) != mapping) {
   662				rcu_read_unlock();
   663				folio_put(folio);
   664	
   665				goto again;
   666			}
   667	
   668			inode = READ_ONCE(mapping->host);
   669			if (!inode) {
   670				rcu_read_unlock();
   671				folio_put(folio);
   672	
   673				goto again;
   674			}
   675	
   676			key->both.offset |= FUT_OFF_INODE; /* inode-based key */
   677			key->shared.i_seq = get_inode_sequence_number(inode);
   678			key->shared.pgoff = page_pgoff(folio, page);
   679			rcu_read_unlock();
   680		}
   681	
   682	out:
   683		folio_put(folio);
   684		return err;
   685	}
   686	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
