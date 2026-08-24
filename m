Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1B73176EE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 03:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787543875; cv=none; b=PoIksr+ZqOgoJlZqoljwTe0urBauZr186cuU6T/xdO9ZOsakqB5blNyB+eUFSWhM8EiIoZaiepQj3xsBFrLtWMq864zgobT4cR41Rv88mdpFt31H3D6U0AeiFrkr8MPJJ/UnOyqfy7HyWMBnjWIrF/11jhP4Fb8GEYhEEGXBX7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787543875; c=relaxed/simple;
	bh=p2Xp9WO8fqI8Fi2ceGbg5/X4FHhtmc8FC0O6Q0kws1w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q/cluRj7H+OdoqrbGVZt3ukxG2com6mNoIzU2F6MB1kInaP/enz7ZBRMgNREhmXsiXcyXp/hrg1GfgOKVIQmtJy8KfY6K/KAvqFtauV0VXiILa1tLqe26FK2OrCIE8VIpPetXnwo3Z0wPd41fL0yPgky+8y60oj4SvoO+kP9c0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsHz6zrC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsHz6zrC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787543874; x=1819079874;
  h=date:from:to:cc:subject:message-id;
  bh=p2Xp9WO8fqI8Fi2ceGbg5/X4FHhtmc8FC0O6Q0kws1w=;
  b=bsHz6zrCKPF8WLQZEUPJJeCICXViqJhtnbo3ZCrUhoT/k2EsIKWPCJEF
   AjUtPrKj6le6G4oIg60AqyzRoAMvsrOJOhxbR3ofIrv20PgyT+8gW2kI2
   W9YxvH2MZk6EOnd0hOUt4F5Peqw049mH7IncHwbD0gafCiKI583FhkuYw
   pGnPM7m2wx4zKmSgIslialQ1EclN+x/BtbsCUhe3X4IDeiRtb7Ws011xi
   WmRTkwujJW7cpzTZyani4mVryWghbddHJ+SaTktL9upOSNlEtaI8PHQ0O
   IzKHdUuKHFDOOX2dOHaI+2opHFVCLEa2OvHbX7cUFoOev/U2GpQWUtNBa
   g==;
X-CSE-ConnectionGUID: tN2z3cLZRNCvfiHbNZcIfg==
X-CSE-MsgGUID: otfTNfVqSS2JFH1xLcBc4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91662758"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="91662758"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 20:57:53 -0700
X-CSE-ConnectionGUID: JcbCNwG0QI2Dc6MppXnOAQ==
X-CSE-MsgGUID: bsQcGL5cRjGbJm2bpdPdPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="270687186"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Aug 2026 20:57:51 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyLoj-000000000GN-0KEW;
	Mon, 24 Aug 2026 03:57:49 +0000
Date: Mon, 24 Aug 2026 05:56:56 +0200
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 55/79] warning: unresolved link to
 `remove`
Message-ID: <202608240505.wRtzAJNP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e793b14f66e33b70363166d84886d82d462f1987
commit: ee01f05902123e7d0efb9d0fbaac36a5dc05d497 [55/79] rust: alloc: kvec: WIP(?): Add swap_remove() for AOP series
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260824/202608240505.wRtzAJNP-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240505.wRtzAJNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240505.wRtzAJNP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `remove`
   --> rust/kernel/alloc/kvec.rs:834:58
   |
   834 |     /// If you need to preserve the element order, use [`remove`] instead.
   |                                                          ^^^^^^ no item named `remove` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
