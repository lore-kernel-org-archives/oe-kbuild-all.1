Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BEC1CA9F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721131377; cv=none; b=BypoLOn/8Otl5yLlVrjd3JZxwO4kbvjKVK8H04hx19WpV1WtGaxoBXohsl+aaPtklhp2+Xcuc9zpkox06xafnVczAB83kyNXUAv1hjsAWqM4+MPx8hLLD6AxKR5upY4fafdBgzo0AsQ0WdFm6xkHy011wAx19ePCnyWU1hc0R8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721131377; c=relaxed/simple;
	bh=z+BN93a7sCG3IISikKABf2AvZAiyvOeO1eCPO18Oegk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7kYJAmQwXish90Z6gNAjzWufbLvj9oFb9pyj82C80TAxDmNoZg69Hi4rcjlb90ImVBUZKXw01AmfzfWlkNz7xkvSY4yIf6MoaM8AkrFzf1DxlR2drrEQiZP2M8F4DNPaL1SlKwfl1zdmVmPyu6uoBit0JutoudmweArcw1qqAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npxSp4RT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npxSp4RT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721131375; x=1752667375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z+BN93a7sCG3IISikKABf2AvZAiyvOeO1eCPO18Oegk=;
  b=npxSp4RTvHkhPNcBf0oMpuwJ5a6m7vR7jJ8i/9Ojo+ua8fOfOPCSUkYb
   JjCUs/g19Ujp2NcwEm83B2qmnP7wRhINJxJ8b37KzPgvbwXyDMAOCGvrx
   6HrUxs1wzD+zfXTW0vLWTbohaU23TAKrxnlR1WKeTSN1DGv2tJoQMC7vi
   424hOueTjFBpntc6svxEu2YBObmNLKdJwjiO81ogm6AkPb+9G9BPxMoLW
   ZGgmP2xb+UnO0WzwujZz7y7Q5NsIvBsMK7LCWzGrZ/VwPJvIE58ZIGCgw
   3fcQqHLB3b5RqyANBddfTDHBpc75M92QCOR/rDAq597zyyWNRnLbYsOYn
   g==;
X-CSE-ConnectionGUID: PQDUH2EMTj6axv0bCzJLFg==
X-CSE-MsgGUID: 7OhcBz+gSKmiIt6LycIz5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29239449"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="29239449"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 05:02:54 -0700
X-CSE-ConnectionGUID: weESrnw+QxygbgJ3tTSJSA==
X-CSE-MsgGUID: kQA7Ma4rT/m+bGuXTbVyhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="54530142"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jul 2024 05:02:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTgtN-000fBC-0w;
	Tue, 16 Jul 2024 12:02:49 +0000
Date: Tue, 16 Jul 2024 20:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 14/48] arch/loongarch/kernel/efi.c:79:33: error:
 implicit declaration of function 'pmd_mkhuge'; did you mean 'pte_mkhuge'?
Message-ID: <202407161922.xXtF3fUX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   11cf99a210e4916f7a066658c851c08ab6b123ce
commit: eae789a8713d7a3a35cf81fa0d1186231c99eb6d [14/48] LoongArch: add kernel setvirtmap for runtime
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240716/202407161922.xXtF3fUX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407161922.xXtF3fUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407161922.xXtF3fUX-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kernel/efi.c: In function 'efimap_populate_hugepages':
>> arch/loongarch/kernel/efi.c:79:33: error: implicit declaration of function 'pmd_mkhuge'; did you mean 'pte_mkhuge'? [-Wimplicit-function-declaration]
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
