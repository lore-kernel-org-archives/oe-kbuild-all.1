Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E1933F5AA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 May 2026 05:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779688213; cv=none; b=MITONiriYiY80Oxi44L1d9XPESwW9ojP17ayu2UGS6Q+3HlAK3pIHGYSa6JHraGyp9slY2gzjn0ZjBzAbV0MY0F9tWEBXLkUX5gZJk9ovJvZ3blRzaz96d3/2knrbNdobHjarHO40XLC+PFVfBTWwRycdbHLx5KaPdXrxWI6F7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779688213; c=relaxed/simple;
	bh=sTuaukQrvKpR8oBvVaKp+/6OLIbknDsz/fk4GhCjTJk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OjxAmWDil3mnDF26sLAXTUYMssjYPidku1P84zgeRWkAI1tE7yh7PGEN7uL+CygpEsR0CC1Xm4B7DgTcwCtGiBfn8OncqHWYCESx/nfmt+dFrknnTgn+yllAaKItSrYGBWGlLB7xHZ9N0x9kI9gggafEixd6+RVZcHhLMBK3Qa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clZ4QMcx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clZ4QMcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779688211; x=1811224211;
  h=date:from:to:cc:subject:message-id;
  bh=sTuaukQrvKpR8oBvVaKp+/6OLIbknDsz/fk4GhCjTJk=;
  b=clZ4QMcx86YM0gnvT49maorwvrS7bqtec4GlG21EIB2XxtTk/PScdAKc
   C4Jvz2sjuvkQNx5mBQFUT0ROcgcqHD9vEwhuSnzhcYiRMsXVwfASU9h6D
   faEwgvEcZYurrCx4hDYy05Cl+eX9XzBkc1BPNBGQ0LKpX1fIOpR5NJdDj
   yvZy2Joj9VtyGDWE3/3D43E5B5izPprJL5X8/yFAFxIt/UNUQjBKo9x37
   JRWtaR7bWgqJph1J0WK5N5G8SgqjRX+6Zmr15ZrtaprEZkE5+WyWeBSNd
   QWYEdrb47dfzAwlJwJMKuwm8V02rOD+9HtEW1xVm5PQbcvYfPC2ClHAkT
   A==;
X-CSE-ConnectionGUID: o+/DgVbeTJCbQ8JwpOW7cQ==
X-CSE-MsgGUID: oWMiaBBASHW7Bu8FUrzgaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="98081314"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="98081314"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 22:50:10 -0700
X-CSE-ConnectionGUID: Wu3UB365ScawsEGxpRkjbQ==
X-CSE-MsgGUID: RVAu4vxNS76Hly94tAMEQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="265347150"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 May 2026 22:50:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wROCR-0000000018T-235u;
	Mon, 25 May 2026 05:50:03 +0000
