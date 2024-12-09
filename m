Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4CE156F41
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718195; cv=none; b=GEQiwch2AuaAoEheZsgEE9lO1K18/xaKS6Rs0hqAtExyltxHe1qXVrT2WlRWu2kzO29sZCxW5x9sWQT9FtGMFCtPSfdsCIpFoJkVXsoNCrN+7H/cLMafqJpYJGyaU1j/WFC2PMDmgMfbzgAMH9YibP5mw5J+Vlr389USKGdCDGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718195; c=relaxed/simple;
	bh=OBttMsjnareh/bd6tfo1SZNc8Z+A9kOCmLj4eM3lKr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mEsccCy4HmxpaUZ8Vhm5l1tHUJaat2GIZShwxL7H84JprxvPy8vWfK2i3ZHGkF+GLeLzZnlL7p2K6YiwDVc1Y0vJhC8K50wiCKDTC4sOdLNtcbPtrX0FVR6WFyb/tMYR9wLqSNHWC7rYzUEJPcwffM+h0IxrPAWrWgEKa5ObuJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIA9X1WH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIA9X1WH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718194; x=1765254194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OBttMsjnareh/bd6tfo1SZNc8Z+A9kOCmLj4eM3lKr8=;
  b=lIA9X1WHwPhetEZZDnklYE/b2SlWjnJnNhQp9bu8AePg/VEQRaGuGWqi
   4UtOyD/iMfL8GntHx4hwrOi8+He0ZBPa5AlZMxcjK+vBQa4SWNCUd6M7N
   5vFHY97HNP4EqAfksIq4wmI+KX2DK6WuFDRIbIgiie6zkSILi0RYthP/8
   5nV1gM9JROHF/JBohCW3zLhUrwmjCmJHw+btRj1XaYUB/qEuCpUT69Eqx
   Nk1UKZljjslmc4OfjNTZLY6RG/UsJ5VP8zelmmKMO7hROprHEzKAb0WrR
   u0Ds4Vo8nzL+4EMX8+4V7s9JnCxm+yfUO0f9isuKltbNd/R/wnAhX+G+z
   A==;
X-CSE-ConnectionGUID: Je3qN+bWQGieJXLotdw1sg==
X-CSE-MsgGUID: sdscTfaNQlKW9oRCxMLo7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="21591908"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="21591908"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:23:11 -0800
X-CSE-ConnectionGUID: 2w/uegzIRHKX9H5f4rzu5A==
X-CSE-MsgGUID: rgGM/22nRXGk0wNG31SNOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125842595"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Dec 2024 20:23:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVIZ-0003qF-0k;
	Mon, 09 Dec 2024 04:23:07 +0000
Date: Mon, 9 Dec 2024 12:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 166/172] include/linux/memfd.h:27:5: warning:
 no previous prototype for 'memfd_check_seals_mmap'
Message-ID: <202412072138.KfHWCUZe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   6e165f54437931f329d09dca6c19d99af08a36e1
commit: 6b72648c4e2b94fc7df65cab28a59b185a37c997 [166/172] mm: perform all memfd seal checks in a single place
config: arc-randconfig-001-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072138.KfHWCUZe-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412072138.KfHWCUZe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412072138.KfHWCUZe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/gup.c:8:
>> include/linux/memfd.h:27:5: warning: no previous prototype for 'memfd_check_seals_mmap' [-Wmissing-prototypes]
      27 | int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/memfd_check_seals_mmap +27 include/linux/memfd.h

     6	
     7	#ifdef CONFIG_MEMFD_CREATE
     8	extern long memfd_fcntl(struct file *file, unsigned int cmd, unsigned int arg);
     9	struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx);
    10	/*
    11	 * Check for any existing seals on mmap, return an error if access is denied due
    12	 * to sealing, or 0 otherwise.
    13	 *
    14	 * We also update VMA flags if appropriate by manipulating the VMA flags pointed
    15	 * to by vm_flags_ptr.
    16	 */
    17	int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags_ptr);
    18	#else
    19	static inline long memfd_fcntl(struct file *f, unsigned int c, unsigned int a)
    20	{
    21		return -EINVAL;
    22	}
    23	static inline struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
    24	{
    25		return ERR_PTR(-EINVAL);
    26	}
  > 27	int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags)
    28	{
    29		return 0;
    30	}
    31	#endif
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
