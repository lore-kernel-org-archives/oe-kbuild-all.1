Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2B21F5834
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 00:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762217977; cv=none; b=pglReeUi4KBKhdyPPM3Gfz8FcepEzeWAoygyOV0p33ItxMVt5MXkX/cBPBBZ35E7Pmr/j4lhYFaViiI8c9+IK6otGOPjmUX6pJkExtEXGG0a1sWwLfTDyS7PexDlQtw9tFdvnmgVXTodsxcLY5kDb6y4ZifssvD5+B8HyoygDuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762217977; c=relaxed/simple;
	bh=4kBumpLPX76t+5M1bV9a46fiVCJFH23dZmzlUcwuvU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BYPawhBg+Mtjnuiz33PnwftLGN3Dl1pONx92yMhZitb2S4tRN983CA1d5/G6Jt50pDV5NpVwiEAwWi9hTmsTPOb/m1/4qYtKl2hgQD+Sm1MhUPbzy4c+RxVdGWu3hwm4W3rw6hpCrXjurfcdiLA7aPjLHbDhK/7TUUmh0dn+CrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nn6UlBE6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nn6UlBE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762217976; x=1793753976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4kBumpLPX76t+5M1bV9a46fiVCJFH23dZmzlUcwuvU4=;
  b=nn6UlBE6nnrNnnf96x0Tbx2t5VFBNLBiK5/ZTt5UQoRTj0wDzu4XdIWo
   X9rlsA5uvF+9WOkuXKKFcFtM/KI5vCgkBGYleYs6W0Gvwm6lns1jFvT3d
   UpLHi9CZXlFAPg2ZhBine6KBune5xaL8t4zg96AopBoGV0RRVh3K3eHPq
   hnk4PVZ612NoREZbBDHWfetuq60WSfVYAs62R3Ondy7TO65kyANef9SyP
   vaLb7Pov48axPBYPAWuaikiH77tSs3FBlJi3AGV8m+m0nVn2lmjPD6QFJ
   dToa+kwKo7ZVKygaTz3AymVuEAi3UzS3zfCLFIZ4zKLGgiHlE8KR24BLh
   g==;
X-CSE-ConnectionGUID: NUvXeLHhSFqht0yaWHeAGA==
X-CSE-MsgGUID: DlvsQp/9TR20AagcOccPzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81934200"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="81934200"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 16:59:35 -0800
X-CSE-ConnectionGUID: c37iCtTyTFut3d1ZTS0qEQ==
X-CSE-MsgGUID: VD6T7xAjSzSTESCwuqaV9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="224261563"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2025 16:59:33 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG5OU-000Qhf-2q;
	Tue, 04 Nov 2025 00:59:30 +0000
Date: Tue, 4 Nov 2025 08:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [tip:objtool/core 1/1] arm-linux-gnueabi-ld: warning: orphan section
 `.text.start.constprop.0' from `drivers/usb/host/sl811-hcd.o' being placed
 in section `.text.start.constprop.0'
Message-ID: <202511040812.DFGedJiy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/core
head:   6568f14cb5ae68cd6c612604ca0c89301cf3a0d0
commit: 6568f14cb5ae68cd6c612604ca0c89301cf3a0d0 [1/1] vmlinux.lds: Exclude .text.startup and .text.exit from TEXT_MAIN
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251104/202511040812.DFGedJiy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040812.DFGedJiy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040812.DFGedJiy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: warning: orphan section `.text.start.constprop.0' from `drivers/usb/host/sl811-hcd.o' being placed in section `.text.start.constprop.0'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start.constprop.0' from `drivers/media/dvb-frontends/drxk_hard.o' being placed in section `.text.start.constprop.0'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start' from `drivers/media/dvb-frontends/stv0910.o' being placed in section `.text.start'
>> arm-linux-gnueabi-ld: warning: orphan section `.text.start.constprop.0' from `drivers/media/pci/ddbridge/ddbridge-sx8.o' being placed in section `.text.start.constprop.0'
   arm-linux-gnueabi-ld: drivers/spi/spi-amlogic-spifc-a4.o: in function `aml_sfc_set_bus_width':
   spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0x8c): undefined reference to `__ffsdi2'
   arm-linux-gnueabi-ld: spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0xac): undefined reference to `__ffsdi2'
   arm-linux-gnueabi-ld: spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0xcc): undefined reference to `__ffsdi2'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
