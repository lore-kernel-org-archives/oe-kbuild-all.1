Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959B227735
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739724393; cv=none; b=hjJMpSHgqmjBkLf0AAPLbcnZU/wL9KX/lyyZUmoirPdiEKmbnCaGCMuBttZmejlBE57K1y4o0CWFGetIpjKVsQHx/jc8VL2y9FLfNRChnV8FPULIXHeIvTphBUGCd43hRvaK6gjW4/ML+x82w8Zdfhw9kTPbMJjbEf4mgJN63F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739724393; c=relaxed/simple;
	bh=Db7d5N3PgMZUwYkvG4kWVhgLaOPggoCU7xFnkQzMw9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u1/3+DHwJNa+ifVPaOPqN88YLquP0i2HSId43gTamip4gYFLk1JLy+OuAh69D0QsgkMOVlvsjViwv2kbi55D84VNBT3BToQIoXWUhR1vss0ZJuLVb63soZSna30nyxNWnS0/4pkrsvHwTJoUUuYySn1rK9sNO34oJIuwXe1GebE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bn6TPloW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bn6TPloW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739724391; x=1771260391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Db7d5N3PgMZUwYkvG4kWVhgLaOPggoCU7xFnkQzMw9g=;
  b=bn6TPloWYIbXBkYVbMbwydMnwB6dygU8aiQ4wK0sDRMQwDtNkM1J0FaZ
   du0ZdNIBs8w91iZz4t7AuFoLA6bjcfBv+p6Lk5pew+J7dCJYrtnYBszmi
   l4GP5KvSPB5FJwG1CaHE2Y//unY1s9NbdJAGlWhlX1ueV00EO/ValtT7H
   kHjfL8SFyfHVvOvIMDlcPbt+GFJ5HlO3FIhv7hyTL0Mp9FUgBkEuVLCVg
   AQG8gSqqcXb+lThoLpmGOVbECjLs620X+t3N/rViUzBquAIr/DhvTOzov
   ICp03L/f+t5lWgEdZ9zsUQcA44d0DEzlii3Hxq1jWRzXoOJYiwY+thdpA
   g==;
X-CSE-ConnectionGUID: MtPa5eecQyW+FuHwKiAlDA==
X-CSE-MsgGUID: DGjPsy3aTASoTGQ2pJzlXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51395574"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="51395574"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 08:46:31 -0800
X-CSE-ConnectionGUID: tF32tFINSym6Kn1U2xCc1Q==
X-CSE-MsgGUID: 7L7pSvaVTA2bbG9rQz7f7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="113794641"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Feb 2025 08:46:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjhmk-001C5D-34;
	Sun, 16 Feb 2025 16:46:26 +0000
Date: Mon, 17 Feb 2025 00:46:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <yunshenglin0825@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_bulk_alloc_opt 1/1] fs/xfs/xfs_buf.c:382:71:
 error: 'refill' undeclared
