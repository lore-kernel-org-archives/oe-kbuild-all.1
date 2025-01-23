Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069F1198E9B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737667102; cv=none; b=Ctsh1c95/xBLmfnB1NNleQMgyQbM4rZeRgWOy4dp/K0JTSgNexHW4dzsqDqFSns6KJqmP1roPnPUxtDRKVG5RdRtMD8VcjxJkkvvWS/rR+td3VZ8dc3Ll+yx9mjXwO//wj9iEjrwkgtiWqzJBZjGhQrgk7fq3vxjDnqaL91HULg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737667102; c=relaxed/simple;
	bh=6rTRmLaMlhzek6hDXeHw7hthwPbMlwpEZGu/FZ8d/ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ngpAQYyxjhQVLgZWNGwYxw97ondRi41ebVYE0CjgD25d1E4axghLtCjs1SYhep3WuTayOqe0+aM8af927BNm8CcXsQtgyHqle4svJs36Y4novremxlTVNbzSW9lR9hbbK+XsZ89P1CtAYRtK8lXPmxZcIV25jfwjbTnTl8wWq28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+nhyIax; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+nhyIax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737667101; x=1769203101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6rTRmLaMlhzek6hDXeHw7hthwPbMlwpEZGu/FZ8d/ms=;
  b=L+nhyIaxS22a8dXUkXBaZE/7IKXd9FUO1WhxQbfYnTQxk/dyHsjygGwk
   Ez9wYsbv28dZQ+KZe+vDceac9uBS1qWmWsXH6Twe7tTY3M8dZK77RyRJz
   kIkq54Mo/IqWYpfqPbMjUtuRK/S76l1MeDq7pCqBAhcxgAf0dDRagp9f2
   Ev/oEOKISPptUqpqyxpiLppFHrOay3ffjzRnryXUkuov+9AzgVC+iHNHb
   a4TPICN/Qm1He4HVe3M7/AUkcF31IHCguswJsK+y6Wz0YoXAERmQMzXUI
   qa/eImx8Z0XFOg1ls7npCc5+cJgyUirvj9Og1AP7hSYFvH4NDnAKxBLLc
   g==;
X-CSE-ConnectionGUID: hZkyc63rS4W2l/q12eLy0A==
X-CSE-MsgGUID: gbmBb13JRi6eIPNqgwFIwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38358675"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="38358675"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 13:18:21 -0800
X-CSE-ConnectionGUID: RudmkUu0ROOXCltu3sxZHg==
X-CSE-MsgGUID: rFXtbyyKQUqwUqUTlVH5lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="108123714"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2025 13:18:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb4af-000bih-1I;
	Thu, 23 Jan 2025 21:18:17 +0000
Date: Fri, 24 Jan 2025 05:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 1/31] include/linux/mmzone.h:1870:27: error:
 variably modified 'mem_section' at file scope
Message-ID: <202501240509.XIjUK7UU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   1429a7f741a85a0115afb4e1cdbc56b8ca525f2e
commit: cb3e63129bf354a30602aa836e07fd2dd591b4dd [1/31] crypto: Harden against integer overflows in DIV_ROUND_UP()
config: i386-buildonly-randconfig-004-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240509.XIjUK7UU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240509.XIjUK7UU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240509.XIjUK7UU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:17,
                    from arch/x86/kernel/asm-offsets.c:9:
>> include/linux/mmzone.h:1870:27: error: variably modified 'mem_section' at file scope
    1870 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2484763073
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1263: prepare0] Error 2 shuffle=2484763073
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=2484763073
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=2484763073
   make: Target 'prepare' not remade because of errors.


vim +/mem_section +1870 include/linux/mmzone.h

802f192e4a600f Bob Picco          2005-09-03  1866  
3e347261a80b57 Bob Picco          2005-09-03  1867  #ifdef CONFIG_SPARSEMEM_EXTREME
83e3c48729d9eb Kirill A. Shutemov 2017-09-29  1868  extern struct mem_section **mem_section;
802f192e4a600f Bob Picco          2005-09-03  1869  #else
3e347261a80b57 Bob Picco          2005-09-03 @1870  extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
3e347261a80b57 Bob Picco          2005-09-03  1871  #endif
d41dee369bff3b Andy Whitcroft     2005-06-23  1872  

:::::: The code at line 1870 was first introduced by commit
:::::: 3e347261a80b57df792ab9464b5f0ed59add53a8 [PATCH] sparsemem extreme implementation

:::::: TO: Bob Picco <bob.picco@hp.com>
:::::: CC: Linus Torvalds <torvalds@evo.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
