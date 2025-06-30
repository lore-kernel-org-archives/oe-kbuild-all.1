Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89A5288C0E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 12:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284852; cv=none; b=LBy+VpJ+yMev8GuqibjIIF5pUBrAtKYIqdXkkv+XKS1qMsi+9+xTmGxm9XWMc8p/xRNwuZHLIuavuvHSxKGfn6jxl9zskTa3VNLL+c1Q0miykheKl5R6PH/MCMfaBKyyrPMJlCyq7fhIcRbLqTOeKu6A9yVLOrJ3xVbG5tzyJ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284852; c=relaxed/simple;
	bh=3UP6/zsnjMtPAeLt6dXjNe/FngS9HP1K+9JJqvKaSkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clczihxdxKBrVaoDToY/9P8WvJmVzuk4Hhf813Af8ebvtbyvlnz1iDZG8DXBob/FCKcDGjCiL7a1mZiC0h9+PMXy6A3bzZcmKMHEB2Ww+Cb9qfzW1GMcqsV3B6jTi1KeYdwzl3FqJDsiQ04UxE6kOr4CrZ/AthezO5cghmYrXnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOhSIOk+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOhSIOk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751284851; x=1782820851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3UP6/zsnjMtPAeLt6dXjNe/FngS9HP1K+9JJqvKaSkA=;
  b=cOhSIOk+/rdphbpD3JjjDvRNp06jTC8IqR4xz9gaoGhzq1FagFIH50+l
   880g+gFnn4Ts5jcOrMqDf0/JhwnfmZRt95OlVrJuegB/Igdprf+gGGOjT
   LHnW67PuHpuxBHG2qxhyqHC1FT5uk2IahIbQ/0dp+F1Ps9AP3USU+riml
   IDgZ3V2AOcpiIqzRxlXo8/bD3VjNSwszqpT8zIslObjFeFqU6lVT+vwV1
   /4nqv/JPB/jLl+OmADgraRaYyBOoWwN2uYppA3I5XHObufo6dsrXN6rQh
   Eq587HBOabFDD8r8R60eHsTMVzvKBcUQPn4e5O+lTzMeLn+scdGueYMBQ
   Q==;
X-CSE-ConnectionGUID: 7HYdgv8AQ3eT3M5G1LNe+Q==
X-CSE-MsgGUID: Cbd3sJHFSjefyVnvlVRdcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53600489"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53600489"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 05:00:50 -0700
X-CSE-ConnectionGUID: gxQU/eWrSY6kiHPjHzaXfQ==
X-CSE-MsgGUID: avHILRMkRTWpTbGBToP/UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="152827636"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Jun 2025 05:00:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWDBl-000YwY-29;
	Mon, 30 Jun 2025 12:00:45 +0000
Date: Mon, 30 Jun 2025 19:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
	Christian Koenig <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Chinner <david@fromorbit.com>,
	Kairui Song <kasong@tencent.com>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 13/17] ttm/pool: enable memcg tracking and shrinker.
Message-ID: <202506301921.i2QYb2bo-lkp@intel.com>
References: <20250630045005.1337339-14-airlied@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630045005.1337339-14-airlied@gmail.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[cannot apply to akpm-mm/mm-everything linus/master v6.16-rc4 next-20250630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/drm-ttm-use-gpu-mm-stats-to-track-gpu-memory-allocations-v2/20250630-134938
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250630045005.1337339-14-airlied%40gmail.com
patch subject: [PATCH 13/17] ttm/pool: enable memcg tracking and shrinker.
config: riscv-randconfig-001-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301921.i2QYb2bo-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301921.i2QYb2bo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301921.i2QYb2bo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/ttm_pool.c: In function 'ttm_pool_restore_commit':
>> drivers/gpu/drm/ttm/ttm_pool.c:675:5: error: 'struct page' has no member named 'memcg_data'
       p->memcg_data = 0;
        ^~
   drivers/gpu/drm/ttm/ttm_pool.c: In function 'ttm_pool_backup':
   drivers/gpu/drm/ttm/ttm_pool.c:1142:9: error: 'struct page' has no member named 'memcg_data'
        page->memcg_data = 0;
            ^~


vim +675 drivers/gpu/drm/ttm/ttm_pool.c

   627	
   628	/*
   629	 * When restoring, restore backed-up content to the newly allocated page and
   630	 * if successful, populate the page-table and dma-address arrays.
   631	 */
   632	static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
   633					   struct file *backup,
   634					   const struct ttm_operation_ctx *ctx,
   635					   struct ttm_pool_alloc_state *alloc)
   636	
   637	{
   638		pgoff_t i, nr = 1UL << restore->order;
   639		struct page **first_page = alloc->pages;
   640		struct page *p;
   641		int ret = 0;
   642	
   643		for (i = restore->restored_pages; i < nr; ++i) {
   644			p = first_page[i];
   645			if (ttm_backup_page_ptr_is_handle(p)) {
   646				unsigned long handle = ttm_backup_page_ptr_to_handle(p);
   647	
   648				if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
   649				    should_fail(&backup_fault_inject, 1)) {
   650					ret = -EINTR;
   651					break;
   652				}
   653	
   654				if (handle == 0) {
   655					restore->restored_pages++;
   656					continue;
   657				}
   658	
   659				ret = ttm_backup_copy_page(backup, restore->alloced_page + i,
   660							   handle, ctx->interruptible);
   661				if (ret)
   662					break;
   663	
   664				ttm_backup_drop(backup, handle);
   665			} else if (p) {
   666				/*
   667				 * We could probably avoid splitting the old page
   668				 * using clever logic, but ATM we don't care, as
   669				 * we prioritize releasing memory ASAP. Note that
   670				 * here, the old retained page is always write-back
   671				 * cached.
   672				 */
   673				ttm_pool_split_for_swap(restore->pool, p);
   674				copy_highpage(restore->alloced_page + i, p);
 > 675				p->memcg_data = 0;
   676				__free_pages(p, 0);
   677			}
   678	
   679			restore->restored_pages++;
   680			first_page[i] = ttm_backup_handle_to_page_ptr(0);
   681		}
   682	
   683		if (ret) {
   684			if (!restore->restored_pages) {
   685				dma_addr_t *dma_addr = alloc->dma_addr ? &restore->first_dma : NULL;
   686	
   687				ttm_pool_unmap_and_free(restore->pool, restore->alloced_page,
   688							dma_addr, restore->page_caching);
   689				restore->restored_pages = nr;
   690			}
   691			return ret;
   692		}
   693	
   694		ttm_pool_allocated_page_commit(restore->alloced_page, restore->first_dma,
   695					       alloc, nr);
   696		if (restore->page_caching == alloc->tt_caching || PageHighMem(restore->alloced_page))
   697			alloc->caching_divide = alloc->pages;
   698		restore->snapshot_alloc = *alloc;
   699		restore->alloced_pages += nr;
   700	
   701		return 0;
   702	}
   703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