Message-ID: <202502170017.6yOcvqvM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_bulk_alloc_opt
head:   a4f123e5e9347f8f9302bcc6b0a05c8a5a9ff4b8
commit: a4f123e5e9347f8f9302bcc6b0a05c8a5a9ff4b8 [1/1] mm: alloc_pages_bulk: remove assumption of populating only NULL elements
config: x86_64-buildonly-randconfig-003-20250216 (https://download.01.org/0day-ci/archive/20250217/202502170017.6yOcvqvM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170017.6yOcvqvM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170017.6yOcvqvM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from arch/x86/include/asm/msr.h:15,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/uprobes.h:18,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from fs/xfs/xfs_linux.h:25,
                    from fs/xfs/xfs.h:26,
                    from fs/xfs/xfs_buf.c:6:
   fs/xfs/xfs_buf.c: In function 'xfs_buf_alloc_pages':
>> fs/xfs/xfs_buf.c:382:71: error: 'refill' undeclared (first use in this function)
     382 |                 alloc = alloc_pages_bulk(gfp_mask, bp->b_page_count - refill,
         |                                                                       ^~~~~~
   include/linux/alloc_tag.h:227:16: note: in definition of macro 'alloc_hooks_tag'
     227 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/gfp.h:216:49: note: in expansion of macro 'alloc_hooks'
     216 | #define __alloc_pages_bulk(...)                 alloc_hooks(alloc_pages_bulk_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/gfp.h:226:9: note: in expansion of macro '__alloc_pages_bulk'
     226 |         __alloc_pages_bulk(_gfp, numa_mem_id(), NULL, _nr_pages, _page_array)
         |         ^~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_buf.c:382:25: note: in expansion of macro 'alloc_pages_bulk'
     382 |                 alloc = alloc_pages_bulk(gfp_mask, bp->b_page_count - refill,
         |                         ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_buf.c:382:71: note: each undeclared identifier is reported only once for each function it appears in
     382 |                 alloc = alloc_pages_bulk(gfp_mask, bp->b_page_count - refill,
         |                                                                       ^~~~~~
   include/linux/alloc_tag.h:227:16: note: in definition of macro 'alloc_hooks_tag'
     227 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/gfp.h:216:49: note: in expansion of macro 'alloc_hooks'
     216 | #define __alloc_pages_bulk(...)                 alloc_hooks(alloc_pages_bulk_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/gfp.h:226:9: note: in expansion of macro '__alloc_pages_bulk'
     226 |         __alloc_pages_bulk(_gfp, numa_mem_id(), NULL, _nr_pages, _page_array)
         |         ^~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_buf.c:382:25: note: in expansion of macro 'alloc_pages_bulk'
     382 |                 alloc = alloc_pages_bulk(gfp_mask, bp->b_page_count - refill,
         |                         ^~~~~~~~~~~~~~~~


vim +/refill +382 fs/xfs/xfs_buf.c

   346	
   347	static int
   348	xfs_buf_alloc_pages(
   349		struct xfs_buf	*bp,
   350		xfs_buf_flags_t	flags)
   351	{
   352		gfp_t		gfp_mask = GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_NOWARN;
   353		long		filled = 0;
   354	
   355		if (flags & XBF_READ_AHEAD)
   356			gfp_mask |= __GFP_NORETRY;
   357	
   358		/* Make sure that we have a page list */
   359		bp->b_page_count = DIV_ROUND_UP(BBTOB(bp->b_length), PAGE_SIZE);
   360		if (bp->b_page_count <= XB_PAGES) {
   361			bp->b_pages = bp->b_page_array;
   362		} else {
   363			bp->b_pages = kzalloc(sizeof(struct page *) * bp->b_page_count,
   364						gfp_mask);
   365			if (!bp->b_pages)
   366				return -ENOMEM;
   367		}
   368		bp->b_flags |= _XBF_PAGES;
   369	
   370		/* Assure zeroed buffer for non-read cases. */
   371		if (!(flags & XBF_READ))
   372			gfp_mask |= __GFP_ZERO;
   373	
   374		/*
   375		 * Bulk filling of pages can take multiple calls. Not filling the entire
   376		 * array is not an allocation failure, so don't back off if we get at
   377		 * least one extra page.
   378		 */
   379		for (;;) {
   380			long	alloc;
   381	
 > 382			alloc = alloc_pages_bulk(gfp_mask, bp->b_page_count - refill,
   383						 bp->b_pages + refill);
   384			refill += alloc;
   385			if (filled == bp->b_page_count) {
   386				XFS_STATS_INC(bp->b_mount, xb_page_found);
   387				break;
   388			}
   389	
   390			if (alloc)
   391				continue;
   392	
   393			if (flags & XBF_READ_AHEAD) {
   394				xfs_buf_free_pages(bp);
   395				return -ENOMEM;
   396			}
   397	
   398			XFS_STATS_INC(bp->b_mount, xb_page_retries);
   399			memalloc_retry_wait(gfp_mask);
   400		}
   401		return 0;
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
