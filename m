Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6CD19E7F9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 03:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752205359; cv=none; b=Mv3Lf8t8fmGn/PLS+bvuH2cZNyjUtU3/Ze29VFw04zEDjUStXvFbJ9HnweNNSyZSLlF82VH55g+2Fe7DY8TYU2CgiI9XMGCnc7NJLIPeAXN3Vn61xsmZ1e3yqt6d8/bd4hs5LDCFmkN9OobWNwi4vyFBkIQCvvGSyL2ao1U3MFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752205359; c=relaxed/simple;
	bh=5FFHkRss6pN4NdcqeIejw+pfDq5IISmrh3MWkpjFnoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+pqZNEc0A/npr7JqjOUFaM0HiXRu0l4pT38IdHbTGkQnepWfaKKadL68pRmFxypp76ySwOKMVM1Lr+XdAeFdGicbxKUcmcHRQWpQX2n9W8HZ/AkptT3rZbgtnjbdih1Is8Vz3BNQy6rTo/nmLXgyQa6tWj+WZQK7Hk7mA1BLT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncYL+ft7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncYL+ft7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752205358; x=1783741358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5FFHkRss6pN4NdcqeIejw+pfDq5IISmrh3MWkpjFnoA=;
  b=ncYL+ft7vtVGPBe9iNzaCZOcoxo5Y2nD4XSd7nL+PB4xOfg57mtU1H0A
   Y9QIVWk25l2TR7IM4jdYFy/ae5P2PiL/whcDhiw9nnlrDMpoBCo2MyCC2
   QQ1y06HoBTzjgcC/6nZzzzeWNYcG5ASMxuO9/Bc2KiWZx26Nz0BmqFuy8
   BUSEDsX+PBwrvBCk/fkYJ/SVoCQ1PxLYV9d1IH0+ZgMjdg3TFRVhm3y9R
   F3l5JT38+xBvYWQsbFI6NauahQvwbk2AaYHYcp5pUVEJATaVTlrQUrGfc
   7MqiTHOgqDtgfj4jOxTH38MIcOb8n8GabL5v/S6YaHR+/wGwm+dlo35nu
   Q==;
X-CSE-ConnectionGUID: qYHNvT3KQjGy1BCefRiAxw==
X-CSE-MsgGUID: 4BBDjgODRpmDsE/bzdKdCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65948403"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="65948403"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 20:42:35 -0700
X-CSE-ConnectionGUID: KuzFztWSQdy/xaLstytrHg==
X-CSE-MsgGUID: gNP+piI5QJamcF4qrbf9ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="160566952"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jul 2025 20:42:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua4ed-0005qN-2N;
	Fri, 11 Jul 2025 03:42:31 +0000
Date: Fri, 11 Jul 2025 11:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Martins <loemra.dev@gmail.com>, linux-btrfs@vger.kernel.org,
	kernel-team@fb.com
Cc: oe-kbuild-all@lists.linux.dev, jlayton@kernel.org
Subject: Re: [PATCH] btrfs: implement ref_tracker for delayed_nodes
Message-ID: <202507111111.Eh3BAP7i-lkp@intel.com>
References: <fa19acf9dc38e93546183fc083c365cdb237e89b.1752098515.git.loemra.dev@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa19acf9dc38e93546183fc083c365cdb237e89b.1752098515.git.loemra.dev@gmail.com>

Hi Leo,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on linus/master v6.16-rc5 next-20250710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Martins/btrfs-implement-ref_tracker-for-delayed_nodes/20250710-060640
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/fa19acf9dc38e93546183fc083c365cdb237e89b.1752098515.git.loemra.dev%40gmail.com
patch subject: [PATCH] btrfs: implement ref_tracker for delayed_nodes
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250711/202507111111.Eh3BAP7i-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111111.Eh3BAP7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507111111.Eh3BAP7i-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/ref_tracker.c: In function 'ref_tracker_alloc':
>> lib/ref_tracker.c:209:22: error: implicit declaration of function 'stack_trace_save'; did you mean 'stack_depot_save'? [-Wimplicit-function-declaration]
     209 |         nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
         |                      ^~~~~~~~~~~~~~~~
         |                      stack_depot_save

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REF_TRACKER
   Depends on [n]: STACKTRACE_SUPPORT
   Selected by [y]:
   - BTRFS_DELAYED_NODE_REF_TRACKER [=y] && BLOCK [=y] && BTRFS_DEBUG [=y]


