Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30741DACB4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 12:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733486587; cv=none; b=uIDuGknaipceJkWKhJh/gPdNeV5AtC9byBVv2vzaVYHiaPA0qa4WB34yNX7Ua+BMxkO53QbF9znPGiS1LRfUoTcjMC1SeGM4hhOybGfE47g6bsz0sh17Fzu2hGxuezkDa7VPsmAJIc/Jf6XehPLOAa4NAxKsxRcNiPS2goIrUpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733486587; c=relaxed/simple;
	bh=EU6pFtjZn4D0OF6KBwUWOO2+4C1ciDI+lVs2ObqJhms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UVQa4GFSXiq0YtMxOziRA2ysK+vFoc138cV1bdfTXVCB5esuq3bNG/rJUFx9zktMF+6mV5JZ5XU9wGZYXBQ3FhTP9FZPSbhvgjgf7Qkf4D3kwQkgSPMEqzjLZ3gNiHdq64UvK9fAl2B2sTCrl+L3wTdptlKn+o7GIk+GMTh9o8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9BG4UMx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9BG4UMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733486585; x=1765022585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EU6pFtjZn4D0OF6KBwUWOO2+4C1ciDI+lVs2ObqJhms=;
  b=D9BG4UMx2OavRXkSzO2amvxIE/TE2Gkk2ATHC6FVN0T8noKThFTNRkvH
   gg6g251JrB1ZE9NkYSg4Tz1bLXmb87seDFVf1R6ggA7HarmHUJqXf4hg1
   PUqDNUGiQuxNGK3TqhwgskZguPa7jw5SvPPVYSaD0sJjeT7ZLQVUJt1ou
   6fRfLzKDztgXwJlJ1T/XizIoPnz/4OZPzlJaKATLxDm54/AgymvneT7Bd
   HXhmb60Bj70okoEp8d3GPG5aIHkANpxJdrcKRofrNScVKQzxp8e508ZKK
   4t4bqH/AKaLR2Zub1Nd8I/fADBqSSuLG80EnluQ+HtbXlKdIC03B7p521
   A==;
X-CSE-ConnectionGUID: i1Z3bbEITi6kTDbg4Itovg==
X-CSE-MsgGUID: 9m1M5+G8S5anM5U+66tcdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44306657"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="44306657"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 04:03:04 -0800
X-CSE-ConnectionGUID: YLOq0wlFQ+6zEC5k2Qnjkw==
X-CSE-MsgGUID: 7Zav7rjvQSOx6k1G/oYx+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="95201524"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Dec 2024 04:03:01 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJX2w-00010m-2N;
	Fri, 06 Dec 2024 12:02:58 +0000
Date: Fri, 6 Dec 2024 20:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 mm/memory.c:4328:5: warning: no previous prototype for
 'follow_pte_pud_lockless'
Message-ID: <202412062007.glKlmTd9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: e3a809b4957e4eff7f1717fdbaf3544e52d2d29b [1/1] x86/cpufeatures: Force disable X86_FEATURE_ENQCMD and remove update_pasid()
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241206/202412062007.glKlmTd9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412062007.glKlmTd9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412062007.glKlmTd9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:4328:5: warning: no previous prototype for 'follow_pte_pud_lockless' [-Wmissing-prototypes]
    4328 | int follow_pte_pud_lockless(struct mm_struct *mm, unsigned long address,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/memory.c:82:
   include/linux/sli.h:62:13: warning: 'sli_check_longsys' defined but not used [-Wunused-function]
      62 | static void sli_check_longsys(struct task_struct *tsk){};
         |             ^~~~~~~~~~~~~~~~~


vim +/follow_pte_pud_lockless +4328 mm/memory.c

  4327	
> 4328	int follow_pte_pud_lockless(struct mm_struct *mm, unsigned long address,
  4329				    pte_t *ptep, pmd_t *pmdp, pud_t *pudp)
  4330	{
  4331		pgd_t *pgd, pgdval;
  4332		p4d_t *p4d, p4dval;
  4333		pud_t *pud, pudval;
  4334		pmd_t *pmd, pmdval;
  4335		pte_t *pte, pteval;
  4336	
  4337		pgd = pgd_offset(mm, address);
  4338		pgdval = *pgd;
  4339		if (pgd_none(pgdval) || unlikely(pgd_bad(pgdval)))
  4340			goto out;
  4341	
  4342		p4d = p4d_offset(&pgdval, address);
  4343		p4dval = *p4d;
  4344		if (p4d_none(p4dval) || unlikely(p4d_bad(p4dval)))
  4345			goto out;
  4346	
  4347		pud = pud_offset(&p4dval, address);
  4348		pudval = *pud;
  4349		if (!pud_present(pudval))
  4350			goto out;
  4351		BUG_ON(pud_trans_huge(pudval));
  4352	
  4353		if (pud_huge(pudval)) {
  4354			if (!pudp)
  4355				goto out;
  4356	
  4357			*pudp = pudval;
  4358			return 0;
  4359		}
  4360	
  4361		if (pud_none(pudval) || unlikely(pud_bad(pudval)))
  4362			goto out;
  4363	
  4364		pmd = pmd_offset(&pudval, address);
  4365		pmdval = *pmd;
  4366		if (!pmd_present(pmdval))
  4367			goto out;
  4368		BUG_ON(pmd_trans_huge(pmdval));
  4369	
  4370		if (pmd_huge(pmdval)) {
  4371			if (!pmdp)
  4372				goto out;
  4373	
  4374			*pmdp = pmdval;
  4375			return 0;
  4376		}
  4377	
  4378		if (pmd_none(pmdval) || unlikely(pmd_bad(pmdval)))
  4379			goto out;
  4380	
  4381		pte = pte_offset_map(&pmdval, address);
  4382		if (!pte)
  4383			goto out;
  4384		pteval = *pte;
  4385		pte_unmap(pte);
  4386		if (!pte_present(pteval))
  4387			goto out;
  4388		*ptep = pteval;
  4389		return 0;
  4390	out:
  4391		return -EINVAL;
  4392	}
  4393	EXPORT_SYMBOL(follow_pte_pud_lockless);
  4394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
