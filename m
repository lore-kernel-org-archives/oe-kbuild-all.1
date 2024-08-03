Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3F842A87
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 22:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722723452; cv=none; b=Tv5tAiv+OoMvscqeKzBm3g3vHoW2wtlgrAQgWYHJ7SQqBRKu21O9E3m1jqhMaGQ36EOhZPEebpJYc/SOvcP00cPWBtIiQTXaSxtnvBL+D8wBzMZRDMzGDDfpKVB9A0+pKcaD+//wnNHbYTImirW1qoP4fgVmsuMqLRAsIXHvIik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722723452; c=relaxed/simple;
	bh=Hx23IqVBEri9/BP8Re1+OdOSXlZlIcXnIMTWxGJ9le0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJ4W5HIR9etwljUdpPEf6wsJnA2E1fH5m9NBk0sOGuEt+nNuaxYM6TOGPu31EagQdSj4t1U1VOMrWUkZqVd/h6g0FC5xPtTK7G0E60mjTN8jDx1hBoZNOgFzOKB+zwlq3Bll4HMWM9wMDJ/tmWSemtlc9clGhH5BqSxijy3TJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SngmRszt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SngmRszt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722723451; x=1754259451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hx23IqVBEri9/BP8Re1+OdOSXlZlIcXnIMTWxGJ9le0=;
  b=SngmRsztLjdgV9lwOmnX0aGmcRStXP7ERzccT4RWZLckaLN1gcysFh5R
   WL3WV4WifsxWHqGgM1ZlDTnMI2INDOLlYQLVmQp9FLpc0qdWi/5ShYUPY
   zPC3V0CzclNrsx257gMj4wNExGoOf6H4S2Hpivw3MQeTTVRkz1U9JwDZl
   fqxq/LGmOcd4uheRG3ln1pwX52nKHFzJWjdawcwMwvygpzza062nuw/ph
   OozqOcve0+yoWZgtf76kf2vrfNTOk+vpHxF0HPClMWX30WP0mz48I7Zha
   aOidbfBB5DEBTmHuSISzgLVo1cDb2/BTFwrZU3mXleIpcgx+mW1RL2yT6
   A==;
X-CSE-ConnectionGUID: INhv4dt7SWa16HT5f52Wzw==
X-CSE-MsgGUID: YehF6OieSe+vlcM6/ZDI4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20532086"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="20532086"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 15:17:29 -0700
X-CSE-ConnectionGUID: thQmB37TRtmxZ4T9uz9RDg==
X-CSE-MsgGUID: cEOBC06JSkaC0DcFNzO8HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="55993102"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Aug 2024 15:17:27 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saN40-0000wm-0X;
	Sat, 03 Aug 2024 22:17:24 +0000
Date: Sun, 4 Aug 2024 06:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 615/1093] xtensa-linux-ld:
 crypto/algif_aead.o:undefined reference to `af_alg_register_type'
Message-ID: <202408040619.fQVFWMpK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   868286d51b5753a66ab89c1c899510c6047b998d
commit: d8acda0778f572993e1eb7f22487ff20113ab13c [615/1093] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: xtensa-randconfig-002-20240803 (https://download.01.org/0day-ci/archive/20240804/202408040619.fQVFWMpK-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040619.fQVFWMpK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040619.fQVFWMpK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: crypto/algif_aead.o:(.init.literal+0x4): undefined reference to `af_alg_register_type'
   xtensa-linux-ld: crypto/algif_aead.o: in function `crypto_aead_copy_sgl':
   algif_aead.c:(.text+0x60): undefined reference to `af_alg_sendmsg'
   xtensa-linux-ld: crypto/algif_aead.o: in function `aead_sendmsg':
   algif_aead.c:(.text+0x87): undefined reference to `af_alg_sendmsg'
>> xtensa-linux-ld: algif_aead.c:(.text+0xb8): undefined reference to `af_alg_pull_tsgl'
>> xtensa-linux-ld: algif_aead.c:(.text+0xbc): undefined reference to `sock_kzfree_s'
   xtensa-linux-ld: crypto/algif_aead.o: in function `aead_setauthsize':
>> algif_aead.c:(.text+0xc0): undefined reference to `sock_kfree_s'
>> xtensa-linux-ld: algif_aead.c:(.text+0xc4): undefined reference to `af_alg_release_parent'
   xtensa-linux-ld: algif_aead.c:(.text+0xee): undefined reference to `af_alg_pull_tsgl'
   xtensa-linux-ld: crypto/algif_aead.o: in function `aead_sock_destruct':
>> algif_aead.c:(.text+0xfa): undefined reference to `sock_kzfree_s'
>> xtensa-linux-ld: algif_aead.c:(.text+0x106): undefined reference to `sock_kfree_s'
   xtensa-linux-ld: algif_aead.c:(.text+0x10e): undefined reference to `af_alg_release_parent'
