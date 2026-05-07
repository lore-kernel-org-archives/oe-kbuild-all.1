Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C863538F259
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144707; cv=none; b=YEpQbBqLpdBunBQ+roPeYwMvjr8gp+C6CW6U5N20iAbRgNkUqR9S9dNXoYC6FyDyoAY1AL80h+dwQNhzzBUJ8PXk3jugt+tI7ssdx3+fB8N8BkpKlwBZ/hAva56BtoLtISahVgGZNf1kGyYsfstwLF3jQDRRuuTBMYyc4/YQJkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144707; c=relaxed/simple;
	bh=12BTSoefjaj578//6n+byTfRgJJG0s4BcYgxO7U6O7I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EKVxQGOCcCZW0+CrmOwaodoy66GZZOR1m3GQQn/jj2MpETISSWIi8oOwhgsgonaH2lgK7o6UUxdPBOqquwhbcwqr2tYMdv3l1VMnwA4OrlpmeqcSdpkg3suu0TKLu2taIEjaBL7Pg43quc/av5aOWDI/XrCbA9ZK1c3C73hlBec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/NJwnfr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/NJwnfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778144698; x=1809680698;
  h=date:from:to:cc:subject:message-id;
  bh=12BTSoefjaj578//6n+byTfRgJJG0s4BcYgxO7U6O7I=;
  b=P/NJwnfr939PD0oh14kZFLdgCjGaumKa7qRdMpyEXR0G9/QAoEQD/IE1
   JSgc0ITu/XhWcww+bFuKbzafUNIowxT9Y7hWEZaIQ2dw8jGfxg4tIbfe7
   MWTM3bmjqJGh8vOX/YjDdoG1cTsJBT/e3HZwLSuHmTYyu704VYWjbIXn2
   oNtZomXDuiGA1D8tYmSJvTf7fiCHfrpqNaWFht7/URFg0JyvlIgLEIiYi
   fQz/BR3xgDAQF7XpEvXYJMIAMAfdBmS4QFr1UgWg49azl+j4LuGar7X0e
   Sc88b72Clm4yNcsdIncIe5Zi5qKPTpTIS0mUw1btWhEp54PoNDYJGVhOt
   g==;
X-CSE-ConnectionGUID: g7V+h6jpTHOIAcEpc2owvA==
X-CSE-MsgGUID: XimaMQJ9SwCMAyw+mlKguA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82934606"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="82934606"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:04:56 -0700
X-CSE-ConnectionGUID: GRVFVC3jTPmL9coAYxdbEg==
X-CSE-MsgGUID: CvaS+MLhTGuLDl0fEq+75w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="241390844"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 May 2026 02:04:55 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKuf7-0000000008x-0dt0;
	Thu, 07 May 2026 09:04:53 +0000
Date: Thu, 07 May 2026 17:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:resets 2/2] ERROR: Input tree has errors, aborting
 (use -f to force output)
Message-ID: <202605071640.iAbpqhXH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git resets
head:   141a56c855a39f383015e462420a72b09f5ba3e7
commit: 141a56c855a39f383015e462420a72b09f5ba3e7 [2/2] riscv: dts: microchip: add mss peripheral resets for polarfire soc
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260507/202605071640.iAbpqhXH-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071640.iAbpqhXH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071640.iAbpqhXH-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/boot/dts/microchip/mpfs.dtsi:464.4-34: ERROR (duplicate_property_names): /soc/can@2010c000:resets: Duplicate property name
   arch/riscv/boot/dts/microchip/mpfs.dtsi:475.4-34: ERROR (duplicate_property_names): /soc/can@2010d000:resets: Duplicate property name
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
