Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBD843D501
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714726; cv=none; b=fSDjWP37GJeCR1hnb8R+IMvu12wU2mQE4U+EMPIeG8xLnCptiHJVMI4cyiGvv1s6o0FAxI1NW5F+QdqbBU/Tgn3Zd4yz+0aBZYp8Y4IzibE43zks4sBJL1F57Qgg126WiuyGuVv9x/r5OQXf1qEOYi7r7HwZoPPxrPRiDo9jHjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714726; c=relaxed/simple;
	bh=PVjAbdGR8EttvxcGWznPRU6KcI+fXlXrovJrssyoe/g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LKxnQIFWtXlKk/Z1YSwKjmA4iGX2qjZrBJySfAngTy8IuY8di80c9M4LzFS00bnKVYIVbhPhbHxOUniWh918WPHwx9ikIyxSx+Lrs2WKslKlrftrTzvOi2JkalxyNPXGkPchtHa/HGXNGydSzfeVlo3yEF94CsBKvdoQDE6Caxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTWEAQ/j; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTWEAQ/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786714723; x=1818250723;
  h=date:from:to:cc:subject:message-id;
  bh=PVjAbdGR8EttvxcGWznPRU6KcI+fXlXrovJrssyoe/g=;
  b=FTWEAQ/jtsaVSFUrPqy8jzln2KixB9Wf2GzhXVHr6WNdWIQc+iTW+OD5
   YE/VDsnUVTBW2d+SBl4JDerwLv9l10i7CY9ijOkY1feOFO+UX76EZgXe6
   57+Q0zxnq3z25R95N4OJ1lA4si6dWsZJrk18iyjYro9LdQOfGH25v8FMn
   nqmAgi8Uw5/uZToSqin++koNbR1RL2EyBqEFcAwDqZ0Of1pfvpo+K5Goi
   abJAebPhV5pRrBxFE3FD0/WmJJ7PrDDTdaPVHsCwk24cZe3C8GAWlKmC9
   +MINacmPToL5MVvY4jIlgtMnPdf36du5p075KplQ6q79wjVF3hJvoR5em
   Q==;
X-CSE-ConnectionGUID: fYjP0kCvRKiCJYEkhewT4Q==
X-CSE-MsgGUID: 2G17HVVZQ76/0QsN3ineeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="104826099"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="104826099"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 06:38:42 -0700
X-CSE-ConnectionGUID: McceNDFfSI2d8wyGMAVYBg==
X-CSE-MsgGUID: UZ1Ovc0gSAa7QoQZImWDQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="259995350"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 14 Aug 2026 06:38:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wus7L-000000006Ft-0wjc;
	Fri, 14 Aug 2026 13:38:39 +0000
Date: Fri, 14 Aug 2026 15:38:36 +0200
From: kernel test robot <lkp@intel.com>
To: Heming Zhao <heming.zhao@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: fs/ocfs2/aops.c:2872:22: warning: variable 'max_blocks' set
 but not used
Message-ID: <202608141535.kOQ9g2e6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Heming-Zhao/ocfs2-Add-new-ocfs2_map_blocks-to-introduce-iomap-feature/20260811-043801
head:   4d6a46254590fa90285d4856f4ad8301cef54200
commit: a79c0c3913814518686f2e87426267431ecfbaa0 ocfs2: switch dio write path from buffer_head to iomap
date:   4 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260814/202608141535.kOQ9g2e6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141535.kOQ9g2e6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141535.kOQ9g2e6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ocfs2/aops.c: In function 'ocfs2_iomap_dio_end_io_write':
>> fs/ocfs2/aops.c:2872:22: warning: variable 'max_blocks' set but not used [-Wunused-but-set-variable]
    2872 |         unsigned int max_blocks;
         |                      ^~~~~~~~~~


