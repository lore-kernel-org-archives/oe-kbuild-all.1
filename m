Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA1126B74A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 23:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765583385; cv=none; b=RNXjVdwpRJH49nTCj9w+G8uMapMzdyV6T0aqgAF8Djk+MrngEUztZw2s4IpT1pPHNgbQB7s260EcXcqdprsorZLlij+9CMqlwfF3MzgVUvdKtqkI0y12kORVIIijjFbJzgzMat5w4Q74Bia3b+AxBI3PaITDNR2IfHyw9H/GgJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765583385; c=relaxed/simple;
	bh=llElXcsnZWix8ZIAusK2DFqvLisb+TcM2fq2wQE0EDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iYubflf2pQL9rVYJAPu8L4TqsjFq/WBv6CmYxvZgaL+MWOxvD0n9EgOnUEItZ0mAmC7xvwfFQvmFhIFjHjI+0FOKMeKC2tuAoEXiECaY8WAtmUtrCSAvO59MXue+tIyQFb4KC8X9m3BkcOtYI+8+VnlQ/GF+TmYMaP4T2mVRLNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V50JF3mH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V50JF3mH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765583384; x=1797119384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=llElXcsnZWix8ZIAusK2DFqvLisb+TcM2fq2wQE0EDI=;
  b=V50JF3mHLvq3A9a5awPIm+T1ALG12QbKTPKahwJ0CF11F255aHauJyuz
   C3iFSC/NXgFsBB3P7/1L/XfacJIB646p4qN+D8vBozpFaKkBrw/UxiElp
   ZBhBNjtY6SFXZ1J2QnjtwBo4BgVuKnjJPJOpfazgwCaSZ9b2qFnFEyv2j
   CUYEIFuh9MoNHMgkP3uAN8ZPsKNDSvwKMycQ5qHxWndK6Qy+1gi8UPzSu
   NbdaaKKPoeaBRtgSyJfEbxetqE8CtVrcZ6dDD9fRiRjJgr2Q6Rd8+ljfH
   xBB6K9Ie21e0derFkCBJUUN91rpIoKjiyboXwBLZY7DbkemmFAD5RQ03v
   A==;
X-CSE-ConnectionGUID: dkXSnOXvSMuRTYPnWD144Q==
X-CSE-MsgGUID: QA6uKtWaRmC6jJbT97vtCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71217367"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="71217367"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 15:49:43 -0800
X-CSE-ConnectionGUID: pqizTq8bTuSwMotfqjgFig==
X-CSE-MsgGUID: MQOYH8t1QrOwZYwQLNf3GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196822695"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Dec 2025 15:49:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUCtG-000000006mz-0QI1;
	Fri, 12 Dec 2025 23:49:38 +0000
Date: Sat, 13 Dec 2025 07:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 drivers/android/binder_alloc.c:928:18: warning: variable 'page_addr' set but
 not used
Message-ID: <202512130740.DzlvftrA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   2181735221bd1c406227acf4026408700af09ceb
commit: 112ca28d2657361beac34272c4f9551be7a6d3cf [1/1] UPSTREAM: binder: avoid user addresses in debug logs
config: i386-randconfig-053-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130740.DzlvftrA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130740.DzlvftrA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130740.DzlvftrA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/android/binder_alloc.c:928:18: warning: variable 'page_addr' set but not used [-Wunused-but-set-variable]
     928 |                         unsigned long page_addr;
         |                                       ^
   1 warning generated.


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
3cac174682291f Carlos Llamas 2023-05-02  897  	BUG_ON(alloc->vma);
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
b66dacff3db812 Carlos Llamas 2023-12-01 @928  			unsigned long page_addr;
f2517eb76f1f2f Sherry Yang   2017-08-23  929  			bool on_lru;
0c972a05cde66e Todd Kjos     2017-06-29  930  
f2517eb76f1f2f Sherry Yang   2017-08-23  931  			if (!alloc->pages[i].page_ptr)
0c972a05cde66e Todd Kjos     2017-06-29  932  				continue;
0c972a05cde66e Todd Kjos     2017-06-29  933  
19d966c1c6c3dd Carlos Llamas 2023-12-01  934  			on_lru = list_lru_del(&binder_freelist,
f2517eb76f1f2f Sherry Yang   2017-08-23  935  					      &alloc->pages[i].lru);
0c972a05cde66e Todd Kjos     2017-06-29  936  			page_addr = alloc->buffer + i * PAGE_SIZE;
0c972a05cde66e Todd Kjos     2017-06-29  937  			binder_alloc_debug(BINDER_DEBUG_BUFFER_ALLOC,
112ca28d265736 Carlos Llamas 2023-12-01  938  				     "%s: %d: page %d %s\n",
112ca28d265736 Carlos Llamas 2023-12-01  939  				     __func__, alloc->pid, i,
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

:::::: The code at line 928 was first introduced by commit
:::::: b66dacff3db81260bda82f588fe00f31fb605051 UPSTREAM: binder: keep vma addresses type as unsigned long

:::::: TO: Carlos Llamas <cmllamas@google.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
