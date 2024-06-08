Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BE51CABA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 20:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717876823; cv=none; b=TzkMc3p6bp3LUCoNgt5G0VZjnIz6jxt6c/QpE2Fz7DJGdvihbR/EPvBglkfqALAWOncfXA0VFa6Se4CCQOOyXA1YzBRwvZ5uhU63laG0sOFJtRZpsMQ+gUSLHYceffJh9NNF6ApBSJLo5Flj2xEd7wFcKYb3qLDwqLdWt1ERIfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717876823; c=relaxed/simple;
	bh=BWQ8YQ3tHspA+ojzFV6JptAYfG2+uLs/L4bGYSRyfBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YLaiRaW8simp57GmfZToxWUlYF3pKVRVsYpYxob56HZkUZjhVpcwxKWMcd9TanPGvYfTaW7Arxfvj0w0gLYsICNLYCEi+q01EMmLg7XR8O4MWUeZ3F7qvYZOWKD8pLwdbnnJT1T6zzr5+/RDaN0sajWx6mQNYcMsL146jSANJLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+iiYVfg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+iiYVfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717876821; x=1749412821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BWQ8YQ3tHspA+ojzFV6JptAYfG2+uLs/L4bGYSRyfBU=;
  b=a+iiYVfgMsOImr4FEV4IFXffrQGY9XYB6Drg8webvc4Nwzd9eX69rb+y
   x8Pnx16RZdBeqti1o+uN4ngZvFT4vwrid1xhmutJH0GEXOUMwrbpSmsrS
   XY0wqD9Qi3f2iVdAp1DoKEB9gdX+KKmIlhKnCyExzAmVJcpGK5WsMDCUO
   L2DfRQSw0PKjSve5Cyh805pCf8kKhJGHjGEC3bn4165yHgmHWZjDit6GZ
   r8jsg4P7n6YXX4oIN953tGQRbqRLy1uSXUgKFAEEobHFR+Q+tzi8rgG5X
   Fk8jnBPkyp3sGTWcPPREtIB9PNhRu4a7PCtUSV/M6Vlt/iX3dajfqtfHp
   g==;
X-CSE-ConnectionGUID: vQsgsGa6SdS8MSgfkMfpgw==
X-CSE-MsgGUID: oSISjecRRsqHsQJbMgZDwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="25996558"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="25996558"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 13:00:20 -0700
X-CSE-ConnectionGUID: 3DyVeFgcTz+Ztc/elNsUzw==
X-CSE-MsgGUID: vqYFvA0mQEuztGu5FyPruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="69821001"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jun 2024 13:00:20 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG2Eb-0000PB-0m;
	Sat, 08 Jun 2024 20:00:17 +0000
Date: Sun, 9 Jun 2024 03:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4576/4582] riscv32-linux-ld: section
 .data..percpu VMA [c2596000,c259c3cb] overlaps section __ksymtab_gpl VMA
 [c2584cb8,c259b247]
Message-ID: <202406090320.wCoR5IgD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d35b2284e966c0bef3e2182a5c5ea02177dd32e4
commit: a9a7ccba1aeed5eb94324bd2e0651549ea56f939 [4576/4582] Merge branch 'zstd-next' of https://github.com/terrelln/linux.git
config: riscv-randconfig-r042-20221215 (https://download.01.org/0day-ci/archive/20240609/202406090320.wCoR5IgD-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090320.wCoR5IgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090320.wCoR5IgD-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: section .data LMA [005f0000,009f3f6b] overlaps section .text LMA [00082adc,01fa761b]
   riscv32-linux-ld: section .pci_fixup VMA [c256f628,c25722c7] overlaps section .bss VMA [c243e000,c25957e7]
>> riscv32-linux-ld: section .data..percpu VMA [c2596000,c259c3cb] overlaps section __ksymtab_gpl VMA [c2584cb8,c259b247]
>> riscv32-linux-ld: section __ksymtab_strings VMA [c259b248,c25df2c1] overlaps section .data..percpu VMA [c2596000,c259c3cb]
   fs/reiserfs/super.o: in function `reiserfs_put_super':
   fs/reiserfs/super.c:604:(.text+0x1b30): relocation truncated to fit: R_RISCV_GPREL_I against `.LC25'
   fs/fat/inode.o: in function `fat_fill_inode':
   fs/fat/inode.c:526:(.text+0x3d9c): relocation truncated to fit: R_RISCV_GPREL_I against `.LC79'
   fs/fat/namei_msdos.o: in function `do_msdos_rename':
   fs/fat/namei_msdos.c:528:(.text+0x1490): relocation truncated to fit: R_RISCV_GPREL_I against `.LC0'
   fs/exfat/super.o: in function `exfat_show_options':
   fs/exfat/super.c:144:(.text+0x1fc): relocation truncated to fit: R_RISCV_GPREL_I against `.LC2'
   fs/exfat/super.o: in function `init_exfat_fs':
   fs/exfat/super.c:814:(.init.text+0x3c): relocation truncated to fit: R_RISCV_GPREL_I against `.LC15'
   fs/isofs/inode.o: in function `isofs_show_options':
   fs/isofs/inode.c:458:(.text+0x810): relocation truncated to fit: R_RISCV_GPREL_I against `.LC17'
   fs/nfs/inode.o: in function `nfs_free_inode':
   fs/nfs/inode.c:2346:(.text+0x9b8): relocation truncated to fit: R_RISCV_GPREL_I against `.LC3'
   fs/ntfs3/super.o: in function `seq_puts':
   include/linux/seq_file.h:129:(.text+0x8cc): relocation truncated to fit: R_RISCV_GPREL_I against `.LC24'
   fs/udf/super.o: in function `udf_show_options':
   fs/udf/super.c:418:(.text+0x764): relocation truncated to fit: R_RISCV_GPREL_I against `.LC17'
   fs/btrfs/sysfs.o: in function `btrfs_sysfs_add_mounted':
   fs/btrfs/sysfs.c:2172:(.text+0x4908): relocation truncated to fit: R_RISCV_GPREL_I against `.LC63'
   lib/dynamic_debug.o: in function `ddebug_exec_queries':
   lib/dynamic_debug.c:571:(.text+0x1d3c): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
