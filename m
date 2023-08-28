Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C94811CBE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693240705; x=1724776705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CgocUGw1a3+Fw1fMEz/Ss5BTTlGE9a7h//lRWe+i1No=;
  b=Gjq3d6qjKa4/QwTV8/r22fifvQdE5clO5gPjsI80V/Bgv8QNChQWr8W1
   KWxFalz+OhXovaxCagTXt75fGjpTyyd5mGeO+ktG0YIZvR+Mmq7fTyip8
   eSVLuua3Z1TPnmJeLMycb0K0YSe8RUW2H3i1KhfQsyBNwqrmvtc7bOWh7
   JFIMTXAgo8vm0qK0lm6j/3+70rmTBah+19uHcfgd4EXo5cJNKmVFnvObs
   V0tNCT+APYDvgGqx3d5hcmUb91fLjBQUNp+wJ4nYQ5Ypj4qL0Lybz+1F/
   O1Xg5D3tRKQr4t+o+252SWlH6KpS/0Mklf3P/C2aVLRK3gOppbfMyVm7/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="441493880"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="441493880"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 09:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738322315"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="738322315"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 28 Aug 2023 09:38:23 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qafFu-00082F-19;
	Mon, 28 Aug 2023 16:38:22 +0000
Date: Tue, 29 Aug 2023 00:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/bridge/analogix/anx7625.o: warning: objtool:
 anx7625_bridge_enable() falls through to next function
 anx7625_bridge_detect()
Message-ID: <202308290022.qwJXdpfX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 3f56ec920486dac44de803e9a3a26dfc7b79c4ce FROMGIT: drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP
date:   2 years, 8 months ago
config: x86_64-randconfig-002-20230828 (https://download.01.org/0day-ci/archive/20230829/202308290022.qwJXdpfX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308290022.qwJXdpfX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290022.qwJXdpfX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/analogix/anx7625.o: warning: objtool: anx7625_bridge_enable() falls through to next function anx7625_bridge_detect()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
