Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F633A59
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734802883; cv=none; b=JYIdwx1q91baffo3wGPXnN8dWOKfyxzmgPg2bTZuGfeOeW+pIBTaito618Qaq4oam4wiO/Y4j6Ra0VMBwjT18na855rP4D9HHTHSamsCIgb/nTzYXc79AL53vuytw08z1R5QpAA02cA3baKXD+6jki5HBQsZHh7npiRab/KyxH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734802883; c=relaxed/simple;
	bh=GfCbR6s0xqckeZJFlGZ/ANM/NaOrlApW248gd77AGCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hAffXXZ7RxDHBuNiuHyJ04cpWyDOg/uJ2WORRjolVjL6BiLxOKtGuOwNjLCoufikYDiU+7FEeMGMjZofZpqMBZ4/pzEFLKOzfOXHkl/eRo3FJYwVhYGIuuY0Q8pxXItnjxIZ+zji4nKRFUweYro4J7JsRHa7Jomf+9zFbsyPQu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJTMJYkH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJTMJYkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734802882; x=1766338882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GfCbR6s0xqckeZJFlGZ/ANM/NaOrlApW248gd77AGCo=;
  b=gJTMJYkHF8Ergxod/IXH/0hkJYOSkun23/ybuFBvgLGUIKSyTmN18KW2
   ilnhn1WwvVzFgW6ZQa4aQQ22oj1suSKn6J8sz48Iog0Ky+0aleg0fykr8
   QxRWwlslvVnsad0o+gvKyPmJgv+PEEgy8iXOVvKJlrr94KEq0/UHFZ0xY
   NDjGbDKBwxRwypdsrC7aZRfDTKhqvEUQNCuQfX3vEX1CDI9Yxe8Rl9o3T
   rO3+b/DoxYGOPh837SetJ31K5WC9iZpcCT/YNJK5RwhpAR4PJCwGgGQqt
   vKmlQDIGcK+OwugeNKDO+0vdiMssHZZzsKQprLVYuNDzYkmZ7krgoFRK9
   g==;
X-CSE-ConnectionGUID: NqkUHNIwT1CbsVGQJ81nEg==
X-CSE-MsgGUID: 3nMUW3NnQIWAeZU6dPZhSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46707458"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="46707458"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 09:41:09 -0800
X-CSE-ConnectionGUID: HxYF5jMRRjONJ56FsUy0Yg==
X-CSE-MsgGUID: +e5IfvdWSKu1nvpKylNSbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="129631469"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2024 09:41:08 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP3TN-0002Lr-17;
	Sat, 21 Dec 2024 17:41:05 +0000
Date: Sun, 22 Dec 2024 01:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 9/9] zboot-x86.c:(.text+0x8f): multiple
 definition of `warn'; arch/x86/boot/compressed/error.o:error.c:(.text+0x0):
 first defined here
Message-ID: <202412220135.rjXeJLgy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   3b9b64db6d8de0eb1d3af75bba5d1b3c8e9f750f
commit: 3b9b64db6d8de0eb1d3af75bba5d1b3c8e9f750f [9/9] efi zboot for x86
config: x86_64-randconfig-006-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220135.rjXeJLgy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220135.rjXeJLgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220135.rjXeJLgy-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/firmware/efi/libstub/zboot-x86.stub.o: in function `warn':
>> zboot-x86.c:(.text+0x8f): multiple definition of `warn'; arch/x86/boot/compressed/error.o:error.c:(.text+0x0): first defined here
>> ld: drivers/firmware/efi/libstub/zboot-x86.stub.o:(.bss+0x0): multiple definition of `boot_params_ptr'; arch/x86/boot/compressed/misc.o:(.bss+0x38): first defined here
   ld: drivers/firmware/efi/libstub/zboot-decompress-gzip.stub.o: in function `zlib_inflate_table':
>> zboot-decompress-gzip.c:(.text+0x1e2): multiple definition of `zlib_inflate_table'; arch/x86/boot/compressed/misc.o:misc.c:(.text+0x260): first defined here
   ld: drivers/firmware/efi/libstub/zboot-decompress-gzip.stub.o: in function `inflate_fast':
>> zboot-decompress-gzip.c:(.text+0x639): multiple definition of `inflate_fast'; arch/x86/boot/compressed/misc.o:misc.c:(.text+0x7c0): first defined here
   ld: drivers/firmware/efi/libstub/zboot-decompress-gzip.stub.o: in function `zlib_inflate_workspacesize':
>> zboot-decompress-gzip.c:(.text+0xac9): multiple definition of `zlib_inflate_workspacesize'; arch/x86/boot/compressed/misc.o:misc.c:(.text+0xdc0): first defined here
   ld: drivers/firmware/efi/libstub/zboot-decompress-gzip.stub.o: in function `zlib_inflateReset':
>> zboot-decompress-gzip.c:(.text+0xacf): multiple definition of `zlib_inflateReset'; arch/x86/boot/compressed/misc.o:misc.c:(.text+0xdd0): first defined here
   ld: drivers/firmware/efi/libstub/zboot-decompress-gzip.stub.o: in function `zlib_inflateInit2':
>> zboot-decompress-gzip.c:(.text+0xb49): multiple definition of `zlib_inflateInit2'; arch/x86/boot/compressed/misc.o:misc.c:(.text+0xe70): first defined here
   ld: drivers/firmware/efi/libstub/zboot-decompress-gzip.stub.o: in function `zlib_inflate':
>> zboot-decompress-gzip.c:(.text+0xb95): multiple definition of `zlib_inflate'; arch/x86/boot/compressed/misc.o:misc.c:(.text+0xed0): first defined here
   ld: drivers/firmware/efi/libstub/zboot-decompress-gzip.stub.o: in function `zlib_inflateEnd':
>> zboot-decompress-gzip.c:(.text+0x194d): multiple definition of `zlib_inflateEnd'; arch/x86/boot/compressed/misc.o:misc.c:(.text+0x26d0): first defined here
   ld: drivers/firmware/efi/libstub/zboot-decompress-gzip.stub.o: in function `zlib_inflateIncomp':
>> zboot-decompress-gzip.c:(.text+0x1962): multiple definition of `zlib_inflateIncomp'; arch/x86/boot/compressed/misc.o:misc.c:(.text+0x26f0): first defined here
   ld: drivers/firmware/efi/libstub/zboot-decompress-gzip.stub.o: in function `efi_zboot_decompress_init':
>> zboot-decompress-gzip.c:(.text+0x19f1): undefined reference to `_gzdata_start'
>> ld: zboot-decompress-gzip.c:(.text+0x19f8): undefined reference to `_gzdata_end'
   ld: drivers/firmware/efi/libstub/zboot-decompress.stub.o: in function `efi_zboot_check_header':
>> zboot-decompress.c:(.text+0x3e): undefined reference to `payload_size'
   ld: arch/x86/boot/compressed/vmlinux: hidden symbol `_gzdata_end' isn't defined
   ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
