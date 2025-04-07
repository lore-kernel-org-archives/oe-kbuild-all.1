Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60211C84C1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 22:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744065830; cv=none; b=EK5w8eG8TsbjyozUb6NvFUfgmahVswMjPhigVK5nhms7yG7xQMK+OBKoPLuiAo7MrCJSHRKh8g93ep0tllgGp7pQ4hSPQ3pD2qarjsrqfmzhNWE0dYVsrPH/xJgDgc2KzlZxRfMV0OYgTtDf9MpXkDlURfovpYaV0ARtMbIyNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744065830; c=relaxed/simple;
	bh=N/t1bDmgaR3QZvgVCnAZviwocMCV4X0+LZbOlN1DFYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3TRz//nDTvq9QpPMkbwpKuRhWIsMl7KSmjjR67vesRjLiFVHpQ8vfkb+nbs1L07tyGgRoP0wVaw5lOlJZ5ScZpU87yRGUO+K9WpV+MNFA6zWtFhzJh99ECIVhu1ByHdqjNEaoYB8bggQ7vbl/jxAWeuU1CrRwSMbe3975LmQEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S52kMTU+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S52kMTU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744065828; x=1775601828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N/t1bDmgaR3QZvgVCnAZviwocMCV4X0+LZbOlN1DFYQ=;
  b=S52kMTU+KmsxozVBr16TRE4HavHFB1SmHR7y8oyzColODNJZe6r75BdX
   9w2ei+hdlG0IgTTY97SW7TNEqRM4bFEE5nkdvk/CRMxX9QmFWe3G5XW6g
   Gv6VX02ktNR0VfFGWcaJxb1RZP/zWMhJutaPbY5owf9eWhVCyF0osL70l
   nQcmO3BFBL3w85iCAooqe2UPGcR6GKYayCyL139qGGaQzetHGjWqJWDmy
   yRLqN1WUY3IG3FQ5/GGCWWQnisWiBGCWRhChA0SAW1vpX9lrogmlpfShd
   E+kJadwzxiDmPsj5qTOFIfF7IJZdSg8Zt7laHT6/8QIgiYiSsIuXr26vV
   g==;
X-CSE-ConnectionGUID: DqCevZtYTlaw/fCKhQMG8w==
X-CSE-MsgGUID: PKpqnZ3YQcSEpbImvibGlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49324743"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="49324743"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 15:43:47 -0700
X-CSE-ConnectionGUID: mo9sDCRxSCSlqjbChjsnng==
X-CSE-MsgGUID: c/SHbDN0STKCqdYGiGwAdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="151273647"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 15:43:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1vBv-0003sB-30;
	Mon, 07 Apr 2025 22:43:43 +0000
Date: Tue, 8 Apr 2025 06:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 08/32] drm/xe: Rename lookup_vma function to
 xe_find_vma_by_addr
Message-ID: <202504080624.57T20xNh-lkp@intel.com>
References: <20250407101719.3350996-9-himal.prasad.ghimiray@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-9-himal.prasad.ghimiray@intel.com>

Hi Himal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250407]
[cannot apply to linus/master v6.15-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/drm-xe-Introduce-xe_vma_op_prefetch_range-struct-for-prefetch-of-ranges/20250407-215536
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250407101719.3350996-9-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v2 08/32] drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
config: sparc-randconfig-001-20250407 (https://download.01.org/0day-ci/archive/20250408/202504080624.57T20xNh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080624.57T20xNh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504080624.57T20xNh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_vm.c:2158: warning: Function parameter or struct member 'page_addr' not described in 'xe_vm_find_vma_by_addr'
>> drivers/gpu/drm/xe/xe_vm.c:2158: warning: Excess function parameter 'page_address' description in 'xe_vm_find_vma_by_addr'


vim +2158 drivers/gpu/drm/xe/xe_vm.c

  2150	
  2151	/**
  2152	 * xe_vm_find_vma_by_addr() - Find a VMA by its address
  2153	 *
  2154	 * @vm: the xe_vm the vma belongs to
  2155	 * @page_address: address to look up
  2156	 */
  2157	struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr)
> 2158	{
  2159		struct xe_vma *vma = NULL;
  2160	
  2161		if (vm->usm.last_fault_vma) {   /* Fast lookup */
  2162			if (vma_matches(vm->usm.last_fault_vma, page_addr))
  2163				vma = vm->usm.last_fault_vma;
  2164		}
  2165		if (!vma)
  2166			vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
  2167	
  2168		return vma;
  2169	}
  2170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
