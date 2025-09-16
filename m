Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE650295DBD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758013909; cv=none; b=oszF0fPTO87e80DkO76PPEqrHu044mk057HG936MopTG4KDZkjmbUlWmLHs5z1U2qTsL5QdRPN3/0/pf8NTXjmH/5jGB+Takngnc6OIHfjFgcfEKSbUlmnKwMgWuTeRXGMnfWUz0njvek7EDmwoLZxEBz0mxlXFibZEzk87wuzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758013909; c=relaxed/simple;
	bh=KGS6xHvRHALnU+yVH6gbxm3FBFSO2w9dkDKMZYSuzQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ointEM070XFF+vXvE5py28PZhtSB1LvRe1+iMsimkbuzEZFcruEJSW7P9X9CFDeWk36Oi1h9wsX0qxYnY6iYnwDfWge4uUeS3YWhcTT6LKCpkc0veuYp6CgMnGApwJS4UYSF11cEc9Ero1uq+TEhC6jmHVRSuMBRaQbO9SGvzJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGegUwRE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGegUwRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758013908; x=1789549908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KGS6xHvRHALnU+yVH6gbxm3FBFSO2w9dkDKMZYSuzQQ=;
  b=EGegUwRErcGgQFfYt4T8DwBoqgSYlnyTb/ink9pEAl+mirO3LmbJ7GET
   kFB3DzfTAXGHaSh+hsNpZ+KFRdm4k2hWrS2BcTPDsuzDpNeg9OA1xuCis
   cGrLQ0bG/k72Pg0hbAFpTY+hXXQZZ4CdhYYxnGGEq5shJYhnBxi7ja+44
   vCXVAKCCt30bXRqOp2WF6md0AYOTshH35R58gpkyAocJvxjenhzKESpNh
   8PQFiYv42gazz7rx/fkp6wqFUOSYr9uMf3YOUivX/wHSijgmTqmxgq2B3
   qp0jti3dEVjTE1nI+9dFW3oboSTf+oyN3CnHfPK/4dTOLki8ZlFJgeHFB
   Q==;
X-CSE-ConnectionGUID: /d4TsvejTJq98cKTg7wxIw==
X-CSE-MsgGUID: LfSE4q+nTaGeqRml2czBew==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60233880"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60233880"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 02:11:47 -0700
X-CSE-ConnectionGUID: AJPUD1/RTxC3gONuqZe8SQ==
X-CSE-MsgGUID: 17UoQdQuRR6NEQgSBudLqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="212052853"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Sep 2025 02:11:40 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyRir-00008X-22;
	Tue, 16 Sep 2025 09:11:37 +0000
Date: Tue, 16 Sep 2025 17:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>, akpm@linux-foundation.org,
	minchan@kernel.org, lorenzo.stoakes@oracle.com, david@redhat.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, pfalcato@suse.de
Cc: oe-kbuild-all@lists.linux.dev, kernel-team@android.com,
	android-mm@google.com, Kalesh Singh <kaleshsingh@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Jann Horn <jannh@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 5/7] mm: harden vma_count against direct modification
Message-ID: <202509161708.EnaFVJbi-lkp@intel.com>
References: <20250915163838.631445-6-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915163838.631445-6-kaleshsingh@google.com>

Hi Kalesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on f83ec76bf285bea5727f478a68b894f5543ca76e]

url:    https://github.com/intel-lab-lkp/linux/commits/Kalesh-Singh/mm-fix-off-by-one-error-in-VMA-count-limit-checks/20250916-005018
base:   f83ec76bf285bea5727f478a68b894f5543ca76e
patch link:    https://lore.kernel.org/r/20250915163838.631445-6-kaleshsingh%40google.com
patch subject: [PATCH v2 5/7] mm: harden vma_count against direct modification
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250916/202509161708.EnaFVJbi-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161708.EnaFVJbi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509161708.EnaFVJbi-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/nommu.c: In function 'cleanup_vma_from_mm':
>> mm/nommu.c:579:30: error: decrement of read-only member 'vma_count'
     579 |         vma->vm_mm->vma_count--;
         |                              ^~
   mm/nommu.c: In function 'do_mmap':
>> mm/nommu.c:1201:31: error: increment of read-only member 'vma_count'
    1201 |         current->mm->vma_count++;
         |                               ^~
   mm/nommu.c: In function 'split_vma':
   mm/nommu.c:1369:22: error: increment of read-only member 'vma_count'
    1369 |         mm->vma_count++;
         |                      ^~


vim +/vma_count +579 mm/nommu.c

8220543df1489e Matthew Wilcox (Oracle  2022-09-06  576) 
8220543df1489e Matthew Wilcox (Oracle  2022-09-06  577) static void cleanup_vma_from_mm(struct vm_area_struct *vma)
8220543df1489e Matthew Wilcox (Oracle  2022-09-06  578) {
53045ecb29a61f Kalesh Singh            2025-09-15 @579  	vma->vm_mm->vma_count--;
^1da177e4c3f41 Linus Torvalds          2005-04-16  580  	/* remove the VMA from the mapping */
^1da177e4c3f41 Linus Torvalds          2005-04-16  581  	if (vma->vm_file) {
7964cf8caa4dfa Liam R. Howlett         2022-09-06  582  		struct address_space *mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  583  		mapping = vma->vm_file->f_mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  584  
83cde9e8ba95d1 Davidlohr Bueso         2014-12-12  585  		i_mmap_lock_write(mapping);
^1da177e4c3f41 Linus Torvalds          2005-04-16  586  		flush_dcache_mmap_lock(mapping);
6b2dbba8b6ac4d Michel Lespinasse       2012-10-08  587  		vma_interval_tree_remove(vma, &mapping->i_mmap);
^1da177e4c3f41 Linus Torvalds          2005-04-16  588  		flush_dcache_mmap_unlock(mapping);
83cde9e8ba95d1 Davidlohr Bueso         2014-12-12  589  		i_mmap_unlock_write(mapping);
^1da177e4c3f41 Linus Torvalds          2005-04-16  590  	}
8220543df1489e Matthew Wilcox (Oracle  2022-09-06  591) }
47d9644de92c1a Liam R. Howlett         2023-01-20  592  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
