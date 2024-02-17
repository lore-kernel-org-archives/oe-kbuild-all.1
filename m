Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EA2DF4D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 03:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708141331; cv=none; b=Ex9bnosrwH0pTSq2JXYb2rAlQ+wqwcw1ubhNHb/gjnJBiusuT5nW3cQPVE0RdaJX2JDSeR0/tYlwjTCVtU7/A/D//f8NN57OTOgyVNKpt4X9pzI2n5UJvrXYBEIu3dTCndNarSJL5hmAqYtJPKrdqYoO+A6vbEHkhHEHMlJ5RD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708141331; c=relaxed/simple;
	bh=WKPs1tbxk6gIxG9rmJUjTlAi+Tsj+wKgjnfkHqq1kmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oc33ujKpBz/KoZ/tvnG9KwqNznn6LiDvFYhg6rN2fuyJZ5eIgo4FwrpAqlKfVsb6NgrIV5xW1Sug8gx3pDwv7gjexPharXt5HbN2X1EOrB7W0lm++mqGqRh2YoOwOlbX2JvkqLmBwP4FScEbF2qZwhGbiG+fZZy9H94X/ZPGyto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mG+X1QB+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mG+X1QB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708141329; x=1739677329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WKPs1tbxk6gIxG9rmJUjTlAi+Tsj+wKgjnfkHqq1kmk=;
  b=mG+X1QB+xjm9e/AVZD6xbL2zsp9uxFicTAeJWmwAAttwPL3JrQ3+tE+f
   dcfIolKsX8m8/sA+NTKt80QxbknccLM5JrMRewUJIr248AUzGXLqKdo4Y
   ZsxHYoHiicU2b/xxazy2qgBTEn7/OwZZfNXpKqZ/SEgz1F8eDpXIsUUOM
   QJ2lhWIPiqknm6uynwcn5SAxK3l0SjTMoOwzoqmvwAEPnu0KuBD5U635T
   TrTBXT0kVwv4zxfY49aj4+khjNQcdxmvPSN/V3lZkvyQBULJCfcl02lVY
   6F6p+L/BHpH8czcQdOv4jWHtetlZnEru5/SikfCsUo4oXJ/npkuN32sgZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2160997"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="2160997"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 19:42:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="4172854"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 16 Feb 2024 19:42:08 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbBaX-0001nr-2D;
	Sat, 17 Feb 2024 03:42:05 +0000
Date: Sat, 17 Feb 2024 11:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/4] drm/ttm: Use LRU hitches
Message-ID: <202402171115.ELbaBdCa-lkp@intel.com>
References: <20240216131446.101961-3-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216131446.101961-3-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8-rc4 next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240216-211801
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240216131446.101961-3-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 2/4] drm/ttm: Use LRU hitches
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240217/202402171115.ELbaBdCa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402171115.ELbaBdCa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402171115.ELbaBdCa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_resource.c:58: warning: expecting prototype for ttm_resource_cursor_fini_locked(). Prototype was for ttm_resource_cursor_fini() instead


vim +58 drivers/gpu/drm/ttm/ttm_resource.c

    48	
    49	/**
    50	 * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
    51	 * @cursor: The struct ttm_resource_cursor to finalize.
    52	 *
    53	 * The function pulls the LRU list cursor off any lists it was previusly
    54	 * attached to. Needs to be called without the LRU list lock held. The
    55	 * function can be called multiple times after eachother.
    56	 */
    57	void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
  > 58	{
    59		spinlock_t *lru_lock = &cursor->man->bdev->lru_lock;
    60	
    61		spin_lock(lru_lock);
    62		ttm_resource_cursor_fini_locked(cursor);
    63		spin_unlock(lru_lock);
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
