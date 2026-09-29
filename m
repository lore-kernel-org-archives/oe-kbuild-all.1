Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD83D50E5B8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 18:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706022; cv=none; b=H+L3s6PpRsDz3RfGPRl5lpZzsUc6WkUAVQQ64/YEWnfj+QsBvEF4n3oG6aPPBz5NCc5X36HbMXN7im6VUhm223q2sZUVrijbdm5UYd1gKatHx6Y6fIQg1sM5TuthH2Xsn7BP+Fgel2OR6/86ebzm2UzsQEYuix7bHmBaQVC47rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706022; c=relaxed/simple;
	bh=bq41MeALsw++2nhLH2Wa7Wis/IjFpwmsHC18RJxpXWo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tphBs+KoJw5ClkCNDan6AZ8cy4NvuiWUPZVsnosyb8Ee+S/a392YlP20R4ElsBHgFtxLFXC/9gMj/ZQ61HWzzl07AdAfCQTd3uA3vBQAcx9HeysFY9RUsdpXEfvXhzIqEqqq7InRt1qOaflUd+h+22fzk7ajxnvEDeiopE1Fvj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lodMhGjh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lodMhGjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790706020; x=1822242020;
  h=date:from:to:cc:subject:message-id;
  bh=bq41MeALsw++2nhLH2Wa7Wis/IjFpwmsHC18RJxpXWo=;
  b=lodMhGjhumUTWnlIVlMHFlYxaD9nCHtQPQqlw4s8bztm4tOlPV2FKNrY
   DPNFreInlcXtDYfs7jRJo1U+Ad6waO/9YVIdm1w93DfiykI59VtUTeKas
   EL3+774snn0oEfoeHH6N1cEgOKmArzKpU4ilBPllYVehSn/dXyYMffSHn
   8E9mqs6nqlHadF0L2T2eUbCDJDUQKrJ0gRi87yQ7FgZWtmXDbwy88LO+X
   E5+nmd/GNchPFyOP/ksmi7x4P+PMx7f24zWDi2AdXPbShnJLc9fiO1kb8
   tBrvIAHnNRgTSencJeWKVNIDTR+YWFCkiYaaYDyfYDhTMa/bdKs/96eBX
   g==;
X-CSE-ConnectionGUID: 6MpsDu12SjS53oblTeCgNQ==
X-CSE-MsgGUID: 4b6C4ux2QHicFFuSl7ul8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91294170"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91294170"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 11:20:14 -0700
X-CSE-ConnectionGUID: 6iS0p9WQSC+W4nrZSu/xxw==
X-CSE-MsgGUID: BiC5rZbiQiCvpBRZwI1ViQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="279256956"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2026 11:20:12 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBcQz-000000001VP-3c1f;
	Tue, 29 Sep 2026 18:20:09 +0000
Date: Tue, 29 Sep 2026 20:19:42 +0200
From: kernel test robot <lkp@intel.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: scripts/Kconfig.toolchain:148: syntax error
Message-ID: <202609292015.PFfudTdi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes-ARM/kbuild-do-not-allocate-modinfo-in-vmlinux/20260923-181750
head:   7037b569f2880edc0732da253bce262da253ac12
commit: 7a5e3a047b46532027b586ea704af1fc8677ef19 kbuild: avoid re-running compiler and linker probes
date:   6 days ago
config: arm-randconfig-2400-20260929 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609292015.PFfudTdi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609292015.PFfudTdi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/Kconfig.toolchain:148: syntax error
   scripts/Kconfig.toolchain:148: unknown statement "def_string"
   scripts/Kconfig.toolchain:151: syntax error
   scripts/Kconfig.toolchain:151: unknown statement "def_string"
   scripts/Kconfig.toolchain:154: syntax error
   scripts/Kconfig.toolchain:154: unknown statement "def_string"
   scripts/Kconfig.toolchain:157: syntax error
   scripts/Kconfig.toolchain:157: unknown statement "def_string"
   scripts/Kconfig.toolchain:160: syntax error
   scripts/Kconfig.toolchain:160: unknown statement "def_string"
   scripts/Kconfig.toolchain:164: syntax error
   scripts/Kconfig.toolchain:164: unknown statement "def_string"
   scripts/Kconfig.toolchain:167: syntax error
   scripts/Kconfig.toolchain:167: unknown statement "def_string"
   scripts/Kconfig.toolchain:177: syntax error
   scripts/Kconfig.toolchain:177: unknown statement "def_string"
   scripts/Kconfig.toolchain:180: syntax error
   scripts/Kconfig.toolchain:180: unknown statement "def_string"
   scripts/Kconfig.toolchain:183: syntax error
   scripts/Kconfig.toolchain:183: unknown statement "def_string"
   scripts/Kconfig.toolchain:186: syntax error
   scripts/Kconfig.toolchain:186: unknown statement "def_string"
   scripts/Kconfig.toolchain:189: syntax error
   scripts/Kconfig.toolchain:189: unknown statement "def_string"
   scripts/Kconfig.toolchain:192: syntax error
   scripts/Kconfig.toolchain:192: unknown statement "def_string"
   scripts/Kconfig.toolchain:195: syntax error
   scripts/Kconfig.toolchain:195: unknown statement "def_string"
   scripts/Kconfig.toolchain:198: syntax error
   scripts/Kconfig.toolchain:198: unknown statement "def_string"
   scripts/Kconfig.toolchain:204: syntax error
   scripts/Kconfig.toolchain:204: unknown statement "def_string"
   scripts/Kconfig.toolchain:207: syntax error
   scripts/Kconfig.toolchain:207: unknown statement "def_string"
   scripts/Kconfig.toolchain:210: syntax error
   scripts/Kconfig.toolchain:210: unknown statement "def_string"
   scripts/Kconfig.toolchain:213: syntax error
   scripts/Kconfig.toolchain:213: unknown statement "def_string"
   scripts/Kconfig.toolchain:216: syntax error
   scripts/Kconfig.toolchain:216: unknown statement "def_string"
   scripts/Kconfig.toolchain:219: syntax error
   scripts/Kconfig.toolchain:219: unknown statement "def_string"
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1 shuffle=1162787580
   make[2]: *** [Makefile:766: oldconfig] Error 2 shuffle=1162787580
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1162787580
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1162787580
   make: Target 'oldconfig' not remade because of errors.
