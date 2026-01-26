Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3295B23B61E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 18:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769453370; cv=none; b=hhusd31V4GWeZx6qch3Rq8XZPHn8N2rVSrBilbEE0iZBB1nZ93kj2eJH+/5dTYLmEH/90iyNDd9OSfi6Iu5iQP9aAg77A47ww7ijmvnSvDRDlYXoLYuSB6l59ZXST9rsfGLexpMtFbfsAO+iThyBo/HKxAiqIHH3xomQ8YUkGdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769453370; c=relaxed/simple;
	bh=WKcCQES3mYtDjO4J/0l2Kt2HUss61JpG/oWxVVOyp6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNc5zJbeB5lNtIu4AMo3i8+GUzl0k5cVuSQgVFSHfyqin+ogyCxx8hSs6Fb5sHhU9eNF26g/oX9Oh7PP41YeV82+69BdYJPJ5CgBOOShTg1eP6ijda3Klr5ueGhe4wE4CfqghhMc5Cke0HQKkL9ARAx8LEnngQzKgKz4Un/CvUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaoNmEPv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaoNmEPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769453368; x=1800989368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WKcCQES3mYtDjO4J/0l2Kt2HUss61JpG/oWxVVOyp6Q=;
  b=LaoNmEPvOStswbPI/HhhkGT3z+0Q3xaHAOCoY3E1bRzMcLmFYvlRP4En
   Q8f07dEHByMgZzAwvjFiAd5Hcj/VL4t5aLA4i3kpCJF0B0QhxMfdjWxyD
   L7kI7folIztwtU4GOZvjmYulkXlhosyFldwJKhk0ea/fYB2upAOSq0j/J
   rI9d16zWrVQoinO/HemVcQAynZxdy/gM92Fe0TYFb+tlJnACmkt2G//21
   RueAEd6De7BqzFkRT4Y3dEP8UXFxWs2FVnjA3A811UxEW2nhQZ2yXQJhh
   L1FzDdpk07PGAAbBVFxXN6vdJ05u2Yh1blspQ1ui3ovlRkFO93fIV9Y3o
   w==;
X-CSE-ConnectionGUID: rw6KpnZ/R1C1buILV01JKg==
X-CSE-MsgGUID: w5ByctksT7uhQvxcQEdqmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96100237"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="96100237"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 10:49:27 -0800
X-CSE-ConnectionGUID: lV6W8uJ5TOq52Cdv2LsI7Q==
X-CSE-MsgGUID: GVy41TOAS/q2/EtW8G/9PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207361133"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jan 2026 10:49:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkReM-00000000Xay-3k1R;
	Mon, 26 Jan 2026 18:49:22 +0000
Date: Tue, 27 Jan 2026 02:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: mpenttil@redhat.com, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 1/3] mm: unified hmm fault and migrate device pagewalk
 paths
Message-ID: <202601270203.n7gikUG0-lkp@intel.com>
References: <20260126111939.1332983-2-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126111939.1332983-2-mpenttil@redhat.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/mpenttil-redhat-com/mm-unified-hmm-fault-and-migrate-device-pagewalk-paths/20260126-192236
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260126111939.1332983-2-mpenttil%40redhat.com
patch subject: [PATCH v3 1/3] mm: unified hmm fault and migrate device pagewalk paths
config: x86_64-randconfig-005-20260126 (https://download.01.org/0day-ci/archive/20260127/202601270203.n7gikUG0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270203.n7gikUG0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270203.n7gikUG0-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hmm.c: In function 'hmm_vma_capture_migrate_range':
>> mm/hmm.c:927:37: error: 'struct mmu_notifier_range' has no member named 'owner'
     927 |         if (!hmm_vma_walk->mmu_range.owner) {
         |                                     ^
   mm/hmm.c: In function 'hmm_range_fault':
   mm/hmm.c:1343:38: error: implicit declaration of function 'mmu_interval_check_retry' [-Wimplicit-function-declaration]
    1343 |                 if (is_fault_path && mmu_interval_check_retry(range->notifier,
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:1361:35: error: 'struct mmu_notifier_range' has no member named 'owner'
    1361 |             hmm_vma_walk.mmu_range.owner) {
         |                                   ^


vim +927 mm/hmm.c

   906	
   907	static int hmm_vma_capture_migrate_range(unsigned long start,
   908						 unsigned long end,
   909						 struct mm_walk *walk)
   910	{
   911		struct hmm_vma_walk *hmm_vma_walk = walk->private;
   912		struct hmm_range *range = hmm_vma_walk->range;
   913	
   914		if (!hmm_select_migrate(range))
   915			return 0;
   916	
   917		if (hmm_vma_walk->vma && (hmm_vma_walk->vma != walk->vma))
   918			return -ERANGE;
   919	
   920		hmm_vma_walk->vma = walk->vma;
   921		hmm_vma_walk->start = start;
   922		hmm_vma_walk->end = end;
   923	
   924		if (end - start > range->end - range->start)
   925			return -ERANGE;
   926	
 > 927		if (!hmm_vma_walk->mmu_range.owner) {
   928			mmu_notifier_range_init_owner(&hmm_vma_walk->mmu_range, MMU_NOTIFY_MIGRATE, 0,
   929						      walk->vma->vm_mm, start, end,
   930						      range->dev_private_owner);
   931			mmu_notifier_invalidate_range_start(&hmm_vma_walk->mmu_range);
   932		}
   933	
   934		return 0;
   935	}
   936	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
