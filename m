Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397AD748D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739623244; cv=none; b=b+xyuCNNcUQVtMTtyEHDS2Jaoa/q8qaezrqbZ6PqHhTJ5OruRAV8N53rxvwsi1DA05SfF8u8ogjrHu8EP3SUw6+0j4ZeCm7WK1zIWDejtk2goyYiNRasm5KdP4YJhQVf/15hZLe1444sgW5aoypiu7XozKJa6e+rorbyLbonJnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739623244; c=relaxed/simple;
	bh=DGDGFkFGD4AOYXv8EtRhvBJyGq3OHhY12itqunLRyV4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GBiLL/oVkYcsUmHKFRH8xR39JZCgNvRxUs/Sg0W5yekQcm0s+AUHGz3i7vCugjwr0qE3ap7HYVR08cq3GTw6nwYgYZr8M2ptipheOriF5zlhbqssZ9AuU+voCqvmzXwHOEh/cEM/bbXc48AMCQQnkpROmrS1fwlAlIhLs7TDTLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRUpTVQt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRUpTVQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739623242; x=1771159242;
  h=date:from:cc:subject:message-id:mime-version;
  bh=DGDGFkFGD4AOYXv8EtRhvBJyGq3OHhY12itqunLRyV4=;
  b=TRUpTVQtq9Y8IwXUFxDaux1vD768j4BfhV4SmtPJRLF++cQFlBlEMCnP
   fvjA4Umah6bgzUTgNM1bfiwaOfjtMEV5CEcA8A8fsX1Cf5rXe4ZzKnXBP
   z7WsrPEk5FIFfPPpIl8hRNp+b9/kbi5awwrIlzquralWwEthtP5cbCtNd
   4FIup3uK81b+2UOgWOzBu6RIF2QPy8zGuIQAPoGhj+LZFdXukg1eWJpx8
   8Jq6UZJWz2HXSSV+//q75QWtO5K5Ea2evHa6MAFds8L5DXQXDT/auAwfG
   BOcM6IFAzcEgp9ZlKfLRjy7enDolH+2hx2b7stP1SO+8YLXp/dtUR6EuZ
   A==;
X-CSE-ConnectionGUID: K1Qnjh8XSNaBCxo2wLK2hQ==
X-CSE-MsgGUID: IH1AkjjGTxyJxwKl8p4fuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="50579179"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="50579179"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 04:40:42 -0800
X-CSE-ConnectionGUID: j3nCLZwxQYiyBDa2yq/Mnw==
X-CSE-MsgGUID: p8mFwkMGScS+novEGY//PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="113560524"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Feb 2025 04:40:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjHTK-001Anj-2K
	for oe-kbuild-all@lists.linux.dev;
	Sat, 15 Feb 2025 12:40:38 +0000
Date: Sat, 15 Feb 2025 20:40:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/preempt-rt 3/3] fs/hostfs/hostfs_kern.c:972:2: error:
 call to undeclared function 'fsparam_string_empty'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202502152228.3vK2sQgG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   da3aec3fdaa3fcb8c9f9760d4edef06741ccfc6e
commit: be80de30b347dc2eae35dd5f7905ad9c9167dc08 [3/3] hostfs: fix the host directory parse when mounting.
config: um-randconfig-001-20250215 (https://download.01.org/0day-ci/archive/20250215/202502152228.3vK2sQgG-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502152228.3vK2sQgG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502152228.3vK2sQgG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/hostfs/hostfs_kern.c:13:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/hostfs/hostfs_kern.c:13:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/hostfs/hostfs_kern.c:13:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> fs/hostfs/hostfs_kern.c:972:2: error: call to undeclared function 'fsparam_string_empty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     972 |         fsparam_string_empty("hostfs",          Opt_hostfs),
         |         ^
>> fs/hostfs/hostfs_kern.c:972:2: error: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
     972 |         fsparam_string_empty("hostfs",          Opt_hostfs),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/hostfs/hostfs_kern.c:972:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
     972 |         fsparam_string_empty("hostfs",          Opt_hostfs),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         {
     973 |         {}
         |         ~~
         |           }
>> fs/hostfs/hostfs_kern.c:972:2: error: initializer element is not a compile-time constant
     972 |         fsparam_string_empty("hostfs",          Opt_hostfs),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings and 3 errors generated.


vim +/fsparam_string_empty +972 fs/hostfs/hostfs_kern.c

   970	
   971	static const struct fs_parameter_spec hostfs_param_specs[] = {
 > 972		fsparam_string_empty("hostfs",		Opt_hostfs),
   973		{}
   974	};
   975	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
