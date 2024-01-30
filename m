Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98626BB51
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 13:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706620460; cv=none; b=qQ7Npy1Jwd7AscOzAjJbs0qKCr6SrMVQPNgcLRdFfk/3NX9sgkhqfJvGtG/HWICHjwncRBE9Ef8Skxicf7Hlz83j249Xrg7/zod9C4tix8Wqwf3yyvfTDBFi7ibCLty7oJkWV3ChwsL0GqpgpSnwzaHAotzH18bIlnN/3qHXqPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706620460; c=relaxed/simple;
	bh=6fcGMqKUIKBgg6HnsEwmsCThHEyUGKj7tQsDuM2eiPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ar3Fb8mECJcUiMi9FROpsVVGJ9mT+WaSahyaiWeXv3z/9DidYCS5oVgW+eIJOyddUHFIHlZrawJxbTO4v6/3tR8lsTp+WeQxQVkTYslUmxdd8tEyevCWUNttHbcc+TgyQ1s7WdlTTqbYcNhNu/QgHdjwvCdan7JMuHdC9pqjSa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEHJQOvX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEHJQOvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706620459; x=1738156459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6fcGMqKUIKBgg6HnsEwmsCThHEyUGKj7tQsDuM2eiPE=;
  b=KEHJQOvXrMaUOg94x12TqG6V9Y0G1EibrLUIBEGkXrFcq7u09S5pjrUu
   dB5tUCcO9HkvtLRvEcTFa/QJeKSAGwacWZvUo7/vlmsSwEGz0dEAlMSsd
   M8AWsDAqkZU8QZsF9ya00lDZfytyNiz3OUk4wTJQpdpSym4WGBjEve//S
   ICp95sSvqiG2fjj3PusbW3Ej/SGuYU5yq4OK/nAgcJYtXiambYZAsg3+j
   8c6v7piucO/PSjIsMcze2pR7gLY26kG2101bfrnnvnJyv0mN0pi+Y2ioF
   nkZLywL6Jdw8HkAgQMGrXscJRivqr8ObZdyGSxd3QmKo17OihXsC+XoZj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16658203"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="16658203"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 05:14:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="911440867"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="911440867"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Jan 2024 05:14:16 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUnwH-0000Jo-0i;
	Tue, 30 Jan 2024 13:14:10 +0000
Date: Tue, 30 Jan 2024 21:14:03 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2431/2827] fs/ntfs3/frecord.c:2460:16: warning:
 unused variable 'i_size'
