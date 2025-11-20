Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4192868A7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 08:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763627328; cv=none; b=j/W1AG8XhQOvzAOhqqv2Re3NUukE9CjJ5/H1oUQHD28vSUNjykGwrG+ESLE94VYDuUH1QIH4XwKyjcV5g/OC0cYfarAgMwdvi0pWPxzmU2093Z/vBqWPOTUNrn/ycV8LSe5pIB6DdzfxNoXvAC5m77Godt1URBZL6yU3v/1ukjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763627328; c=relaxed/simple;
	bh=w9id92dSuK/H8vr+0x+ToNWSKyQXWE5M6/aywEWdNxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/lji/W17n+gzT6KqdhROHV+AvB5/lNvlQ9n1J+BbxgiK65UuWFz9RqBqLR1yqaVTLSnlfbGWCQ3/gKTmEZs0UafBkiwIdV+1NRLLiWd6wM9oCQdidE99MgVqq+fFDbErdHLTyKw507jRYUUykf6V7zFLxjb8/DfJGcKxlKABV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arYhAe7n; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arYhAe7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763627326; x=1795163326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w9id92dSuK/H8vr+0x+ToNWSKyQXWE5M6/aywEWdNxY=;
  b=arYhAe7nzLFzIDymoZaWdK1sVK9OMI1hX8Q60ymTgz8wlCQyShLpP3Wy
   ABk4EAjK1EJhfyLzq8qTV+S5RhfbUDTx2P3yTN4l/Xw6/OWbxay4wD+Lj
   szmFjdA/N355NvOZiFcli6Xa69yID4OfFHcrW2R/l/bIwEBGgGv9ZwyiF
   +L06ms02FmmrDx5mnIIefMOJlb40WMQe5xDRFFNH9vpzcAu99nBKhQbbA
   VTpbV1WqOQyh/KFnI5ZJf5Qnd7yRfmrdcHTK3WSKDl0qqR94PgD2aQ0tk
   Zr3MWE8L8bwr3yQS7PKeZn/1gqJeV3WitvHnn4g8nFNdALmi5fPIA/dL8
   Q==;
X-CSE-ConnectionGUID: ya8F94OcRLyi6VxVhRJC3Q==
X-CSE-MsgGUID: wDCEtsV8Tumk49+fxjpW0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65717598"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65717598"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 00:28:45 -0800
X-CSE-ConnectionGUID: KUAb6sGcRlWr9Fr1IPcnCw==
X-CSE-MsgGUID: 6Nrx0hePThiv1YTdpc733g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="191098604"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Nov 2025 00:28:44 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM01x-0003mB-25;
	Thu, 20 Nov 2025 08:28:41 +0000
Date: Thu, 20 Nov 2025 16:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 169/175] huge_memory.c:undefined reference to
 `shmem_uncharge'
Message-ID: <202511201656.UKzZspkR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   5a6a999252f63accde14d4851310f10ba962d3bd
commit: 9a655bd0773b41af6d8515502de102544f3ec4c1 [169/175] mm-huge_memoryc-introduce-folio_split_unmapped-v2
config: i386-buildonly-randconfig-005-20251119 (https://download.01.org/0day-ci/archive/20251120/202511201656.UKzZspkR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201656.UKzZspkR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201656.UKzZspkR-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/huge_memory.o: in function `__folio_split':
>> huge_memory.c:(.text+0x572e): undefined reference to `shmem_uncharge'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
