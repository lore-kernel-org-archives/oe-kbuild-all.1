Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430FC145B27
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 00:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789432625; cv=none; b=pbYMiUxLx2xZqk670E/pENYfZYjuxaVgcQ/5ymWQctVl9dX+T3A+4JwdHuDP+Zk2YwGqtPKAGFHs8fbKvh4HlLOcUOPlYrAd7lWuz6gNvLep2vkpWza461xHqimdUpF5DxG9JQ9cttcWyP0UdJ62jdMN1USl4ZYo3A5b1be87yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789432625; c=relaxed/simple;
	bh=5XAlxSOF7+2p5L3R+rap4BjALANSpg7azEApOMJsfRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uWV/6DOiGP5iaaCPQwezWKqddFBW3pa9pL8cK8WcRy5vxOc2DniEVr8GA/u3tsOOw3HdoJWfzFNMdN6KwA/AU43/HWZvtxIfQ0dWCg2UnLUrP74StOsUYYOIvHXpk8w6CNyMS+QydRE8hqBIOF69QpeqQ2V1Wk7X4Wa0x9BeD68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SedCIQfq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SedCIQfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789432623; x=1820968623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5XAlxSOF7+2p5L3R+rap4BjALANSpg7azEApOMJsfRQ=;
  b=SedCIQfqNQ5ij2J/Lx7F2DsvDypCrXIDdT9bsOpKfAPkPYqkauCobuk5
   J8DB86MCPxowIe1UY2Mu1LrG46WWKKz7c351gO7yB0i1aJ4waHFtAGp1e
   nDeRnmH77LLt/3zcCcQlz91I5G4W5NDSH33SxjCcyyhBMM001DXGvJFh3
   c7JQjDg4mHm3/MW2tGeZ6hJZ+qQpVX/HHAJ9i8a+eidXcJoUq+o5wbIO2
   dv6h2MSOGT+nAR9k4nyGxR6OONIVY7jpUTrl+OAjduzGcNYGkumkvxYw8
   TMnsN8HHVw1vb8xqvjuOILUWAO+VXptqC/EBxY7JxzCL2mEyXeiIPzTdF
   A==;
X-CSE-ConnectionGUID: PIsAWm9mTrOqMt03mAodaA==
X-CSE-MsgGUID: lQNEmf/DSyibsZ7uvLqjBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93655039"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93655039"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 17:37:03 -0700
X-CSE-ConnectionGUID: 73uDHVxqSQO3GdtslkvfrQ==
X-CSE-MsgGUID: xm/5YP5QTdOzt82w4bs13g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311059819"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Sep 2026 17:37:01 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6HAR-000000003gV-1465;
	Tue, 15 Sep 2026 00:36:59 +0000
Date: Tue, 15 Sep 2026 08:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:ksyms-tune 6/6] kallsyms failure: symbol length 512
 exceeds max 128
Message-ID: <202609150840.XwFRHJXK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git ksyms-tune
head:   bc5ee628d6230f6c491f1b868aa7a201bf2ee513
commit: bc5ee628d6230f6c491f1b868aa7a201bf2ee513 [6/6] kallsyms: Use 16-bit bucket-relative slot indexing to compute symbol offsets
config: x86_64-buildonly-randconfig-005-20260914 (https://download.01.org/0day-ci/archive/20260915/202609150840.XwFRHJXK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150840.XwFRHJXK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150840.XwFRHJXK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kallsyms failure: symbol length 512 exceeds max 128

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
