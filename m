Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572D9317141
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 01:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772761179; cv=none; b=Ex2O/h/dYrgamVMcG1BeSMfiUaXak5uSzyKaHpqecXlKLzZ0bqoGv07jOgrxU6U+RLUGNp+GdJO6KIwaSatdgcZmABK+QF8PjixnKQAq0XlJa0og9VOIDh4+K8CqCYkVl7CqqN/AFxw1OHgilTnJnQ8FUUU5/2Sg5TzejL9yHM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772761179; c=relaxed/simple;
	bh=xo8qSmTL+b8hhP/frZRD9PJ6HdlyTSZgTEBtQUCAJDI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nvi8ddIGhrA4vVhEtQxNfkNSiDDoWs/Ny2L9UpiOvkspIQFxXg4eT0l+srsRuJorFpnppsxEWlTznSQMk3wj/2GW+EdwjoXHzJ4Bv5+ArIf0AI0TxAvLrGVBB0iMTZvF38UpjX0Pxm0jjo/pckKD1eZ6J/xjSGW4AROvfe9864k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jm8j+xrx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jm8j+xrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772761178; x=1804297178;
  h=date:from:to:cc:subject:message-id;
  bh=xo8qSmTL+b8hhP/frZRD9PJ6HdlyTSZgTEBtQUCAJDI=;
  b=Jm8j+xrxn0IKD8+4fpJTiv3Jl7srYO+YDf0b+5geY/BPvNmvGwMySNtc
   cFYbczwNAgVkrOh4F/4d+JwY54V6Lo+mo4kNSGPgCNh6XEYStBq4iDRJZ
   AhTkuTvds+0ITBhiNu0YprAX/l/RZTw3hqNUuRXSnt0ddeLQy1eKmC9LA
   f3sz6KdCnWBnq1DkbmfRq5+H/h8GSfdYF5p5lJCFIQ247frIUUb9V006i
   ZQ0x9Koor7KFy5f4GEbyezXKK5Q+rrBB54ajNiOFXRQdbr8AATTJ5tnA/
   KrXFcBzFHfKp60UQ9i7L4XwQCTX0TLZ/KfEjq9l+35B/lFqiD2VL3bVgz
   g==;
X-CSE-ConnectionGUID: qnbp8dvNSkatc5273P8rtA==
X-CSE-MsgGUID: A9nCgLFtSke5S8Dqbs3T1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85339447"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="85339447"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 17:39:38 -0800
X-CSE-ConnectionGUID: QlwiI/T8Stykhv9XmHQZbg==
X-CSE-MsgGUID: awGiZZcITXqYKlquS8zDYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="215594870"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 17:39:35 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyKA9-000000000B3-19js;
	Fri, 06 Mar 2026 01:39:33 +0000
Date: Fri, 06 Mar 2026 09:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-laj 1/1]
 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:28:30: sparse: sparse: symbol
 'allow_list' was not declared. Should it be static?
Message-ID: <202603060939.XbwiLzJO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-laj
head:   93730e472d2b8958b634e40387e6de659bfbf270
commit: 68493dadec7226df39070dae1ad58372bbc0cf42 [1/1] ANDROID: misc: pkvm_smc: Add an allow list for SMCs
config: arm64-randconfig-r121-20260306 (https://download.01.org/0day-ci/archive/20260306/202603060939.XbwiLzJO-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060939.XbwiLzJO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060939.XbwiLzJO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:28:30: sparse: sparse: symbol 'allow_list' was not declared. Should it be static?

vim +/allow_list +28 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c

    22	
    23	/*
    24	 * Must be sorted.
    25	 * Allow SMCCCs that are known to be safe.
    26	 * PSCI and FFA are already handled by the hypervisor.
    27	 */
  > 28	const struct pkvm_smc_filter allow_list[] = {
    29		/* Trusted OS Calls: Trusty Trusted OS (Yielding) */
    30		{0x32000014, NULL,}, /* SMC_SC_VIRTIO_GET_DESCR. */
    31		{0x32000015, NULL,}, /* SMC_SC_VIRTIO_START. */
    32		{0x32000016, NULL,}, /* SMC_SC_VIRTIO_STOP. */
    33		{0x32000017, NULL,}, /* SMC_SC_VDEV_RESET. */
    34		{0x32000018, NULL,}, /* SMC_SC_VDEV_KICK_VQ. */
    35		{0x32000019, NULL,}, /* SMC_NC_VDEV_KICK_VQ. */
    36		{0x3200001E, NULL,}, /* SMC_SC_CREATE_QL_TIPC_DEV. */
    37		{0x3200001F, NULL,}, /* SMC_SC_SHUTDOWN_QL_TIPC_DEV. */
    38		{0x32000020, NULL,}, /* SMC_SC_HANDLE_QL_TIPC_DEV_CMD. */
    39		{0x32000021, NULL,}, /* SMC_FC_HANDLE_QL_TIPC_DEV_CMD. */
    40	
    41		/* Trusted OS Calls: Trusty Secure Monitor (Yielding) */
    42		{0x3C000000, NULL,}, /* SMC_SC_RESTART_LAST. */
    43		{0x3C000001, NULL,}, /* SMC_SC_LOCKED_NOP. */
    44		{0x3C000002, NULL,}, /* SMC_SC_RESTART_FIQ. */
    45		{0x3C000003, NULL,}, /* SMC_SC_NOP. */
    46		{0x3C000004, NULL,}, /* SMC_SC_SCHED_SHARE_REGISTER. */
    47		{0x3C000005, NULL,}, /* SMC_SC_SCHED_SHARE_UNREGISTER. */
    48	
    49		/* Arm Architecture Calls. */
    50		{0x80000000, NULL}, /* SMCCC_VERSION. */
    51		{0x80000001, NULL}, /* SMCCC_ARCH_FEATURES. */
    52		{0x80000002, NULL}, /* SMCCC_ARCH_SOC_ID. */
    53	
    54		/* Standard Secure services: TRNG */
    55		{0x84000050, NULL,}, /* TRNG_VERSION. */
    56		{0x84000051, NULL,}, /* TRNG_FEATURES. */
    57		{0x84000052, NULL,}, /* TRNG_GET_UUID. */
    58		{0x84000053, NULL,}, /* TRNG_RND. */
    59	
    60		/* Trusted OS Calls: Trusty Secure Monitor (Fast) */
    61		{0xBC000001, NULL,}, /* SMC_FC_FIQ_EXIT. */
    62		{0xBC000002, NULL,}, /* SMC_FC_REQUEST_FIQ. */
    63		{0xBC000003, NULL,}, /* SMC_FC_GET_NEXT_IRQ. */
    64		{0xBC000007, NULL,}, /* SMC_FC_CPU_SUSPEND. */
    65		{0xBC000008, NULL,}, /* SMC_FC_CPU_RESUME. */
    66		{0xBC000009, NULL,}, /* SMC_FC_AARCH_SWITCH. */
    67		{0xBC00000A, NULL,}, /* SMC_FC_GET_VERSION_STR. */
    68		{0xBC00000B, NULL,}, /* SMC_FC_API_VERSION. */
    69		{0xBC00000C, NULL,}, /* SMC_FC_FIQ_RESUME. */
    70		{0xBC00000D, NULL,}, /* SMC_FC_GET_SMP_MAX_CPUS. */
    71	};
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
