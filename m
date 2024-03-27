Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7EE14C5BE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 17:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711558959; cv=none; b=Zl5ZVyKc5RafKIWGYqGsy2P4ckYpfSuI3ZG2rNXD63SMXjnCwIZ+7CI2/dxL2PYb0d41vZTxyx7xCrIBczAk18Dnhi3HOhYv5DSBmvrfd9ZmrgX586XFnHzI1eI/QpPXaqxGKyXwE5/Z0HHwrLZ4QHT28LZSve9qLFPckIlj6xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711558959; c=relaxed/simple;
	bh=AOj6M44WIprLAqjzjWncIF7fH02I3/KvnnV0Jicqssw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuFSVKUtbwKPWkELO0KA8DjnyiRABX+IGkqMfTeGvNod76rUOU4U6vAzLVdZhjwG+dUFRRJw4vjyHMJ60zNUrc4MADPP5kgPf8QAkzsjqtv2lvneMtkxCBpRwKGulzQnf8ldxI1PocRgVpOsLNF2VDQhEdz9ozc+L/ETElcMUTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaiKvxrz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaiKvxrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711558956; x=1743094956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AOj6M44WIprLAqjzjWncIF7fH02I3/KvnnV0Jicqssw=;
  b=ZaiKvxrzPaAyIRFhui4aiHwEaEDU2CWfpurrc5oE8ZKWx41zhUVujBvP
   3HgFAFiv0sPFJ5dzsoG0se5sXnLVEd9av5B9uVRY6Kw3PslpKEv+OfD6x
   uwyk0G+F2MCnGUOZ1ZvXk39QKQ9izCYfzaYbnxg0cMHWov65wWeC0Isg6
   BOrrXBetokdzc/PxCJ6qQfnzr6SqXr/FlozzLnjN5xAFzNUMe7nRVZKUZ
   UuF/Z+VMNxnAOA4h5v7hGvilcm1/mFI7j72EqD2mf2qWdPqJit6apPml6
   5yMaYAKtrzYHOLOjJa4pehfeHA5wC3/RKMykOVxeZVEvKjgb1lfzTGZ+t
   w==;
X-CSE-ConnectionGUID: kMyTY8FoRhaL2KtQeIBexg==
X-CSE-MsgGUID: dV3Ck8iETbe9qktJ4u/Ymw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10480024"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="10480024"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 10:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="20841291"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2024 10:02:33 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpWfX-0001I2-0O;
	Wed, 27 Mar 2024 17:02:31 +0000
Date: Thu, 28 Mar 2024 01:01:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH 07/10] mm: Convert arch_clear_hugepage_flags to take a
 folio
Message-ID: <202403280031.hBtWedPW-lkp@intel.com>
References: <20240326171045.410737-8-willy@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326171045.410737-8-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20240327]
[cannot apply to jcmvbkbc-xtensa/xtensa-for-next arm64/for-next/core s390/features tj-cgroup/for-next linus/master vbabka-slab/for-next v6.9-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/sh-Remove-use-of-PG_arch_1-on-individual-pages/20240327-011221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240326171045.410737-8-willy%40infradead.org
patch subject: [PATCH 07/10] mm: Convert arch_clear_hugepage_flags to take a folio
config: riscv-randconfig-r064-20240327 (https://download.01.org/0day-ci/archive/20240328/202403280031.hBtWedPW-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403280031.hBtWedPW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403280031.hBtWedPW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/hugetlb.h:828,
                    from mm/filemap.c:37:
>> arch/riscv/include/asm/hugetlb.h:12:34: error: redefinition of 'arch_clear_hugetlb_flags'
      12 | #define arch_clear_hugetlb_flags arch_clear_hugetlb_flags
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hugetlb.h:840:20: note: in expansion of macro 'arch_clear_hugetlb_flags'
     840 | static inline void arch_clear_hugetlb_flags(struct folio *folio) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/hugetlb.h:8:20: note: previous definition of 'arch_clear_hugetlb_flags' with type 'void(struct folio *)'
       8 | static inline void arch_clear_hugetlb_flags(struct folio *folio)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_clear_hugetlb_flags +12 arch/riscv/include/asm/hugetlb.h

     7	
     8	static inline void arch_clear_hugetlb_flags(struct folio *folio)
     9	{
    10		clear_bit(PG_dcache_clean, &folio->flags);
    11	}
  > 12	#define arch_clear_hugetlb_flags arch_clear_hugetlb_flags
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
