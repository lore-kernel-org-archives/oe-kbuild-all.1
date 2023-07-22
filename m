Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27B362A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 11:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690025905; x=1721561905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZZPQtDKAKXy/zcdIqEgTICgyrcr0idf9r0PMDcXAMMw=;
  b=iOqYlreMLlxbYX794RJ2372yU507V6L2gGALQ+10x12JAnyO3hUSVvAS
   z6gRM5cW6uxvqNhtHy5z+IhCyfsvP9dkt3yvw+WM8OpR1NXH4+rMqwVIW
   9ax5x77ocxdNbAfe7nLwzKoLry/kh6t51BxYOg8X9xWbK1+vRY1i+AO2q
   L2hHHAJnJ6W0P+at1CVhXg19GMstCIoAABMIyvcvEFkcFIeyoEGJIo5G7
   E4CCvJTbgv4avvWDN+dPYm2z7zmEqL0fanbeS9Qq5d5bn5bxy83d01DqS
   JltlaArfEyrLBH6/7e8hfCcD/Us6VzP9C1/t4pWfmAmyPDhIN+NU62CY4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="433419405"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="433419405"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 04:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="760251949"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="760251949"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 22 Jul 2023 04:38:23 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNAwJ-0008HT-09;
	Sat, 22 Jul 2023 11:38:23 +0000
Date: Sat, 22 Jul 2023 19:38:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-de:tip/sched/core_20232906_proxy_exec_v4 12/12]
 fair.c:(.debug_addr+0x1bc0): undefined reference to `sched_nr_latency'
Message-ID: <202307221907.Js8aT9ae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.gitlab.arm.com/linux-arm/linux-de.git tip/sched/core_20232906_proxy_exec_v4
head:   6a8f4ce70148c468ef287fc38700ed2217f94c43
commit: 6a8f4ce70148c468ef287fc38700ed2217f94c43 [12/12] XXX Debug
config: riscv-randconfig-r071-20230720 (https://download.01.org/0day-ci/archive/20230722/202307221907.Js8aT9ae-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221907.Js8aT9ae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221907.Js8aT9ae-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/sched/fair.o: in function `.Ldebug_addr0':
>> fair.c:(.debug_addr+0x1bc0): undefined reference to `sched_nr_latency'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
