Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F031FAC26
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057600; cv=none; b=Wz8cSicsi3cwxB28o20l+kRYMnl7FxbanR9MvcJFYXQidUy2S/Yp9l2GyohRweo53x1qKzcPLFj7SWYrMc3OOTiBAfx2dRIXJPJ6Wq0JDHUFHfvMBEDwBj2uZqfojdtoDzE4/LN3wizj82Kf4qjjtfrVfToViGiGd7eghchNUCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057600; c=relaxed/simple;
	bh=2qU2tICLOYd1IRsl8LNfj+vDVpG9Pj7sCo69QZI2618=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YnQtvQR6FXqQkgL2fjPq2v4kdgFHXPZVu1RNLIrcnQj+aylcnoIGVT0TuRqi1nFgtSdYyQXx03pB7zLBLm0NQqvwfMAtKUlNi2FODozBegRo9QBUmg3kWC5qe0JDKM3nTJtSkCwWNbrjZSiPZM+1QKOV101Xf3FE6NTFt4kCZvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h44jE1ep; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h44jE1ep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740057598; x=1771593598;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2qU2tICLOYd1IRsl8LNfj+vDVpG9Pj7sCo69QZI2618=;
  b=h44jE1epVvpsBwGUPx9OzYSihaMNrlewjbvDeY+DyKKCCxe5yyfic2ls
   oVVXSO7o/BfgHM4mm0xF8g0pz+9bwwlUTY3LxlN49dyWqQxbAHPir+Xgy
   O3to4awajFLs2KA+Q1gq2A+FxHTs1VEGJ2/A5+gCElZE/rJtXswRPjXhW
   Mq0JM2uK/5MuMr4BY32ujZit2FOWNLXAL1+9oi4ZImoKuO3V2xc304AQL
   seS6R9cApUMzVkkYw91DM7/zosAigs682OCYM9IFsw5wxkvvJuv3Rsjzl
   wARmtFn9zuSMiYuJu8fwqzwIWURSrqeHmZ/zq3GCybPsqT5Y4mrIWWo4z
   w==;
X-CSE-ConnectionGUID: nBrgR/tATzGQeTTj7Lfibg==
X-CSE-MsgGUID: oC96oR6kRF2VJSp+YTAWxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51822484"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51822484"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 05:19:57 -0800
X-CSE-ConnectionGUID: 07HYwHS4TgmnFZiT5iqaUg==
X-CSE-MsgGUID: euZ9rhaORuiqDe+HkV6J9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="115016611"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2025 05:19:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl6T4-0004K9-08
	for oe-kbuild-all@lists.linux.dev;
	Thu, 20 Feb 2025 13:19:54 +0000
Date: Thu, 20 Feb 2025 21:19:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] include/net/flow_offload.h:167:31: warning:
 array subscript 0 is outside array bounds of 'struct flow_action_entry[0]'
Message-ID: <202502202156.EqyZtHKG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 738678817573ce45698e1bb13222f2e53622c555 [1/1] drivers: net: use flow action infrastructure
config: arm64-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250220/202502202156.EqyZtHKG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502202156.EqyZtHKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502202156.EqyZtHKG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/pkt_cls.h:9,
                    from drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.h:38,
                    from drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c:42:
   In function 'cxgb4_validate_flow_actions',
       inlined from 'cxgb4_tc_flower_replace' at drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c:644:6:
