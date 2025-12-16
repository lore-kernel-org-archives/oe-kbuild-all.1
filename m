Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F70325730
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 06:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866751; cv=none; b=KFMXLctZU7iGrdKQhs8GYtvoSMwyBXr8yDiYWNHQoM8KC8tY6+32i15YzZ1YCgXpUfcnWPywxSLJnlyFGAddy32FSS7bqX3SQabQzEFW5Ri2bxkHgytinS0mPDGmJoOsO1eduZpin7Cxj30zkNzA1Q6RgP0hT843Sd1Oq5HCuD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866751; c=relaxed/simple;
	bh=41hSA9HpMsIzdIckY90sjd3DOo0V1D5T4P42DTAsRao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khRAzq/rJpsYIM31LMrvt/k7i1mFFEwSbqIvz/SgWSTM0AF6tOmlicVq5MsXxsNJHkqhJgoYFncB0HcwpQb2DbwFkm3JmIPwqPRKa0vxfzlJ83dbCCXpxrc4gj8YlRfJFi2YjQHhyunFcLUoV8AhWljZtaX0lywdAz3niLxI3t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRwJzeV7; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRwJzeV7"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-349ff18445aso3472579a91.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 22:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765866740; x=1766471540; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGRzWPEKfvmJEejOwoCNNsiv9yu7sGL4JB/S9GrfrcE=;
        b=MRwJzeV7KEpcbFcXU9CeGj47HwcquQ+nZMVAZnSPQWkphRxj/43vaTZaVVnqjFo5Qj
         aNHe2FGEb7gTiCgwtGcrfqkNdtaw6wFOLFg1H6alsB7J722IwduNJlObK0oCeYiOD+Op
         dOZffUHw8ii0WwSBO2aLUlYfELM95Uvz860pSWqgNLQsyn6ZlW1ogQ9XpzQPW33Ar/yQ
         eGLCyZCjL4yl16ZC1VpvQbYSDpdBnKs3FuYZ4nXGB/kTKN8oOdn1g9JokkYPylJ/qo13
         Mp+8dePosDt7FD/IE79wGJyV7lg+2DO1Tww/0QFN4krTTleUtrDrVnNaQvLIQWVTdBS0
         pvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765866740; x=1766471540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGRzWPEKfvmJEejOwoCNNsiv9yu7sGL4JB/S9GrfrcE=;
        b=u0tu4JAFd4Vy9JMypbjDZ2sipaOtUaKgYuQonx21tLjxU3NwqL0qeientFm3Hkeule
         B7qiFRwoNhaVRp6orqP2G1YPFfA5h2Y81UP7kXH8qEneC+BADT6zugf/8aE7uXmn2DFn
         JhwI1PIDlglbPMBrmkHrqbKIU+dU+nHQUdMSvoPUi0RLNXwsNWS4whsvwzT+uCfGX2I1
         ZqKtgOUTUohIWo/gWxnGPk6OUxiTyadJW7Z+4P40+9vhkq5iUviZbCXfuwSY8RXBmPiD
         ihswnK6HK7fiueZmPI1ZJmgdyud2RaHVkTz+Qd4+QaNWpUbWziDswQ2v82LdU9/RazNU
         FTQg==
X-Forwarded-Encrypted: i=1; AJvYcCUfxSH/os/mCB3vS2Kg1CJAPVgyFy+LopuUoDgUpxCNaYOkQ1MQXnk7I6E9fKPu8ZEXV0bXLkCQvgk0boTX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1BDk1dZP6GOPBY9cD/v53amPapNY80hQSZT1cxT3J4GBT41ku
	63MENI/hDg59fh9VfE7AIz0FIlwvWhk+TxFHHTTkUYOTCMI7svQvCd/I
X-Gm-Gg: AY/fxX6i3CnN57tiW19gqleid1/WG1RT/6PRVlrqhclP1vtCMGUUWSEdLNQmHksAXt8
	fhb19so0Q9GBTVszfHAX8OZ+KYEogNrWb5LgYKFX4WkdRCLvNJ6cldQf97dxNxqq7VrTsL22NwB
	wUYFRy/XT7pttQ/MP18hix0RmBuH6Hs96MHCWWL8/5AN/UMlyPY+9RX019KZw+mRO7/mcRT/N25
	mMy0250UYQIBzIwwuQZj+bIZl5xksDXDO4J8Do7G6tHk1yD4O9dQZUCyszGowazfntxillvxJji
	P9ixjqiSB8p2PvuWQxvsjSoHz0gEMFDOCAZkry83qV2BHT8gj2gcnk8JVM/UhdS70vOx+neD8+D
	/aEAVFTFVuibztd56zG2xs8sUOK2rkYsbvFlZPUfluMQl7mhXpjQ0U0hBbNl6BGDuzf3Po/LXiB
	bP6BpA5YvhaEPvipaHJPR3RXPY
