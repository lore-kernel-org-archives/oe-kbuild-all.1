Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794890395;
	b=0aFlWQUNPX1x4EKwowImOUWxu8+JHRvArO6w/mFaMarRXw1Glj2kej8DDAixpGExK8mr
	 Dhc1F+bbB9ex+MJtchPMvDPO6puSOyYc9B7twq5yjHMZ4Z9LEhIvn9pmm+UBJewX1DKDJ
	 Trf1zxGJijaLhgBcXKNDSz/a6FZD0ij4JU7Rgzl4O492QGsnCSRQTPPWucNOch7cJpYx9
	 eCGAPq4YJ01RcOkLfQwKxoZ/+3Iw5YN1sLrMK0fWZvPiN16zvBnccRuDdxXPgBJ7wSwiD
	 ALk5/WtD0qEuR7LZIGa7cSLVWGdLEtgdPFGLoZs27omU2IN+9V1erZSkHKjtpsGmePA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890395;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5wcCOHUaXeS5O9/ZL6MHsQ4ju+XWXmRTaSrhD2mFMXU=;
	b=sQOCIzvHXNI4szgF+a3NM4Vh1tX4BczPYSgjB/HLV4JJolORKVHQR9UdkzNoLMBAif/l
	 qe+94RSLJv1VDrKRtn8DKm24fgS9XhPnLB27SyNbxOTGys3z2OfC25GqKChCfhRuQDf2e
	 5fmHa3i5D8H/gPPPnDPpjdEWCbUfaYeib/Orv38xlluSW/gQXjhaGBLHdNmrjzwYMCqef
	 XFIWdq0rj+AJ4UD7Fg/LBN6uRBNiLLoTPdgXGCL5zjYRUND4t+Z+wjz9RndRMMyOrxly6
	 mckb2W/mb/SaI0uubDQCobU3JNJDY8WJDiqjZOMYfFehrY3kAJmUENumqvFRli/698Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KBBUDExv;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B23606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 04:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B23606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KBBUDExv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794890394; x=1826426394;
  h=date:from:to:cc:subject:message-id;
  bh=SrwUQ6EsZ3+VQN4QAkRK9NZIRkohzJ/7KFzspVKuKXY=;
  b=KBBUDExviGM3bXUzUCUIBjpJqDLsCNn8Tf7Q2taE4aKcS6q4LSPy9QxB
   /GeWdf6m6yRfRCcq5NYfIEsiKg0NbDvSr2L6IEuD/1h75HzheDNlfTAp3
   4245JlA4XigQ2mq/zoaHX1dk/jOzhIpHm1YdcS6Q7zSBhq5E7F5beIPpE
   +39579qwcMIn4joiMrIiDRyd4xIWfuj4yz+SF4cjHt9v4+ZsgoW8wpz98
   ydQmxaL4WIbr/cBtHT9vs6M6UTlJSC3zfM1ZLL2EjZTAxXeBsbawByH9r
   bkiQNrULgE1ErJSKKYNw8ch+22igsgVF7FR2uQ6M/9XGVC49MopYoT1RH
   A==;
X-CSE-ConnectionGUID: SJGGZiM8TEmdq5HtZQ3Vyw==
X-CSE-MsgGUID: t0D2nVduQryy91JvHxHvrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3547094"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3547094"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 20:39:53 -0800
X-CSE-ConnectionGUID: BKoc8vLxTUGLoXskkoWb5w==
X-CSE-MsgGUID: 823rrpqzTsS2DmeND9AVQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11457961"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 16 Nov 2026 20:39:52 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTAyy-000000002y6-0Ryk;
	Tue, 17 Nov 2026 04:39:48 +0000
Date: Tue, 17 Nov 2026 05:38:57 +0100
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: net/sched/bpf_qdisc.c:205:18: sparse: sparse: symbol
 'bpf_kfree_skb_dtor' was not declared. Should it be static?
Message-ID: <202611170522.FvyEK1yX-lkp@intel.com>
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
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: c99d97b46631c4bea0c14b7581b7a59214601e63 bpf: net_sched: Use the correct destructor kfunc type
date:   10 months ago
config: arm64-randconfig-r2300-20261117 (https://download.01.org/0day-ci/archive/20261117/202611170522.FvyEK1yX-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7864c0736a8a09670dfbfc513f1e9649799f2486)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170522.FvyEK1yX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c99d97b46631 ("bpf: net_sched: Use the correct destructor kfunc type")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170522.FvyEK1yX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sched/bpf_qdisc.c:205:18: sparse: sparse: symbol 'bpf_kfree_skb_dtor' was not declared. Should it be static?
   net/sched/bpf_qdisc.c:234:17: sparse: sparse: symbol 'bpf_qdisc_init_prologue' was not declared. Should it be static?
   net/sched/bpf_qdisc.c:261:18: sparse: sparse: symbol 'bpf_qdisc_reset_destroy_epilogue' was not declared. Should it be static?

vim +/bpf_kfree_skb_dtor +205 net/sched/bpf_qdisc.c

   204	
 > 205	__bpf_kfunc void bpf_kfree_skb_dtor(void *skb)
   206	{
   207		bpf_kfree_skb(skb);
   208	}
   209	CFI_NOSEAL(bpf_kfree_skb_dtor);
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
