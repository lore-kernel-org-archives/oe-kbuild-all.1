Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F712F22
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 03:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739072514; cv=none; b=H+jVMN+b/mm0GZgp1wuQABAadKluxaUa9hTtjuxJoMehBfUd4V492KgI2yd53a/0SXxJxDtzm3+9gGKYH6AO0nUQlpc6dbTC/cG2HS3pTUvlTQ8YXRw0huvqlaR2f2TFGAHWpgrBUnDMyBZX81GAVfKi1VJlj3V6ZOMHTw1B7YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739072514; c=relaxed/simple;
	bh=bz+RGmDuCSS7PU4/ZiawJazvroEXIBStJW7zJNv3j14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETwaZVa8i8wpDlKMccmuhP06xkBGOsaLHyZ9NoRw0hvm5DahZdIX2kDaxuGr7hDpW2GVSjZrmxqNZWb3wxuPg9poHKTqR9GCY6pq2IOYBNfsXkD1ZO9k3ETNi408l/bPaiXzb0DiIro1RDzxHQSH1O4UQWp+3jqtpaNTLpHpChE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KiaJyiej; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KiaJyiej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739072512; x=1770608512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bz+RGmDuCSS7PU4/ZiawJazvroEXIBStJW7zJNv3j14=;
  b=KiaJyiej5HwlieZ6R/k7hS2G65/ysTr8kjjPPTwHSqW8NbtZ6pQF51xf
   99wY8hI9Lk/53rJms39NvVEn4aGLu/6+mJhP6V/sTyQeFKHyHDB6K/Uv8
   MHmrsA2//S6WraYOojnmvCl8gppDWr+uLH6Fale+RUxEGsSprAs46L546
   BxoKUYUjDDeThSKiio3SJ2uRgsWGpmQ6JbuiOjd4JCjhv2D+N36/wpDE6
   pAmIsyVfD7FxmCWMUquKO3jfrJZn5xCsAw6ikQqO3mveKWYRP4SXxm6Wi
   7BMoMTVkNq02EpWR5S9QYl5LI2IEoWWFx27pjomEZk1LH6nS2AK9kItYd
   Q==;
X-CSE-ConnectionGUID: clQIDrcHQ76Lkncfw9+wIg==
X-CSE-MsgGUID: 8PpmmbNHQyKago6yXpaY1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="65033933"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="65033933"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 19:41:51 -0800
X-CSE-ConnectionGUID: /sHbPOLgQ6Cik0VM2p/p8Q==
X-CSE-MsgGUID: C0NDq9n9QZ62LtLpg+bnsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111706597"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Feb 2025 19:41:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgyCZ-00112R-1v;
	Sun, 09 Feb 2025 03:41:47 +0000
Date: Sun, 9 Feb 2025 11:41:34 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Message-ID: <202502091146.oTATquOg-lkp@intel.com>
References: <81171ab16c14e3df28f6de9d14982cee528d8519.1739029358.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81171ab16c14e3df28f6de9d14982cee528d8519.1739029358.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc1]
[cannot apply to akpm-mm/mm-everything next-20250207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-refactor-rmap_walk_file-to-separate-out-traversal-logic/20250208-235627
base:   linus/master
patch link:    https://lore.kernel.org/r/81171ab16c14e3df28f6de9d14982cee528d8519.1739029358.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH v3 3/3] fb_defio: do not use deprecated page->mapping, index fields
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250209/202502091146.oTATquOg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091146.oTATquOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091146.oTATquOg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/core/fb_defio.c: In function 'fb_deferred_io_work':
>> drivers/video/fbdev/core/fb_defio.c:270:25: warning: unused variable 'pgoff' [-Wunused-variable]
     270 |                 pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
         |                         ^~~~~
>> drivers/video/fbdev/core/fb_defio.c:269:30: warning: unused variable 'page' [-Wunused-variable]
     269 |                 struct page *page = pageref->page;
         |                              ^~~~


vim +/pgoff +270 drivers/video/fbdev/core/fb_defio.c

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
 > 269			struct page *page = pageref->page;
 > 270			pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
