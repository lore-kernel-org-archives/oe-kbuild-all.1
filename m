Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793231315;
	b=cBBYJ29EEfw/+znyIh+9FjsvpTAnS9ikFQPt+QlsS/xe1/kw1m3em61a2zsaHFL3ntpO
	 /QxVmy5tfbQZiT9jqXK/xja7Ay9ZUXRt+hSYFiOOFP2lWAc2L+vkIrZo66JmMqXFlkCiA
	 xV2+fo7tXS2YnyyZOYw0ztVm1WLA7dIRduF8xgoXtkh+Lj3ZO4EYgEvSe5m5/H9t3LziF
	 PV7iq5liHA5bjnxU+HbhU0PqbAAyYz/7gqGJIepfFqaO5slKzVLMIIRMbTdGxRanN25OQ
	 A7em0RmSoBE0ES8+U5fzBRlq9Q+AZYY8vVZC54qiGbAANPs0+srAChFWOfDP7S6+2OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231315;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gx4YnWd0RuhWVEj2KXrTCEPRdD4zNOLsmaJqgNJXgEo=;
	b=ALRP9zjR16iVzK0TUskXe6EAfMGkjg3csXi3awF3TUl2G/qid6ATAPYauvDc602BGKpT
	 senp/cBFt4en2ZEpv3waPTLDP1/EPcyaokw9q5Fq0f+Icuhuw29vqn3tBZNAcJ4fQNPLr
	 eqsNOD8Cr7wYjAceHUakJUes8pyk9gcDtSWIxHvZKyXO8+YnghpVZq6KebRGc8KHW3kun
	 6MBPdRdRQnEha46N2GqRdf5UcOAetNTdpOo6JnWU2EEtUpUQqHgO/Tiik1Sy4ullGTPLF
	 gR4JN2nOGv2PPsHOubs6tD51OGEd3EhQS+0mUjX2NEiADNg/HnDDaHxYu+/fES0BE3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MteLtUYJ;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B13606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 23:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46B13606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MteLtUYJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793231313; x=1824767313;
  h=date:from:to:cc:subject:message-id;
  bh=RwGFJzWaW7zQV3QZcbKz06dkZ/yftBFwjZc0X9dSepM=;
  b=MteLtUYJGtD+yvnyAKNpgoPDPRn7yD+fiv1K/iScWv0KTDriS67Xw7QX
   9swwbNzNCexhoranCq4/96Lxz8aXZ/rvbQaTa8Igh+wZv9okBVfmaK/Ec
   2DSxtaw0e5fhRtiCiv0hMi+wVPNCy5a7DoXnw2Bqu61TS/p9RUbRN2LCC
   j+wd3xsVXXxHYXlDeKtdq/kkb9ZbzChgaKUUVlPDBvzqu2gNVN5k+I5VX
   DJ7H0NaMaLeQ4CeSm+ttFuiyByDQGg3yrCbGwzDLS67n6lsSJMlcAxoxo
   DF4RZqkCY2FAMI5Vrba43mMa/zOLOm+VqnbmVD04t4fVFhghdfkPSgMWs
   g==;
X-CSE-ConnectionGUID: t7Cfps/kRiOqaPlZ9iHknw==
X-CSE-MsgGUID: ouD4fpv0RgyD7nNaASoFCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1850674"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1850674"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 16:48:33 -0700
X-CSE-ConnectionGUID: Aqj5DFUtR6e6/FZ3//FEwA==
X-CSE-MsgGUID: ssXrVvRKRFuKB/M4+AeKVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5089741"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2026 16:48:31 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMDNd-0000000051V-1aIP;
	Wed, 28 Oct 2026 23:48:29 +0000
Date: Thu, 29 Oct 2026 00:48:03 +0100
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett (Google)" <liam@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liam:dense_ulong 45/78]
 ../shared/../../../lib/maple_tree.c:1351:9: warning: conversion from 'long
 unsigned int' to 'unsigned char' changes value from '328' to '72'
Message-ID: <202610290058.uXA1lSMd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Liam,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git dense_ulong
head:   277d19606698f779124c1292179783067d370552
commit: 3fe972a54701c67fc32537f557f5975b4bce4a7e [45/78] maple_tree: Add 32b node write support and transition
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261029/202610290058.uXA1lSMd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290058.uXA1lSMd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290058.uXA1lSMd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ../shared/maple-shim.c:10:
>> ../shared/../../../lib/maple_tree.c:1351:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '328' to '72' [-Woverflow]
    1351 |         MA_TYPE_LAYOUT(maple_leaf_64, MAPLE_RANGE64_SLOTS - 1, 64,
         |         ^~~~~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:1353:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '328' to '72' [-Woverflow]
    1353 |         MA_TYPE_LAYOUT(maple_range_64, MAPLE_RANGE64_SLOTS - 1, 64,
         |         ^~~~~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:1355:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '384' to '128' [-Woverflow]
    1355 |         MA_TYPE_LAYOUT(maple_leaf_32, MAPLE_RANGE32_SLOTS - 1, 32,
         |         ^~~~~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:1357:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '384' to '128' [-Woverflow]
    1357 |         MA_TYPE_LAYOUT(maple_range_32, MAPLE_RANGE32_SLOTS - 1, 32,
         |         ^~~~~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:1359:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '288' to '32' [-Woverflow]
    1359 |         MA_TYPE_LAYOUT(maple_arange_64, MAPLE_ARANGE64_SLOTS - 1, 64,
         |         ^~~~~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:1361:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '340' to '84' [-Woverflow]
    1361 |         MA_TYPE_LAYOUT(maple_arange_32, MAPLE_ARANGE32_SLOTS - 1, 32,
         |         ^~~~~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:1361:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '256' to '0' [-Woverflow]
   ../shared/../../../lib/maple_tree.c:1363:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '296' to '40' [-Woverflow]
    1363 |         MA_TYPE_LAYOUT(maple_mleaf_64, MAPLE_MRANGE64_SLOTS - 1, 64,
         |         ^~~~~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:1363:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '304' to '48' [-Woverflow]
   ../shared/../../../lib/maple_tree.c:1365:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '296' to '40' [-Woverflow]
    1365 |         MA_TYPE_LAYOUT(maple_mrange_64, MAPLE_MRANGE64_SLOTS - 1, 64,
         |         ^~~~~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:1365:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '304' to '48' [-Woverflow]
   ../shared/../../../lib/maple_tree.c:1367:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '336' to '80' [-Woverflow]
    1367 |         MA_TYPE_LAYOUT(maple_mleaf_32, MAPLE_MRANGE32_SLOTS - 1, 32,
         |         ^~~~~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:1367:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '344' to '88' [-Woverflow]
   ../shared/../../../lib/maple_tree.c:1369:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '336' to '80' [-Woverflow]
    1369 |         MA_TYPE_LAYOUT(maple_mrange_32, MAPLE_MRANGE32_SLOTS - 1, 32,
         |         ^~~~~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:1369:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '344' to '88' [-Woverflow]
   ../shared/../../../lib/maple_tree.c:1371:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '504' to '248' [-Woverflow]
    1371 |         MA_TYPE_LAYOUT(maple_dense, 0, 64, .slot = MA_OFFSET(slot),
         |         ^~~~~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:1374:9: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '328' to '72' [-Woverflow]
    1374 |         MA_TYPE_LAYOUT(maple_copy, 3, 64, .slot = MA_OFFSET(cp.slot),
         |         ^~~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
