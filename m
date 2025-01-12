Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DEC1DFE1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 05:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736658232; cv=none; b=LlmBokxjvoOM/Qd4RD34FIRwyerl11FkifCaHZ64piNBh+NJesvtA8jHAYuXwiguc75I7Un0PLIm4Pwtmff/PvPorB8MfWMkB+ytKHOiDr07MH5bD9klLnIR30upINSMMU8LdE8wHa5jRJ+I6mYMgHaVYQAqBZIB08njkbuBPIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736658232; c=relaxed/simple;
	bh=yfeJOmlHbkMKX6LO9DtExi4GzU4Eum89oEgSdrEst10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mfNoQ7IotTvRMUe9sdxiD4e0+mcRvMTyl08FfbyJ1dis8vgM/UTW8sDqlwFm0nZ0tg7NkW1d+aEaHt2b/Oq1qIKIs+bXRBADGVXhch/VKrUYepS4Eld80ec/D8C+4w1FlaaspWOBr191yr+VW21+bgnSdzwMd1hXU1/LOQO2yVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XztfRSbP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XztfRSbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736658231; x=1768194231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yfeJOmlHbkMKX6LO9DtExi4GzU4Eum89oEgSdrEst10=;
  b=XztfRSbPcHvoCJf56sbpzat9B3Ze4GWKH32yF90zGqwKUb7GKw9NOHqM
   S9kzUkI9SqscyZUy1fsVPCnzhNThM9UhD6CcE7HS8rvD8DPoqHf2y6F7c
   3KfPUigo7G6Ayu4XKbBaED+eGi+FsQrKJkneoWdfEzoPFqwZkwPXwGVKf
   KPjF6Ra2FgE1IDQhVAliBqzjV8+z26gEpG4/pN0gEgCFP+Rg5D5NZIV2m
   8KOxCMW33jPljaJYRlLcHMQd1266JIfV9c+AIUZW2yS5xEVOFAaKf88kc
   8Q9GgVTAuhMsw70hYLPHbNFHqFjHeLXvzDI4WMKkk/mA3LmMjdlgmlBni
   Q==;
X-CSE-ConnectionGUID: lo081JyjQl6+bdus8F2TEw==
X-CSE-MsgGUID: ZQZU8xAiSfm1aWXySadEJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36593973"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="36593973"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 21:03:51 -0800
X-CSE-ConnectionGUID: u/GIeJ4WRyyW+GCnrfAJng==
X-CSE-MsgGUID: nkJxrNqyT+CmYaYczi8m+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="134935293"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2025 21:03:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWq8Y-000Lap-0U;
	Sun, 12 Jan 2025 05:03:46 +0000
Date: Sun, 12 Jan 2025 13:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 325/504] algif_aead.c:undefined reference to
 `af_alg_sendmsg'
Message-ID: <202501121212.9xZrCD7E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 262c5273ae76cc1369917d11a74ff5c9587be208 [325/504] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: arm64-randconfig-002-20250110 (https://download.01.org/0day-ci/archive/20250112/202501121212.9xZrCD7E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121212.9xZrCD7E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121212.9xZrCD7E-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: crypto/algif_aead.o: in function `aead_sendmsg':
>> algif_aead.c:(.text+0x16c): undefined reference to `af_alg_sendmsg'
   aarch64-linux-ld: crypto/algif_aead.o: in function `aead_sock_destruct':
>> algif_aead.c:(.text+0x258): undefined reference to `af_alg_pull_tsgl'
>> aarch64-linux-ld: algif_aead.c:(.text+0x270): undefined reference to `sock_kzfree_s'
>> aarch64-linux-ld: algif_aead.c:(.text+0x288): undefined reference to `sock_kfree_s'
>> aarch64-linux-ld: algif_aead.c:(.text+0x290): undefined reference to `af_alg_release_parent'
   aarch64-linux-ld: crypto/algif_aead.o: in function `aead_accept_parent_nokey':
>> algif_aead.c:(.text+0x30c): undefined reference to `sock_kmalloc'
>> aarch64-linux-ld: algif_aead.c:(.text+0x338): undefined reference to `sock_kmalloc'
   aarch64-linux-ld: algif_aead.c:(.text+0x400): undefined reference to `sock_kfree_s'
   aarch64-linux-ld: crypto/algif_aead.o: in function `aead_check_key.isra.0':
>> algif_aead.c:(.text+0x750): undefined reference to `lock_sock_nested'
>> aarch64-linux-ld: algif_aead.c:(.text+0x788): undefined reference to `release_sock'
>> aarch64-linux-ld: algif_aead.c:(.text+0x7c8): undefined reference to `lock_sock_nested'
   aarch64-linux-ld: algif_aead.c:(.text+0x850): undefined reference to `release_sock'
   aarch64-linux-ld: algif_aead.c:(.text+0x860): undefined reference to `release_sock'
   aarch64-linux-ld: crypto/algif_aead.o: in function `_aead_recvmsg.isra.0':
>> algif_aead.c:(.text+0x9b0): undefined reference to `af_alg_wait_for_data'
>> aarch64-linux-ld: algif_aead.c:(.text+0xacc): undefined reference to `af_alg_alloc_areq'
>> aarch64-linux-ld: algif_aead.c:(.text+0xb34): undefined reference to `af_alg_get_rsgl'
>> aarch64-linux-ld: algif_aead.c:(.text+0xce8): undefined reference to `af_alg_free_resources'
   aarch64-linux-ld: algif_aead.c:(.text+0xd44): undefined reference to `af_alg_free_resources'
