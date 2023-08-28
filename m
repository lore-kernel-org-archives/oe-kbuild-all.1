Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492B910F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 20:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693255397; x=1724791397;
  h=date:from:cc:subject:message-id:mime-version;
  bh=KP+vnSDZGmpcvCq7Ez9iVFVRHE9ZTqt2P5y7/TBY/E4=;
  b=M0nuWpbqEfb72bhgu1SfJEJa4LLH8/YdGnPbEptcy9XUz/F1KpLZygf7
   A4yqol1n+KfEEmWGzHKBamheW4VEmUP5BqjeLM1u5QT86hHQwJwioIWNt
   V8glh5mTu2LAr/UcVBiDUr7h9zHR0bCdacrEjGwnL84NDAI4CY2TdWHhD
   8s8DJHN7ChdIsTJtBxTP4ncuhR3oKTbooRpMV8Byg2YjXkzA5Laca0zR+
   vBZuZhqHKPY9/PpnblGxYXWfp6VmBkR/xt00gVRtf2L5Dro63W9bFRkGi
   knvYQFFl4f3LT3Wumns/vzi5WEBjFodapX/iY9llZay/qjEFJWc6BiNdN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="441547380"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="441547380"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 13:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="688242348"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="688242348"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 28 Aug 2023 13:43:17 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaj4q-00089j-1Z
	for oe-kbuild-all@lists.linux.dev;
	Mon, 28 Aug 2023 20:43:12 +0000
Date: Tue, 29 Aug 2023 04:42:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/dovetail-xenomai 2243/26832] ld.lld: error:
 undefined symbol: find_vm_area
Message-ID: <202308290411.4bxsTRaN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gilles,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/dovetail-xenomai
head:   ef4cd214d7c9836eb64fced61f30c02eadf8a91c
commit: 8f6ce1e9ee2e4b6e1edf5d8da6d3dd4a985c0631 [2243/26832] clocksource: mmio: add user-mappable mmio clocksources
config: arm-randconfig-r033-20230828 (https://download.01.org/0day-ci/archive/20230829/202308290411.4bxsTRaN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308290411.4bxsTRaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290411.4bxsTRaN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: find_vm_area
   >>> referenced by mmio.c
   >>>               clocksource/mmio.o:(default_revmap) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
