Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224222;
	b=eZPcEegpz0PKF0PHzEDCGg6ObdCWjfH6MCTMJO4oPeIGGnyPb2dniQawVjhOkUOuKN6w
	 er1vC32fjFQIqD8lASvFjy+ww1XHT3nmIWWu8+1G0KuY8Es2L5I1pLTXnr+1068QVaaJC
	 BviszaGSsOfQKc80thj4tog4hXdBlfltiYohUUHFt1G/hoiyls8iwkkyMWcU7ZrnIVl9/
	 u0uVCD+UlU0jlJXMOeQR7bVxyIM3Ex0jJcz2Q6lU3lajd9ETPoJaBspPm8ILbupbgNe3i
	 vg1Vz1Ud41wKpGHv5A2FpbDjnnK0uKBoGFCeavjrZDvKC58/u/s7Ud9rSOHpFmrKivw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224222;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=7bcqEMcr7MsKxYWgE6txb9ahYqfefrfRom2w6XLK2T4=;
	b=ixxPyFmFThyj2o8yRvhfzKaw9sNCOMlyP0Si+XdNIoifIBm1CwPD9rQlgjskVX47Loub
	 S5AHrb+1OmpBVU2rCl8SBpzthJk55fsmN6v9Wk5+2JjddYKSXY/CNbD3BDR4wmNsuU1U7
	 /awGgImCQ/a1EeKnmPPKtb8IXS1TvsNzBpHG0FF5B+4OwJreTSkiV+oHmRU4lW6a1QaKI
	 8iINWv0wznzearnsiDzdHiO8mWBxPjslgaq0umU9yKC8kGpr1CZ2kmH4cnzV0gGqmaieg
	 i35SjMBe+dyJOgUhJ2rbj3zSu3QDTb2uT41caeWs8GgaK/iVXD6vTum3rfdc4g20KQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f+djZCRv;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78787606A330
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 11:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78787606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f+djZCRv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794224219; x=1825760219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YxqX5WedqGdV5k4sKDkqiX0LSRItlTPaiAgFv5KSgF0=;
  b=f+djZCRv/oeJJvl5mnE+r5ZOkJF9tUjPl4hnXDhzKOeb1eVQ+Fso3AYt
   g9jjQk9hxThxzKcUUGXa+cPe0qeKi3EUcZm+O9a9zjdbLlGXsfKl8qxV9
   AEnjW0qxUMEtAh47zhUODGNAYD1ydD0xqmmOWu594pthQo/MWcXfc0UpH
   IiWTzBoyuRKzsgb7Y76Ch+jsJCD3AoJbGxn9lfOH6aOOG8jR9WR1C0kPS
   eM/jsDkpqrlz0Iop3gkLRmSXoUIlXAhjbyOytWoz30fH/gCBPG2/cRfQN
   RpjktFzIE/TPXrxdpNLi8io92S+9uJo1HuUzcWqVBoQvcxHaU6BP+fAg0
   Q==;
X-CSE-ConnectionGUID: zph79xsERaq0jixj3SAWrA==
X-CSE-MsgGUID: FfjODMJOTxCJ5Nfb/ak2ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2969835"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2969835"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:36:58 -0800
X-CSE-ConnectionGUID: okG/wGImSQydWnhbeDjoOg==
X-CSE-MsgGUID: c88vXMMUSIqaSzF8DFUFhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7880796"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Nov 2026 03:36:58 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQNgF-00000000uQF-19eU;
	Mon, 09 Nov 2026 11:36:55 +0000
Date: Mon, 09 Nov 2026 19:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-maple-clean 47/50] lib/dynamic_debug.c:301:39:
 warning: implicit conversion from 'unsigned long long' to 'unsigned long'
 changes value from 3458764513820540928 to 0
