Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B6619006F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 05:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991167; cv=none; b=B870Ea99FwcefXYkLq9I3YnCWrPmmADx7kvYaSjiEnBono1ybjCB9FLowo6StOOL0jIhtfbWNi8knpgn44U5zCD6re7KvmSggcegozyr0nZ066RQImF9aV8OwQQMjiprR8e1HojU6u7S3BkZP/pM+mmrFVeVx4ZCaw1iUQAoX7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991167; c=relaxed/simple;
	bh=RJBZL6UZs19a6OzJHcM479GtWYHXlJb/vFweOUwBJI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f4NVEVu2UVttXKTsbi52i/UW+nkMEVVwP5+3UUKHwYUZImFpafop4+zmx90+InRm/00YSSS8ngKw5Q3XzZoA9diKKmC1r0UMJ/YrN7MYkyYIf9zT77/omQ/LNVAYp9zFD8NrEwCuU0Xu1AqvpEmpjjXGsVKXouUDDS/Q1xrjj0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATlFjIiv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATlFjIiv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738991166; x=1770527166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RJBZL6UZs19a6OzJHcM479GtWYHXlJb/vFweOUwBJI8=;
  b=ATlFjIivwO5XPaAXrD+7+ujyxiahGFHz7A5uNUa/VLs2SNRFkwXeImNp
   aGty4WYjr8s5VVU9HaaPtsuC6EKCm9IwhBXH0jsEqQoTYYxcIQQRs3tEr
   j08GS4bmjEHhvwdRTenz9IgcM9Li6Ly//LHYX0OTZE+rY2YsXnPhM6jS4
   i4v7iuJT/nQRb/smOzvNr61o+5c6oBNB2PPH9VL6B+dhvOM5UtkNjEhSD
   z5CF19nIjGWHFjFWkRtlpbp1YezB5x4Z7TtMOdM3zXS29lwo3pfeUjVXx
   toSmj9Q6qB6KpGJnOUmh2MfouIGMhpINu7K0PuM+wm/hZ1oTwxOK6pwL7
   Q==;
X-CSE-ConnectionGUID: HpmHFhmbSDyyVc/605sxJw==
X-CSE-MsgGUID: FxDVQ2pmTVGKHpeXKlcVVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39330036"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="39330036"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 21:06:03 -0800
X-CSE-ConnectionGUID: 15yElDjIRxiN4I03NgkpTQ==
X-CSE-MsgGUID: nO3xeBjjQbKDMZerdCnRkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116651552"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Feb 2025 21:06:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgd2V-000zY9-1n;
	Sat, 08 Feb 2025 05:05:59 +0000
Date: Sat, 8 Feb 2025 13:05:41 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 146/165]
 drivers/video/fbdev/core/fb_defio.c:272:17: error: implicit declaration of
 function 'mapping_wrprotect_range'
Message-ID: <202502081235.v7ook2My-lkp@intel.com>
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
head:   8bf30f9d23eb5040d37e6e712789cee8e71e1577
commit: 85d65aec481df149bc5280cf1ad5f9b76f59f153 [146/165] fb_defio: do not use deprecated page->mapping, index fields
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250208/202502081235.v7ook2My-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081235.v7ook2My-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081235.v7ook2My-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/core/fb_defio.c: In function 'fb_deferred_io_fault':
   drivers/video/fbdev/core/fb_defio.c:136:48: error: macro "fb_err" requires 3 arguments, but only 1 given
     136 |                 fb_err("no mapping available\n");
         |                                                ^
   In file included from drivers/video/fbdev/core/fb_defio.c:19:
   include/linux/fb.h:887:9: note: macro "fb_err" defined here
     887 | #define fb_err(fb_info, fmt, ...)                                       \
         |         ^~~~~~
   drivers/video/fbdev/core/fb_defio.c:136:17: error: 'fb_err' undeclared (first use in this function); did you mean 'xa_err'?
     136 |                 fb_err("no mapping available\n");
         |                 ^~~~~~
         |                 xa_err
   drivers/video/fbdev/core/fb_defio.c:136:17: note: each undeclared identifier is reported only once for each function it appears in
   drivers/video/fbdev/core/fb_defio.c: In function 'fb_deferred_io_work':
>> drivers/video/fbdev/core/fb_defio.c:272:17: error: implicit declaration of function 'mapping_wrprotect_range' [-Wimplicit-function-declaration]
     272 |                 mapping_wrprotect_range(fbdefio->mapping, pgoff,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_DEFERRED_IO
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=m] && MMU [=n]
   Selected by [m]:
   - FB_SH_MOBILE_LCDC [=m] && FB [=m] && HAVE_CLK [=y] && HAS_IOMEM [=y] && (SUPERH [=y] || COMPILE_TEST [=y]) && FB_DEVICE [=y] && BACKLIGHT_CLASS_DEVICE [=m]
   - FB_SYSMEM_HELPERS_DEFERRED [=y] && HAS_IOMEM [=y] && FB_CORE [=m]


vim +/mapping_wrprotect_range +272 drivers/video/fbdev/core/fb_defio.c

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
 > 272			mapping_wrprotect_range(fbdefio->mapping, pgoff,
   273						page_to_pfn(page), 1);
   274		}
   275	
   276		/* driver's callback with pagereflist */
   277		fbdefio->deferred_io(info, &fbdefio->pagereflist);
   278	
   279		/* clear the list */
   280		list_for_each_entry_safe(pageref, next, &fbdefio->pagereflist, list)
   281			fb_deferred_io_pageref_put(pageref, info);
   282	
   283		mutex_unlock(&fbdefio->lock);
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
