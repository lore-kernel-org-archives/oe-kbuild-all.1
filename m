Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A4B4A33E4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999017; cv=none; b=A+BrkQe2Az8xLePrsHihg0+hc/f6frZhMJYpcsKw//PsqNwsnh1mt4I2vMWuYPmmFnAPU43v46Lcc3fsrnKVd5BiA/hPpvl3suWLLbj4ycvPu5uclYkpY2xZ9idOzt63QZvwY1P5eiJVmIsj+oY46FcIN1SHEVOu2tjylwt0hKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999017; c=relaxed/simple;
	bh=36HY7kzIOyM/WDuv1NyVPple02voUmuDpfh0atOk9Bw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JylL1zmVcmf6i5s4GtMvuVJGwfjIUaQXs/C0FcxIgSrBh6Hc2RBpmH3Aa9nvlWRhI+pF6Jd6T2oQ5HBhzOMWlnbrqgQkaIgf1pvcZmWTdPUSDY2hv7lBCPxrqviWnV8vYgBrY/6ImhLdobGf3H5/HVCWu5gnpJ7t8YDvd8odiI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVKRCUjG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVKRCUjG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782999015; x=1814535015;
  h=date:from:to:cc:subject:message-id;
  bh=36HY7kzIOyM/WDuv1NyVPple02voUmuDpfh0atOk9Bw=;
  b=aVKRCUjG4WFqFoJ4N3E7G2je8SsNJ8T0hhztqeX61uLLjFo3VzW+m2pT
   zEPSDC7L9UouPuelDzwUCABhth0NJ1TfCuo1JhbYPx1lEmJix8fXF3O9E
   TCwwOVOyEt0ykvrumvfwdk7tCy4+vR86K6tqXZMOJeVNt/A5gMPgYagJr
   Cfu7Ee0xo9xjb1pb1REJ+Oai1l1b9WFxMRahqHILNA37cT609SM4xdhxV
   e6Ky9mxgiRxIZbtQcugR7sqJf/40LwsGIKEj9dJdTb7rsY5Rpxan95dAo
   9jYQXtjMtb0tVWe7MKoxbt9mcQLG0Rfn4a0iUXf/IW/fENu3m8rWXlO6C
   w==;
X-CSE-ConnectionGUID: KLDi3dWHQCa3z8EoviGvVg==
X-CSE-MsgGUID: ZKliKDS3QE+4CDY/mv3mqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95258338"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="95258338"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:30:14 -0700
X-CSE-ConnectionGUID: hOHCgBIPQKGZKJ0F7684PQ==
X-CSE-MsgGUID: r58xkUS5S7++Na6NOQNTJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248416323"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2026 06:30:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfHUX-00000000AoN-1Z8v;
	Thu, 02 Jul 2026 13:30:09 +0000
Date: Thu, 02 Jul 2026 21:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Taeyang Lee <0wn@theori.io>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:perf/urgent 1/4]
 kernel/events/core.c:12001:11: warning: initialization of 'const struct
 match_token *' from 'int' makes pointer from integer without a cast
