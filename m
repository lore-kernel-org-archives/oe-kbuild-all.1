Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55D864A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 00:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714264864; cv=none; b=TxzM8AIm9tyH3pj/aXCL3vNWivun2gVFDNSBEupssBN9uadRJpE6YGS8IvGs+nvc4Z3HKvm4R4fKx3i0I5d1l4i1xJBcqMj6yYm2yj020dJo8Mgr2dcYHYh1xEzfvlLD/efTZ+26k/aji0gu/UkrwLAdO3koBccet62OIIx88QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714264864; c=relaxed/simple;
	bh=6n8uNTrke+AJyDu0IMgkRFlVE6Z4b6nDrc1bvNgExf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XI11vhoRvS38QchSTvAzTj8HafQUPsQXZ2zqUzV/mFQ9Dhk/uxyUKpIzFawZPIuzec0xSuBRvQSM82alUWCiin25Zm7F/zSpb+q9Jp6QMwMJLJcxKNvLu1nVYXa0zDWio+RW7KZjR7mptPEMfnjyyVuMprhjIZ1P6ex2Urekt4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTQ7PKp9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTQ7PKp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714264862; x=1745800862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6n8uNTrke+AJyDu0IMgkRFlVE6Z4b6nDrc1bvNgExf4=;
  b=YTQ7PKp96ysQtniXFNRHztwdi4o8AcIBgaLj5cj6V8MQEdr4DCbtl4AP
   ONIvluwxU4WSUPiRMR5SyMfey2Gs0hCN8+IMvU9l1ccAdp62GIaQ/GClU
   3fuly1ksIeIth77dT2BYcWMZK2PHZPoULEZMuGsUsZ2kBl1M/EQHu9txm
   bMnxh7i0n/kHJe/xATMA4gkpKBVFlj6uCzWIiZbVsbRPm+BXtaTg3RGRV
   XmMnS7StfOck7wgMk6ZHvG4zgxCsFq0ORVRxHnZ/MTtHTmW7/EM1cRbea
   g9vdCTOBdVc6R8B6MFw6yW++HOJvt8X0JaF8kPiVwI7PUIHJXTXEQg8mH
   Q==;
X-CSE-ConnectionGUID: 2WT5FXIWQgq9htNvniiGfg==
X-CSE-MsgGUID: xHfxaOJRSiCjYns47XO8cQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21113406"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="21113406"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 17:41:02 -0700
X-CSE-ConnectionGUID: MgvjYgZnSaGew5XAQQfFrw==
X-CSE-MsgGUID: y0aGEjJNQPy3uLCQnxxd7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="56953471"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Apr 2024 17:40:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0sbB-0005fe-0I;
	Sun, 28 Apr 2024 00:40:57 +0000
Date: Sun, 28 Apr 2024 08:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 615/991] algif_aead.c:undefined
 reference to `.lock_sock_nested'
Message-ID: <202404280841.I0U0OOaJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   08ceadacc1da15a77045dee6654f9cd906906271
commit: d8acda0778f572993e1eb7f22487ff20113ab13c [615/991] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: powerpc64-randconfig-003-20240428 (https://download.01.org/0day-ci/archive/20240428/202404280841.I0U0OOaJ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280841.I0U0OOaJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280841.I0U0OOaJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `lock_sock_nested'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: crypto/algif_aead.o: in function `.aead_check_key':
>> algif_aead.c:(.text+0x48): undefined reference to `.lock_sock_nested'
>> powerpc64-linux-ld: algif_aead.c:(.text+0xb8): undefined reference to `.lock_sock_nested'
>> powerpc64-linux-ld: algif_aead.c:(.text+0x158): undefined reference to `.release_sock'
   powerpc64-linux-ld: algif_aead.c:(.text+0x174): undefined reference to `.release_sock'
   powerpc64-linux-ld: crypto/algif_aead.o: in function `.aead_sendmsg':
>> algif_aead.c:(.text+0x344): undefined reference to `.af_alg_sendmsg'
   powerpc64-linux-ld: crypto/algif_aead.o: in function `.aead_sock_destruct':
>> algif_aead.c:(.text+0x478): undefined reference to `.af_alg_pull_tsgl'
>> powerpc64-linux-ld: algif_aead.c:(.text+0x498): undefined reference to `.sock_kzfree_s'
>> powerpc64-linux-ld: algif_aead.c:(.text+0x4b8): undefined reference to `.sock_kfree_s'
>> powerpc64-linux-ld: algif_aead.c:(.text+0x4c4): undefined reference to `.af_alg_release_parent'
   powerpc64-linux-ld: crypto/algif_aead.o: in function `.aead_accept_parent_nokey':
