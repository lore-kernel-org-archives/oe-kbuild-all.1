Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546B8A927
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Jun 2025 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749377332; cv=none; b=ITro22thPLOl1C2yO5EXrafWqe9HZcKr6gUmGrhck+3EM+22tR0838bpVEuctuNIgB8efiF+1rPEQP4FcFXLpa4wZI7uF5eWy8QFTsKn8Gs7s/KnQsZ2iMQMd/bTt4wI4Ez2lppkGh91FEMpXauRKYZBTHX7Dp/VaoQUtMix6yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749377332; c=relaxed/simple;
	bh=HvGoxC5U4L/pjcwqD0GVxWV0j7yuZ/GOeMOfp9CLjj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvB6zAkQcsxy1NqTRMq+RbcDzpdoOt6rqdXBcE6IlLELxxmJVShwYNYEGxZ5ssnGM8ayNfFFnaC6WZF+GP6ruwhFOHfGPezwkcerkQzvgbGmuIGtju/c+Euvv0SW9+bwnAy1pTUZHjrBEF37g/Mu8gGA+7ncfhsVATa3tgD1vwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xv1hw905; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xv1hw905"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749377330; x=1780913330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HvGoxC5U4L/pjcwqD0GVxWV0j7yuZ/GOeMOfp9CLjj4=;
  b=Xv1hw905/dU7WGwW/YPMw4jpPcEMzvHGrgzYwzhEjttWKBniL2L6np3V
   zHb0SCOhN1g54Xx55kTfYZWme8H1i83Z6JISvAwzQryN6D9QCFPkNmBjk
   Q71f7KdlGO5iyOoFiOFV9aRgR8uDmKvXuU96OP1H6nvwJQ5YUUlRsFRuN
   bU0ojNE8cDSMaVCSWcFyCzdBhn6SG4i34et9OOoV2/ccgXb36f2nV0ihh
   SpNZcGbNFu+4SWW1JBjtth+klJ/fqIXz8jW08M0z4ChsGK/5QFEhTbnpf
   ieLVbGoawRjL7VmfAyIO7UP5ftGmQkS3h1hR7S8UmgVyyX/xSmEsIN5DK
   g==;
X-CSE-ConnectionGUID: oRJfbZqrTKirKAZCLw4UWg==
X-CSE-MsgGUID: RM/2PdDVTdCMSr5WCCl9gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51568934"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="51568934"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 03:08:50 -0700
X-CSE-ConnectionGUID: o+UE1l5xTFmY4Y5QjJ46JQ==
X-CSE-MsgGUID: nDBGECvBSIS0d1KOeLxchQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="147204966"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Jun 2025 03:08:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOCxK-0006Jd-1e;
	Sun, 08 Jun 2025 10:08:46 +0000
Date: Sun, 8 Jun 2025 18:08:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 4/5] mm: thp: add bpf thp struct ops
Message-ID: <202506081759.1hhWfDgL-lkp@intel.com>
References: <20250608073516.22415-5-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608073516.22415-5-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/mm-thp-use-__thp_vma_allowable_orders-in-khugepaged_enter_vma/20250608-153842
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250608073516.22415-5-laoar.shao%40gmail.com
patch subject: [RFC PATCH v3 4/5] mm: thp: add bpf thp struct ops
config: x86_64-buildonly-randconfig-004-20250608 (https://download.01.org/0day-ci/archive/20250608/202506081759.1hhWfDgL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506081759.1hhWfDgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506081759.1hhWfDgL-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/memory.o: in function `thp_vma_allowable_orders.constprop.0':
>> memory.c:(.text+0x186b): undefined reference to `bpf_thp_allocator'
   ld: mm/huge_memory.o: in function `vma_thp_gfp_mask':
>> huge_memory.c:(.text+0x46fd): undefined reference to `bpf_thp_gfp_mask'
   ld: mm/khugepaged.o: in function `thp_vma_allowable_orders.constprop.0':
>> khugepaged.c:(.text+0x2a98): undefined reference to `bpf_thp_allocator'
   ld: mm/khugepaged.o: in function `khugepaged_enter_vma':
   khugepaged.c:(.text+0x5228): undefined reference to `bpf_thp_allocator'
   ld: fs/proc/task_mmu.o: in function `show_smap':
>> task_mmu.c:(.text+0x2ce8): undefined reference to `bpf_thp_allocator'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
