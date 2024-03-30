Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC3563CB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 07:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711784068; cv=none; b=SXdpdlKnBBzeq8xfqyg/2nzj4Pu/IXi9l4kdOf+57him0LAUr1v2tIPxGq0a1EwfXYg+UiuOJhwRHFB5WOZzd7wTIfrGc8kOBunG36wFUZdJJS6wfz7fNx8zCFAguTLVIltR0Yh17cQQ6DFufn83VqYnOsO+EKJp6mLcmEb0kSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711784068; c=relaxed/simple;
	bh=4wEkCQQdWDmycEN/y1Lg6DxAdjTgYdiCXowNN7k9GKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGizAzZWi/4+tbuaNg+D0orwc0TkLwVp++KAwyOfgxPG6gI6lRDzJH+ZTByzW6UN1l0bNnQEUP/WY8TJVDH72yNoeHbsGPIN7Kr60mLNfZs6iSMDxAxflG+z0437suZWNJPyzQJpMc40D1SjEPvcdZ7ErtWRNCNzcHDnyiw7OQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSXTKn4T; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSXTKn4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711784065; x=1743320065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4wEkCQQdWDmycEN/y1Lg6DxAdjTgYdiCXowNN7k9GKk=;
  b=JSXTKn4TmsFO05QJjqymte0M0VuFOGGAftk0zY/xXNk2WXu5z7lQC74b
   Hfr81EHXriW4QKEJTg9oBfF9f6rW4sNVgNoz7t6S6384QUFuSDDPyQM4K
   c2hjweBwuqA63teiwlxLR4cbtVSrhZ3OFQQ5DpCxyhAVx4lW2RCiowJQD
   DqXlJlJwcDfuLF993eHu+dL62ED5aJu9nrDTGrBNjf4ExRwXu6jyukFXu
   DktNqT4uqB65mkVBnhJEp5+Gx8w9k+2GWPn4RZOmMFrJGGgf8GF9AQxO6
   EAZRPgPYTnZbNcXB/u8XIr66KLtEUs/Sng9bOHBBaHvsh7q/TnagLRoRX
   Q==;
X-CSE-ConnectionGUID: je9MtEYtQG+gUrONA71lkQ==
X-CSE-MsgGUID: Srm/M1ZdStST/ybLPnHwYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="24428450"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="24428450"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 00:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17067419"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Mar 2024 00:34:23 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqTEL-00043E-1W;
	Sat, 30 Mar 2024 07:34:21 +0000
Date: Sat, 30 Mar 2024 15:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Yuanchu Xie <yuanchu@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 2/8] mm: aggregate working set information into
 histograms
Message-ID: <202403301536.MO4rN6Rp-lkp@intel.com>
References: <20240327213108.2384666-3-yuanchu@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327213108.2384666-3-yuanchu@google.com>

Hi Yuanchu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.8]
[cannot apply to akpm-mm/mm-everything driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.9-rc1 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuanchu-Xie/mm-multi-gen-LRU-ignore-non-leaf-pmd_young-for-force_scan-true/20240328-053344
base:   v6.8
patch link:    https://lore.kernel.org/r/20240327213108.2384666-3-yuanchu%40google.com
patch subject: [RFC PATCH v3 2/8] mm: aggregate working set information into histograms
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240330/202403301536.MO4rN6Rp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240330/202403301536.MO4rN6Rp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403301536.MO4rN6Rp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:3819:6: warning: no previous prototype for 'try_to_inc_max_seq' [-Wmissing-prototypes]
    3819 | bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
         |      ^~~~~~~~~~~~~~~~~~


vim +/try_to_inc_max_seq +3819 mm/vmscan.c

  3818	
> 3819	bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
  3820				       struct scan_control *sc, bool can_swap, bool force_scan)
  3821	{
  3822		bool success;
  3823		struct lru_gen_mm_walk *walk;
  3824		struct mm_struct *mm = NULL;
  3825		struct lru_gen_folio *lrugen = &lruvec->lrugen;
  3826		struct lru_gen_mm_state *mm_state = get_mm_state(lruvec);
  3827	
  3828		VM_WARN_ON_ONCE(max_seq > READ_ONCE(lrugen->max_seq));
  3829	
  3830		if (!mm_state)
  3831			return inc_max_seq(lruvec, max_seq, can_swap, force_scan);
  3832	
  3833		/* see the comment in iterate_mm_list() */
  3834		if (max_seq <= READ_ONCE(mm_state->seq))
  3835			return false;
  3836	
  3837		/*
  3838		 * If the hardware doesn't automatically set the accessed bit, fallback
  3839		 * to lru_gen_look_around(), which only clears the accessed bit in a
  3840		 * handful of PTEs. Spreading the work out over a period of time usually
  3841		 * is less efficient, but it avoids bursty page faults.
  3842		 */
  3843		if (!should_walk_mmu()) {
  3844			success = iterate_mm_list_nowalk(lruvec, max_seq);
  3845			goto done;
  3846		}
  3847	
  3848		walk = set_mm_walk(NULL, true);
  3849		if (!walk) {
  3850			success = iterate_mm_list_nowalk(lruvec, max_seq);
  3851			goto done;
  3852		}
  3853	
  3854		walk->lruvec = lruvec;
  3855		walk->max_seq = max_seq;
  3856		walk->can_swap = can_swap;
  3857		walk->force_scan = force_scan;
  3858	
  3859		do {
  3860			success = iterate_mm_list(lruvec, walk, &mm);
  3861			if (mm)
  3862				walk_mm(lruvec, mm, walk);
  3863		} while (mm);
  3864	done:
  3865		if (success) {
  3866			success = inc_max_seq(lruvec, max_seq, can_swap, force_scan);
  3867			WARN_ON_ONCE(!success);
  3868		}
  3869	
  3870		return success;
  3871	}
  3872	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
