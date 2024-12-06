Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C305192D65
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 07:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733469364; cv=none; b=bf3tqX1GxtiHYIegKHZ5a4SpTQ9nWFGcfGjvLvGEIDHUMsH9Y5u58wWT47nzzwCzF8gMD8kkCzFtkPmeZk9FsKfAmguD5dm4GjHlzyLv/2w+9N/R1rcqim1BPq6ofw8IQTVLiFZhaYCQEuWq5SXFItyWN/391HpACnOxh5nN4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733469364; c=relaxed/simple;
	bh=0t4toa1O06N+bOAUAhYu2NkqkKIbCRLLgwsc5dsvjBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uJXuDTzz7IaKOAEdYEIwNt2O+NX2D5HscO4xw6z9csBq61Uahg6G3SSymqb0091MSCJV6F5lwepbkNyanU6PzBe9rewTvsesVhkSg2eRun5fvb1mbdvf97AnOzZS55TKqPmxEomWidGyfLddypSrgpKKrA068JHrgce/0wJ9sCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DrVp+yOU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrVp+yOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733469362; x=1765005362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0t4toa1O06N+bOAUAhYu2NkqkKIbCRLLgwsc5dsvjBk=;
  b=DrVp+yOUCiqHFRZNq1W8gBoNcvWfk4x61EaB222HhSbgHHgIuOZQGp4I
   yC3YOIYI4Axewk3EQdEROVzEeqhiN+MDGeaf8yOIS45CxYwwhHs6dYEB9
   YlRrMQRF7YBMVe+yXXipn83m4NHXY1Fpe6TqbWC8Iuz8ON5E+ErDE+Ae1
   MPao33saWLt27xxIRApTFGAdenDBGPuS6jjzy9y83VSZuWWybSkbm8yKE
   U+KfFJgBYVnsofgtYKLKI/GxAv5uokKVXvDtKPiEKPwU95Tfc5SowA5nS
   lB7Tlk20eC1isodZxV9PGdrb6lJk3TaduYi3WjvN9dEwFp6s33oXizODH
   A==;
X-CSE-ConnectionGUID: 2VN2rZ3EQvWmvFTziU/igg==
X-CSE-MsgGUID: cv5IXKOBQ+GKzXNNHCwZrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="56305471"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="56305471"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:16:01 -0800
X-CSE-ConnectionGUID: t5kdpWNKQ+aUKjG3C9M2SQ==
X-CSE-MsgGUID: cTxbm/1vRFSzyl088taNKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94803623"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2024 23:15:59 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJSZB-0000nW-04;
	Fri, 06 Dec 2024 07:15:57 +0000
Date: Fri, 6 Dec 2024 15:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:shrunk-page 85/85]
 drivers/video/fbdev/core/fb_defio.c:149:8: error: no member named 'index' in
 'struct page'
Message-ID: <202412061512.PcYF2qpE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthew,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.infradead.org/users/willy/pagecache shrunk-page
head:   488c4ea861c3f7b4c6a2c44656010cad4b9ec91e
commit: 488c4ea861c3f7b4c6a2c44656010cad4b9ec91e [85/85] mm: Rename page->index to page->__folio_index
config: arm64-randconfig-001-20241206 (https://download.01.org/0day-ci/archive/20241206/202412061512.PcYF2qpE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061512.PcYF2qpE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061512.PcYF2qpE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/core/fb_defio.c:149:8: error: no member named 'index' in 'struct page'
           page->index = vmf->pgoff; /* for folio_mkclean() */
           ~~~~  ^
   1 error generated.


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
