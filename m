Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B9C231CA0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728807044; cv=none; b=dJrHIaLlFzflvoU/yk3p/ioUBDoA2Ys6dE9ZFu+odDXDZ1KvFwgmPepwyhtRZ/l4amo107F+dLktXT7Gyp8udwpAM7vm9UqqBc+Qo/tsAXkMP0c55n/e8uNMWZCSJaNm7+pK1cQgoQPAh1bhDt22IjW5PPWe6oxww0TjEwjbbpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728807044; c=relaxed/simple;
	bh=ceB+kK+eDUBmUiyvyQEKGxpIajz+42e+CL4bKcUhq6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qIzbAC02OWYP4tkGF5tYt5TLRo6FRzwQwfGs+obxrByeLboLKg9nYgiV6BCSzmmziMTae+BjrxOVpb0AQj/dVOSrbVrLHC7YE7yPayjoeYNkBo7U2f8ERFGdmoSLmXmTsVbP3MowW2vwqCT2nG3vmpwSuhMPjOHT8DSwcLB8+rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAY2veIr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAY2veIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728807043; x=1760343043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ceB+kK+eDUBmUiyvyQEKGxpIajz+42e+CL4bKcUhq6s=;
  b=hAY2veIrjut1HHchzDvV01hmn0FSiKj/eutN7+kAlnR4byhZdNvsfef/
   kYT2lup1AXSZYs+1KtrvtyQOuAFKFZpj+hmEBIgOQKlncKS8VRlyHuuem
   +nbMPLq08bYNNNREXof/rok5XDpsysHBqSQI9z8Moq1rQSTg7uUce7BfQ
   No/f+/3FjrKWXRkuliy/X8dQi/bNOLANNzJgTeZ0pVUzPz3Cd7JMph0Yi
   slPnufkHpEpI+x6zWY0iMaaEIaFftGwg1nc77qZK7r8pjUa7gL5zjBPHV
   oLfS8zv9xjFKhWx/XJdpTxjcPqPk56mOs0zWNKXpYA1ZElf8HsO/WU7uo
   Q==;
X-CSE-ConnectionGUID: FVkmTtH0Rhm7ZtxkYTNPrA==
X-CSE-MsgGUID: +d1WTHh5QUm8ARYdSdzKeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28292838"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28292838"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 01:10:42 -0700
X-CSE-ConnectionGUID: JIL//9gtRnup9H0Iq4uXMQ==
X-CSE-MsgGUID: toxLeMEqQaGOJUbhU7saWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="77462836"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Oct 2024 01:10:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sztgU-000ECp-0Y;
	Sun, 13 Oct 2024 08:10:38 +0000
Date: Sun, 13 Oct 2024 16:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 776/14354] arch/loongarch/kernel/efi.c:79:33:
 error: incompatible types when assigning to type 'pmd_t' from type 'int'
Message-ID: <202410131602.KKBCfYOV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liuyun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b52135712fc8eae0751505713e1caf086a1437d4
commit: 221e2e8bdbb851a519df0bac5a44298dae2b4612 [776/14354] LoongArch: add kernel setvirtmap for runtime
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20241013/202410131602.KKBCfYOV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131602.KKBCfYOV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131602.KKBCfYOV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kernel/efi.c: In function 'efimap_populate_hugepages':
   arch/loongarch/kernel/efi.c:79:33: error: implicit declaration of function 'pmd_mkhuge'; did you mean 'pte_mkhuge'? [-Wimplicit-function-declaration]
      79 |                         entry = pmd_mkhuge(entry);
         |                                 ^~~~~~~~~~
         |                                 pte_mkhuge
>> arch/loongarch/kernel/efi.c:79:33: error: incompatible types when assigning to type 'pmd_t' from type 'int'


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
