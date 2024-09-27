Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E34C101F2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727447731; cv=none; b=mmzItDnB1nmWK0Ajo6wp7Fi1hyburqulqA4PfhIomzAtBtvzxzMrU1HQgK9YOkfhdj3LZmYW61vn1OqYWFpQ/hRYd9pRtIjjaAUOU9W4INPoQSbCfif5wD05BmNh9AE5XmHXZKAjmNklz7uaLwF5wOV5hg7yJhV0RCwJsddQbDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727447731; c=relaxed/simple;
	bh=P2axrJIfPsQ4ke64nhOQ7uG5QNL2TBMwvgvdpEIjKhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tIeqouoAVyqrYxLKIx+u0yEeNpuivxp7uEo5gF4e7kyDiEcu8Cmbq/dQI6HMWTJEEN4+3iURbKO9/EbAKvACWadn4vH/WwCIJ4SDZsGEQW28KxkJ5QhhyNPHSbR1+evQNnoMGwWdj8wt0+fu0mQzZZ+3g7/tzNpWCIa6iKMh3JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQbloXvk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQbloXvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727447730; x=1758983730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P2axrJIfPsQ4ke64nhOQ7uG5QNL2TBMwvgvdpEIjKhU=;
  b=YQbloXvkSjLF8qtaxICkPHizQU0NGl2Msblsx169z1L4D3mYkncaQqrT
   bgXe55pqTAo9mwTHj9f5w1AKqK8rYu+s39lsNFCPcK1g4zhvcadV/Ay4j
   BSkx30q15YamD9ph0u6yBH7T8EpL8jjn1bGXER2v2lXnFVQDDn9szEdB/
   kB/Nreq0P7NuIWUhYNB/u8CblqkPLacqPkLKlkW9JspWh2voPUlmEYJ/v
   WIWlpRu+JbhX9IcMKveCAECGmdzqyGtqiyWKxtZRZpG8VRT7ltLQKCkGM
   Njy6YoturJ8m0T1swEjJCIDa1tQVjHT4HCOWQEaNPkKffNvb7HtKQlg7S
   Q==;
X-CSE-ConnectionGUID: RMaAyd8/RDmFYzMXENyKoQ==
X-CSE-MsgGUID: GKJIPvrzRoqZFg1cV1FHRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26102269"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26102269"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:35:27 -0700
X-CSE-ConnectionGUID: KeavtQdIT9eiGL+XL2XWew==
X-CSE-MsgGUID: mdDKlX42T36v2kk0/vJdYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="72712093"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Sep 2024 07:35:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suC43-000MEy-2O;
	Fri, 27 Sep 2024 14:35:23 +0000
Date: Fri, 27 Sep 2024 22:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 615/1001]
 aarch64-linux-ld: Unexpected GOT/PLT entries detected!
Message-ID: <202409272212.IZssspbw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: d8acda0778f572993e1eb7f22487ff20113ab13c [615/1001] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: arm64-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272212.IZssspbw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272212.IZssspbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272212.IZssspbw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: crypto/algif_aead.o: in function `aead_sendmsg':
>> algif_aead.c:(.text+0x144): undefined reference to `af_alg_sendmsg'
   aarch64-linux-ld: crypto/algif_aead.o: in function `aead_sock_destruct':
>> algif_aead.c:(.text+0x214): undefined reference to `af_alg_pull_tsgl'
>> aarch64-linux-ld: algif_aead.c:(.text+0x22c): undefined reference to `sock_kzfree_s'
>> aarch64-linux-ld: algif_aead.c:(.text+0x244): undefined reference to `sock_kfree_s'
>> aarch64-linux-ld: algif_aead.c:(.text+0x24c): undefined reference to `af_alg_release_parent'
   aarch64-linux-ld: crypto/algif_aead.o: in function `aead_accept_parent_nokey':
>> algif_aead.c:(.text+0x2b4): undefined reference to `sock_kmalloc'
>> aarch64-linux-ld: algif_aead.c:(.text+0x2d8): undefined reference to `sock_kmalloc'
   aarch64-linux-ld: algif_aead.c:(.text+0x2fc): undefined reference to `sock_kfree_s'
   aarch64-linux-ld: crypto/algif_aead.o: in function `aead_check_key.isra.0':
