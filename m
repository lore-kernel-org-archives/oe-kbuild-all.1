Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FF51E4BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 22:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765666229; cv=none; b=IjSsgKa0X7S0kY8RL/xcP69S+35XcWyqCJJrXsFXROr7/n/bkwy4gp5ZXijVlC6f9AMA+7Rnr+R2wVmVX/jXSFjBDKPsjDokgN88cx/gyZ4Tw9PzcZDBUjfiQT0nVIRv9wu3texl8uGSNxU2b2xsQ4NEP7+yqwkDAERdyByR93Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765666229; c=relaxed/simple;
	bh=6YvptacKrsYrWvVXD0F8FYzQEzXLfmhuExPec+getoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SovWDGLPzmYUc+qXsrBUrRKHH5kKE+by9Bq0F5TrRIrp/H7ZtAzhaP0J+HUYmEhX5wSiePO+4B/9v1IwCMKZr6b9Y/sW2osQ04MRJtKAQ5BmfVnJL+EBfxR9Mf5FSmYEBl9q3r85oGkjX6a6OgZMiZ4tFOzJki4dS0vXcRmaJ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4/gV5OZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4/gV5OZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765666228; x=1797202228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6YvptacKrsYrWvVXD0F8FYzQEzXLfmhuExPec+getoc=;
  b=U4/gV5OZfteFBWhoS9GJ6p7qK1nIIkBo5XJ2pFjfrHaF2qZyjlVqHjoN
   aQI8JTemIlmDR4rudEiEygBprLY2lzVDqwRE48kFbJmk3cFNg0QVto5a2
   owCwF4uJzbKQ83sCEVgmVw3V5lgHpcxJ/opvyiJlTkC4XlTyroXpIr8QW
   tlWD9Gq+0H32iibJrGKlKXdvGAsq3dxDo8x/aTz/nHxPfuBPwvt76/0q0
   ut7Xbg+iDPv1Zefa8eLlI880w/izjRLbkdtk4EXxmkNkvzyjxMr08QKok
   Pg/O4WI+ZOaHT/ycW9H+lV8VakvUqHR9uGwWcDQoPgmacgkym2itwAI3u
   Q==;
X-CSE-ConnectionGUID: BPyvCbBZR4OAILmpRXDrMQ==
X-CSE-MsgGUID: 78BZWARaQC+KfKjIQY9dIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66612100"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="66612100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 14:50:27 -0800
X-CSE-ConnectionGUID: nSJ/R6yyTZi5mleNYqA3sg==
X-CSE-MsgGUID: kuzKQbdwQnS4jUX/tt717A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Dec 2025 14:50:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYRU-000000008Hp-14qG;
	Sat, 13 Dec 2025 22:50:24 +0000
Date: Sun, 14 Dec 2025 06:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: arch/x86/kernel/cpu/common.c:2083:1: sparse: sparse: symbol
 '__pcpu_scope___x86_call_depth' was not declared. Should it be static?
Message-ID: <202512140644.bKd0WN29-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Brian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: 839be1619fb897364b782997bc2c5d072d7a79f2 x86/retbleed: Move call depth to percpu hot section
date:   9 months ago
config: x86_64-randconfig-123-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140644.bKd0WN29-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140644.bKd0WN29-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140644.bKd0WN29-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/common.c:2083:1: sparse: sparse: symbol '__pcpu_scope___x86_call_depth' was not declared. Should it be static?

vim +/__pcpu_scope___x86_call_depth +2083 arch/x86/kernel/cpu/common.c

  2076	
  2077	#ifdef CONFIG_X86_64
  2078	/*
  2079	 * Note: Do not make this dependant on CONFIG_MITIGATION_CALL_DEPTH_TRACKING
  2080	 * so that this space is reserved in the hot cache section even when the
  2081	 * mitigation is disabled.
  2082	 */
> 2083	DEFINE_PER_CPU_CACHE_HOT(u64, __x86_call_depth);
  2084	EXPORT_PER_CPU_SYMBOL(__x86_call_depth);
  2085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
