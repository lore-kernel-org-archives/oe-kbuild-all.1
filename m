Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90E0346760
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 17:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102216; cv=none; b=nwuRGWsZzMzObMPO++x956e393Jxy+9HUjN5Q4PNTIa5yseNCLmDNAfIhU9pCeqLEOWm3uJaTNWe/DhAyb1/kBDZT/FzCxbYpp/lsXaN8JglGAP//c/zNUPtJvLgizlPFWxlU2NZNprSyZWHKHQcYHWI1g2uQ5636nx+bByTuhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102216; c=relaxed/simple;
	bh=9wnjGySfvySBlsuv54BeIMSTGCw4oKcQuxe2XTzSKS8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ptJjRqSD2qiv1LImdpkddQ1x0N0Job3ZR+bGm5hX/G8C7CVvFHKLxf/RN7/Ru5yG/kTUI0LOIUc7jlSz6jihZqCdiPuHfl6LKsmxsdDl4uEHxsutUhSPxfVs91Eo+GHtCFFLxWSiYC42dc4DwXa+JRIUtH72YTlbh/IFU6+vksM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7hZn+wt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7hZn+wt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769102209; x=1800638209;
  h=date:from:to:cc:subject:message-id;
  bh=9wnjGySfvySBlsuv54BeIMSTGCw4oKcQuxe2XTzSKS8=;
  b=R7hZn+wtE3BUuglswFuWtrUEweoSXHtr2/utT8+NhWSK7gGQVvnyAwUQ
   BUndB+Rjw2x9CEiVUhzqUUEvNRqqtISCXMT4hPX4HnHzN5Vtea0i76vE5
   aBKFfM3DJHasj9TfIVhX0wu0+tceK0m9whtosbA21UUeC+2moBsQzoPtD
   V01PohVN7LbSrtIx1Y8c59rOCRAgCYGVZyGnNbrodumrY3GHheoZeth+D
   ofhr/j+/mV+NsKvRYw6Cp2700f1zThliq83XMvyjaBy3eRbyfe1yAsxfL
   j/F7OK8yxd3fGl5ASuLYeg4CsnrdtxCAYKbfubT7B3z3NPDHrXl5eGiBX
   g==;
X-CSE-ConnectionGUID: 8ty3p3/XQpKbfo6l7XkkEg==
X-CSE-MsgGUID: M1dWZFY3RkKGRkpj+7gZZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="69368036"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="69368036"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 09:16:38 -0800
X-CSE-ConnectionGUID: lrIl32OoT56KQ6s7MOOKMQ==
X-CSE-MsgGUID: TPeTFK4XTUy8HlJSV7i9WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="207209413"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jan 2026 09:16:36 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viyIM-000000000WP-06Gr;
	Thu, 22 Jan 2026 17:16:34 +0000
Date: Thu, 22 Jan 2026 18:15:50 +0100
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 OF_DYNAMIC when selected by NET_DSA_SJA1105
Message-ID: <202601221820.b6a5wqXl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vladimir-Oltean/net-mdio-regmap-permit-working-with-non-MMIO-regmaps/20260122-192934
head:   845f2f26d455c4220ec37bcdad7523f3aa087919
commit: d32b5cbfec0000f0d4c6e6c2297108fe41908b93 net: dsa: sja1105: fill device tree with ethernet-pcs sub-devices under "regs" node
date:   6 hours ago
config: parisc-kismet-CONFIG_OF_DYNAMIC-CONFIG_NET_DSA_SJA1105-0-0 (https://download.01.org/0day-ci/archive/20260122/202601221820.b6a5wqXl-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260122/202601221820.b6a5wqXl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221820.b6a5wqXl-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_DYNAMIC when selected by NET_DSA_SJA1105
   WARNING: unmet direct dependencies detected for OF_DYNAMIC
     Depends on [n]: OF [=n]
     Selected by [y]:
     - NET_DSA_SJA1105 [=y] && NETDEVICES [=y] && NET_DSA [=y] && SPI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
