Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820827;
	b=N4LP85JDlHM8wBss7lcbvNPnCW39P4t3qvzp9z+5HtYjfMd7jkX19bcSVxxW+q5F8iCd
	 b5kNV4+fuplki38C0o8dCX8RhEVJ45jS+aApjj72A+1MZUZCXd9TB3pP/01LpARaUKN+3
	 jnPYrMZ7tBuRnDwi+V88k2gcHx93R0X5n/Y0nFAJlJW4FvjwNgce3wR+t93gm6T5W+Kj3
	 2au3K7am/QE/zhVrJFNakETzpdcHusenYpcOPs2qpDHCRCwas1lXmMI55FXc4q0Q9onbz
	 ILruUxxgy8SC0axE6EzlD4rd+DknUowEM0WO5qdsQAFOz+SoO7Zzvvx4FN3jp2Av2ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820827;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=tUwHObpOl3CY3PAqJptL/B9s+GTI2SkMBE8CDDu9IHs=;
	b=fdVio86IkN4vdF7e+h4XPMhH9kwRks3bg+rPobyb0m9Aj8Z1dJuUsmnwMlK92OASwkKG
	 iiBfnL8c8XZcOpZ8o7sCqpYUeZXyBNtjRROZc20sdrP03UlYLdRLNA643ICaHkJNbEqlu
	 LKddGlxutuoFZhbe9NJuDbvRh0hzFZ+la9Ua1Oe9quMuhaPgsi8okAYyGO34bwZIIHr7c
	 vxGkw7f/IawD2aLf6NaQBva+lCFwa7552RvQnmCcrRN9CgYda4SZhevuBKeO3Kn5leVC/
	 n8Dld+CmVyAoZD2PUZKJPD4ygSVHszvaFrE2MPmxLGJW4JF88qstrqwCOI2dxBWr85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YJQmp1wI;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6FB606D4C5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 19:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A6FB606D4C5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YJQmp1wI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793820825; x=1825356825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5G/kchI3waL86lAbJlMrLdiOD/VnP6iExbFUvHIrXo8=;
  b=YJQmp1wIh+TCIe6W0uwuMK/fBjk6AvQ36OGGbNH4iCJTD7gu2/GjAXch
   Hod6ln7qJSUVlhRHGydWUu7NBXpBTDxXoA29nDZgrvnF0yddqCJehIR5s
   OTll76xdjl6A4cUpRtHmGJmflbQgzBl7VSGylu808LBVifLYm2PDp83lv
   NlEfZ1jVCdsGgo3ocvn7DMv0iSEfAWHLGq76LVZ4oZKUzBOTTKJoHae9j
   ttb61WBUzWDvixwH/QHIz+7yZvhfF4zWISp/oXMTT0XRNGc+fIdUHqcYq
   UW3jgdscWl9yIUT21Y/EX20jg7QqNdIeuNo9KLebWKj37MKiUnJEP9VPH
   Q==;
X-CSE-ConnectionGUID: WMJM19qSRiqh27XBeZPTfg==
X-CSE-MsgGUID: w4PUZ3EpS96fEfHrd7YvWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2584961"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2584961"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 11:33:44 -0800
X-CSE-ConnectionGUID: DKM1KAqDReabECxgcIxyag==
X-CSE-MsgGUID: UOAusULrQkK+YseUE8nXjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="8581464"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 04 Nov 2026 11:33:43 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOgjs-00000000kud-0trk;
	Wed, 04 Nov 2026 19:33:40 +0000
Date: Thu, 5 Nov 2026 03:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] mm/mmu_notifier: add
 MMU_NOTIFIER_RANGE_PERM_UPGRADE
Message-ID: <202611050334.WOJIboG8-lkp@intel.com>
References: <20261029143336.390231-5-clopez@suse.de>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029143336.390231-5-clopez@suse.de>

Hi Carlos,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next mst-vhost/linux-next linus/master v7.3 next-20261030]
[cannot apply to akpm-mm/mm-everything kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Carlos-L-pez/mm-mprotect-add-MM_CP_PERM_UPGRADE/20261029-153334
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20261029143336.390231-5-clopez%40suse.de
patch subject: [RFC PATCH 2/4] mm/mmu_notifier: add MMU_NOTIFIER_RANGE_PERM_UPGRADE
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20261105/202611050334.WOJIboG8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050334.WOJIboG8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050334.WOJIboG8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mprotect.c: In function 'change_pud_range':
>> mm/mprotect.c:600:38: warning: variable 'mn_flags' set but not used [-Wunused-but-set-variable=]
     600 |                         unsigned int mn_flags = 0;
         |                                      ^~~~~~~~


vim +/mn_flags +600 mm/mprotect.c

   573	
   574	static inline long change_pud_range(struct mmu_gather *tlb,
   575			struct vm_area_struct *vma, p4d_t *p4d, unsigned long addr,
   576			unsigned long end, pgprot_t newprot, unsigned long cp_flags)
   577	{
   578		struct mmu_notifier_range range;
   579		pud_t *pudp, pud;
   580		unsigned long next;
   581		long pages = 0, ret;
   582	
   583		range.start = 0;
   584	
   585		pudp = pud_offset(p4d, addr);
   586		do {
   587	again:
   588			next = pud_addr_end(addr, end);
   589			ret = change_prepare(vma, pudp, pmd, addr, cp_flags);
   590			if (ret) {
   591				pages = ret;
   592				break;
   593			}
   594	
   595			pud = pudp_get(pudp);
   596			if (pud_none(pud))
   597				continue;
   598	
   599			if (!range.start) {
 > 600				unsigned int mn_flags = 0;
   601	
   602				if (mm_cp_is_perm_upgrade(cp_flags))
   603					mn_flags |= MMU_NOTIFIER_RANGE_PERM_UPGRADE;
   604	
   605				mmu_notifier_range_init(&range,
   606							MMU_NOTIFY_PROTECTION_VMA, mn_flags,
   607							vma->vm_mm, addr, end);
   608				mmu_notifier_invalidate_range_start(&range);
   609			}
   610	
   611			if (pud_leaf(pud)) {
   612				if ((next - addr != PUD_SIZE) ||
   613				    pgtable_split_needed(vma, cp_flags)) {
   614					__split_huge_pud(vma, pudp, addr);
   615					goto again;
   616				} else {
   617					ret = change_huge_pud(tlb, vma, pudp,
   618							      addr, newprot, cp_flags);
   619					if (ret == 0)
   620						goto again;
   621					/* huge pud was handled */
   622					if (ret == HPAGE_PUD_NR)
   623						pages += HPAGE_PUD_NR;
   624					continue;
   625				}
   626			}
   627	
   628			pages += change_pmd_range(tlb, vma, pudp, addr, next, newprot,
   629						  cp_flags);
   630		} while (pudp++, addr = next, addr != end);
   631	
   632		if (range.start)
   633			mmu_notifier_invalidate_range_end(&range);
   634	
   635		return pages;
   636	}
   637	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
