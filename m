Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1211DF988
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 23:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733183482; cv=none; b=VHXTpgruZ+jbSoR1CRRDwXP3SP8T06piuQfjYFDUi5gNIP+4d2JoWQLSaZ5OlrfpumySSGkw2LZJZ2KGLy8pcqcYoayDvjAT0ZVTFBzjpkTWWeEe6dzRSWb+3IPPZJpx+fGAiq9wbt0srg5ZfypfK/UFNo5fzhuD5r0yxsKDojc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733183482; c=relaxed/simple;
	bh=lMzHAVxu5QQEKue9NP4Qsy4ldMhVgr8+fQmGReX/L7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OqoKLWnlBGmP9jGaVhCFM3ie8lsmXhN7hiqXHANZ+gVQxFDVv58Wnd5J39bdXuAnEup4QTE5kkx122uabPCA/hO0SXewiiJGeorMDTwNgNO7XtvEmU7OdVqwLpZlRaDRbu7Zxbxkb9iUr6Jz3ua9rl/fiR1qDdULid+F9Bc+COA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHuLUFHs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHuLUFHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733183480; x=1764719480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lMzHAVxu5QQEKue9NP4Qsy4ldMhVgr8+fQmGReX/L7M=;
  b=PHuLUFHslvj2wP2YvQXKdz8y5NJu6HiPDU6hWOoinFF6to3bYAQcMmUI
   By6jCmAFos0w8iuAF0pPzRsW6yD52F8JPoDgqopZ8jgaGP+BCVAFNaVl3
   E4Z3nF9LW6m1fo9SPyUsaC3fYiOQQ8RTkPTVKI6H8YqomiqI+RY3e/grg
   mf3eo6qDZy6DEMZHbp+JsBTYAGEzWntvzjDc1fxkqlWbg9XyLE+g0A3SY
   Bj4J9NpcSsfPQ4OyxSObKBRiQY9btmd6Jz7tvC8QbtrZO7jihPMRmCVgp
   qnyRw/+urD5e2leIvbrrEH+BozezBfTTQ5vbJ5b6n/y2CN3UQ3apz7UIG
   Q==;
X-CSE-ConnectionGUID: GE/WbKj0TrW7oNeJj9PqwQ==
X-CSE-MsgGUID: KkGMpbg0QuKuiBbgRsTIdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37313894"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="37313894"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 15:51:19 -0800
X-CSE-ConnectionGUID: iNZxTMmWSCmDTw0xOwhVBA==
X-CSE-MsgGUID: FBb+J6nZTM+SXSN20wOcmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="97325707"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2024 15:51:18 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIGCC-00031x-0W;
	Mon, 02 Dec 2024 23:51:16 +0000
Date: Tue, 3 Dec 2024 07:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:shrunk-page 59/59] kernel/events/core.c:6306:18:
 error: 'struct page' has no member named 'index'
Message-ID: <202412030746.gJlU0aJj-lkp@intel.com>
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
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20241203/202412030746.gJlU0aJj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030746.gJlU0aJj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030746.gJlU0aJj-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/events/core.c: In function 'perf_mmap_fault':
>> kernel/events/core.c:6306:18: error: 'struct page' has no member named 'index'
    6306 |         vmf->page->index   = vmf->pgoff;
         |                  ^~


vim +6306 kernel/events/core.c

37d81828385f8ff kernel/perf_counter.c Paul Mackerras          2009-03-23  6279  
9e3ed2d7597ccbc kernel/events/core.c  Souptick Joarder        2018-05-21  6280  static vm_fault_t perf_mmap_fault(struct vm_fault *vmf)
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6281  {
11bac80004499ea kernel/events/core.c  Dave Jiang              2017-02-24  6282  	struct perf_event *event = vmf->vma->vm_file->private_data;
56de4e8f9146680 kernel/events/core.c  Steven Rostedt (VMware  2019-12-13  6283) 	struct perf_buffer *rb;
9e3ed2d7597ccbc kernel/events/core.c  Souptick Joarder        2018-05-21  6284  	vm_fault_t ret = VM_FAULT_SIGBUS;
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6285  
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6286  	if (vmf->flags & FAULT_FLAG_MKWRITE) {
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6287  		if (vmf->pgoff == 0)
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6288  			ret = 0;
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6289  		return ret;
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6290  	}
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6291  
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6292  	rcu_read_lock();
76369139ceb955d kernel/events/core.c  Frederic Weisbecker     2011-05-19  6293  	rb = rcu_dereference(event->rb);
76369139ceb955d kernel/events/core.c  Frederic Weisbecker     2011-05-19  6294  	if (!rb)
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6295  		goto unlock;
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6296  
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6297  	if (vmf->pgoff && (vmf->flags & FAULT_FLAG_WRITE))
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6298  		goto unlock;
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6299  
76369139ceb955d kernel/events/core.c  Frederic Weisbecker     2011-05-19  6300  	vmf->page = perf_mmap_to_page(rb, vmf->pgoff);
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6301  	if (!vmf->page)
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6302  		goto unlock;
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6303  
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6304  	get_page(vmf->page);
11bac80004499ea kernel/events/core.c  Dave Jiang              2017-02-24  6305  	vmf->page->mapping = vmf->vma->vm_file->f_mapping;
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21 @6306  	vmf->page->index   = vmf->pgoff;
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6307  
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6308  	ret = 0;
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6309  unlock:
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6310  	rcu_read_unlock();
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6311  
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6312  	return ret;
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6313  }
906010b2134e14a kernel/perf_event.c   Peter Zijlstra          2009-09-21  6314  

:::::: The code at line 6306 was first introduced by commit
:::::: 906010b2134e14a2e377decbadd357b3d0ab9c6a perf_event: Provide vmalloc() based mmap() backing

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
