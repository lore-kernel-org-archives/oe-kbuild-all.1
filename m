Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25091374A16
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 16:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786968; cv=none; b=hSRLsSeUedCjV8KQJFjogeAP0ZHZ4CgZ51ud5Lc9WwROcngCNan0MHGZKjHQhumtlyLWXwMaHnVKed8goS4nFgiAPlqdlgQvrp8J8rNrR7bSeQ/cEcLcxgJByPgq46nygo2J/P+GDHoLHpl1oSczjGVuzKKyfhdIRjdyy3HQQms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786968; c=relaxed/simple;
	bh=eDGKP9QOsGvQvGQHBeuK6MlisQRz4E6/UzC9WquR4m0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qMsasR7nbSWtloW9OYmjKULbMbdzSeajbyJY9nRgF31JNBe/8SlxJH79yEjuSAOTfgyzvaa6Fm/xocJFWN1n/hsWUYPHQrW9DCJzt/wgz+XBa7jx3TkU1h8RTSDbtemgJpYzxqKtZBPZH1PtZcS/cPk9ypD+XxHsw6RNlcTp8GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/I3PPUH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/I3PPUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790786966; x=1822322966;
  h=date:from:to:cc:subject:message-id;
  bh=eDGKP9QOsGvQvGQHBeuK6MlisQRz4E6/UzC9WquR4m0=;
  b=A/I3PPUHmthj4SAvOSK8xGPmormuisjgdi7kTavLBmwxXB8rQXnD9P6i
   D/ho0PlYPjTFGXqBjfww2tMaSk5lonPVBUO9RthEz1hIU9aVk3X7+dVoY
   kMKaEO/VO8WM8RDsMiHWvi6yZxugjWJcGnaEnfAitYRj9WBEgSmZNvZll
   Ee6ypzbH8t6ErncxwDQ26dw7l1ZU9aFdyqgwPvNV2Hx7GgIhoblk2gzYZ
   tNOlehS1MSNYJMThr+I8SvCa5L3NrGon5JPIYD0RydDW/sbvdcQn0bgse
   eWidavP/8pixyDozvhYdOXQJONeslluGBGubW8hOkZbdT2AzVXuGZkP1u
   A==;
X-CSE-ConnectionGUID: D6cimCivQVqc1U88auvitQ==
X-CSE-MsgGUID: zTMnuVRXSBOPfSHUkx1Lyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90298075"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90298075"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 09:48:58 -0700
X-CSE-ConnectionGUID: U4Epwhf9R++2mPoLjIaNcw==
X-CSE-MsgGUID: 8iha6uJjSiu0t7Qw3bsh2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275288931"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2026 09:48:57 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBxUE-00000000Qu6-1mQV;
	Wed, 30 Sep 2026 16:48:54 +0000
Date: Thu, 01 Oct 2026 00:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmckrcu:dev.2026.09.18a 24/34] ERROR: modpost:
 fs/btrfs/btrfs.ko: symbol 'cmpxchg_emu_u8' undefined!
Message-ID: <202610010054.roP05vYH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux dev.2026.09.18a
head:   90599c372e13369d11f6c1a01ff0094b16f72cf8
commit: c98d10b438b5626edb3f4e06f4f62bcb6ed6fe90 [24/34] lib: Add two-byte cmpxchg emulation function
config: xtensa-randconfig-1001-20260930 (https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610010054.roP05vYH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: fs/btrfs/btrfs.ko: symbol 'cmpxchg_emu_u8' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
