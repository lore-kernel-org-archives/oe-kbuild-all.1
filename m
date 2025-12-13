Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B963B21423C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 04:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765600922; cv=none; b=DqWhMZPCildLBSJWtrb4ainxDQG+e67G7nS+RPomVUTdu8OLsNPdtyVBDI62WQJokOShqttvlVxNITbw65v6ANTViNRO9Xy2KTmQdtRnsha/wqm0TpVDmuHpROJogFnEOxuEed2iRw443H+C/yIIG1JwO/9v0A5g/UqaepE/ZZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765600922; c=relaxed/simple;
	bh=IV5modX8zK2fa9UeVh5LIrl6JxxhouKvhGpnjCpt6zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kpbsUhn/krHViBkwVTQjZ6vXuo0ZRi5D7VJgcSGsaQdDHovdOO4v2k4Vb4hBkoIVaPGWUCKFG157ngxvGK/rGABKEJpQqizFCfFBl9o0bQSyEdavWNASnfNfDScgthdiJKux3U7LrldoeqV/D5lVmzSiM5hHd0zX6XtXIKEqQ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdOCbmqd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdOCbmqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765600920; x=1797136920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IV5modX8zK2fa9UeVh5LIrl6JxxhouKvhGpnjCpt6zs=;
  b=WdOCbmqdigB13cMhbksaoPz8fzeFXNKENR2ngeSogQtgHL+mqfCvc/ef
   ZfuaNu/zJAuOZ3mls0KH1J0/6gd4qdm7qLsjh3RCGOwZS6d5RMajw0Lv0
   XqQ0MgDn3oHTCUzye0ry6OMzFBSTMSG5QKNOkJ1J6LZh6oslz6ffFVY5v
   F0dxzKC8m1wiFHmjLgmwBx9Il7b7cBAmcSCXEc2No65rZDvK4EllE8BQT
   jXljbXXcjjjh/imzL2LdHJXq5d/PtXkZSLuLvNjahgJkE6kfOSZRJ6+Kd
   ZFtwEF6alU1+d8KjiBXsLzofNNHklO59GR2kpAmqA2LdFlkUYozglnLSh
   A==;
X-CSE-ConnectionGUID: MF3SydkyQSKVj4B+hKG6CQ==
X-CSE-MsgGUID: Qi2v/Qv8RlWMbJNVwx2qFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67558204"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67558204"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 20:42:00 -0800
X-CSE-ConnectionGUID: c18DPX+SSOGxYLnXQZJhpg==
X-CSE-MsgGUID: WQUh6nJORJOp7I+OSjfBtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196537395"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Dec 2025 20:41:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUHS9-0000000073Z-08oa;
	Sat, 13 Dec 2025 04:41:57 +0000
Date: Sat, 13 Dec 2025 12:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] drivers/pmdomain/imx/gpc.c:228:4:
 warning: initializer-string for character array is too long, array size is
 20 but initializer has size 21 (including the null terminating character);
 did you mean to use the 'nonstring' attribute?
Message-ID: <202512131250.bFrB71fp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ulf,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: e2ad626f8f409899baf1bf192d0533a851128b19 [2/2] pmdomain: Rename the genpd subsystem to pmdomain
config: arm-randconfig-003-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131250.bFrB71fp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131250.bFrB71fp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131250.bFrB71fp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pmdomain/imx/gpc.c:14:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/pmdomain/imx/gpc.c:228:4: warning: initializer-string for character array is too long, array size is 20 but initializer has size 21 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
     228 |         { "imx-pgc-power-domain"},
         |           ^~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/nonstring +228 drivers/pmdomain/imx/gpc.c

721cabf6c6600d drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  226  
721cabf6c6600d drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  227  static const struct platform_device_id imx_pgc_power_domain_id[] = {
721cabf6c6600d drivers/soc/imx/gpc.c Lucas Stach 2017-02-17 @228  	{ "imx-pgc-power-domain"},
721cabf6c6600d drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  229  	{ },
721cabf6c6600d drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  230  };
721cabf6c6600d drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  231  

:::::: The code at line 228 was first introduced by commit
:::::: 721cabf6c6600dbe689ee2782bc087270e97e652 soc: imx: move PGC handling to a new GPC driver

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
