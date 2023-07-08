Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F05B7E2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 02:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688785041; x=1720321041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0tmXfmrHvHpbdDTCFiyIOWE3y1wvMx8obmWN9//PH6I=;
  b=dcw0ZN6g9inR0aGSlj0BKTJPENapZeRptOPKYy6ma20/KkaUicshB4PP
   T0vAgkRJ8qoDnY03Mb+F5sGeQH4Dwj4n9laMkMpMJ/LXU0djo/vrVwpJT
   CWW4RReC8tSxNcwp2XeR3c7C87p962TeQLZkO+XhbM2mtnCzEF14tMcea
   n5ntZq2f6ty77z09+B1kmuB8oKXZ6AHS1fEGRqt9tMYcPeORdbhB8xsfa
   25izFF1g3G2g+BvXdmG0+zowf1e/IlwtoDT+sME/yHpm/9DYkjJ1O4QoU
   0Fy+oyjrjRjq29zFVGsFNlxbLEGCkLNh1OyDBs8c5C/OjjYt85f/E64TJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="361493176"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="361493176"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 19:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="670348580"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="670348580"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Jul 2023 19:57:19 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHy8M-0002W6-1D;
	Sat, 08 Jul 2023 02:57:18 +0000
Date: Sat, 8 Jul 2023 10:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 9/38] mm/filemap.c:2709: undefined
 reference to `flush_dcache_folio'
Message-ID: <202307081040.pxdFGWsP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   72c34bd0b2a432506d992bdc1e3a89260461667d
commit: 440dacbb8de713a54c1f2c71e070576dee31424e [9/38] arm: Implement the new page table range API
config: arm-randconfig-r061-20230704 (https://download.01.org/0day-ci/archive/20230708/202307081040.pxdFGWsP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307081040.pxdFGWsP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307081040.pxdFGWsP-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: mm/filemap.o: in function `filemap_read':
>> mm/filemap.c:2709: undefined reference to `flush_dcache_folio'
   arm-linux-gnueabi-ld: mm/filemap.o: in function `filemap_splice_read':
   mm/filemap.c:2964: undefined reference to `flush_dcache_folio'
   arm-linux-gnueabi-ld: fs/libfs.o: in function `simple_read_folio':
>> fs/libfs.c:789: undefined reference to `flush_dcache_folio'
   arm-linux-gnueabi-ld: fs/remap_range.o: in function `vfs_dedupe_file_range_compare':
