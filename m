Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3229D27E05A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 20:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768769666; cv=none; b=n/cDZCsW+l93Zt+6YeRQ5mgvPtIUTjA87mxjEXTjmxpz0Hy5Li4AoJXo+ejtBcK11joycPqPxKk+AtrQh0lYrHr6bEqD9S+pKztghkvf7VprhmVeWwOAbPvnw208MfEg/Eyy/NCtQJaERxAU6O5gAscpq0v0uHRlXnOOJhwN2V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768769666; c=relaxed/simple;
	bh=yzdK+P0DrZFm0e8Jjv/iedp4bewd/iuijvDTVE3ui/E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HMUA66whTPHoh9iorfwTyVfBBLBZdOtmTNVo2r2XLtB0a5iQ3STSidinoekuJQ4InmIEEIOVi6qPpSsgi3/CkS1M39tsNVZpzO5VoouaZpiCbVlx/MMaUxYGevMOUELK4fbvYJyFM5cARHDwryemrHEVyqlEH2S4Qnn5JKcE+Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5iBXld5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5iBXld5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768769664; x=1800305664;
  h=date:from:to:cc:subject:message-id;
  bh=yzdK+P0DrZFm0e8Jjv/iedp4bewd/iuijvDTVE3ui/E=;
  b=U5iBXld5e9584bhcJ01N7rGxh3HrVr9ifB1+y4kaSroCzPR+Uq1I5q0E
   ugnmvjVWHCKVran6IdzP9zdZFGr9nnEDzXb8U0fbGODUCx32f99U4QkKx
   VuYL0tmEApkk2g6v8GyKorqeE3jBxrpyCddQYo87YDfP1rhWUxc3dzKus
   14q/7uhJJqLvDRKfID0iPnIhc5inR4zVSjdyHt3NS2BDU8cCXdkv2xpm7
   By2DYHCjG72rdGx8LaRPbStsTiaKXFWR1DKRSReegt07bB+UNdZEwsmeF
   ukZuMA7RUkUp7K/+M1AhlqRYSY0M2JWGuNabtk0Mm8BE7bSE7mTBDrWps
   g==;
X-CSE-ConnectionGUID: EMeoUTAiRv+JSkKiTCskWg==
X-CSE-MsgGUID: 4dU5mDk2SD6RhlRgSNn/tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70076734"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="70076734"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 12:54:23 -0800
X-CSE-ConnectionGUID: b7KAmvSxTV+tj/Ke/76m1g==
X-CSE-MsgGUID: Qj1TN/gsSACKbVQjjZ3p7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="205738952"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Jan 2026 12:54:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhZmt-00000000NDZ-20R1;
	Sun, 18 Jan 2026 20:54:19 +0000
Date: Mon, 19 Jan 2026 04:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-both-restrictions 14/19] csky-linux-ld:
 kernel/bpf/syscall.o:undefined reference to `io_uring_filter_prog_ops'
Message-ID: <202601190454.v3vljXi2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-both-restrictions
head:   101d5f0794ddfbee7649bbfa145854ecfa7d1994
commit: 09ab6f4eda4c6ac7cb99b8c1f61a062186002733 [14/19] io_uring: add support for BPF filtering for opcode restrictions
config: csky-randconfig-001-20260118 (https://download.01.org/0day-ci/archive/20260119/202601190454.v3vljXi2-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601190454.v3vljXi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601190454.v3vljXi2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> csky-linux-ld: kernel/bpf/syscall.o:(.rodata+0x95c): undefined reference to `io_uring_filter_prog_ops'
>> csky-linux-ld: kernel/bpf/verifier.o:(.rodata+0x708): undefined reference to `io_uring_filter_verifier_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