X-Google-Smtp-Source: AGHT+IH0RJh5kqJSJv790DptQ94gJw8dQltu7R6cFNQxP50wNZy+EDL8VlxiC3V8XcLubLzCcwnbYA==
X-Received: by 2002:a17:90b:3ec7:b0:34c:97ea:e4d with SMTP id 98e67ed59e1d1-34c97ea1008mr5248729a91.28.1765866739668;
        Mon, 15 Dec 2025 22:32:19 -0800 (PST)
Received: from localhost.localdomain ([114.231.217.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe3a27b5sm10739839a91.1.2025.12.15.22.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:32:19 -0800 (PST)
Date: Tue, 16 Dec 2025 14:32:12 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, david@kernel.org, 
	lorenzo.stoakes@oracle.com, oe-kbuild-all@lists.linux.dev, ziy@nvidia.com, baohua@kernel.org, 
	lance.yang@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Vernon Yang <yanglincheng@kylinos.cn>
Subject: Re: [PATCH 2/4] mm: khugepaged: remove mm when all memory has been
 collapsed
Message-ID: <k4eiyf5cxqpv24n6l4v44zskxpgkmxpdmx7aunqna6c43iwvvo@hwxvwyvj73rb>
References: <20251215090419.174418-3-yanglincheng@kylinos.cn>
 <202512160619.3Ut4sxaJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512160619.3Ut4sxaJ-lkp@intel.com>

On Tue, Dec 16, 2025 at 07:01:18AM +0800, kernel test robot wrote:
> Hi Vernon,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on linus/master v6.19-rc1 next-20251215]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/mm-khugepaged-add-trace_mm_khugepaged_scan-event/20251215-171046
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20251215090419.174418-3-yanglincheng%40kylinos.cn
> patch subject: [PATCH 2/4] mm: khugepaged: remove mm when all memory has been collapsed
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251216/202512160619.3Ut4sxaJ-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160619.3Ut4sxaJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512160619.3Ut4sxaJ-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    mm/khugepaged.c: In function 'khugepaged_scan_mm_slot':
> >> mm/khugepaged.c:2490:30: error: 'SCAN_PMD_NULL' undeclared (first use in this function); did you mean 'SCAN_VMA_NULL'?
>     2490 |                         case SCAN_PMD_NULL:
>          |                              ^~~~~~~~~~~~~
>          |                              SCAN_VMA_NULL
>    mm/khugepaged.c:2490:30: note: each undeclared identifier is reported only once for each function it appears in
> >> mm/khugepaged.c:2491:30: error: 'SCAN_PMD_NONE' undeclared (first use in this function)
>     2491 |                         case SCAN_PMD_NONE:
>          |                              ^~~~~~~~~~~~~

same above, Thanks.

>
> vim +2490 mm/khugepaged.c
>
>   2392
>   2393	static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
>   2394						    struct collapse_control *cc)
>   2395		__releases(&khugepaged_mm_lock)
>   2396		__acquires(&khugepaged_mm_lock)
>   2397	{
>   2398		struct vma_iterator vmi;
>   2399		struct mm_slot *slot;
>   2400		struct mm_struct *mm;
>   2401		struct vm_area_struct *vma;
>   2402		int progress = 0;
>   2403
>   2404		VM_BUG_ON(!pages);
>   2405		lockdep_assert_held(&khugepaged_mm_lock);
>   2406		*result = SCAN_FAIL;
>   2407
>   2408		if (khugepaged_scan.mm_slot) {
>   2409			slot = khugepaged_scan.mm_slot;
>   2410		} else {
>   2411			slot = list_first_entry(&khugepaged_scan.mm_head,
>   2412					     struct mm_slot, mm_node);
>   2413			khugepaged_scan.address = 0;
>   2414			khugepaged_scan.mm_slot = slot;
>   2415			khugepaged_scan.maybe_collapse = false;
>   2416		}
>   2417		spin_unlock(&khugepaged_mm_lock);
>   2418
>   2419		mm = slot->mm;
>   2420		/*
>   2421		 * Don't wait for semaphore (to avoid long wait times).  Just move to
>   2422		 * the next mm on the list.
>   2423		 */
>   2424		vma = NULL;
>   2425		if (unlikely(!mmap_read_trylock(mm)))
>   2426			goto breakouterloop_mmap_lock;
>   2427
>   2428		progress++;
>   2429		if (unlikely(hpage_collapse_test_exit_or_disable(mm)))
>   2430			goto breakouterloop;
>   2431
>   2432		vma_iter_init(&vmi, mm, khugepaged_scan.address);
>   2433		for_each_vma(vmi, vma) {
>   2434			unsigned long hstart, hend;
>   2435
>   2436			cond_resched();
>   2437			if (unlikely(hpage_collapse_test_exit_or_disable(mm))) {
>   2438				progress++;
>   2439				break;
>   2440			}
>   2441			if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_KHUGEPAGED, PMD_ORDER)) {
>   2442	skip:
>   2443				progress++;
>   2444				continue;
>   2445			}
>   2446			hstart = round_up(vma->vm_start, HPAGE_PMD_SIZE);
>   2447			hend = round_down(vma->vm_end, HPAGE_PMD_SIZE);
>   2448			if (khugepaged_scan.address > hend)
>   2449				goto skip;
>   2450			if (khugepaged_scan.address < hstart)
>   2451				khugepaged_scan.address = hstart;
>   2452			VM_BUG_ON(khugepaged_scan.address & ~HPAGE_PMD_MASK);
>   2453
>   2454			while (khugepaged_scan.address < hend) {
>   2455				bool mmap_locked = true;
>   2456
>   2457				cond_resched();
>   2458				if (unlikely(hpage_collapse_test_exit_or_disable(mm)))
>   2459					goto breakouterloop;
>   2460
>   2461				VM_BUG_ON(khugepaged_scan.address < hstart ||
>   2462					  khugepaged_scan.address + HPAGE_PMD_SIZE >
>   2463					  hend);
>   2464				if (!vma_is_anonymous(vma)) {
>   2465					struct file *file = get_file(vma->vm_file);
>   2466					pgoff_t pgoff = linear_page_index(vma,
>   2467							khugepaged_scan.address);
>   2468
>   2469					mmap_read_unlock(mm);
>   2470					mmap_locked = false;
>   2471					*result = hpage_collapse_scan_file(mm,
>   2472						khugepaged_scan.address, file, pgoff, cc);
>   2473					fput(file);
>   2474					if (*result == SCAN_PTE_MAPPED_HUGEPAGE) {
>   2475						mmap_read_lock(mm);
>   2476						if (hpage_collapse_test_exit_or_disable(mm))
>   2477							goto breakouterloop;
>   2478						*result = collapse_pte_mapped_thp(mm,
>   2479							khugepaged_scan.address, false);
>   2480						if (*result == SCAN_PMD_MAPPED)
>   2481							*result = SCAN_SUCCEED;
>   2482						mmap_read_unlock(mm);
>   2483					}
>   2484				} else {
>   2485					*result = hpage_collapse_scan_pmd(mm, vma,
>   2486						khugepaged_scan.address, &mmap_locked, cc);
>   2487				}
>   2488
>   2489				switch (*result) {
> > 2490				case SCAN_PMD_NULL:
> > 2491				case SCAN_PMD_NONE:
>   2492				case SCAN_PMD_MAPPED:
>   2493				case SCAN_PTE_MAPPED_HUGEPAGE:
>   2494					break;
>   2495				case SCAN_SUCCEED:
>   2496					++khugepaged_pages_collapsed;
>   2497					fallthrough;
>   2498				default:
>   2499					khugepaged_scan.maybe_collapse = true;
>   2500				}
>   2501
>   2502				/* move to next address */
>   2503				khugepaged_scan.address += HPAGE_PMD_SIZE;
>   2504				progress += HPAGE_PMD_NR;
>   2505				if (!mmap_locked)
>   2506					/*
>   2507					 * We released mmap_lock so break loop.  Note
>   2508					 * that we drop mmap_lock before all hugepage
>   2509					 * allocations, so if allocation fails, we are
>   2510					 * guaranteed to break here and report the
>   2511					 * correct result back to caller.
>   2512					 */
>   2513					goto breakouterloop_mmap_lock;
>   2514				if (progress >= pages)
>   2515					goto breakouterloop;
>   2516			}
>   2517		}
>   2518	breakouterloop:
>   2519		mmap_read_unlock(mm); /* exit_mmap will destroy ptes after this */
>   2520	breakouterloop_mmap_lock:
>   2521
>   2522		spin_lock(&khugepaged_mm_lock);
>   2523		VM_BUG_ON(khugepaged_scan.mm_slot != slot);
>   2524		/*
>   2525		 * Release the current mm_slot if this mm is about to die, or
>   2526		 * if we scanned all vmas of this mm.
>   2527		 */
>   2528		if (hpage_collapse_test_exit(mm) || !vma) {
>   2529			bool maybe_collapse = khugepaged_scan.maybe_collapse;
>   2530
>   2531			if (mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm))
>   2532				maybe_collapse = true;
>   2533
>   2534			/*
>   2535			 * Make sure that if mm_users is reaching zero while
>   2536			 * khugepaged runs here, khugepaged_exit will find
>   2537			 * mm_slot not pointing to the exiting mm.
>   2538			 */
>   2539			if (!list_is_last(&slot->mm_node, &khugepaged_scan.mm_head)) {
>   2540				khugepaged_scan.mm_slot = list_next_entry(slot, mm_node);
>   2541				khugepaged_scan.address = 0;
>   2542				khugepaged_scan.maybe_collapse = false;
>   2543			} else {
>   2544				khugepaged_scan.mm_slot = NULL;
>   2545				khugepaged_full_scans++;
>   2546			}
>   2547
>   2548			collect_mm_slot(slot, maybe_collapse);
>   2549		}
>   2550
>   2551		trace_mm_khugepaged_scan(mm, progress, khugepaged_scan.mm_slot == NULL);
>   2552
>   2553		return progress;
>   2554	}
>   2555
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--
Thanks,
Vernon
