Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013354D9FF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709628110; cv=none; b=jlyCAjuClEOy9HcnCEVQ6ERC3sN7PFzTHytOXoMztdrKVuq5rMfzswM2/3cC6/2ZLSQ93YUHZv6gndqSveRGsBHgdOqBqy3rM81DbCL2r/hJ2Qtrn3rd8/cLWzHJByflNx7JXitLz/+Jl93ZCJ/QNuKoDtYH1VTehiK1x1MCIeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709628110; c=relaxed/simple;
	bh=mats6R5TEJCTl6c9bWw64Jnc2dxDKdgqAAxKIWqW2xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cVPukhIPoEKXrOMk2+CPwc7OV4IzZ4pCTGWbViCFgbaNpNskUZV808waU6hY60rjkgnLZrOs8trqY17SivrkORH6NRP7fw/mc/zuW0SwI5lm8eNVvyRdbYNeWJ+snatV4rrFajPqffcXfHIn7WOMScbLADLy1xXr4Y3XnDFrDPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQxj1dus; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQxj1dus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709628108; x=1741164108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mats6R5TEJCTl6c9bWw64Jnc2dxDKdgqAAxKIWqW2xQ=;
  b=MQxj1dusBS0vYNbk4bJMmUR9bao3TAVC+a7oUg31oSqj+asIjy46b1Kt
   trid0eEP0dG2x5Sw3wrRDwTUPg9umJr0wamN4YvyBzG2irBMtsWYR0nXT
   YPXXDuO9te4PFHPc2ecO1A3JdEMCbFnz/wb5GNn5MGebS5cMBt21HkalK
   0zfh2R3ai+cJE4Tbnee7DXUL0DAw70/N5fl29k+qN4ooN5lmoYZzgwi0y
   7JFWpHJhVpfEQ5s32rirTDVxwBkJn5qJkxjHs2Y9ww85MJcrqwgA9PwM1
   g67VzPBabgkD5gyvYaqJcNTXvwZzw+N66jhNEd2mmkyR6d7ADqMQU55QL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7111881"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="7111881"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 00:41:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="13981637"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2024 00:41:39 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhQMi-0003A1-1a;
	Tue, 05 Mar 2024 08:41:36 +0000
Date: Tue, 5 Mar 2024 16:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: mm/memory.c:4328:5: warning: no previous prototype for function
 'follow_pte_pud_lockless'
Message-ID: <202403051607.tUoeLXS6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 0c2460f7e0abea3ec8c2a0482783a2d0d9509dfd x86/cpufeatures: Force disable X86_FEATURE_ENQCMD and remove update_pasid()
date:   9 months ago
config: x86_64-buildonly-randconfig-002-20240305 (https://download.01.org/0day-ci/archive/20240305/202403051607.tUoeLXS6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051607.tUoeLXS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051607.tUoeLXS6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:4328:5: warning: no previous prototype for function 'follow_pte_pud_lockless' [-Wmissing-prototypes]
    4328 | int follow_pte_pud_lockless(struct mm_struct *mm, unsigned long address,
         |     ^
   mm/memory.c:4328:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4328 | int follow_pte_pud_lockless(struct mm_struct *mm, unsigned long address,
         | ^
         | static 
   In file included from mm/memory.c:82:
   include/linux/sli.h:62:13: warning: unused function 'sli_check_longsys' [-Wunused-function]
      62 | static void sli_check_longsys(struct task_struct *tsk){};
         |             ^~~~~~~~~~~~~~~~~
   2 warnings generated.


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