>> include/net/flow_offload.h:167:31: warning: array subscript 0 is outside array bounds of 'struct flow_action_entry[0]' [-Warray-bounds=]
     167 |         for (__i = 0, __act = &(__actions)->entries[0]; __i < (__actions)->num_entries; __act = &(__actions)->entries[__i++])
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c:555:9: note: in expansion of macro 'flow_action_for_each'
     555 |         flow_action_for_each(i, act, &rule->action) {
         |         ^~~~~~~~~~~~~~~~~~~~
   include/net/flow_offload.h: In function 'cxgb4_tc_flower_replace':
   include/net/flow_offload.h:158:41: note: while referencing 'entries'
     158 |         struct flow_action_entry        entries[0];
         |                                         ^~~~~~~
   In function 'cxgb4_validate_flow_actions',
       inlined from 'cxgb4_tc_flower_replace' at drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c:644:6:
>> include/net/flow_offload.h:167:97: warning: array subscript i is outside array bounds of 'struct flow_action_entry[0]' [-Warray-bounds=]
     167 |         for (__i = 0, __act = &(__actions)->entries[0]; __i < (__actions)->num_entries; __act = &(__actions)->entries[__i++])
         |                                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c:555:9: note: in expansion of macro 'flow_action_for_each'
     555 |         flow_action_for_each(i, act, &rule->action) {
         |         ^~~~~~~~~~~~~~~~~~~~
   include/net/flow_offload.h: In function 'cxgb4_tc_flower_replace':
   include/net/flow_offload.h:158:41: note: while referencing 'entries'
     158 |         struct flow_action_entry        entries[0];
         |                                         ^~~~~~~
   In function 'cxgb4_process_flow_actions',
       inlined from 'cxgb4_tc_flower_replace' at drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c:659:2:
>> include/net/flow_offload.h:167:31: warning: array subscript 0 is outside array bounds of 'struct flow_action_entry[0]' [-Warray-bounds=]
     167 |         for (__i = 0, __act = &(__actions)->entries[0]; __i < (__actions)->num_entries; __act = &(__actions)->entries[__i++])
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c:387:9: note: in expansion of macro 'flow_action_for_each'
     387 |         flow_action_for_each(i, act, &rule->action) {
         |         ^~~~~~~~~~~~~~~~~~~~
   include/net/flow_offload.h: In function 'cxgb4_tc_flower_replace':
   include/net/flow_offload.h:158:41: note: while referencing 'entries'
     158 |         struct flow_action_entry        entries[0];
         |                                         ^~~~~~~
   In function 'cxgb4_process_flow_actions',
       inlined from 'cxgb4_tc_flower_replace' at drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c:659:2:
>> include/net/flow_offload.h:167:97: warning: array subscript i is outside array bounds of 'struct flow_action_entry[0]' [-Warray-bounds=]
     167 |         for (__i = 0, __act = &(__actions)->entries[0]; __i < (__actions)->num_entries; __act = &(__actions)->entries[__i++])
         |                                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c:387:9: note: in expansion of macro 'flow_action_for_each'
     387 |         flow_action_for_each(i, act, &rule->action) {
         |         ^~~~~~~~~~~~~~~~~~~~
   include/net/flow_offload.h: In function 'cxgb4_tc_flower_replace':
   include/net/flow_offload.h:158:41: note: while referencing 'entries'
     158 |         struct flow_action_entry        entries[0];
         |                                         ^~~~~~~


vim +167 include/net/flow_offload.h

e3ab786b42535d Pablo Neira Ayuso 2019-02-02  155  
e3ab786b42535d Pablo Neira Ayuso 2019-02-02  156  struct flow_action {
e3ab786b42535d Pablo Neira Ayuso 2019-02-02  157  	unsigned int			num_entries;
e3ab786b42535d Pablo Neira Ayuso 2019-02-02 @158  	struct flow_action_entry 	entries[0];
e3ab786b42535d Pablo Neira Ayuso 2019-02-02  159  };
e3ab786b42535d Pablo Neira Ayuso 2019-02-02  160  
e3ab786b42535d Pablo Neira Ayuso 2019-02-02  161  static inline bool flow_action_has_entries(const struct flow_action *action)
e3ab786b42535d Pablo Neira Ayuso 2019-02-02  162  {
e3ab786b42535d Pablo Neira Ayuso 2019-02-02  163  	return action->num_entries;
e3ab786b42535d Pablo Neira Ayuso 2019-02-02  164  }
e3ab786b42535d Pablo Neira Ayuso 2019-02-02  165  
e3ab786b42535d Pablo Neira Ayuso 2019-02-02  166  #define flow_action_for_each(__i, __act, __actions)			\
e3ab786b42535d Pablo Neira Ayuso 2019-02-02 @167          for (__i = 0, __act = &(__actions)->entries[0]; __i < (__actions)->num_entries; __act = &(__actions)->entries[__i++])
e3ab786b42535d Pablo Neira Ayuso 2019-02-02  168  

:::::: The code at line 167 was first introduced by commit
:::::: e3ab786b42535da00c731c3585165e88bf35ab09 flow_offload: add flow action infrastructure

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
