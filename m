Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F43EF9D6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 21:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754254882; cv=none; b=WlbmdsG/9V/t57oldwNA8cRR6FruHt4jGg6rjwpNpX+MEpiztFIDdIRx6Sq2VcM12nNE3Aw8zRFocb3EFEsImmbWNS+2zM7W1OnTrOyFX+jlYa+NKNTN3mk8+0CtLvM5a3jUcEod+3oF65+yPIgT1Bo2vepqvsGiyMStLln3Tyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754254882; c=relaxed/simple;
	bh=PM7Ik/hIBqUfdkqp+g94nLpywA2UUhp8JOE4B2IibWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0R43zcAKHh+vo7UsGjpUbIZcP8x1jWYu0m/JAoCj0ptxFlCMvL5ftzaP2j+/9yf63MZlRom/6RAU8W0+p1NwewEPAqmepU4uV+3plK9BUdC1EQe3po+ImDczdcpoy/+QeW9E+JUChfDaindV9pKy95PHGe9KT2nOR8SGxWVqVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eG2T7nen; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eG2T7nen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754254880; x=1785790880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PM7Ik/hIBqUfdkqp+g94nLpywA2UUhp8JOE4B2IibWc=;
  b=eG2T7nenTa8bXr+1qnlzCr5KVRSigrcAWpJKvRxlHAMVEoGOUQ/XY1Qq
   p0cjqfF1MQqfNw5c/BfV/Kv91xvjK3N+1F1cDnFMlLc3VUrNjwvp0wb0H
   AfpeB0UaT8gyisfynElOr344T2Ck1tvaXzPLnolDXdCNd73bM/DAiwSS4
   as7wUES+WeVG1JVSj5yUJirWVW+RJPfDG0Qf+rHiqCMiOs0VOe8COBPFs
   8iJR38m/FQOZPW7zoaZhK4Q+P5TvrKYEnq2/TWTaNtEFh93e2O5cryE09
   ymBo7HzCNWpXnzQ5dVsLOF7kOfocq0N72qcxvd63J+io1t+jco54rCw2j
   Q==;
X-CSE-ConnectionGUID: EkTvB0OPQgSgg+H74QYvWA==
X-CSE-MsgGUID: B59gf8GVQ/iayzmKtoDM6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56387871"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56387871"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 14:01:17 -0700
X-CSE-ConnectionGUID: gtCXOTyCSI+eSPDK5SP40g==
X-CSE-MsgGUID: mFKcPwYYQq2Bnge/Z3cnYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169377769"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Aug 2025 14:01:17 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uifpS-0006dW-1k;
	Sun, 03 Aug 2025 21:01:14 +0000
Date: Mon, 4 Aug 2025 05:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.16/prjc 568/573] Warning: kernel/sched/alt_core.c:3662
 function parameter 'prev' not described in 'prepare_task_switch'
Message-ID: <202508040453.4sesyMZK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.16/prjc
head:   9c89892c1b23ef0227b09601fbd77ba0047aedac
commit: 812f0876228094f183754ea0d7fca52dbb245da5 [568/573] sched/alt: [Sync] 676e8cf70cb0 sched,livepatch: Untangle cond_resched() and live-patching
config: x86_64-buildonly-randconfig-001-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040453.4sesyMZK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040453.4sesyMZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040453.4sesyMZK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/sched/alt_core.c:3662 function parameter 'prev' not described in 'prepare_task_switch'
>> Warning: kernel/sched/alt_core.c:3695 Excess function parameter 'rq' description in 'finish_task_switch'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
