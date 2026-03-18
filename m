Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F593A8744
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 11:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834477; cv=none; b=HIYJ0ujGbsZ03vLR2kIunNPYJHbTBO0jKeXRIHixAHHmBmJUjjOWT3oIHuQspzKMyB7Za8sIWdwPaXvWWH6fdr4Zf+0rj8/kQ42s0GVCHESbq9o0gQneVyVOa/tTPRagXKQHTPDMHrQ2Mlrc7/YLIFE7dwrfMkV8LfN1YjKiyHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834477; c=relaxed/simple;
	bh=ubP0je1rPZwVM+gMuM2WlAu0kGDfOXyBR8XY4Ka/0aA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k2TwkOdkfnD4Ul++rS6Cu9DpTtVctxWBF+TPCLkZreQUG7HfH+69Sr9GgWsS4Bi60Sl0oyZ5T6KGvRxKh81dXo/EL1TdkH5rRPOrnoUfkMYnqOzIk1lm3VJkA6WUpX3EkwxC+7QCKH2iXgVK+U/4C2FJNIDjdxSN9TDYZ5CEUzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRpv/Lgp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRpv/Lgp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773834475; x=1805370475;
  h=date:from:to:cc:subject:message-id;
  bh=ubP0je1rPZwVM+gMuM2WlAu0kGDfOXyBR8XY4Ka/0aA=;
  b=QRpv/Lgpml8afN6w6B/4TGGy2IhhBkuncqe5IEcqsjHyjDkJUEgc5LVb
   rkm5eWZHgWdsk103OlaMDLirKkC7H5vWkxZrn79RW+5OtC02jpdaThq1y
   mGCm9T82yp7X/8/wZ7fs2vZGI+NCUp4hymyXtEz4X8lZLuKvTcedufND0
   P+fb9yY7+aAzsKe7tdHx5QgzV5YYzw6BKtt5DLCloYwJGsJivu0DvthiE
   B3L+wsUL2YA0CnaZod+L9aho6GBFc46duszk18g4xlkyiy5NIyc3DS04h
   9feIOBHdPu/nVnj95zuEJQcAQpL4DKCEI8zrCdVKXn+p5IHIQEV87DaG/
   A==;
X-CSE-ConnectionGUID: HiHiuKgTSkWPcsGvpkQOVg==
X-CSE-MsgGUID: nPtleBshQP2Ye2uJLdfbBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74584798"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74584798"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 04:47:55 -0700
X-CSE-ConnectionGUID: tokiYb+RSLeE1P9ruOIDJA==
X-CSE-MsgGUID: tQVwzpOUQi6uVlljlskG1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="227072731"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Mar 2026 04:47:54 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2pNP-000000002rL-0B4K;
	Wed, 18 Mar 2026 11:47:51 +0000
Date: Wed, 18 Mar 2026 19:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] Warning:
 kernel/trace/ring_buffer.c:2674 function parameter 'writer' not described in
 '__ring_buffer_alloc'
Message-ID: <202603181924.K6EDKpHM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b0e662fb17ec139a265b282999e920fe1f021414
commit: 98810c472d88f4a8fd352ad1549f2e9f34d827e3 [2/2] FROMLIST: ring-buffer: Introducing ring-buffer writer
config: i386-randconfig-141-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181924.K6EDKpHM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181924.K6EDKpHM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181924.K6EDKpHM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/trace/ring_buffer.c:2674 function parameter 'writer' not described in '__ring_buffer_alloc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
