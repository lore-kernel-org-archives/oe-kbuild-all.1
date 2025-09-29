Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4BCA31
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 01:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759108632; cv=none; b=WrnjFD1PsKVlbD2JX4Pfyi/r7IHw/WgEwnt11N4c+qIACrqtcAMCXVHhotQtu6QpcjD7Rb4+nm4yW0geJrdE7qiPcs0AkR0G3lST7qmmQAX/ZDq7yjZKZV/l7msKIoPMOEGHSJL0qIYeCdWZ7ZDWFQ1lobNYMu3GheEpxRHmL3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759108632; c=relaxed/simple;
	bh=OlDH0DozMD7LCBkjygw8wYthh9lAmlAGPlDbB/F1x/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y/wKLmqB3U9GEpE3YAVH1euvrxt3VVYa1rYv/tmdrXdap1RKUfv/qzkNiWvj+MNE/ASsDLHcjwKY4ann3wsd0UJm3rbGxWKIwK7BspNCCammjCWr4p4YZ69STtGDedqHBLrYOStDAyiPGJ0zxXCP/nl/AG0W7SrFz2RDg10+1zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6Ztdqe9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6Ztdqe9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759108631; x=1790644631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OlDH0DozMD7LCBkjygw8wYthh9lAmlAGPlDbB/F1x/8=;
  b=b6Ztdqe9wJO2GYcPMjDhUGkNOSJ3dpRslNoLc7qdz/hX4NRFM9JKgOp+
   xXtzAuT/LdqeSI+9Nu4tEe8BS9c8nRAo4Me0eNG3Kf0xG8t3NQhUpmfRh
   5P9Lvlcnqx+GA972xbGEOKbaRQg79BkHQWm/ophKlS6u9K5b/00rPcrUb
   B4seTaDTUUZ6c5oOHNEY12rjnkKDK7jR5ACBjuTG5UfyRXSegzmIyekGO
   IqHZdl138ITTwhzMPvCKr4GszrAq3QsJsATln2yIWhnkUlhnttsMkq/mK
   GW3pXsnK4W0pL0UZhG6nelnoCzgbl4YIglzBf0D8kS0ldV/jrCG9Nr8DL
   Q==;
X-CSE-ConnectionGUID: EuHLrrpKQGCQdWVe7FG7HA==
X-CSE-MsgGUID: SxCGzYhWR/CcUtpbC9187A==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61518298"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="61518298"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 18:17:10 -0700
X-CSE-ConnectionGUID: zhvldQXtSlW+TVbCclPKCQ==
X-CSE-MsgGUID: Yd5sOn9yS4OyTgS9Db1X4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="182086842"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Sep 2025 18:17:09 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v32Vm-00087C-1N;
	Mon, 29 Sep 2025 01:17:06 +0000
Date: Mon, 29 Sep 2025 09:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [rmk-arm:zii 90/172] Warning:
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3438 Excess function
 parameter 'ptp_register' description in 'stmmac_hw_setup'
Message-ID: <202509290927.svDd6xuw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm zii
head:   a17735e3c7127b536617528d8149b429bbdfc612
commit: d9c1ee484d8ccd9a31d290591316ddad4a507085 [90/172] net: stmmac: move timestamping/ptp init to stmmac_hw_setup() caller
config: s390-randconfig-001-20250929 (https://download.01.org/0day-ci/archive/20250929/202509290927.svDd6xuw-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509290927.svDd6xuw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509290927.svDd6xuw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3438 Excess function parameter 'ptp_register' description in 'stmmac_hw_setup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
