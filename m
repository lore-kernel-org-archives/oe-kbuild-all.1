Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EFC23749
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 20:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705524982; cv=none; b=K+Z2tJ23vQHGTiBCDBg9NbxzHDoFHtHUudmaJbh7VvL+OLCF73WwjpN1xkjGH43Wcqb0qsjjciZfxGSddiXMv3rg2i+kSfNHtU+qEYWy1ZgXfM8UfgVnfppGLzJu8NzoEKZ8UTefAp+4WkBwViSbGmivJvwKz0LlygPjV956sXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705524982; c=relaxed/simple;
	bh=+X6cZp/5nwXTHzeRtPpuyp0HEZKTKMDCeAMko7JmhEk=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=Ydz0UBkobg5E54EnHAFqyT7w0FCaTIertHWqRu+sHLjZ11i0b6LQSw0YQIs93nPzkEYLE+G57CP/IhrKpRzjnrcwN/1XhKyF2T4bYJW+IutOK3OnmkBUYPbJv9lXIHgqN6RkQj2A8loiTwymk8vGcRxv+AaU1rSUhsusUzWOFeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKTtDERI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKTtDERI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705524980; x=1737060980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+X6cZp/5nwXTHzeRtPpuyp0HEZKTKMDCeAMko7JmhEk=;
  b=FKTtDERIxS0r5GHkIDBLRe+zja2CMrnrn+HmmcB/znGE2G59vrgyXaW8
   byW+tFa27mgxoz4J3ffnAISowf53WhnE7kRu1iYSv9kwbp9Jl2Rk4TUiu
   6B23kun2V7N7OhEp75ar8eT54KzpYJs21cg8l9D3PnJrJoANcMbBsYFha
   WiLrfGmvOOIpK4T3+v3hbQzFK8av3KmvnboNxjmXIfKkL3QnIp/l0MznC
   4fOK7IfbirQ++Y6wnhj6yxWX6X+UfsFfAjFY2KeYxfeLvU23TQcTD0ZMI
   sBSVdL1gAPQTUr95F7h0qTZXD9NWpV6ZCC/mx00rsXQvXgxFquBuqgYy6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="6984885"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="6984885"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 12:56:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="106653"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jan 2024 12:56:18 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQCxM-0002L2-1M;
	Wed, 17 Jan 2024 20:56:16 +0000
Date: Thu, 18 Jan 2024 04:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 776/2425] arch/loongarch/kernel/efi.c:79:33:
 error: implicit declaration of function 'pmd_mkhuge'; did you mean
 'pte_mkhuge'?
Message-ID: <202401180440.MFTxugeQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ec7d78798bfb669efc713c2c416a553a40d4dc77
commit: 221e2e8bdbb851a519df0bac5a44298dae2b4612 [776/2425] LoongArch: add kernel setvirtmap for runtime
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240118/202401180440.MFTxugeQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180440.MFTxugeQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180440.MFTxugeQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kernel/efi.c: In function 'efimap_populate_hugepages':
>> arch/loongarch/kernel/efi.c:79:33: error: implicit declaration of function 'pmd_mkhuge'; did you mean 'pte_mkhuge'? [-Werror=implicit-function-declaration]
      79 |                         entry = pmd_mkhuge(entry);
         |                                 ^~~~~~~~~~
         |                                 pte_mkhuge
>> arch/loongarch/kernel/efi.c:79:33: error: incompatible types when assigning to type 'pmd_t' from type 'int'
   cc1: some warnings being treated as errors


vim +79 arch/loongarch/kernel/efi.c

    54	
    55	static int __init efimap_populate_hugepages(
    56			unsigned long start, unsigned long end,
    57			pgprot_t prot)
    58	{
    59		unsigned long addr;
    60		unsigned long next;
    61		pmd_t entry;
    62		pud_t *pud;
    63		pmd_t *pmd;
    64	
    65		for (addr = start; addr < end; addr = next) {
    66			next = pmd_addr_end(addr, end);
    67			pud = pud_offset((p4d_t *)pgd_efi + pgd_index(addr), addr);
    68			if (pud_none(*pud)) {
    69				void *p = memblock_alloc_low(PAGE_SIZE, PAGE_SIZE);
    70	
    71				if (!p)
    72					return -1;
    73				pmd_init(p);
    74				pud_populate(&init_mm, pud, p);
    75			}
    76			pmd = pmd_offset(pud, addr);
    77			if (pmd_none(*pmd)) {
    78				entry = pfn_pmd((addr >> PAGE_SHIFT), prot);
  > 79				entry = pmd_mkhuge(entry);
    80				set_pmd_at(&init_mm, addr, pmd, entry);
    81			}
    82		}
    83		return 0;
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
