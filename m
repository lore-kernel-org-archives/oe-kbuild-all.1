Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792988094;
	b=QmbacWR/KWPrFlSJpNb+iYAV1lzOmAtCt28ab1AxY/P26PEfqwqWyQfhZptJS6xYD/E4
	 ze3UZrr828EA46bYR1IDvwIipxoVNfhlBSY0wQgB1x2RYiqXmwnK+2mgaCXv+P8PQK2Wg
	 jIr6i/vi9WDkus9P+rVPvMT22A/sfMgpDRBGQRa+mu7QrHyPw46l+8fjIwpWufQQdoWWl
	 RBtX/15RQhPCDwlxYO5AFp8+odmVu90iKcXAT6w92dNR39Eyb9XpoPsrKNxmRSWgmGfZ6
	 gRFiVkJhdbJUkOmxuDn29UhPcCQLic5poLv6PAnbwnas3/34+VQOjiHc43IbMe2dAKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792988094;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=U0lsUm6vQcC+cJrLaJ31CeRLm8PZqdXTs6jSddBx944=;
	b=0oWsrVe6EohbLXsY12mR9/qMWgyrz27WZQXHzYa4jpiKP1sDy7n7KC3477J8zIljtnr9
	 cuUvQ/wxYdfQARKmq3k9Xx4lYFUbdlKwBnHwgnx9o6JLboCgWYIXNFoMPGHTKc3PTTdbX
	 6EKkW+vj4Ku6pvsWx4YWmJQX8+U0gmSp7Z3lK7t8xDQ2sxBJ6r2ZLAhLOtBEDA/yatFYD
	 od1th+HS81awAnlYh+6Z4XE8zisw00rBbR6LFUqZc0D/NLcWuEycp31yPCJThMuiMU0pB
	 TSYvu8TQuLSBKct6rBQLmgT1scYOxmZXxPUcw0N/RI9CAARG3CUTPuc3EWm4sNrk/sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UneeJXVR;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE59606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 04:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EE59606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UneeJXVR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792988092; x=1824524092;
  h=date:from:to:cc:subject:message-id;
  bh=siU+CORpgA9jgcW21HXjdoETvy5g12eYwRZdNRDN+n8=;
  b=UneeJXVRaw8P47ngJM28INZjPcdybgN7MU/XZZ4xTyn86a+rXzWG7Y9R
   /QfG3c+oqvCYn5T41rvYi266o/L/fEMjymsPlHvKp2DzyEwt+GoTkRtCH
   kaEBwe5LERGyG94mI62Zyp6LbqKp1RpPSTWwiF0y6NlSLEv7QzOjQH0C3
   HgHu7vnYMP2mXrMU2/T1RMCOrz4XoM9twJOxZnyBE8hEv9uncLVazpE0o
   VZuRs/CTA5Swj3necb5a4FLLddd2tsHPTI590ZCfVhMJo1OZ5pPacCoIX
   RDQlKCz4dfdci0p21MPoD4kHTDWmLaLhz8iJwzQ+/mdWIDsHH/Tku4A5J
   w==;
X-CSE-ConnectionGUID: SIaq9QzsTsubPG4DyeJxAg==
X-CSE-MsgGUID: ugwS5ff/RJCX3HOLwh7jyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1530327"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1530327"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 21:14:30 -0700
X-CSE-ConnectionGUID: 2T9kM6twRYyzYk5Irladtg==
X-CSE-MsgGUID: mFm6MwjRStG8Dle66q4/lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4669731"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 25 Oct 2026 21:14:28 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLC6L-000000003xj-3AJO;
	Mon, 26 Oct 2026 04:14:25 +0000
Date: Mon, 26 Oct 2026 05:13:46 +0100
From: kernel test robot <lkp@intel.com>
To: David Collins <david.collins@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: include/linux/compiler_types.h:631:38: error: call to
 '__compiletime_assert_394' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <202610260532.Zb5KDgRE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   390febb5805d3bb830402679f277f1d5f309e6bc
commit: 815be38ad8c8503cec8b2c0c632e975692ab42e1 spmi: spmi-pmic-arb: add support for PMIC arbiter v8
date:   9 months ago
config: mips-randconfig-r2101-20261026 (https://download.01.org/0day-ci/archive/20261026/202610260532.Zb5KDgRE-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610260532.Zb5KDgRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 815be38ad8c8 ("spmi: spmi-pmic-arb: add support for PMIC arbiter v8")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610260532.Zb5KDgRE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/spmi/spmi-pmic-arb.c: In function 'periph_interrupt':
>> include/linux/compiler_types.h:631:38: error: call to '__compiletime_assert_394' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:612:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:631:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:90:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, val, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:137:3: note: in expansion of macro '__FIELD_PREP'
      __FIELD_PREP(_mask, _val, "FIELD_PREP: ");  \
      ^~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:127:3: note: in expansion of macro 'FIELD_PREP'
      FIELD_PREP(HWIRQ_IRQID_MASK, (irq_id))  | \
      ^~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:686:12: note: in expansion of macro 'spec_to_hwirq'
               spec_to_hwirq(sid, per, id, apid));
               ^~~~~~~~~~~~~


vim +/__compiletime_assert_394 +631 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  617  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  618  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  619  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  620  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  621  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  622   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  623   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  624   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  625   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  626   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  627   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  628   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  629   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  630  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @631  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  632  

:::::: The code at line 631 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
