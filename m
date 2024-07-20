Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07181B86FF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 20:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721506733; cv=none; b=CTQnIYOmHprViOusVwLS4+lt07aPQE6NjwhWgb3PUv5olX79MXXii5FJZCPQPKMOa4cc1dsXS2LelJyGTZ+lsp+Vh3pgN6jvlLUeEqW7fPLPSv1X+G7IX5oBGuY1QTlYdX6z7eWu5fCcTIW8LouC6lNS7iiuWniIXGca3egUne4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721506733; c=relaxed/simple;
	bh=0J1A4jj4WqSIQGJtMQ27itoUrROiqal8EQUsyWSc6U4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qMG/Eeo0XsvWx98Rxrz2T7Yj9YEjCNttb0A6K1ka/bsQasKIyOdTuvKjY2zYvi/m1zFj5g5SPEckVZ/dhBlIFg6pUT6U5wcZlwGeya0IL1hm9XQ1330KCgXzxDsPmU3pw+LnzK03DCA2FG2/2CiUfOqD3lQe4766B9+5JGX38+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Suq+9kM/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Suq+9kM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721506730; x=1753042730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0J1A4jj4WqSIQGJtMQ27itoUrROiqal8EQUsyWSc6U4=;
  b=Suq+9kM/3np4s3mh77KtFpNVAhygTIkmOUI7kpQesDz8VhMsLbrwYTNt
   lfDCP5f7RkEoI1pVkl6qKYaZi+zsMlhS6A0INLpu+mUguntX0FqU1R+S2
   G4htZg8pc1HZrJA0hL+3j1RcqONhkoA+u+5D3h9gnzR9yO90URRQKpOHb
   zFKcy2i1KO5AIlCSxe0FlrZlgX+ovoEFPtxY4Cc0ttk0rPCfc+wtAGQFO
   CLHd7+eG70Yvnw4Q7TJOrPfQgkw5d4D7CdH8YYhrWWNxoGo6dns1Cy2XN
   FaR2eIJVzavAPiNrkhGzA2+LpkwjxORzf88MVAww1QaFeoGf+Ax4+aR/8
   A==;
X-CSE-ConnectionGUID: vCCodpDURo2tPYqkk450lA==
X-CSE-MsgGUID: D22IObHmQyu0Jd9O0LuX+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="18817671"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="18817671"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 13:18:49 -0700
X-CSE-ConnectionGUID: dm2lO0jbQsKd6UGGfCNYSg==
X-CSE-MsgGUID: YPpV0LNsTZWmzVZR7AdVCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="51344595"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jul 2024 13:18:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVGXW-000jby-2H;
	Sat, 20 Jul 2024 20:18:46 +0000
Date: Sun, 21 Jul 2024 04:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_pre_content 10/10] mm/filemap.c:3300:13: error:
 implicit declaration of function 'fsnotify_inode_has_content_watches'
