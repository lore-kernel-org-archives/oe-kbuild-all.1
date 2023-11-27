Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9AD1FD2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 03:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8palIXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701054713; x=1732590713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uipa8u7mi2CanEqOz7c6p31pWVSQFRW8FdSBmWgHPkI=;
  b=X8palIXxCkYygnU8nEnCYQ97aLIg76uvZsefTu3Ss6KoqdgcAHmcgNFA
   GJEQflm9qTmlAn8IbvkjYAy/ltzC1P9eDc/o/af0QQ4vNKsOMjwv5Mdun
   FkjEysHM46EWjzjurGLr8w3YngVY1CZwAa0HHgWXhGaUXWf5sZKO8/Xgw
   FbXEvTKHdHAPMS6wZ5knBb5bR9l9IpNpZY5hOVwhihf61lun/HyQ+NcfK
   zFzhOV4rFwNHJf6u/RUTYpSIiDWr6Pbyx/IYYZweJRcSiJTJoTwJ5YtCs
   Y1AhBuxu2mmByTlH8CiVLvMhm/nqa9xoMwom1R/nY0i26Os8FtgBl69md
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="14187894"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="14187894"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 19:11:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="717907947"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="717907947"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Nov 2023 19:11:23 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7S1n-0005m8-0Z;
	Mon, 27 Nov 2023 03:11:19 +0000
Date: Mon, 27 Nov 2023 11:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: zap8600 <95487746+zap8600@users.noreply.github.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:pr/14 1/1] Error:
 arch/xtensa/boot/dts/feathers3.dts:38.1-8 Label or path chosen not found
Message-ID: <202311270854.l5ZFGhAg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa pr/14
head:   e08b806438543ef78be07ca12a885713227bf771
commit: e08b806438543ef78be07ca12a885713227bf771 [1/1] added part of feathers3
config: xtensa-randconfig-001-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270854.l5ZFGhAg-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311270854.l5ZFGhAg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270854.l5ZFGhAg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/xtensa/boot/dts/feathers3.dts:38.1-8 Label or path chosen not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
