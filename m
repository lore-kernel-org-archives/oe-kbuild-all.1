Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B891CAA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 18:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727633272; cv=none; b=I+rW6pAkIKCIdCk62R9bvwCnOBvhnSvnaDuTXWYoVDi0ace/qcpk3x46gQcvqtZOUl36teZSNlFM6zKUY8I4RlHKo2xfkuXr6H/c/rRityS7BdrlTg4QCE3eKCVPFqdCFId4Ibz0Bj25msh3jtyE1bDBxtaF/7jVkZrrAC/VDe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727633272; c=relaxed/simple;
	bh=OKZRlto6bme4pY6xUhILVrQ06QMYGyCK+9kgU69ORNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8hFFIZeN4xKmAtPe5MnYmwvvENBiNHLwATNlY0UdNmEKc46DnUPhIPJSN9bpyeG1B6hp9GLpAGl9bTGlX32fFSaQhaxBO9ucAoSOycVpPMfymKhAe64m1XdbP3nq8/FBrRW9lg+zFOpyRi4171eu/pxfdS9u61pmqFRA4/bfQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWCJP3G4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWCJP3G4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727633270; x=1759169270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OKZRlto6bme4pY6xUhILVrQ06QMYGyCK+9kgU69ORNI=;
  b=LWCJP3G4WOG91uRnT9rp3+aWvSmNf+yTdVBZgIR+WTKQLhcwgEUFyV8Z
   YrVj6HT5yrkLRoox95wxo5GmGR+8WmEHFDCAnJ3SD/xau0rBdCxBzii9c
   sri6iOfl9MyfBEX5c+X2gAlfstcqgm5RKmATq63W5AARKZHTr0bnuNP6N
   IlqcxdI63F1nR8Nq5cCIWscEwkhqwaaYw1t2AqPqg0OOfvg2U6e2lC7Qz
   hCPtzfBA1jWFE9rhkEbPfZyKMrAAhKLqYFfUYbmg1+NG5G7oCZKPTmbKW
   CM67Qdu20wkwQAy8+7Zk/iGgOTLeBLODzUzzBFydUPM9Myh1/xw73B3Jd
   A==;
X-CSE-ConnectionGUID: CWQX0wXeQl2NurWQUiAxkA==
X-CSE-MsgGUID: ZVo1r4zFQ5GMHCLkYRQSNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26850420"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26850420"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 11:07:49 -0700
X-CSE-ConnectionGUID: Fh5hqK7oQkuPqr7HDTYHSA==
X-CSE-MsgGUID: sX8tv9l8Th+dVwh1x7wkTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="72646820"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 11:07:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suyKa-000OXq-05;
	Sun, 29 Sep 2024 18:07:40 +0000
Date: Mon, 30 Sep 2024 02:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/4] mm: pagewalk: add the ability to install PTEs
Message-ID: <202409300134.I0lpBxcz-lkp@intel.com>
References: <59e218670565accf978aeb8cf4745de4c0738773.1727440966.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59e218670565accf978aeb8cf4745de4c0738773.1727440966.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on deller-parisc/for-next arnd-asm-generic/master linus/master v6.11 next-20240927]
[cannot apply to jcmvbkbc-xtensa/xtensa-for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-pagewalk-add-the-ability-to-install-PTEs/20240927-205253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/59e218670565accf978aeb8cf4745de4c0738773.1727440966.git.lorenzo.stoakes%40oracle.com
patch subject: [RFC PATCH 1/4] mm: pagewalk: add the ability to install PTEs
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20240930/202409300134.I0lpBxcz-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300134.I0lpBxcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300134.I0lpBxcz-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/pagewalk.c: In function 'walk_pte_range_inner':
>> mm/pagewalk.c:45:33: error: implicit declaration of function 'update_mmu_cache'; did you mean 'update_mmu_tlb'? [-Wimplicit-function-declaration]
      45 |                                 update_mmu_cache(walk->vma, addr, pte);
         |                                 ^~~~~~~~~~~~~~~~
         |                                 update_mmu_tlb


vim +45 mm/pagewalk.c

    26	
    27	static int walk_pte_range_inner(pte_t *pte, unsigned long addr,
    28					unsigned long end, struct mm_walk *walk)
    29	{
    30		const struct mm_walk_ops *ops = walk->ops;
    31		int err = 0;
    32	
    33		for (;;) {
    34			if (ops->install_pte && pte_none(ptep_get(pte))) {
    35				pte_t new_pte;
    36	
    37				err = ops->install_pte(addr, addr + PAGE_SIZE, &new_pte,
    38						       walk);
    39				if (err)
    40					break;
    41	
    42				set_pte_at(walk->mm, addr, pte, new_pte);
    43				/* Non-present before, so for arches that need it. */
    44				if (!WARN_ON_ONCE(walk->no_vma))
  > 45					update_mmu_cache(walk->vma, addr, pte);
    46			} else {
    47				err = ops->pte_entry(pte, addr, addr + PAGE_SIZE, walk);
    48				if (err)
    49					break;
    50			}
    51			if (addr >= end - PAGE_SIZE)
    52				break;
    53			addr += PAGE_SIZE;
    54			pte++;
    55		}
    56		return err;
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
