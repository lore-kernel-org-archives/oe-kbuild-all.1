Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7164A285074
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 02:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768529081; cv=none; b=uZubb6he0stSSBKwiEgr3sfFzwEt8KXYwOD8DzEkNjq26BbbmY43DBWLVyRTwd0AI8LIKUyY35qgjFeJxGn10uk2joFCJMTl3kk/AKb3C8ggm9t2moiS6ognBoO6CYHZEkB6UPkGMWgBOS690t5Ss+YsweNCEZosIvWHWCxAy70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768529081; c=relaxed/simple;
	bh=FSR96mvqfYKhN3guEUKfYNC/qmzApNrx81Q7cdUp94c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECGYcBmh/PQOKNh10RcqSS/40uBEtSS9PkSGV7ILfHAwPFVltZPG4So3bQGle7wJ1c9sYCYgEWDiUTxi6G7sr9Otf5yOjBDr/XvgH7x1g8tdOJrvttCHvN1YUe9ZURWZjHQavVUpnq/aLJPu+F2eQNie2VKpr2nMYfCMZZ2UJZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3DsGlw1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3DsGlw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768529078; x=1800065078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FSR96mvqfYKhN3guEUKfYNC/qmzApNrx81Q7cdUp94c=;
  b=j3DsGlw1G3ygVDf5Yhn+Uj6Q9RvHTBFrhDk7Pt1hzZF5gMYhgxaFgSwF
   oPswU6IQhjgUumU7qdCLN4w6f3M7Pad73PSQ1WKbFNV/agfPl10RZCmeR
   cSWO5gB22k3xa6RhTb5z7RaoP0dwM/h34HI1lYXeDc0Szm+pqSzZ3oFS5
   2CfScnchLtIU5+PTjvonEZzFb46pBUdQ7dDDN+jsTJN1uC1BD3YOnueTf
   b96Y5vd6ROA3vahm0AqOJDJQMhMqYQPKajGBfX9VxP8OWs65nd7KvbXsX
   n/SZbPKcU4hQu3GQxwtKBm2/REg73vvTj0HG3VHejluhGtHkXXfgg52d6
   w==;
X-CSE-ConnectionGUID: EO91/zK6RwKKmtkw5OfshA==
X-CSE-MsgGUID: rCnWRZNXTvSELQxRkoAy3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87421310"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="87421310"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 18:04:36 -0800
X-CSE-ConnectionGUID: JRwRd9eZTZiNen7mrvf2qw==
X-CSE-MsgGUID: FyAMgUcFS7+XR40u+NaN+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="209257322"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jan 2026 18:04:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgZCO-00000000KFS-13La;
	Fri, 16 Jan 2026 02:04:28 +0000
Date: Fri, 16 Jan 2026 10:04:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>, shikemeng@huaweicloud.com,
	kasong@tencent.com, nphamcs@gmail.com, bhe@redhat.com,
	baohua@kernel.org, chrisl@kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [PATCH v2 08/10] mm/vma: Use unmap_desc in exit_mmap() and
 vms_clear_ptes()
Message-ID: <202601160925.VR8a2hUw-lkp@intel.com>
References: <20260115182720.1691130-9-Liam.Howlett@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115182720.1691130-9-Liam.Howlett@oracle.com>

Hi Liam,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.19-rc5 next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liam-R-Howlett/mm-mmap-Move-exit_mmap-trace-point/20260116-023126
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260115182720.1691130-9-Liam.Howlett%40oracle.com
patch subject: [PATCH v2 08/10] mm/vma: Use unmap_desc in exit_mmap() and vms_clear_ptes()
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260116/202601160925.VR8a2hUw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160925.VR8a2hUw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160925.VR8a2hUw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/internal.h:23,
                    from mm/filemap.c:54:
   mm/vma.h: In function 'unmap_all_init':
>> mm/vma.h:175:27: error: 'FIRST_USER_ADDRESS' undeclared (first use in this function)
     175 |         unmap->pg_start = FIRST_USER_ADDRESS;
         |                           ^~~~~~~~~~~~~~~~~~
   mm/vma.h:175:27: note: each undeclared identifier is reported only once for each function it appears in
>> mm/vma.h:176:25: error: 'USER_PGTABLES_CEILING' undeclared (first use in this function)
     176 |         unmap->pg_end = USER_PGTABLES_CEILING;
         |                         ^~~~~~~~~~~~~~~~~~~~~


vim +/FIRST_USER_ADDRESS +175 mm/vma.h

   169	
   170	static inline void unmap_all_init(struct unmap_desc *unmap,
   171			struct vma_iterator *vmi, struct vm_area_struct *vma)
   172	{
   173		unmap->mas = &vmi->mas;
   174		unmap->first = vma;
 > 175		unmap->pg_start = FIRST_USER_ADDRESS;
 > 176		unmap->pg_end = USER_PGTABLES_CEILING;
   177		unmap->vma_start = 0;
   178		unmap->vma_end = ULONG_MAX;
   179		unmap->tree_end = ULONG_MAX;
   180		unmap->tree_reset = vma->vm_end;
   181		unmap->mm_wr_locked = false;
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
