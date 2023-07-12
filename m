Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A30B27705
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 13:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689167337; x=1720703337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eISmG+XV5sDE6Kly+yKyzYIYNlvs1snV8DVANwN8cIo=;
  b=UD9Wsxs1XNGBXEJeFgQA6GGquQYyhMMqp3afQ1iyxYgiZ99iHeEmk/dR
   fWUF4bajGAN+CqP/vrnF6op+DHiycHGuLYPwxrg/73PRMcfiwmdPub2DD
   EtGaWeslM/Gv6Iy32PHwsy1xXtWeqExOdxXw3oKjPm2UpRprZXaOTfOch
   U+AoR2hErf0aWceLxhNPoviZCtIy0HcnrQwQgrG+ihK5ra0UZIKwRaijN
   2ygt6qTLobHKmE7JGAgzIe56Tgn8tytv75GIySSw0Sreglx90RDR+G6T/
   bACsEa8HOqPVos7gSq2vZ1xJEwzqAHApJpGkW4Ew/n1B2D4SA6kBnN2IB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428619843"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="428619843"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 06:08:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895624614"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="895624614"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Jul 2023 06:08:55 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJZaQ-0005hm-2O;
	Wed, 12 Jul 2023 13:08:54 +0000
Date: Wed, 12 Jul 2023 21:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Babrou <ivan@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bobrik:ivan/tcp-listen-drop-tracepoint-inline 1/1] ERROR: modpost:
 "do_trace_tcp_listen_queue_drop_wrapper" [net/ipv6/ipv6.ko] undefined!
Message-ID: <202307122142.blTwddls-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bobrik/linux ivan/tcp-listen-drop-tracepoint-inline
head:   deabeb568e567c1c34a4b385856160aae75f124e
commit: deabeb568e567c1c34a4b385856160aae75f124e [1/1] tcp: add a tracepoint for tcp_listen_queue_drop
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230712/202307122142.blTwddls-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307122142.blTwddls-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307122142.blTwddls-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "do_trace_tcp_listen_queue_drop_wrapper" [net/ipv6/ipv6.ko] undefined!
>> ERROR: modpost: "__tracepoint_tcp_listen_queue_drop" [net/ipv6/ipv6.ko] undefined!
>> ERROR: modpost: "do_trace_tcp_listen_queue_drop_wrapper" [net/smc/smc.ko] undefined!
>> ERROR: modpost: "__tracepoint_tcp_listen_queue_drop" [net/smc/smc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
