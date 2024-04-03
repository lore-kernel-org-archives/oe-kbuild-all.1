Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AC04120B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 04:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712118912; cv=none; b=QPImpUQRZE6n1tqPOViGvoXB3qZi/NsfNarqU30budYHabWGG9dpl6SVSmNyRYvNJzTK6Hwlhib3YH2QuDFrQaueagTY8bBESmZtcPaudOwhkSnBsXH/tTBsj9Lly36Q6TN0tATQtqthKouDTMMN6H6joyaOO3PBR4LyfxCPO3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712118912; c=relaxed/simple;
	bh=NEdrXCmp4LJbc5vxFcusQXWayy/gp82Ne0MgBiJ+T48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJSLBgew6MAdlOFWJerTITATzs8DzVjPCGnwrk7H3ZJyUg0YUj+8hAitK2sAf3i4XanfYp05jSjSAoFZoi+McWJFhNTjIlIpxnrvTicOtH0Vp2JY5WUpnxBqdrEWgYcCllFy71nbj1/qGxuxMnj5QDsYUcisSt5Ftosr3QUfPT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ll4Pac2R; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ll4Pac2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712118909; x=1743654909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NEdrXCmp4LJbc5vxFcusQXWayy/gp82Ne0MgBiJ+T48=;
  b=Ll4Pac2RR2iIjT5uWzDMgAgQ9WHKfuoBQ637JmzMU4x4AUmDWgIEhYqy
   WZDmhptvocJMIrcVfv2lNL3LpZ6NhkmMN1XwUc/KMgG58HU3+2eGa14Io
   Peca0wPa/i+AJgNI4fpf6JElIcjsqf7tLjUYC3dyCm5jLaqZ9o5K4E0E+
   sr3tGIayx5sN0DZXPW/I3CboVWj52P+8l+nChSErk7XpCP8CQZjy7MoR1
   nZ5KTawujxAu9ZrnxejXmhrUaS3Vnqd2x/wYH5+IBm4ZecWGtsz4ZtuJ+
   s42JzbBsdO+9wrxalxJED/Fh3fDVGSUhkzgAD3UNPBgzFtlvjUlp1LiZf
   w==;
X-CSE-ConnectionGUID: JD/1Kg1PRQ6gsLneGwxOdg==
X-CSE-MsgGUID: uLhI41+wQoCJTQIf5wxamA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7199874"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7199874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 21:35:08 -0700
X-CSE-ConnectionGUID: SOxO27M9QwaNGb80xOLOIA==
X-CSE-MsgGUID: s3RuTdcuQ6aiJ3tYPMs8LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="22766015"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Apr 2024 21:35:06 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrsL2-0001s1-2M;
	Wed, 03 Apr 2024 04:35:04 +0000
Date: Wed, 3 Apr 2024 12:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [linux-next:master 2805/3504] mm/kasan/hw_tags.c:280:16: error:
 implicit declaration of function 'find_vm_area'; did you mean
 'find_vma_prev'?
Message-ID: <202404031246.aq5Yr5KO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   727900b675b749c40ba1f6669c7ae5eb7eb8e837
commit: 302519d9e80a7fbf2cf8d0b8961d491af648759f [2805/3504] asm-generic/io.h: kill vmalloc.h dependency
config: arm64-randconfig-r011-20220710 (https://download.01.org/0day-ci/archive/20240403/202404031246.aq5Yr5KO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031246.aq5Yr5KO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031246.aq5Yr5KO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/kasan/hw_tags.c: In function 'unpoison_vmalloc_pages':
>> mm/kasan/hw_tags.c:280:16: error: implicit declaration of function 'find_vm_area'; did you mean 'find_vma_prev'? [-Werror=implicit-function-declaration]
     280 |         area = find_vm_area((void *)addr);
         |                ^~~~~~~~~~~~
         |                find_vma_prev
>> mm/kasan/hw_tags.c:280:14: warning: assignment to 'struct vm_struct *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     280 |         area = find_vm_area((void *)addr);
         |              ^
>> mm/kasan/hw_tags.c:284:29: error: invalid use of undefined type 'struct vm_struct'
     284 |         for (i = 0; i < area->nr_pages; i++) {
         |                             ^~
   mm/kasan/hw_tags.c:285:41: error: invalid use of undefined type 'struct vm_struct'
     285 |                 struct page *page = area->pages[i];
         |                                         ^~
   cc1: some warnings being treated as errors


vim +280 mm/kasan/hw_tags.c

23689e91fb22c1 Andrey Konovalov 2022-03-24  269  
23689e91fb22c1 Andrey Konovalov 2022-03-24  270  static void unpoison_vmalloc_pages(const void *addr, u8 tag)
23689e91fb22c1 Andrey Konovalov 2022-03-24  271  {
23689e91fb22c1 Andrey Konovalov 2022-03-24  272  	struct vm_struct *area;
23689e91fb22c1 Andrey Konovalov 2022-03-24  273  	int i;
23689e91fb22c1 Andrey Konovalov 2022-03-24  274  
23689e91fb22c1 Andrey Konovalov 2022-03-24  275  	/*
23689e91fb22c1 Andrey Konovalov 2022-03-24  276  	 * As hardware tag-based KASAN only tags VM_ALLOC vmalloc allocations
23689e91fb22c1 Andrey Konovalov 2022-03-24  277  	 * (see the comment in __kasan_unpoison_vmalloc), all of the pages
23689e91fb22c1 Andrey Konovalov 2022-03-24  278  	 * should belong to a single area.
23689e91fb22c1 Andrey Konovalov 2022-03-24  279  	 */
23689e91fb22c1 Andrey Konovalov 2022-03-24 @280  	area = find_vm_area((void *)addr);
23689e91fb22c1 Andrey Konovalov 2022-03-24  281  	if (WARN_ON(!area))
23689e91fb22c1 Andrey Konovalov 2022-03-24  282  		return;
23689e91fb22c1 Andrey Konovalov 2022-03-24  283  
23689e91fb22c1 Andrey Konovalov 2022-03-24 @284  	for (i = 0; i < area->nr_pages; i++) {
23689e91fb22c1 Andrey Konovalov 2022-03-24  285  		struct page *page = area->pages[i];
23689e91fb22c1 Andrey Konovalov 2022-03-24  286  
23689e91fb22c1 Andrey Konovalov 2022-03-24  287  		page_kasan_tag_set(page, tag);
23689e91fb22c1 Andrey Konovalov 2022-03-24  288  	}
23689e91fb22c1 Andrey Konovalov 2022-03-24  289  }
23689e91fb22c1 Andrey Konovalov 2022-03-24  290  

:::::: The code at line 280 was first introduced by commit
:::::: 23689e91fb22c15b84ac6c22ad9942039792f3af kasan, vmalloc: add vmalloc tagging for HW_TAGS

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
