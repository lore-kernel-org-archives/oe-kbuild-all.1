Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA48114A0B3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 20:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736627827; cv=none; b=APZ4Dd+rK1Bai4RdG2ElbripDSn5wcfukzK2m2InZhAitrQZ91vsSdvYnHYV5U1Il+IU/VkDsrrgmvMJFPUHhYcUl9O1Gxgfs/WFit1Z3FrTUq6L6ZNGi6lxMaxrku18J+UbL2AQRTJ72UONk7v83A53QxwqqdS6EGmUWUoJgL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736627827; c=relaxed/simple;
	bh=tFoOzFejJPVTuMWb7Me08C1iUbA+SDSgp5uRJcgmAWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oogw9+5leSjPM5oLBCmT/bP7KYmWtDD4/HaJD+YX/O4ReFyuBpHVr0VxWa4tv2vXjvATZWHTbP/VkpsScx5oSQ9c8Pc6lv4Gglt5AJR0tSkZdCmveTMfmPIgAMVbtk7LIap1uPo1ZtnQCTWY6ofxf80ZlVojPwGFiUHQGhamxxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTEwB+2H; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTEwB+2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736627825; x=1768163825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tFoOzFejJPVTuMWb7Me08C1iUbA+SDSgp5uRJcgmAWs=;
  b=fTEwB+2HxlIjTmomyz13U3IuY8psF0WR/oi+MhB7/enLy70ZMPEhDoZ5
   24sPMuCmfpsEVcpamFrAkVeEcO3YPbcZh2xsmLLE1JXzHLLufWdhxKhA8
   wTJSR3neW1Qg1OysWzcLKevS8BAXIB/KXc8xlziwl9k4yVblaNRbm2zFI
   yNF2LmHByFSKFDbEO8KLoxNUpnheEZASQ4VMHDWOCPYux9+ZBtMY9bsIT
   l1/gRsXITZ1Ht66Y+KFYRDTGv4gphLoHqw1k0pCiqh8T2/g5E0g426+56
   Nyim2y2sfrko96/Ad8ochXOjFs+dQZaDPrrzxbOxlTctlDiL7kEuQmlvi
   A==;
X-CSE-ConnectionGUID: 6/rKJL5WTSK8tVGyXCB5oQ==
X-CSE-MsgGUID: uY/5ZKtuQqWCBNGE+bOS0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="48315787"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="48315787"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 12:37:04 -0800
X-CSE-ConnectionGUID: SKgtN/+jSy64ljEhHKAXwQ==
X-CSE-MsgGUID: DtUCO+RMRv6a3GTT3vOC0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108101373"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jan 2025 12:37:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWiE8-000LBj-2o;
	Sat, 11 Jan 2025 20:37:00 +0000
Date: Sun, 12 Jan 2025 04:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 325/504] algif_aead.c:undefined reference to
 `af_alg_async_cb'
Message-ID: <202501120431.HpzaQNAI-lkp@intel.com>
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
config: m68k-randconfig-r064-20250111 (https://download.01.org/0day-ci/archive/20250112/202501120431.HpzaQNAI-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120431.HpzaQNAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120431.HpzaQNAI-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: crypto/algif_aead.o: in function `_aead_recvmsg.isra.0':
>> algif_aead.c:(.text+0x4b2): undefined reference to `af_alg_async_cb'
   m68k-linux-ld: crypto/algif_aead.o: in function `aead_sendmsg':
   algif_aead.c:(.text+0x8c): undefined reference to `af_alg_sendmsg'
   m68k-linux-ld: crypto/algif_aead.o: in function `aead_sock_destruct':
   algif_aead.c:(.text+0xd2): undefined reference to `af_alg_pull_tsgl'
>> m68k-linux-ld: algif_aead.c:(.text+0xe0): undefined reference to `sock_kzfree_s'
>> m68k-linux-ld: algif_aead.c:(.text+0xee): undefined reference to `sock_kfree_s'
>> m68k-linux-ld: algif_aead.c:(.text+0x100): undefined reference to `af_alg_release_parent'
   m68k-linux-ld: crypto/algif_aead.o: in function `aead_accept_parent_nokey':
   algif_aead.c:(.text+0x126): undefined reference to `sock_kmalloc'
   m68k-linux-ld: algif_aead.c:(.text+0x1c4): undefined reference to `sock_kfree_s'
   m68k-linux-ld: crypto/algif_aead.o: in function `aead_check_key.isra.0':
   algif_aead.c:(.text+0x234): undefined reference to `lock_sock_nested'
>> m68k-linux-ld: algif_aead.c:(.text+0x244): undefined reference to `release_sock'
   m68k-linux-ld: algif_aead.c:(.text+0x284): undefined reference to `release_sock'
   m68k-linux-ld: algif_aead.c:(.text+0x2a2): undefined reference to `release_sock'
   m68k-linux-ld: crypto/algif_aead.o: in function `_aead_recvmsg.isra.0':
   algif_aead.c:(.text+0x2ea): undefined reference to `af_alg_wait_for_data'