>> xtensa-linux-ld: algif_aead.c:(.text+0x130): undefined reference to `sock_kmalloc'
   xtensa-linux-ld: algif_aead.c:(.text+0x150): undefined reference to `sock_kmalloc'
   xtensa-linux-ld: algif_aead.c:(.text+0x16b): undefined reference to `sock_kmalloc'
   xtensa-linux-ld: crypto/algif_aead.o: in function `aead_accept_parent_nokey':
   algif_aead.c:(.text+0x17b): undefined reference to `sock_kfree_s'
   xtensa-linux-ld: crypto/algif_aead.o: in function `aead_release':
   algif_aead.c:(.text+0x2a4): undefined reference to `lock_sock_nested'
>> xtensa-linux-ld: algif_aead.c:(.text+0x2a8): undefined reference to `release_sock'
>> xtensa-linux-ld: algif_aead.c:(.text+0x2bf): undefined reference to `lock_sock_nested'
   xtensa-linux-ld: crypto/algif_aead.o: in function `aead_bind':
   algif_aead.c:(.text+0x2d4): undefined reference to `lock_sock_nested'
   xtensa-linux-ld: algif_aead.c:(.text+0x302): undefined reference to `release_sock'
   xtensa-linux-ld: algif_aead.c:(.text+0x30a): undefined reference to `release_sock'
>> xtensa-linux-ld: algif_aead.c:(.text+0x31c): undefined reference to `af_alg_async_cb'
>> xtensa-linux-ld: algif_aead.c:(.text+0x320): undefined reference to `af_alg_wait_for_data'
>> xtensa-linux-ld: algif_aead.c:(.text+0x324): undefined reference to `af_alg_alloc_areq'
>> xtensa-linux-ld: algif_aead.c:(.text+0x328): undefined reference to `af_alg_get_rsgl'
>> xtensa-linux-ld: algif_aead.c:(.text+0x32c): undefined reference to `af_alg_free_resources'
>> xtensa-linux-ld: algif_aead.c:(.text+0x330): undefined reference to `af_alg_count_tsgl'
>> xtensa-linux-ld: algif_aead.c:(.text+0x334): undefined reference to `sk_free'
   xtensa-linux-ld: crypto/algif_aead.o: in function `aead_check_key.isra.0':
   algif_aead.c:(.text+0x36e): undefined reference to `af_alg_wait_for_data'
   xtensa-linux-ld: algif_aead.c:(.text+0x3ba): undefined reference to `af_alg_alloc_areq'
   xtensa-linux-ld: algif_aead.c:(.text+0x3db): undefined reference to `af_alg_get_rsgl'
   xtensa-linux-ld: algif_aead.c:(.text+0x3fe): undefined reference to `af_alg_free_resources'
   xtensa-linux-ld: crypto/algif_aead.o: in function `_aead_recvmsg.isra.0':
>> algif_aead.c:(.text+0x454): undefined reference to `af_alg_free_resources'
   xtensa-linux-ld: algif_aead.c:(.text+0x47e): undefined reference to `af_alg_free_resources'
   xtensa-linux-ld: algif_aead.c:(.text+0x492): undefined reference to `af_alg_pull_tsgl'
   xtensa-linux-ld: algif_aead.c:(.text+0x4ae): undefined reference to `af_alg_free_resources'
   xtensa-linux-ld: algif_aead.c:(.text+0x4c4): undefined reference to `af_alg_count_tsgl'
   xtensa-linux-ld: algif_aead.c:(.text+0x4e4): undefined reference to `sock_kmalloc'
   xtensa-linux-ld: algif_aead.c:(.text+0x4f3): undefined reference to `af_alg_free_resources'
   xtensa-linux-ld: algif_aead.c:(.text+0x517): undefined reference to `af_alg_pull_tsgl'
   xtensa-linux-ld: algif_aead.c:(.text+0x634): undefined reference to `sk_free'
   xtensa-linux-ld: algif_aead.c:(.text+0x6ac): undefined reference to `af_alg_free_resources'
>> xtensa-linux-ld: algif_aead.c:(.text+0x6e4): undefined reference to `af_alg_wmem_wakeup'
   xtensa-linux-ld: algif_aead.c:(.text+0x6fc): undefined reference to `lock_sock_nested'
   xtensa-linux-ld: algif_aead.c:(.text+0x744): undefined reference to `af_alg_wmem_wakeup'
   xtensa-linux-ld: algif_aead.c:(.text+0x74c): undefined reference to `release_sock'
>> xtensa-linux-ld: algif_aead.c:(.text+0x7be): undefined reference to `af_alg_sendmsg'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x8): undefined reference to `af_alg_release'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0xc): undefined reference to `sock_no_bind'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x10): undefined reference to `sock_no_connect'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x14): undefined reference to `sock_no_socketpair'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x18): undefined reference to `sock_no_accept'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x1c): undefined reference to `sock_no_getname'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x20): undefined reference to `af_alg_poll'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x24): undefined reference to `sock_no_ioctl'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x2c): undefined reference to `sock_no_listen'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x30): undefined reference to `sock_no_shutdown'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x48): undefined reference to `sock_no_mmap'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x74): undefined reference to `af_alg_release'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x78): undefined reference to `sock_no_bind'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x7c): undefined reference to `sock_no_connect'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x80): undefined reference to `sock_no_socketpair'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x84): undefined reference to `sock_no_accept'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x88): undefined reference to `sock_no_getname'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x8c): undefined reference to `af_alg_poll'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x90): undefined reference to `sock_no_ioctl'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x98): undefined reference to `sock_no_listen'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0x9c): undefined reference to `sock_no_shutdown'
   xtensa-linux-ld: crypto/algif_aead.o:(.data+0xb4): undefined reference to `sock_no_mmap'
   xtensa-linux-ld: crypto/algif_aead.o: in function `algif_aead_init':
   algif_aead.c:(.init.text+0xf): undefined reference to `af_alg_register_type'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [y]:
   - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
