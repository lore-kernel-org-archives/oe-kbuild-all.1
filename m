Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE38043F091
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 19:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786391272; cv=none; b=T/7PuIeugKMjBUxmplghJ/97+NOrw7DwcI2teEe6zyqFAgZp/YD+lsxaz1Kw2r9BKwXhbQH+fq4KszOhIEXXzT6dtvtqcKppvBBnIcXoUj7zFQ54OW4es82MoHCPTkeGODKTpJCwbjpDTaBP/e3EmDMhDYj4aBC+7Z7qTpmSuj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786391272; c=relaxed/simple;
	bh=klLMxdcx7uBCT5hcQNUGxGs1Hj8G3pWkFRQcs8mmvPA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PBBhxQUzwoXgl4bVJ5ofnKtzSDLvsNsHhcC4BwVmKTRpBgNVQUQYwvXJitH/F0sm0XaEC53G07muNA+WmPYKBkunQbbgI3xQF6weG+wsiRW0ty82/hu5QioF24LaJGcIg8NaFmatZbas9md59b1pAJS07efULCmHkAm2ND18fFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLnsWzVb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLnsWzVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786391271; x=1817927271;
  h=date:from:to:cc:subject:message-id;
  bh=klLMxdcx7uBCT5hcQNUGxGs1Hj8G3pWkFRQcs8mmvPA=;
  b=LLnsWzVbJ9QR0Na5PJAn1jO2OMYmREEGq+w893SDXrO288/D7KLyl09C
   b/sieqpQ9NjP1Zan4y7AfyCCv/BbhsOId33fjI04i816tqFM5u7aq3nFi
   baskVeMfqYfaK7mCiDF0z76f3g4xSC117Ez1JiaCZaRCYfNp27+ToMuqn
   8MH8EfNqjxmWmHJmiXVNhTAyUhIMo8InUK6/4anib2vUqv516gHn4QhDc
   fhm03Gaq1l4Frk0zM82udoi3RUPxSk+2LQX2/F8cNgBpqCJS6rG9iJ+Nw
   KBBjAG0IgqJ9zA48kcVCGw3/EYFLr9pjRJRu/vQAZV3HoSjM3ecLDVaAi
   g==;
X-CSE-ConnectionGUID: avslHKLDTwCPYchLX1sPcg==
X-CSE-MsgGUID: nh8EG5a0RGmBv4K40JycDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="89442759"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="89442759"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 12:47:48 -0700
X-CSE-ConnectionGUID: LMvAHeAFSgyOQpGok+gCSg==
X-CSE-MsgGUID: YPygUUy+QKita1ZQ6E+Fog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="263183312"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Aug 2026 12:47:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtVyJ-00000000Ngm-0OUI;
	Mon, 10 Aug 2026 19:47:43 +0000
Date: Tue, 11 Aug 2026 03:47:02 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: loongarch64-linux-gcc: error: unrecognized argument in
 option '-march=la32v1.0'
Message-ID: <202608110230.c32X9KXj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Huacai,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06cf61899d6498b33e4b7c87d99d5bd471ccc375
commit: 3d9aba6618d115750729bba2d1f8af180bd7d3bd LoongArch: Adjust build infrastructure for 32BIT/64BIT
date:   4 months ago
config: loongarch-randconfig-001-20260811 (https://download.01.org/0day-ci/archive/20260811/202608110230.c32X9KXj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260811/202608110230.c32X9KXj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3d9aba6618d1 ("LoongArch: Adjust build infrastructure for 32BIT/64BIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608110230.c32X9KXj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: abi-default la464 la64v1.0 la64v1.1 la664 loongarch64 native; did you mean 'la64v1.0'?
   loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: abi-default la464 la64v1.0 la64v1.1 la664 loongarch64 native; did you mean 'la64v1.0'?
   loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
   make[3]: *** [scripts/Makefile.build:289: scripts/mod/empty.o] Error 1 shuffle=28659922
>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: abi-default la464 la64v1.0 la64v1.1 la664 loongarch64 native; did you mean 'la64v1.0'?
   loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
   make[3]: *** [scripts/Makefile.build:184: scripts/mod/devicetable-offsets.s] Error 1 shuffle=28659922
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1336: prepare0] Error 2 shuffle=28659922
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=28659922
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=28659922
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
