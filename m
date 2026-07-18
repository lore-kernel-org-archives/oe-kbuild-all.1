Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125231DDC37
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 01:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784337725; cv=none; b=Oe4sQRLAyqMJwju+VGL0gcNBlnx1TetcvaVRlXileUPIgp3bdCWZQt3aZx5FhlcIaVBFLglsweeZcBBi6UFrnQKESGMVqCsAwuL6Ze2Pal2ecvJWdP5xsciv5IJWjfXD40qZRKBC4Wm3H4Nvy4x8Ynr552spPyA3BNaPjn9+ilg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784337725; c=relaxed/simple;
	bh=P6xM6VoOry55NpNGBdOd51JrXKT7esST1KVD9YNtHs4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=on0kHLJOpXUSwnBBKPwEgoK251KdtRNKCLW1kji821NQW5hpxerW7lxK7kvsp79bA40ggoN2ZUKq95PHgStCzIR98eAR73mx84ofSzus7WC/iSIgZZ3MBsONvpPDMA0jyclnihMtN/oiVvMmegSrdTQL6rA5KRMT37bg2ZVCNZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Umocfqvs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Umocfqvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784337723; x=1815873723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6xM6VoOry55NpNGBdOd51JrXKT7esST1KVD9YNtHs4=;
  b=Umocfqvs63TlJQm8DtXJaBXQIhLV+bCYxp2wGvMwR7MLaNkFdaokJZxb
   UJasaZFCs0bPh0K+k8V0R3kY87DC+aGes7mAUDNJQ/acKluhJnI2VCdQf
   4KYeae7FHYWBIIMb7Nev2ZyS7hO7zqH/YvxOuib48m7G4v/BqC8mYn1CS
   hhcb/NPKBVQuIQ0ZCmXlVE6wd0eVqJbdQ8kpgS9R42Pjyy2VClYLcVHR6
   2k+sHUirxtEHtxOH9DaS81jLSsFdgbglFDUFlEaJdelNmK2l39h9Gn2zx
   d36T8r/XSLEJ6J10bYOpFIAM4rbQrmvXAaawLBCKF4Cpy0sAuFhQCHjRg
   Q==;
X-CSE-ConnectionGUID: x0AcgNobRYytI616tHTyGw==
X-CSE-MsgGUID: Zq8C6hxmRjqLMx89en9DHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88686659"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="88686659"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 18:22:02 -0700
X-CSE-ConnectionGUID: smoke+uMRPegoV4lXCQ7QA==
X-CSE-MsgGUID: VZXVOxAcRkuQC01VrjHn1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="252521120"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jul 2026 18:22:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wktkd-00000000TLZ-0O9q;
	Sat, 18 Jul 2026 01:21:59 +0000
Date: Sat, 18 Jul 2026 09:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 37/128] ERROR: modpost:
 "sdio_disable_func" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko]
 undefined!
Message-ID: <202607180915.s62BSDHu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   57f7841ef2e9dd59a4296b48f207ad116f0fee2c
commit: cddef517753ece0697a39bc43f14f16a9597cc9e [37/128] rtl81xxx: Hack in SDIO.
config: riscv-randconfig-001-20260718 (https://download.01.org/0day-ci/archive/20260718/202607180915.s62BSDHu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180915.s62BSDHu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180915.s62BSDHu-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "sdio_release_host" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
>> ERROR: modpost: "sdio_disable_func" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "sdio_set_block_size" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "sdio_claim_host" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
>> ERROR: modpost: "sdio_memcpy_fromio" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
>> ERROR: modpost: "sdio_memcpy_toio" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
>> ERROR: modpost: "sdio_align_size" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "sdio_unregister_driver" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "__sdio_register_driver" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "sdio_claim_irq" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
WARNING: modpost: suppressed 3 unresolved symbol warnings because there were too many)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
