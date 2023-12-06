Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEF1652
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 00:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="em0MUzXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701823268; x=1733359268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C7+x0OxZjSKUsUEUcS6cNliS0wfc+JZbyokRGC0Mz9o=;
  b=em0MUzXery4bmHC7T+gHtk3yw+PI2mdMHvHvPzYgGzLwyFcfntFQy5Zq
   cz/t3tu2NxPnUvdxmzOIBSkh84lS3IHptR+iwteXfzSTbXUOXaQjVrCRI
   AgWeH/M0BCd4eKDQ+KaffJ2rko4Q1oLw0MzmZEyLrLgL7/6wZJtX0yDPL
   jOR4FfDEkuYZNeT4j9d5/8ymzmqfAb/E+X307xC3SrTJSayzP31XgB65Y
   KLXQO8iWtXZc07o8B1zwe+OxOtS9YMUgoul7f4EuMTD7SN4iWeXhRhNKx
   reVVndUHD7i6dTti/sCSVtCrbU2xAT71kj+65DwugnvvktN74ZbhjDAmg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12698159"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="12698159"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 16:41:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841650107"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="841650107"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 16:41:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAfyI-0009xw-17;
	Wed, 06 Dec 2023 00:41:02 +0000
Date: Wed, 6 Dec 2023 08:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 26/28] binder: avoid user addresses in debug logs
Message-ID: <202312060851.cudv98wG-lkp@intel.com>
References: <20231201172212.1813387-27-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201172212.1813387-27-cmllamas@google.com>

