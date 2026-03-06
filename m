Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DE93254A2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805654; cv=none; b=EPhn9WicGbxaNUJEB4TpFFesci/yfjDN1J63iQf6hQ2A48ehvCQq5nbAEMo8azn3IWGx20UiL3Q3aYgA1SFtYsE9YCohYCC7LZJxv51oxhqp/9MvQ+9euc6GR+bj4IAXOLS1LtOZOl1hPQdf0fV3k26uj74749avNjgnfU6IXPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805654; c=relaxed/simple;
	bh=nLMWWJBZz35dZ/k3ena4/4BvYuApfzxo4Y97InBATj0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YL20FiUP7pzWHJey+zH6ZIhEYvhPvhnTr4MaAbggaiJesL9x+JlYXd4oVLDI13GBfjTQQz7sw9XVXp7OCKExHV7R5JPIO5qa/L/9AY+xsXXeol9A2Y2zI271/c8zM2hOPrrQ0cY/D1VZc2st7ujgzJFw2jSjrXhQ0do0JQtBuhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oq4qFpKn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oq4qFpKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772805646; x=1804341646;
  h=date:from:to:cc:subject:message-id;
  bh=nLMWWJBZz35dZ/k3ena4/4BvYuApfzxo4Y97InBATj0=;
  b=Oq4qFpKnY8flUt4GWiYnMFXddQyMWld/jg5hZYRR7p0CCxDU3l8mXCie
   pPE2rpW0e0PLN6J7LNeySlngb6FAJx1fTkPPbJviR/Gw5+pBWpXImud7X
   cz7HfaQ7TfKCr9DlZCQz9wJ+uPcWdAzuAvmTnAe3RRBUIBrik0rk6svaZ
   fzedsyWh7j/nw+Ui2K3JZ8mAcpxyIwXo9HCpN/sEc51zHVrjLY7ZNosd1
   +74qxT4twq5QUkHiNLXCmy1cz7Tg+6myDLUclSiQOo63jzQ61gWb/K0v8
   ogYRNThvKUnDYoTl9YcoI1w4xaRUf3rcABeLPvlGQRFnco/SyWvqHz3wl
   g==;
X-CSE-ConnectionGUID: 9+y6m/X2TgWI7w7OWvDamA==
X-CSE-MsgGUID: WxUUPO4mRMy7Ie9oth/vJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73814485"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73814485"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 06:00:45 -0800
X-CSE-ConnectionGUID: D8Sn86eyTm62IXDmApmkQQ==
X-CSE-MsgGUID: lxfQv9qdTCKE69L9ykDUmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="216775190"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2026 06:00:44 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyVjN-000000000uf-2uOS;
	Fri, 06 Mar 2026 14:00:41 +0000
Date: Fri, 06 Mar 2026 22:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masneyb:b4/clk-scaling 2/7] Warning: drivers/clk/clk.c:161
 struct member 'hashtable_node' not described in 'clk_core'
Message-ID: <202603062133.BfGBvW6O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/masneyb/linux b4/clk-scaling
head:   35ae2ca226ff0b0f5ca4e9f3ce658d1ba7874e91
commit: c367707ab54a84bf0786c897c58c7cbe854ca95a [2/7] clk: add kernel docs for struct clk_core
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260306/202603062133.BfGBvW6O-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062133.BfGBvW6O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603062133.BfGBvW6O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/clk/clk.c:161 struct member 'hashtable_node' not described in 'clk_core'
>> Warning: drivers/clk/clk.c:161 struct member 'hashtable_node' not described in 'clk_core'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
