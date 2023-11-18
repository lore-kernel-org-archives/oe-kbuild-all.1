Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5210D360
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 00:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ug2lY9GN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700266886; x=1731802886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JVp7olcTOkjL7/rEmB2vCETo2dFYoFYzTuoDf80/kQM=;
  b=Ug2lY9GNUAWsS2F3e9kHW9as/tN2dUcXpEFB6VGmlOcEgcXH+WYBVDJ9
   n6CMUA9aj3oMNN2wNLyS1i3g55IDdA7t82ApQy6m5rI752cmXtmr39N4j
   Z0X2P88BbDDn/shi5wsxhVuoudVigRIizeHNaBkdRPYC1IBVLYyKcIsAA
   Axz5MFrl9mQbCRt4YdQ+gj7ljoAEv5F6lGhLXxUb53CARggDwDWu0KosR
   n5XtFsWvy/+lcmQxEZH3eNBsdWgUXJN5E0uZhdncfcHFRLldfYvG6v9lf
   emU9kaQ9cnSeBqtJlFhY5fV3B17mtdbBomTCd0SCBt+Ewnw+EKplxm2xW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="455687969"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="455687969"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 16:21:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="939301317"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="939301317"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Nov 2023 16:21:24 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r495O-0003LD-2Y;
	Sat, 18 Nov 2023 00:21:22 +0000
Date: Sat, 18 Nov 2023 08:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/futex 3/8] core.c:undefined reference to
 `vmalloc_huge_node'
Message-ID: <202311180858.JQ10yp1m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/futex
head:   9f7685869da06e22ee7f5dce56b355f057944666
commit: 5715d0d9d588356beb3d8f61ed961234596e094a [3/8] futex: Implement FUTEX2_NUMA
config: riscv-randconfig-001-20231118 (https://download.01.org/0day-ci/archive/20231118/202311180858.JQ10yp1m-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180858.JQ10yp1m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180858.JQ10yp1m-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/futex/core.o: in function `.L16':
>> core.c:(.init.text+0x162): undefined reference to `vmalloc_huge_node'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