Hi Carlos,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on staging/staging-next staging/staging-linus linus/master v6.7-rc4]
[cannot apply to next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Carlos-Llamas/binder-fix-use-after-free-in-shinker-s-callback/20231202-022218
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20231201172212.1813387-27-cmllamas%40google.com
patch subject: [PATCH v2 26/28] binder: avoid user addresses in debug logs
config: x86_64-randconfig-121-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060851.cudv98wG-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060851.cudv98wG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060851.cudv98wG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/android/binder_alloc.c: In function 'binder_alloc_deferred_release':
>> drivers/android/binder_alloc.c:928:18: warning: variable 'page_addr' set but not used [-Wunused-but-set-variable]
     928 |    unsigned long page_addr;
         |                  ^~~~~~~~~


vim +/page_addr +928 drivers/android/binder_alloc.c

0c972a05cde66e Todd Kjos     2017-06-29  887  
0c972a05cde66e Todd Kjos     2017-06-29  888  
0c972a05cde66e Todd Kjos     2017-06-29  889  void binder_alloc_deferred_release(struct binder_alloc *alloc)
0c972a05cde66e Todd Kjos     2017-06-29  890  {
0c972a05cde66e Todd Kjos     2017-06-29  891  	struct rb_node *n;
0c972a05cde66e Todd Kjos     2017-06-29  892  	int buffers, page_count;
74310e06be4d74 Sherry Yang   2017-08-23  893  	struct binder_buffer *buffer;
0c972a05cde66e Todd Kjos     2017-06-29  894  
0c972a05cde66e Todd Kjos     2017-06-29  895  	buffers = 0;
0c972a05cde66e Todd Kjos     2017-06-29  896  	mutex_lock(&alloc->mutex);
c0fd2101781ef7 Carlos Llamas 2023-05-02  897  	BUG_ON(alloc->vma);
da1b9564e85b1d Minchan Kim   2018-08-23  898  
0c972a05cde66e Todd Kjos     2017-06-29  899  	while ((n = rb_first(&alloc->allocated_buffers))) {
0c972a05cde66e Todd Kjos     2017-06-29  900  		buffer = rb_entry(n, struct binder_buffer, rb_node);
0c972a05cde66e Todd Kjos     2017-06-29  901  
0c972a05cde66e Todd Kjos     2017-06-29  902  		/* Transaction should already have been freed */
0c972a05cde66e Todd Kjos     2017-06-29  903  		BUG_ON(buffer->transaction);
0c972a05cde66e Todd Kjos     2017-06-29  904  
0f966cba95c780 Todd Kjos     2020-11-20  905  		if (buffer->clear_on_free) {
0f966cba95c780 Todd Kjos     2020-11-20  906  			binder_alloc_clear_buf(alloc, buffer);
0f966cba95c780 Todd Kjos     2020-11-20  907  			buffer->clear_on_free = false;
0f966cba95c780 Todd Kjos     2020-11-20  908  		}
0c972a05cde66e Todd Kjos     2017-06-29  909  		binder_free_buf_locked(alloc, buffer);
0c972a05cde66e Todd Kjos     2017-06-29  910  		buffers++;
0c972a05cde66e Todd Kjos     2017-06-29  911  	}
0c972a05cde66e Todd Kjos     2017-06-29  912  
74310e06be4d74 Sherry Yang   2017-08-23  913  	while (!list_empty(&alloc->buffers)) {
74310e06be4d74 Sherry Yang   2017-08-23  914  		buffer = list_first_entry(&alloc->buffers,
74310e06be4d74 Sherry Yang   2017-08-23  915  					  struct binder_buffer, entry);
74310e06be4d74 Sherry Yang   2017-08-23  916  		WARN_ON(!buffer->free);
74310e06be4d74 Sherry Yang   2017-08-23  917  
74310e06be4d74 Sherry Yang   2017-08-23  918  		list_del(&buffer->entry);
74310e06be4d74 Sherry Yang   2017-08-23  919  		WARN_ON_ONCE(!list_empty(&alloc->buffers));
74310e06be4d74 Sherry Yang   2017-08-23  920  		kfree(buffer);
74310e06be4d74 Sherry Yang   2017-08-23  921  	}
74310e06be4d74 Sherry Yang   2017-08-23  922  
0c972a05cde66e Todd Kjos     2017-06-29  923  	page_count = 0;
0c972a05cde66e Todd Kjos     2017-06-29  924  	if (alloc->pages) {
0c972a05cde66e Todd Kjos     2017-06-29  925  		int i;
0c972a05cde66e Todd Kjos     2017-06-29  926  
0c972a05cde66e Todd Kjos     2017-06-29  927  		for (i = 0; i < alloc->buffer_size / PAGE_SIZE; i++) {
75a48789c74b70 Carlos Llamas 2023-12-01 @928  			unsigned long page_addr;
f2517eb76f1f2f Sherry Yang   2017-08-23  929  			bool on_lru;
0c972a05cde66e Todd Kjos     2017-06-29  930  
f2517eb76f1f2f Sherry Yang   2017-08-23  931  			if (!alloc->pages[i].page_ptr)
0c972a05cde66e Todd Kjos     2017-06-29  932  				continue;
0c972a05cde66e Todd Kjos     2017-06-29  933  
22cb56b47ef1c1 Carlos Llamas 2023-12-01  934  			on_lru = list_lru_del(&binder_freelist,
f2517eb76f1f2f Sherry Yang   2017-08-23  935  					      &alloc->pages[i].lru);
0c972a05cde66e Todd Kjos     2017-06-29  936  			page_addr = alloc->buffer + i * PAGE_SIZE;
0c972a05cde66e Todd Kjos     2017-06-29  937  			binder_alloc_debug(BINDER_DEBUG_BUFFER_ALLOC,
b141d65e83aa93 Carlos Llamas 2023-12-01  938  				     "%s: %d: page %d %s\n",
b141d65e83aa93 Carlos Llamas 2023-12-01  939  				     __func__, alloc->pid, i,
f2517eb76f1f2f Sherry Yang   2017-08-23  940  				     on_lru ? "on lru" : "active");
f2517eb76f1f2f Sherry Yang   2017-08-23  941  			__free_page(alloc->pages[i].page_ptr);
0c972a05cde66e Todd Kjos     2017-06-29  942  			page_count++;
0c972a05cde66e Todd Kjos     2017-06-29  943  		}
0c972a05cde66e Todd Kjos     2017-06-29  944  		kfree(alloc->pages);
0c972a05cde66e Todd Kjos     2017-06-29  945  	}
0c972a05cde66e Todd Kjos     2017-06-29  946  	mutex_unlock(&alloc->mutex);
e66b77e5052284 Carlos Llamas 2022-09-06  947  	if (alloc->mm)
e66b77e5052284 Carlos Llamas 2022-09-06  948  		mmdrop(alloc->mm);
0c972a05cde66e Todd Kjos     2017-06-29  949  
0c972a05cde66e Todd Kjos     2017-06-29  950  	binder_alloc_debug(BINDER_DEBUG_OPEN_CLOSE,
0c972a05cde66e Todd Kjos     2017-06-29  951  		     "%s: %d buffers %d, pages %d\n",
0c972a05cde66e Todd Kjos     2017-06-29  952  		     __func__, alloc->pid, buffers, page_count);
0c972a05cde66e Todd Kjos     2017-06-29  953  }
0c972a05cde66e Todd Kjos     2017-06-29  954  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