Message-ID: <202607022122.DmAj1tc7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/urgent
head:   91a15888098678641edd3ef4f5d66fa7e77dcc28
commit: f60c8830996ca8e468f96cc3ae79aab1e6fbfb12 [1/4] perf/core: Detach event groups during remove_on_exec
config: s390-randconfig-002-20260702 (https://download.01.org/0day-ci/archive/20260702/202607022122.DmAj1tc7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607022122.DmAj1tc7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607022122.DmAj1tc7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/events/core.c:11598:31: error: storage class specified for parameter 'uprobe_format_group'
   11598 | static struct attribute_group uprobe_format_group = {
         |                               ^~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:11598:15: error: parameter 'uprobe_format_group' is initialized
   11598 | static struct attribute_group uprobe_format_group = {
         |               ^~~~~~~~~~~~~~~
   kernel/events/core.c:11603:38: error: storage class specified for parameter 'uprobe_attr_groups'
   11603 | static const struct attribute_group *uprobe_attr_groups[] = {
         |                                      ^~~~~~~~~~~~~~~~~~
   kernel/events/core.c:11603:21: error: parameter 'uprobe_attr_groups' is initialized
   11603 | static const struct attribute_group *uprobe_attr_groups[] = {
         |                     ^~~~~~~~~~~~~~~
   kernel/events/core.c:11604:9: error: initialization of 'const struct attribute_group **' from incompatible pointer type 'struct attribute_group *' [-Werror=incompatible-pointer-types]
   11604 |         &uprobe_format_group,
         |         ^
   kernel/events/core.c:11604:9: note: (near initialization for 'uprobe_attr_groups')
   include/linux/stddef.h:8:14: warning: excess elements in scalar initializer
       8 | #define NULL ((void *)0)
         |              ^
   kernel/events/core.c:11605:9: note: in expansion of macro 'NULL'
   11605 |         NULL,
         |         ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'uprobe_attr_groups')
       8 | #define NULL ((void *)0)
         |              ^
   kernel/events/core.c:11605:9: note: in expansion of macro 'NULL'
   11605 |         NULL,
         |         ^~~~
   kernel/events/core.c:11608:12: error: storage class specified for parameter 'perf_uprobe_event_init'
   11608 | static int perf_uprobe_event_init(struct perf_event *event);
         |            ^~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:11609:19: error: storage class specified for parameter 'perf_uprobe'
   11609 | static struct pmu perf_uprobe = {
         |                   ^~~~~~~~~~~
   kernel/events/core.c:11609:15: error: parameter 'perf_uprobe' is initialized
   11609 | static struct pmu perf_uprobe = {
         |               ^~~
   kernel/events/core.c:11621:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   11621 | {
         | ^
   kernel/events/core.c:11651:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   11651 | {
         | ^
   kernel/events/core.c:11662:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   11662 | {
         | ^
   kernel/events/core.c:11671:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   11671 | {
         | ^
   kernel/events/core.c:11688:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   11688 | {
         | ^
   kernel/events/core.c:11744:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   11744 | {
         | ^
   kernel/events/core.c:11756:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   11756 | {
         | ^
   kernel/events/core.c:11819:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   11819 | {
         | ^
   kernel/events/core.c:11834:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   11834 | {
         | ^
   kernel/events/core.c:11849:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   11849 | {
         | ^
   kernel/events/core.c:11872:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   11872 | {
         | ^
   kernel/events/core.c:11890:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   11890 | {
         | ^
   kernel/events/core.c:11908:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   11908 | {
         | ^
   kernel/events/core.c:11982:1: warning: empty declaration
   11982 | enum {
         | ^~~~
   kernel/events/core.c:11993:1: warning: empty declaration
   11993 | enum {
         | ^~~~
   kernel/events/core.c:11999:28: error: storage class specified for parameter 'if_tokens'
   11999 | static const match_table_t if_tokens = {
         |                            ^~~~~~~~~
   kernel/events/core.c:11999:1: error: parameter 'if_tokens' is initialized
   11999 | static const match_table_t if_tokens = {
         | ^~~~~~
   kernel/events/core.c:12000:9: warning: braces around scalar initializer
   12000 |         { IF_ACT_FILTER,        "filter" },
         |         ^
   kernel/events/core.c:12000:9: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12000:33: warning: excess elements in scalar initializer
   12000 |         { IF_ACT_FILTER,        "filter" },
         |                                 ^~~~~~~~
   kernel/events/core.c:12000:33: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12001:9: warning: braces around scalar initializer
   12001 |         { IF_ACT_START,         "start" },
         |         ^
   kernel/events/core.c:12001:9: note: (near initialization for 'if_tokens')
>> kernel/events/core.c:12001:11: warning: initialization of 'const struct match_token *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   12001 |         { IF_ACT_START,         "start" },
         |           ^~~~~~~~~~~~
   kernel/events/core.c:12001:11: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12001:33: warning: excess elements in scalar initializer
   12001 |         { IF_ACT_START,         "start" },
         |                                 ^~~~~~~
   kernel/events/core.c:12001:33: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12001:9: warning: excess elements in scalar initializer
   12001 |         { IF_ACT_START,         "start" },
         |         ^
   kernel/events/core.c:12001:9: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12002:9: warning: braces around scalar initializer
   12002 |         { IF_ACT_STOP,          "stop" },
         |         ^
   kernel/events/core.c:12002:9: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12002:11: warning: initialization of 'const struct match_token *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   12002 |         { IF_ACT_STOP,          "stop" },
         |           ^~~~~~~~~~~
   kernel/events/core.c:12002:11: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12002:33: warning: excess elements in scalar initializer
   12002 |         { IF_ACT_STOP,          "stop" },
         |                                 ^~~~~~
   kernel/events/core.c:12002:33: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12002:9: warning: excess elements in scalar initializer
   12002 |         { IF_ACT_STOP,          "stop" },
         |         ^
   kernel/events/core.c:12002:9: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12003:9: warning: braces around scalar initializer
   12003 |         { IF_SRC_FILE,          "%u/%u@%s" },
         |         ^
   kernel/events/core.c:12003:9: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12003:11: warning: initialization of 'const struct match_token *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   12003 |         { IF_SRC_FILE,          "%u/%u@%s" },
         |           ^~~~~~~~~~~
   kernel/events/core.c:12003:11: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12003:33: warning: excess elements in scalar initializer
   12003 |         { IF_SRC_FILE,          "%u/%u@%s" },
         |                                 ^~~~~~~~~~
   kernel/events/core.c:12003:33: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12003:9: warning: excess elements in scalar initializer
   12003 |         { IF_SRC_FILE,          "%u/%u@%s" },
         |         ^
   kernel/events/core.c:12003:9: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12004:9: warning: braces around scalar initializer
   12004 |         { IF_SRC_KERNEL,        "%u/%u" },
         |         ^
   kernel/events/core.c:12004:9: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12004:11: warning: initialization of 'const struct match_token *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   12004 |         { IF_SRC_KERNEL,        "%u/%u" },
         |           ^~~~~~~~~~~~~
   kernel/events/core.c:12004:11: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12004:33: warning: excess elements in scalar initializer
   12004 |         { IF_SRC_KERNEL,        "%u/%u" },
         |                                 ^~~~~~~
   kernel/events/core.c:12004:33: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12004:9: warning: excess elements in scalar initializer
   12004 |         { IF_SRC_KERNEL,        "%u/%u" },
         |         ^
   kernel/events/core.c:12004:9: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12005:9: warning: braces around scalar initializer
   12005 |         { IF_SRC_FILEADDR,      "%u@%s" },
         |         ^
   kernel/events/core.c:12005:9: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12005:11: warning: initialization of 'const struct match_token *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   12005 |         { IF_SRC_FILEADDR,      "%u@%s" },
         |           ^~~~~~~~~~~~~~~
   kernel/events/core.c:12005:11: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12005:33: warning: excess elements in scalar initializer
   12005 |         { IF_SRC_FILEADDR,      "%u@%s" },
         |                                 ^~~~~~~
   kernel/events/core.c:12005:33: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12005:9: warning: excess elements in scalar initializer
   12005 |         { IF_SRC_FILEADDR,      "%u@%s" },
         |         ^
   kernel/events/core.c:12005:9: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12006:9: warning: braces around scalar initializer
   12006 |         { IF_SRC_KERNELADDR,    "%u" },
         |         ^
   kernel/events/core.c:12006:9: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12006:11: warning: initialization of 'const struct match_token *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   12006 |         { IF_SRC_KERNELADDR,    "%u" },
         |           ^~~~~~~~~~~~~~~~~
   kernel/events/core.c:12006:11: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12006:33: warning: excess elements in scalar initializer
   12006 |         { IF_SRC_KERNELADDR,    "%u" },
         |                                 ^~~~
   kernel/events/core.c:12006:33: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12006:9: warning: excess elements in scalar initializer
   12006 |         { IF_SRC_KERNELADDR,    "%u" },
         |         ^
   kernel/events/core.c:12006:9: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12007:9: warning: braces around scalar initializer
   12007 |         { IF_ACT_NONE,          NULL },
         |         ^
   kernel/events/core.c:12007:9: note: (near initialization for 'if_tokens')
   kernel/events/core.c:12007:11: warning: initialization of 'const struct match_token *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   12007 |         { IF_ACT_NONE,          NULL },
         |           ^~~~~~~~~~~
   kernel/events/core.c:12007:11: note: (near initialization for 'if_tokens')
   include/linux/stddef.h:8:14: warning: excess elements in scalar initializer
--
         |         ^~~~~~~~~~~
   include/linux/compiler.h:276:9: note: in expansion of macro '___ADDRESSABLE'
     276 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:77:9: note: in expansion of macro '__ADDRESSABLE'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/events/core.c:13072:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
   13072 | EXPORT_SYMBOL_GPL(perf_pmu_unregister);
         | ^~~~~~~~~~~~~~~~~
   kernel/events/core.c:13072:1: error: parameter '__UNIQUE_ID_addressable_perf_pmu_unregister_911' is initialized
   kernel/events/core.c:13072:1: warning: 'used' attribute ignored [-Wattributes]
   include/linux/compiler.h:165:17: error: section attribute not allowed for '__UNIQUE_ID_addressable_perf_pmu_unregister_911'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:15:24: note: in definition of macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/compiler.h:273:9: note: in expansion of macro '__UNIQUE_ID'
     273 |         __UNIQUE_ID(__PASTE(addressable_, sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:276:9: note: in expansion of macro '___ADDRESSABLE'
     276 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:77:9: note: in expansion of macro '__ADDRESSABLE'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/events/core.c:13072:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
   13072 | EXPORT_SYMBOL_GPL(perf_pmu_unregister);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:79:9: error: expected declaration specifiers before 'asm'
      79 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/events/core.c:13072:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
   13072 | EXPORT_SYMBOL_GPL(perf_pmu_unregister);
         | ^~~~~~~~~~~~~~~~~
   kernel/events/core.c:13075:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13075 | {
         | ^
   kernel/events/core.c:13081:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13081 | {
         | ^
   kernel/events/core.c:13159:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13159 | {
         | ^
   kernel/events/core.c:13228:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13228 | {
         | ^
   kernel/events/core.c:13244:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13244 | {
         | ^
   kernel/events/core.c:13251:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13251 | {
         | ^
   kernel/events/core.c:13262:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13262 | {
         | ^
   kernel/events/core.c:13271:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13271 | {
         | ^
   kernel/events/core.c:13349:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13349 | {
         | ^
   kernel/events/core.c:13583:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13583 | {
         | ^
   kernel/events/core.c:13708:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13708 | {
         | ^
   kernel/events/core.c:13718:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13718 | {
         | ^
   kernel/events/core.c:13805:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13805 | {
         | ^
   kernel/events/core.c:13843:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13843 | {
         | ^
   In file included from include/linux/syscalls.h:105:
>> arch/s390/include/asm/syscall_wrapper.h:34:56: error: expected declaration specifiers before ';' token
      34 |         ALLOW_ERROR_INJECTION(__s390x_sys##name, ERRNO);                        \
         |                                                        ^
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
>> arch/s390/include/asm/syscall_wrapper.h:35:28: error: storage class specified for parameter '__se_sys_perf_event_open'
      35 |         static inline long __se_sys##name(__MAP(x, __SC_LONG, __VA_ARGS__));    \
         |                            ^~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
>> arch/s390/include/asm/syscall_wrapper.h:35:28: warning: parameter '__se_sys_perf_event_open' declared 'inline'
      35 |         static inline long __se_sys##name(__MAP(x, __SC_LONG, __VA_ARGS__));    \
         |                            ^~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   kernel/events/core.c:13882:24: warning: 'gnu_inline' attribute ignored [-Wattributes]
   13882 |                 struct perf_event_attr __user *, attr_uptr,
         |                        ^~~~~~~~~~~~~~~
   include/linux/compiler_types.h:610:63: note: in definition of macro '__same_type'
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/syscalls.h:130:47: note: in expansion of macro '__TYPE_AS'
     130 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                               ^~~~~~~~~
   include/linux/syscalls.h:131:56: note: in expansion of macro '__TYPE_IS_LL'
     131 | #define __SC_LONG(t, a) __typeof(__builtin_choose_expr(__TYPE_IS_LL(t), 0LL, 0L)) a
         |                                                        ^~~~~~~~~~~~
   include/linux/syscalls.h:122:27: note: in expansion of macro '__SC_LONG'
     122 | #define __MAP5(m,t,a,...) m(t,a), __MAP4(m,__VA_ARGS__)
         |                           ^
   include/linux/syscalls.h:124:22: note: in expansion of macro '__MAP5'
     124 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   arch/s390/include/asm/syscall_wrapper.h:35:43: note: in expansion of macro '__MAP'
      35 |         static inline long __se_sys##name(__MAP(x, __SC_LONG, __VA_ARGS__));    \
         |                                           ^~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
>> arch/s390/include/asm/syscall_wrapper.h:35:28: error: 'no_instrument_function' attribute applies only to functions
      35 |         static inline long __se_sys##name(__MAP(x, __SC_LONG, __VA_ARGS__));    \
         |                            ^~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
>> arch/s390/include/asm/syscall_wrapper.h:36:28: error: storage class specified for parameter '__do_sys_perf_event_open'
      36 |         static inline long __do_sys##name(__MAP(x, __SC_DECL, __VA_ARGS__));    \
         |                            ^~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
>> arch/s390/include/asm/syscall_wrapper.h:36:28: warning: parameter '__do_sys_perf_event_open' declared 'inline'
      36 |         static inline long __do_sys##name(__MAP(x, __SC_DECL, __VA_ARGS__));    \
         |                            ^~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   kernel/events/core.c:13882:24: warning: 'gnu_inline' attribute ignored [-Wattributes]
   13882 |                 struct perf_event_attr __user *, attr_uptr,
         |                        ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:126:25: note: in definition of macro '__SC_DECL'
     126 | #define __SC_DECL(t, a) t a
         |                         ^
   include/linux/syscalls.h:124:22: note: in expansion of macro '__MAP5'
     124 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   arch/s390/include/asm/syscall_wrapper.h:36:43: note: in expansion of macro '__MAP'
      36 |         static inline long __do_sys##name(__MAP(x, __SC_DECL, __VA_ARGS__));    \
         |                                           ^~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   arch/s390/include/asm/syscall_wrapper.h:36:28: error: 'no_instrument_function' attribute applies only to functions
      36 |         static inline long __do_sys##name(__MAP(x, __SC_DECL, __VA_ARGS__));    \
         |                            ^~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   arch/s390/include/asm/syscall_wrapper.h:37:47: error: expected declaration specifiers before ';' token
      37 |         __S390_SYS_STUBx(x, name, __VA_ARGS__);                                 \
         |                                               ^
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
>> arch/s390/include/asm/syscall_wrapper.h:39:9: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      39 |         {                                                                       \
         |         ^
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   arch/s390/include/asm/syscall_wrapper.h:43:9: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      43 |         {                                                                       \
         |         ^
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   kernel/events/core.c:13884:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13884 | {
         | ^
   kernel/events/core.c:14296:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   14296 | {
         | ^
   kernel/events/core.c:14390:19: error: storage class specified for parameter 'perf_event_create_kernel_counter'
   14390 | EXPORT_SYMBOL_GPL(perf_event_create_kernel_counter);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/events/core.c:14390:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
   14390 | EXPORT_SYMBOL_GPL(perf_event_create_kernel_counter);
         | ^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:165:17: error: storage class specified for parameter '__UNIQUE_ID_addressable_perf_event_create_kernel_counter_925'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:15:24: note: in definition of macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/compiler.h:273:9: note: in expansion of macro '__UNIQUE_ID'
     273 |         __UNIQUE_ID(__PASTE(addressable_, sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:276:9: note: in expansion of macro '___ADDRESSABLE'
     276 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:77:9: note: in expansion of macro '__ADDRESSABLE'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/events/core.c:14390:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
   14390 | EXPORT_SYMBOL_GPL(perf_event_create_kernel_counter);
         | ^~~~~~~~~~~~~~~~~
   kernel/events/core.c:14390:1: error: parameter '__UNIQUE_ID_addressable_perf_event_create_kernel_counter_925' is initialized
   kernel/events/core.c:14390:1: warning: 'used' attribute ignored [-Wattributes]
   include/linux/compiler.h:165:17: error: section attribute not allowed for '__UNIQUE_ID_addressable_perf_event_create_kernel_counter_925'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:15:24: note: in definition of macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/compiler.h:273:9: note: in expansion of macro '__UNIQUE_ID'
     273 |         __UNIQUE_ID(__PASTE(addressable_, sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:276:9: note: in expansion of macro '___ADDRESSABLE'
     276 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:77:9: note: in expansion of macro '__ADDRESSABLE'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/events/core.c:14390:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
   14390 | EXPORT_SYMBOL_GPL(perf_event_create_kernel_counter);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:79:9: error: expected declaration specifiers before 'asm'
      79 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~


vim +12001 kernel/events/core.c

375637bc524952 Alexander Shishkin 2016-04-27  11998  
375637bc524952 Alexander Shishkin 2016-04-27  11999  static const match_table_t if_tokens = {
375637bc524952 Alexander Shishkin 2016-04-27  12000  	{ IF_ACT_FILTER,	"filter" },
375637bc524952 Alexander Shishkin 2016-04-27 @12001  	{ IF_ACT_START,		"start" },
375637bc524952 Alexander Shishkin 2016-04-27  12002  	{ IF_ACT_STOP,		"stop" },
375637bc524952 Alexander Shishkin 2016-04-27  12003  	{ IF_SRC_FILE,		"%u/%u@%s" },
375637bc524952 Alexander Shishkin 2016-04-27  12004  	{ IF_SRC_KERNEL,	"%u/%u" },
375637bc524952 Alexander Shishkin 2016-04-27  12005  	{ IF_SRC_FILEADDR,	"%u@%s" },
375637bc524952 Alexander Shishkin 2016-04-27  12006  	{ IF_SRC_KERNELADDR,	"%u" },
e96271f3ed7e70 Alexander Shishkin 2016-11-18  12007  	{ IF_ACT_NONE,		NULL },
375637bc524952 Alexander Shishkin 2016-04-27  12008  };
375637bc524952 Alexander Shishkin 2016-04-27  12009  

:::::: The code at line 12001 was first introduced by commit
:::::: 375637bc524952f1122ea22caf5a8f1fecad8228 perf/core: Introduce address range filtering

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
