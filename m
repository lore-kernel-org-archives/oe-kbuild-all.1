Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62A12620DE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 06:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787984327; cv=none; b=ZphRHtxlTqUBLjzTALw4tS/jatnmsFZzGemN2EKK2rOXydF5ps1bC8S+uG2FSltJFLwOzPhyjhiLi5KGDGIfxHx6E99a4F2107xXN9oTmdIUUEIMo0G+wcxmfodL1QOf9W1H6DDRYcn0r5TlKYiaZ0Xyn1Pcn3nig0Z6D4k9Apo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787984327; c=relaxed/simple;
	bh=MocRcrfIJb+3sbHJIV0NburxoAR56M3DXfckPZPXFdo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i8S3MyePBQuvvCG8QM+y/BvC+2ERa3ZiX8o9PMzFw9XdKURIjYaszKA1bITdOlgY3KgxCFIPwYZ4JhI4Kc5nF2ihEACwDCOhs1IwMP/K2c30GPH7gJjZfS7OvuKM9kppYGHZ+cAQvBkB10InfPcNuhUDJjCSlZZdTHRsUYlfzhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUeWxK6D; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUeWxK6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787984326; x=1819520326;
  h=date:from:to:cc:subject:message-id;
  bh=MocRcrfIJb+3sbHJIV0NburxoAR56M3DXfckPZPXFdo=;
  b=cUeWxK6DkGRbwASC16feZtdrTBlAh9C2rc3HBQ/BG8oxf70HKoD/gq+i
   7yJZ3mbm3XM1qBCTlYH2NwpPKcVbA9y63fKYsh5qsvU3PCRCCc1xa+HEK
   axzRelLu69mUFclGtRLZBcDZL7C8MJAIO45TuqqQnKJdgTcwbsWwwjw9U
   pGNdy15ZbQlNJhbMfkrhBJccL/9y2Mxsrmq8pDWY8WP6e07v76KJlcY/t
   Liq+7sIj96/RCdG8ZEH0WUqg79I/eTpU52CddME8FMoPCyFmvEaq9Aq5B
   idGWWFgM4wKCRZIog65VO+5met/4m2WnpsnULCS+SZqWISIUSFKGhSSWu
   w==;
X-CSE-ConnectionGUID: +bwWaHUyTgS9VlG6P9xDJg==
X-CSE-MsgGUID: 5kZmkn59TB6cKH0D8dBnzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="98819791"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="98819791"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 23:18:25 -0700
X-CSE-ConnectionGUID: yuIO9CsqQF+u8rPBhjW34g==
X-CSE-MsgGUID: aSdOXXhpR3ynVLmRnRlcCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="265114865"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 28 Aug 2026 23:18:24 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0COT-000000001KD-3UOx;
	Sat, 29 Aug 2026 06:18:21 +0000
Date: Sat, 29 Aug 2026 08:17:31 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202608290837.gxGmXmcy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   afea13f9ff7137797a2858fc973c226ec93866aa
commit: 4bb372791d1e195cad530dce5005509564c27cc7 [6/6] ANDROID: GKI: x86: Enable ACPI thermal lib as x86 hidden
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260829/202608290837.gxGmXmcy-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260829/202608290837.gxGmXmcy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608290837.gxGmXmcy-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_SCU
     Depends on [n]: X86_PLATFORM_DEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y] && !CONFIG_FS_VERITY_BUILTIN_SIGNATURES
   
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=y]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB
     Depends on [n]: ACPI [=y] && THERMAL [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y] && ACPI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
