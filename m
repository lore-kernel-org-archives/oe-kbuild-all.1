Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5C4390CAD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211401; cv=none; b=ojd55XE+2OCQ8E5TxOI0UXEOr6sj/2R3PVaD5GTi3b/+IwdiY3VGAhNSaiCPF0bgJfNjPvqhhbUGJzCjACenDK+lxFuNvo/RGj11Q4QWqlFZJ22IHwSgxGFP2jnwAvTKNcLebrCsvTsW2/JEIoLVmf74bah18YhetXd5wTWwKJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211401; c=relaxed/simple;
	bh=zlVyks2Np9aQk5iEmOrB5Me5s80heOMsW2q1P0Pc6hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPN7V6amfxd/kt7kEKVCtYkGf6vO7HBMfQANMxrhV2Ah4w83N7n9n5TaFF7NBfBkNseADR88GPW+SdN05FSJ0p+UOnL1ycSSswFpMifytU44/MFuSzKKYALdBD1Xjda3dpx0Z1cFYdCkp5/4YRyY/IqwU9LeAwok7oYd+fgy+Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBN+FCYd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBN+FCYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775211396; x=1806747396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zlVyks2Np9aQk5iEmOrB5Me5s80heOMsW2q1P0Pc6hY=;
  b=VBN+FCYdrjrFdlzmhzOCUJAanCGuElzaL3vGqmO8nxQJzs0iYfyIyY9o
   X/3dpq03YMzhiiHe3naWWnnVfgfEHD+9JD9OPgRQoUsGDwwYqOtIlPTgz
   soitcvHd0E98tymOMm0wnQ+D/o/OmyYfMynJnmgJeI7NiDu+l2tM9XZvg
   SGaGno5sfGM7Ue0yq5FrZTpgxFWOHIJGJPC6oXLKTvHdscteP+9dilFQ2
   T73VtdVClD6UZDnSkiXldDE/1a2kbaJAR493lcQTtrv6mLhnuitjxQJHZ
   w9myzijjCTKKiAAcTOsBoUqxJ1y9zdPX2qIFroGgqfa8OFe519Xkp/zwh
   Q==;
X-CSE-ConnectionGUID: iHOo8L42QD2q5qBxYVGs7g==
X-CSE-MsgGUID: XNVDnVakQBiEV0GBLhYZPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76338217"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76338217"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 03:16:35 -0700
X-CSE-ConnectionGUID: FWZHu/aGQJewoPi3Dpx8ug==
X-CSE-MsgGUID: 0XvFpW2WTICgLDTLnuslTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="222867827"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 03 Apr 2026 03:16:33 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8bZm-000000009H1-2wBT;
	Fri, 03 Apr 2026 10:16:30 +0000
Date: Fri, 3 Apr 2026 12:15:42 +0200
From: kernel test robot <lkp@intel.com>
To: mpenttil@redhat.com, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v7 4/6] mm: setup device page migration in HMM pagewalk
Message-ID: <202604031253.Wm8UgWnQ-lkp@intel.com>
References: <20260330115611.347988-5-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330115611.347988-5-mpenttil@redhat.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7aaa8047eafd0bd628065b15757d9b48c5f9c07d]

url:    https://github.com/intel-lab-lkp/linux/commits/mpenttil-redhat-com/mm-Kconfig-changes-for-migrate-on-fault-for-device-pages/20260330-202258
base:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
patch link:    https://lore.kernel.org/r/20260330115611.347988-5-mpenttil%40redhat.com
patch subject: [PATCH v7 4/6] mm: setup device page migration in HMM pagewalk
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20260403/202604031253.Wm8UgWnQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031253.Wm8UgWnQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031253.Wm8UgWnQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/migrate_device.c:508:13: warning: 'migrate_vma_collect' defined but not used [-Wunused-function]
     508 | static void migrate_vma_collect(struct migrate_vma *migrate)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/migrate_vma_collect +508 mm/migrate_device.c

76cbbead253ddca Christoph Hellwig 2022-02-16  499  
76cbbead253ddca Christoph Hellwig 2022-02-16  500  /*
76cbbead253ddca Christoph Hellwig 2022-02-16  501   * migrate_vma_collect() - collect pages over a range of virtual addresses
76cbbead253ddca Christoph Hellwig 2022-02-16  502   * @migrate: migrate struct containing all migration information
76cbbead253ddca Christoph Hellwig 2022-02-16  503   *
76cbbead253ddca Christoph Hellwig 2022-02-16  504   * This will walk the CPU page table. For each virtual address backed by a
76cbbead253ddca Christoph Hellwig 2022-02-16  505   * valid page, it updates the src array and takes a reference on the page, in
76cbbead253ddca Christoph Hellwig 2022-02-16  506   * order to pin the page until we lock it and unmap it.
76cbbead253ddca Christoph Hellwig 2022-02-16  507   */
76cbbead253ddca Christoph Hellwig 2022-02-16 @508  static void migrate_vma_collect(struct migrate_vma *migrate)
76cbbead253ddca Christoph Hellwig 2022-02-16  509  {
76cbbead253ddca Christoph Hellwig 2022-02-16  510  	struct mmu_notifier_range range;
76cbbead253ddca Christoph Hellwig 2022-02-16  511  
76cbbead253ddca Christoph Hellwig 2022-02-16  512  	/*
76cbbead253ddca Christoph Hellwig 2022-02-16  513  	 * Note that the pgmap_owner is passed to the mmu notifier callback so
76cbbead253ddca Christoph Hellwig 2022-02-16  514  	 * that the registered device driver can skip invalidating device
76cbbead253ddca Christoph Hellwig 2022-02-16  515  	 * private page mappings that won't be migrated.
76cbbead253ddca Christoph Hellwig 2022-02-16  516  	 */
76cbbead253ddca Christoph Hellwig 2022-02-16  517  	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_MIGRATE, 0,
7d4a8be0c4b2b7f Alistair Popple   2023-01-10  518  		migrate->vma->vm_mm, migrate->start, migrate->end,
76cbbead253ddca Christoph Hellwig 2022-02-16  519  		migrate->pgmap_owner);
76cbbead253ddca Christoph Hellwig 2022-02-16  520  	mmu_notifier_invalidate_range_start(&range);
76cbbead253ddca Christoph Hellwig 2022-02-16  521  
76cbbead253ddca Christoph Hellwig 2022-02-16  522  	walk_page_range(migrate->vma->vm_mm, migrate->start, migrate->end,
76cbbead253ddca Christoph Hellwig 2022-02-16  523  			&migrate_vma_walk_ops, migrate);
76cbbead253ddca Christoph Hellwig 2022-02-16  524  
76cbbead253ddca Christoph Hellwig 2022-02-16  525  	mmu_notifier_invalidate_range_end(&range);
76cbbead253ddca Christoph Hellwig 2022-02-16  526  	migrate->end = migrate->start + (migrate->npages << PAGE_SHIFT);
76cbbead253ddca Christoph Hellwig 2022-02-16  527  }
76cbbead253ddca Christoph Hellwig 2022-02-16  528  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