Message-ID: <202611091955.WMblcOS9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-maple-clean
head:   5f7782a41d4ca319992609b6589a592f87e83006
commit: af718ee6a3256d73ee276d2c2bbbae9df0da6bfb [47/50] dyndbg: Save _ddebug_site fields into a maple-tree
config: loongarch-randconfig-1000-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091955.WMblcOS9-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project fc9576e3b179738d99c5babe5cd9d6c1f883e0db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091955.WMblcOS9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091955.WMblcOS9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:301:39: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 3458764513820540928 to 0 [-Wconstant-conversion]
     301 | DEFINE_DYNDBG_SITE_ACCESSOR(function, DD_TAG_FUNC)
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   lib/dynamic_debug.c:117:28: note: expanded from macro 'DD_TAG_FUNC'
     117 | #define DD_TAG_FUNC             (3ULL << DD_KEY_TAG_SHIFT)
         |                                       ^
   lib/dynamic_debug.c:292:61: note: expanded from macro 'DEFINE_DYNDBG_SITE_ACCESSOR'
     292 |         unsigned long key = ddebug_site_tag_key((unsigned long)dp, tag); \
         |                             ~~~~~~~~~~~~~~~~~~~                    ^~~
   lib/dynamic_debug.c:302:39: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 2305843009213693952 to 0 [-Wconstant-conversion]
     302 | DEFINE_DYNDBG_SITE_ACCESSOR(filename, DD_TAG_FILE)
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   lib/dynamic_debug.c:116:28: note: expanded from macro 'DD_TAG_FILE'
     116 | #define DD_TAG_FILE             (2ULL << DD_KEY_TAG_SHIFT)
         |                                       ^
   lib/dynamic_debug.c:292:61: note: expanded from macro 'DEFINE_DYNDBG_SITE_ACCESSOR'
     292 |         unsigned long key = ddebug_site_tag_key((unsigned long)dp, tag); \
         |                             ~~~~~~~~~~~~~~~~~~~                    ^~~
   lib/dynamic_debug.c:303:38: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 1152921504606846976 to 0 [-Wconstant-conversion]
     303 | DEFINE_DYNDBG_SITE_ACCESSOR(modname, DD_TAG_MOD)
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   lib/dynamic_debug.c:115:27: note: expanded from macro 'DD_TAG_MOD'
     115 | #define DD_TAG_MOD              (1ULL << DD_KEY_TAG_SHIFT)
         |                                       ^
   lib/dynamic_debug.c:292:61: note: expanded from macro 'DEFINE_DYNDBG_SITE_ACCESSOR'
     292 |         unsigned long key = ddebug_site_tag_key((unsigned long)dp, tag); \
         |                             ~~~~~~~~~~~~~~~~~~~                    ^~~
   lib/dynamic_debug.c:311:51: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 1152921504606846976 to 0 [-Wconstant-conversion]
     311 |                 *mod = mtree_load(mt, ddebug_site_tag_key(addr, DD_TAG_MOD)) ?: "unknown";
         |                                       ~~~~~~~~~~~~~~~~~~~       ^~~~~~~~~~
   lib/dynamic_debug.c:115:27: note: expanded from macro 'DD_TAG_MOD'
     115 | #define DD_TAG_MOD              (1ULL << DD_KEY_TAG_SHIFT)
         |                                  ~~~~~^~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:313:52: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 2305843009213693952 to 0 [-Wconstant-conversion]
     313 |                 *file = mtree_load(mt, ddebug_site_tag_key(addr, DD_TAG_FILE)) ?: "unknown";
         |                                        ~~~~~~~~~~~~~~~~~~~       ^~~~~~~~~~~
   lib/dynamic_debug.c:116:28: note: expanded from macro 'DD_TAG_FILE'
     116 | #define DD_TAG_FILE             (2ULL << DD_KEY_TAG_SHIFT)
         |                                  ~~~~~^~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:315:52: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 3458764513820540928 to 0 [-Wconstant-conversion]
     315 |                 *func = mtree_load(mt, ddebug_site_tag_key(addr, DD_TAG_FUNC)) ?: "unknown";
         |                                        ~~~~~~~~~~~~~~~~~~~       ^~~~~~~~~~~
   lib/dynamic_debug.c:117:28: note: expanded from macro 'DD_TAG_FUNC'
     117 | #define DD_TAG_FUNC             (3ULL << DD_KEY_TAG_SHIFT)
         |                                  ~~~~~^~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1825:35: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 3458764513820540928 to 0 [-Wconstant-conversion]
    1824 |         funcs = ddebug_grow_tree(di, &dd_site_map,
         |                 ~~~~~~~~~~~~~~~~
    1825 |                                  "func", ddebug_get_function, DD_TAG_FUNC);
         |                                                               ^~~~~~~~~~~
   lib/dynamic_debug.c:117:28: note: expanded from macro 'DD_TAG_FUNC'
     117 | #define DD_TAG_FUNC             (3ULL << DD_KEY_TAG_SHIFT)
         |                                  ~~~~~^~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1827:35: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 2305843009213693952 to 0 [-Wconstant-conversion]
    1826 |         files = ddebug_grow_tree(di, &dd_site_map,
         |                 ~~~~~~~~~~~~~~~~
    1827 |                                  "file", ddebug_get_filename, DD_TAG_FILE);
         |                                                               ^~~~~~~~~~~
   lib/dynamic_debug.c:116:28: note: expanded from macro 'DD_TAG_FILE'
     116 | #define DD_TAG_FILE             (2ULL << DD_KEY_TAG_SHIFT)
         |                                  ~~~~~^~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1829:32: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 1152921504606846976 to 0 [-Wconstant-conversion]
    1828 |         mods = ddebug_grow_tree(di, &dd_site_map,
         |                ~~~~~~~~~~~~~~~~
    1829 |                                 "mod", ddebug_get_modname, DD_TAG_MOD);
         |                                                            ^~~~~~~~~~
   lib/dynamic_debug.c:115:27: note: expanded from macro 'DD_TAG_MOD'
     115 | #define DD_TAG_MOD              (1ULL << DD_KEY_TAG_SHIFT)
         |                                  ~~~~~^~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1968:52: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 3458764513820540928 to 0 [-Wconstant-conversion]
    1968 |         unsigned long tags[] = { DD_TAG_MOD, DD_TAG_FILE, DD_TAG_FUNC };
         |                                ~                          ^~~~~~~~~~~
   lib/dynamic_debug.c:117:28: note: expanded from macro 'DD_TAG_FUNC'
     117 | #define DD_TAG_FUNC             (3ULL << DD_KEY_TAG_SHIFT)
         |                                  ~~~~~^~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1968:39: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 2305843009213693952 to 0 [-Wconstant-conversion]
    1968 |         unsigned long tags[] = { DD_TAG_MOD, DD_TAG_FILE, DD_TAG_FUNC };
         |                                ~             ^~~~~~~~~~~
   lib/dynamic_debug.c:116:28: note: expanded from macro 'DD_TAG_FILE'
     116 | #define DD_TAG_FILE             (2ULL << DD_KEY_TAG_SHIFT)
         |                                  ~~~~~^~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1968:27: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 1152921504606846976 to 0 [-Wconstant-conversion]
    1968 |         unsigned long tags[] = { DD_TAG_MOD, DD_TAG_FILE, DD_TAG_FUNC };
         |                                ~ ^~~~~~~~~~
   lib/dynamic_debug.c:115:27: note: expanded from macro 'DD_TAG_MOD'
     115 | #define DD_TAG_MOD              (1ULL << DD_KEY_TAG_SHIFT)
         |                                  ~~~~~^~~~~~~~~~~~~~~~~~~
   12 warnings generated.


vim +301 lib/dynamic_debug.c

   300	
 > 301	DEFINE_DYNDBG_SITE_ACCESSOR(function, DD_TAG_FUNC)
   302	DEFINE_DYNDBG_SITE_ACCESSOR(filename, DD_TAG_FILE)
   303	DEFINE_DYNDBG_SITE_ACCESSOR(modname, DD_TAG_MOD)
   304	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
