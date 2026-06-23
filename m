Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0611C5F13
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 05:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782190927; cv=none; b=jlKs0kj0gYgzHolt6ubE0Vumxw2s+Pebnv4pnsYqZbIQ5no1U8pMRGKuVOvkFhigp4BU7iVVZMjxcl9XKucqtgEr6q+Vw681VoSrBYrBOtXR1LgpdSnQanSR8jTzAlIGfQ+OSx214NEloqpoiYBDMTjeoPdXk/lsyno7B+LCJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782190927; c=relaxed/simple;
	bh=jm8M8UPmAapEAZeaCbBms0thCIZ1ci25xMZXv4F3rak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f96qf1E0iWbf28mfRr6o8ZSSKjMssv00ZhVY8V8cb88Nq/2ofwu2EvL+9R4TvqxDPuVe8D9a/3MR0VDN5jf7D/A42zC8YSA7TGCb3dz33HbiS3iDz8TD/SM+pOiBSlihmcgin2M8+YVhKOkK5BbXUYytY5RzmXOrl1DmdNwiuvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0nlLc/h; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0nlLc/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782190927; x=1813726927;
  h=date:from:to:cc:subject:message-id;
  bh=jm8M8UPmAapEAZeaCbBms0thCIZ1ci25xMZXv4F3rak=;
  b=K0nlLc/hXtCrX8PFeWz7xH6Asbco2tw1jsnaQSwJ6SY8s6IBw2bddAIU
   5ilciSOybnsDMiZNmreiUZ3NEJ+9zUrsHJ0uUSJBQPueKOHvH6w8tP++4
   LztU50imB7KIBgAtAxdSb0Xq/nEzjRsdnuLAS56tolX07azf8s4Cq1cCT
   MeeQPoPwGP6C5ksK5Kjh6r1wk2tCbgJHax+vqvSt4bcJCTfGbs9gtTTp6
   GSHhIUHeTDkHp50g5eBg5mN/RvtrFdQba+WAREVrYs4I+auaxOWlZppdD
   ab4XlROubHBFIEwNwBvGvN9N1LOSGwITloHrQCJ0PAK+1s0ECb1cBScn/
   Q==;
X-CSE-ConnectionGUID: cSMjKroBQS+mB60zfGPfOQ==
X-CSE-MsgGUID: rPrqgOcUTwKAfJhjIe4fNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100353315"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="100353315"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 22:02:05 -0700
X-CSE-ConnectionGUID: 2SxrwvcsSKiM8rbgszd7iA==
X-CSE-MsgGUID: u+XJfoPCRwuQObma2NbzJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="273471606"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 22:02:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbtGq-000000002GL-1Igh;
	Tue, 23 Jun 2026 05:02:00 +0000
Date: Tue, 23 Jun 2026 13:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-7.1.y 64/64]
 /kbuild/src/scripts/Makefile.clean:12:
 /kbuild/src/drivers/net/wireless/realtek/rtl8192fu/Makefile: No such file or
 directory
Message-ID: <202606231257.fn7TALHu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dongjin,

First bad commit (maybe != root cause):

tree:   https://github.com/tobetter/linux odroid-7.1.y
head:   dbb4f6bd9fe8a1786673783249095632aff93442
commit: dbb4f6bd9fe8a1786673783249095632aff93442 [64/64] ODROID-COMMON: net/wireless: add Realtek Wifi drivers
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606231257.fn7TALHu-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231257.fn7TALHu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231257.fn7TALHu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> .gitmodules: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
--
>> /kbuild/src/scripts/Makefile.clean:12: /kbuild/src/drivers/net/wireless/realtek/rtl8192fu/Makefile: No such file or directory
>> make[8]: *** No rule to make target '/kbuild/src/drivers/net/wireless/realtek/rtl8192fu/Makefile'.
   /kbuild/src/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/drivers/net/wireless/realtek/rtl8192fu/Makefile'.
   make[7]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/wireless/realtek/rtl8192fu] Error 2
>> /kbuild/src/scripts/Makefile.clean:12: /kbuild/src/drivers/net/wireless/realtek/rtl8821au/Makefile: No such file or directory
>> make[8]: *** No rule to make target '/kbuild/src/drivers/net/wireless/realtek/rtl8821au/Makefile'.
   /kbuild/src/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/drivers/net/wireless/realtek/rtl8821au/Makefile'.
>> /kbuild/src/scripts/Makefile.clean:12: /kbuild/src/drivers/net/wireless/realtek/rtl8821cu/Makefile: No such file or directory
>> make[8]: *** No rule to make target '/kbuild/src/drivers/net/wireless/realtek/rtl8821cu/Makefile'.
   /kbuild/src/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/drivers/net/wireless/realtek/rtl8821cu/Makefile'.
   make[7]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/wireless/realtek/rtl8821au] Error 2
   make[7]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/wireless/realtek/rtl8821cu] Error 2
   make[7]: Target '__clean' not remade because of errors.
   make[6]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/wireless/realtek] Error 2
   make[6]: Target '__clean' not remade because of errors.
   make[5]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/wireless] Error 2
   make[5]: Target '__clean' not remade because of errors.
   make[4]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [/kbuild/src/Makefile:2149: _clean_.] Error 2
   make[2]: Target 'mrproper' not remade because of errors.
   make[1]: *** [/kbuild/src/Makefile:248: __sub-make] Error 2
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'mrproper' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMMON_CLK_AXG_AUDIO
   Depends on [n]: COMMON_CLK [=y] && (ARCH_MESON || COMPILE_TEST [=y]) && ARM64
   Selected by [m]:
   - SND_MESON_AXG_FIFO [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && (ARCH_MESON || COMPILE_TEST [=y] && COMMON_CLK [=y])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
