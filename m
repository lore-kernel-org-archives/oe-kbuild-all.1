Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A2726AEC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 05:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761283243; cv=none; b=RF6A6lCPzBOSEl+JutsxdN70dr58qK0V3tZaKmnQ+JQ1OUpIVcOUQCXB2X/6REhGTItGWU8ok6gSW9Pn0ndmlkdWvf1TTyQS/v1cZJpWGYwWi4eEkW/wmBCQHAoEhcO65XOjjDqGpBM/lWHnC3oAuJuJOf0D+i4riHc3TiEQr8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761283243; c=relaxed/simple;
	bh=r2xfz7YBBiG+GRduhIjoENd/sSGiGy6Gj7nohlw9+Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rAEhX/RuadRRfIRWmrmSqajrc26I+7HTy8LpNZM4l8FMq1NF4b1LdACZYLIBduPyONouQdU5ylcE+HdnPCRNAycebFTi2/qYbrdbqdJpzFyDO0A3Rnw5ay6TQa+IcJhYDr90oHHQLldkEVavn2aokhYRM3Qar4WdGYkAwwZDt1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMfnFMtt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMfnFMtt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761283241; x=1792819241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r2xfz7YBBiG+GRduhIjoENd/sSGiGy6Gj7nohlw9+Ws=;
  b=WMfnFMtteDddxwh9IZpqbM3M8aw2ziHnU2cgzsqgcS9NzXd0kBgdWQTW
   NkervzXS9DFxkFtGdUm8EYBLu+Q7wX9Ah5N9tRjFxK3xp0VEoh1hw75oM
   JO/YbvmSiOwIplNh0SAHktuWAD4SG2umggSnUIQdyu5uIzNho6AIkQMat
   OR6sbe7eqkSvvWrdeQvPf8KZzzb7UNxioNnAWiQDTE1iJ10zdrYnVMeuv
   CFwUBCVqthY8rHo1p4o+xg4/CmwIxcJN2PNtp3rH7f+VN8AUwJjMv4hOE
   znsNkROMaAjo74/UERssc3QPkucg7sGo76N0uganMaHNywFDH3MHRcZAQ
   A==;
X-CSE-ConnectionGUID: 6ixoXoPnSuujHlfxFUFZxw==
X-CSE-MsgGUID: fotHJkeBQGiqDLzQDSzzLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51039947"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="51039947"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 22:20:40 -0700
X-CSE-ConnectionGUID: mlGkvMi7QuWG4eXGpksd/Q==
X-CSE-MsgGUID: yXVsVAuSSHSUHvKnS/zVwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="188732107"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Oct 2025 22:20:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCAE9-000ECr-1s;
	Fri, 24 Oct 2025 05:20:37 +0000
Date: Fri, 24 Oct 2025 13:20:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/1]
 drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:727:31: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202510241307.huN0yPVa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   ab09c22ea60b40436056b0e1f692e08de52d6a19
commit: 0f2d1bcdd01c2b009d6ce688739a3de50bf5e19b [0/1] net/mlx5e: Properly access RCU protected qdisc_sleeping variable
config: i386-randconfig-062-20251023 (https://download.01.org/0day-ci/archive/20251024/202510241307.huN0yPVa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510241307.huN0yPVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510241307.huN0yPVa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:727:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:727:31: sparse:    struct Qdisc [noderef] __rcu *
   drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:727:31: sparse:    struct Qdisc *

vim +727 drivers/net/ethernet/mellanox/mlx5/core/en/qos.c

   723	
   724	static void mlx5e_reset_qdisc(struct net_device *dev, u16 qid)
   725	{
   726		struct netdev_queue *dev_queue = netdev_get_tx_queue(dev, qid);
 > 727		struct Qdisc *qdisc = rtnl_dereference(dev_queue->qdisc_sleeping);
   728	
   729		if (!qdisc)
   730			return;
   731	
   732		spin_lock_bh(qdisc_lock(qdisc));
   733		qdisc_reset(qdisc);
   734		spin_unlock_bh(qdisc_lock(qdisc));
   735	}
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
