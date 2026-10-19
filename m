Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD6D4AA1CC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 09:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403498; cv=none; b=OAMLQIPYKIgejjctMVK/ZsjP+tar0g0Wr/foiK4/3Yx0xE4SlZKWlQgsWrALFkmC7uFAJdyjVnF9jE89Qs5omspOOp/RYbCHVyhrfPBwhNRMhVRN6lQTO0h6joqCf8lhMEjj2E8S0jGZggjEORugZRtVNTLlhxY68mnVLGRq588=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403498; c=relaxed/simple;
	bh=EVF0qmHJDQol8D8jqArWKeH3H03QLz92qD2FF9Iu+tc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y+bIV+Kae1vAlNsATIh2UvZunUKDOC8JdFWuVOtoN3sRV2LOe8z0aie2RJEEPtoTQpXZfVxv/eLP6nhAR2VEWe9wSMXT17LStnfX+7VOsqMvWR/4OZTxhgibV58jfuozlODkYVE3+WqOEoA8TLUq9Bpv26RirdxojuDpcTrjq4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYehwklo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYehwklo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792403496; x=1823939496;
  h=date:from:to:cc:subject:message-id;
  bh=EVF0qmHJDQol8D8jqArWKeH3H03QLz92qD2FF9Iu+tc=;
  b=CYehwklo9dtBIRJySawx+cLWNFUcl3BoOneRZGmhJxuEpup8ooQ2PpIk
   cvjRBLxnIAryff1b3sFA/+yeWPnVz8k9a58owvxJeE6S48Yxh4EApWtcc
   TD6iMtTQR9zoNcpQFf0xymsOT7l4r8heY7aDjwhvATwmiNxxNqNenFkv+
   ZAz2QZ7RUsYlVdc//oPkYNquKOW+LMmKVSn5uuB3i6TTPKYLraDMMRTgO
   a0FD0JMb5qfSmzi/TCgCHb7G8w8cHi3MOPFXmuaj6pQcZxYholA0qILcj
   aB7PjEk+nIvO9xua/BBCTAYTXkGnbwB2LLPaHFFnc3mESdlyoVc6yGfpX
   Q==;
X-CSE-ConnectionGUID: SMONHIDdSIOkkaR1dpFQpg==
X-CSE-MsgGUID: /q0Ov3puTa+Z8ev7FyWgLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="980339"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="980339"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:51:36 -0700
X-CSE-ConnectionGUID: vkZCl1GmSpOAdSKL9utD/A==
X-CSE-MsgGUID: 8hlASqdNSkK2DZPiISFojA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2807709"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2026 02:51:34 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIk1k-000000005Zn-3gXE;
	Mon, 19 Oct 2026 09:51:32 +0000
Date: Mon, 19 Oct 2026 11:51:08 +0200
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:hexagon 43/82]
 arch/hexagon/kernel/hvx/hvx_main.c:32:19: sparse: sparse: symbol
 'vregs_cachep' was not declared. Should it be static?
Message-ID: <202610191152.FnHUQC5R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git hexagon
head:   35ab1dadb94646b74469738c1741f68e8c6aac3d
commit: 191e24d2f97b4950b8beeecfef04b9fd09f573e0 [43/82] hexagon: add HVX coprocessor context management
config: hexagon-randconfig-r2303-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191152.FnHUQC5R-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 337446dacd2a713010f1c9856c21eb8d899b5613)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191152.FnHUQC5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191152.FnHUQC5R-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/hexagon/kernel/hvx/hvx_main.c:32:19: sparse: sparse: symbol 'vregs_cachep' was not declared. Should it be static?
>> arch/hexagon/kernel/hvx/hvx_main.c:36:10: sparse: sparse: symbol 'hvx_refcount' was not declared. Should it be static?

vim +/vregs_cachep +32 arch/hexagon/kernel/hvx/hvx_main.c

    31	
  > 32	struct kmem_cache *vregs_cachep;
    33	
    34	struct rw_semaphore enabled;
    35	
  > 36	atomic_t hvx_refcount = ATOMIC_INIT(0);
    37	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