vim +/max_blocks +2872 fs/ocfs2/aops.c

  2853	
  2854	/* copy from ocfs2_dio_end_io_write */
  2855	static int ocfs2_iomap_dio_end_io_write(struct inode *inode,
  2856					  loff_t offset,
  2857					  ssize_t bytes)
  2858	{
  2859		struct ocfs2_cached_dealloc_ctxt dealloc;
  2860		struct ocfs2_extent_tree et;
  2861		struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
  2862		struct ocfs2_inode_info *oi = OCFS2_I(inode);
  2863		struct buffer_head *di_bh = NULL;
  2864		struct ocfs2_dinode *di;
  2865		struct ocfs2_alloc_context *data_ac = NULL;
  2866		struct ocfs2_alloc_context *meta_ac = NULL;
  2867		handle_t *handle = NULL;
  2868		loff_t end = offset + bytes;
  2869		int ret = 0, credits = 0;
  2870		struct ocfs2_map_block map;
  2871		unsigned int blkbits = inode->i_blkbits;
> 2872		unsigned int max_blocks;
  2873		unsigned int ue_cpos = 0, ue_phys = 0, ue_len = 0;
  2874		unsigned int curr_lblk, end_lblk;
  2875	
  2876		map.lblk = offset >> blkbits;
  2877		max_blocks = (bytes + offset) >> osb->s_clustersize_bits;
  2878	
  2879		ocfs2_init_dealloc_ctxt(&dealloc);
  2880	
  2881		ret = ocfs2_inode_lock(inode, &di_bh, 1);
  2882		if (ret < 0) {
  2883			mlog_errno(ret);
  2884			goto out;
  2885		}
  2886	
  2887		down_write(&oi->ip_alloc_sem);
  2888	
  2889		di = (struct ocfs2_dinode *)di_bh->b_data;
  2890	
  2891		ocfs2_init_dinode_extent_tree(&et, INODE_CACHE(inode), di_bh);
  2892	
  2893		/* Attach dealloc with extent tree in case that we may reuse extents
  2894		 * which are already unlinked from current extent tree due to extent
  2895		 * rotation and merging.
  2896		 */
  2897		et.et_dealloc = &dealloc;
  2898	
  2899		ret = ocfs2_lock_allocators(inode, &et, 0, (bytes >> osb->s_clustersize_bits)*2,
  2900					    &data_ac, &meta_ac);
  2901		if (ret) {
  2902			mlog_errno(ret);
  2903			goto unlock;
  2904		}
  2905	
  2906		credits = ocfs2_calc_extend_credits(inode->i_sb, &di->id2.i_list);
  2907	
  2908		handle = ocfs2_start_trans(osb, credits);
  2909		if (IS_ERR(handle)) {
  2910			ret = PTR_ERR(handle);
  2911			mlog_errno(ret);
  2912			goto unlock;
  2913		}
  2914		ret = ocfs2_journal_access_di(handle, INODE_CACHE(inode), di_bh,
  2915					      OCFS2_JOURNAL_ACCESS_WRITE);
  2916		if (ret) {
  2917			mlog_errno(ret);
  2918			goto commit;
  2919		}
  2920	
  2921		curr_lblk = offset >> blkbits;
  2922		/*
  2923		 * Round the end up so the final partial block (sub-block direct I/O)
  2924		 * is included; otherwise the last, partially-written cluster is left
  2925		 * unwritten and reads back as zero.
  2926		 */
  2927		end_lblk = (offset + bytes + (1 << blkbits) - 1) >> blkbits;
  2928		while (ret >= 0 && curr_lblk < end_lblk) {
  2929			memset(&map, 0, sizeof(map));
  2930			map.lblk += curr_lblk;
  2931			map.len = end_lblk - curr_lblk;
  2932	
  2933			ret = ocfs2_assure_trans_credits(handle, credits);
  2934			if (ret < 0) {
  2935				mlog_errno(ret);
  2936				break;
  2937			}
  2938	
  2939			ret = ocfs2_map_blocks(inode, &map, 0);
  2940			if (ret < 0) {
  2941				mlog_errno(ret);
  2942				break;
  2943			}
  2944			if (ret == 0)
  2945				break;
  2946	
  2947			if (map.flags & OCFS2_MAP_UNWRITTEN) {
  2948				ue_cpos = ocfs2_blocks_to_clusters(inode->i_sb, map.lblk);
  2949				ue_phys = ocfs2_blocks_to_clusters(inode->i_sb, map.pblk);
  2950				ue_len = ocfs2_clusters_for_blocks(inode->i_sb,
  2951							map.lblk + map.len) - ue_cpos;
  2952	
  2953				ret = ocfs2_mark_extent_written(inode, &et, handle,
  2954						ue_cpos, ue_len,
  2955						ue_phys,
  2956						meta_ac, &dealloc);
  2957				if (ret < 0) {
  2958					mlog_errno(ret);
  2959					break;
  2960				}
  2961			}
  2962			curr_lblk += map.len;
  2963		}
  2964	
  2965		if (end > i_size_read(inode)) {
  2966			ret = ocfs2_set_inode_size(handle, inode, di_bh, end);
  2967			if (ret < 0)
  2968				mlog_errno(ret);
  2969		}
  2970	
  2971	commit:
  2972		ocfs2_commit_trans(osb, handle);
  2973	
  2974	unlock:
  2975		up_write(&oi->ip_alloc_sem);
  2976	
  2977		if (data_ac)
  2978			ocfs2_free_alloc_context(data_ac);
  2979		if (meta_ac)
  2980			ocfs2_free_alloc_context(meta_ac);
  2981	
  2982		down_write(&oi->ip_alloc_sem);
  2983		if (!ret && (di->i_flags & cpu_to_le32(OCFS2_DIO_ORPHANED_FL))) {
  2984			ret = ocfs2_del_inode_from_orphan(osb, inode, di_bh, 0, 0);
  2985			if (ret < 0)
  2986				mlog_errno(ret);
  2987		}
  2988		up_write(&oi->ip_alloc_sem);
  2989		ocfs2_inode_unlock(inode, 1);
  2990		brelse(di_bh);
  2991	
  2992	out:
  2993		ocfs2_run_deallocs(osb, &dealloc);
  2994		return ret;
  2995	}
  2996	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
