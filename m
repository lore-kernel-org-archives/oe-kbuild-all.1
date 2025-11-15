Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0192D30595F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 19:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763234269; cv=none; b=Nqd6nrvUaeVudbha3egXYVnL1wrP+uVfpwZrCM9D1FumA4JSLra4NCxLCzSBFp70FfIzbw4laRIvYMMdAvDqdIA1/XP++HcRYtI0WTntDTKNDxwkBbVsRE9X1i63QWCzg681keV+ZtovdR8vJJYvfGsgg07/0VNecKm7L270eGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763234269; c=relaxed/simple;
	bh=5EG307VFCtyUrsbD42l2t63TXPg+JaL+ztkM4EIoaCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I0tjD3g+0fo0UubyY+oXQj5G+cArTOdJW0yRN55jmbqC5PuLZl4QGp0klD5eppD5enDlX3pZjX3rfwOwPHX3DhHruzLfE3COfqHGRe4A0gVNvFW+oxE3pRPHAmcdtKyheCyA455LQb5RDYTbNMHmZ/fn1ZP7Tw4W2ssvgNe+RGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEMpDJc8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEMpDJc8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763234268; x=1794770268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5EG307VFCtyUrsbD42l2t63TXPg+JaL+ztkM4EIoaCs=;
  b=FEMpDJc87PBkv5qipwQcsblRhVR3MHK/XTEMe1+HyV6dPbjcswYFRhZ3
   XNAJIzIXDHYbibqZW6luOqBXCjk068TChTK/360vKiJ3T4iKs6ukhfIWI
   EDLzqFGJz6PDVVi8upbbQWeF1xaIQ/g2ZfR/KT1vmwu/kBDrP+CLvCGQX
   SYK8aZzseWAiPW8guo5aKzzW1ESBVzUQEzmbZh54somUfTOhJukrT7+2t
   9gJHbYpvZ9ik8lpvqKJhrNX+u8hYYpAAiGgM3tEWLG88CfD3xbTmhnuDv
   Ck0dVo3jVZpoefb3dgDTVxr6oR6Tt5rQDPAQaMmuD8PKSX437A3PjhYbO
   A==;
X-CSE-ConnectionGUID: KOoqLdcvS0amaAZ9xSawZQ==
X-CSE-MsgGUID: Lt7rKk0aTNmp9JTDWbSETA==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="67901327"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="67901327"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 11:17:44 -0800
X-CSE-ConnectionGUID: Nz5tmqhLQceFpalXTUx3ew==
X-CSE-MsgGUID: AfoY6s4fTD2IVdZNa6L21w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="194194211"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Nov 2025 11:17:42 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKLmG-0008CT-17;
	Sat, 15 Nov 2025 19:17:40 +0000
Date: Sun, 16 Nov 2025 03:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Subject: [akpm-mm:mm-nonmm-unstable 82/133] (.text+0xc00): multiple
 definition of `kho_alloc_preserve'; mm/mm_init.o:(.text+0x0): first defined
 here
Message-ID: <202511160306.rrgfQf5w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   4fc88c237bfe11bde443e104428aac56e63a997f
commit: 88316955b5b1b4cb0cb2fad416f7e8dde9b246a0 [82/133] kho: introduce high-level memory allocation API
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20251116/202511160306.rrgfQf5w-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160306.rrgfQf5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511160306.rrgfQf5w-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/of/fdt.o: in function `kho_alloc_preserve':
>> (.text+0xc00): multiple definition of `kho_alloc_preserve'; mm/mm_init.o:(.text+0x0): first defined here
   microblaze-linux-ld: drivers/of/fdt.o: in function `kho_unpreserve_free':
>> (.text+0xc08): multiple definition of `kho_unpreserve_free'; mm/mm_init.o:(.text+0x8): first defined here
   microblaze-linux-ld: drivers/of/fdt.o: in function `kho_restore_free':
>> (.text+0xc10): multiple definition of `kho_restore_free'; mm/mm_init.o:(.text+0x10): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
