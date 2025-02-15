Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6EC1DE4D3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 17:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739639113; cv=none; b=NSbMaH3yGp41NELxdP6n6SWvgh7UEa7Qc3DK/05/Kwb3gmsBHhigzzza+hZWqj4HwpjYC5JNsrJJa1s81QRIOOltvpTy1aCZ3EBTuYmiqD/YbWBrKcJpFGeIUBzUqVF+KUNqI+cGvenybKD/bt3mJdFslmH3Qetx9gtLey8zT0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739639113; c=relaxed/simple;
	bh=GSaE3e1bqx8llseJDGQOKp378nLsXCFMoTS6A4js+7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qCHSCUG8dPwJXywyS2MFBi5hhCM5rxIrc2AxdAkph9Uo8Vy8UYTwaZk7iCOeWuMwBwmbJHm4SWTuYn7dc1wv/FtCIXjhBuey7ZYuwFvkGM1gRIGecZWruPJjiReuFzsnTxiW3N3gF52uaqzBYcCo1y2Ax+xDzPdGraePt1Oa+/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4HnHaxZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4HnHaxZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739639111; x=1771175111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GSaE3e1bqx8llseJDGQOKp378nLsXCFMoTS6A4js+7U=;
  b=n4HnHaxZsqsefIvuoT+Bd67Nax1BIlhxQ+JtqN1Hlu6TUX2eUKyteHY6
   K6p5u/fDmUvT4kYrFUgSRzrz7iGiDu5vdtNlsZ5oHCpJvb3Fd7FcdXtnc
   Sr9dQpzTAmkIBT5SSBZ0v7LN2U6PYBFU0XgwnHN9RI2DVIViwrqAo9Eix
   zNHcXMl7dHIEw7lnI+n3e+epiyfa/q9RuXGtlggwqCTPNsLGlU+yjo2l6
   lS/MUh1CGYa8EgICkXAHexaiiTGyeXCYYb6i9GAs1LsetkDk6ZkdrQMtZ
   rbg4wVUvRJMouI7tO2Y3HB2FlmuTd+VYzp/lX7izZxNd1qYA1fYyW9GQX
   A==;
X-CSE-ConnectionGUID: Vcm1+ONlTsCRlTJ3e28F3A==
X-CSE-MsgGUID: RM/YV+fIRwquXOjkfdSWlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="51017804"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="51017804"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 09:05:10 -0800
X-CSE-ConnectionGUID: 1REe0aMeSA+EPiIrsxVFBQ==
X-CSE-MsgGUID: TbaxNroYTC6hz2ESUiy33Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="113686837"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Feb 2025 09:05:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjLbH-001B1T-1J;
	Sat, 15 Feb 2025 17:05:07 +0000
Date: Sun, 16 Feb 2025 01:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 2/2] ERROR: modpost:
 "rust_helper_blk_mq_rq_to_pdu" [drivers/block/rnull_mod.ko] undefined!
Message-ID: <202502160000.wQmVb1WC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   182695db82766c74af984ea5529f14abc4ccb882
commit: 9d239c3200382bec6f609d9dd52709ff15b88e6a [2/2] ANDROID: Allow MODVERSIONS + Rust with no symbol export
config: x86_64-randconfig-r061-20250215 (https://download.01.org/0day-ci/archive/20250216/202502160000.wQmVb1WC-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502160000.wQmVb1WC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160000.wQmVb1WC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/rnull_mod.o
>> ERROR: modpost: "rust_helper_blk_mq_rq_to_pdu" [drivers/block/rnull_mod.ko] undefined!
>> ERROR: modpost: "_RNvNtCs5QSdWC790r4_4core9panicking9panic_fmt" [drivers/block/rnull_mod.ko] undefined!
>> ERROR: modpost: "_RNvNtCs5QSdWC790r4_4core9panicking5panic" [drivers/block/rnull_mod.ko] undefined!
>> ERROR: modpost: "_RNvNtCs5QSdWC790r4_4core9panicking14panic_nounwind" [drivers/block/rnull_mod.ko] undefined!
>> ERROR: modpost: "_RNvNtCs5QSdWC790r4_4core9panicking36panic_misaligned_pointer_dereference" [drivers/block/rnull_mod.ko] undefined!
>> ERROR: modpost: "_RNvNtCs5QSdWC790r4_4core6result13unwrap_failed" [drivers/block/rnull_mod.ko] undefined!
>> ERROR: modpost: "_RNvNtNtCs1cdwasc6FUb_6kernel5print14format_strings4INFO" [drivers/block/rnull_mod.ko] undefined!
>> ERROR: modpost: "_RNvNtCs1cdwasc6FUb_6kernel5print11call_printk" [drivers/block/rnull_mod.ko] undefined!
>> ERROR: modpost: "_RNvNtNtCs1cdwasc6FUb_6kernel5alloc9allocator16krealloc_aligned" [drivers/block/rnull_mod.ko] undefined!
>> ERROR: modpost: "rust_helper_REFCOUNT_INIT" [drivers/block/rnull_mod.ko] undefined!
WARNING: modpost: suppressed 29 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
