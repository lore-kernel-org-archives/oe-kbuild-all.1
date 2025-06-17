Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB4928C5D2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 07:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144502; cv=none; b=SApTvxR1WBNBKVYNl2KsdqimWLVwiNXLKqnJ+oqQw6PtO+xMD8MOZTi9QHRt+U0OdzlVZ1PrMTumgImvuGVuqTVmPr4hsItk8/yCC2rlF65pOqajmFz5G2bwsHuNglUwCTkQzvJ/AtHfrSIzhjaggjfqBCxyOc+8wsRzg+tZMpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144502; c=relaxed/simple;
	bh=UKi3qftovoB+vcoIEPVWOZhRZGcG+y/SwYhvS9VP9Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzOL8T1ou5PkeLtvMCvcI5KjdgGPUpNs7XKp/c+cmRUuXH5h7yhjbQXco3AiL74MOdPEqbt9DdyEpiPq3TyOY2hntfr3FdPDPQ2CtwzsZ9Xbh6K+Ge5YvBnTbCjQGViKo+CvXt9y2XJ7Do7EvRCrQ7xruGiOngo5AVxw3TTTWWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HA2N3I8n; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HA2N3I8n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750144501; x=1781680501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UKi3qftovoB+vcoIEPVWOZhRZGcG+y/SwYhvS9VP9Y8=;
  b=HA2N3I8nfdktZ3Dza0VIE2vWWG8uIsv77mnaicOdf/r1yB3OuKaWAPbk
   bZhUnUiJeF3FPFVoNQAhUq9Vj/0+X24CUzjvDTrnrfbh0nxB8goV0eDgU
   usSCkdxFFvjBIjWagO1GVDr3liw3ejW7hSFJ6kaihce08GwKIISO+8GIQ
   5nrA6XpwSphJYtgsj+6zOBGALnTMXIF8H8Tr0u8yzskN1LWIeSYm+SF8a
   LlIrfRzf4q891Ex/BwEYEM1eMpSSzHZjkoqsukVVujuNBcbHNmYkiLXQJ
   3fu85OVI+7SXHHN2hsM9Einzc6E8KjrEtoxKXfsCB0Cd9OCWfc6wzrAMi
   A==;
X-CSE-ConnectionGUID: 38PlPSMoTbeDuXzM3NN6lg==
X-CSE-MsgGUID: wwAVz8DtQX6ze9wa706ZNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="74840963"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="74840963"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 00:14:59 -0700
X-CSE-ConnectionGUID: jarNe3CKSOm4QDJy9x2LcA==
X-CSE-MsgGUID: vp/g5Nr9TpeA05S0BdfMUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148536906"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2025 00:14:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRQX1-000FiC-2w;
	Tue, 17 Jun 2025 07:14:55 +0000
Date: Tue, 17 Jun 2025 15:14:43 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 09/10] fs: convert most other generic_file_*mmap() users
 to .mmap_prepare()
Message-ID: <202506171549.9dcTuFoR-lkp@intel.com>
References: <08db85970d89b17a995d2cffae96fb4cc462377f.1750099179.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08db85970d89b17a995d2cffae96fb4cc462377f.1750099179.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on cifs/for-next linus/master v6.16-rc2 next-20250616]
[cannot apply to brauner-vfs/vfs.all trondmy-nfs/linux-next ceph-client/testing ceph-client/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-rename-call_mmap-mmap_prepare-to-vfs_mmap-mmap_prepare/20250617-033629
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/08db85970d89b17a995d2cffae96fb4cc462377f.1750099179.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH 09/10] fs: convert most other generic_file_*mmap() users to .mmap_prepare()
config: i386-buildonly-randconfig-004-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171549.9dcTuFoR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171549.9dcTuFoR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171549.9dcTuFoR-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ubifs/file.c: In function 'ubifs_file_mmap_prepare':
>> fs/ubifs/file.c:1589:9: error: 'vma' undeclared (first use in this function); did you mean 'vmap'?
    1589 |         vma->vm_ops = &ubifs_file_vm_ops;
         |         ^~~
         |         vmap
   fs/ubifs/file.c:1589:9: note: each undeclared identifier is reported only once for each function it appears in


vim +1589 fs/ubifs/file.c

1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1581  
de03a8cfdadf57d Lorenzo Stoakes  2025-06-16  1582  static int ubifs_file_mmap_prepare(struct vm_area_desc *desc)
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1583  {
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1584  	int err;
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1585  
de03a8cfdadf57d Lorenzo Stoakes  2025-06-16  1586  	err = generic_file_mmap_prepare(desc);
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1587  	if (err)
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1588  		return err;
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14 @1589  	vma->vm_ops = &ubifs_file_vm_ops;
e3d73dead4988f3 Sascha Hauer     2019-03-26  1590  
e3d73dead4988f3 Sascha Hauer     2019-03-26  1591  	if (IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
de03a8cfdadf57d Lorenzo Stoakes  2025-06-16  1592  		file_accessed(desc->file);
e3d73dead4988f3 Sascha Hauer     2019-03-26  1593  
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1594  	return 0;
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1595  }
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1596  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