>> m68k-linux-ld: algif_aead.c:(.text+0x340): undefined reference to `af_alg_alloc_areq'
>> m68k-linux-ld: algif_aead.c:(.text+0x368): undefined reference to `af_alg_get_rsgl'
>> m68k-linux-ld: algif_aead.c:(.text+0x3d6): undefined reference to `af_alg_free_resources'
>> m68k-linux-ld: algif_aead.c:(.text+0x434): undefined reference to `af_alg_pull_tsgl'
>> m68k-linux-ld: algif_aead.c:(.text+0x506): undefined reference to `sk_free'
   m68k-linux-ld: algif_aead.c:(.text+0x51a): undefined reference to `af_alg_free_resources'
>> m68k-linux-ld: algif_aead.c:(.text+0x56c): undefined reference to `af_alg_count_tsgl'
>> m68k-linux-ld: algif_aead.c:(.text+0x598): undefined reference to `sock_kmalloc'
   m68k-linux-ld: algif_aead.c:(.text+0x5c8): undefined reference to `af_alg_pull_tsgl'
   m68k-linux-ld: algif_aead.c:(.text+0x618): undefined reference to `af_alg_free_resources'
   m68k-linux-ld: algif_aead.c:(.text+0x6ca): undefined reference to `af_alg_free_resources'
   m68k-linux-ld: algif_aead.c:(.text+0x706): undefined reference to `af_alg_free_resources'
   m68k-linux-ld: crypto/algif_aead.o: in function `aead_recvmsg':
   algif_aead.c:(.text+0x768): undefined reference to `lock_sock_nested'
>> m68k-linux-ld: algif_aead.c:(.text+0x798): undefined reference to `af_alg_wmem_wakeup'
   m68k-linux-ld: algif_aead.c:(.text+0x7a0): undefined reference to `release_sock'
   m68k-linux-ld: algif_aead.c:(.text+0x7c8): undefined reference to `af_alg_wmem_wakeup'
   m68k-linux-ld: algif_aead.c:(.text+0x7d0): undefined reference to `release_sock'
   m68k-linux-ld: algif_aead.c:(.text+0x7e6): undefined reference to `af_alg_wmem_wakeup'
   m68k-linux-ld: algif_aead.c:(.text+0x7ee): undefined reference to `release_sock'
   m68k-linux-ld: crypto/algif_aead.o: in function `aead_sendmsg_nokey':
   algif_aead.c:(.text+0x98e): undefined reference to `af_alg_sendmsg'
>> m68k-linux-ld: crypto/algif_aead.o:(.data+0x8): undefined reference to `af_alg_release'
>> m68k-linux-ld: crypto/algif_aead.o:(.data+0xc): undefined reference to `sock_no_bind'
>> m68k-linux-ld: crypto/algif_aead.o:(.data+0x10): undefined reference to `sock_no_connect'
>> m68k-linux-ld: crypto/algif_aead.o:(.data+0x14): undefined reference to `sock_no_socketpair'
>> m68k-linux-ld: crypto/algif_aead.o:(.data+0x18): undefined reference to `sock_no_accept'
>> m68k-linux-ld: crypto/algif_aead.o:(.data+0x1c): undefined reference to `sock_no_getname'
>> m68k-linux-ld: crypto/algif_aead.o:(.data+0x20): undefined reference to `af_alg_poll'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x24): undefined reference to `sock_no_ioctl'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x2c): undefined reference to `sock_no_listen'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x30): undefined reference to `sock_no_shutdown'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x48): undefined reference to `sock_no_mmap'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x74): undefined reference to `af_alg_release'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x78): undefined reference to `sock_no_bind'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x7c): undefined reference to `sock_no_connect'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x80): undefined reference to `sock_no_socketpair'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x84): undefined reference to `sock_no_accept'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x88): undefined reference to `sock_no_getname'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x8c): undefined reference to `af_alg_poll'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x90): undefined reference to `sock_no_ioctl'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x98): undefined reference to `sock_no_listen'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x9c): undefined reference to `sock_no_shutdown'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0xb4): undefined reference to `sock_no_mmap'
   m68k-linux-ld: crypto/algif_aead.o: in function `algif_aead_init':
   algif_aead.c:(.init.text+0x8): undefined reference to `af_alg_register_type'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [y]:
   - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
