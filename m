Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879DC7F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 00:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728951261; cv=none; b=n5TWz4lxCuIBvmFy0G/i6UuA69s/y7nMmOqYQ3NsW06SUg9ktFmSq1jBlqA6HPnM6CqHSx22lG7V2x6DNn4w3iloP0scYqUAz4qeYZ/SGF0C6uLRSMVU5keGQnCg7tkqSRMq9BBpe3/Zh0u/QoNo7rD+U7RkEZa9vJK6j+yX7zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728951261; c=relaxed/simple;
	bh=Ntkv5ge7zwqVHz2E1+T0q6xaOViWg5m3PV3xNKgDAgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/K8QqC16Kpdrw3Qnq2pqIjHcZCgrIlUgQ1fb+Z92EQzPaKWuSA5klx2qfG59teOxFDQTqvuRZ/RwWXhPgNRoYayWfPgH60EH1lGmOR7OCrybLpBsZ0q79a55Kk/eDyKzIu6PGqodK1PN0bonWVui6M4OxLJoTue36T4sc9CEqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qdh3Nx9G; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qdh3Nx9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728951259; x=1760487259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ntkv5ge7zwqVHz2E1+T0q6xaOViWg5m3PV3xNKgDAgg=;
  b=Qdh3Nx9GR75UT9bLvtaSZp1zrJsod85vZAUQzNJUmURk7WUAfaxvcfSU
   Ph7NLbFY5ZYesYXEF+6ZU5gyV0zimt3v0eeOKE1VdMFU80kv7m/BbENV7
   qW90fHGmAaf0rz5y0FhiUAmw3vFE42fRJEXZt4+mtJ6jXiz9P/F+Naxrv
   VOBTOmh2RZS/IxPtwottQjRGoYZYBJFH2NPMklKJcTIV88uUCqs1mRReR
   aI0VVfAWCwTHn/pm6V03/GFXi0I27im7FFb20Cl2/aeKcBNx/JQjEXO1Q
   on/ZFwwDQglYadmOVvyadWcc9Juoz8hUjgPr/+f7xRGgh53mi7iqDo5gN
   w==;
X-CSE-ConnectionGUID: sdVc7KP8QdaBnWEBF6/IOg==
X-CSE-MsgGUID: 3YzBatvNSd+qnOyLLpuQFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="31201029"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="31201029"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:14:16 -0700
X-CSE-ConnectionGUID: fGOq15GHQlSoQeMvzaqcaQ==
X-CSE-MsgGUID: 0YRpvVtERZqVQk6C+WFz8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="78163060"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Oct 2024 17:14:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0VCW-000HLv-0L;
	Tue, 15 Oct 2024 00:14:12 +0000
Date: Tue, 15 Oct 2024 08:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Marek <jonathan@marek.ca>, linux-efi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] efi/libstub: consider CONFIG_CMDLINE for initrd= and
 dtb= options
Message-ID: <202410150734.BTqw8f36-lkp@intel.com>
References: <20241011224812.25763-3-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011224812.25763-3-jonathan@marek.ca>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on efi/next]
[also build test ERROR on linus/master v6.12-rc3 next-20241014]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Marek/efi-libstub-remove-uneccessary-cmdline_size-init-check/20241012-065337
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20241011224812.25763-3-jonathan%40marek.ca
patch subject: [PATCH 3/3] efi/libstub: consider CONFIG_CMDLINE for initrd= and dtb= options
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241015/202410150734.BTqw8f36-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150734.BTqw8f36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150734.BTqw8f36-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/libstub/file.c: In function 'handle_cmdline_files':
>> drivers/firmware/efi/libstub/file.c:218:38: error: expected ';' before 'CONFIG_CMDLINE'
     218 |                         cmdline = L"" CONFIG_CMDLINE;
         |                                      ^~~~~~~~~~~~~~~
         |                                      ;
   In file included from include/linux/string.h:6,
                    from include/linux/efi.h:16,
                    from drivers/firmware/efi/libstub/file.c:10:
>> drivers/firmware/efi/libstub/file.c:219:54: error: expected ')' before 'CONFIG_CMDLINE'
     219 |                         cmdline_len = ARRAY_SIZE(L"" CONFIG_CMDLINE) - 1;
         |                                                      ^~~~~~~~~~~~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   include/linux/array_size.h:11:32: note: to match this '('
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^
   drivers/firmware/efi/libstub/file.c:219:39: note: in expansion of macro 'ARRAY_SIZE'
     219 |                         cmdline_len = ARRAY_SIZE(L"" CONFIG_CMDLINE) - 1;
         |                                       ^~~~~~~~~~
