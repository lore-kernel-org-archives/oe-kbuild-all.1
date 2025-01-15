Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDBD2416B1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736947505; cv=none; b=UeZjGLzD/Fo5UP76m6/EF5Z+gqLXORGFdpywGhgU9MisiGbda+bfNdooP03f9BCSTRRx3xgGIK/13frxDRT8J9ss6eFCgcymitS9P1Zm2Qa5jy+2hrhCirJdNpIngJ1SeZdgomIbM6qG8GdCFwvUA4uRuuQT3wt5XfexWhVtPok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736947505; c=relaxed/simple;
	bh=lcQ42I5edXQ96+K4rkTnJJm6qkIDP0cDeRZOr75qyVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f4U7GH/DYwXk6umDoQOPdo15VuJ1uQil5/ZztWSQsFC2eXIVh85OWebZrax0+UYR+ju7JszaV6ddg+B567W9s7rgbthBsqsPIqY8q9tNNSjGjJWY6K0FGVG7oYsTXDdlilqe9vLaXHqY402OkA5FHtptkMoX1Ivxtez89KZ0zYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kL+U/fSm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kL+U/fSm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736947504; x=1768483504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lcQ42I5edXQ96+K4rkTnJJm6qkIDP0cDeRZOr75qyVg=;
  b=kL+U/fSmu0IIrskwVOdVUtx+PViqM8U9L7mZtjMJVpwTtvtYuj1ey0f2
   SdSc/d2xLU1MpRM73nJ/dj3MwVNc1hhKnZ1gBB6FmIK9f58wt37QxR/eh
   wXkSjDDMQKGApiz05wlkW4ytKmrioqmZ+sOIQbTwbxC0rV0S8JV67rgB2
   jbnYY6Hz+WF6ohGOx9wuh9IjyxaDSHUoGut7LVF8Ogt28RkORGplppoNy
   oxnaMJdNpOisMGOGuEcn/CNNB2+s3/BuIEw8nXKUneOhDVSkuOGb9QLWj
   ptgKwkqVDQeNlKJssBl8Beu8YGlloSr4Xs5+id+BBz+Rg+6S1yVLuAi01
   Q==;
X-CSE-ConnectionGUID: PVPy45bCQXOavfV52oqeeA==
X-CSE-MsgGUID: YpQdTfhfQe+Z3SFjVCBs4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37309289"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="37309289"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 05:25:03 -0800
X-CSE-ConnectionGUID: Lp8nrhBwQ6q76nmjBIUYNw==
X-CSE-MsgGUID: veBzZGxOQayTZy1wy4Agrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109756600"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jan 2025 05:25:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tY3OG-000QNL-0V;
	Wed, 15 Jan 2025 13:25:00 +0000
Date: Wed, 15 Jan 2025 21:24:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2025-01 1/1]
 arch/arm64/mm/mmu.c:1499:5: sparse: sparse: symbol
 'check_range_driver_managed' was not declared. Should it be static?
Message-ID: <202501152150.lI8Jtps0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10-2025-01
head:   136bac6645bb5c4490ec3dcb3b1071fb49f98085
commit: 1b4aca7d82ae9b40145484fa09ceab38a6a06062 [1/1] ANDROID: arm64/mm: implement {populate/depopulate}_range_driver_managed
config: arm64-randconfig-r113-20250115 (https://download.01.org/0day-ci/archive/20250115/202501152150.lI8Jtps0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250115/202501152150.lI8Jtps0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501152150.lI8Jtps0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/mm/mmu.c:1499:5: sparse: sparse: symbol 'check_range_driver_managed' was not declared. Should it be static?
   arch/arm64/mm/mmu.c:344:47: sparse: sparse: self-comparison always evaluates to false
   arch/arm64/mm/mmu.c:894:38: sparse: sparse: self-comparison always evaluates to false
   arch/arm64/mm/mmu.c:913:38: sparse: sparse: self-comparison always evaluates to false
   arch/arm64/mm/mmu.c:1035:38: sparse: sparse: self-comparison always evaluates to false
   arch/arm64/mm/mmu.c:1075:38: sparse: sparse: self-comparison always evaluates to false

vim +/check_range_driver_managed +1499 arch/arm64/mm/mmu.c

  1498	
> 1499	int check_range_driver_managed(u64 start, u64 size, const char *resource_name)
  1500	{
  1501		struct mem_section *ms;
  1502		unsigned long pfn = __phys_to_pfn(start);
  1503		unsigned long end_pfn = __phys_to_pfn(start + size);
  1504		struct resource *res;
  1505		unsigned long flags;
  1506	
  1507		res = lookup_resource(&iomem_resource, start);
  1508		if (!res) {
  1509			pr_err("%s: couldn't find memory resource for start 0x%lx\n",
  1510				   __func__, start);
  1511			return -EINVAL;
  1512		}
  1513	
  1514		flags = res->flags;
  1515	
  1516		if (!(flags & IORESOURCE_SYSRAM_DRIVER_MANAGED) ||
  1517		    strstr(resource_name, "System RAM (") != resource_name)
  1518			return -EINVAL;
  1519	
  1520		for (; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
  1521			ms = __pfn_to_section(pfn);
  1522			if (early_section(ms))
  1523				return -EINVAL;
  1524		}
  1525	
  1526		return 0;
  1527	}
  1528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
