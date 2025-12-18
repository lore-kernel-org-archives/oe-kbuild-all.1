Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D9A2741A6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 21:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766094515; cv=none; b=oQVdGZB+YPA2Ac1BQ4oaSAmmSuLfy6kk4GpSsmXLUdix2OZqY9V7vkkltX2y5XcnfRty8Xjry2YbjiRV6hMiyqv7s1b8YVBCqPv4fGCoXKzHLuNiLudjgjXJz4fDDG2Dnj/dtnlfLhLVMRcjoRjkzAFjRPAlFL4xiOHqDS88ulU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766094515; c=relaxed/simple;
	bh=+cZY0s55Jgl+6XhQxTqcKteCuS7gpOrm8LmnS24nyeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HG/h0aCWW3cq8znC2JWhHzP1bJWJUCMB+kQ3OlAp57x3Q3APtUSzpTRalAPVWZc97cS69SK35SYUTLbyzisxLSL5v0EhysnffHHlSvPVFHoZiDNt5Ly5tFtsy8qloJUl10G93xMpeirEdFKYdEUaynhTqFl88nx9nbXnW3tFt1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3lJMSIr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3lJMSIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766094513; x=1797630513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+cZY0s55Jgl+6XhQxTqcKteCuS7gpOrm8LmnS24nyeE=;
  b=O3lJMSIriUwL7yrDdI+D45BhVTUNkJZSHAcl6EIocflpdnlLyGHRTF2t
   58qydJfY8dEbBTMENQvasP9fV9hsaetLY3KeOro9y8y0mI17du1X0YJPH
   3n6RrXTu19o2zCk5z9DUHWlSB5+bZnOBcXb/e9DXIQBLqJRZtxu/NSzoG
   54amomizztyG1aAZBZsTxxDBw3NmVAfucL1u7chZ5Nz35n8yhPjvbsR8o
   CUuXWVkf5m3Ny1ywISkXOz+xoQ/ZafRyfCDmkeDDGDHJN6U8MnThoCzov
   po6erc0TlzgEGU5MIXF/gvAS2vnBZ13Ff88/7bPnUG2PMWTtt45NGtOxC
   A==;
X-CSE-ConnectionGUID: GOv2/TUiQEaMiCMq7Fa1mw==
X-CSE-MsgGUID: XFv/ghkcQnuQkSB6X/XkQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67809863"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67809863"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 13:48:33 -0800
X-CSE-ConnectionGUID: aS1g/rA7T3SFO24UxRNGEQ==
X-CSE-MsgGUID: h+JJ612jTRiVqsA8ewFFRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198598775"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Dec 2025 13:48:31 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWLrJ-000000002gz-12Fn;
	Thu, 18 Dec 2025 21:48:29 +0000
Date: Fri, 19 Dec 2025 05:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1944/1944]
 arch/x86/kernel/unwind_orc.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202512190624.AbYfKuZU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shile,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: badd79c400ed404df871e1d035bed971d20ead4c [1944/1944] x86/unwind/orc: Remove boot-time ORC unwind tables sorting
config: x86_64-buildonly-randconfig-006-20251216 (https://download.01.org/0day-ci/archive/20251219/202512190624.AbYfKuZU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190624.AbYfKuZU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190624.AbYfKuZU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/unwind_orc.c:179:13: warning: unused function 'orc_sort_swap' [-Wunused-function]
     179 | static void orc_sort_swap(void *_a, void *_b, int size)
         |             ^~~~~~~~~~~~~
   arch/x86/kernel/unwind_orc.c:199:12: warning: unused function 'orc_sort_cmp' [-Wunused-function]
     199 | static int orc_sort_cmp(const void *_a, const void *_b)
         |            ^~~~~~~~~~~~
   2 warnings generated.
>> arch/x86/kernel/unwind_orc.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
