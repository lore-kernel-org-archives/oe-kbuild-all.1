Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730DA374CC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 03:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734666272; cv=none; b=ZRyqE8CGvKo51ICppRPKlG50Yym21bNhQa3NpohB6YmqKW3IyL7CHpquwog4gePXu1BEwNo4TQ4oTs7d9c/G8WMd9CnCuGYf+pBXx4rrCNEsIsXND5igX1BeRNNDbtyneFGaXJg4w2T3r1emvVTa4v8ZllCB0cScOloL5eNr4Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734666272; c=relaxed/simple;
	bh=Z9xlrgm2X8BXq8c4ZF2l8I+gEIsCO56lhGc4rH92Xzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CvCwHps7vnM9oRyNkA7DOaCZwKNTIDelm8ov7NU1flmrQCzli9E2CxckDEvNTU0pcuk/14WiWpLkhNX8WddNwURHHfukJjbO4Bgu/N4BPAt+Gw6vsGXgrjRbtgE059io7EvPIYJfgMysONZmBOiidnjnFeIckt7RoJETLR2wBpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhiKaNtB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhiKaNtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734666271; x=1766202271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z9xlrgm2X8BXq8c4ZF2l8I+gEIsCO56lhGc4rH92Xzg=;
  b=NhiKaNtBNvRbjFZQy2/USv2vRrighKs8B8mFv0rsn4l4iDOzGRP8Dquo
   WU/vz3BIyd6LtuTc52NOKE+RwItRn70oK9NpfDyr9vWkxvjja7G0DIOB9
   QfkR3TIH8BXpOayvQoHrV4HmAKkAqlwiVRAT0gjJOi2pDNR9PaZ7tkHda
   eVpb2Wj0uvsFosEpoZOt7Yqke97pVnOsh7UJkmku8JXj0muHPp3nlKWDl
   HceKX4PuUYHyfOp79UJMJ+JX+rWIUG1e4AnoQKkZoSwp5qi737qWX9LER
   KfSiwqPsC36gVfYJ306OdqFKHgEFgzgecwI5bVw2eyPu+yAGXGabVExTp
   w==;
X-CSE-ConnectionGUID: m4t9qSQjS5O/L8JmrelL1A==
X-CSE-MsgGUID: FhD1ok8fRmim9nAKuiR6Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46216798"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="46216798"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 19:44:30 -0800
X-CSE-ConnectionGUID: EVKvSdWoR4aJW6pzFBcURQ==
X-CSE-MsgGUID: W/ISzrRuQFyDkouvusAQFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="103481892"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Dec 2024 19:44:29 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOTwA-0000kX-0O;
	Fri, 20 Dec 2024 03:44:26 +0000
Date: Fri, 20 Dec 2024 11:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1336/1336]
 drivers/mmc/core/.tmp_core.o: warning: objtool: missing symbol for section
 .exit.text
Message-ID: <202412201128.mwjfPZy6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8fbcff0074ff9f93ea927547e99e1dde27ddc7c5
commit: c3bc8fd637a9623f5c507bd18f9677effbddf584 [1336/1336] tracing: Centralize preemptirq tracepoints and unify their usage
config: x86_64-buildonly-randconfig-001-20241219 (https://download.01.org/0day-ci/archive/20241220/202412201128.mwjfPZy6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201128.mwjfPZy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201128.mwjfPZy6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mmc/core/core.c:13:
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'mmc_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/module.h:115:41: note: in expansion of macro 'module_init'
     115 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/mmc/core/core.c:2871:1: note: in expansion of macro 'subsys_initcall'
    2871 | subsys_initcall(mmc_init);
         | ^~~~~~~~~~~~~~~
   drivers/mmc/core/core.c:2839:19: note: 'init_module' target declared here
    2839 | static int __init mmc_init(void)
         |                   ^~~~~~~~
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'mmc_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/mmc/core/core.c:2872:1: note: in expansion of macro 'module_exit'
    2872 | module_exit(mmc_exit);
         | ^~~~~~~~~~~
   drivers/mmc/core/core.c:2864:20: note: 'cleanup_module' target declared here
    2864 | static void __exit mmc_exit(void)
         |                    ^~~~~~~~
   drivers/mmc/core/core.c:1343: warning: Function parameter or member 'mmc' not described in 'mmc_regulator_set_vqmmc'
   drivers/mmc/core/core.c:1343: warning: Function parameter or member 'ios' not described in 'mmc_regulator_set_vqmmc'
   drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_hw_reset()+0x93: sibling call from callable instruction with modified stack frame
   drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_sw_reset()+0x93: sibling call from callable instruction with modified stack frame
   drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_wait_for_req_done()+0x86: sibling call from callable instruction with modified stack frame
   drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_do_erase()+0x9d: sibling call from callable instruction with modified stack frame
   drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_of_parse_voltage()+0x33: sibling call from callable instruction with modified stack frame
   drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_execute_tuning()+0x3c: sibling call from callable instruction with modified stack frame
   drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_set_uhs_voltage()+0x35: sibling call from callable instruction with modified stack frame
>> drivers/mmc/core/.tmp_core.o: warning: objtool: missing symbol for section .exit.text
--
   kernel/trace/trace_events_trigger.c:68: warning: Function parameter or member 'event' not described in 'event_triggers_call'
   kernel/trace/trace_events_trigger.c:912: warning: Function parameter or member 'named_data' not described in 'set_named_trigger_data'
>> kernel/trace/.tmp_trace_events_trigger.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
