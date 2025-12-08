Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B4D22D785
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765212230; cv=none; b=nxp/sTYOuONVCnzhCoDSlZoPHXCy4+D6EEV2horbpI88yV240jbGUGvNgYbciUJ+5CNfHmdcMorsxJwIetAhTgnbAirDek7vxOT90bNKElsLiz2n2d9wacXloaRQweBlxFVeHBI7OnWUE0DK1NON8hF6CNxZjKLI0cWAKmpD2JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765212230; c=relaxed/simple;
	bh=fDIfH5VzOObG9C1cWrRRlXqKLUX9jJjG7BTtQ+x/xf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cC6Paldhpab6CaJE18mYWnKzZwqdhrPODOFlTAJSBlhSR6a8Qlk/xYgj9FwPE5UdmS0RMjFQNlIABKThTiZxmtf6O0c+dK8dqCRW7YQkIWC2LW7WaWMMwdgjBxGCMePuKcetZSAT2kYeGAqZmI9E1Tpkpql+kmnwhJL7XpXxl1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hplOTqd+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hplOTqd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765212228; x=1796748228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fDIfH5VzOObG9C1cWrRRlXqKLUX9jJjG7BTtQ+x/xf4=;
  b=hplOTqd+1hv0QjLOjSbPDnkrAi2LrbHQhtLzACrCHZlUQvYSGYHBKUWo
   C8DT74B02ZRQSB4WsdrFe4jLSnAROCsw+9MQAfPfC8FyP39vMZ8oOv31G
   Wyg102wtCr8CyA7H4OPnQlOgb7ZBxY2LaHfoYSu+hIrDjrqoDCg7Jz43d
   ZcjBojl1tXPPQXXCykFqTFyPs4c/J3P5wD1BVzOsUs5C+tOn2cXAXq9ni
   NGDlFpCMIPmA3V1lBkVdh4MIeKJcv55UVS0wvMflJMhHKoA8Cn5mYiRoB
   wp3ycuSIDdtj3KkUOxCY3CalpNzdvwWnQX0ScTwpaktThtUfFHUKxP6pF
   Q==;
X-CSE-ConnectionGUID: MvsfLCqWRLmpIkJHLvLuHg==
X-CSE-MsgGUID: T2sD6OZAR9OVkOy0VlOEGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="78622243"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="78622243"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 08:43:48 -0800
X-CSE-ConnectionGUID: dfE0v1i4R06Pktm/aSVx1A==
X-CSE-MsgGUID: iQbeCRBvRnCWoK+s7H9Rjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="226640408"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2025 08:43:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSeKu-000000000dF-1smZ;
	Mon, 08 Dec 2025 16:43:44 +0000
Date: Tue, 9 Dec 2025 00:43:18 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13538/13721] mm/kasan/common.c:601:21: error:
 'KASAN_VMALLOC_KEEP_TAG' undeclared; did you mean
 'KASAN_VMALLOC_PAGE_RANGE'?
Message-ID: <202512090010.3nvGK9yw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82bcd04d124a4d84580ea4a8ba6b120db5f512e7
commit: 6b83afdcfa935db4f836906ca7f0fcafdca8d229 [13538/13721] kasan: unpoison vms[area] addresses with a common tag
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20251209/202512090010.3nvGK9yw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090010.3nvGK9yw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090010.3nvGK9yw-lkp@intel.com/

Note: the linux-next/master HEAD 82bcd04d124a4d84580ea4a8ba6b120db5f512e7 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   mm/kasan/common.c: In function '__kasan_unpoison_vmap_areas':
>> mm/kasan/common.c:601:21: error: 'KASAN_VMALLOC_KEEP_TAG' undeclared (first use in this function); did you mean 'KASAN_VMALLOC_PAGE_RANGE'?
     601 |         if (flags & KASAN_VMALLOC_KEEP_TAG) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~
         |                     KASAN_VMALLOC_PAGE_RANGE
   mm/kasan/common.c:601:21: note: each undeclared identifier is reported only once for each function it appears in


vim +601 mm/kasan/common.c

   586	
   587	#ifdef CONFIG_KASAN_VMALLOC
   588	void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms,
   589					 kasan_vmalloc_flags_t flags)
   590	{
   591		unsigned long size;
   592		void *addr;
   593		int area;
   594		u8 tag;
   595	
   596		/*
   597		 * If KASAN_VMALLOC_KEEP_TAG was set at this point, all vms[] pointers
   598		 * would be unpoisoned with the KASAN_TAG_KERNEL which would disable
   599		 * KASAN checks down the line.
   600		 */
 > 601		if (flags & KASAN_VMALLOC_KEEP_TAG) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
