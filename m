Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173E530DEB0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 03:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782961685; cv=none; b=XmEz7x6lwoICDuZZgh1aJ3tA45y1Togf7+I3f7uoGkWUVOK/X4Xv8aSN0jwA2dBCbVPPQmwxzaYM/XXn6lw1z1ewevXKqONdMBtvcUAXh7W6TyAw4kw9HW4/TmKPWXuXr37E6dFw2VeTkG7e4QAlKFblwE41p1Vu2PqaFeUaVxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782961685; c=relaxed/simple;
	bh=f/ioX1HrENMRjPiGv/fZZrikxRylQTUgGt+pXapfU7E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N/zHmMIULBjgVnpRof5VFy3Nq6d673bOKUCqeM4LLgxCtobeD6/5qiezwhuzfhpo0CTVnhPDcc5mvgtCJeqJpeRU22JjN6FqsHZgMyPriSzPamvrcoNj2zrP+Q8p/8rVWU2wU6uPCbWipQpjHNEBMNACLxYpIzt5XLLwMWzqx8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oI4SaUso; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oI4SaUso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782961685; x=1814497685;
  h=date:from:to:cc:subject:message-id;
  bh=f/ioX1HrENMRjPiGv/fZZrikxRylQTUgGt+pXapfU7E=;
  b=oI4SaUso+rACH1HvS/nd79YJM2xiIvWYTvsjqL3I/t7oM+8BAY5peELH
   6seeFhadMWlIGcRgjHdTLSodi8nTXDF4+3d17+3sYpwHbYrzFEw/EobIt
   ejuXaOgYmf77GiZUc6QFWLmf8GBetUeyNXFVAKPHOVNf57stZOBUbQdY5
   QrKhkv1Rgl28GoscTz4hii2rUIxuj/4dW/hLz2QB419yh3EQsvP/Q8e0N
   JNsxIi85FSbkTA2pSErgEzZfgktYtYOdD+YR316Gt+OWWaofUTNICveYt
   X4zdOBRkWF5brrLoaxrGj7Gpuo6/L8Nv6kj1bmMSReE+YxgPm37uVPS1r
   g==;
X-CSE-ConnectionGUID: L8Ruez+KQ42OFc5xFM7sCA==
X-CSE-MsgGUID: oNYygWX2S/CePVY7+NoSPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="101126900"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="101126900"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 20:08:04 -0700
X-CSE-ConnectionGUID: VY+FWvnOS/qvI+ZmzmZsfA==
X-CSE-MsgGUID: cogSlNJiSHmgl6kNSrRYPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="253394299"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Jul 2026 20:08:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf7mO-000000009vE-0k8F;
	Thu, 02 Jul 2026 03:07:57 +0000
Date: Thu, 02 Jul 2026 11:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] mm/page_alloc.c:1831:6:
 warning: no previous prototype for function 'prep_new_page'
Message-ID: <202607021102.PWyz2smJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Wenchao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   030ed2af4ba8ba50d5f3cbbc704bc93df568d84e
commit: f2c613bbd9ad3f09e4eb94bf541cdfb57423dcc9 [1/1] ANDROID: export symbol prep_new_page for vendor module
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260702/202607021102.PWyz2smJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021102.PWyz2smJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021102.PWyz2smJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:1831:6: warning: no previous prototype for function 'prep_new_page' [-Wmissing-prototypes]
    1831 | void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
         |      ^
   mm/page_alloc.c:1831:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1831 | void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/prep_new_page +1831 mm/page_alloc.c

  1830	
> 1831	void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
  1832								unsigned int alloc_flags)
  1833	{
  1834		post_alloc_hook(page, order, gfp_flags);
  1835	
  1836		if (order && (gfp_flags & __GFP_COMP))
  1837			prep_compound_page(page, order);
  1838	
  1839		/*
  1840		 * page is set pfmemalloc when ALLOC_NO_WATERMARKS was necessary to
  1841		 * allocate the page. The expectation is that the caller is taking
  1842		 * steps that will free more memory. The caller should avoid the page
  1843		 * being used for !PFMEMALLOC purposes.
  1844		 */
  1845		if (alloc_flags & ALLOC_NO_WATERMARKS)
  1846			set_page_pfmemalloc(page);
  1847		else
  1848			clear_page_pfmemalloc(page);
  1849		trace_android_vh_test_clear_look_around_ref(page);
  1850	}
  1851	EXPORT_SYMBOL_GPL(prep_new_page);
  1852	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
