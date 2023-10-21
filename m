Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3B2D521
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 15:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkMNJsi2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697903655; x=1729439655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lZr2whKbXLlVWkMxrWYFXyX4GFBvAUbKDkQMwIMk8hg=;
  b=HkMNJsi2+/KiDAnU7lpwiLZTFSG8t/wvi9sehq9dybV3f0KL7FwRzkq6
   9h80pLM8+k+Er/8LbPSY2uqOzM71E9tsznNqjebeEHuOKMkQEhg0W+0JF
   MF1YCJ2Ehrt7LkhTJpnpO7syCShuCTbyWEsW/iDF8kvIZdY+f/YmoQh0i
   D5EVFx9UBhFXLOtwKu1FYWgR1aA1UfooxsHrP3aH5nqMkheGY35O6Qx1K
   jFOek3Z0+iJJROF7cdGZ03TZ9XtiXGVKYBdujmiYQqjfku+NkCMUJ3hof
   5hhlwmzMhQwKSERWVrb6sEO8ToIssL0YmxygR1MnW4sWnfEoz/7avpy1L
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="8201616"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="8201616"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 08:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="848385249"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="848385249"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Oct 2023 08:54:13 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quEIk-0004yw-2I;
	Sat, 21 Oct 2023 15:54:10 +0000
Date: Sat, 21 Oct 2023 23:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/insn/rework 20/38] /tmp/cc2HuQAs.s:12301: Error:
 selected processor does not support `swp x0,x1,[x2]'
Message-ID: <202310212327.tzrr8dx1-lkp@intel.com>
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
commit: f82366f5dba87ae3c11b12a239c596fbf571273a [20/38] arm64: insn: rework LSE atomic load ops
config: arm64-randconfig-001-20231021 (https://download.01.org/0day-ci/archive/20231021/202310212327.tzrr8dx1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310212327.tzrr8dx1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310212327.tzrr8dx1-lkp@intel.com/

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
   /tmp/cc2HuQAs.s: Assembler messages:
>> /tmp/cc2HuQAs.s:12301: Error: selected processor does not support `swp x0,x1,[x2]'
>> /tmp/cc2HuQAs.s:12452: Error: selected processor does not support `swpa x3,x4,[x5]'
>> /tmp/cc2HuQAs.s:12611: Error: selected processor does not support `swpl x6,x7,[x8]'
>> /tmp/cc2HuQAs.s:12770: Error: selected processor does not support `swpal x9,x10,[x11]'
>> /tmp/cc2HuQAs.s:12929: Error: selected processor does not support `swp w0,w1,[x2]'
>> /tmp/cc2HuQAs.s:13066: Error: selected processor does not support `swpa w3,w4,[x5]'
>> /tmp/cc2HuQAs.s:13225: Error: selected processor does not support `swpl w6,w7,[x8]'
>> /tmp/cc2HuQAs.s:13384: Error: selected processor does not support `swpal w9,w10,[x11]'
>> /tmp/cc2HuQAs.s:14513: Error: selected processor does not support `ldset x0,x1,[x2]'
>> /tmp/cc2HuQAs.s:14662: Error: selected processor does not support `ldseta x3,x4,[x5]'
>> /tmp/cc2HuQAs.s:14823: Error: selected processor does not support `ldsetl x6,x7,[x8]'
>> /tmp/cc2HuQAs.s:14982: Error: selected processor does not support `ldsetal x9,x10,[x11]'
>> /tmp/cc2HuQAs.s:15141: Error: selected processor does not support `ldset w0,w1,[x2]'
>> /tmp/cc2HuQAs.s:15278: Error: selected processor does not support `ldseta w3,w4,[x5]'
>> /tmp/cc2HuQAs.s:15438: Error: selected processor does not support `ldsetl w6,w7,[x8]'
>> /tmp/cc2HuQAs.s:15597: Error: selected processor does not support `ldsetal w9,w10,[x11]'
>> /tmp/cc2HuQAs.s:16726: Error: selected processor does not support `ldeor x0,x1,[x2]'
>> /tmp/cc2HuQAs.s:16875: Error: selected processor does not support `ldeora x3,x4,[x5]'
>> /tmp/cc2HuQAs.s:17034: Error: selected processor does not support `ldeorl x6,x7,[x8]'
>> /tmp/cc2HuQAs.s:17195: Error: selected processor does not support `ldeoral x9,x10,[x11]'
   /tmp/cc2HuQAs.s:17356: Error: selected processor does not support `ldeor w0,w1,[x2]'
   /tmp/cc2HuQAs.s:17493: Error: selected processor does not support `ldeora w3,w4,[x5]'
   /tmp/cc2HuQAs.s:17652: Error: selected processor does not support `ldeorl w6,w7,[x8]'
   /tmp/cc2HuQAs.s:17811: Error: selected processor does not support `ldeoral w9,w10,[x11]'
   /tmp/cc2HuQAs.s:18942: Error: selected processor does not support `ldclr x0,x1,[x2]'
   /tmp/cc2HuQAs.s:19091: Error: selected processor does not support `ldclra x3,x4,[x5]'
   /tmp/cc2HuQAs.s:19252: Error: selected processor does not support `ldclrl x6,x7,[x8]'
   /tmp/cc2HuQAs.s:19411: Error: selected processor does not support `ldclral x9,x10,[x11]'
   /tmp/cc2HuQAs.s:19570: Error: selected processor does not support `ldclr w0,w1,[x2]'
   /tmp/cc2HuQAs.s:19707: Error: selected processor does not support `ldclra w3,w4,[x5]'
   /tmp/cc2HuQAs.s:19866: Error: selected processor does not support `ldclrl w6,w7,[x8]'
   /tmp/cc2HuQAs.s:20025: Error: selected processor does not support `ldclral w9,w10,[x11]'
   /tmp/cc2HuQAs.s:21153: Error: selected processor does not support `ldadd x0,x1,[x2]'
   /tmp/cc2HuQAs.s:21302: Error: selected processor does not support `ldadda x3,x4,[x5]'
   /tmp/cc2HuQAs.s:21461: Error: selected processor does not support `ldaddl x6,x7,[x8]'
   /tmp/cc2HuQAs.s:21620: Error: selected processor does not support `ldaddal x9,x10,[x11]'
   /tmp/cc2HuQAs.s:21779: Error: selected processor does not support `ldadd w0,w1,[x2]'
   /tmp/cc2HuQAs.s:21918: Error: selected processor does not support `ldadda w3,w4,[x5]'
   /tmp/cc2HuQAs.s:22078: Error: selected processor does not support `ldaddl w6,w7,[x8]'
   /tmp/cc2HuQAs.s:22236: Error: selected processor does not support `ldaddal w9,w10,[x11]'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