>> fs/remap_range.c:234: undefined reference to `flush_dcache_folio'
>> arm-linux-gnueabi-ld: fs/remap_range.c:235: undefined reference to `flush_dcache_folio'
   arm-linux-gnueabi-ld: fs/netfs/buffered_read.o:fs/netfs/buffered_read.c:84: more undefined references to `flush_dcache_folio' follow


vim +2709 mm/filemap.c

5ccc944dce3df5 Matthew Wilcox (Oracle  2022-06-10  2611) 
723ef24b9b379e Kent Overstreet         2020-12-14  2612  /**
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2613   * filemap_read - Read data from the page cache.
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2614   * @iocb: The iocb to read.
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2615   * @iter: Destination for the data.
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2616   * @already_read: Number of bytes already read by the caller.
723ef24b9b379e Kent Overstreet         2020-12-14  2617   *
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2618   * Copies data from the page cache.  If the data is not currently present,
7e0a126519b826 Matthew Wilcox (Oracle  2022-04-29  2619)  * uses the readahead and read_folio address_space operations to fetch it.
723ef24b9b379e Kent Overstreet         2020-12-14  2620   *
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2621   * Return: Total number of bytes copied, including those already read by
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2622   * the caller.  If an error happens before any bytes are copied, returns
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2623   * a negative error number.
723ef24b9b379e Kent Overstreet         2020-12-14  2624   */
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2625  ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2626  		ssize_t already_read)
723ef24b9b379e Kent Overstreet         2020-12-14  2627  {
723ef24b9b379e Kent Overstreet         2020-12-14  2628  	struct file *filp = iocb->ki_filp;
06c0444290cecf Kent Overstreet         2020-12-14  2629  	struct file_ra_state *ra = &filp->f_ra;
723ef24b9b379e Kent Overstreet         2020-12-14  2630  	struct address_space *mapping = filp->f_mapping;
723ef24b9b379e Kent Overstreet         2020-12-14  2631  	struct inode *inode = mapping->host;
25d6a23e8d2808 Matthew Wilcox (Oracle  2021-12-06  2632) 	struct folio_batch fbatch;
ff993ba130009b Matthew Wilcox (Oracle  2021-02-24  2633) 	int i, error = 0;
06c0444290cecf Kent Overstreet         2020-12-14  2634  	bool writably_mapped;
06c0444290cecf Kent Overstreet         2020-12-14  2635  	loff_t isize, end_offset;
881a8706c13e41 Haibo Li                2023-06-28  2636  	loff_t last_pos = ra->prev_pos;
723ef24b9b379e Kent Overstreet         2020-12-14  2637  
723ef24b9b379e Kent Overstreet         2020-12-14  2638  	if (unlikely(iocb->ki_pos >= inode->i_sb->s_maxbytes))
723ef24b9b379e Kent Overstreet         2020-12-14  2639  		return 0;
3644e2d2dda78e Kent Overstreet         2020-12-18  2640  	if (unlikely(!iov_iter_count(iter)))
3644e2d2dda78e Kent Overstreet         2020-12-18  2641  		return 0;
3644e2d2dda78e Kent Overstreet         2020-12-18  2642  
723ef24b9b379e Kent Overstreet         2020-12-14  2643  	iov_iter_truncate(iter, inode->i_sb->s_maxbytes);
25d6a23e8d2808 Matthew Wilcox (Oracle  2021-12-06  2644) 	folio_batch_init(&fbatch);
723ef24b9b379e Kent Overstreet         2020-12-14  2645  
06c0444290cecf Kent Overstreet         2020-12-14  2646  	do {
06c0444290cecf Kent Overstreet         2020-12-14  2647  		cond_resched();
723ef24b9b379e Kent Overstreet         2020-12-14  2648  
^1da177e4c3f41 Linus Torvalds          2005-04-16  2649  		/*
723ef24b9b379e Kent Overstreet         2020-12-14  2650  		 * If we've already successfully copied some data, then we
723ef24b9b379e Kent Overstreet         2020-12-14  2651  		 * can no longer safely return -EIOCBQUEUED. Hence mark
723ef24b9b379e Kent Overstreet         2020-12-14  2652  		 * an async read NOWAIT at that point.
^1da177e4c3f41 Linus Torvalds          2005-04-16  2653  		 */
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2654  		if ((iocb->ki_flags & IOCB_WAITQ) && already_read)
723ef24b9b379e Kent Overstreet         2020-12-14  2655  			iocb->ki_flags |= IOCB_NOWAIT;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2656  
8c8387ee3f55a3 David Howells           2021-11-05  2657  		if (unlikely(iocb->ki_pos >= i_size_read(inode)))
8c8387ee3f55a3 David Howells           2021-11-05  2658  			break;
8c8387ee3f55a3 David Howells           2021-11-05  2659  
3fc40265ae2b48 David Howells           2023-05-22  2660  		error = filemap_get_pages(iocb, iter->count, &fbatch, false);
ff993ba130009b Matthew Wilcox (Oracle  2021-02-24  2661) 		if (error < 0)
06c0444290cecf Kent Overstreet         2020-12-14  2662  			break;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2663  
^1da177e4c3f41 Linus Torvalds          2005-04-16  2664  		/*
06c0444290cecf Kent Overstreet         2020-12-14  2665  		 * i_size must be checked after we know the pages are Uptodate.
06c0444290cecf Kent Overstreet         2020-12-14  2666  		 *
06c0444290cecf Kent Overstreet         2020-12-14  2667  		 * Checking i_size after the check allows us to calculate
06c0444290cecf Kent Overstreet         2020-12-14  2668  		 * the correct value for "nr", which means the zero-filled
06c0444290cecf Kent Overstreet         2020-12-14  2669  		 * part of the page is not copied back to userspace (unless
06c0444290cecf Kent Overstreet         2020-12-14  2670  		 * another truncate extends the file - this is desired though).
^1da177e4c3f41 Linus Torvalds          2005-04-16  2671  		 */
06c0444290cecf Kent Overstreet         2020-12-14  2672  		isize = i_size_read(inode);
06c0444290cecf Kent Overstreet         2020-12-14  2673  		if (unlikely(iocb->ki_pos >= isize))
25d6a23e8d2808 Matthew Wilcox (Oracle  2021-12-06  2674) 			goto put_folios;
06c0444290cecf Kent Overstreet         2020-12-14  2675  		end_offset = min_t(loff_t, isize, iocb->ki_pos + iter->count);
723ef24b9b379e Kent Overstreet         2020-12-14  2676  
06c0444290cecf Kent Overstreet         2020-12-14  2677  		/*
06c0444290cecf Kent Overstreet         2020-12-14  2678  		 * Once we start copying data, we don't want to be touching any
06c0444290cecf Kent Overstreet         2020-12-14  2679  		 * cachelines that might be contended:
06c0444290cecf Kent Overstreet         2020-12-14  2680  		 */
06c0444290cecf Kent Overstreet         2020-12-14  2681  		writably_mapped = mapping_writably_mapped(mapping);
06c0444290cecf Kent Overstreet         2020-12-14  2682  
06c0444290cecf Kent Overstreet         2020-12-14  2683  		/*
5ccc944dce3df5 Matthew Wilcox (Oracle  2022-06-10  2684) 		 * When a read accesses the same folio several times, only
06c0444290cecf Kent Overstreet         2020-12-14  2685  		 * mark it as accessed the first time.
06c0444290cecf Kent Overstreet         2020-12-14  2686  		 */
881a8706c13e41 Haibo Li                2023-06-28  2687  		if (!pos_same_folio(iocb->ki_pos, last_pos - 1,
5ccc944dce3df5 Matthew Wilcox (Oracle  2022-06-10  2688) 				    fbatch.folios[0]))
25d6a23e8d2808 Matthew Wilcox (Oracle  2021-12-06  2689) 			folio_mark_accessed(fbatch.folios[0]);
06c0444290cecf Kent Overstreet         2020-12-14  2690  
25d6a23e8d2808 Matthew Wilcox (Oracle  2021-12-06  2691) 		for (i = 0; i < folio_batch_count(&fbatch); i++) {
25d6a23e8d2808 Matthew Wilcox (Oracle  2021-12-06  2692) 			struct folio *folio = fbatch.folios[i];
d996fc7f615feb Matthew Wilcox (Oracle  2021-10-31  2693) 			size_t fsize = folio_size(folio);
d996fc7f615feb Matthew Wilcox (Oracle  2021-10-31  2694) 			size_t offset = iocb->ki_pos & (fsize - 1);
cbd59c48ae2bca Matthew Wilcox (Oracle  2021-02-24  2695) 			size_t bytes = min_t(loff_t, end_offset - iocb->ki_pos,
d996fc7f615feb Matthew Wilcox (Oracle  2021-10-31  2696) 					     fsize - offset);
cbd59c48ae2bca Matthew Wilcox (Oracle  2021-02-24  2697) 			size_t copied;
06c0444290cecf Kent Overstreet         2020-12-14  2698  
d996fc7f615feb Matthew Wilcox (Oracle  2021-10-31  2699) 			if (end_offset < folio_pos(folio))
cbd59c48ae2bca Matthew Wilcox (Oracle  2021-02-24  2700) 				break;
cbd59c48ae2bca Matthew Wilcox (Oracle  2021-02-24  2701) 			if (i > 0)
d996fc7f615feb Matthew Wilcox (Oracle  2021-10-31  2702) 				folio_mark_accessed(folio);
06c0444290cecf Kent Overstreet         2020-12-14  2703  			/*
d996fc7f615feb Matthew Wilcox (Oracle  2021-10-31  2704) 			 * If users can be writing to this folio using arbitrary
d996fc7f615feb Matthew Wilcox (Oracle  2021-10-31  2705) 			 * virtual addresses, take care of potential aliasing
d996fc7f615feb Matthew Wilcox (Oracle  2021-10-31  2706) 			 * before reading the folio on the kernel side.
06c0444290cecf Kent Overstreet         2020-12-14  2707  			 */
d996fc7f615feb Matthew Wilcox (Oracle  2021-10-31  2708) 			if (writably_mapped)
d996fc7f615feb Matthew Wilcox (Oracle  2021-10-31 @2709) 				flush_dcache_folio(folio);
cbd59c48ae2bca Matthew Wilcox (Oracle  2021-02-24  2710) 
d996fc7f615feb Matthew Wilcox (Oracle  2021-10-31  2711) 			copied = copy_folio_to_iter(folio, offset, bytes, iter);
06c0444290cecf Kent Overstreet         2020-12-14  2712  
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2713  			already_read += copied;
06c0444290cecf Kent Overstreet         2020-12-14  2714  			iocb->ki_pos += copied;
881a8706c13e41 Haibo Li                2023-06-28  2715  			last_pos = iocb->ki_pos;
06c0444290cecf Kent Overstreet         2020-12-14  2716  
06c0444290cecf Kent Overstreet         2020-12-14  2717  			if (copied < bytes) {
06c0444290cecf Kent Overstreet         2020-12-14  2718  				error = -EFAULT;
06c0444290cecf Kent Overstreet         2020-12-14  2719  				break;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2720  			}
^1da177e4c3f41 Linus Torvalds          2005-04-16  2721  		}
25d6a23e8d2808 Matthew Wilcox (Oracle  2021-12-06  2722) put_folios:
25d6a23e8d2808 Matthew Wilcox (Oracle  2021-12-06  2723) 		for (i = 0; i < folio_batch_count(&fbatch); i++)
25d6a23e8d2808 Matthew Wilcox (Oracle  2021-12-06  2724) 			folio_put(fbatch.folios[i]);
25d6a23e8d2808 Matthew Wilcox (Oracle  2021-12-06  2725) 		folio_batch_init(&fbatch);
06c0444290cecf Kent Overstreet         2020-12-14  2726  	} while (iov_iter_count(iter) && iocb->ki_pos < isize && !error);
^1da177e4c3f41 Linus Torvalds          2005-04-16  2727  
^1da177e4c3f41 Linus Torvalds          2005-04-16  2728  	file_accessed(filp);
881a8706c13e41 Haibo Li                2023-06-28  2729  	ra->prev_pos = last_pos;
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2730  	return already_read ? already_read : error;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2731  }
87fa0f3eb267ee Christoph Hellwig       2021-02-24  2732  EXPORT_SYMBOL_GPL(filemap_read);
^1da177e4c3f41 Linus Torvalds          2005-04-16  2733  

:::::: The code at line 2709 was first introduced by commit
:::::: d996fc7f615feb5986f67829e18a8d8400f41361 filemap: Convert filemap_read() to use a folio

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