--
>> scripts/Kconfig.toolchain:148: syntax error
   scripts/Kconfig.toolchain:148: unknown statement "def_string"
   scripts/Kconfig.toolchain:151: syntax error
   scripts/Kconfig.toolchain:151: unknown statement "def_string"
   scripts/Kconfig.toolchain:154: syntax error
   scripts/Kconfig.toolchain:154: unknown statement "def_string"
   scripts/Kconfig.toolchain:157: syntax error
   scripts/Kconfig.toolchain:157: unknown statement "def_string"
   scripts/Kconfig.toolchain:160: syntax error
   scripts/Kconfig.toolchain:160: unknown statement "def_string"
   scripts/Kconfig.toolchain:164: syntax error
   scripts/Kconfig.toolchain:164: unknown statement "def_string"
   scripts/Kconfig.toolchain:167: syntax error
   scripts/Kconfig.toolchain:167: unknown statement "def_string"
   scripts/Kconfig.toolchain:177: syntax error
   scripts/Kconfig.toolchain:177: unknown statement "def_string"
   scripts/Kconfig.toolchain:180: syntax error
   scripts/Kconfig.toolchain:180: unknown statement "def_string"
   scripts/Kconfig.toolchain:183: syntax error
   scripts/Kconfig.toolchain:183: unknown statement "def_string"
   scripts/Kconfig.toolchain:186: syntax error
   scripts/Kconfig.toolchain:186: unknown statement "def_string"
   scripts/Kconfig.toolchain:189: syntax error
   scripts/Kconfig.toolchain:189: unknown statement "def_string"
   scripts/Kconfig.toolchain:192: syntax error
   scripts/Kconfig.toolchain:192: unknown statement "def_string"
   scripts/Kconfig.toolchain:195: syntax error
   scripts/Kconfig.toolchain:195: unknown statement "def_string"
   scripts/Kconfig.toolchain:198: syntax error
   scripts/Kconfig.toolchain:198: unknown statement "def_string"
   scripts/Kconfig.toolchain:204: syntax error
   scripts/Kconfig.toolchain:204: unknown statement "def_string"
   scripts/Kconfig.toolchain:207: syntax error
   scripts/Kconfig.toolchain:207: unknown statement "def_string"
   scripts/Kconfig.toolchain:210: syntax error
   scripts/Kconfig.toolchain:210: unknown statement "def_string"
   scripts/Kconfig.toolchain:213: syntax error
   scripts/Kconfig.toolchain:213: unknown statement "def_string"
   scripts/Kconfig.toolchain:216: syntax error
   scripts/Kconfig.toolchain:216: unknown statement "def_string"
   scripts/Kconfig.toolchain:219: syntax error
   scripts/Kconfig.toolchain:219: unknown statement "def_string"
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1 shuffle=1162787580
   make[2]: *** [Makefile:766: olddefconfig] Error 2 shuffle=1162787580
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1162787580
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1162787580
   make: Target 'olddefconfig' not remade because of errors.


vim +148 scripts/Kconfig.toolchain

 > 148		def_string "$(cc-option-str,-fzero-init-padding-bits=all)"
   149	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