Date: Mon, 25 May 2026 13:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/fs 9/17] fs/jfs/jfs_dtree.c:2888:27:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202605251303.IEkatmss-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/fs
head:   5372cf51987f43bb43bc4a69a0a45965080f3008
commit: 33655e05e6fdc0016b6a8aa18da9916446cc9143 [9/17] jfs: replace __get_free_page() with kmalloc()
config: sparc64-randconfig-r131-20260525 (https://download.01.org/0day-ci/archive/20260525/202605251303.IEkatmss-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605251303.IEkatmss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605251303.IEkatmss-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/jfs/jfs_dtree.c:2888:27: sparse: sparse: Using plain integer as NULL pointer

vim +2888 fs/jfs/jfs_dtree.c

^1da177e4c3f41 Linus Torvalds            2005-04-16  2699  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2700  /*
^1da177e4c3f41 Linus Torvalds            2005-04-16  2701   *	jfs_readdir()
^1da177e4c3f41 Linus Torvalds            2005-04-16  2702   *
^1da177e4c3f41 Linus Torvalds            2005-04-16  2703   * function: read directory entries sequentially
^1da177e4c3f41 Linus Torvalds            2005-04-16  2704   *	from the specified entry offset
^1da177e4c3f41 Linus Torvalds            2005-04-16  2705   *
^1da177e4c3f41 Linus Torvalds            2005-04-16  2706   * parameter:
^1da177e4c3f41 Linus Torvalds            2005-04-16  2707   *
^1da177e4c3f41 Linus Torvalds            2005-04-16  2708   * return: offset = (pn, index) of start entry
^1da177e4c3f41 Linus Torvalds            2005-04-16  2709   *	of next jfs_readdir()/dtRead()
^1da177e4c3f41 Linus Torvalds            2005-04-16  2710   */
070a0ebf42e15c Al Viro                   2013-05-17  2711  int jfs_readdir(struct file *file, struct dir_context *ctx)
^1da177e4c3f41 Linus Torvalds            2005-04-16  2712  {
070a0ebf42e15c Al Viro                   2013-05-17  2713  	struct inode *ip = file_inode(file);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2714  	struct nls_table *codepage = JFS_SBI(ip->i_sb)->nls_tab;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2715  	int rc = 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2716  	loff_t dtpos;	/* legacy OS/2 style position */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2717  	struct dtoffset {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2718  		s16 pn;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2719  		s16 index;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2720  		s32 unused;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2721  	} *dtoffset = (struct dtoffset *) &dtpos;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2722  	s64 bn;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2723  	struct metapage *mp;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2724  	dtpage_t *p;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2725  	int index;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2726  	s8 *stbl;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2727  	struct btstack btstack;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2728  	int i, next;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2729  	struct ldtentry *d;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2730  	struct dtslot *t;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2731  	int d_namleft, len, outlen;
33655e05e6fdc0 Mike Rapoport (Microsoft  2026-05-17  2732) 	void *dirent_buf;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2733  	char *name_ptr;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2734  	u32 dir_index;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2735  	int do_index = 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2736  	uint loop_count = 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2737  	struct jfs_dirent *jfs_dirent;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2738  	int jfs_dirents;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2739  	int overflow, fix_page, page_fixed = 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2740  	static int unique_pos = 2;	/* If we can't fix broken index */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2741  
070a0ebf42e15c Al Viro                   2013-05-17  2742  	if (ctx->pos == DIREND)
^1da177e4c3f41 Linus Torvalds            2005-04-16  2743  		return 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2744  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2745  	if (DO_INDEX(ip)) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2746  		/*
^1da177e4c3f41 Linus Torvalds            2005-04-16  2747  		 * persistent index is stored in directory entries.
^1da177e4c3f41 Linus Torvalds            2005-04-16  2748  		 * Special cases:	 0 = .
^1da177e4c3f41 Linus Torvalds            2005-04-16  2749  		 *			 1 = ..
^1da177e4c3f41 Linus Torvalds            2005-04-16  2750  		 *			-1 = End of directory
^1da177e4c3f41 Linus Torvalds            2005-04-16  2751  		 */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2752  		do_index = 1;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2753  
070a0ebf42e15c Al Viro                   2013-05-17  2754  		dir_index = (u32) ctx->pos;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2755  
44512449c0ab36 Dave Kleikamp             2013-08-15  2756  		/*
44512449c0ab36 Dave Kleikamp             2013-08-15  2757  		 * NFSv4 reserves cookies 1 and 2 for . and .. so the value
44512449c0ab36 Dave Kleikamp             2013-08-15  2758  		 * we return to the vfs is one greater than the one we use
44512449c0ab36 Dave Kleikamp             2013-08-15  2759  		 * internally.
44512449c0ab36 Dave Kleikamp             2013-08-15  2760  		 */
44512449c0ab36 Dave Kleikamp             2013-08-15  2761  		if (dir_index)
44512449c0ab36 Dave Kleikamp             2013-08-15  2762  			dir_index--;
44512449c0ab36 Dave Kleikamp             2013-08-15  2763  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2764  		if (dir_index > 1) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2765  			struct dir_table_slot dirtab_slot;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2766  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2767  			if (dtEmpty(ip) ||
^1da177e4c3f41 Linus Torvalds            2005-04-16  2768  			    (dir_index >= JFS_IP(ip)->next_index)) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2769  				/* Stale position.  Directory has shrunk */
070a0ebf42e15c Al Viro                   2013-05-17  2770  				ctx->pos = DIREND;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2771  				return 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2772  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2773  		      repeat:
^1da177e4c3f41 Linus Torvalds            2005-04-16  2774  			rc = read_index(ip, dir_index, &dirtab_slot);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2775  			if (rc) {
070a0ebf42e15c Al Viro                   2013-05-17  2776  				ctx->pos = DIREND;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2777  				return rc;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2778  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2779  			if (dirtab_slot.flag == DIR_INDEX_FREE) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2780  				if (loop_count++ > JFS_IP(ip)->next_index) {
6ed71e9819ac34 Joe Perches               2016-03-30  2781  					jfs_err("jfs_readdir detected infinite loop!");
070a0ebf42e15c Al Viro                   2013-05-17  2782  					ctx->pos = DIREND;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2783  					return 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2784  				}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2785  				dir_index = le32_to_cpu(dirtab_slot.addr2);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2786  				if (dir_index == -1) {
070a0ebf42e15c Al Viro                   2013-05-17  2787  					ctx->pos = DIREND;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2788  					return 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2789  				}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2790  				goto repeat;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2791  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2792  			bn = addressDTS(&dirtab_slot);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2793  			index = dirtab_slot.slot;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2794  			DT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2795  			if (rc) {
070a0ebf42e15c Al Viro                   2013-05-17  2796  				ctx->pos = DIREND;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2797  				return 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2798  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2799  			if (p->header.flag & BT_INTERNAL) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2800  				jfs_err("jfs_readdir: bad index table");
^1da177e4c3f41 Linus Torvalds            2005-04-16  2801  				DT_PUTPAGE(mp);
44512449c0ab36 Dave Kleikamp             2013-08-15  2802  				ctx->pos = DIREND;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2803  				return 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2804  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2805  		} else {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2806  			if (dir_index == 0) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2807  				/*
^1da177e4c3f41 Linus Torvalds            2005-04-16  2808  				 * self "."
^1da177e4c3f41 Linus Torvalds            2005-04-16  2809  				 */
44512449c0ab36 Dave Kleikamp             2013-08-15  2810  				ctx->pos = 1;
070a0ebf42e15c Al Viro                   2013-05-17  2811  				if (!dir_emit(ctx, ".", 1, ip->i_ino, DT_DIR))
^1da177e4c3f41 Linus Torvalds            2005-04-16  2812  					return 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2813  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2814  			/*
^1da177e4c3f41 Linus Torvalds            2005-04-16  2815  			 * parent ".."
^1da177e4c3f41 Linus Torvalds            2005-04-16  2816  			 */
44512449c0ab36 Dave Kleikamp             2013-08-15  2817  			ctx->pos = 2;
070a0ebf42e15c Al Viro                   2013-05-17  2818  			if (!dir_emit(ctx, "..", 2, PARENT(ip), DT_DIR))
^1da177e4c3f41 Linus Torvalds            2005-04-16  2819  				return 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2820  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2821  			/*
^1da177e4c3f41 Linus Torvalds            2005-04-16  2822  			 * Find first entry of left-most leaf
^1da177e4c3f41 Linus Torvalds            2005-04-16  2823  			 */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2824  			if (dtEmpty(ip)) {
070a0ebf42e15c Al Viro                   2013-05-17  2825  				ctx->pos = DIREND;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2826  				return 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2827  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2828  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2829  			if ((rc = dtReadFirst(ip, &btstack)))
^1da177e4c3f41 Linus Torvalds            2005-04-16  2830  				return rc;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2831  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2832  			DT_GETSEARCH(ip, btstack.top, bn, mp, p, index);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2833  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2834  	} else {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2835  		/*
^1da177e4c3f41 Linus Torvalds            2005-04-16  2836  		 * Legacy filesystem - OS/2 & Linux JFS < 0.3.6
^1da177e4c3f41 Linus Torvalds            2005-04-16  2837  		 *
44512449c0ab36 Dave Kleikamp             2013-08-15  2838  		 * pn = 0; index = 1:	First entry "."
44512449c0ab36 Dave Kleikamp             2013-08-15  2839  		 * pn = 0; index = 2:	Second entry ".."
^1da177e4c3f41 Linus Torvalds            2005-04-16  2840  		 * pn > 0:		Real entries, pn=1 -> leftmost page
^1da177e4c3f41 Linus Torvalds            2005-04-16  2841  		 * pn = index = -1:	No more entries
^1da177e4c3f41 Linus Torvalds            2005-04-16  2842  		 */
070a0ebf42e15c Al Viro                   2013-05-17  2843  		dtpos = ctx->pos;
44512449c0ab36 Dave Kleikamp             2013-08-15  2844  		if (dtpos < 2) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2845  			/* build "." entry */
44512449c0ab36 Dave Kleikamp             2013-08-15  2846  			ctx->pos = 1;
070a0ebf42e15c Al Viro                   2013-05-17  2847  			if (!dir_emit(ctx, ".", 1, ip->i_ino, DT_DIR))
^1da177e4c3f41 Linus Torvalds            2005-04-16  2848  				return 0;
44512449c0ab36 Dave Kleikamp             2013-08-15  2849  			dtoffset->index = 2;
070a0ebf42e15c Al Viro                   2013-05-17  2850  			ctx->pos = dtpos;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2851  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2852  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2853  		if (dtoffset->pn == 0) {
44512449c0ab36 Dave Kleikamp             2013-08-15  2854  			if (dtoffset->index == 2) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2855  				/* build ".." entry */
070a0ebf42e15c Al Viro                   2013-05-17  2856  				if (!dir_emit(ctx, "..", 2, PARENT(ip), DT_DIR))
^1da177e4c3f41 Linus Torvalds            2005-04-16  2857  					return 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2858  			} else {
6ed71e9819ac34 Joe Perches               2016-03-30  2859  				jfs_err("jfs_readdir called with invalid offset!");
^1da177e4c3f41 Linus Torvalds            2005-04-16  2860  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2861  			dtoffset->pn = 1;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2862  			dtoffset->index = 0;
070a0ebf42e15c Al Viro                   2013-05-17  2863  			ctx->pos = dtpos;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2864  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2865  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2866  		if (dtEmpty(ip)) {
070a0ebf42e15c Al Viro                   2013-05-17  2867  			ctx->pos = DIREND;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2868  			return 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2869  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2870  
070a0ebf42e15c Al Viro                   2013-05-17  2871  		if ((rc = dtReadNext(ip, &ctx->pos, &btstack))) {
6ed71e9819ac34 Joe Perches               2016-03-30  2872  			jfs_err("jfs_readdir: unexpected rc = %d from dtReadNext",
6ed71e9819ac34 Joe Perches               2016-03-30  2873  				rc);
070a0ebf42e15c Al Viro                   2013-05-17  2874  			ctx->pos = DIREND;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2875  			return 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2876  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2877  		/* get start leaf page and index */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2878  		DT_GETSEARCH(ip, btstack.top, bn, mp, p, index);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2879  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2880  		/* offset beyond directory eof ? */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2881  		if (bn < 0) {
070a0ebf42e15c Al Viro                   2013-05-17  2882  			ctx->pos = DIREND;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2883  			return 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2884  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2885  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2886  
33655e05e6fdc0 Mike Rapoport (Microsoft  2026-05-17  2887) 	dirent_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds            2005-04-16 @2888  	if (dirent_buf == 0) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2889  		DT_PUTPAGE(mp);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2890  		jfs_warn("jfs_readdir: __get_free_page failed!");
070a0ebf42e15c Al Viro                   2013-05-17  2891  		ctx->pos = DIREND;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2892  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2893  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2894  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2895  	while (1) {
33655e05e6fdc0 Mike Rapoport (Microsoft  2026-05-17  2896) 		jfs_dirent = dirent_buf;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2897  		jfs_dirents = 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2898  		overflow = fix_page = 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2899  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2900  		stbl = DT_GETSTBL(p);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2901  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2902  		for (i = index; i < p->header.nextindex; i++) {
7833570dae8330 Arnd Bergmann             2026-02-02  2903  			if (stbl[i] < 0) {
839f102efb168f Ghanshyam Agrawal         2024-10-01  2904  				jfs_err("JFS: Invalid stbl[%d] = %d for inode %ld, block = %lld",
839f102efb168f Ghanshyam Agrawal         2024-10-01  2905  					i, stbl[i], (long)ip->i_ino, (long long)bn);
33655e05e6fdc0 Mike Rapoport (Microsoft  2026-05-17  2906) 				kfree(dirent_buf);
839f102efb168f Ghanshyam Agrawal         2024-10-01  2907  				DT_PUTPAGE(mp);
839f102efb168f Ghanshyam Agrawal         2024-10-01  2908  				return -EIO;
839f102efb168f Ghanshyam Agrawal         2024-10-01  2909  			}
839f102efb168f Ghanshyam Agrawal         2024-10-01  2910  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2911  			d = (struct ldtentry *) & p->slot[stbl[i]];
^1da177e4c3f41 Linus Torvalds            2005-04-16  2912  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2913  			if (((long) jfs_dirent + d->namlen + 1) >
33655e05e6fdc0 Mike Rapoport (Microsoft  2026-05-17  2914) 			    ((long)dirent_buf + PAGE_SIZE)) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2915  				/* DBCS codepages could overrun dirent_buf */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2916  				index = i;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2917  				overflow = 1;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2918  				break;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2919  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2920  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2921  			d_namleft = d->namlen;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2922  			name_ptr = jfs_dirent->name;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2923  			jfs_dirent->ino = le32_to_cpu(d->inumber);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2924  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2925  			if (do_index) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2926  				len = min(d_namleft, DTLHDRDATALEN);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2927  				jfs_dirent->position = le32_to_cpu(d->index);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2928  				/*
^1da177e4c3f41 Linus Torvalds            2005-04-16  2929  				 * d->index should always be valid, but it
^1da177e4c3f41 Linus Torvalds            2005-04-16  2930  				 * isn't.  fsck.jfs doesn't create the
^1da177e4c3f41 Linus Torvalds            2005-04-16  2931  				 * directory index for the lost+found
^1da177e4c3f41 Linus Torvalds            2005-04-16  2932  				 * directory.  Rather than let it go,
^1da177e4c3f41 Linus Torvalds            2005-04-16  2933  				 * we can try to fix it.
^1da177e4c3f41 Linus Torvalds            2005-04-16  2934  				 */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2935  				if ((jfs_dirent->position < 2) ||
^1da177e4c3f41 Linus Torvalds            2005-04-16  2936  				    (jfs_dirent->position >=
^1da177e4c3f41 Linus Torvalds            2005-04-16  2937  				     JFS_IP(ip)->next_index)) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2938  					if (!page_fixed && !isReadOnly(ip)) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2939  						fix_page = 1;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2940  						/*
^1da177e4c3f41 Linus Torvalds            2005-04-16  2941  						 * setting overflow and setting
^1da177e4c3f41 Linus Torvalds            2005-04-16  2942  						 * index to i will cause the
^1da177e4c3f41 Linus Torvalds            2005-04-16  2943  						 * same page to be processed
^1da177e4c3f41 Linus Torvalds            2005-04-16  2944  						 * again starting here
^1da177e4c3f41 Linus Torvalds            2005-04-16  2945  						 */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2946  						overflow = 1;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2947  						index = i;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2948  						break;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2949  					}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2950  					jfs_dirent->position = unique_pos++;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2951  				}
44512449c0ab36 Dave Kleikamp             2013-08-15  2952  				/*
44512449c0ab36 Dave Kleikamp             2013-08-15  2953  				 * We add 1 to the index because we may
44512449c0ab36 Dave Kleikamp             2013-08-15  2954  				 * use a value of 2 internally, and NFSv4
44512449c0ab36 Dave Kleikamp             2013-08-15  2955  				 * doesn't like that.
44512449c0ab36 Dave Kleikamp             2013-08-15  2956  				 */
44512449c0ab36 Dave Kleikamp             2013-08-15  2957  				jfs_dirent->position++;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2958  			} else {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2959  				jfs_dirent->position = dtpos;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2960  				len = min(d_namleft, DTLHDRDATALEN_LEGACY);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2961  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2962  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2963  			/* copy the name of head/only segment */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2964  			outlen = jfs_strfromUCS_le(name_ptr, d->name, len,
^1da177e4c3f41 Linus Torvalds            2005-04-16  2965  						   codepage);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2966  			jfs_dirent->name_len = outlen;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2967  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2968  			/* copy name in the additional segment(s) */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2969  			next = d->next;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2970  			while (next >= 0) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2971  				t = (struct dtslot *) & p->slot[next];
^1da177e4c3f41 Linus Torvalds            2005-04-16  2972  				name_ptr += outlen;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2973  				d_namleft -= len;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2974  				/* Sanity Check */
^1da177e4c3f41 Linus Torvalds            2005-04-16  2975  				if (d_namleft == 0) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2976  					jfs_error(ip->i_sb,
eb8630d7d2fd13 Joe Perches               2013-06-04  2977  						  "JFS:Dtree error: ino = %ld, bn=%lld, index = %d\n",
^1da177e4c3f41 Linus Torvalds            2005-04-16  2978  						  (long)ip->i_ino,
^1da177e4c3f41 Linus Torvalds            2005-04-16  2979  						  (long long)bn,
^1da177e4c3f41 Linus Torvalds            2005-04-16  2980  						  i);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2981  					goto skip_one;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2982  				}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2983  				len = min(d_namleft, DTSLOTDATALEN);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2984  				outlen = jfs_strfromUCS_le(name_ptr, t->name,
^1da177e4c3f41 Linus Torvalds            2005-04-16  2985  							   len, codepage);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2986  				jfs_dirent->name_len += outlen;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2987  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2988  				next = t->next;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2989  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2990  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2991  			jfs_dirents++;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2992  			jfs_dirent = next_jfs_dirent(jfs_dirent);
^1da177e4c3f41 Linus Torvalds            2005-04-16  2993  skip_one:
^1da177e4c3f41 Linus Torvalds            2005-04-16  2994  			if (!do_index)
^1da177e4c3f41 Linus Torvalds            2005-04-16  2995  				dtoffset->index++;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2996  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  2997  
^1da177e4c3f41 Linus Torvalds            2005-04-16  2998  		if (!overflow) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  2999  			/* Point to next leaf page */
^1da177e4c3f41 Linus Torvalds            2005-04-16  3000  			if (p->header.flag & BT_ROOT)
^1da177e4c3f41 Linus Torvalds            2005-04-16  3001  				bn = 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  3002  			else {
^1da177e4c3f41 Linus Torvalds            2005-04-16  3003  				bn = le64_to_cpu(p->header.next);
^1da177e4c3f41 Linus Torvalds            2005-04-16  3004  				index = 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  3005  				/* update offset (pn:index) for new page */
^1da177e4c3f41 Linus Torvalds            2005-04-16  3006  				if (!do_index) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  3007  					dtoffset->pn++;
^1da177e4c3f41 Linus Torvalds            2005-04-16  3008  					dtoffset->index = 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  3009  				}
^1da177e4c3f41 Linus Torvalds            2005-04-16  3010  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  3011  			page_fixed = 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  3012  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  3013  
^1da177e4c3f41 Linus Torvalds            2005-04-16  3014  		/* unpin previous leaf page */
^1da177e4c3f41 Linus Torvalds            2005-04-16  3015  		DT_PUTPAGE(mp);
^1da177e4c3f41 Linus Torvalds            2005-04-16  3016  
33655e05e6fdc0 Mike Rapoport (Microsoft  2026-05-17  3017) 		jfs_dirent = dirent_buf;
^1da177e4c3f41 Linus Torvalds            2005-04-16  3018  		while (jfs_dirents--) {
070a0ebf42e15c Al Viro                   2013-05-17  3019  			ctx->pos = jfs_dirent->position;
070a0ebf42e15c Al Viro                   2013-05-17  3020  			if (!dir_emit(ctx, jfs_dirent->name,
070a0ebf42e15c Al Viro                   2013-05-17  3021  				    jfs_dirent->name_len,
^1da177e4c3f41 Linus Torvalds            2005-04-16  3022  				    jfs_dirent->ino, DT_UNKNOWN))
^1da177e4c3f41 Linus Torvalds            2005-04-16  3023  				goto out;
^1da177e4c3f41 Linus Torvalds            2005-04-16  3024  			jfs_dirent = next_jfs_dirent(jfs_dirent);
^1da177e4c3f41 Linus Torvalds            2005-04-16  3025  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  3026  
^1da177e4c3f41 Linus Torvalds            2005-04-16  3027  		if (fix_page) {
5dff41a8637756 Aditya Dutt               2025-04-01  3028  			if ((rc = add_missing_indices(ip, bn)))
5dff41a8637756 Aditya Dutt               2025-04-01  3029  				goto out;
^1da177e4c3f41 Linus Torvalds            2005-04-16  3030  			page_fixed = 1;
^1da177e4c3f41 Linus Torvalds            2005-04-16  3031  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  3032  
^1da177e4c3f41 Linus Torvalds            2005-04-16  3033  		if (!overflow && (bn == 0)) {
070a0ebf42e15c Al Viro                   2013-05-17  3034  			ctx->pos = DIREND;
^1da177e4c3f41 Linus Torvalds            2005-04-16  3035  			break;
^1da177e4c3f41 Linus Torvalds            2005-04-16  3036  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  3037  
^1da177e4c3f41 Linus Torvalds            2005-04-16  3038  		DT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
^1da177e4c3f41 Linus Torvalds            2005-04-16  3039  		if (rc) {
33655e05e6fdc0 Mike Rapoport (Microsoft  2026-05-17  3040) 			kfree(dirent_buf);
^1da177e4c3f41 Linus Torvalds            2005-04-16  3041  			return rc;
^1da177e4c3f41 Linus Torvalds            2005-04-16  3042  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  3043  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  3044  
^1da177e4c3f41 Linus Torvalds            2005-04-16  3045        out:
33655e05e6fdc0 Mike Rapoport (Microsoft  2026-05-17  3046) 	kfree(dirent_buf);
^1da177e4c3f41 Linus Torvalds            2005-04-16  3047  
^1da177e4c3f41 Linus Torvalds            2005-04-16  3048  	return rc;
^1da177e4c3f41 Linus Torvalds            2005-04-16  3049  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  3050  

:::::: The code at line 2888 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
