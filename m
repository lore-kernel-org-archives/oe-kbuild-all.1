Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0102E2594
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 02:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743301551; cv=none; b=nhPBJnfTPQICUfDVog8mns/eGPpS9DysCCU4uooG3Q5kvQEaTqOqEmXH2Re62rqzVlxSC6hVBfZ5zNke6KFMYP3OzN0Hc3tBCwnG7h75rk/DH/4tgRvSlAKvOOS7kiIt8dkoa1fEflWyInbjIGew5OEamobh3TbFrNtjfSqSPRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743301551; c=relaxed/simple;
	bh=MxjsXHq4Qn73+x27HdeXst3ZF8+cblBHvvBqyvCoNDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bJnw/bQcRZoKiTLSSp+K34ytvjvSkvCHoPrMFaZL55GWyjHykDcjFUEsfoNsoenHKu5IJ02BqJ6miLTNvrk7e+QuGFZ2qPA0GY7AjkCxU9RloLb0Dc+jU/RBT8bDEMG+cB0/Uob8gQNZU95fwjTC7x7H1ur1/p2GBA1vf3E8sbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+nkAVbi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+nkAVbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743301549; x=1774837549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MxjsXHq4Qn73+x27HdeXst3ZF8+cblBHvvBqyvCoNDI=;
  b=I+nkAVbirE56+6vdNLG8euxynxZPnroeevI9aSBwsn4qPRat9h/3E2vW
   A9YOrebxeLeNvpLbYldzeSge0R9aZfXY2cgqyJv4K5T+QF/hmu+UWPzov
   zyCUAVy4xQlM2afhNX8HmwbN6eipKtgg6f/LSyuKKAs9cambx9mjuHdm6
   E1mfSL3hhblXRarTgT5rUFLODnrnnu3sdyNrKo/7jZVUhbPx/fW7xxk2r
   Nt1mmKrPWY4qhtO5OQLDtjpAZ64ljaCne56efzdZirR5ZE1pG7+4+4VzS
   FlJy2UXaECnKKRU+EE3S+NvGrLHUWkqVxwMdFEjitAKWsQJhd5T58PBfx
   g==;
X-CSE-ConnectionGUID: 1XM4uIb0StyKDrjNMibuSA==
X-CSE-MsgGUID: Ql69pxI4TVSXsfZoW/PdgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="48286646"
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="48286646"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 19:25:48 -0700
X-CSE-ConnectionGUID: SkNq6dH9TS2GL9nGCSZs9Q==
X-CSE-MsgGUID: pcWGE7PJQ8GHIDHJuQcAdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="156773104"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Mar 2025 19:25:47 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyiMr-0008Tm-04;
	Sun, 30 Mar 2025 02:25:45 +0000
Date: Sun, 30 Mar 2025 10:25:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1531/1531] block/blk-mq.o: warning:
 objtool: blk_mq_unfreeze_queue()+0x75: unreachable instruction
Message-ID: <202503301024.26J3J3nq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5b56c883c34a890a3f9ca7baa8aea426538c88a8
commit: cbd9fe6e727ed12c1e542f74514e6dd4419f1cf6 [1531/1531] blk-mq: fix hang caused by freeze/unfreeze sequence
config: x86_64-buildonly-randconfig-005-20250329 (https://download.01.org/0day-ci/archive/20250330/202503301024.26J3J3nq-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503301024.26J3J3nq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503301024.26J3J3nq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/blk-mq.c:600:44: warning: passing 8-byte aligned argument to 32-byte aligned parameter 2 of 'smp_call_function_single_async' may result in an unaligned pointer access [-Walign-mismatch]
     600 |                 smp_call_function_single_async(ctx->cpu, &rq->csd);
         |                                                          ^
   1 warning generated.
>> block/blk-mq.o: warning: objtool: blk_mq_unfreeze_queue()+0x75: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