Message-ID: <202407210400.0FDsLBFC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fan_pre_content
head:   cece9f2c54b579b2dee895863edf16cb3aa791a9
commit: cece9f2c54b579b2dee895863edf16cb3aa791a9 [10/10] fsnotify: generate pre-content permission event on page fault
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240721/202407210400.0FDsLBFC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407210400.0FDsLBFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407210400.0FDsLBFC-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/filemap.c: In function 'filemap_fault':
>> mm/filemap.c:3300:13: error: implicit declaration of function 'fsnotify_inode_has_content_watches' [-Wimplicit-function-declaration]
    3300 |             fsnotify_inode_has_content_watches(inode)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fsnotify_inode_has_content_watches +3300 mm/filemap.c

  3251	
  3252	/**
  3253	 * filemap_fault - read in file data for page fault handling
  3254	 * @vmf:	struct vm_fault containing details of the fault
  3255	 *
  3256	 * filemap_fault() is invoked via the vma operations vector for a
  3257	 * mapped memory region to read in file data during a page fault.
  3258	 *
  3259	 * The goto's are kind of ugly, but this streamlines the normal case of having
  3260	 * it in the page cache, and handles the special cases reasonably without
  3261	 * having a lot of duplicated code.
  3262	 *
  3263	 * vma->vm_mm->mmap_lock must be held on entry.
  3264	 *
  3265	 * If our return value has VM_FAULT_RETRY set, it's because the mmap_lock
  3266	 * may be dropped before doing I/O or by lock_folio_maybe_drop_mmap().
  3267	 *
  3268	 * If our return value does not have VM_FAULT_RETRY set, the mmap_lock
  3269	 * has not been released.
  3270	 *
  3271	 * We never return with VM_FAULT_RETRY and a bit from VM_FAULT_ERROR set.
  3272	 *
  3273	 * Return: bitwise-OR of %VM_FAULT_ codes.
  3274	 */
  3275	vm_fault_t filemap_fault(struct vm_fault *vmf)
  3276	{
  3277		int error;
  3278		struct file *file = vmf->vma->vm_file;
  3279		struct file *fpin = NULL;
  3280		struct address_space *mapping = file->f_mapping;
  3281		struct inode *inode = mapping->host;
  3282		pgoff_t max_idx, index = vmf->pgoff;
  3283		struct folio *folio;
  3284		vm_fault_t ret = 0;
  3285		bool mapping_locked = false;
  3286	
  3287		max_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
  3288		if (unlikely(index >= max_idx))
  3289			return VM_FAULT_SIGBUS;
  3290	
  3291		/*
  3292		 * If we have pre-content watchers then we need to generate events on
  3293		 * page fault so that we can populate any data before the fault.
  3294		 *
  3295		 * We only do this on the first pass through, otherwise the populating
  3296		 * application could potentially deadlock on the mmap lock if it tries
  3297		 * to populate it with mmap.
  3298		 */
  3299		if (fault_flag_allow_retry_first(vmf->flags) &&
> 3300		    fsnotify_inode_has_content_watches(inode)) {
  3301			int mask = (vmf->flags & FAULT_FLAG_WRITE) ? MAY_WRITE : MAY_READ;
  3302			loff_t pos = vmf->pgoff << PAGE_SHIFT;
  3303	
  3304			fpin = maybe_unlock_mmap_for_io(vmf, fpin);
  3305	
  3306			/*
  3307			 * We can only emit the event if we did actually release the
  3308			 * mmap lock.
  3309			 */
  3310			if (fpin) {
  3311				error = fsnotify_file_area_perm(fpin, mask, &pos,
  3312								PAGE_SIZE);
  3313				if (error) {
  3314					fput(fpin);
  3315					return VM_FAULT_ERROR;
  3316				}
  3317			}
  3318		}
  3319	
  3320		/*
  3321		 * Do we have something in the page cache already?
  3322		 */
  3323		folio = filemap_get_folio(mapping, index);
  3324		if (likely(!IS_ERR(folio))) {
  3325			/*
  3326			 * We found the page, so try async readahead before waiting for
  3327			 * the lock.
  3328			 */
  3329			if (!(vmf->flags & FAULT_FLAG_TRIED))
  3330				fpin = do_async_mmap_readahead(vmf, folio, fpin);
  3331			if (unlikely(!folio_test_uptodate(folio))) {
  3332				filemap_invalidate_lock_shared(mapping);
  3333				mapping_locked = true;
  3334			}
  3335		} else {
  3336			ret = filemap_fault_recheck_pte_none(vmf);
  3337			if (unlikely(ret))
  3338				return ret;
  3339	
  3340			/* No page in the page cache at all */
  3341			count_vm_event(PGMAJFAULT);
  3342			count_memcg_event_mm(vmf->vma->vm_mm, PGMAJFAULT);
  3343			ret = VM_FAULT_MAJOR;
  3344			fpin = do_sync_mmap_readahead(vmf, fpin);
  3345	retry_find:
  3346			/*
  3347			 * See comment in filemap_create_folio() why we need
  3348			 * invalidate_lock
  3349			 */
  3350			if (!mapping_locked) {
  3351				filemap_invalidate_lock_shared(mapping);
  3352				mapping_locked = true;
  3353			}
  3354			folio = __filemap_get_folio(mapping, index,
  3355						  FGP_CREAT|FGP_FOR_MMAP,
  3356						  vmf->gfp_mask);
  3357			if (IS_ERR(folio)) {
  3358				if (fpin)
  3359					goto out_retry;
  3360				filemap_invalidate_unlock_shared(mapping);
  3361				return VM_FAULT_OOM;
  3362			}
  3363		}
  3364	
  3365		if (!lock_folio_maybe_drop_mmap(vmf, folio, &fpin))
  3366			goto out_retry;
  3367	
  3368		/* Did it get truncated? */
  3369		if (unlikely(folio->mapping != mapping)) {
  3370			folio_unlock(folio);
  3371			folio_put(folio);
  3372			goto retry_find;
  3373		}
  3374		VM_BUG_ON_FOLIO(!folio_contains(folio, index), folio);
  3375	
  3376		/*
  3377		 * We have a locked folio in the page cache, now we need to check
  3378		 * that it's up-to-date. If not, it is going to be due to an error,
  3379		 * or because readahead was otherwise unable to retrieve it.
  3380		 */
  3381		if (unlikely(!folio_test_uptodate(folio))) {
  3382			/*
  3383			 * If the invalidate lock is not held, the folio was in cache
  3384			 * and uptodate and now it is not. Strange but possible since we
  3385			 * didn't hold the page lock all the time. Let's drop
  3386			 * everything, get the invalidate lock and try again.
  3387			 */
  3388			if (!mapping_locked) {
  3389				folio_unlock(folio);
  3390				folio_put(folio);
  3391				goto retry_find;
  3392			}
  3393	
  3394			/*
  3395			 * OK, the folio is really not uptodate. This can be because the
  3396			 * VMA has the VM_RAND_READ flag set, or because an error
  3397			 * arose. Let's read it in directly.
  3398			 */
  3399			goto page_not_uptodate;
  3400		}
  3401	
  3402		/*
  3403		 * We've made it this far and we had to drop our mmap_lock, now is the
  3404		 * time to return to the upper layer and have it re-find the vma and
  3405		 * redo the fault.
  3406		 */
  3407		if (fpin) {
  3408			folio_unlock(folio);
  3409			goto out_retry;
  3410		}
  3411		if (mapping_locked)
  3412			filemap_invalidate_unlock_shared(mapping);
  3413	
  3414		/*
  3415		 * Found the page and have a reference on it.
  3416		 * We must recheck i_size under page lock.
  3417		 */
  3418		max_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
  3419		if (unlikely(index >= max_idx)) {
  3420			folio_unlock(folio);
  3421			folio_put(folio);
  3422			return VM_FAULT_SIGBUS;
  3423		}
  3424	
  3425		vmf->page = folio_file_page(folio, index);
  3426		return ret | VM_FAULT_LOCKED;
  3427	
  3428	page_not_uptodate:
  3429		/*
  3430		 * Umm, take care of errors if the page isn't up-to-date.
  3431		 * Try to re-read it _once_. We do this synchronously,
  3432		 * because there really aren't any performance issues here
  3433		 * and we need to check for errors.
  3434		 */
  3435		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
  3436		error = filemap_read_folio(file, mapping->a_ops->read_folio, folio);
  3437		if (fpin)
  3438			goto out_retry;
  3439		folio_put(folio);
  3440	
  3441		if (!error || error == AOP_TRUNCATED_PAGE)
  3442			goto retry_find;
  3443		filemap_invalidate_unlock_shared(mapping);
  3444	
  3445		return VM_FAULT_SIGBUS;
  3446	
  3447	out_retry:
  3448		/*
  3449		 * We dropped the mmap_lock, we need to return to the fault handler to
  3450		 * re-find the vma and come back and find our hopefully still populated
  3451		 * page.
  3452		 */
  3453		if (!IS_ERR(folio))
  3454			folio_put(folio);
  3455		if (mapping_locked)
  3456			filemap_invalidate_unlock_shared(mapping);
  3457		if (fpin)
  3458			fput(fpin);
  3459		return ret | VM_FAULT_RETRY;
  3460	}
  3461	EXPORT_SYMBOL(filemap_fault);
  3462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
