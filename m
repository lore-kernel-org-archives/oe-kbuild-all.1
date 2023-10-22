Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D650365
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 00:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNUhlkep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697934456; x=1729470456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E37j0ivFcyOYnMjql27xRL/HctGBkTs207AD+ettDOM=;
  b=aNUhlkep00YL25vZ/12baLWGvD/xo70F8GwmFGOYX1NTBm+Z7c2Bobsl
   BrHQC+hyb+XIHKHZ7rquXmLxqXxmIaoS5iZgxBTqgUrTWPx81HPSoca7K
   mqmsrq+ZkSo9f3ijL9tLWYX80I9uDCwuUXHva84Y/bfftSNr+qpkEk00J
   wbe6u+wcHdhLElGSUPJVZMO3fhEC8oXxLIQ7/gGKeSIEf07wL3oZQ1fKJ
   qx6IVOx6DLU19d00S2siRl05jsQBtz+Q++vkiXsYD3AHxljWQvVK0oXpT
   JoSuVPtzbJ1p7gNb+2lyc8JKxElb7Z8TayW4rJcXQQLte3kKWuuEN/Bg2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="389520731"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="389520731"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 17:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="787134365"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="787134365"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Oct 2023 17:27:34 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quMJX-0005QY-2x;
	Sun, 22 Oct 2023 00:27:31 +0000
