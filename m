Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118515;
	b=ThRm9/4LMWGA2461W2Koap3woq8OE1VpqS/VPYkiXxWkFFPpmCzmpVT/P9d3hwZKAair
	 Ny0UO6U7gbQ4vZQosdkqfavbVHwgg3PI/pWdM0N/B7DlyySxby0iL+uPDgA4VIg6gBM8U
	 Bb+pkmOgv+m2bMK7ZJhHiMQ/v/BO4AQlCSgpcM2S67fkOUNms2lBpmv1R02HDAtxUfPEf
	 A0IZkPV3MZFHSe1VIjOhllGhCEFOHKdEEWmdEEzQXP+6UDiHRe08DS/Qm+NEDmCYewd4X
	 PKR2vrEvnvKyLkKVD9ntIT7E5TBgQ0kXqSSE9M5ndEubgelZOiziEzWY0gVsFKVLCBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118515;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Gioo6zIB5D4pc9X15UT761R3Tlf+91p2z//W3sC1KXo=;
	b=xi8/IGGmLtF5wkwRmZErg4MiHGBadzr/LgIBMdkS5S1Jo1bfmdZ3lBI860+lPiMy0+LP
	 cx494MC8EceMj8tvJJ2nnbewF9qEBPv9XcAe81YfeM42QHLftP3SuC3c4xmejeDaNIIX8
	 8uIVylt7/ViFsIUvtJc88b1v4Pl8TVprI5e7KJEqsrp0YLb0P26TkkFOJAvHoGIQuXHKS
	 1Wnsgrif9Qn7RiDE6iP0PlFAq/rd6Z5g7k2EI8AJTcno2YjpHfY8sJdiV0Ojgq4nU2qEg
	 kejhh/QKp6KIbXrTpvKjaIAs+5O/8rkS1DSkdHl9F2lYrFWIq8D0UyBe7GSYxH/eINw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CTVLPKC2;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3A2606A322
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 16:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3A2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CTVLPKC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793118514; x=1824654514;
  h=date:from:to:cc:subject:message-id;
  bh=2shhA9WgAOcThObGjg6bWKb6aHFQD8LypWWmYbLuOSk=;
  b=CTVLPKC2zCIgrIlyj024j7sgVMz06m9oyVQ5zUIHPIHMd1Oe0qmK1tun
   dKUfp20i3VqGlZ7WPrdz/3zPu7yKqLhrb6R+0AFEezPecpGoNYxuKCZnz
   Pmy4fMrPJ3RTv7AeI2iEG6PnJ9+Lo5ZSCMBv3Yjw7NduoejJ2jKURLmEV
   IGBKrhx7VMvF/zNEoXz+2OA+I2arVpP32zxSV2EIgeLOX3z/6pkSTSBZx
   F+wFvyxCSeuA2ghKgGz/+L5TANr1cp2FjPzu29CO8K059QTRVb7pPjmsf
   Ci0d5d8lnLF7R44KIA6Yc9tbtDXoL5Gg2hjIdkCT5noR7qDOw4LpNRAiF
   Q==;
X-CSE-ConnectionGUID: LuwrBJvuR8CWb86HFnnRKw==
X-CSE-MsgGUID: jdKzyNoGTJq+s2y7wPWQug==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1833034"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1833034"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:28:34 -0700
X-CSE-ConnectionGUID: NpxnydP9RAyEC8xshmBKLQ==
X-CSE-MsgGUID: YuOsHW3iRcyCMTQCI3YP3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4667116"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Oct 2026 09:28:32 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLk2I-000000004Z1-0vO2;
	Tue, 27 Oct 2026 16:28:30 +0000
Date: Tue, 27 Oct 2026 17:27:49 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 1/1]
 fs/eventfd.c:69:17: sparse: sparse: restricted __poll_t degrades to integer
Message-ID: <202610271712.2vCgHZXu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-10
head:   a4c2f82969bc5fa7fcc21ede4b690ece7ff72335
commit: 5ab578f7df5851af50a27032c916a09b9d911047 [1/1] UPSTREAM: eventfd: provide a eventfd_signal_mask() helper
config: arm64-randconfig-r2309-20261018 (https://download.01.org/0day-ci/archive/20261027/202610271712.2vCgHZXu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271712.2vCgHZXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271712.2vCgHZXu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/eventfd.c:69:17: sparse: sparse: restricted __poll_t degrades to integer
>> fs/eventfd.c:69:17: sparse: sparse: cast to restricted __poll_t

vim +69 fs/eventfd.c

    47	
    48	__u64 eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n, unsigned mask)
    49	{
    50		unsigned long flags;
    51	
    52		/*
    53		 * Deadlock or stack overflow issues can happen if we recurse here
    54		 * through waitqueue wakeup handlers. If the caller users potentially
    55		 * nested waitqueues with custom wakeup handlers, then it should
    56		 * check eventfd_signal_count() before calling this function. If
    57		 * it returns true, the eventfd_signal() call should be deferred to a
    58		 * safe context.
    59		 */
    60		if (WARN_ON_ONCE(this_cpu_read(eventfd_wake_count)))
    61			return 0;
    62	
    63		spin_lock_irqsave(&ctx->wqh.lock, flags);
    64		this_cpu_inc(eventfd_wake_count);
    65		if (ULLONG_MAX - ctx->count < n)
    66			n = ULLONG_MAX - ctx->count;
    67		ctx->count += n;
    68		if (waitqueue_active(&ctx->wqh))
  > 69			wake_up_locked_poll(&ctx->wqh, EPOLLIN | mask);
    70		this_cpu_dec(eventfd_wake_count);
    71		spin_unlock_irqrestore(&ctx->wqh.lock, flags);
    72	
    73		return n;
    74	}
    75	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
