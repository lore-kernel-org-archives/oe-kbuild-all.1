Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A259FF9E6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 07:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730012611; cv=none; b=qaT/OacxQkn6d/tmFpwYB6bDhsRm/W867wK0V2ZHFT6V1+TgQs5zLlz+KbarfToVt7Pxtnblx/TYTRuePIjNNVing5R42Rb4GmQ/4jSv7Q5LP/rXPW7nG3lEP9p8CNJa5pVAZG3/egANPpYQjTJX0Au/bKvwvEjWf0cPUxGER7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730012611; c=relaxed/simple;
	bh=1N4hHUZ8OJkAxw4w0pZLkCD3kkzbr6FsV2EpakV0ZYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGS3hD8unrNdTlGmWzit4Az3IcG+Hvg3NdgcmRyllL+lyALri06ztq52gKLYQ3mv6J4ZCHc+SJiENgaDygcpGKi9R/3KtuyxTuzjc0rVbgHyjN9ax5MOFh/EehqTvTMV3wygklGGuKGaSQlRjpzUKc2k4EO0h6cbr3teXaMOo9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISRtGfWP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISRtGfWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730012609; x=1761548609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1N4hHUZ8OJkAxw4w0pZLkCD3kkzbr6FsV2EpakV0ZYU=;
  b=ISRtGfWP6RXmoupAiowtCMGVoD1wcA6TxgSw3phFbQOJkhLwcjBzNETh
   6wdC95T1WgVrXmMobN8fz7d+ylH5MXd9akOPNquUzryBsHE+YH2iaoF+2
   +9P0QOhmhDTHu9STgrPvyl3iEODB/c1HU6aTfcYM1tzvlgB9w2qSsPUFz
   KKDlObj6it0M+LuASzbbTy5ZezrC4S6dhPQvNyDYscswqZVoMI8AJN/dy
   jpU02r+vBHyO3lz1d7yYFHMmG+mSHLFj9n6IgUOZtDW2jCulcV93RLgGM
   bRoGqGHgSrvTsRk0BWZ8JJbwZ1WR6VlJDp7kwVIV3MnbV5RLau66pjWFg
   g==;
X-CSE-ConnectionGUID: nuMStMDXQqGBHRP18EAvbQ==
X-CSE-MsgGUID: 5xe7O+A1QX+y8A/1EqLCIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29770166"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29770166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 00:03:29 -0700
X-CSE-ConnectionGUID: WBICmwCQTHSK66pyMy2i7w==
X-CSE-MsgGUID: sG01+GfsSGWgaXgWOO3vNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="82135715"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Oct 2024 00:03:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4xJ6-000aSQ-2h;
	Sun, 27 Oct 2024 07:03:24 +0000
Date: Sun, 27 Oct 2024 15:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] memcg-v1: remove memcg move locking code
Message-ID: <202410271408.tc8QGSge-lkp@intel.com>
References: <20241024065712.1274481-4-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024065712.1274481-4-shakeel.butt@linux.dev>

