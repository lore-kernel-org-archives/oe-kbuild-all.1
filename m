Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FB817B502
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 07:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735024431; cv=none; b=K0FSpLjsCfJZp6Te0Hq0pMt8hFQqZtrpf041i4AEmH5VfzlQ1PZwflpTxZg9K1kE5KOINReZM0Vwm4A/mTm3CaAY+Ejdw2wlPOzmQquaWLfSY78vo24SN+c5pRfg6CaiI+OLach+Akh03hyqCs33C45QLu8rZWlIo9vrFUvVuPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735024431; c=relaxed/simple;
	bh=N17PlE2/pN71sGfwRNLfnGFADxT9uoPPiANBf9f/ktg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HnKvfXvlAlGsaCKmXLZqtSOJuiv3bxXyudccLcktnNeP8821E0sWvaOjd+ue0yQSfWkxmIqkWEBIIvVLRrQABiAFFNGTC31YTmftftfcKEWxw5WaS98jIzrRugbNGiAFJpUiDob7Er7sF0jrcHyUpYsdLpeOnfrztVPnDxad8W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATlZUy1e; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATlZUy1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735024429; x=1766560429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N17PlE2/pN71sGfwRNLfnGFADxT9uoPPiANBf9f/ktg=;
  b=ATlZUy1exjebyXvKR5Y64KZZPYvLiHwoHRSEkP0Dr/b2Z4DRXkZ8rsCC
   K/nYDhQ9aF2kyvYRNJ3fPfXiHNcrwzdD79y65qrxT1BZtq13nLqXf5Ltf
   W9fWF22ki7tC9608c0djfx77PzkSQRerNtUfFVMXPY8+dlyZpFJ2cCTO7
   fHKii6EUKAU3ADeSmpttUYzuJprHDNOwc/ZmUVWnzFEg6oOMzclY8PZwS
   nQErpQoj5wmgTqa6896QDlnBaIJLD0msV4RAYM1rqs9tHuBdMy3lFlVYA
   MsfOi+ZF2T40U5n5j+Wqiiam8eAcFNe3qtCXcQGy6dBiSNNUGcd5LDQIY
   Q==;
X-CSE-ConnectionGUID: p4xVopPxR8+G3j7zLQqdEA==
X-CSE-MsgGUID: wwGSEQfASvWH0i5mD7k64Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="34797640"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="34797640"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 23:13:48 -0800
X-CSE-ConnectionGUID: 9q8FH/BFQi+geZ74UcgU/Q==
X-CSE-MsgGUID: +DpjaZHBTZmGM+51PDCw0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="99939075"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Dec 2024 23:13:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPz6v-0000w7-0U;
	Tue, 24 Dec 2024 07:13:45 +0000
Date: Tue, 24 Dec 2024 15:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 uml_finishsetup+0x30 (section: .text) -> uml_postsetup (section: .init.text)
Message-ID: <202412241528.NYkO2IqF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f07044dd0df0c9d0ad177c3098b62ccddb735a2d
commit: 53585f9ea40a9466ab9c1151f15984513eb542f7 um: enable UBSAN
date:   6 months ago
config: um-randconfig-r051-20241224 (https://download.01.org/0day-ci/archive/20241224/202412241528.NYkO2IqF-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412241528.NYkO2IqF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412241528.NYkO2IqF-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: uml_finishsetup+0x30 (section: .text) -> uml_postsetup (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/um/drivers/harddog.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/test_udelay.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8data.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/hostfs/hostfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/exportfs/exportfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/autofs/autofs4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/prime_numbers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/find_bit_benchmark.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ida.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_xarray.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_maple_tree.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_free_pages.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20411-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ttyprintk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spmi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-log.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-loopback.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-power-supply.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-vibrator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_u-boot-env.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
