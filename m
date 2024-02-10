Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2F9566B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 11:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707564202; cv=none; b=HHRb+5us1JfCDQE/oEr3ouT0pPfZ7bXYHQbwbepu3rE7U2p3CjzLbUQQQlafCHl2U92QHH6RLL0zWsTV0orvv/sy8oRfIsRezDkMxp/Bd1x83i4Yuvrsjm29rAs6D9M5WFecpKp+XamSkQWkiRw0MRvdsH1I8NZ1V8rWoHxoWGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707564202; c=relaxed/simple;
	bh=gR7/QV9B+WL9Z4DcxePzsCx0zgUbsDxRTu22G+6qT9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goQAl0iOEn5Bg1hI6oyLnlZKVogXAZObVEzqPZVe54nRKcYWrQl2Q5LzPmSLQ0zAR3EdynaWdeJ2MtsBaRwJ0JIykLjubPpYmjlxqtqvB4HRYZRSauLSXa7cFfLvFoBepj0TNc0+O4AiiPjxa+1KULogGWEDGxr4nR830L7g9tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KumOfj0L; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KumOfj0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707564200; x=1739100200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gR7/QV9B+WL9Z4DcxePzsCx0zgUbsDxRTu22G+6qT9I=;
  b=KumOfj0LbH/0Yu5yQsCKEJQYO0Aqv/65+z7jVh1m5tnEm+sq9wCl3MVe
   ESj3RlKnEMvrZj+bCS49FqZLp+QpdQNgcGguCs03pqes2Y2l2THSShoNU
   jxi6XnPrd6pvkPXJBVniOdpBIHgKLeb4j7FF5frq6NpHlvMIcwLSNemjU
   /XJbLTYxMewNrzIeOvRnOI5pCiKFohBdj/I/8EBj6KSNIx37YsopxVE3U
   klzemU6Iz2IK8mU1frKt4dDx6KhJEeRlIRnRMGJGDd+nAxCSs/10PmJXI
   Z7W80gYRouI+8Lbtd3WYCviSQS1T5sJb53iVDR/I3NVxXc+zdBI2UkPZi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="5345801"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="5345801"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 03:23:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="825377385"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="825377385"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Feb 2024 03:23:17 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYlRz-0005bY-17;
	Sat, 10 Feb 2024 11:23:15 +0000
Date: Sat, 10 Feb 2024 19:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 7/9] shmem: check if a block is uptodate before
 splice into pipe