>> drivers/firmware/efi/libstub/file.c:219:54: error: expected ')' before 'CONFIG_CMDLINE'
     219 |                         cmdline_len = ARRAY_SIZE(L"" CONFIG_CMDLINE) - 1;
         |                                                      ^~~~~~~~~~~~~~
   include/linux/array_size.h:11:48: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                ^~~
   include/linux/array_size.h:11:47: note: to match this '('
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                               ^
   drivers/firmware/efi/libstub/file.c:219:39: note: in expansion of macro 'ARRAY_SIZE'
     219 |                         cmdline_len = ARRAY_SIZE(L"" CONFIG_CMDLINE) - 1;
         |                                       ^~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/efi.h:15,
                    from drivers/firmware/efi/libstub/file.c:10:
>> drivers/firmware/efi/libstub/file.c:219:54: error: expected ')' before 'CONFIG_CMDLINE'
     219 |                         cmdline_len = ARRAY_SIZE(L"" CONFIG_CMDLINE) - 1;
         |                                                      ^~~~~~~~~~~~~~
   include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   include/linux/compiler.h:243:51: note: in expansion of macro '__same_type'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                                   ^~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/firmware/efi/libstub/file.c:219:39: note: in expansion of macro 'ARRAY_SIZE'
     219 |                         cmdline_len = ARRAY_SIZE(L"" CONFIG_CMDLINE) - 1;
         |                                       ^~~~~~~~~~
   include/linux/compiler.h:243:63: note: to match this '('
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                                               ^
   include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   include/linux/compiler.h:243:51: note: in expansion of macro '__same_type'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                                   ^~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/firmware/efi/libstub/file.c:219:39: note: in expansion of macro 'ARRAY_SIZE'
     219 |                         cmdline_len = ARRAY_SIZE(L"" CONFIG_CMDLINE) - 1;
         |                                       ^~~~~~~~~~
>> drivers/firmware/efi/libstub/file.c:219:54: error: expected ')' before 'CONFIG_CMDLINE'
     219 |                         cmdline_len = ARRAY_SIZE(L"" CONFIG_CMDLINE) - 1;
         |                                                      ^~~~~~~~~~~~~~
   include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   include/linux/compiler.h:243:51: note: in expansion of macro '__same_type'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                                   ^~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/firmware/efi/libstub/file.c:219:39: note: in expansion of macro 'ARRAY_SIZE'
     219 |                         cmdline_len = ARRAY_SIZE(L"" CONFIG_CMDLINE) - 1;
         |                                       ^~~~~~~~~~
   include/linux/compiler.h:243:69: note: to match this '('
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                                                     ^
   include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   include/linux/compiler.h:243:51: note: in expansion of macro '__same_type'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                                   ^~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/firmware/efi/libstub/file.c:219:39: note: in expansion of macro 'ARRAY_SIZE'
     219 |                         cmdline_len = ARRAY_SIZE(L"" CONFIG_CMDLINE) - 1;
         |                                       ^~~~~~~~~~


vim +218 drivers/firmware/efi/libstub/file.c

   177	
   178	/*
   179	 * Check the cmdline for a LILO-style file= arguments.
   180	 *
   181	 * We only support loading a file from the same filesystem as
   182	 * the kernel image.
   183	 */
   184	efi_status_t handle_cmdline_files(efi_loaded_image_t *image,
   185					  const efi_char16_t *optstr,
   186					  int optstr_size,
   187					  unsigned long soft_limit,
   188					  unsigned long hard_limit,
   189					  unsigned long *load_addr,
   190					  unsigned long *load_size)
   191	{
   192		const efi_char16_t *cmdline = efi_table_attr(image, load_options);
   193		u32 cmdline_len = efi_table_attr(image, load_options_size);
   194		unsigned long efi_chunk_size = ULONG_MAX;
   195		efi_file_protocol_t *volume = NULL;
   196		efi_file_protocol_t *file;
   197		unsigned long alloc_addr;
   198		unsigned long alloc_size;
   199		efi_status_t status;
   200		int offset;
   201	
   202		if (!load_addr || !load_size)
   203			return EFI_INVALID_PARAMETER;
   204	
   205		efi_apply_loadoptions_quirk((const void **)&cmdline, &cmdline_len);
   206		cmdline_len /= sizeof(*cmdline);
   207	
   208		if (IS_ENABLED(CONFIG_X86) && !efi_nochunk)
   209			efi_chunk_size = EFI_READ_CHUNK_SIZE;
   210	
   211		if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
   212		    IS_ENABLED(CONFIG_CMDLINE_FORCE) ||
   213		    cmdline_len == 0) {
   214			if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && cmdline_len > 0) {
   215				/* both CONFIG_CMDLINE and load_options should be used */
   216				efi_warn("ignoring %ls from CONFIG_CMDLINE\n", optstr);
   217			} else {
 > 218				cmdline = L"" CONFIG_CMDLINE;
 > 219				cmdline_len = ARRAY_SIZE(L"" CONFIG_CMDLINE) - 1;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
