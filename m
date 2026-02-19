Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510332E0B71
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 20:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771533769; cv=none; b=mr3dlH9Z1SLvsUYDDVwl2hoOxSWwVHCDrJmyZGWTa+boKbgbF870+jbAtd3+6kk/crhjtUm7OEywmk+KsLD0EBFTaq0emUEKc7ty+c+UjC3cMXXk9fjFznWNshenuWIIMjChJlnWrOYJ0cuYQ9leigM0C816srWFfwmtgcLM+nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771533769; c=relaxed/simple;
	bh=19kymQWiv9WA2DkjttYnXOKqDiRyjOmhPmwaORaBZHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PO2q/rdVN7zbm44XgEiBIWtR8pY9If3EAUZYHh83+UV1NJ3Vd0QAokbvrimzeOcPrG5DK+/nCisFzTWbmv/oh/u8vWx0aFVYSSGqucPozlq9UBHSE9TIZESX7TR1c53Dp954RRGslYvwt1z7E75RyH0TYpQoOk+VTCDBTn5tuXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVTQE0PJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVTQE0PJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771533769; x=1803069769;
  h=date:from:to:cc:subject:message-id;
  bh=19kymQWiv9WA2DkjttYnXOKqDiRyjOmhPmwaORaBZHQ=;
  b=RVTQE0PJJ8erqmWXXnHitESvt6o+2Ue57m1iavByj/lWJGEQNt1uN61J
   +OumrIH5eQTEakfiLmFO2Bz2nrwQN3ensi7OKQxjqlvBIw2wSakN3JU6c
   EHNj1M4Yx+p5rTTDTc9mDES3d+gelmkXDNi2Lpo+HMYwFRKB2ONA+52tq
   Mzsy2mcll9/HG4nnCqo2ZJgK1sOF3vYJacXRz6HcS7z2JHx0Ep8sbuw/U
   lLcpryyQ0X4nCtT3eYSGwGeHd/eArJue6pPb1ZRFxKtLr73Br7wRlCJGk
   ArZTLponhILalgr6XaOPfMbPDPxp/7RryjaVN2AvW7Dg/SLVWZ/BTpkQW
   A==;
X-CSE-ConnectionGUID: v56OV9vVRcKimPLi0Bpblw==
X-CSE-MsgGUID: gmdInYuyQ12RBP6TYToWEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76470782"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="76470782"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 12:42:48 -0800
X-CSE-ConnectionGUID: +8Tj71MFSu2ATIVRA3fwLA==
X-CSE-MsgGUID: l0ZmvKVoTJa1QAS+5MKpXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="243213479"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Feb 2026 12:42:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtArE-000000013Wy-2noE;
	Thu, 19 Feb 2026 20:42:44 +0000
Date: Fri, 20 Feb 2026 04:42:28 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:cleanups 6/8] mm/internal.h:531:13:
 warning: 'sync_with_folio_pmd_zap' defined but not used
Message-ID: <202602200458.H8Ty8Ep8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux cleanups
head:   226aaf624b5bda2b1238ba0c4e289fc23c7d04fc
commit: 8e910a0e64c988f4e8a324d3da73c3b3004f5682 [6/8] mm: remove two leftover compound_mapcount() comments
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260220/202602200458.H8Ty8Ep8-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200458.H8Ty8Ep8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200458.H8Ty8Ep8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:54:
>> mm/internal.h:531:13: warning: 'sync_with_folio_pmd_zap' defined but not used [-Wunused-function]
     531 | static void sync_with_folio_pmd_zap(struct mm_struct *mm, pmd_t *pmdp)
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/sync_with_folio_pmd_zap +531 mm/internal.h

   518	
   519	/**
   520	 * sync_with_folio_pmd_zap - sync with concurrent zapping of a folio PMD
   521	 * @mm: The mm_struct.
   522	 * @pmdp: Pointer to the pmd that was found to be pmd_none().
   523	 *
   524	 * When we stumble over a pmd_none() without holding the PTL while unmapping a
   525	 * folio that could have been mapped at that PMD, it could be that concurrent
   526	 * zapping of the PMD is not complete yet. While the PMD might be pmd_none()
   527	 * already, the folio might still appear to be mapped (folio_mapped()).
   528	 *
   529	 * Wait for concurrent zapping to complete by grabbing the PTL.
   530	 */
 > 531	static void sync_with_folio_pmd_zap(struct mm_struct *mm, pmd_t *pmdp)
   532	{
   533		spinlock_t *ptl = pmd_lock(mm, pmdp);
   534	
   535		spin_unlock(ptl);
   536	}
   537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
