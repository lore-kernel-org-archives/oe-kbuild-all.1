Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C839B3EE1F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 19:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787339167; cv=none; b=J1PtU+iZQARdMF+5IOubDAVXLCUIHe1WRj6qfT0WZKO9mA5eweyznDcZuU+CDt/U8hp4tcWOMfxDO4KpRRZrOjw9tQTE+z1oZJ4tCnv2JjrQ5rV6WswXPD3DlsvIgj4Ka/hM5UGtHlWByIwEpAzChOUVwBmsWNdS8b3kZA0DsdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787339167; c=relaxed/simple;
	bh=2l67lzMhtFeN7ZO6CXEvpcaVhEF69CiUiIJYvUE26n4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vk98hvuGFf2zUoNwtVWumBx9HBKloMWbuL5LpJGOLH3KFzDQW1R+nacNkbFYOCVGGVVlMlIcFosrVVbCTvFabTGcdzMgXM/9SlutdEaqPhThcqcafJShAJLOpCSd0W+LE3c06EkjSIsKSNJaYM1GVcXWkgry9XFfyj4+yF6uWY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUBYv4s9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUBYv4s9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787339164; x=1818875164;
  h=date:from:to:cc:subject:message-id;
  bh=2l67lzMhtFeN7ZO6CXEvpcaVhEF69CiUiIJYvUE26n4=;
  b=SUBYv4s9ejaYgwAfZXsEToAumAUfprK1lgDffu32uy9w4DYcEzPrD8TC
   gtvQWApR12e1kkK+vwBCHh3X1hfwFNG0rNRfYMdkBcFx6dSG2FNMdIQMt
   oKOcNQmroCb05RrQsfqRvuvToxaJUo4FNtqaFu1HmU/Lt9ULXp87w5p2s
   62qkcE5aQy+3Op0fOECFtRNqcxtFkpAFS1Dvam1iJUVBaoGJhT6upsB+H
   rGFV6wJdaAoDwMceW0dl8lGu/edZQcKw5iiWpcjl+4+4JhtSpVuqG5O1V
   o94feJNaSHrHTSVIDXqZyibP5rA+bfVXOcBTsQ3SGrJGy+2fkUthgKTVI
   g==;
X-CSE-ConnectionGUID: z3d4ZM8kTaW6926Q4VaKqQ==
X-CSE-MsgGUID: Y2jb7FlzS7Ke+HkbH1HmnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87913584"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87913584"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 12:06:03 -0700
X-CSE-ConnectionGUID: 85GVA7GXQNyBY8SCVAbFIg==
X-CSE-MsgGUID: +KDBI5tuT8S6ziZih8C1Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="269905717"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Aug 2026 12:06:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxUYx-00000000qLh-3Cr5;
	Fri, 21 Aug 2026 19:05:59 +0000
Date: Sat, 22 Aug 2026 03:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:module-combine-init-allocations 1/8]
 mm/execmem.c:91:33: error: implicit declaration of function
 'get_vm_area_page_order'; did you mean 'get_vm_area_caller'?
Message-ID: <202608220348.Hs149g2E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git module-combine-init-allocations
head:   a598b33b1d60eb215a71876eaf9e694fa22e48ba
commit: 727fc3c108b070521a093337b930b8a3f8eeaf73 [1/8] mm: execmem: Pass an offset to execmem_set_direct_map_valid()
config: sh-randconfig-001-20260822 (https://download.01.org/0day-ci/archive/20260822/202608220348.Hs149g2E-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220348.Hs149g2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220348.Hs149g2E-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/execmem.c: In function 'execmem_set_direct_map_valid':
>> mm/execmem.c:91:33: error: implicit declaration of function 'get_vm_area_page_order'; did you mean 'get_vm_area_caller'? [-Wimplicit-function-declaration]
      91 |         unsigned int nr = (1 << get_vm_area_page_order(vm));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 get_vm_area_caller
   mm/execmem.c: At top level:
   mm/execmem.c:88:12: warning: 'execmem_set_direct_map_valid' defined but not used [-Wunused-function]
      88 | static int execmem_set_direct_map_valid(struct vm_struct *vm, bool valid,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +91 mm/execmem.c

    87	
    88	static int execmem_set_direct_map_valid(struct vm_struct *vm, bool valid,
    89						int offset)
    90	{
  > 91		unsigned int nr = (1 << get_vm_area_page_order(vm));
    92		unsigned int updated = 0;
    93		int err = 0;
    94	
    95		if (offset % nr)
    96			return -EINVAL;
    97	
    98		for (int i = offset >> PAGE_SHIFT; i < vm->nr_pages; i += nr) {
    99			err = set_direct_map_valid_noflush(vm->pages[i], nr, valid);
   100			if (err)
   101				goto err_restore;
   102			updated += nr;
   103		}
   104	
   105		return 0;
   106	
   107	err_restore:
   108		for (int i = offset >> PAGE_SHIFT; i < updated; i += nr)
   109			set_direct_map_valid_noflush(vm->pages[i], nr, !valid);
   110	
   111		return err;
   112	}
   113	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
