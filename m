Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793204765;
	b=G8CJdNSK1ICZKmPXTKrNmn5MSgShH0HS2oxq+3Rf86rovUZ/r7zWM0w5UPZYmIFyR/E/
	 uSJYgUPGgL4ZOHQXpIsnQgayEYfEpfHD02dAJT19ZU0GrRYCLvDBR0j96FQ+3nVSw/6AQ
	 7lH65Y3xME+uMa1dRP5oaLG2VQFOURMDOA9g3HOosLhGqyXb3GltnfyQpQNkYG08OYFVx
	 tGKagWkDbk3jEOLRSEsxQIFu1t5tAVLT3bsC6EVSBI2kki8KqYDki5utEiR+Qy+hFP1LL
	 I/9EbqY6JNYIbSbjJt+c79HjH45oyzcoCfABfjnfUO1nh/7uiTeuhGPTBFv6Spgs6YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204765;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1i/ioV1hYwCyl8F2D59vwF4oGMoZ7TrbmX0LHIA/gQ0=;
	b=DTGe1cnD18/CXX0yo1HYvcHigwainXhaQ0jyXy3uT/BKHIiFt7fwA5hI8ip9fQkJ75Hd
	 MhrRsrJH/6aZDGQ5L9IBG1mf7mZMkihx3nMwhF5z+tsyvxXrBo1XuNabkZXjyu4j3QIf0
	 pOZkDQRZETS3vb0U2NNgzyU0a7XE14cb0DTwjSldFJZCEnjQo3CXKywg0qJRZusrSxeBd
	 RWhEpZH7xDznPyNwQ0FKfU6LPj4eAaBJk1IBmC7JCwWV8I+W2os80ec39Pv+r/vu4bI0G
	 8j9Hf6msydD9DIgoYuOMFo9L0/vDcHlukSuL5ZhG24utQFkwqASi+y5BDdXvUU3qnkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jEhHT1eE;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D65B606A320
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 16:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D65B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jEhHT1eE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793204764; x=1824740764;
  h=date:from:to:cc:subject:message-id;
  bh=CTVWqLF57o+DR4NAjQFeRnjawkPdwLim1M/Rrj1CbYE=;
  b=jEhHT1eEnPuNzxe4n1I11LtmvCV74Maz7etU0R3GmFwY6Jjxpf6aHXOo
   o0fm6TezrEooCQ3nFt1V6E6zz3x6/6k5EF+NUflzQBqSKkRXiC/uiaWdA
   41TuDMIIIJt52Wgo6j7B01pOdMg20eED9yscWskwHBFI8uXpgORJjgQiw
   Aj0jzeQddUXea52iNcNFI+D/OUbyOufy0y3QhqV13aA2KTVIRW3rUOOmX
   g9lwBwdzBHcD4PZBfugB6N2e3B0GsaE9txD6cGRb0nMxR16xWPZ0jnObP
   SVlVGWboiBLzwCbKKaJC5gtij22rO8e6THhPlNChuZTXIVtYLg92pTG/9
   g==;
X-CSE-ConnectionGUID: 6vtlbsinRGiT18KoXl65SA==
X-CSE-MsgGUID: 5mnCke56QzalEw+0yLBtcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1961671"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1961671"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 09:26:03 -0700
X-CSE-ConnectionGUID: b2TOV8MSRIyIWCsizjffjg==
X-CSE-MsgGUID: 6XcQ5FtZSEGEDEq/m1HvBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="6698296"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 28 Oct 2026 09:26:02 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM6TP-000000004vD-3GNH;
	Wed, 28 Oct 2026 16:25:59 +0000
Date: Wed, 28 Oct 2026 17:25:43 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/memory.c:5965:15:
 warning: unused variable 'pmd'
Message-ID: <202610281720.R8jrsbWO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Xu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e404899677bc470e620572471a562f09ea3de082
commit: bd617fc27c23d34e76440e74b3834c287b878d07 [9/9] anolis: mm: support fast reflink
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261028/202610281720.R8jrsbWO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281720.R8jrsbWO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281720.R8jrsbWO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c: In function 'fr_apply_vma':
>> mm/memory.c:5965:15: warning: unused variable 'pmd' [-Wunused-variable]
    5965 |         pmd_t pmd;
         |               ^~~


vim +/pmd +5965 mm/memory.c

  5956	
  5957	static void fr_apply_vma(struct vm_area_struct *vma)
  5958	{
  5959		struct mm_struct *mm = vma->vm_mm;
  5960		unsigned long start = vma->vm_start;
  5961		unsigned long end = vma->vm_end;
  5962		unsigned long next;
  5963		spinlock_t *pml;
  5964		pmd_t *pmdp = NULL;
> 5965		pmd_t pmd;
  5966		bool applied = false;
  5967	
  5968		do {
  5969			next = pmd_addr_end(start, end);
  5970			if (follow_pmd(mm, start, &pmdp))
  5971				continue;
  5972	
  5973			pml = pmd_lock(mm, pmdp);
  5974			if (pmd_huge(*pmdp)) {
  5975	#ifdef CONFIG_FS_DAX_PMD
  5976				if (!pmd_dirty(*pmdp) && !pmd_write(*pmdp))
  5977					goto unlock_pmd;
  5978	
  5979				pmd = pmdp_invalidate(vma, start, pmdp);
  5980				pmd = pmd_wrprotect(pmd);
  5981				pmd = pmd_mkclean(pmd);
  5982				set_pmd_at(mm, start, pmdp, pmd);
  5983	unlock_pmd:
  5984	#endif
  5985				spin_unlock(pml);
  5986				continue;
  5987			}
  5988	
  5989			if (pmd_none(*pmdp) || unlikely(pmd_bad(*pmdp))) {
  5990				spin_unlock(pml);
  5991				continue;
  5992			}
  5993	
  5994			if (IS_ALIGNED(start, PMD_SIZE) && (start + PMD_SIZE <= end)) {
  5995				pmdp_set_tbl_wrprotect(mm, start, pmdp);
  5996				flush_tlb_range(vma, start, start + PMD_SIZE);
  5997				applied = true;
  5998				spin_unlock(pml);
  5999				continue;
  6000			} else {
  6001				spin_unlock(pml);
  6002				fr_apply_pte_range(vma, pmdp, start, next);
  6003				flush_tlb_range(vma, start, next);
  6004				continue;
  6005			}
  6006		} while (start = next, start != end);
  6007	
  6008		if (applied)
  6009			vma->fast_reflink = applied;
  6010	}
  6011	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
