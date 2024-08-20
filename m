Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46CC18FC8F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724157697; cv=none; b=t/ev6SDjo650IRdVAPaJV6uat1rtRpYHk6KKMnfnu9lE7Dt/Z6+IcBjXGXaaXysvfwYyk2XNA11REMufI4jslBnBQeKNffzjl0bz3vUskbaOVhsEeVzC+5mtntJc/uhVSyPHn/Ac3tJK/5eSXMsFz9Xzl6VUNsxalqD+6ry5+NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724157697; c=relaxed/simple;
	bh=iUcEVDLOuqLHe40foJxE1WcJXCghf1pON1Gw9T/CUwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tjsmBkJXKveWUudjZm672Tpj44sH5Yo+eWmLtgukUmbpSMw95xBsn7f2dtjmS8S+gXZ6Cum/I0SPnSz7qkwv6cu3gfOq8EmDLNqwQULofr4epVuDRqx8l6KB9hW1Y1853TZCzdHiOh3j7IpEWK6DvJk3BHPmD0Us9eRq9KFjgcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QySn4T9m; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QySn4T9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724157696; x=1755693696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iUcEVDLOuqLHe40foJxE1WcJXCghf1pON1Gw9T/CUwY=;
  b=QySn4T9mriM4eZWT+NlKpCF4c6S+ClXXFJrde4jT34iXl9d26TZreT6a
   vjV+VyGVXQvW5UfsmwC4lxEncBlfrDC2KAewTjTqbe3+qXQNGpzlm9Ujf
   gkptzwa8haVzkB7OH2UJMeOX348Ebe+cIJruBV0AR0ULZaWwwQx291qNI
   q/INisi0UPjZS9/AmAQaW6MVGGsoX5MJMRSYdHnXpPgz2gXVCV+DLaQwV
   GShSyTxlcBKs9Fl/qP6GRvLL/q/ogEOamq19V+a2o8cILG24e+rS6lsZn
   4MFM337gbxjCAdq3U8qOrVyHZ4TRRiw1DQRnT8ElTDRV7eFWTEe2QczYq
   Q==;
X-CSE-ConnectionGUID: bDqypK6MS9mI/815W++bCA==
X-CSE-MsgGUID: vC+KhsfrQMG+vVl2IvwLHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="47847694"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="47847694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 05:41:35 -0700
X-CSE-ConnectionGUID: XCL1woV/RrCiZCYop0+SWw==
X-CSE-MsgGUID: Kv1DfaV7QIuUKGfCgW4ZrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="91441122"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Aug 2024 05:41:34 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgOB2-000ABT-0P;
	Tue, 20 Aug 2024 12:41:32 +0000
Date: Tue, 20 Aug 2024 20:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned-rebase 24/42] ERROR: modpost: "__udivdi3"
 [fs/xfs/xfs.ko] undefined!
Message-ID: <202408202032.kvQATHj0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

First bad commit (maybe != root cause):

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-rebase
head:   3c96db98f4feb088091259cb1cebca37b8460585
commit: af9be69e6bf368cc4270beff5c0e200dc493b00b [24/42] xfs: support zoned RT devices
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240820/202408202032.kvQATHj0-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408202032.kvQATHj0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408202032.kvQATHj0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> ERROR: modpost: "__udivdi3" [fs/xfs/xfs.ko] undefined!
ERROR: modpost: "xmb_manager_register" [drivers/misc/xilinx_tmr_manager.ko] undefined!
ERROR: modpost: "xmb_inject_err" [drivers/misc/xilinx_tmr_inject.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
