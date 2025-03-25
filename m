Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEC0140E3C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 00:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742863261; cv=none; b=Dy+DpL5OYmmGCkvA0/da2utyWVsS718QfOEQR/W27D3mGFlctIgb7LzkcZqJG6yCAy7u5xg0W7m85MyYUAIsQxyJwpNxetp8tDP5GMSxplnNp3ZqxUqfnVoDrPWE/gHtgqeYg+FtToh6pvdGN3o7Vb2CSIsbD+JaOG1jIWKcq3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742863261; c=relaxed/simple;
	bh=+ZSQtsdIWat5piNQFsra8f1cN5U8h3FMsBdAlKFn8co=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jb2fm8SQJFhbYC8rYFvQGKo5bfqK2CQsddlMl0/DdQRKCwrYPX4EVgyOOvbyoa7X8xCeOkBbEzDGupfhhPT17UX7mN6UYQddrh0BbhP95z6FE8Mz72ADsNNJ7s3fMUPnG8nO9czB2hKCPUWrDz/jerQ0AbrjrjchSKnhtoxmuo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7bVfTiA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7bVfTiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742863259; x=1774399259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ZSQtsdIWat5piNQFsra8f1cN5U8h3FMsBdAlKFn8co=;
  b=B7bVfTiAb/fNEmUMD9k3QpgSPDW9q/fN+qrImto3Z/Tb36TCP/wcBL1h
   6Uiw3qRME2VOAb08Fb/dmhtNp+3AH/86reyvk3MXQlWEW7zBDi4J/Y7Hv
   V1taOgmV43ktB3rbGMrTxL9mp76pi0eSOzSKEvcTHbGG+tHgOL5dly1rf
   O4paxpnB9cR5i0unjF0GVRMEw9jGFuy8jqvFOcsvdW0TGSqQOXTzanivX
   GD829lOZPSlbcDzgfyGFIUntlYx9IVRAkvbBmIFSayDpRMoqz7gtnRFW4
   kfnD6/jSUl7kA+Fg47sKzTXTLDbZCWsBd0HI3ZHm2DC9rjdLt4oiRco9o
   A==;
X-CSE-ConnectionGUID: J2j8kYvTTo+m4ZSjMrQ8Dg==
X-CSE-MsgGUID: zN6Cr1R9T1yq2tNxriPbhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="66551500"
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; 
   d="scan'208";a="66551500"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 17:40:58 -0700
X-CSE-ConnectionGUID: Aje7e2CRRjm8qVa8NI1wxQ==
X-CSE-MsgGUID: Ph/waAzhSGi9WlMIjGn0xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; 
   d="scan'208";a="155224946"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Mar 2025 17:40:57 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twsLf-00042R-0Y;
	Tue, 25 Mar 2025 00:40:55 +0000
Date: Tue, 25 Mar 2025 08:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:fork_pat 1/1] include/linux/pgtable.h:1525:13:
 error: 'untrack_pfn_copy' defined but not used
Message-ID: <202503250850.oDkX50kF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux fork_pat
head:   4474ef40921c064454fd03245526fc80f373873e
commit: 4474ef40921c064454fd03245526fc80f373873e [1/1] x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
config: nios2-randconfig-001-20250325 (https://download.01.org/0day-ci/archive/20250325/202503250850.oDkX50kF-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503250850.oDkX50kF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503250850.oDkX50kF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:30:0,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/include/uapi/asm/elf.h:24,
                    from arch/nios2/include/asm/elf.h:9,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from lib/test_bitops.c:10:
>> include/linux/pgtable.h:1525:13: error: 'untrack_pfn_copy' defined but not used [-Werror=unused-function]
    static void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
                ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/untrack_pfn_copy +1525 include/linux/pgtable.h

  1520	
  1521	/*
  1522	 * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
  1523	 * copy_page_range(), but after track_pfn_copy() was already called.
  1524	 */
> 1525	static void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
  1526	{
  1527	}
  1528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
