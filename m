Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D461351FBA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651336; cv=none; b=EyIPTF2+QMb4Ik0jxS6mLSgjUxpurnVqvUTj/x/N5gOnAMuAqqPoP8k4vA077iI1OVWa9SvaG89x3DOXRj/T/5Ke9TjAWmpTOIYIRp+JKSpYbaT0KNngJsIRZ/j+CTAkUgWA/SP4UQcxWa+8/4biGt6ryUDzPCHgxmQ6758LNjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651336; c=relaxed/simple;
	bh=w6TwQck4RtZRaN5bhbwgxiKkgVxB7RKGVAekX7C+lhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLdy4WMKEqhq//2+Lk2RRXvM57XezyuIlemWyLbWrR1ElJwt+3LRZYDz3lPxxOr/APlcGCMO8vsCQRHVa47vZNRQ2S+xMYLPJc/nr1BFC8A9ixX10MHkMJPTMiiI6THrsmy4z/N2hYR4OFg+6pDrg3D5jL97OruyYp9gWxKv8tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ig8QfbEo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ig8QfbEo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763651320; x=1795187320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w6TwQck4RtZRaN5bhbwgxiKkgVxB7RKGVAekX7C+lhk=;
  b=ig8QfbEo6RzYT8iemVnJt3K+Rz+nm7o5A9WzuwcVTHl+AJKihI5e6II4
   pvG/48x9lmA0C27QnHXsq0XldwKKlMsu9OqYIrG06DHjd9P6fVgfvTmIc
   genOT9B7lYZE9yTVJBRRYCHfTlJkfkj4EHg7/1uLGmURbGH23H2vverQf
   8RtOjoCqVIRVy8cSTjEGN2OXrwFbJUPuVaJmAjjQQhxMD7K7sZzmHqP6x
   c0WzjiBYxabzTxcEY5Cx0iyuU5/xQZ5+FOrCthSHnlXSiRxoC1dpFws6x
   f1AuhKavdMgLb80am60tqnMKZfItGGeg10yHAFYAxw3cp7HAGEgU2h2V4
   A==;
X-CSE-ConnectionGUID: Z31LRJrlQFyKv8ixtOhMVw==
X-CSE-MsgGUID: mzng6kOeTuCEnA2nSwg52g==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77085124"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="77085124"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 07:08:34 -0800
X-CSE-ConnectionGUID: 8Ou1fJjxTwG9hXVmY0biCA==
X-CSE-MsgGUID: UaNGhiOURrSS5efMdFg1NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="190634335"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2025 07:08:27 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM6Gm-0004AN-1q;
	Thu, 20 Nov 2025 15:08:24 +0000
Date: Thu, 20 Nov 2025 23:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Balbir Singh <balbirs@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Ralph Campbell <rcampbell@nvidia.com>,
	Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v2] fixup: mm/huge_memory.c: introduce
 folio_split_unmapped
Message-ID: <202511202251.PCvSd2p2-lkp@intel.com>
References: <20251120134232.3588203-1-balbirs@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120134232.3588203-1-balbirs@nvidia.com>

Hi Balbir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20251120]
[cannot apply to drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/fixup-mm-huge_memory-c-introduce-folio_split_unmapped/20251120-214322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251120134232.3588203-1-balbirs%40nvidia.com
patch subject: [PATCH v2] fixup: mm/huge_memory.c: introduce folio_split_unmapped
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251120/202511202251.PCvSd2p2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511202251.PCvSd2p2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511202251.PCvSd2p2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:39:
>> include/linux/shmem_fs.h:160:13: warning: 'shmem_uncharge' defined but not used [-Wunused-function]
     160 | static void shmem_uncharge(struct inode *inode, long pages)
         |             ^~~~~~~~~~~~~~
--
   mm/shmem.c: In function '__shmem_file_setup':
   mm/shmem.c:5838:23: warning: unused variable 'flags' [-Wunused-variable]
    5838 |         unsigned long flags = (vm_flags & VM_NORESERVE) ? SHMEM_F_NORESERVE : 0;
         |                       ^~~~~
   In file included from mm/shmem.c:36:
   include/linux/shmem_fs.h: At top level:
>> include/linux/shmem_fs.h:160:13: warning: 'shmem_uncharge' defined but not used [-Wunused-function]
     160 | static void shmem_uncharge(struct inode *inode, long pages)
         |             ^~~~~~~~~~~~~~


vim +/shmem_uncharge +160 include/linux/shmem_fs.h

   159	
 > 160	static void shmem_uncharge(struct inode *inode, long pages)
   161	{
   162	}
   163	#endif
   164	extern unsigned long shmem_partial_swap_usage(struct address_space *mapping,
   165							pgoff_t start, pgoff_t end);
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
