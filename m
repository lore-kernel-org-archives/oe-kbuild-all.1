Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D16280A38
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 14:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663959; cv=none; b=OUxwtbO8wKTmrlqn9FAnkVxfF6TvjI+lGa6xpH0B4PoTx4TYriSuqwU88jgCrVKBvTscwl3eEjWxq2mNDVWW/JpmXHbMJUCeUInrojkA0fnbjch5UH+v16S4tvKgnMFBgpKhllPz1Zc+zntq9dIVVp2EUG3eRbZgmY3IzYqMJ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663959; c=relaxed/simple;
	bh=P3Yfl2VvBLS5Jvwryg5uLptIO1VizgRuT/oK0Oz4+60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YM1N5yPJ+NJ/x0rprPrVccuixrIPd6ANWv1mUhAox13glawnBKBsTLeqqp3SKlSuimdyQGhhU6nF0QPUulA2+ME1QvPtrXOcdnewCnnNXArPdL/mOYbQdSVRB6RBmpllKqP05fNN0cjkoAOpqWYNg4zOdaWbLe1XJaT0aaySB/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EOqEYSN3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOqEYSN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747663957; x=1779199957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P3Yfl2VvBLS5Jvwryg5uLptIO1VizgRuT/oK0Oz4+60=;
  b=EOqEYSN3fWr7Qr1v/QZEJBGwsxcB/bBpKVamHChwHeibFgfBJO0tTnEa
   WJrHRmyW/YGlmT5pZOmrnWhvyZUESsUo74r/5k6mR+0Z0u5LYWCD+Yl3d
   7Oxx1eRSS8AccDxlpWZlAaR9ZYDPT8peQMa3CXW4RBJzDjKkIF41xYXco
   SR7BHNsMpR3TvPJjEtPaKt9mB4d0xqbmoLal1YgtXioTGR5l0wYC5/M0s
   f2bnTyFXBxc+GnJ6mCzIB+OQqER699D/sPZXMgGXtCbkElThA4gr7Yb49
   UL6sMrX643QLiG5oUK8MaUhmFux4PpOmCaC80zIwIlHl3Rq0QhKLy0TnB
   g==;
X-CSE-ConnectionGUID: Iv00aQWBR/i20bP8WaeDVg==
X-CSE-MsgGUID: Re9RTXKBTS6iIFk73VB2YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60597825"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="60597825"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 07:12:33 -0700
X-CSE-ConnectionGUID: vcbgqQz2T26Qnv9SXD1xCA==
X-CSE-MsgGUID: cp2LGioKQ0mVHcvHxk7NTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="176493895"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2025 07:12:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH1ED-000LYi-36;
	Mon, 19 May 2025 14:12:29 +0000
Date: Mon, 19 May 2025 22:11:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:ackerley-1g-master 52/75] kismet: WARNING: unmet direct
 dependencies detected for HUGETLBFS when selected by GUESTMEM_HUGETLB
Message-ID: <202505192254.EyjqBouJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git ackerley-1g-master
head:   773f26b5bef6e4d3094a33605165a5c6ab9aa0f0
commit: 4f9ec797adddb85edd77bc785348b440d8025dc9 [52/75] mm: guestmem_hugetlb: Wrap HugeTLB as an allocator for guest_memfd
config: alpha-kismet-CONFIG_HUGETLBFS-CONFIG_GUESTMEM_HUGETLB-0-0 (https://download.01.org/0day-ci/archive/20250519/202505192254.EyjqBouJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250519/202505192254.EyjqBouJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505192254.EyjqBouJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HUGETLBFS when selected by GUESTMEM_HUGETLB
   WARNING: unmet direct dependencies detected for HUGETLB_PAGE_OPTIMIZE_VMEMMAP
     Depends on [n]: ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP [=n] && SPARSEMEM_VMEMMAP [=n]
     Selected by [y]:
     - GUESTMEM_HUGETLB [=y]
   
   WARNING: unmet direct dependencies detected for HUGETLBFS
     Depends on [n]: (X86 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=n] || BROKEN [=n]) && (SYSFS [=y] || SYSCTL [=n])
     Selected by [y]:
     - GUESTMEM_HUGETLB [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
