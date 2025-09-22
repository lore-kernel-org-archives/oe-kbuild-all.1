Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB351D63F3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 21:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758576558; cv=none; b=dbtiH+vXuaEhB5k7ZR0kxJWVlrmVC9oQWjjBMvbcrAFcRpMyi5VUI755PMpVQ5S/fBjz0Ad4rg+wC8R/OcEOl5aGX9Ne/81glrJsRXsoXnTetLD+IUdU4LPQcweXZZtnWMk0py2SLDZ+eUyp8o+UfIYBc1Q6j2dSPez3F9vRqH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758576558; c=relaxed/simple;
	bh=iyd13/Fud5LSon0kal2rF7LlOuf0qFyvWUpHWjYkR0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hedFLPB03UCJA596oz0VN9X5VxAgVS1E3MGeQSXQLSSHSnBD3XwikRTFXNlkdXZCeL3ohh0t53VsQyMadqP7AtY8HYsAjpxynMaGcoVEbnRBYHwAEFJQdX/ItfHB5PSSUf5T3jhf/bOyFYESAe6FUedSt4JL3521JkG8oteQIv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpoIpiKZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpoIpiKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758576557; x=1790112557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iyd13/Fud5LSon0kal2rF7LlOuf0qFyvWUpHWjYkR0s=;
  b=EpoIpiKZt/ap1o1/adb37Ky3eoSY5d2ClisUcI8x53Cn5AlfOFcUEXoZ
   c0D3soojLW/U0t40dXHe0Ald+od+yb1oOyPcGtHOMsbAopEzGJIRW5WLm
   Mk6POW+2uuNdIlNPZ9p8pZLPzDXE8ZmzoLgmC4yBgcmY+Fu6Z+kU92hzE
   0V3h8Y6dKd5uJBy1qaCPk5vjXCTiUvkiqG3bUouW1bzBB37kXe2/TENxm
   NUzIecX1NAmhEfY/AiofeC52LM+EfsRTzQvNFDhrGs7SeOxYWoodh9iej
   FHLyRewnISxJxsLrzjRuIAQhcaSopWxWMfeVpHXCh0Uvxbu7QnlIKAbDd
   w==;
X-CSE-ConnectionGUID: VTvyT6OZSOyZS05lN6SBng==
X-CSE-MsgGUID: XZDtbm0UTgC9mF9jqdnKug==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71524014"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="71524014"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 14:29:15 -0700
X-CSE-ConnectionGUID: /K0XKW2zTJ2hyap/hLEESw==
X-CSE-MsgGUID: TJwjT1FhSCGSvetm5HCcDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="176188631"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Sep 2025 14:29:13 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0o5u-0002Uf-1E;
	Mon, 22 Sep 2025 21:29:10 +0000
Date: Tue, 23 Sep 2025 05:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Pratyush Yadav <pratyush@kernel.org>
Subject: [linux-next:master 11234/11516] include/linux/pfn.h:12:43: error:
 passing argument 1 of 'kho_restore_page' makes pointer from integer without
 a cast
Message-ID: <202509230547.orS14pYx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bf2602a3cb2381fb1a04bf1c39a290518d2538d1
commit: faccf4f8536bbd064a1d25fde98da1c5a25474a2 [11234/11516] kho: add support for preserving vmalloc allocations
config: x86_64-randconfig-004-20250922 (https://download.01.org/0day-ci/archive/20250923/202509230547.orS14pYx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230547.orS14pYx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509230547.orS14pYx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/memory_model.h:5,
                    from arch/x86/include/asm/page.h:89,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/debugfs.h:15,
                    from kernel/kexec_handover.c:13:
   kernel/kexec_handover.c: In function 'kho_restore_pages':
>> include/linux/pfn.h:12:43: error: passing argument 1 of 'kho_restore_page' makes pointer from integer without a cast [-Wint-conversion]
      12 | #define PFN_PHYS(x)     ((phys_addr_t)(x) << PAGE_SHIFT)
         |                         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
         |                                           |
         |                                           long long unsigned int
   kernel/kexec_handover.c:273:54: note: in expansion of macro 'PFN_PHYS'
     273 |                 struct page *page = kho_restore_page(PFN_PHYS(pfn));
         |                                                      ^~~~~~~~
   kernel/kexec_handover.c:214:43: note: expected 'struct page *' but argument is of type 'long long unsigned int'
     214 | static void kho_restore_page(struct page *page, unsigned int order)
         |                              ~~~~~~~~~~~~~^~~~
   kernel/kexec_handover.c:273:37: error: too few arguments to function 'kho_restore_page'
     273 |                 struct page *page = kho_restore_page(PFN_PHYS(pfn));
         |                                     ^~~~~~~~~~~~~~~~
   kernel/kexec_handover.c:214:13: note: declared here
     214 | static void kho_restore_page(struct page *page, unsigned int order)
         |             ^~~~~~~~~~~~~~~~


vim +/kho_restore_page +12 include/linux/pfn.h

947d0496cf3e12 Jeremy Fitzhardinge 2008-09-11   8  
22a9835c350782 Dave Hansen         2006-03-27   9  #define PFN_ALIGN(x)	(((unsigned long)(x) + (PAGE_SIZE - 1)) & PAGE_MASK)
22a9835c350782 Dave Hansen         2006-03-27  10  #define PFN_UP(x)	(((x) + PAGE_SIZE-1) >> PAGE_SHIFT)
22a9835c350782 Dave Hansen         2006-03-27  11  #define PFN_DOWN(x)	((x) >> PAGE_SHIFT)
947d0496cf3e12 Jeremy Fitzhardinge 2008-09-11 @12  #define PFN_PHYS(x)	((phys_addr_t)(x) << PAGE_SHIFT)
8f235d1a3eb719 Chen Gang           2016-01-14  13  #define PHYS_PFN(x)	((unsigned long)((x) >> PAGE_SHIFT))
22a9835c350782 Dave Hansen         2006-03-27  14  

:::::: The code at line 12 was first introduced by commit
:::::: 947d0496cf3e12ebfa70b3eaf561c25403247ce9 generic: make PFN_PHYS explicitly return phys_addr_t

:::::: TO: Jeremy Fitzhardinge <jeremy@goop.org>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
