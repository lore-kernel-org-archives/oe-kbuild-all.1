Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAA438F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 14:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694701985; x=1726237985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ACbjDXqpbSkIx5lVqC0DpaEkj0MYZzhcw6xZZjsqnY=;
  b=iNOeM4ncboq/Z9x2QgE0hgp9zv+1g8zi9iYMLzIVeIK5up2AOi42+mH0
   YO52QbThQJCyTbqhcZT1x5D2DqS1OfWxYU6Xyakl/Mj+3UTM4zdZWBLTT
   98Y/uMiXGEEp4nRjJSAAesR+PuEsnsrIO8ejmMvhgbjlkB+gnMT90+Ezi
   IrQ9tFerjiiOzTbnXnxHOZPvheM9L+CLbe7yfdZ2pNvLtyWclwk4OtDJw
   VNZvllJogclhZdT9MQkuplEzjSUOsxaWEsUYicRednbanTpz4fQSmJ2PJ
   gE1eCPVHSNm2Mk8pFWkQTEpjlWldCS2Li1kjAaCVm/OC52dWivsJtj4Xc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="445405531"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="445405531"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 07:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="694292509"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="694292509"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Sep 2023 07:30:08 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgnM5-0001gv-30;
	Thu, 14 Sep 2023 14:30:05 +0000
Date: Thu, 14 Sep 2023 22:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Konovalov <andreyknvl@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 5164/5363] stacktrace.c:undefined reference to
 `save_stack_trace'
Message-ID: <202309142221.vrrn5D06-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98897dc735cf6635f0966f76eb0108354168fb15
commit: 5597cc6b442ffebfa0707248c289dca3cfee1dfa [5164/5363] lib/stackdepot: use fixed-sized slots for stack records
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230914/202309142221.vrrn5D06-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309142221.vrrn5D06-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309142221.vrrn5D06-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/stacktrace.o: in function `stack_trace_save':
>> stacktrace.c:(.text+0x16a): undefined reference to `save_stack_trace'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for STACKTRACE
   Depends on [n]: STACKTRACE_SUPPORT
   Selected by [y]:
   - STACKDEPOT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
