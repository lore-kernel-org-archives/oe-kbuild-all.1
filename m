Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DD218CBF2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 11:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741952865; cv=none; b=qMmfdvDW27zLoHx8xUUxBpKNkGnTlTzY1oHbBoPHvJYSCxYoeavXWu0jSaavNfBpYZXRQy039G02n20tFScyrayD//PLlhaLVld6qShdmVhR11nMtDD42L/7OebR9HnDDBU+JxPgj0LoB7NKATx87ASaMlJvvDfwwX4wFxiFDns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741952865; c=relaxed/simple;
	bh=4FKAj4gQHSfmpobZ0liejnue0lo36JiuaqVsepiSW6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a1Jo5nIC4r8uIvB00BKELHSoSe6z4OZ4v8zZ5yxCA8/8l3xlJd20r/J+XzW2UHm/v7od3V8X6zEACefuZluuBHQ75owa7LymsGz1dxtuGVtN54kYKdzAChrGjwBbndOPFVZah61yeGGbw/oqMhU2VN8HSUBmsMMc5bvL0WmuZ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzA7CYzP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzA7CYzP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741952864; x=1773488864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4FKAj4gQHSfmpobZ0liejnue0lo36JiuaqVsepiSW6o=;
  b=FzA7CYzPSaONp6d7P8LNWsPTIBW7bYE/DMrSIm7DKI2FZj3joUvUDgdT
   cMOzpWsA4FZ4avy0+W90IHdCDJ8I7GO6cp48z1Nq51RYWmVt+LtFiVXTn
   v8uHMN7kRFCYVET0WuXr3h1OUbX0Y2Pki+HkidCCWwUdfy0sXnFCDGFFn
   Q+hzdDoPHEaxecjG4dL+RzijK7MWU5lnIgwo+oCyb77f6EOaYrc+8ibn5
   NYalSR9aNcj+RjU5yzh2i0NHRJmfAudp/okQDUS2UoBFKK+nPS/LfNDk5
   EytjuTk+0/h7o1jOuweXOFAw0zuJXqvkpfDcuSDmgog2ydr1QCaQcoX0F
   w==;
X-CSE-ConnectionGUID: GwJTpC2MTjGkXa8l4zz1hQ==
X-CSE-MsgGUID: DcoTObTmR4mapOkXgwhZ8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43007635"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43007635"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 04:47:43 -0700
X-CSE-ConnectionGUID: RntGnAmoS0KKZ7JhH9XBIA==
X-CSE-MsgGUID: JfREMOIqSqK6FqVjRDk4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126462567"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 14 Mar 2025 04:47:43 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt3Vr-000AOu-2o;
	Fri, 14 Mar 2025 11:47:39 +0000
Date: Fri, 14 Mar 2025 19:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 285/285] mm/page_alloc.c:224:1:
 sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it
 be static?
Message-ID: <202503141927.O06HgHcb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   68dd6028ac567502830def6a1e0daebe8c133402
commit: ccc915784332a8717d3fef84283c416c0e57d3d6 [285/285] ANDROID: cma: Add restrict_cma_redirect boot parameter
config: i386-randconfig-r123-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141927.O06HgHcb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141927.O06HgHcb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141927.O06HgHcb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_alloc.c:224:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
   mm/page_alloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:254:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c:1184:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:1184:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:1184:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:1184:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:3668:6: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:3801:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
   mm/page_alloc.c:1184:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:4006:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:5785:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block
   include/linux/page-flags.h:254:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:254:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:254:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:254:46: sparse: sparse: self-comparison always evaluates to false

vim +/restrict_cma_redirect +224 mm/page_alloc.c

   211	
 > 212	DEFINE_STATIC_KEY_TRUE(vm_numa_stat_key);
   213	
   214	/*
   215	 * By default, restrict_cma_redirect is set to true, so only MOVABLE allocations
   216	 * marked __GFP_CMA are eligible to be redirected to CMA region. These allocations
   217	 * are redirected if *any* free space is available in the CMA region.
   218	 * When restrict_cma_redirect is false, all movable allocations
   219	 * are eligible for redirection to CMA region (i.e movable allocations are
   220	 * not restricted from CMA region), when there is sufficient space there.
   221	 * (see __rmqueue()).
   222	 *
   223	 */
 > 224	DEFINE_STATIC_KEY_TRUE(restrict_cma_redirect);
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