Message-ID: <202402101949.MN9XAQX3-lkp@intel.com>
References: <20240209142901.126894-8-da.gomez@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240209142901.126894-8-da.gomez@samsung.com>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on brauner-vfs/vfs.all linus/master v6.8-rc3 next-20240209]
[cannot apply to vfs-idmapping/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Gomez/splice-don-t-check-for-uptodate-if-partially-uptodate-is-impl/20240209-223226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240209142901.126894-8-da.gomez%40samsung.com
patch subject: [RFC PATCH 7/9] shmem: check if a block is uptodate before splice into pipe
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20240210/202402101949.MN9XAQX3-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101949.MN9XAQX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101949.MN9XAQX3-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: mm/shmem.o: in function `shmem_file_splice_read':
>> mm/shmem.c:3214:(.text+0x4790): undefined reference to `__moddi3'


vim +3214 mm/shmem.c

  3148	
  3149	static ssize_t shmem_file_splice_read(struct file *in, loff_t *ppos,
  3150					      struct pipe_inode_info *pipe,
  3151					      size_t len, unsigned int flags)
  3152	{
  3153		struct inode *inode = file_inode(in);
  3154		struct address_space *mapping = inode->i_mapping;
  3155		struct folio *folio = NULL;
  3156		size_t total_spliced = 0, used, npages, n, part;
  3157		loff_t isize;
  3158		int error = 0;
  3159	
  3160		/* Work out how much data we can actually add into the pipe */
  3161		used = pipe_occupancy(pipe->head, pipe->tail);
  3162		npages = max_t(ssize_t, pipe->max_usage - used, 0);
  3163		len = min_t(size_t, len, npages * PAGE_SIZE);
  3164	
  3165		do {
  3166			if (*ppos >= i_size_read(inode))
  3167				break;
  3168	
  3169			error = shmem_get_folio(inode, *ppos / PAGE_SIZE, &folio,
  3170						SGP_READ);
  3171			if (error) {
  3172				if (error == -EINVAL)
  3173					error = 0;
  3174				break;
  3175			}
  3176			if (folio) {
  3177				folio_unlock(folio);
  3178	
  3179				if (folio_test_hwpoison(folio) ||
  3180				    (folio_test_large(folio) &&
  3181				     folio_test_has_hwpoisoned(folio))) {
  3182					error = -EIO;
  3183					break;
  3184				}
  3185			}
  3186	
  3187			/*
  3188			 * i_size must be checked after we know the pages are Uptodate.
  3189			 *
  3190			 * Checking i_size after the check allows us to calculate
  3191			 * the correct value for "nr", which means the zero-filled
  3192			 * part of the page is not copied back to userspace (unless
  3193			 * another truncate extends the file - this is desired though).
  3194			 */
  3195			isize = i_size_read(inode);
  3196			if (unlikely(*ppos >= isize))
  3197				break;
  3198			part = min_t(loff_t, isize - *ppos, len);
  3199			if (folio && folio_test_large(folio) &&
  3200			    folio_test_private(folio)) {
  3201				unsigned long from = offset_in_folio(folio, *ppos);
  3202				unsigned int bfirst = from >> inode->i_blkbits;
  3203				unsigned int blast, blast_upd;
  3204	
  3205				len = min(folio_size(folio) - from, len);
  3206				blast = (from + len - 1) >> inode->i_blkbits;
  3207	
  3208				blast_upd = sfs_get_last_block_uptodate(folio, bfirst,
  3209									blast);
  3210				if (blast_upd <= blast) {
  3211					unsigned int bsize = 1 << inode->i_blkbits;
  3212					unsigned int blks = blast_upd - bfirst + 1;
  3213					unsigned int bbytes = blks << inode->i_blkbits;
> 3214					unsigned int boff = (*ppos % bsize);
  3215	
  3216					part = min_t(loff_t, bbytes - boff, len);
  3217				}
  3218			}
  3219	
  3220			if (folio && shmem_is_block_uptodate(
  3221					     folio, offset_in_folio(folio, *ppos) >>
  3222							    inode->i_blkbits)) {
  3223				/*
  3224				 * If users can be writing to this page using arbitrary
  3225				 * virtual addresses, take care about potential aliasing
  3226				 * before reading the page on the kernel side.
  3227				 */
  3228				if (mapping_writably_mapped(mapping))
  3229					flush_dcache_folio(folio);
  3230				folio_mark_accessed(folio);
  3231				/*
  3232				 * Ok, we have the page, and it's up-to-date, so we can
  3233				 * now splice it into the pipe.
  3234				 */
  3235				n = splice_folio_into_pipe(pipe, folio, *ppos, part);
  3236				folio_put(folio);
  3237				folio = NULL;
  3238			} else {
  3239				n = splice_zeropage_into_pipe(pipe, *ppos, part);
  3240			}
  3241	
  3242			if (!n)
  3243				break;
  3244			len -= n;
  3245			total_spliced += n;
  3246			*ppos += n;
  3247			in->f_ra.prev_pos = *ppos;
  3248			if (pipe_full(pipe->head, pipe->tail, pipe->max_usage))
  3249				break;
  3250	
  3251			cond_resched();
  3252		} while (len);
  3253	
  3254		if (folio)
  3255			folio_put(folio);
  3256	
  3257		file_accessed(in);
  3258		return total_spliced ? total_spliced : error;
  3259	}
  3260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
