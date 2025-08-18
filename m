Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91327DF59
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 03:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755487742; cv=none; b=OWZu9/DX77BzA8gYeG6eSFuSVG5jjrHt9OThJCV+BsgSlg9MrSdzBp6UVBhLiodJNUFxmBmXJxkqZxGXfZJ5e+bZNdl/wp+3eMmvp8tWt3hMUvfAhVDi6DkE3pBqcg9LNH2sl8ypzYA4VbN+Oa6ktEmZMH7zuiKXqSSazaEV+nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755487742; c=relaxed/simple;
	bh=yTPHCwY3OaTHdqbF0Uz7xpzp6StRWTT7hSAmQywcnuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vla/Z4+ozVsXkHdV9rXp/qCgU/jw/l2C7+yp3WURq6cxcpvch3IPG20GlAmyuRPlN/2325tqxHIWBzqItts3It+R6paNt6++cF10zJuLtYwmawKmNn8xMu3PSAx17qb4MriOv5Nl6xlvwqYQF++s+tPfpsmpHn2tb1ZWpwLP9Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0/qDsfn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0/qDsfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755487741; x=1787023741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yTPHCwY3OaTHdqbF0Uz7xpzp6StRWTT7hSAmQywcnuI=;
  b=W0/qDsfnFK6RoTbbg73/GFDItSalI7IYU5r9REF91ooLd9xXt9NHRq8/
   1R7N5EQ8aBRXuuFa1FYuXFXZeqlKCTxV9p5yuqUrWFieSHeGYYRt2joIf
   B1bAQS3cy+Chm76qlRt/u2eAWHfLHSvBG8fNPL7LfLm/X2Fj9ft7O/UB0
   cQF2jQ/eg8kjJ4i8I89xzXIoLL3WV3GyMWejoih6d2bzQreggus+VPR96
   8FyziCTSO8zMQy20E8P9bNIx9fD+hatX3tVu/kvdlYdxGp0RsfQKQ5fyt
   1KiTaNZJjp/80tGWX9QbbU4vONUhO4t/HgrwkzWbRzxsqjwTSpYD5mYSt
   A==;
X-CSE-ConnectionGUID: TQlpwYx0S0u3DZL4AVwM5g==
X-CSE-MsgGUID: ctIrXK9VReSLQqpnhLnvsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57634275"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57634275"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 20:29:00 -0700
X-CSE-ConnectionGUID: 1YtbEbPAQ2i0K25+NMPODw==
X-CSE-MsgGUID: HehrzC29SRCHSY5X7t1kPg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Aug 2025 20:28:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unqYK-000DtJ-3A;
	Mon, 18 Aug 2025 03:28:56 +0000
Date: Mon, 18 Aug 2025 11:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/wip 22/22] arch/x86/entry/syscall_32.o: error:
 objtool: __do_fast_syscall_32+0x567: call to mask_user_address() with
 UACCESS enabled
Message-ID: <202508181153.F4b1lzUF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/wip
head:   d8363d297d3a20a161cdb612ecc1f0f7dacd3bd5
commit: d8363d297d3a20a161cdb612ecc1f0f7dacd3bd5 [22/22] rewrite
config: x86_64-randconfig-161-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181153.F4b1lzUF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181153.F4b1lzUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181153.F4b1lzUF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/entry/syscall_64.o: error: objtool: do_syscall_64+0x340: call to mask_user_address() with UACCESS enabled
--
>> arch/x86/entry/syscall_32.o: error: objtool: __do_fast_syscall_32+0x567: call to mask_user_address() with UACCESS enabled
>> arch/x86/entry/syscall_32.o: error: objtool: do_int80_emulation+0x336: call to mask_user_address() with UACCESS enabled
>> arch/x86/entry/syscall_32.o: error: objtool: fred_int80_emulation+0x2f3: call to mask_user_address() with UACCESS enabled
--
>> arch/x86/kernel/traps.o: error: objtool: exc_debug_user+0x288: call to mask_user_address() with UACCESS enabled
>> arch/x86/kernel/traps.o: error: objtool: exc_int3+0x28c: call to mask_user_address() with UACCESS enabled
--
>> arch/x86/coco/sev/vc-handle.o: error: objtool: user_exc_vmm_communication+0x25b: call to mask_user_address() with UACCESS enabled
--
>> arch/x86/kernel/cpu/mce/core.o: error: objtool: noist_exc_machine_check+0x231: call to mask_user_address() with UACCESS enabled
>> arch/x86/kernel/cpu/mce/core.o: error: objtool: fred_exc_machine_check+0x28c: call to mask_user_address() with UACCESS enabled
--
>> kernel/entry/common.o: error: objtool: irqentry_exit+0x247: call to mask_user_address() with UACCESS enabled

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
