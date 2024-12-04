Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104A31A8F8F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 20:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733342993; cv=none; b=iyV17veQ9dmtgJr4AjJquQ6bcVB03B+VuvWHgbX5XGpdAtYnY8uu+DaIgJ2Eti2Hir2s2dmoLrIVKLZ/tY4m8Z3rDEExK/zQACZU15XdzcW/CKmGY4rVFm0BaQsS3dTuGdBbHFQ+Qs+HiG9R6mpxlyzoirExVLvOgg/WdZpgT04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733342993; c=relaxed/simple;
	bh=SFTLYuqGP6OOz90w0QN4T2TXheuJIC71rlFSxGMG5kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdKrgp1L7g2m/LiYpjwcA8mZOTbnNJ5ZsOR5zVuVT1uG++T5lOMgVoxvkNH7pFKMJ8ViPL9SCbHHvxWCK0CPpSOEXaTSrnDXCVEMK3idxyuSuwRWxYrJv5tZcC7s70J0cPVocWprUtUmYsH7QtJj1tufqEKVjZr2J2po0mcnHVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9vnEjN4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9vnEjN4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733342991; x=1764878991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SFTLYuqGP6OOz90w0QN4T2TXheuJIC71rlFSxGMG5kM=;
  b=H9vnEjN4kxAb9ry+y3ab2ybZ6bLnwUP5FCkFrM4ckQg7tTPuF5Xkkb/k
   TdonmPUrvswGgXJmtugUUH0Srt0QEkZeysgJ6gCHF5FxIohPhEq2Ph0+3
   o/1ycl5R+VIibzaWPZlcN49XbjOndo+3lpKItB6CXAGREmJvVaYZt2rLE
   xHe5avYUQxx5ROwontO6N/UrMoBRG+UodNJKwXrjuSz2WdtjvuVCrYHx7
   RIZQHbxyyn/qeL+pXVJyZ0qSzE6bQecgi9fylBTW//dFU8loWZQeAp6UV
   IFKcdw86BBZfyYPCyxlqd5uUuFWUBXkf+TKpf2KOhhZG39AtWqZcu96wx
   w==;
X-CSE-ConnectionGUID: qt1xroSyTmid+Q63amlT1A==
X-CSE-MsgGUID: Fza2RoIDQ+qcSsxPvphqqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44109098"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="44109098"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 12:09:50 -0800
X-CSE-ConnectionGUID: 3lgB8LDAQJiYqijbUDRCfA==
X-CSE-MsgGUID: rLkWG9XTSlGiSnyUGkkiAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="117119730"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Dec 2024 12:09:48 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIvgw-0003Rp-0R;
	Wed, 04 Dec 2024 20:09:46 +0000
Date: Thu, 5 Dec 2024 04:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 03/15] ARM: rework ARM11 CPU selection logic
Message-ID: <202412050301.gRLUeKJ6-lkp@intel.com>
References: <20241204102904.1863796-4-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204102904.1863796-4-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next linus/master arm/for-next arm/fixes v6.13-rc1 next-20241204]
[cannot apply to soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/ARM-use-CONFIG_AEABI-by-default-everywhere/20241204-185507
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241204102904.1863796-4-arnd%40kernel.org
patch subject: [PATCH 03/15] ARM: rework ARM11 CPU selection logic
config: arm-kismet-CONFIG_CPU_ARM1136R0-CONFIG_ARCH_OMAP2-0-0 (https://download.01.org/0day-ci/archive/20241205/202412050301.gRLUeKJ6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241205/202412050301.gRLUeKJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050301.gRLUeKJ6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CPU_ARM1136R0 when selected by ARCH_OMAP2
   WARNING: unmet direct dependencies detected for CPU_ARM1136R0
     Depends on [n]: !SMP [=y]
     Selected by [y]:
     - ARCH_OMAP2 [=y] && (ARCH_MULTI_V6 [=y] || ARCH_MULTI_V7 [=y]) && ARCH_MULTI_V6 [=y]
   
   WARNING: unmet direct dependencies detected for ARM_ERRATA_411920
     Depends on [n]: CPU_V6 [=n] || CPU_V6K [=n]
     Selected by [y]:
     - ARCH_BCM2835 [=y] && ARCH_BCM [=y] && (ARCH_MULTI_V6 [=y] || ARCH_MULTI_V7 [=y]) && ARCH_MULTI_V6 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