vim +209 lib/ref_tracker.c

4e66934eaadc83 Eric Dumazet  2021-12-04  184  
4e66934eaadc83 Eric Dumazet  2021-12-04  185  int ref_tracker_alloc(struct ref_tracker_dir *dir,
4e66934eaadc83 Eric Dumazet  2021-12-04  186  		      struct ref_tracker **trackerp,
4e66934eaadc83 Eric Dumazet  2021-12-04  187  		      gfp_t gfp)
4e66934eaadc83 Eric Dumazet  2021-12-04  188  {
4e66934eaadc83 Eric Dumazet  2021-12-04  189  	unsigned long entries[REF_TRACKER_STACK_ENTRIES];
4e66934eaadc83 Eric Dumazet  2021-12-04  190  	struct ref_tracker *tracker;
4e66934eaadc83 Eric Dumazet  2021-12-04  191  	unsigned int nr_entries;
acd8f0e5d72741 Andrzej Hajda 2023-06-02  192  	gfp_t gfp_mask = gfp | __GFP_NOWARN;
4e66934eaadc83 Eric Dumazet  2021-12-04  193  	unsigned long flags;
4e66934eaadc83 Eric Dumazet  2021-12-04  194  
e3ececfe668fac Eric Dumazet  2022-02-04  195  	WARN_ON_ONCE(dir->dead);
e3ececfe668fac Eric Dumazet  2022-02-04  196  
8fd5522f44dcd7 Eric Dumazet  2022-02-04  197  	if (!trackerp) {
8fd5522f44dcd7 Eric Dumazet  2022-02-04  198  		refcount_inc(&dir->no_tracker);
8fd5522f44dcd7 Eric Dumazet  2022-02-04  199  		return 0;
8fd5522f44dcd7 Eric Dumazet  2022-02-04  200  	}
c12837d1bb3103 Eric Dumazet  2022-01-12  201  	if (gfp & __GFP_DIRECT_RECLAIM)
c12837d1bb3103 Eric Dumazet  2022-01-12  202  		gfp_mask |= __GFP_NOFAIL;
c12837d1bb3103 Eric Dumazet  2022-01-12  203  	*trackerp = tracker = kzalloc(sizeof(*tracker), gfp_mask);
4e66934eaadc83 Eric Dumazet  2021-12-04  204  	if (unlikely(!tracker)) {
4e66934eaadc83 Eric Dumazet  2021-12-04  205  		pr_err_once("memory allocation failure, unreliable refcount tracker.\n");
4e66934eaadc83 Eric Dumazet  2021-12-04  206  		refcount_inc(&dir->untracked);
4e66934eaadc83 Eric Dumazet  2021-12-04  207  		return -ENOMEM;
4e66934eaadc83 Eric Dumazet  2021-12-04  208  	}
4e66934eaadc83 Eric Dumazet  2021-12-04 @209  	nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
4e66934eaadc83 Eric Dumazet  2021-12-04  210  	tracker->alloc_stack_handle = stack_depot_save(entries, nr_entries, gfp);
4e66934eaadc83 Eric Dumazet  2021-12-04  211  
4e66934eaadc83 Eric Dumazet  2021-12-04  212  	spin_lock_irqsave(&dir->lock, flags);
4e66934eaadc83 Eric Dumazet  2021-12-04  213  	list_add(&tracker->head, &dir->list);
4e66934eaadc83 Eric Dumazet  2021-12-04  214  	spin_unlock_irqrestore(&dir->lock, flags);
4e66934eaadc83 Eric Dumazet  2021-12-04  215  	return 0;
4e66934eaadc83 Eric Dumazet  2021-12-04  216  }
4e66934eaadc83 Eric Dumazet  2021-12-04  217  EXPORT_SYMBOL_GPL(ref_tracker_alloc);
4e66934eaadc83 Eric Dumazet  2021-12-04  218  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
