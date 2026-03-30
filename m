Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C2735E958
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774890090; cv=none; b=qSvV6wVfSErttNhhaWqnziT/nrdUG3OqBDzs0UGXWgkGyCilN/sKNDGoIud2rW5cP3Vo8LzS6rdlcSBlR6ztRCZJ62aIaNBlxYl/i9Av6EEuC6CzZP0qjzhE+IXGKrY4V9Wyw5MQjMVhIruBtup/v8aRGfTkjl0Z2+W0zENTbBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774890090; c=relaxed/simple;
	bh=ik88h5OADhY0NrOyR18cVY5VZKGS2G6RB2mNA1FQM+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VtyCqhZmoFWtnlyH80VQ8SwSoDyBPDdu8tH13mpq77FIwDJcQriVIB76P8sGWkVSR1LEjGlVET5AMW7A7PPviFohchTu0O+adqQ3Au/wwHykw0phxvnanIYJbuxXBT9He6f7+MMOJsnTKoZOuTYaqxXNZo+muvtsUk6ZL1OnGTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3+KnkpC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3+KnkpC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774890089; x=1806426089;
  h=date:from:to:cc:subject:message-id;
  bh=ik88h5OADhY0NrOyR18cVY5VZKGS2G6RB2mNA1FQM+4=;
  b=U3+KnkpCDstCpg4rTT6L2jnEEZuH1u+BYd9lqdVldUztB8ShDsnO+gTO
   fD9rra9ANIWdbdXNhgpjCCw/tuxDl2sdao88wWwliAVddwhQEhv6/eyMs
   Ro6PXOymq8h1fN19o1A93L3y9NYEfO+xeFWYGp97YQZd3mcNVeahtB1Qv
   U6PjUaxfJGoMXXuAIDARs2DFLOJXJb3J5WCvpwWdazqaAWJQnGMjgMonw
   UQdlsNhPkNkj70fNCBEPCXZJCirpaNwfEfI4CZrsvtY83ULDZEHHt46na
   ZJ/QWgDn8Ttimn+NkXnRsiYl9lilzCqXrcpyHuycUSCdwvr3XNaC/jYfR
   g==;
X-CSE-ConnectionGUID: H1oUITD8QWeAfA8f6THJLg==
X-CSE-MsgGUID: l0Vdtv8OQlel+Nrb5XkV4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75906520"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75906520"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 10:01:28 -0700
X-CSE-ConnectionGUID: ubE5hGKFQMmqHJB56lQ+CA==
X-CSE-MsgGUID: tIC5ujgDRuWmkbxZtNZL7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="225282209"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Mar 2026 10:01:27 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7FzQ-000000001Nb-285v;
	Mon, 30 Mar 2026 17:01:24 +0000
Date: Tue, 31 Mar 2026 01:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:85:6: sparse: sparse: symbol
 'filter_smc' was not declared. Should it be static?
Message-ID: <202603310047.MvQbjUCL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5fdbbd61a3cbdca7ac1034dc16723bdbc7ece8cc
commit: cf50248e99752ee522843c0dd529c21f4f726e66 [2/2] ANDROID: misc: pkvm_smc: Add an allow list for SMCs
config: arm64-randconfig-r122-20260330 (https://download.01.org/0day-ci/archive/20260331/202603310047.MvQbjUCL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310047.MvQbjUCL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310047.MvQbjUCL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:28:30: sparse: sparse: symbol 'allow_list' was not declared. Should it be static?
>> drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:85:6: sparse: sparse: symbol 'filter_smc' was not declared. Should it be static?

vim +/filter_smc +85 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c

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
    73	static inline int match_smc(const void *key, const void *elt)
    74	{
    75		u64 smc_id = ((struct pkvm_smc_filter *)key)->smc_id;
    76		u64 cur_id = ((struct pkvm_smc_filter *)elt)->smc_id;
    77	
    78		return smc_id - cur_id;
    79	}
    80	
    81	/*
    82	 * Block all by default.
    83	 * return false will allow the SMC to be forwarded.
    84	 */
  > 85	bool filter_smc(struct user_pt_regs *regs)
    86	{
    87		u64 smc_id = regs->regs[0];
    88		/*
    89		 * Ignore bits that doesn't change the functionality:
    90		 * Bit[30]: 32/64 bit convention
    91		 * Bit[16]: SVE hint
    92		 */
    93		u64 mask = ~(ARM_SMCCC_1_3_SVE_HINT | BIT(ARM_SMCCC_CALL_CONV_SHIFT));
    94		struct pkvm_smc_filter pval = {smc_id & mask, NULL};
    95		struct pkvm_smc_filter *entry;
    96	
    97		/* alternatively, we can do 2 level binary search or switch case by service. */
    98		entry = (struct pkvm_smc_filter *)__inline_bsearch((void *)&pval, allow_list,
    99								   ARRAY_SIZE(allow_list),
   100								   sizeof(allow_list[0]),
   101								   match_smc);
   102		if (!entry)
   103			return deny_smc(regs);
   104	
   105		return entry->cb ? entry->cb(regs) : false;
   106	}
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
