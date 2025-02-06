Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DCF224AE6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 06:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738821997; cv=none; b=ETUHI/dTpBbK0rRiv3cqG0h9TxY7ouNR8x30gG1Pan2GTvMyCjPN2Y0E3W/ZwzUXKLjNdUB0mcrAZ7eCpW9d04H7+QE5iNHwqtrVcCt7s5vjtY8xOCoOmO2r+hSIq6s/R1NtVZafu0sQKAyZEIKMmFd3/5740uobRrZ8iccFLVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738821997; c=relaxed/simple;
	bh=YVvUmmMODb6DrxUI/iBeUb1PNJCzyTj0mMOtF+Bn5tE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1eWitMjb9gCdVsI32RotxmDrUO65uObVyrbiPk6g43HYn8w6NCCkMaLE7GtcuWbp6nt6vn/sfa0sMHOpsLHU7dnOdx7L50QBZpm9845m7Q6thLAzNoxVZGaofey1UaggovuiVAo3gKhJnA8za8Jk5157VETMoDZKz/fKna6pnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aserhvdH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aserhvdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738821996; x=1770357996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YVvUmmMODb6DrxUI/iBeUb1PNJCzyTj0mMOtF+Bn5tE=;
  b=aserhvdHzipdRj9K+2FKAxGh5s6HTcUHFGkA+IELi2mJvG5xzQNVr2c1
   Fv2k+updPGBj0NZkbiO9MQpGsODX5G2ME6FY9w4vbWxUZd49PO7Mhejb1
   LanLrCJewGwYuXAuse79FyprKkv17xdAp3cJHy/isUS59hslqosfSckQM
   /ysT58i6RKqF2miQAUzhY0uC44iTXSSwE0Zl05Nk3wLZoGo8qfR84AA3F
   dSx4iSM/ylWDKgjNOdF+01C8bczRipPg3m0zsIFsPC/9AxO0lZOISfme3
   ZhuJ3pKWkVo+NSiVVwJLNbD0JW1tbjJKaUj1D15yxnGaIKnpcu1fCuEIe
   Q==;
X-CSE-ConnectionGUID: A/7jG7lhR4agAhfQJghZ4g==
X-CSE-MsgGUID: z9VbVtMyTO6G8BcYqMqV8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43071796"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="43071796"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 22:06:34 -0800
X-CSE-ConnectionGUID: QMHArJ2PRZGkXJKt0OHASg==
X-CSE-MsgGUID: nw+81AJzSDmcwANiqP0kww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="116103459"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Feb 2025 22:06:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfv1y-000wVn-34;
	Thu, 06 Feb 2025 06:06:30 +0000
Date: Thu, 6 Feb 2025 14:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 16/16] make[3]: *** No rule to make target
 'drivers/firmware/efi/libstub/lib.a', needed by
 'arch/x86/zboot/vmlinuz.efi.elf'.
Message-ID: <202502061303.LAlWXntR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   2188b98e5155277ba2ece786951ce14d05ed1c45
commit: 0fc856178fc34590cbe698bcfa1c40cda8994da3 [16/16] efi zboot for x86
config: x86_64-randconfig-102-20250205 (https://download.01.org/0day-ci/archive/20250206/202502061303.LAlWXntR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061303.LAlWXntR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061303.LAlWXntR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'drivers/firmware/efi/libstub/lib.a', needed by 'arch/x86/zboot/vmlinuz.efi.elf'.
   make[3]: Target 'arch/x86/zboot/vmlinuz.efi' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
