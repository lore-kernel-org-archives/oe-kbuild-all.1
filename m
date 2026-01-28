Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841062C15AC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 02:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769568406; cv=none; b=uddeZp8Agd0s7aKSAZZ2GwBFz8IrQsZsX866SwZ4BZZCz048CTlyJVHFGNwGmxASDuCNuPVPe2wwSJR+lUFK23m8fQjIC46hR52QKSfQr/Y0BBxqCBUf5Fj/3xDXTat0K0o5H+zP6GruaVwnmqSbBFDxCmpuL4EvPOAPCggfpV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769568406; c=relaxed/simple;
	bh=PzWnx6MqfSbwsZAMezDpDnAl3NCltDLd75neaW05xLE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kDO29NQbtgi0jdzNmFlVBEmcanbKixNUoRnkHsxo6BWuAVg2Ra4B/QuGYSoTzjiu3Gtl1g9hXURLsaq8dz7iJjKbgl0TldKsV6Ft4Cj+BS/zt+YAbLlVc3ZhmnEIdMxfapsUXdbinl4XIe52vkTLnFP3kpXxQrkymlEm2pmV6MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3U1CVV6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3U1CVV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769568405; x=1801104405;
  h=date:from:to:cc:subject:message-id;
  bh=PzWnx6MqfSbwsZAMezDpDnAl3NCltDLd75neaW05xLE=;
  b=Q3U1CVV6HC4Hh/AbGuEmolmGWZJm2DhNiGj1KYPDO+IIi6Ugi/RORx6u
   QCW8Ym5sEZenU08My6B6K6duRsB7pwJMXj6A3HbtC6YshIqDROVnDsbcf
   VIsEP+ioHTuFPQR/VN+XsU8dQrbYLybULdCbxzdatGyz8dHaayqtlZEPB
   3oXBfg+lNgiZ6ON03asP1O8KOsw5z8KPPYwFO8NjpTGVnzmyfYs9nYr8Z
   Gz5siDOO3IL27ZqLHVQcNb7PnPGM7BqwE4uKgz5Ax4uhvjmNJAmDvYyYH
   9j+eElXURHT7psi7gFP4NORMZFJ/0b5frDbguFE1DpeGaF1fJQQh4RTtH
   w==;
X-CSE-ConnectionGUID: yXy+MdokQf2cDQDxgBA0Ng==
X-CSE-MsgGUID: s3kO9JKpQDeUjCM+Kq4F6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81882944"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81882944"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:46:44 -0800
X-CSE-ConnectionGUID: /sVBFuMPSQ2TpYb2V+l+yA==
X-CSE-MsgGUID: n6kiApkZSpmQuM/OilQlwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207281072"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Jan 2026 18:46:43 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkvZo-000000001zN-0Ncc;
	Wed, 28 Jan 2026 02:46:40 +0000
Date: Wed, 28 Jan 2026 03:45:42 +0100
From: kernel test robot <lkp@intel.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>,
 Zhou Wang <wangzhou1@hisilicon.com>
Subject: [linux-next:master 7854/9906] hwcap.c:1181:16: error: use of
 undeclared identifier 'HWCAP3_LS64'
Message-ID: <202601280311.eNqAnc4P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f938c7d3b25d87b356af4106c2682caf8c835a2
commit: 57a96356bb6942e16283138d0a42baad29169ed8 [7854/9906] kselftest/arm64: Add HWCAP test for FEAT_LS64
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260128/202601280311.eNqAnc4P-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280311.eNqAnc4P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280311.eNqAnc4P-lkp@intel.com/

Note: the linux-next/master HEAD 4f938c7d3b25d87b356af4106c2682caf8c835a2 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> hwcap.c:1181:16: error: use of undeclared identifier 'HWCAP3_LS64'
    1181 |                 .hwcap_bit = HWCAP3_LS64,
         |                              ^~~~~~~~~~~
>> hwcap.c:1316:16: error: invalid application of 'sizeof' to an incomplete type 'const struct hwcap_data[]'
    1316 |         ksft_set_plan(ARRAY_SIZE(hwcaps) * TESTS_PER_HWCAP);
         |                       ^~~~~~~~~~~~~~~~~~
   tools/testing/selftests/kselftest.h:64:32: note: expanded from macro 'ARRAY_SIZE'
      64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |                                ^~~~~
   hwcap.c:1318:18: error: invalid application of 'sizeof' to an incomplete type 'const struct hwcap_data[]'
    1318 |         for (i = 0; i < ARRAY_SIZE(hwcaps); i++) {
         |                         ^~~~~~~~~~~~~~~~~~
   tools/testing/selftests/kselftest.h:64:32: note: expanded from macro 'ARRAY_SIZE'
      64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |                                ^~~~~
   3 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