Message-ID: <202401302130.Zw501PI9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
commit: 4fd6c08a16d7f1ba10212c9ef7bc73218144b463 [2431/2827] fs/ntfs3: Use i_size_read and i_size_write
config: sh-randconfig-r023-20220313 (https://download.01.org/0day-ci/archive/20240130/202401302130.Zw501PI9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401302130.Zw501PI9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401302130.Zw501PI9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ntfs3/frecord.c: In function 'ni_read_frame':
>> fs/ntfs3/frecord.c:2460:16: warning: unused variable 'i_size' [-Wunused-variable]
    2460 |         loff_t i_size = i_size_read(&ni->vfs_inode);
         |                ^~~~~~


vim +/i_size +2460 fs/ntfs3/frecord.c

  2442	
  2443	/*
  2444	 * ni_read_frame
  2445	 *
  2446	 * Pages - Array of locked pages.
  2447	 */
  2448	int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
  2449			  u32 pages_per_frame)
  2450	{
  2451		int err;
  2452		struct ntfs_sb_info *sbi = ni->mi.sbi;
  2453		u8 cluster_bits = sbi->cluster_bits;
  2454		char *frame_ondisk = NULL;
  2455		char *frame_mem = NULL;
  2456		struct page **pages_disk = NULL;
  2457		struct ATTR_LIST_ENTRY *le = NULL;
  2458		struct runs_tree *run = &ni->file.run;
  2459		u64 valid_size = ni->i_valid;
> 2460		loff_t i_size = i_size_read(&ni->vfs_inode);
  2461		u64 vbo_disk;
  2462		size_t unc_size;
  2463		u32 frame_size, i, npages_disk, ondisk_size;
  2464		struct page *pg;
  2465		struct ATTRIB *attr;
  2466		CLST frame, clst_data;
  2467	
  2468		/*
  2469		 * To simplify decompress algorithm do vmap for source
  2470		 * and target pages.
  2471		 */
  2472		for (i = 0; i < pages_per_frame; i++)
  2473			kmap(pages[i]);
  2474	
  2475		frame_size = pages_per_frame << PAGE_SHIFT;
  2476		frame_mem = vmap(pages, pages_per_frame, VM_MAP, PAGE_KERNEL);
  2477		if (!frame_mem) {
  2478			err = -ENOMEM;
  2479			goto out;
  2480		}
  2481	
  2482		attr = ni_find_attr(ni, NULL, &le, ATTR_DATA, NULL, 0, NULL, NULL);
  2483		if (!attr) {
  2484			err = -ENOENT;
  2485			goto out1;
  2486		}
  2487	
  2488		if (!attr->non_res) {
  2489			u32 data_size = le32_to_cpu(attr->res.data_size);
  2490	
  2491			memset(frame_mem, 0, frame_size);
  2492			if (frame_vbo < data_size) {
  2493				ondisk_size = data_size - frame_vbo;
  2494				memcpy(frame_mem, resident_data(attr) + frame_vbo,
  2495				       min(ondisk_size, frame_size));
  2496			}
  2497			err = 0;
  2498			goto out1;
  2499		}
  2500	
  2501		if (frame_vbo >= valid_size) {
  2502			memset(frame_mem, 0, frame_size);
  2503			err = 0;
  2504			goto out1;
  2505		}
  2506	
  2507		if (ni->ni_flags & NI_FLAG_COMPRESSED_MASK) {
  2508	#ifndef CONFIG_NTFS3_LZX_XPRESS
  2509			err = -EOPNOTSUPP;
  2510			goto out1;
  2511	#else
  2512			u32 frame_bits = ni_ext_compress_bits(ni);
  2513			u64 frame64 = frame_vbo >> frame_bits;
  2514			u64 frames, vbo_data;
  2515	
  2516			if (frame_size != (1u << frame_bits)) {
  2517				err = -EINVAL;
  2518				goto out1;
  2519			}
  2520			switch (frame_size) {
  2521			case 0x1000:
  2522			case 0x2000:
  2523			case 0x4000:
  2524			case 0x8000:
  2525				break;
  2526			default:
  2527				/* Unknown compression. */
  2528				err = -EOPNOTSUPP;
  2529				goto out1;
  2530			}
  2531	
  2532			attr = ni_find_attr(ni, attr, &le, ATTR_DATA, WOF_NAME,
  2533					    ARRAY_SIZE(WOF_NAME), NULL, NULL);
  2534			if (!attr) {
  2535				ntfs_inode_err(
  2536					&ni->vfs_inode,
  2537					"external compressed file should contains data attribute \"WofCompressedData\"");
  2538				err = -EINVAL;
  2539				goto out1;
  2540			}
  2541	
  2542			if (!attr->non_res) {
  2543				run = NULL;
  2544			} else {
  2545				run = run_alloc();
  2546				if (!run) {
  2547					err = -ENOMEM;
  2548					goto out1;
  2549				}
  2550			}
  2551	
  2552			frames = (i_size - 1) >> frame_bits;
  2553	
  2554			err = attr_wof_frame_info(ni, attr, run, frame64, frames,
  2555						  frame_bits, &ondisk_size, &vbo_data);
  2556			if (err)
  2557				goto out2;
  2558	
  2559			if (frame64 == frames) {
  2560				unc_size = 1 + ((i_size - 1) & (frame_size - 1));
  2561				ondisk_size = attr_size(attr) - vbo_data;
  2562			} else {
  2563				unc_size = frame_size;
  2564			}
  2565	
  2566			if (ondisk_size > frame_size) {
  2567				err = -EINVAL;
  2568				goto out2;
  2569			}
  2570	
  2571			if (!attr->non_res) {
  2572				if (vbo_data + ondisk_size >
  2573				    le32_to_cpu(attr->res.data_size)) {
  2574					err = -EINVAL;
  2575					goto out1;
  2576				}
  2577	
  2578				err = decompress_lzx_xpress(
  2579					sbi, Add2Ptr(resident_data(attr), vbo_data),
  2580					ondisk_size, frame_mem, unc_size, frame_size);
  2581				goto out1;
  2582			}
  2583			vbo_disk = vbo_data;
  2584			/* Load all runs to read [vbo_disk-vbo_to). */
  2585			err = attr_load_runs_range(ni, ATTR_DATA, WOF_NAME,
  2586						   ARRAY_SIZE(WOF_NAME), run, vbo_disk,
  2587						   vbo_data + ondisk_size);
  2588			if (err)
  2589				goto out2;
  2590			npages_disk = (ondisk_size + (vbo_disk & (PAGE_SIZE - 1)) +
  2591				       PAGE_SIZE - 1) >>
  2592				      PAGE_SHIFT;
  2593	#endif
  2594		} else if (is_attr_compressed(attr)) {
  2595			/* LZNT compression. */
  2596			if (sbi->cluster_size > NTFS_LZNT_MAX_CLUSTER) {
  2597				err = -EOPNOTSUPP;
  2598				goto out1;
  2599			}
  2600	
  2601			if (attr->nres.c_unit != NTFS_LZNT_CUNIT) {
  2602				err = -EOPNOTSUPP;
  2603				goto out1;
  2604			}
  2605	
  2606			down_write(&ni->file.run_lock);
  2607			run_truncate_around(run, le64_to_cpu(attr->nres.svcn));
  2608			frame = frame_vbo >> (cluster_bits + NTFS_LZNT_CUNIT);
  2609			err = attr_is_frame_compressed(ni, attr, frame, &clst_data);
  2610			up_write(&ni->file.run_lock);
  2611			if (err)
  2612				goto out1;
  2613	
  2614			if (!clst_data) {
  2615				memset(frame_mem, 0, frame_size);
  2616				goto out1;
  2617			}
  2618	
  2619			frame_size = sbi->cluster_size << NTFS_LZNT_CUNIT;
  2620			ondisk_size = clst_data << cluster_bits;
  2621	
  2622			if (clst_data >= NTFS_LZNT_CLUSTERS) {
  2623				/* Frame is not compressed. */
  2624				down_read(&ni->file.run_lock);
  2625				err = ntfs_bio_pages(sbi, run, pages, pages_per_frame,
  2626						     frame_vbo, ondisk_size,
  2627						     REQ_OP_READ);
  2628				up_read(&ni->file.run_lock);
  2629				goto out1;
  2630			}
  2631			vbo_disk = frame_vbo;
  2632			npages_disk = (ondisk_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
  2633		} else {
  2634			__builtin_unreachable();
  2635			err = -EINVAL;
  2636			goto out1;
  2637		}
  2638	
  2639		pages_disk = kzalloc(npages_disk * sizeof(struct page *), GFP_NOFS);
  2640		if (!pages_disk) {
  2641			err = -ENOMEM;
  2642			goto out2;
  2643		}
  2644	
  2645		for (i = 0; i < npages_disk; i++) {
  2646			pg = alloc_page(GFP_KERNEL);
  2647			if (!pg) {
  2648				err = -ENOMEM;
  2649				goto out3;
  2650			}
  2651			pages_disk[i] = pg;
  2652			lock_page(pg);
  2653			kmap(pg);
  2654		}
  2655	
  2656		/* Read 'ondisk_size' bytes from disk. */
  2657		down_read(&ni->file.run_lock);
  2658		err = ntfs_bio_pages(sbi, run, pages_disk, npages_disk, vbo_disk,
  2659				     ondisk_size, REQ_OP_READ);
  2660		up_read(&ni->file.run_lock);
  2661		if (err)
  2662			goto out3;
  2663	
  2664		/*
  2665		 * To simplify decompress algorithm do vmap for source and target pages.
  2666		 */
  2667		frame_ondisk = vmap(pages_disk, npages_disk, VM_MAP, PAGE_KERNEL_RO);
  2668		if (!frame_ondisk) {
  2669			err = -ENOMEM;
  2670			goto out3;
  2671		}
  2672	
  2673		/* Decompress: Frame_ondisk -> frame_mem. */
  2674	#ifdef CONFIG_NTFS3_LZX_XPRESS
  2675		if (run != &ni->file.run) {
  2676			/* LZX or XPRESS */
  2677			err = decompress_lzx_xpress(
  2678				sbi, frame_ondisk + (vbo_disk & (PAGE_SIZE - 1)),
  2679				ondisk_size, frame_mem, unc_size, frame_size);
  2680		} else
  2681	#endif
  2682		{
  2683			/* LZNT - Native NTFS compression. */
  2684			unc_size = decompress_lznt(frame_ondisk, ondisk_size, frame_mem,
  2685						   frame_size);
  2686			if ((ssize_t)unc_size < 0)
  2687				err = unc_size;
  2688			else if (!unc_size || unc_size > frame_size)
  2689				err = -EINVAL;
  2690		}
  2691		if (!err && valid_size < frame_vbo + frame_size) {
  2692			size_t ok = valid_size - frame_vbo;
  2693	
  2694			memset(frame_mem + ok, 0, frame_size - ok);
  2695		}
  2696	
  2697		vunmap(frame_ondisk);
  2698	
  2699	out3:
  2700		for (i = 0; i < npages_disk; i++) {
  2701			pg = pages_disk[i];
  2702			if (pg) {
  2703				kunmap(pg);
  2704				unlock_page(pg);
  2705				put_page(pg);
  2706			}
  2707		}
  2708		kfree(pages_disk);
  2709	
  2710	out2:
  2711	#ifdef CONFIG_NTFS3_LZX_XPRESS
  2712		if (run != &ni->file.run)
  2713			run_free(run);
  2714	#endif
  2715	out1:
  2716		vunmap(frame_mem);
  2717	out:
  2718		for (i = 0; i < pages_per_frame; i++) {
  2719			pg = pages[i];
  2720			kunmap(pg);
  2721			ClearPageError(pg);
  2722			SetPageUptodate(pg);
  2723		}
  2724	
  2725		return err;
  2726	}
  2727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
