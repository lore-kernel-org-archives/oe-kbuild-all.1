Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C1B33E34B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243121; cv=none; b=IPfoUyNjZqZDbo+aMKITmaLNrTrCtuiWF54B/PW2z/MkEI26VbuZ0nUrwwqTeMb/DtHRNYMpHTmk0liz04QtBr89r5PCws2NI+iJkCJLyk1gRdpx7lOScmI5oeNcLDmcTxPkpUFsurEk/r75yo5+Y1kAWIJ5s25qfyvQDNlJL3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243121; c=relaxed/simple;
	bh=QtB7Wn5hkO3dbp+Dx4q1fCZf/O+XWJlLKZ1ClBBEPP4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i/Fo2TqDT7YdGpu9cO1Rtov3dlaP7MOWaoTsNa43zMaINwI0DRuk0qDUxsiQe2vYrcvKUGrqkc8CzGxvGDftX2Yhn5W8G45oAIiAx7ntJiyXA2M9xrPjLXlAkIkgb1rvjn7lczPaYcRfeKA2ZV65dVzNAZz8furInD2NBzPeiLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OnVh6Qms; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OnVh6Qms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773243118; x=1804779118;
  h=date:from:to:cc:subject:message-id;
  bh=QtB7Wn5hkO3dbp+Dx4q1fCZf/O+XWJlLKZ1ClBBEPP4=;
  b=OnVh6QmsZYsC1Z47Ur9jus8jb8L8WUzAPfPSPuu7rI8Z8X0TClkCSlrw
   6kD/ecqx1nV7EstdqPRkNC05ZEP6rhdj9BmCOhXBXj4JP3fB4VAOtsG8O
   r4C2hzR8/SAofhlDpvzDA/+4OswpWz55RhyBC0Kfdh9HJTePVAmhLEKql
   NK40cxS83GNu4LlJFQXx5OxXFv0B+mIn/kTovTHKy42qz2qeEHejJ3kM6
   2JNhmkV77Yy5/llI4fAMOoYUblXCkR/xD2KCooN3NDm1QBoGlFVRKCnas
   T/32+3m18+SPG1sqiBvZhY9PgyT6VgPiRPB341TIEpLEvaVkkdSTkKl+n
   w==;
X-CSE-ConnectionGUID: VUZYhHcaRemcDOO6siMgyQ==
X-CSE-MsgGUID: sy+0nM/ATzG0UqLCiPceTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74193727"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74193727"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 08:31:57 -0700
X-CSE-ConnectionGUID: hMqxnkNGSyW9EwtwxB5kXg==
X-CSE-MsgGUID: 3oQqZUmUQRKi66i2ZYQO5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="218373553"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 11 Mar 2026 08:31:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0LXN-000000003Lp-1HtK;
	Wed, 11 Mar 2026 15:31:53 +0000
Date: Wed, 11 Mar 2026 16:31:13 +0100
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:testing/v7.0-rc3 2/2] /tmp/ccST66ZO.s:3575: Error:
 selected processor does not support system register name 'pan'
Message-ID: <202603111659.MT5ECXXx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git testing/v7.0-rc3
head:   661b491963fb7aa62905612f758376933435bba9
commit: 2df151af23926ce5e8053052b5ff6b8455b4cdc6 [2/2] HACK: arm64: Check CPU state at task-switch time
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260311/202603111659.MT5ECXXx-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111659.MT5ECXXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111659.MT5ECXXx-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccST66ZO.s: Assembler messages:
>> /tmp/ccST66ZO.s:3575: Error: selected processor does not support system register name 'pan'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
