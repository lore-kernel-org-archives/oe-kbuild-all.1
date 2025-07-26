Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FF419307F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 16:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753546620; cv=none; b=OaLsTiMTN4s+DhailX+4KgUbHR4fap3KNAm1DVhZp3lRn9rQavakBGNh/0tAsAGWaEenH05E5iagyO4Nb7v6GNoHjFi8st1qcyVlptqAFrvbNbYiBI9BqghjdPF+39THEjMwmlkXBWLGBq6lx0J+if88+/D3R4qrQEdSGEi+3Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753546620; c=relaxed/simple;
	bh=gwD7DHpQBgMDuc3bfD/prvhp2pGt6jNpqO6iPkcVgIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IAJu6WH1xkgL8gSV76f+N1eRe+mkspqPMoYEZ2hioTv9PxFC/SIYPcG7cb2t/m4z7UZNZOVpBeoyXxviMjOmdUUnx8rzoz8XlO6WHrPM2h1Rm03bVsIWKTm3gKeZPV6lEv/5rqL8cHGDk9BH0l6udaE5mQ4tKYpZo8EknXFNo/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mulnXrX0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mulnXrX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753546619; x=1785082619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gwD7DHpQBgMDuc3bfD/prvhp2pGt6jNpqO6iPkcVgIw=;
  b=mulnXrX0G0dXCBVgGr5qbj+7l3Jf8QpQK6nS+XHu2yBKgTHUmw3R1yIC
   OP8W+gr1mwsVErPjJZ7Ka6P2l+SQGIlmGth3qTLjIxEC02k4+UQwMK80S
   EO9teC6okQCS835L/QleYjE9MJ8mGEpVzoG8w7EL93iZqpuJNh3qP21bm
   i37uuhEBRkcW0OUUspJBy3TJjJEg7ZAjtvHd/y7GOFMCqto8i5AEeqVwv
   zUJtPUl1WoW8PgGZnUnWGePdW5rjmfvsf7pvu/sfNYfsEQBqG7ysJpq9e
   ey90vpwEvRYrbY0Z5Xg5Ijvczy2419lEdJJQOYXQ1cpwFniwtzLymMJu9
   g==;
X-CSE-ConnectionGUID: 3/c9UoQGQQ63u+pZRrpnog==
X-CSE-MsgGUID: hRt2iPx9SwuP/Fr2pfFnbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55555484"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55555484"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 09:16:59 -0700
X-CSE-ConnectionGUID: Zinm4pPUTnavlxtV6zJF3w==
X-CSE-MsgGUID: a/h/odBuQE6GXk6TnzyF6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166979048"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jul 2025 09:16:57 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufhZv-000M5i-1j;
	Sat, 26 Jul 2025 16:16:55 +0000
Date: Sun, 27 Jul 2025 00:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 7353/12319] ld.lld: error: undefined symbol:
 phylink_ethtool_nway_reset
Message-ID: <202507270058.x20NW84b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7af19298454ed155f5cf67201a70f5cf836c842
commit: a0008a3658a34a54e77f2568bdaa2626233b1459 [7353/12319] net: wangxun: add ngbevf build
config: x86_64-randconfig-104-20250725 (https://download.01.org/0day-ci/archive/20250727/202507270058.x20NW84b-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270058.x20NW84b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270058.x20NW84b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: phylink_ethtool_nway_reset
   >>> referenced by wx_ethtool.c:225 (drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:225)
   >>>               drivers/net/ethernet/wangxun/libwx/wx_ethtool.o:(wx_nway_reset) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: phylink_ethtool_ksettings_get
   >>> referenced by wx_ethtool.c:234 (drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:234)
   >>>               drivers/net/ethernet/wangxun/libwx/wx_ethtool.o:(wx_get_link_ksettings) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: phylink_ethtool_ksettings_set
   >>> referenced by wx_ethtool.c:246 (drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:246)
   >>>               drivers/net/ethernet/wangxun/libwx/wx_ethtool.o:(wx_set_link_ksettings) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: phylink_ethtool_get_pauseparam
   >>> referenced by wx_ethtool.c:258 (drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:258)
   >>>               drivers/net/ethernet/wangxun/libwx/wx_ethtool.o:(wx_get_pauseparam) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: phylink_ethtool_set_pauseparam
   >>> referenced by wx_ethtool.c:270 (drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:270)
   >>>               drivers/net/ethernet/wangxun/libwx/wx_ethtool.o:(wx_set_pauseparam) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
