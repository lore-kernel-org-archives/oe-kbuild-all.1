Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA69484D0E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727127710; cv=none; b=Cf583U6fQ6XKYM/hGsoroUYVDXRq/01UwPt53SuKMFJCEyafXR2H72l+RPYvn00hgzECM5HStuCQ0q6kcNVHcn7az+TLraGDrPql3jneo2DOppAKZ3/9TkX4ZReXkTzaHsQ2xTL7BsXB5Y5cH5sd+T5TKoY1szWAeRU8dbvflPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727127710; c=relaxed/simple;
	bh=yQ7SvhN+NOHppBzYaCFHhv/rfeLJFdvP8EzY4rjouAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FTKWFmMSTeC5vxd1vdOnorFjvSJ7AnwMXwbleehBhLIuvBUllXFeFN/rJcXGlMz78xXhEXlKTs+8c/+A7OiXKBkG9STZF9aQ4euTFF8vF7rgpA/EglLRdz9UYG8R6+FeNSrRhVuA3zRz45F1IqftxM6r5EqdFSrqv7xVCdgbvUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtxI0w8H; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtxI0w8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727127709; x=1758663709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yQ7SvhN+NOHppBzYaCFHhv/rfeLJFdvP8EzY4rjouAE=;
  b=JtxI0w8Hr5UQ6chg8uYzWLNpyfUKMABkpQtLA2D6bUeLcnsxGsjC1Mne
   8GpktInUzw2T/q5corZ5ATUhuFXR35Z3YrPzwE8doEfVXA4Hy/v+1alLi
   fuiKaM1Laxv8qzvkj1MKIG6vYcYp57Hfr+uyDXiEDNlsgqV/yflAI4g3U
   hAzpriZLg20A/J7XiN5TuBsbsw/UcR9Z/f7dSVRu/nYTFZmTod0LzP7LQ
   VR1/F8qiBagiKfC9GlG36oz7dZ4fJMD6blGDstH2NDaeQmEOnAgszshqV
   fx3+fk82rPMetJ0PvkzOgF+pkmPCNQRt+Cek6oHwSve1vilQBfjmPK/8J
   g==;
X-CSE-ConnectionGUID: 7U7ww8uRSICLB7Mt5IRNQg==
X-CSE-MsgGUID: bnU0tzjiQxSCN+rRT5JHjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29815133"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="29815133"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 14:41:49 -0700
X-CSE-ConnectionGUID: BL8bBGDzSSGeFuhDT4FdSg==
X-CSE-MsgGUID: AefaOj/ITTSLGh3QkXCSxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="75307016"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2024 14:41:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssqoQ-000Hcj-28;
	Mon, 23 Sep 2024 21:41:42 +0000
Date: Tue, 24 Sep 2024 05:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 101/2441]
 mm/memory.c:4328:5: warning: no previous prototype for
 'follow_pte_pud_lockless'
Message-ID: <202409240540.SWnkmQPG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: e3a809b4957e4eff7f1717fdbaf3544e52d2d29b [101/2441] x86/cpufeatures: Force disable X86_FEATURE_ENQCMD and remove update_pasid()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240924/202409240540.SWnkmQPG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240540.SWnkmQPG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240540.SWnkmQPG-lkp@intel.com/

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
