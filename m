Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C91374A03
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081968; cv=none; b=NJVwtoepv+b5XNiaDULctMr6XexTj+KZIYXpkYQ+XSi9yPHEwOtbhoekGHfNAV3jUDRTK1UF3EzRe5/IDxOWpcK+FXKU/opWHb8Y+KPRzTSMV0pUESMetJUd11cNnbHnjLFJredT+xp78fP3eW0RYsAL/IecExladSt+AuKeKXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081968; c=relaxed/simple;
	bh=9JdBye7PI+lj1gFtzqbMoX0ZzLjiX8Ju6MttrEW85hQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PWzltpZxk9f8GaRM8PqZYelLU28rw/uy1lgKgYLuhz6p92+qBMHjHYXYgTOXFIS7HWASS3j0AQrUckjffFflG8dCfI2BJT0JqzJASOzbhMjyWUXnkQZ2qWZVQ4OeE3eTGT4Yis1/8zf3UbEm/WnAdPA2DPzhPgXn0wrlNhsAETM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUlxcVby; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUlxcVby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783081966; x=1814617966;
  h=date:from:to:cc:subject:message-id;
  bh=9JdBye7PI+lj1gFtzqbMoX0ZzLjiX8Ju6MttrEW85hQ=;
  b=FUlxcVbydEgGVYIMSxrjsc3IulPCnwfBKW+g/DBXYB2Yi3dPxLO5biXU
   5WnTTAuSvNjgDdF+uehOODCfZa9kJcN1Y0xnoy8zN+NIYdbizhSE1tAv0
   u72sl0UupDurEsjs7GwPfmHSd0G8JJJu2+qCoCfp0xHNpl2lGhCWiXpHm
   axGenu1RrwTaVKzCkDgPIx1GSp9vkHcKEUfsz9bKGT3MDJGADRJFy8TZH
   c9QKKcNGdtWdU99j3W8q7JSM20Gu2Y7/lIC0XeWQDxJP1CwuIiv9yD1ZT
   FGN75jb+3TRStKqM6FY5DD3fBzp3Zej1HXAybogiGk7DDTYA2jXFHRAYy
   g==;
X-CSE-ConnectionGUID: KjE8B5lSREOlNtkrmJIQVA==
X-CSE-MsgGUID: q6kn5CXmQ8ycGo6NB7DhcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82944206"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="82944206"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:32:45 -0700
X-CSE-ConnectionGUID: gen/2dXzTuSQtFMQ5NYV1g==
X-CSE-MsgGUID: jlYq/KUwRcexU1PfIaIrDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="249136881"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jul 2026 05:32:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfd4T-00000000C7J-3USN;
	Fri, 03 Jul 2026 12:32:41 +0000
Date: Fri, 03 Jul 2026 20:32:01 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 167/167] ld.lld: error:
 undefined symbol: phylink_release_pcs
Message-ID: <202607032026.JsIzIfbs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   866eb49750d39fe938dca71acece6f1540bb1123
commit: 94c584377495cc10276b1eab98802d2ba437099b [167/167] net: pcs: airoha: add PCS driver for Airoha SoC
config: i386-randconfig-r131-20260702 (https://download.01.org/0day-ci/archive/20260703/202607032026.JsIzIfbs-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607032026.JsIzIfbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607032026.JsIzIfbs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: phylink_release_pcs
   >>> referenced by pcs-airoha.c:2889 (drivers/net/pcs/pcs-airoha.c:2889)
   >>>               drivers/net/pcs/pcs-airoha.o:(airoha_pcs_remove) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: phylink_mii_c22_pcs_decode_state
   >>> referenced by pcs-airoha.c:2314 (drivers/net/pcs/pcs-airoha.c:2314)
   >>>               drivers/net/pcs/pcs-airoha.o:(airoha_pcs_get_state) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: phylink_decode_usxgmii_word
   >>> referenced by pcs-airoha.c:2333 (drivers/net/pcs/pcs-airoha.c:2333)
   >>>               drivers/net/pcs/pcs-airoha.o:(airoha_pcs_get_state) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: phylink_mii_c22_pcs_encode_advertisement
   >>> referenced by pcs-airoha.c:2485 (drivers/net/pcs/pcs-airoha.c:2485)
   >>>               drivers/net/pcs/pcs-airoha.o:(airoha_pcs_config) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FWNODE_PCS
   Depends on [m]: NETDEVICES [=y] && (ACPI [=y] || OF [=y]) && PHYLINK [=m]
   Selected by [y]:
   - PCS_AIROHA [=y] && NETDEVICES [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