Date: Sun, 22 Oct 2023 08:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/insn/rework 21/38] /tmp/ccRK2cEo.s:12301: Error:
 selected processor does not support `cas x0,x1,[x2]'
Message-ID: <202310220834.Gw3vptJb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/insn/rework
head:   37bd99f160dd83ccdfd3f50c685259ae62a81e68
commit: 5d9576ce96543204f66edb880d92bf256439e09f [21/38] arm64: insn: rework CAS
config: arm64-randconfig-001-20231021 (https://download.01.org/0day-ci/archive/20231022/202310220834.Gw3vptJb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220834.Gw3vptJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220834.Gw3vptJb-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/lib/test_insn.c:1547:6: warning: no previous prototype for 'test_insn_ldp_pre' [-Wmissing-prototypes]
    1547 | void test_insn_ldp_pre(struct kunit *test)
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/lib/test_insn.c:1616:6: warning: no previous prototype for 'test_insn_stp_pre' [-Wmissing-prototypes]
    1616 | void test_insn_stp_pre(struct kunit *test)
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/lib/test_insn.c:1717:6: warning: no previous prototype for 'test_insn_ldp_post' [-Wmissing-prototypes]
    1717 | void test_insn_ldp_post(struct kunit *test)
         |      ^~~~~~~~~~~~~~~~~~
   arch/arm64/lib/test_insn.c:1780:6: warning: no previous prototype for 'test_insn_stp_post' [-Wmissing-prototypes]
    1780 | void test_insn_stp_post(struct kunit *test)
         |      ^~~~~~~~~~~~~~~~~~
   /tmp/ccRK2cEo.s: Assembler messages:
>> /tmp/ccRK2cEo.s:12301: Error: selected processor does not support `cas x0,x1,[x2]'
>> /tmp/ccRK2cEo.s:12452: Error: selected processor does not support `casa x1,x2,[x3]'
>> /tmp/ccRK2cEo.s:12611: Error: selected processor does not support `casl x4,x5,[x6]'
>> /tmp/ccRK2cEo.s:12770: Error: selected processor does not support `casal x7,x8,[x9]'
>> /tmp/ccRK2cEo.s:12929: Error: selected processor does not support `cas w0,w1,[x2]'
>> /tmp/ccRK2cEo.s:13066: Error: selected processor does not support `casa w1,w2,[x3]'
>> /tmp/ccRK2cEo.s:13225: Error: selected processor does not support `casl w4,w5,[x6]'
>> /tmp/ccRK2cEo.s:13384: Error: selected processor does not support `casal w7,w8,[x9]'
   /tmp/ccRK2cEo.s:14515: Error: selected processor does not support `swp x0,x1,[x2]'
   /tmp/ccRK2cEo.s:14664: Error: selected processor does not support `swpa x3,x4,[x5]'
   /tmp/ccRK2cEo.s:14825: Error: selected processor does not support `swpl x6,x7,[x8]'
   /tmp/ccRK2cEo.s:14984: Error: selected processor does not support `swpal x9,x10,[x11]'
   /tmp/ccRK2cEo.s:15143: Error: selected processor does not support `swp w0,w1,[x2]'
   /tmp/ccRK2cEo.s:15280: Error: selected processor does not support `swpa w3,w4,[x5]'
   /tmp/ccRK2cEo.s:15440: Error: selected processor does not support `swpl w6,w7,[x8]'
   /tmp/ccRK2cEo.s:15599: Error: selected processor does not support `swpal w9,w10,[x11]'
   /tmp/ccRK2cEo.s:16728: Error: selected processor does not support `ldset x0,x1,[x2]'
   /tmp/ccRK2cEo.s:16877: Error: selected processor does not support `ldseta x3,x4,[x5]'
   /tmp/ccRK2cEo.s:17036: Error: selected processor does not support `ldsetl x6,x7,[x8]'
   /tmp/ccRK2cEo.s:17197: Error: selected processor does not support `ldsetal x9,x10,[x11]'
   /tmp/ccRK2cEo.s:17358: Error: selected processor does not support `ldset w0,w1,[x2]'
   /tmp/ccRK2cEo.s:17495: Error: selected processor does not support `ldseta w3,w4,[x5]'
   /tmp/ccRK2cEo.s:17654: Error: selected processor does not support `ldsetl w6,w7,[x8]'
   /tmp/ccRK2cEo.s:17813: Error: selected processor does not support `ldsetal w9,w10,[x11]'
   /tmp/ccRK2cEo.s:18944: Error: selected processor does not support `ldeor x0,x1,[x2]'
   /tmp/ccRK2cEo.s:19093: Error: selected processor does not support `ldeora x3,x4,[x5]'
   /tmp/ccRK2cEo.s:19254: Error: selected processor does not support `ldeorl x6,x7,[x8]'
   /tmp/ccRK2cEo.s:19413: Error: selected processor does not support `ldeoral x9,x10,[x11]'
   /tmp/ccRK2cEo.s:19572: Error: selected processor does not support `ldeor w0,w1,[x2]'
   /tmp/ccRK2cEo.s:19709: Error: selected processor does not support `ldeora w3,w4,[x5]'
   /tmp/ccRK2cEo.s:19868: Error: selected processor does not support `ldeorl w6,w7,[x8]'
   /tmp/ccRK2cEo.s:20027: Error: selected processor does not support `ldeoral w9,w10,[x11]'
   /tmp/ccRK2cEo.s:21155: Error: selected processor does not support `ldclr x0,x1,[x2]'
   /tmp/ccRK2cEo.s:21304: Error: selected processor does not support `ldclra x3,x4,[x5]'
   /tmp/ccRK2cEo.s:21463: Error: selected processor does not support `ldclrl x6,x7,[x8]'
   /tmp/ccRK2cEo.s:21622: Error: selected processor does not support `ldclral x9,x10,[x11]'
   /tmp/ccRK2cEo.s:21781: Error: selected processor does not support `ldclr w0,w1,[x2]'
   /tmp/ccRK2cEo.s:21920: Error: selected processor does not support `ldclra w3,w4,[x5]'
   /tmp/ccRK2cEo.s:22080: Error: selected processor does not support `ldclrl w6,w7,[x8]'
   /tmp/ccRK2cEo.s:22238: Error: selected processor does not support `ldclral w9,w10,[x11]'
   /tmp/ccRK2cEo.s:23369: Error: selected processor does not support `ldadd x0,x1,[x2]'
   /tmp/ccRK2cEo.s:23518: Error: selected processor does not support `ldadda x3,x4,[x5]'
   /tmp/ccRK2cEo.s:23677: Error: selected processor does not support `ldaddl x6,x7,[x8]'
   /tmp/ccRK2cEo.s:23838: Error: selected processor does not support `ldaddal x9,x10,[x11]'
   /tmp/ccRK2cEo.s:23997: Error: selected processor does not support `ldadd w0,w1,[x2]'
   /tmp/ccRK2cEo.s:24134: Error: selected processor does not support `ldadda w3,w4,[x5]'
   /tmp/ccRK2cEo.s:24293: Error: selected processor does not support `ldaddl w6,w7,[x8]'
   /tmp/ccRK2cEo.s:24452: Error: selected processor does not support `ldaddal w9,w10,[x11]'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
