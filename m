Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF5628CF7C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 16:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755102909; cv=none; b=fvS+y/LL36cY1KshgrzHd2fEv7BcGbxUD+N1DJzAmHI2ix0+sCfXwsy3e2//xVUywsqzMQlPIqmJ5mHMgNXWtIXyU8Db583PujBbN6gHADIxeZSnRnP5UeY2vZ9RaajgdCA5UejMQOkW9tRou98fUC3A7+mVKzxp/J3KbwZ59uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755102909; c=relaxed/simple;
	bh=wQEZBHen1kJ0ZYjGrbUdVzgtBKtXOo4QpQJSBuXkTxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sYSMu2vr2svsSznZJ3xpnLsifgU9eb/lbz2t4F36IeOSqJ9qp2ofYnNENTc4S2IZq6OF+tPQweUu0zGqsgEMa6w3Hbm4svoSmFOVxt3Pf7fWtWKKU9bPf3btKjvGk5ZohYc9lbdfRrtfJgSdiQUsyE1KzBQlCf3amL91dPIzzgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijGXN6S8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijGXN6S8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755102908; x=1786638908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wQEZBHen1kJ0ZYjGrbUdVzgtBKtXOo4QpQJSBuXkTxo=;
  b=ijGXN6S8a8ADnKLi2M2HWWyg0AEa0hpi9m7UsGxJNVLdCBmZOiooE5nR
   7tSDgGsutkqQUo7hGWWgt7kS1SkXNQNsqeWIRUTN7UVsvuDoR37H/lZS8
   qg/deAwDglAxVvxSsCjoVF/ENwjY9WE4yD+cNhNYAgT01WpPt1Pgf0TbJ
   wrPowmdrcYXYugjpwo5XzZmB/msS/8FZo8ZLCwTpa14eNo6oQi+zGp/R/
   SgeaJ/rWw0zcufAXfcgQw46I7tPbhYDkvHyNPw7YegakVd8Rwl5F1SQfy
   1SURmY6VNdxobsRbr65HwfcVoUqWnCwwcku9Wu+K4b5kMK8ba4MAaGYmG
   g==;
X-CSE-ConnectionGUID: d893ttpnTJKzWJl6k8bbkg==
X-CSE-MsgGUID: A+5kHu15Sg+LwYg1sKVD2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61023786"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="61023786"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 09:35:08 -0700
X-CSE-ConnectionGUID: OfJlckiFT0SbLO/u2mgMYQ==
X-CSE-MsgGUID: 1urnCPQ+SS65kCO8DfH+ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="165702125"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 13 Aug 2025 09:35:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umERL-000A72-34;
	Wed, 13 Aug 2025 16:35:03 +0000
Date: Thu, 14 Aug 2025 00:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 2052/2153] alpha-linux-ld:
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.o:undefined reference to
 `stmmac_simple_pm_ops'
Message-ID: <202508140029.V6tDuUxc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   43c3c17f0c805882d1b48818b1085747a68c80ec
commit: c91918a1e9767fc40488f69436f61af90221615b [2052/2153] net: stmmac: pci: convert to suspend()/resume() methods
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250814/202508140029.V6tDuUxc-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140029.V6tDuUxc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140029.V6tDuUxc-lkp@intel.com/

All errors (new ones prefixed by >>):

   `xe_configfs_exit' referenced in section `.data.rel.ro' of drivers/gpu/drm/xe/xe_module.o: defined in discarded section `.exit.text' of drivers/gpu/drm/xe/xe_configfs.o
>> alpha-linux-ld: drivers/net/ethernet/stmicro/stmmac/stmmac_pci.o:(.data.rel+0xe0): undefined reference to `stmmac_simple_pm_ops'
   alpha-linux-ld: drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.o:(.data.rel+0xe0): undefined reference to `stmmac_simple_pm_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
