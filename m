Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B5C646
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 00:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733184102; cv=none; b=lnfDrSrETusFyB3IKi7RKT+BNwi+r15BkGlENbQ7aAEzUy2eO1rdbG/IZyQfG3qTGycv2FhcZnybM227dKWvE5gqjpM231P5iDoAxHXQi8HbfIASSsdjUx2sEbme68GzDjUO25ImpQAcwUp1MreN2mbheG63nHcuCE0PmQrvsdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733184102; c=relaxed/simple;
	bh=4l5xroy2Nm/Ht8EmtnKnLahT4tv7FcFexabfcyCzv+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=km6ocLSHuu4IZyMFeFbZDVjxlHJRogSfZbW2JYrQo9ESMXfWRfFXTLQlPwcEdeKvBygcXk7mFoldBRqbDojK0O1vTIThzMf2qK6CzEPBT0QYFewtxAJI4hIsCVNak4nXcq5n9PzRKAvIJ7/IKR/H9M1CTC2towaeVf0N2xtOyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmTnXizo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmTnXizo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733184102; x=1764720102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4l5xroy2Nm/Ht8EmtnKnLahT4tv7FcFexabfcyCzv+s=;
  b=QmTnXizoyU7Vv5WjWn6Rfo6QQFryb6SdpMqXE7hiehBFiN5lWm4PWKBQ
   IGTumMsKx+hzVnKtdV5oBoq/E51iVpD44U6RROKBs3c5MrjYAwy7WQmdQ
   CAt0JGQsaXmoGeKNwP9xMnblFYM+fH6TVegRNspel+8yl2kNahtduAx7x
   qwJttJJgaFYneLrNVoaGG++tLq2MxcBtLR7PX57niP879P4j8oC9my2w3
   3RDkrjG4f3w4s4NXbP0yGHmYqwZ9yo7CqyoGKI+2/lbRvTBRcL+O7v4wD
   LuAm6zveySHmstXEK+Gpml++ah1SWERSgMi60Zx3DGd7y6KNw6YtGzsSx
   w==;
X-CSE-ConnectionGUID: +uu1Elg4Qc6BtJmoGzuNMw==
X-CSE-MsgGUID: zrhmdNSQS56uNwGna8UShQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43987381"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="43987381"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 16:01:41 -0800
X-CSE-ConnectionGUID: ZJlqyg1dQZS2DXhKSLxG8g==
X-CSE-MsgGUID: VU/D5LYCQzSg3JfHrywRqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="98033915"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Dec 2024 16:01:40 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIGMD-000331-16;
	Tue, 03 Dec 2024 00:01:37 +0000
Date: Tue, 3 Dec 2024 08:00:45 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:shrunk-page 59/59]
 drivers/video/fbdev/core/fb_defio.c:149:13: error: 'struct page' has no
 member named 'index'
Message-ID: <202412030738.q9Hsk38R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache shrunk-page
head:   b404c9609385180a63470cd3fe6f03735ad2ec7d
commit: b404c9609385180a63470cd3fe6f03735ad2ec7d [59/59] mm: Rename page->index to page->__folio_index
config: arm-randconfig-002-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030738.q9Hsk38R-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030738.q9Hsk38R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030738.q9Hsk38R-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/core/fb_defio.c: In function 'fb_deferred_io_fault':
>> drivers/video/fbdev/core/fb_defio.c:149:13: error: 'struct page' has no member named 'index'
     149 |         page->index = vmf->pgoff; /* for folio_mkclean() */
         |             ^~


vim +149 drivers/video/fbdev/core/fb_defio.c

56c134f7f1b58b drivers/video/fbdev/core/fb_defio.c Thomas Zimmermann 2022-04-29  127  
60b59beafba875 drivers/video/fb_defio.c            Jaya Kumar        2007-05-08  128  /* this is to find and return the vmalloc-ed fb pages */
c8b54776c17322 drivers/video/fbdev/core/fb_defio.c Souptick Joarder  2018-04-24  129  static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
60b59beafba875 drivers/video/fb_defio.c            Jaya Kumar        2007-05-08  130  {
60b59beafba875 drivers/video/fb_defio.c            Jaya Kumar        2007-05-08  131  	unsigned long offset;
60b59beafba875 drivers/video/fb_defio.c            Jaya Kumar        2007-05-08  132  	struct page *page;
11bac80004499e drivers/video/fbdev/core/fb_defio.c Dave Jiang        2017-02-24  133  	struct fb_info *info = vmf->vma->vm_private_data;
60b59beafba875 drivers/video/fb_defio.c            Jaya Kumar        2007-05-08  134  
529e55b6a57bda drivers/video/fb_defio.c            Nicholas Piggin   2008-02-06  135  	offset = vmf->pgoff << PAGE_SHIFT;
60b59beafba875 drivers/video/fb_defio.c            Jaya Kumar        2007-05-08  136  	if (offset >= info->fix.smem_len)
529e55b6a57bda drivers/video/fb_defio.c            Nicholas Piggin   2008-02-06  137  		return VM_FAULT_SIGBUS;
60b59beafba875 drivers/video/fb_defio.c            Jaya Kumar        2007-05-08  138  
1ecbc7dd29020d drivers/video/fbdev/core/fb_defio.c Thomas Zimmermann 2024-04-19  139  	page = fb_deferred_io_get_page(info, offset);
60b59beafba875 drivers/video/fb_defio.c            Jaya Kumar        2007-05-08  140  	if (!page)
529e55b6a57bda drivers/video/fb_defio.c            Nicholas Piggin   2008-02-06  141  		return VM_FAULT_SIGBUS;
60b59beafba875 drivers/video/fb_defio.c            Jaya Kumar        2007-05-08  142  
0b78f8bcf4951a drivers/video/fbdev/core/fb_defio.c Matthew Wilcox    2021-06-01  143  	if (vmf->vma->vm_file)
0b78f8bcf4951a drivers/video/fbdev/core/fb_defio.c Matthew Wilcox    2021-06-01  144  		page->mapping = vmf->vma->vm_file->f_mapping;
0b78f8bcf4951a drivers/video/fbdev/core/fb_defio.c Matthew Wilcox    2021-06-01  145  	else
0b78f8bcf4951a drivers/video/fbdev/core/fb_defio.c Matthew Wilcox    2021-06-01  146  		printk(KERN_ERR "no mapping available\n");
0b78f8bcf4951a drivers/video/fbdev/core/fb_defio.c Matthew Wilcox    2021-06-01  147  
0b78f8bcf4951a drivers/video/fbdev/core/fb_defio.c Matthew Wilcox    2021-06-01  148  	BUG_ON(!page->mapping);
a929e0d10f3db1 drivers/video/fbdev/core/fb_defio.c Kefeng Wang       2024-06-04 @149  	page->index = vmf->pgoff; /* for folio_mkclean() */
de7c6d15e354bc drivers/video/fb_defio.c            Jaya Kumar        2008-03-19  150  
529e55b6a57bda drivers/video/fb_defio.c            Nicholas Piggin   2008-02-06  151  	vmf->page = page;
529e55b6a57bda drivers/video/fb_defio.c            Nicholas Piggin   2008-02-06  152  	return 0;
60b59beafba875 drivers/video/fb_defio.c            Jaya Kumar        2007-05-08  153  }
60b59beafba875 drivers/video/fb_defio.c            Jaya Kumar        2007-05-08  154  

:::::: The code at line 149 was first introduced by commit
:::::: a929e0d10f3db1a53668f6b9845db27d7fb63759 mm: remove page_mkclean()

:::::: TO: Kefeng Wang <wangkefeng.wang@huawei.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
