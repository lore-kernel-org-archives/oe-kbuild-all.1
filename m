Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8238413AA3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 03:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729223047; cv=none; b=JnCwjh9vki9rKi8ZpgIe+R8TfDUEFA0+rEsmf44fuSwWHE4zpek7NIGVNbbS2w+TLBQUd8K5jlJh8LL9MZRELh+gOKkJIh2Fm5htEo/ILJnK3h43M/PJNfnkLPgKjuiCxIIe+0nLX2vlMIsXaSJMJQoUot4YL8e16X3SgHdKGyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729223047; c=relaxed/simple;
	bh=wkbO/Izk9NvMV/Y0hvfoan+LvJ01Z3i0mZzkbswhgGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnmLX/7LWjQ6kh1zUvIVeKHgvKLcUXuR1tB815B9O6btQthA1wyER33PQNjN8LSwvhZzqyZqKoB85WHaaa+o0vQdvaIdaqBLUonpqOT9I6KvftLjTf3tKBlsvwebdSmM169WxOnkcPr2X6MSaXGChqw/UOQw2mGR9QZWpxPhZcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfHVi/47; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfHVi/47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729223046; x=1760759046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wkbO/Izk9NvMV/Y0hvfoan+LvJ01Z3i0mZzkbswhgGA=;
  b=PfHVi/47bjrlMARHX3HKkPRa6PG1O2TJcsDhkF/JVq/Ugvm7A8cXRHoF
   f2+l5rZRGbPuEo8X1C09DqXqJ4ucdHBZIECD/qnxcOs2IESG7MQWEz03c
   8BN0y4koum35nSBNMhJT5SUb2/8rKUIZhp/Yok1QVSDwTZP20oxf/472T
   frcmB2nm4l8IA4iARvs+Pp4yFYmZNrQpZp1a8do6v8gvjyXDR69wi+70t
   ZohjpIWwgnmIah/V3jZvVDAfM0IQLAVsrmGxD+J7mijTJ5YgoJD/VNID3
   b8BzryLiKBdDiBuzviL4dW7ZLkW8RvzUp23CKk+HZLghRupN8ZfaDYQ0e
   g==;
X-CSE-ConnectionGUID: C7GiYm6TQG+5ACO98V3+Pw==
X-CSE-MsgGUID: +CAdGkfAQR+8f2ZcMTs1Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="32539988"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="32539988"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 20:44:04 -0700
X-CSE-ConnectionGUID: 8xF2QfJyQO6i7PO46/gIQQ==
X-CSE-MsgGUID: jV9ZEP8/T2ygrAu1zVZ9VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="83574642"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Oct 2024 20:44:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1duC-000NEL-2Y;
	Fri, 18 Oct 2024 03:44:00 +0000
Date: Fri, 18 Oct 2024 11:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: jeffxu@chromium.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/1] exec: seal system mappings
Message-ID: <202410181124.TWvcRfi7-lkp@intel.com>
References: <20241014215022.68530-2-jeffxu@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014215022.68530-2-jeffxu@google.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on brauner-vfs/vfs.all perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools linus/master v6.12-rc3 next-20241017]
[cannot apply to kees/for-next/execve kees/for-next/pstore kees/for-next/kspp tip/x86/asm acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jeffxu-chromium-org/exec-seal-system-mappings/20241015-055145
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241014215022.68530-2-jeffxu%40google.com
patch subject: [RFC PATCH v2 1/1] exec: seal system mappings
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241018/202410181124.TWvcRfi7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181124.TWvcRfi7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181124.TWvcRfi7-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/events/uprobes.c: In function 'xol_add_vma':
>> kernel/events/uprobes.c:1507:70: error: 'VM_SEALED' undeclared (first use in this function); did you mean 'VM_SHARED'?
    1507 |                                 VM_EXEC|VM_MAYEXEC|VM_DONTCOPY|VM_IO|VM_SEALED,
         |                                                                      ^~~~~~~~~
         |                                                                      VM_SHARED
   kernel/events/uprobes.c:1507:70: note: each undeclared identifier is reported only once for each function it appears in

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +1507 kernel/events/uprobes.c

  1481	
  1482	/* Slot allocation for XOL */
  1483	static int xol_add_vma(struct mm_struct *mm, struct xol_area *area)
  1484	{
  1485		struct vm_area_struct *vma;
  1486		int ret;
  1487	
  1488		if (mmap_write_lock_killable(mm))
  1489			return -EINTR;
  1490	
  1491		if (mm->uprobes_state.xol_area) {
  1492			ret = -EALREADY;
  1493			goto fail;
  1494		}
  1495	
  1496		if (!area->vaddr) {
  1497			/* Try to map as high as possible, this is only a hint. */
  1498			area->vaddr = get_unmapped_area(NULL, TASK_SIZE - PAGE_SIZE,
  1499							PAGE_SIZE, 0, 0);
  1500			if (IS_ERR_VALUE(area->vaddr)) {
  1501				ret = area->vaddr;
  1502				goto fail;
  1503			}
  1504		}
  1505	
  1506		vma = _install_special_mapping(mm, area->vaddr, PAGE_SIZE,
> 1507					VM_EXEC|VM_MAYEXEC|VM_DONTCOPY|VM_IO|VM_SEALED,
  1508					&xol_mapping);
  1509		if (IS_ERR(vma)) {
  1510			ret = PTR_ERR(vma);
  1511			goto fail;
  1512		}
  1513	
  1514		ret = 0;
  1515		/* pairs with get_xol_area() */
  1516		smp_store_release(&mm->uprobes_state.xol_area, area); /* ^^^ */
  1517	 fail:
  1518		mmap_write_unlock(mm);
  1519	
  1520		return ret;
  1521	}
  1522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
