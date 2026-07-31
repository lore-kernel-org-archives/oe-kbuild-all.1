Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422DC41D115
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785495002; cv=none; b=cenZ/dXp04x6odIS5z3Oq3PskKjisuyWk1bMRKvHf4rsVL5I/qczmuRIoUzQP3ZGgTHllsPP5j79aOtig423xDe/2BsVMjXWzNfeEcf5NXYMVEuQLTCdXghBMfRqVkZ0CtLKqwgRSKdEv9qXZ+yNyO7qLOY31XG5bTSXZvTivKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785495002; c=relaxed/simple;
	bh=cbAAf1enhhyLZlSdZjjOfm3qIhIkvldR5RgWt/7oNQM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MShgNIQtdgIxNMmG10Rj7ShKDRhJe9biYdH3TCr/AbEOSojy6vw+VqduLPtV8GQxOPZTXX/jVOiUkv5UdZIav9C3MaIy54Tdy4MbnSpEQp2rTJMYalWx8dQd853Z9mDaqnzC94aLxYA2VlkEuRNRfT87cXpOYIdmWCNKLpJ6dZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNB0udjz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNB0udjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785494994; x=1817030994;
  h=date:from:to:cc:subject:message-id;
  bh=cbAAf1enhhyLZlSdZjjOfm3qIhIkvldR5RgWt/7oNQM=;
  b=aNB0udjzxk+Bm2AdFIunwZyrb8m4Cd0bnwpqtwukJ7VW5YP3lmeOs5AL
   V/oJiZDZtjJTw5nMfbKUGgLoXtXlPhmhd4D6uIpgWra/zgkJo0NOomh/Z
   XrpjEfUFOjquLJODfukKtI+k4tb2OELXaWtQYcEbT4IvNvh+g5tZjGzKL
   ShZ4eoctQSju5J80ypX+eM807zbOYYRfJ0nDH0TB8uoSprsvseKOZWmqX
   oHPOS8BQhQfPNTPo5INghBvHH7ievyvNV2a99Fdf0UtqwdO3xl7lZljbr
   064mZqL4uYON7lH2XGs/IyR358K80Js4wSurKYacAMrprP/Q119rzi3XW
   g==;
X-CSE-ConnectionGUID: p4RRePo1RfSeqEarTMv1jQ==
X-CSE-MsgGUID: ykQ/H1R8Taqh42MjDvR7Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97634317"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="97634317"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 03:49:51 -0700
X-CSE-ConnectionGUID: L4p4GeBwQA2KPhofgdWHHw==
X-CSE-MsgGUID: 5HpcPu7GQWS92MXInNj1+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="264035872"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Jul 2026 03:49:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpkoF-000000000fH-1yZl;
	Fri, 31 Jul 2026 10:49:47 +0000
Date: Fri, 31 Jul 2026 18:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: oe-kbuild-all@lists.linux.dev,
 John Johansen <john.johansen@canonical.com>
Subject: [linux-next:master 5408/10862] powerpc-linux-ld:
 apparmorfs.c:undefined reference to `zstd_dctx_workspace_bound'
Message-ID: <202607311813.qXoXbwL1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95d6a9ccef99117115e41e9adb271243bd5e985b
commit: c431011ab65fd4ef205e3ce8cfc4b031c67768d9 [5408/10862] apparmor: replace decompress_zstd() prototype with its entity
config: powerpc-randconfig-r131-20260731 (https://download.01.org/0day-ci/archive/20260731/202607311813.qXoXbwL1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311813.qXoXbwL1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311813.qXoXbwL1-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: security/apparmor/apparmorfs.o: in function `policy_update':
   apparmorfs.c:(.text+0x5f48): undefined reference to `zstd_get_frame_header'
>> powerpc-linux-ld: apparmorfs.c:(.text+0x6114): undefined reference to `zstd_dctx_workspace_bound'
>> powerpc-linux-ld: apparmorfs.c:(.text+0x6148): undefined reference to `zstd_init_dctx'
>> powerpc-linux-ld: apparmorfs.c:(.text+0x6164): undefined reference to `zstd_decompress_dctx'
>> powerpc-linux-ld: apparmorfs.c:(.text+0x6168): undefined reference to `zstd_is_error'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
