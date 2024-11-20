Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F4C155CA5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732102423; cv=none; b=ZhIMjMigD6UvEysvsEOLSMSSaA6sIlJ3zTBgfk/egnBewG7Yn90cGuqr3umNFm49giYA3SDAvfPOk/nSmbF7sMkJggrIBkdwbbhY/vCkzIIgnStNprp9ZEh/XwIuBeQNzDBmrS82nMnblOSdO70x4U3zNtkjnzK920zScJauMl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732102423; c=relaxed/simple;
	bh=KPh/q3ftdPx9eD2zyzHw9fqO83QPv/3815aO/XPllzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DkpdeUoYwvAPgmOixnO43drTGStTrJXqRsAET6FtryEvoUBqpugMgvroKnRMNfveKuUXY4ll0btPTzrYGQyJv1OYlHVgOnIHAEvck5xR6YMggIFOcK6n/MrfOmIBiMsiOf0CkUHu3XvAnlQvgEpX0htIPCbywNkZ1mtH0XuLahk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/mWx6Eo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/mWx6Eo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732102421; x=1763638421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KPh/q3ftdPx9eD2zyzHw9fqO83QPv/3815aO/XPllzI=;
  b=Y/mWx6EoHz66i5tceNeE4XPHTBA5fk677FQwbaA4LojIIUyli19p1jZb
   1HFJghHhgqSGjwx6iyFiJYtnTppcLy/RnCb+tvKCp95J2GBI4ldU3smjr
   SAXUq9Lj216W0A9VsRHPmBQUk+nESf2WHaAxkinTencXbIwrwPnk5RKr0
   om4+vr1XgYR5OgbGCVlHdQf2Iv6G1Tz/eqcg6+F+gfoI1sKW0qT1aq6tM
   XDO5yJf/TgwK8dewsj1A7MJWEE4/PyhBCTSvxWrVrAzHy7acGQTXxc1b7
   i+kjPc1f8jXDJwz//l68L15tDoJ8gHsgNxJFYu9+bXiMYeaiGKLTr0N5K
   w==;
X-CSE-ConnectionGUID: x2dvlGq8TjePhQ9pDc9yAg==
X-CSE-MsgGUID: xZFufAVpT5KdIJm+coaO9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43221630"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="43221630"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 03:33:41 -0800
X-CSE-ConnectionGUID: kcRGNr0OTKCi+v/tVOXKPw==
X-CSE-MsgGUID: g+7lUSkZRWGH6UDt5tp11A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="90697807"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Nov 2024 03:33:40 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDixk-0000ob-34;
	Wed, 20 Nov 2024 11:33:36 +0000
Date: Wed, 20 Nov 2024 19:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2451/2451] ld: fs/proc/base.o:undefined
 reference to `proc_mm_idle_operations'
Message-ID: <202411201912.lsG6nV6W-lkp@intel.com>
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
head:   bf0212daf6239e1b0e65e6dd7ee9fdec378c5dd4
commit: 4232d9005401d839ceeb1a02da34749b6dab1376 [2451/2451] etmem: add CONFIG_ETMEM macro definition for etmem feature
config: x86_64-randconfig-074-20241119 (https://download.01.org/0day-ci/archive/20241120/202411201912.lsG6nV6W-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201912.lsG6nV6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201912.lsG6nV6W-lkp@intel.com/

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
