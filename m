Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181DD1FAA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 00:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732838580; cv=none; b=C4wuRg33xXWH9gA7Liz/WB3EuH2eNWWIfd3UEQVlDKoJYDA9lKI8iQbHbfg2wbt5sVZZ0jgQ65xEImOYQckOGY3b1gSQIaWIqwBVSp/XZkJKvk0d9ZkDt1qM4T+Mvc3CPBRT24u6qEY1ldvW89pSnZ+o4yTkXY3lDl29Ax6H6KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732838580; c=relaxed/simple;
	bh=23F+DwP/D2xWCTajXT5g+ewRiIeMVqp9e/du/Yp4bCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MzUuBvB0GEpVw+kxmztU7XT+s6dxlLqRhHf7QQKfjD9P172YPZiYtixQfoNLFYqNXc1hPdOZb/CgiAUNFZoUjFBJryYewJl4oSwKrb0Ny2kT+ULTayk7IN77b7qjNCObcOTTAgX3qf2hkMZ0NjGc9NasLyhv2/VDdVOySkfO2NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jq5/CwSS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jq5/CwSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732838578; x=1764374578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=23F+DwP/D2xWCTajXT5g+ewRiIeMVqp9e/du/Yp4bCM=;
  b=Jq5/CwSSorB2boY2bTnEr+7uutPqc0fy5q6F7nMZP635DTwwhmNolf+D
   yTdTVtLNd94YGOoUOCOUg7wRC2cT2JhOb62R8XBqdJm8718PtX2JN4QDP
   SKIbtCLNO2MvMy0foCRA+OyL+JjoklEHGeqaDB8/fCUVOYhMFR6Y7qIcm
   fC/6EimbmlHFCUwn601oG8++vyBQZQBwJUp6zPm7hTdhNsXQB2avi9Q04
   WkVCWADXYKB/FdfND0t9xExyG4qLpV6/5X7M3e2qy4WrVIMxaouutvHSs
   Xq5xybWw+bGYCM0REmzleOzctK/V0P9zRhIZldO4B2cDCWkW8n5fDBXuq
   g==;
X-CSE-ConnectionGUID: rmF7VPLKR+SHbQis7TQM+g==
X-CSE-MsgGUID: bYqva4WKQ0KPC2224LEF8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43740279"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="43740279"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 16:02:57 -0800
X-CSE-ConnectionGUID: mcuLMENKTleKOZ1hiFup9g==
X-CSE-MsgGUID: Zh++rra8RIOn1QCrAqwE/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="115622394"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Nov 2024 16:02:56 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGoTG-000AAT-07;
	Fri, 29 Nov 2024 00:02:54 +0000
Date: Fri, 29 Nov 2024 08:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2451/2451] ld: fs/proc/base.o:undefined
 reference to `proc_mm_idle_operations'
Message-ID: <202411290811.5vAiiEa7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liubo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1a47bbfaad6fcbfb4fe3935cb7408d843caf3760
commit: 4232d9005401d839ceeb1a02da34749b6dab1376 [2451/2451] etmem: add CONFIG_ETMEM macro definition for etmem feature
config: x86_64-randconfig-074-20241119 (https://download.01.org/0day-ci/archive/20241129/202411290811.5vAiiEa7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290811.5vAiiEa7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290811.5vAiiEa7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
>> ld: fs/proc/base.o:(.rodata+0x18a8): undefined reference to `proc_mm_idle_operations'
>> ld: fs/proc/base.o:(.rodata+0x18d0): undefined reference to `proc_mm_swap_operations'
   ld: fs/proc/base.o:(.rodata+0x23e0): undefined reference to `proc_mm_idle_operations'
   ld: fs/proc/base.o:(.rodata+0x2408): undefined reference to `proc_mm_swap_operations'
   ld: crypto/asymmetric_keys/pgp_preload.o: in function `preload_pgp_keys':
   crypto/asymmetric_keys/pgp_preload.c:110: undefined reference to `pgp_parse_packets'
   ld: crypto/asymmetric_keys/pgp_public_key.o: in function `pgp_key_parse':
   crypto/asymmetric_keys/pgp_public_key.c:315: undefined reference to `pgp_parse_packets'
   ld: crypto/asymmetric_keys/pgp_public_key.c:357: undefined reference to `public_key_subtype'
   ld: crypto/asymmetric_keys/pgp_public_key.c:357: undefined reference to `public_key_subtype'
   ld: crypto/asymmetric_keys/pgp_public_key.c:358: undefined reference to `public_key_subtype'
   ld: crypto/asymmetric_keys/pgp_public_key.c:367: undefined reference to `public_key_free'
   ld: crypto/asymmetric_keys/pgp_public_key.c:357: undefined reference to `public_key_subtype'
   ld: crypto/asymmetric_keys/pgp_public_key.o: in function `pgp_process_public_key':
   crypto/asymmetric_keys/pgp_public_key.c:228: undefined reference to `pgp_parse_public_key'
   ld: crypto/asymmetric_keys/pgp_public_key.c:234: undefined reference to `pgp_to_public_key_algo'
   ld: crypto/asymmetric_keys/pgp_public_key.c:234: undefined reference to `pgp_to_public_key_algo'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [m]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=m]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
