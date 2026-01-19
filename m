Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25138224AF0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768791132; cv=none; b=cZ3Qc5eim1Ldw4EwZC0wvbCxdSID9rssXNKwf++2eZsTJmbmEOEOGAb+uXxrfIgKdxIYkjoQXR0rJ2AFkkL5DjzhATRTKhcm1upHxH/App1WsHVEFUNLreG1CvgXWie5IifVwimPVIzUMLvCt+nQxqWXC8mukW0CD5F6GFKMrcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768791132; c=relaxed/simple;
	bh=FjQINg43P2qt+nt8zmOQdPGhMosk1d+OnVMKt+wUQGc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U/CJBNAdHGmLkO4vBbOTE63sSOvRvn9KT9bsNelZRFfjmVEc69hStCo9JxOQbhmmD9yuifSI7crUwYSCvr2PFBoVkIT0rGd/G/d7wMjJZGFAJTV1diqPMNjIu1vkQVatkQSMhXxZPYzIfenGpk0Pcy4RLLnRSWyNEGdZJYUAUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpFkK147; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpFkK147"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768791129; x=1800327129;
  h=date:from:to:cc:subject:message-id;
  bh=FjQINg43P2qt+nt8zmOQdPGhMosk1d+OnVMKt+wUQGc=;
  b=OpFkK147tvpnj7SwojWcVO3+F4e8rRKKLTP3LXiCvyPwx15o8K76LCfW
   9IL156ydp/Y1pMF64dP47VLkBnWJXoU55kAeXBrNCzU3sBV4WsU/oDYgO
   Th/zDcPWR5/Fc0muTAJuoVc0yLPFnxj7fJwm8uTVBbRFSnFUZLAt16ESL
   9iwBCvXVlBnZSoEBEYuyRd7Q5GRUiTCQKHLsyeHccKbwyNPtuha/vn27j
   wXKcbGmsOx24VJpanSLBpQeo5CPKqTbtOJLxixoEZBbuMI6zSytPupAOY
   7E/wH9/KKiYl5WeO9PNnA1iUiy5/4tCrE5v/A1grEorU4yyiEOWOx9LcN
   Q==;
X-CSE-ConnectionGUID: JNJOnzuSQn+J+uT3sFMTXQ==
X-CSE-MsgGUID: 9Rf13ePyRX2GPvv0O/ogVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="57553680"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="57553680"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 18:52:04 -0800
X-CSE-ConnectionGUID: szNbsq2IT9OLrzatehof0w==
X-CSE-MsgGUID: ccYcXIDHR+mH+ZsrZvNPvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="205785009"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Jan 2026 18:52:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhfN2-00000000NO1-0B90;
	Mon, 19 Jan 2026 02:52:00 +0000
Date: Mon, 19 Jan 2026 10:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: Amery Hung <amery.hung@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Martin KaFai Lau <martin.lau@kernel.org>
Subject: net/sched/bpf_qdisc.c:224:18: sparse: sparse: symbol
 'bpf_qdisc_init_prologue' was not declared. Should it be static?
Message-ID: <202601191053.nOFAvLPG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e84d960149e71e8d5e4db69775ce31305898ed0c
commit: 7a2dafda950b78611dc441c83d105dfdc7082681 bpf: net_sched: Add a qdisc watchdog timer
date:   9 months ago
config: s390-randconfig-r133-20260115 (https://download.01.org/0day-ci/archive/20260119/202601191053.nOFAvLPG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191053.nOFAvLPG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191053.nOFAvLPG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sched/bpf_qdisc.c:224:18: sparse: sparse: symbol 'bpf_qdisc_init_prologue' was not declared. Should it be static?
>> net/sched/bpf_qdisc.c:234:18: sparse: sparse: symbol 'bpf_qdisc_reset_destroy_epilogue' was not declared. Should it be static?

vim +/bpf_qdisc_init_prologue +224 net/sched/bpf_qdisc.c

   222	
   223	/* bpf_qdisc_init_prologue - Hidden kfunc called in prologue of .init. */
 > 224	__bpf_kfunc void bpf_qdisc_init_prologue(struct Qdisc *sch)
   225	{
   226		struct bpf_sched_data *q = qdisc_priv(sch);
   227	
   228		qdisc_watchdog_init(&q->watchdog, sch);
   229	}
   230	
   231	/* bpf_qdisc_reset_destroy_epilogue - Hidden kfunc called in epilogue of .reset
   232	 * and .destroy
   233	 */
 > 234	__bpf_kfunc void bpf_qdisc_reset_destroy_epilogue(struct Qdisc *sch)
   235	{
   236		struct bpf_sched_data *q = qdisc_priv(sch);
   237	
   238		qdisc_watchdog_cancel(&q->watchdog);
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