Hi Shakeel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20241025]
[cannot apply to tj-cgroup/for-next brauner-vfs/vfs.all linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shakeel-Butt/memcg-v1-fully-deprecate-move_charge_at_immigrate/20241025-132623
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241024065712.1274481-4-shakeel.butt%40linux.dev
patch subject: [RFC PATCH 3/3] memcg-v1: remove memcg move locking code
config: arc-randconfig-002-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271408.tc8QGSge-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271408.tc8QGSge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271408.tc8QGSge-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmscan.c: In function 'walk_mm':
>> mm/vmscan.c:3652:28: warning: unused variable 'memcg' [-Wunused-variable]
    3652 |         struct mem_cgroup *memcg = lruvec_memcg(lruvec);
         |                            ^~~~~


vim +/memcg +3652 mm/vmscan.c

bd74fdaea14602 Yu Zhao            2022-09-18  3641  
2d823764fafa65 Kinsey Ho          2024-02-14  3642  static void walk_mm(struct mm_struct *mm, struct lru_gen_mm_walk *walk)
bd74fdaea14602 Yu Zhao            2022-09-18  3643  {
bd74fdaea14602 Yu Zhao            2022-09-18  3644  	static const struct mm_walk_ops mm_walk_ops = {
bd74fdaea14602 Yu Zhao            2022-09-18  3645  		.test_walk = should_skip_vma,
bd74fdaea14602 Yu Zhao            2022-09-18  3646  		.p4d_entry = walk_pud_range,
49b0638502da09 Suren Baghdasaryan 2023-08-04  3647  		.walk_lock = PGWALK_RDLOCK,
bd74fdaea14602 Yu Zhao            2022-09-18  3648  	};
bd74fdaea14602 Yu Zhao            2022-09-18  3649  
bd74fdaea14602 Yu Zhao            2022-09-18  3650  	int err;
2d823764fafa65 Kinsey Ho          2024-02-14  3651  	struct lruvec *lruvec = walk->lruvec;
bd74fdaea14602 Yu Zhao            2022-09-18 @3652  	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
bd74fdaea14602 Yu Zhao            2022-09-18  3653  
bd74fdaea14602 Yu Zhao            2022-09-18  3654  	walk->next_addr = FIRST_USER_ADDRESS;
bd74fdaea14602 Yu Zhao            2022-09-18  3655  
bd74fdaea14602 Yu Zhao            2022-09-18  3656  	do {
7f63cf2d9b9bbe Kalesh Singh       2023-04-13  3657  		DEFINE_MAX_SEQ(lruvec);
7f63cf2d9b9bbe Kalesh Singh       2023-04-13  3658  
bd74fdaea14602 Yu Zhao            2022-09-18  3659  		err = -EBUSY;
bd74fdaea14602 Yu Zhao            2022-09-18  3660  
7f63cf2d9b9bbe Kalesh Singh       2023-04-13  3661  		/* another thread might have called inc_max_seq() */
cc25bbe10a86a7 Kinsey Ho          2024-02-14  3662  		if (walk->seq != max_seq)
7f63cf2d9b9bbe Kalesh Singh       2023-04-13  3663  			break;
7f63cf2d9b9bbe Kalesh Singh       2023-04-13  3664  
bd74fdaea14602 Yu Zhao            2022-09-18  3665  		/* the caller might be holding the lock for write */
bd74fdaea14602 Yu Zhao            2022-09-18  3666  		if (mmap_read_trylock(mm)) {
bd74fdaea14602 Yu Zhao            2022-09-18  3667  			err = walk_page_range(mm, walk->next_addr, ULONG_MAX, &mm_walk_ops, walk);
bd74fdaea14602 Yu Zhao            2022-09-18  3668  
bd74fdaea14602 Yu Zhao            2022-09-18  3669  			mmap_read_unlock(mm);
bd74fdaea14602 Yu Zhao            2022-09-18  3670  		}
bd74fdaea14602 Yu Zhao            2022-09-18  3671  
bd74fdaea14602 Yu Zhao            2022-09-18  3672  		if (walk->batched) {
bd74fdaea14602 Yu Zhao            2022-09-18  3673  			spin_lock_irq(&lruvec->lru_lock);
2d823764fafa65 Kinsey Ho          2024-02-14  3674  			reset_batch_size(walk);
bd74fdaea14602 Yu Zhao            2022-09-18  3675  			spin_unlock_irq(&lruvec->lru_lock);
bd74fdaea14602 Yu Zhao            2022-09-18  3676  		}
bd74fdaea14602 Yu Zhao            2022-09-18  3677  
bd74fdaea14602 Yu Zhao            2022-09-18  3678  		cond_resched();
bd74fdaea14602 Yu Zhao            2022-09-18  3679  	} while (err == -EAGAIN);
bd74fdaea14602 Yu Zhao            2022-09-18  3680  }
bd74fdaea14602 Yu Zhao            2022-09-18  3681  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