>> aarch64-linux-ld: algif_aead.c:(.text+0xddc): undefined reference to `af_alg_pull_tsgl'
>> aarch64-linux-ld: algif_aead.c:(.text+0xf68): undefined reference to `af_alg_async_cb'
   aarch64-linux-ld: crypto/algif_aead.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `af_alg_async_cb' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> algif_aead.c:(.text+0xf68): dangerous relocation: unsupported relocation
   aarch64-linux-ld: algif_aead.c:(.text+0xf6c): undefined reference to `af_alg_async_cb'
   aarch64-linux-ld: algif_aead.c:(.text+0x1050): undefined reference to `af_alg_free_resources'
>> aarch64-linux-ld: algif_aead.c:(.text+0x10b4): undefined reference to `af_alg_count_tsgl'
   aarch64-linux-ld: algif_aead.c:(.text+0x10f8): undefined reference to `sock_kmalloc'
   aarch64-linux-ld: algif_aead.c:(.text+0x1140): undefined reference to `af_alg_pull_tsgl'
   aarch64-linux-ld: algif_aead.c:(.text+0x12e4): undefined reference to `af_alg_free_resources'
   aarch64-linux-ld: algif_aead.c:(.text+0x1320): undefined reference to `af_alg_free_resources'
>> aarch64-linux-ld: algif_aead.c:(.text+0x1380): undefined reference to `sk_free'
   aarch64-linux-ld: crypto/algif_aead.o: in function `aead_recvmsg':
   algif_aead.c:(.text+0x1420): undefined reference to `lock_sock_nested'
>> aarch64-linux-ld: algif_aead.c:(.text+0x14ec): undefined reference to `af_alg_wmem_wakeup'
   aarch64-linux-ld: algif_aead.c:(.text+0x14f4): undefined reference to `release_sock'
   aarch64-linux-ld: crypto/algif_aead.o: in function `aead_sendmsg_nokey':
   algif_aead.c:(.text+0x167c): undefined reference to `af_alg_sendmsg'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x50): undefined reference to `af_alg_release'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x58): undefined reference to `sock_no_bind'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x60): undefined reference to `sock_no_connect'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x68): undefined reference to `sock_no_socketpair'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x70): undefined reference to `sock_no_accept'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x78): undefined reference to `sock_no_getname'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x80): undefined reference to `af_alg_poll'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x88): undefined reference to `sock_no_ioctl'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x98): undefined reference to `sock_no_listen'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0xa0): undefined reference to `sock_no_shutdown'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0xd0): undefined reference to `sock_no_mmap'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x150): undefined reference to `af_alg_release'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x158): undefined reference to `sock_no_bind'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x160): undefined reference to `sock_no_connect'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x168): undefined reference to `sock_no_socketpair'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x170): undefined reference to `sock_no_accept'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x178): undefined reference to `sock_no_getname'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x180): undefined reference to `af_alg_poll'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x188): undefined reference to `sock_no_ioctl'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x198): undefined reference to `sock_no_listen'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x1a0): undefined reference to `sock_no_shutdown'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x1d0): undefined reference to `sock_no_mmap'
   aarch64-linux-ld: crypto/algif_aead.o: in function `algif_aead_exit':
   algif_aead.c:(.exit.text+0x18): undefined reference to `af_alg_unregister_type'
   aarch64-linux-ld: crypto/algif_aead.o: in function `algif_aead_init':
   algif_aead.c:(.init.text+0x24): undefined reference to `af_alg_register_type'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [y]:
   - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=y] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
