Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9031A1F3BAC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Apr 2026 01:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776909517; cv=none; b=HJ+H3NXUvyhhCsJgGbU0hJyuVvwuPzh2nHrSFIFV03Ai172sP7caeexdFp2I0Ha50VQiavoyU7m4hIhNpNg4whq6gWq3DJy6gtilHKzXPQabbIgjIRHvhsvIkWufxisJ+emp19CRW42nix4V9g+gVZVgkzXaqv+cxDGhnCFselY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776909517; c=relaxed/simple;
	bh=aU7G0geR95TFwuxZTqm9iONdINMm8StNp1DQ16jA66w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l+EdQriSH2w5YFUjb4Sm5wDlHZ7FgPfkLYaG34ReLyTnzE/jlN2U/9rRdz4AzDPZNu2nAg22M9ut7vNWnzjJA1uarI2jghoD9jCxvh2nKwT92YPXzcbn4TUDunoCqeisvev1fuKSq+f/IJde1ei4FVWFNVagPRy+LngoUGg1Ey8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ly027bfE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ly027bfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776909515; x=1808445515;
  h=date:from:to:cc:subject:message-id;
  bh=aU7G0geR95TFwuxZTqm9iONdINMm8StNp1DQ16jA66w=;
  b=ly027bfEFE9onBwjOhq0q0PAMMdA4d3i7XsDcEIAUOn9MIfVW6UQcT2U
   wismQIr7IDbAXM0Ocq0bYDcmSFLVE3iKaqdopc78KxRiMVydogeaM+TPL
   5K7vu9CE8E972Vw2OKsbFcvNhSb8GYjSYL0OzP4kDJniBeOmlInj0A9Bm
   52PrbZqnOzNIVc56+NxBZ5mhe6MLebJvSW4wz310a+dOirFkfuvSDl2BZ
   1PNJfkoekRwIuVig+Ue4Os7yJE3bMmEaK6jwx4UYVJOCuKI7s+hk6sCda
   qjxF/i6wbeAVx00xfRYoaJN/ohE2jEyzvjdEuXUxFZ9U2S6IAXmDkb7lJ
   w==;
X-CSE-ConnectionGUID: WlQXrLksQ+qmTMUzFbdvXw==
X-CSE-MsgGUID: pr5mxvHWTy60Sx3zvqnQ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88570714"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="88570714"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 18:58:35 -0700
X-CSE-ConnectionGUID: LChAZiUNRmWDY3oM4Z+Zcg==
X-CSE-MsgGUID: uqWCN3yCQTipHcZpNmLgmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="226000046"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Apr 2026 18:58:33 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFjKp-000000001Ll-05po;
	Thu, 23 Apr 2026 01:58:31 +0000
Date: Thu, 23 Apr 2026 09:57:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 26/30] Warning:
 fs/bcachefs/util/rcu_pending.c:636 function parameter 'pending' not described
 in 'rcu_pending_dequeue_from_all_where'
Message-ID: <202604230933.HKDZ0Q9L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   21c7d1e689ed3f8a66a536cdac97ca75ffbb8a91
commit: 3785435bb05ce2d63715d36de356b0c36a010463 [26/30] bcachefs: key_cache: reclaim only entries we can lock
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260423/202604230933.HKDZ0Q9L-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230933.HKDZ0Q9L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604230933.HKDZ0Q9L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/util/rcu_pending.c:636 function parameter 'pending' not described in 'rcu_pending_dequeue_from_all_where'
>> Warning: fs/bcachefs/util/rcu_pending.c:636 function parameter 'try_claim' not described in 'rcu_pending_dequeue_from_all_where'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
