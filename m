Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B6D1BC3F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736017457; cv=none; b=jz2WQR0XQkRJmlZ1oxK4+V5UrvFRdQ0qVqDaiCiS8PQgTzt4JIzQ3nZYzg1dtw9GdhcyQiUoed9JzA8h59HpRjyHMAvM5TY5W8GjDp0YTuv3C3m0qo915+gUw9eiN8m6PPFHevKJhN5FO7kZWjWlLEANj5yJa5JU+zb3Y4ONBWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736017457; c=relaxed/simple;
	bh=0MKiZwHT/u1xrRrZ1QHMPkDFGgVdBHVWhipHv1aokd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kPTzjN6Ivbqg9nqNh1n4/T9GvEcKbzz8JhTfla/hEq1x94x5sPuLO08s1pRiKKFlRbCBU9qtYGoLmRs7pZqaCCVLMR9EF28vdVUTC2GNFohG9fw+sIDDO5FnVdfCul7b7GlTIftSMprdE2icXsfNCnY/FoY7+T5+fgHszRhxJHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvKKT/NV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvKKT/NV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736017455; x=1767553455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0MKiZwHT/u1xrRrZ1QHMPkDFGgVdBHVWhipHv1aokd8=;
  b=lvKKT/NVL3jHRxxeYit7+R7FHvV7EEfRLBKa6jNicxDiAkQb+vNYN9NL
   Md3rfiR01cW1NfdOedQWAVauKwZXfy9ZZpYiim8LLvvcffoGbqCk0/jJV
   3oDaGbY6hdRsf2Qz74noNydleSNTNhvdHTdGNoOyyi4wDMYTak/k+UKbK
   7gu7whOBuUwTR0UA9yBMUPBjtQKR1HTC7ELPS8+cro4XgYe18vVDNIgnp
   Znm5KA2DBG3louTOJE+65LBK448vvzRTuNQjCgUIarjgdOXilHdiD7A+w
   8k60Ibwsss3kgXx2YNoseMlCZlCFwOf5KZFR9RIg/m5JAjTrprHDMLF9t
   w==;
X-CSE-ConnectionGUID: S1LNFu50Qy+AKPuDZEjhuA==
X-CSE-MsgGUID: XJAldcmgQCWywZ4k9cGdlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="36123620"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="36123620"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 11:04:14 -0800
X-CSE-ConnectionGUID: K4+0/+lDSMeGMymqwSMYsA==
X-CSE-MsgGUID: N4fPgzBlR4CWWUpIvtkukQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102556127"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jan 2025 11:04:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU9RS-000B9C-2J;
	Sat, 04 Jan 2025 19:04:10 +0000
Date: Sun, 5 Jan 2025 03:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 22/28] Makefile:47: *** Cannot find a vmlinux for
 VMLINUX_BTF at any of "  ../../../../vmlinux /sys/kernel/btf/vmlinux
 /boot/vmlinux-5.9.0-2-amd64".  Stop.
Message-ID: <202501050247.jwT7JoOi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   50c59ffd9367d000b9a4fe2ef9a587a2e81f287f
commit: 23a9cfd0e8bf66157313427c66eb8cbdeafa0e31 [22/28] cxl: Move cxl feature command structs to user header
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501050247.jwT7JoOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050247.jwT7JoOi-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
>> Makefile:47: *** Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.


vim +47 Makefile

3812b8c5c5d5272 Masahiro Yamada 2019-02-22  46  
3812b8c5c5d5272 Masahiro Yamada 2019-02-22 @47  # Do not use make's built-in rules and variables
3812b8c5c5d5272 Masahiro Yamada 2019-02-22  48  # (this increases performance and avoids hard-to-debug behaviour)
3812b8c5c5d5272 Masahiro Yamada 2019-02-22  49  MAKEFLAGS += -rR
3812b8c5c5d5272 Masahiro Yamada 2019-02-22  50  

:::::: The code at line 47 was first introduced by commit
:::::: 3812b8c5c5d527239ac015f1f2c7654da7fcfbba kbuild: make -r/-R effective in top Makefile for old Make versions

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Masahiro Yamada <yamada.masahiro@socionext.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
