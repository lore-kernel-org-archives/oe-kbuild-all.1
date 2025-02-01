Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C9D1C2325
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426657; cv=none; b=Psjyjsx4jfbbhq7nFyeds4mOrwByUraCnHCRm/g8RFfXbrpNtkClTdlDVSnmamCCj97iLjT4CqER1eUwuzNn6BgAr+2tr5yCAXUNRioTE+GbtyHbILimJ6o2iLbQruNVFmXCatJrokqoSI7Li3YHPVxN8ZKwCciWt/HAMNMmtfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426657; c=relaxed/simple;
	bh=gLJjcz444djT/qHqORc82k527vn03eJD6MLUiwvqPG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VvLPdIhSiN98jB9Kv2xzoDHMbGxAi0zI1lqgEXq5bd3wKKFMhaIG2rXc4ro68CSAlSbnQ0jORXYYkulx57UAAcF+FMrHN/UeHxk2eI1XJQ4t7Qz9yGs5Ovma+JLT57gAOVTUkN0PKyVJw7XJC+l+UMoGIcaftbMiBH8kvy7KFZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCtK+GWU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCtK+GWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738426655; x=1769962655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gLJjcz444djT/qHqORc82k527vn03eJD6MLUiwvqPG8=;
  b=jCtK+GWU8TFfuhPAzv6eAUVdUjZwHBtqRbc6TLNRfQ7dTWQnJVnqxo/q
   hDMV9NqF7wNiPrJnuhKwh5hNEpDbpx7r0PWbTe9KTRXYx6UrIV7tmgmxM
   QKJV55+zdaFdvFDFZRdDjj46k0UmeHTdBl059sWw2Is+tZn3135T+IKNV
   dXulYXXdhD1v1yXC4pvdHXvkSpoe6+Zb7fhFWOuWTFx/T3bUiV53kNciL
   fHYdpga7SPqZxbRbtC7A1ySTN0LW+pS81pBFM+xp0zwMeYMJCJgTtAu8O
   h92Rt7Zkh4s+/lQtX+a17p7LZTP+Kn7jhOV9E8Xc/AVaw5PYhwkR20o/9
   g==;
X-CSE-ConnectionGUID: ju8N33RWRYmQFsC2rq599w==
X-CSE-MsgGUID: PQ52Av35ReOTD+g/fpcx+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="42723595"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="42723595"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 08:17:32 -0800
X-CSE-ConnectionGUID: C6h05ZtTS860dYDHB2Y+oA==
X-CSE-MsgGUID: XPkpRMuOShSvNJZbwP3m1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="110460086"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Feb 2025 08:17:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teGBU-000oKl-2N;
	Sat, 01 Feb 2025 16:17:28 +0000
Date: Sun, 2 Feb 2025 00:16:55 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 75/80]
 drivers/video/fbdev/core/fb_defio.c:272:17: error: implicit declaration of
 function 'mapping_wrprotect_page'
Message-ID: <202502020030.MnEJ847Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   7de6fd8ab65003f050aa58e705592745717ed318
commit: 6a9318f28d7e371692838677c364145fe04b1093 [75/80] fb_defio: do not use deprecated page->mapping, index fields
config: sh-randconfig-002-20250201 (https://download.01.org/0day-ci/archive/20250202/202502020030.MnEJ847Z-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502020030.MnEJ847Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502020030.MnEJ847Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/core/fb_defio.c: In function 'fb_deferred_io_work':
>> drivers/video/fbdev/core/fb_defio.c:272:17: error: implicit declaration of function 'mapping_wrprotect_page' [-Wimplicit-function-declaration]
     272 |                 mapping_wrprotect_page(fbdefio->mapping, pgoff, 1, page);
         |                 ^~~~~~~~~~~~~~~~~~~~~~


vim +/mapping_wrprotect_page +272 drivers/video/fbdev/core/fb_defio.c

   258	
   259	/* workqueue callback */
   260	static void fb_deferred_io_work(struct work_struct *work)
   261	{
   262		struct fb_info *info = container_of(work, struct fb_info, deferred_work.work);
   263		struct fb_deferred_io_pageref *pageref, *next;
   264		struct fb_deferred_io *fbdefio = info->fbdefio;
   265	
   266		/* here we wrprotect the page's mappings, then do all deferred IO. */
   267		mutex_lock(&fbdefio->lock);
   268		list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
   269			struct page *page = pageref->page;
   270			pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
   271	
 > 272			mapping_wrprotect_page(fbdefio->mapping, pgoff, 1, page);
   273		}
   274	
   275		/* driver's callback with pagereflist */
   276		fbdefio->deferred_io(info, &fbdefio->pagereflist);
   277	
   278		/* clear the list */
   279		list_for_each_entry_safe(pageref, next, &fbdefio->pagereflist, list)
   280			fb_deferred_io_pageref_put(pageref, info);
   281	
   282		mutex_unlock(&fbdefio->lock);
   283	}
   284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