>> algif_aead.c:(.text+0x55c): undefined reference to `.sock_kmalloc'
>> powerpc64-linux-ld: algif_aead.c:(.text+0x5a0): undefined reference to `.sock_kmalloc'
   powerpc64-linux-ld: algif_aead.c:(.text+0x5d8): undefined reference to `.sock_kfree_s'
   powerpc64-linux-ld: crypto/algif_aead.o: in function `._aead_recvmsg.isra.0':
>> algif_aead.c:(.text+0xb4c): undefined reference to `.af_alg_wait_for_data'
>> powerpc64-linux-ld: algif_aead.c:(.text+0xd34): undefined reference to `.af_alg_alloc_areq'
>> powerpc64-linux-ld: algif_aead.c:(.text+0xd90): undefined reference to `.af_alg_get_rsgl'
>> powerpc64-linux-ld: algif_aead.c:(.text+0xdc4): undefined reference to `.af_alg_free_resources'
   powerpc64-linux-ld: algif_aead.c:(.text+0xe54): undefined reference to `.af_alg_free_resources'
   powerpc64-linux-ld: algif_aead.c:(.text+0x1028): undefined reference to `.af_alg_free_resources'
>> powerpc64-linux-ld: algif_aead.c:(.text+0x1118): undefined reference to `.af_alg_pull_tsgl'
   powerpc64-linux-ld: algif_aead.c:(.text+0x1178): undefined reference to `.af_alg_free_resources'
>> powerpc64-linux-ld: algif_aead.c:(.text+0x11ac): undefined reference to `.af_alg_count_tsgl'
   powerpc64-linux-ld: algif_aead.c:(.text+0x11f8): undefined reference to `.sock_kmalloc'
   powerpc64-linux-ld: algif_aead.c:(.text+0x122c): undefined reference to `.af_alg_free_resources'
   powerpc64-linux-ld: algif_aead.c:(.text+0x1278): undefined reference to `.af_alg_pull_tsgl'
>> powerpc64-linux-ld: algif_aead.c:(.text+0x1690): undefined reference to `.sk_free'
   powerpc64-linux-ld: algif_aead.c:(.text+0x182c): undefined reference to `.af_alg_free_resources'
   powerpc64-linux-ld: crypto/algif_aead.o: in function `.aead_recvmsg':
   algif_aead.c:(.text+0x1990): undefined reference to `.lock_sock_nested'
>> powerpc64-linux-ld: algif_aead.c:(.text+0x1adc): undefined reference to `.af_alg_wmem_wakeup'
   powerpc64-linux-ld: algif_aead.c:(.text+0x1ae8): undefined reference to `.release_sock'
   powerpc64-linux-ld: crypto/algif_aead.o: in function `.aead_sendmsg_nokey':
   algif_aead.c:(.text+0x1cc8): undefined reference to `.af_alg_sendmsg'
   powerpc64-linux-ld: crypto/algif_aead.o: in function `.algif_aead_exit':
>> algif_aead.c:(.exit.text+0x1c): undefined reference to `.af_alg_unregister_type'
   powerpc64-linux-ld: crypto/algif_aead.o: in function `.algif_aead_init':
>> algif_aead.c:(.init.text+0x24): undefined reference to `.af_alg_register_type'
   powerpc64-linux-ld: crypto/algif_aead.o:(.toc+0x0): undefined reference to `af_alg_async_cb'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x10): undefined reference to `af_alg_release'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x18): undefined reference to `sock_no_bind'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x20): undefined reference to `sock_no_connect'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x28): undefined reference to `sock_no_socketpair'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x30): undefined reference to `sock_no_accept'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x38): undefined reference to `sock_no_getname'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x40): undefined reference to `af_alg_poll'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x48): undefined reference to `sock_no_ioctl'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x58): undefined reference to `sock_no_listen'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x60): undefined reference to `sock_no_shutdown'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x90): undefined reference to `sock_no_mmap'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0xe8): undefined reference to `af_alg_release'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0xf0): undefined reference to `sock_no_bind'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0xf8): undefined reference to `sock_no_connect'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x100): undefined reference to `sock_no_socketpair'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x108): undefined reference to `sock_no_accept'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x110): undefined reference to `sock_no_getname'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x118): undefined reference to `af_alg_poll'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x120): undefined reference to `sock_no_ioctl'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x130): undefined reference to `sock_no_listen'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x138): undefined reference to `sock_no_shutdown'
   powerpc64-linux-ld: crypto/algif_aead.o:(.data.rel+0x168): undefined reference to `sock_no_mmap'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [y]:
   - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
