Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC8433B96F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774507403; cv=none; b=Ej4T4CdMzja5DdH1MBKxHmxOcB7HsMA/In+nPwAVNprbOFTy7j4MhncVrrDE3y2/GXZhG/wfpoviyrbdqsDTgZ2O3jjY2YR44PKXYu82FyQfIBY9oRDb6A2sc5WrbpE2HxOAXr4xsEUpW5BEDGkbk0e4eZ0Jml9u5eeKqD1y19Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774507403; c=relaxed/simple;
	bh=MTEdv3CJxRnj0pUKyxNNSBzc+VgQJPKZ4ByoTYSlpto=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ntf4Q5a+XZtDSTZaINMZ1stSWLNksLknE/87Qk58XSDBc46vYYCju+TXjOJ5HXj9vAblj1m71p2RzhDWmv1CBPF6Ps8BMHaVVcc5OdqroWF6YwhK8KtOFiS51VqglQcZyWjtz31JgvGUtw5VmM+9ydftuOEY1J3aI6yCuSCTCW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWXCIBN9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWXCIBN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774507402; x=1806043402;
  h=date:from:to:cc:subject:message-id;
  bh=MTEdv3CJxRnj0pUKyxNNSBzc+VgQJPKZ4ByoTYSlpto=;
  b=DWXCIBN9IR/EA/yaGXtPze2HfudXR2nHQ0+Q0Ph2VeEvwWevZNZ0LFjt
   i5TGLIBt+x//ZVNojHTAi6fW5PUyG2ZFa8mMmAF61ZcTESNQGf8ghiZXE
   SDJwU2SzJH1rujRZFAirG0BtvJCqNN4A3mHUNJnIRElywAC0quttz8b6E
   /qqEBtYgQdB/UY8HaVjHqgDax8ITNKaHJUI+15abAOAfizJYZMNycYIee
   11lGD/cHN3DdkG4ihe+0v5dP8DYUyYBQKaP2LR+QsgRAzp8shC+PnzUel
   U0MWLf4wbCcjsZzVTREjgatAzCuHQT40X2cmUd34lazOadNfq0jUxfrh6
   Q==;
X-CSE-ConnectionGUID: p6MpzdcKRPGz/KmCvoM87g==
X-CSE-MsgGUID: Wa/BzMbeRa6lbzI7PU1i3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79462649"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="79462649"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 23:43:21 -0700
X-CSE-ConnectionGUID: w5U4/lL+SM+i+UW4CEkvZg==
X-CSE-MsgGUID: PIEVFqPiTE6pbpsvW/4AkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="255404108"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Mar 2026 23:43:19 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5eR3-000000008MP-05j7;
	Thu, 26 Mar 2026 06:43:17 +0000
Date: Thu, 26 Mar 2026 14:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 15/26] ERROR: modpost:
 "nfsd_handle_dir_event" [fs/nfsd/nfsd.ko] undefined!
Message-ID: <202603261402.zJvrEruf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   996759a25534ab4a7e986fe0153659e93c1611ec
commit: 0f5a8e88ca922de5284bcbf63b64b120b5a58947 [15/26] nfsd: add notification handlers for dir events
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20260326/202603261402.zJvrEruf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261402.zJvrEruf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261402.zJvrEruf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
>> ERROR: modpost: "nfsd_handle_dir_event" [fs/nfsd/nfsd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
