Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64285149C51
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 04:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743224358; cv=none; b=TE7K5bl/ZUMnZT60/DTUMXvS0V9Ms0QAXL+OpP9/sNMNK6DzfjEfjukgprykWrqdeBg9vvNLflvjuLt/OGLxcQ2Wd1HiYhR8dsgr+0YHNMBdaq1kqMisgyRFxc3dbMdND+aWy8/2JYDVX99y1QM8FvlAxO4AvQUoZv/1ns4pQ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743224358; c=relaxed/simple;
	bh=BsdaPmrpp/pVdTfO1M95HfdPIFWAmibSvjm0qBzesXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fuVUd50dRie4N9m5dBkddjoLGiG0q4s8L22gkIAq/0jWAtBLlUjfwgyC1DRHYrKby1hX/jwhIkOIoCNpPy7Z6GgAVVwmmyHVRiw/sXMTAY2n8IpzmlY/OCWrjFZh72aUqqKlA40X+X6A/XXczx3LINzJWiQnVVNcnJdmxkaA2Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BowEcX5k; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BowEcX5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743224356; x=1774760356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BsdaPmrpp/pVdTfO1M95HfdPIFWAmibSvjm0qBzesXc=;
  b=BowEcX5k1XCtcKI0V1G5I5NM4yFs+pdwlpZqTgwMslIy5tesEXRxD4sx
   zX9oKW8PWUCueBfteLy+I2cISfGPNzzvsk+JKWg4VcuCnF//6NcR+41mY
   vPljNTVoyPLFn7Z/yxH5Es3fZ64dOhTcrRzvgp5mV3k4p1332W3J/5vtT
   W+F/BpmS/VVInchcBLIeuxlBHS7mVdBBG6327kPfaRIMlcikzz9adntPY
   4sp4VLX/I7jvnXLMYXqpuuq0foqagkzaC32An2AyQC2OY1BmI6Ed2h6Uu
   8FtJpGB1jtxRvgOOIwbv5uhO/l+B8N1W8YusYJw0u68R9oyNlnLLjKnHv
   g==;
X-CSE-ConnectionGUID: qKZOJNw9TI6mIuCi2s1s5Q==
X-CSE-MsgGUID: vl5Wun6QTVOHvGu6zaI9IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="32196666"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="32196666"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 21:59:15 -0700
X-CSE-ConnectionGUID: /TgW2v8pQ8eND+Uq5LHm0g==
X-CSE-MsgGUID: kmvalTVLSiO4yjLyw1Rxnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="130722890"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2025 21:59:14 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyOHo-0007ue-2r;
	Sat, 29 Mar 2025 04:59:12 +0000
Date: Sat, 29 Mar 2025 12:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] block/blk-mq.c: trace/hooks/blk.h
 is included more than once.
Message-ID: <202503291225.qdFZBPw3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b62ea68f41a901d5f07f48bd6f1d3a117d801411
commit: 52e82fb490db327de31439e47cf58f7bc9a1bb5e [2/2] ANDROID: vendor_hook: add hooks for I/O priority
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291225.qdFZBPw3-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> block/blk-mq.c: trace/hooks/blk.h is included more than once.

vim +34 block/blk-mq.c

    32	
    33	#include <trace/events/block.h>
  > 34	#include <trace/hooks/blk.h>
    35	
  > 36	#include <trace/hooks/blk.h>
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
