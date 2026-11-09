Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200798;
	b=1q/N0+DSiy448jIyscxmkMrExyfDg88JHCHQbh8v5m8aS1+9MJyK2EsbUllnPEoaUq0v
	 lZoviyc7BHlCgm07G1zk5aFjb+4N3AeqyuSrivhyNnsmU893tv8JSSfHMn1YsXx7CLmHv
	 LbbLDfydmdtYbsJnBvwdiUoRHKoUgxGFcwoty+YIIKFei6Uu5FeGrzefs20clNJ3mBWLj
	 BzlylELYnHuUxhS6ypnCi1t/QbcTozO0z/AHP95IU2sg5ZkbYkIBucXI4PtSiwjp/6KVg
	 dsPyXtEjeRdfdtmhNGS5iMFNNIOzN116IOVlkqVNE0BkIvMy5yZ97971d57WZd6RGTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200798;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=I0mIEfKrh+OG6aMbh1RtChmDjrcCdI0o+FwIFSPo4i0=;
	b=BhKhi/BN12jbLYgXT0twyC2yBmkiLRJ3HWFO7cBtzuLI+KpNaQctTklLeNZzG/zlp2TY
	 xf4zSXqqd4fL7SghcCvydj7R1v1rIgws5bjZTN5vWjEct0vJMYy1sJQXKca2hOX/yKynR
	 gE3xaxjwb21SHKCtDJ1tv6uL3Ed3G1ZHo/VjYkdhJQCt+AS3cU8D5+VdZeL4Oo53rdbtF
	 Mxpybe73ZJwVSUdgtEahG79ho5xEQpDwZkvcC8aKmWdfE1tpdhUmQq9mMu+yMsOoMOp6k
	 j3TRCXS2+DYBQUyFhjcZw2v5CJ8cJKjBx4ZoOYPdQffT+8DvJYZlH1gOG5o5DJHuc4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Da0WFeEh;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373E7606A321
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 05:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373E7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Da0WFeEh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794200798; x=1825736798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7mgXhMWkDNTd4U/AC9/4Cse5wFGF5vQGtoELX1hRRDE=;
  b=Da0WFeEhCGygmaCGC9Co1/TF+bJmv+B0Ln/ZEs053XefByr4AkYYz7Rd
   u8HxuXOcEi/ajqb9DGFHxz+ekwIqjZxpxgVcVoHFAIJKd53zhGqHDR2gx
   cZvNrRqXHt7PS0jY8wA2smn15Qyx67a4JI3/Mkk2Ne2FEPhOiJYZ0z4N7
   /8jyWL3SDl9kIlSnswlwHE/YUxTDptVwYvAyt3+a5+ncDQv3W2D9u54qC
   Z5dhVSadzFpPwq8oxD6/hEt5abEhw67KRq5iMQJn82/3WtoS17r+ByKxr
   yk2TA3wKuQkXyO7xws/aopGurKiEcu/IZvcp0yZLXy5964NVGS16YTzBV
   A==;
X-CSE-ConnectionGUID: dFwMFEC8SoW1Us3sjuCg3A==
X-CSE-MsgGUID: TVXhltmcQtaBwCjQN8okeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2955484"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2955484"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 21:06:37 -0800
X-CSE-ConnectionGUID: LTiKh06qRGqSF1JIXPbTXQ==
X-CSE-MsgGUID: iZAdg29QRfmLSZVO2N3BEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7667701"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 08 Nov 2026 21:06:35 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQHaS-000000000EH-2t7F;
	Mon, 09 Nov 2026 05:06:32 +0000
Date: Mon, 09 Nov 2026 06:05:39 +0100
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-maple-clean 47/50] lib/dynamic_debug.c:301:39:
 warning: implicit conversion from 'unsigned long long' to 'unsigned long'
 changes value from 3458764513820540928 to 0
Message-ID: <202611090644.2AXd5ibO-lkp@intel.com>
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
config: hexagon-randconfig-2200-20261109 (https://download.01.org/0day-ci/archive/20261109/202611090644.2AXd5ibO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090644.2AXd5ibO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090644.2AXd5ibO-lkp@intel.com/

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
