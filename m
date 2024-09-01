Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B0A748A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Sep 2024 06:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725173920; cv=none; b=bKxFJv4CzkJGlgCuHrN+FYUs0UYVZW4HFtS9gsz2zRCj0iFGCNho5oL0TYCuZh6wjIi4gR+dOQySBXhCdZDqoCyUSmqjK7Ge+3vnfvvHQCzIj6PKAe74JsFI5tB3eVaejhnIgTHAYXXn7HYgReNfw9maTpv6kcpXbQaaRc8MNF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725173920; c=relaxed/simple;
	bh=QNFzv3T26GrUZ7riSTW5SGQegkpdkCXzMRJaX5zZi3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kA2+qnf/g7rzcViXDj6pJKH+w1nLm6ZV9kk/TYNt3wPG7FkjGLrz0DO3HxtYe/5qb29X3y7y9Kaq1DwL/Weja27Rmox/Ofb+2usfPzWs1JoPEaZiD/IdUpc1YCmg1W0z8/GK8LopO6TUuQ5D37adieww6xqE1fxrGEWeKZiWQXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKM9ExQy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKM9ExQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725173917; x=1756709917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QNFzv3T26GrUZ7riSTW5SGQegkpdkCXzMRJaX5zZi3Q=;
  b=FKM9ExQy6cLt74RslbUTjSF0qtZ82D8hIjAZyu1rPBAiTzwS0WptE9mY
   sLShfh42vY7ggEdSDWbFZzwUr62cTd2L+b6AHgiecqmc0+ZkN408i/cjI
   t19kXf5VCj63dHOfsp9+vT6muczYAE55YRXmEC5bUzd5NtFkTHjXU7xvi
   /sQ+1nSvHeeO+Fa28skppLEWZIPgYBPcqBaZaCJuZJzpbJ28qObyfNe9r
   F8rvSbsXFV0+6FKw5u/qsIt+/9aPnWytimjkY1j4XheV60VBAv9kcIb87
   4J/kxMo4YLLV/oGt+zqjYdD5EnMb7V0f3/YnnCJRlMY9xvAoR3sVL6Ihi
   g==;
X-CSE-ConnectionGUID: SM6I2iE7Ramo9Kh5r/CMvw==
X-CSE-MsgGUID: Jtdhcq33TnOk3plNKWgWQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="35175990"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="35175990"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 23:58:37 -0700
X-CSE-ConnectionGUID: p3OArc8hQgaVU9QgFPaP4w==
X-CSE-MsgGUID: YCj46K1WRzCletRV2lPh+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="68684299"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2024 23:58:36 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skeXi-0003V4-1J;
	Sun, 01 Sep 2024 06:58:34 +0000
Date: Sun, 1 Sep 2024 14:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 3/4] mm: Support MAP_BELOW_HINT in
 vm_unmapped_area()
Message-ID: <202409011403.qJ3LevQ8-lkp@intel.com>
References: <20240829-patches-below_hint_mmap-v2-3-638a28d9eae0@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-patches-below_hint_mmap-v2-3-638a28d9eae0@rivosinc.com>

Hi Charlie,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5be63fc19fcaa4c236b307420483578a56986a37]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/mm-Add-MAP_BELOW_HINT/20240829-151709
base:   5be63fc19fcaa4c236b307420483578a56986a37
patch link:    https://lore.kernel.org/r/20240829-patches-below_hint_mmap-v2-3-638a28d9eae0%40rivosinc.com
patch subject: [PATCH RFC v2 3/4] mm: Support MAP_BELOW_HINT in vm_unmapped_area()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240901/202409011403.qJ3LevQ8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409011403.qJ3LevQ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409011403.qJ3LevQ8-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mmap.c: In function 'vm_unmapped_area':
>> mm/mmap.c:1769:51: error: 'MAP_BELOW_HINT' undeclared (first use in this function)
    1769 |         if (info->hint != 0 && info->mmap_flags & MAP_BELOW_HINT)
         |                                                   ^~~~~~~~~~~~~~
   mm/mmap.c:1769:51: note: each undeclared identifier is reported only once for each function it appears in


vim +/MAP_BELOW_HINT +1769 mm/mmap.c

  1755	
  1756	/*
  1757	 * Search for an unmapped address range.
  1758	 *
  1759	 * We are looking for a range that:
  1760	 * - does not intersect with any VMA;
  1761	 * - is contained within the [low_limit, high_limit) interval;
  1762	 * - is at least the desired size.
  1763	 * - satisfies (begin_addr & align_mask) == (align_offset & align_mask)
  1764	 */
  1765	unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
  1766	{
  1767		unsigned long addr;
  1768	
> 1769		if (info->hint != 0 && info->mmap_flags & MAP_BELOW_HINT)
  1770			info->high_limit = MIN(info->high_limit, info->hint + info->length);
  1771	
  1772		if (info->flags & VM_UNMAPPED_AREA_TOPDOWN)
  1773			addr = unmapped_area_topdown(info);
  1774		else
  1775			addr = unmapped_area(info);
  1776	
  1777		trace_vm_unmapped_area(addr, info);
  1778		return addr;
  1779	}
  1780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
