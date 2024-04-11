Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3EC146006
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712827582; cv=none; b=rg9aNlTvwC6MYfHNZdF6x//KWq4Iw+01XagmMngzXAHh/7tT5r9FEIBOSTKQ7O9hdoFzlZorrDdIw2Vals5FBQg0r5bLH/SHsnUivtMVP/CfJNA2iTa8Bnd0YPx8w8yKFcKgN7HUa83arjQLBMAyR7zy9NJzc3xPPQ2UtRVMsy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712827582; c=relaxed/simple;
	bh=5HKS9ZyDRF96jCHED9jli33S0JfPFAzWRKeYaAqxQMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pi5BHLca/8kOTMmAXjuL+vcz+BMfPgtcxejp+kTnYG2S4pAe2ZecNlx1yM50312Aiz6fqv59IMTBS7X2PbrQxLyVjN8Dx4YyW7pr2XpaWzT0infmyR/uXyT+TddwGPdfa8QneOWN7t0Fq0wtQoI+pio+QsBM1MIqS4Lmd6Z9Ais=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZV1CJgIK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZV1CJgIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712827581; x=1744363581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5HKS9ZyDRF96jCHED9jli33S0JfPFAzWRKeYaAqxQMw=;
  b=ZV1CJgIKQ3faf7NN7/k3wPsq8ZAksLnvw4fOXp5pMdNh4XysYbNqJ8Cv
   /qQ5naAONeeZ7JD1FREPIXoeSho9wvDBksWuE6T4kJzXPhXwthBz0yI7X
   dM/hBZVl+1h92cA8wfxA0D03F1xLdiL7eSj7qjdoIuA7wiYb3QzxE9ec6
   lYyqQXSqSpdG5RVn92dOT1UlQuDIoKBB91ObQFseS/Ztf2+nJd/PIqofx
   MVaianUcrpLXfnEqyn2RkHTozoctyt4ti72xLwxB6C2Ls0eECCX4uPWC1
   6/mtbdExIHM10qxFI8xN0jOhabhACGR+xIBKvUeSG7WS46Z9rp9b87qkm
   g==;
X-CSE-ConnectionGUID: yAkKUWkWRRefhQwg97FxKQ==
X-CSE-MsgGUID: Hr+UfIyLRJ2dZmxDRwnKYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="30709149"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="30709149"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:26:20 -0700
X-CSE-ConnectionGUID: J4HJS6yiRyeg0ib+3Cx0QQ==
X-CSE-MsgGUID: h34WeCyQSzqUEygSEi5fug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="20745376"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Apr 2024 02:26:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruqhD-0008Sr-1J;
	Thu, 11 Apr 2024 09:26:15 +0000
Date: Thu, 11 Apr 2024 17:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Chuanhua Han <hanchuanhua@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Barry Song <v-songbaohua@oppo.com>
Subject: [akpm-mm:mm-unstable 360/372] include/linux/swap.h:565:6: warning:
 no previous prototype for 'swap_free_nr'
Message-ID: <202404111723.YtET6RM5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   de14d5f2a9ff2df737a01575ee95bc5a35f5853d
commit: ca23b4d4cae5d32a9d22fb3c39550dcf43df83f9 [360/372] mm: swap: introduce swap_free_nr() for batched swap_free()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240411/202404111723.YtET6RM5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111723.YtET6RM5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111723.YtET6RM5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:23:
>> include/linux/swap.h:565:6: warning: no previous prototype for 'swap_free_nr' [-Wmissing-prototypes]
     565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
         |      ^~~~~~~~~~~~
--
   In file included from mm/slub.c:14:
>> include/linux/swap.h:565:6: warning: no previous prototype for 'swap_free_nr' [-Wmissing-prototypes]
     565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
         |      ^~~~~~~~~~~~
   mm/slub.c: In function 'slab_post_alloc_hook':
   mm/slub.c:3831:29: warning: variable 'obj_exts' set but not used [-Wunused-but-set-variable]
    3831 |         struct slabobj_ext *obj_exts;
         |                             ^~~~~~~~


vim +/swap_free_nr +565 include/linux/swap.h

   564	
 > 565	void swap_free_nr(swp_entry_t entry, int nr_pages)
   566	{
   567	}
   568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
