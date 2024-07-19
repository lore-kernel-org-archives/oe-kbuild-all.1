Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3651459EA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721403091; cv=none; b=k+0Ah1pnw+Y86yDy8qylX2ywFS/971tzxlDa9oGSbIIjuWuUxKZdyouIeftt00mfwY8kWCLGDiVy/KfrAmGH1cFMoJ1fqPlpr1enXmsR3HpRvL00ceQsPBFttP4NaALbT3Q/PXqhMe3zUdwRmjl1KUOwIxpv2tQ4yMdP2KPr9hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721403091; c=relaxed/simple;
	bh=9MjA9BWM8OeZJuOliD5TUsZWIKyw8pxvAoeughFldpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fjR5u/u4GM8nXPf2sF6NMn547trkkasnhUr7BUd3U88K2iNm4vOVPW36WFed2rnzZiy6XxG/BG8R6h94iVpXUOIag6D+oJvDQ7TZp/ZDLmyTBR1bnZcLPhZ0Ch3qlJCr0g+w4fcto+8bPJ9doAamjw7wwBKpV7AiDBfrXAYwt6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g++gSfqW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g++gSfqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721403089; x=1752939089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9MjA9BWM8OeZJuOliD5TUsZWIKyw8pxvAoeughFldpc=;
  b=g++gSfqW/Xy5//msCRTPGglOTtwdW3KBDLcyJPt6kTF4UcuZa1YbL5AI
   gY9YE39ClR0tvz7cBCggFQUL5h6+2tl+NUDOA9wh7dF0kfIN8jEsTF7SV
   NlqolFoAAH41MMWPQzWjcRZ5U6TjbGBILPmPsJMEgHbaeHRGLVzfKO4VS
   nKT82JcASu/Y1sggrAIsJAYsfX3RFwKNd+K67PebMz8egnaKSdF4WEc3Q
   1WyBbJKX7gcqzi9GuuwBrw+n6XwA4DsyYZjXsD4mKwYGJiKnw5a0aRXoM
   EIonKq8J1en+h3H5U1c58Rg242j6guWiqu/3U9GywX+GiL2n8gRWL3Cyn
   g==;
X-CSE-ConnectionGUID: FZPEQrHVS7+nD2S1jCK97g==
X-CSE-MsgGUID: JFD4dOQSRUCDrnNO8BgoZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22883583"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="22883583"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 08:31:29 -0700
X-CSE-ConnectionGUID: LN5wFOFASXCWlaOnIjgzUw==
X-CSE-MsgGUID: L/6QS/ySQ0efAXJDfeF+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="51427254"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Jul 2024 08:31:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUpZt-000iIE-13;
	Fri, 19 Jul 2024 15:31:25 +0000
Date: Fri, 19 Jul 2024 23:31:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 24/24]
 arch/powerpc/mm/book3s64/radix_pgtable.c:1416:32: error: assignment to
 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'}
Message-ID: <202407192317.ndjVSsNG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   1b8055a77a554efe27ddb832b98e94dd083db08d
commit: 097194bcb4751e69a198ff50da9fa73f9c6e9e9f [24/24] mm/pgtable: convert ptdesc.pmd_huge_pte to ptdesc pointer
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240719/202407192317.ndjVSsNG-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407192317.ndjVSsNG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407192317.ndjVSsNG-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/mm/book3s64/radix_pgtable.c: In function 'radix__pgtable_trans_huge_deposit':
>> arch/powerpc/mm/book3s64/radix_pgtable.c:1416:32: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Wincompatible-pointer-types]
    1416 |         pmd_huge_pte(mm, pmdp) = pgtable;
         |                                ^
   arch/powerpc/mm/book3s64/radix_pgtable.c: In function 'radix__pgtable_trans_huge_withdraw':
>> arch/powerpc/mm/book3s64/radix_pgtable.c:1428:17: error: assignment to 'pgtable_t' {aka 'pte_t *'} from incompatible pointer type 'struct ptdesc *' [-Wincompatible-pointer-types]
    1428 |         pgtable = pmd_huge_pte(mm, pmdp);
         |                 ^
>> arch/powerpc/mm/book3s64/radix_pgtable.c:1433:40: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pte_t *' [-Wincompatible-pointer-types]
    1433 |                 pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
         |                                        ^


vim +1416 arch/powerpc/mm/book3s64/radix_pgtable.c

bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1397  
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1398  /*
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1399   * For us pgtable_t is pte_t *. Inorder to save the deposisted
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1400   * page table, we consider the allocated page table as a list
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1401   * head. On withdraw we need to make sure we zero out the used
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1402   * list_head memory area.
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1403   */
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1404  void radix__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1405  				 pgtable_t pgtable)
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1406  {
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1407  	struct list_head *lh = (struct list_head *) pgtable;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1408  
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1409  	assert_spin_locked(pmd_lockptr(mm, pmdp));
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1410  
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1411  	/* FIFO */
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1412  	if (!pmd_huge_pte(mm, pmdp))
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1413  		INIT_LIST_HEAD(lh);
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1414  	else
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1415  		list_add(lh, (struct list_head *) pmd_huge_pte(mm, pmdp));
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29 @1416  	pmd_huge_pte(mm, pmdp) = pgtable;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1417  }
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1418  
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1419  pgtable_t radix__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1420  {
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1421  	pte_t *ptep;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1422  	pgtable_t pgtable;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1423  	struct list_head *lh;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1424  
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1425  	assert_spin_locked(pmd_lockptr(mm, pmdp));
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1426  
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1427  	/* FIFO */
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29 @1428  	pgtable = pmd_huge_pte(mm, pmdp);
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1429  	lh = (struct list_head *) pgtable;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1430  	if (list_empty(lh))
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1431  		pmd_huge_pte(mm, pmdp) = NULL;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1432  	else {
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29 @1433  		pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1434  		list_del(lh);
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1435  	}
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1436  	ptep = (pte_t *) pgtable;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1437  	*ptep = __pte(0);
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1438  	ptep++;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1439  	*ptep = __pte(0);
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1440  	return pgtable;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1441  }
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1442  

:::::: The code at line 1416 was first introduced by commit
:::::: bde3eb6222e49673d2ee9dfdc6ab6e7b6ff69e91 powerpc/mm/radix: Add radix THP callbacks

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