>> algif_aead.c:(.text+0x52c): undefined reference to `lock_sock_nested'
>> aarch64-linux-ld: algif_aead.c:(.text+0x570): undefined reference to `lock_sock_nested'
>> aarch64-linux-ld: algif_aead.c:(.text+0x5d0): undefined reference to `release_sock'
   aarch64-linux-ld: algif_aead.c:(.text+0x5d8): undefined reference to `release_sock'
   aarch64-linux-ld: crypto/algif_aead.o: in function `_aead_recvmsg.isra.0':
>> algif_aead.c:(.text+0x7f4): undefined reference to `af_alg_alloc_areq'
>> aarch64-linux-ld: algif_aead.c:(.text+0x818): undefined reference to `af_alg_wait_for_data'
>> aarch64-linux-ld: algif_aead.c:(.text+0x880): undefined reference to `af_alg_get_rsgl'
>> aarch64-linux-ld: algif_aead.c:(.text+0x9d0): undefined reference to `af_alg_pull_tsgl'
>> aarch64-linux-ld: algif_aead.c:(.text+0xae0): undefined reference to `af_alg_count_tsgl'
   aarch64-linux-ld: algif_aead.c:(.text+0xb14): undefined reference to `sock_kmalloc'
   aarch64-linux-ld: algif_aead.c:(.text+0xb5c): undefined reference to `af_alg_pull_tsgl'
>> aarch64-linux-ld: algif_aead.c:(.text+0xc6c): undefined reference to `af_alg_async_cb'
   aarch64-linux-ld: crypto/algif_aead.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `af_alg_async_cb' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> algif_aead.c:(.text+0xc6c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: algif_aead.c:(.text+0xc70): undefined reference to `af_alg_async_cb'
>> aarch64-linux-ld: algif_aead.c:(.text+0xd24): undefined reference to `sk_free'
   aarch64-linux-ld: algif_aead.c:(.text+0xd2c): undefined reference to `af_alg_free_resources'
   aarch64-linux-ld: crypto/algif_aead.o: in function `aead_recvmsg':
   algif_aead.c:(.text+0xeb8): undefined reference to `lock_sock_nested'
   aarch64-linux-ld: algif_aead.c:(.text+0xf0c): undefined reference to `af_alg_wmem_wakeup'
   aarch64-linux-ld: algif_aead.c:(.text+0xf14): undefined reference to `release_sock'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x10): undefined reference to `af_alg_release'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x18): undefined reference to `sock_no_bind'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x20): undefined reference to `sock_no_connect'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x28): undefined reference to `sock_no_socketpair'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x30): undefined reference to `sock_no_accept'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x38): undefined reference to `sock_no_getname'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x40): undefined reference to `af_alg_poll'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x48): undefined reference to `sock_no_ioctl'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x58): undefined reference to `sock_no_listen'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x60): undefined reference to `sock_no_shutdown'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x90): undefined reference to `sock_no_mmap'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0xe8): undefined reference to `af_alg_release'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0xf0): undefined reference to `sock_no_bind'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0xf8): undefined reference to `sock_no_connect'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x100): undefined reference to `sock_no_socketpair'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x108): undefined reference to `sock_no_accept'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x110): undefined reference to `sock_no_getname'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x118): undefined reference to `af_alg_poll'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x120): undefined reference to `sock_no_ioctl'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x130): undefined reference to `sock_no_listen'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x138): undefined reference to `sock_no_shutdown'
   aarch64-linux-ld: crypto/algif_aead.o:(.data+0x168): undefined reference to `sock_no_mmap'
   aarch64-linux-ld: crypto/algif_aead.o: in function `algif_aead_exit':
   algif_aead.c:(.exit.text+0x10): undefined reference to `af_alg_unregister_type'
   aarch64-linux-ld: crypto/algif_aead.o: in function `algif_aead_init':
   algif_aead.c:(.init.text+0x18): undefined reference to `af_alg_register_type'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [y]:
   - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=y] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
