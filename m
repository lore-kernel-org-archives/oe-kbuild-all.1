Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E18F3C108F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 04:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785816463; cv=none; b=SW3rEzKnjLltrNBjyvLVDJP7dv1hWR0TrdfDmHcqVx5Q0kj2v5udc9+W+dxR+pK7EID3mCd1Iob+TGnthe2AGqVi0NmekG5ivkoTeHKaqJ9wZoKwKFH9nStsxKhd55hGHELVzEn9+Xx9+0I6MYkYYwVA8rg6VjLpFKI3mXvOINY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785816463; c=relaxed/simple;
	bh=ENULyTb/BLVtsDtRikWthKyz14/OkwKjHeHzyGN9Q1I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=igg1+Hf2MWokSpyouMZ5NOa4T16IBoOlLPc1Bo5TL9f4AHyENhrMM0m4QHVULv91Q8+maD56OUuyqHmov7U62snquxx0o9ykmLo40xzJYTyQR8dsiC6Ie025ZvBLDnrN/xPLBXXxCBmZZyjnfPgBqHciwKN2MfqWaj4jKD/qmjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htWjsodo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htWjsodo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785816462; x=1817352462;
  h=date:from:to:cc:subject:message-id;
  bh=ENULyTb/BLVtsDtRikWthKyz14/OkwKjHeHzyGN9Q1I=;
  b=htWjsodowGWfN1SfUW6kfDMzmP7oxlbIaLq0IlCHp4WJXWgS7dvEq5Xe
   0TSKKdlcsLCbuUg/JFq7QhCKcFr5gs2S+JKCwy5K3hN6vnN99xdyqsbTw
   6NAYJuG5nnVh2waDT5Q3jBJtLGSow2C3RmwybGXXSbRGSJdzV7/H33YFW
   mAHYG5jY8bdP9KP3vy8pmi+LMt9vIcLAZ27JcfBrvQJ7CoS86AoeF7aWP
   LbRqZB8ONDXj2WTpSMiV8sPkw8xngnPAZPELecnArf9fKcOPBXdSQVuKM
   fVkZEAStAbhMqs6wwNhsIZKvAKgNCWx0DFPm9h69Ur8Gf3ZGqLlMBIXlX
   Q==;
X-CSE-ConnectionGUID: /iguvBzLR+ujiAlZcV0APA==
X-CSE-MsgGUID: g9ug5DPvQ5SR0Me2WlLi/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="90247430"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="90247430"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 21:07:41 -0700
X-CSE-ConnectionGUID: pDZC1EGPRtK2Hrm4GYv63A==
X-CSE-MsgGUID: 29dHG57ZRP650ik0B/dqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="266516143"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Aug 2026 21:07:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr6RE-000000008rv-3W0I;
	Tue, 04 Aug 2026 04:07:36 +0000
Date: Tue, 04 Aug 2026 12:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun@kernel.org>
Subject: [boqun:rust-sync 24/24] ERROR: modpost:
 "_local_interrupt_disable" [kernel/irq/refcount_interrupt_test.ko] undefined!
Message-ID: <202608041122.YhAaj2Ig-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   01f609820dfd3182c99ce8a00723ca23798a8056
commit: 01f609820dfd3182c99ce8a00723ca23798a8056 [24/24] EXP: Avoid export local_interrupt_disable_state
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608041122.YhAaj2Ig-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041122.YhAaj2Ig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041122.YhAaj2Ig-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "_local_interrupt_disable" [kernel/irq/refcount_interrupt_test.ko] undefined!
>> ERROR: modpost: "_local_interrupt_enable" [kernel/irq/refcount_interrupt_test.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
