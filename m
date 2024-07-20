Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168251C27
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 05:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721451960; cv=none; b=JFFZajT6n3IQnGvlnC0h7PZ8l3ji0hD3gWuouXGgUEwIOdRR0qA8YHoQ3VC8oOz84SEENuiUHCBzaaRe21iwvAb4iW6q8uY9OX3J3mIdKvIhCb3jm1ujVO8+xV7+QbU+hgOADBq55iID/4RszAft7kK2+4Qu2+VL9oFQW8MNg7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721451960; c=relaxed/simple;
	bh=QbVy1eulorW4LNmYsGCymTXTD56rPrNv/FrRLoy4dTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DIKR9Mm4acHXlREPGqiyoHKHfw7CEthMuez+Yt2KzR8gf+Vsw+j97aZ/yPfu3GQGB+lEzNJBgSwdym+WgCbzE/cOW/O0lmrMjl+6GJEsFv1maObM3oKa1gOeGBuBF3/5kOX2g/GDk9nD5DQfnz4aqSuxLQX0DQeWpf5ZQolEAqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kjw8/wMP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kjw8/wMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721451959; x=1752987959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QbVy1eulorW4LNmYsGCymTXTD56rPrNv/FrRLoy4dTE=;
  b=Kjw8/wMP5u4B3GO8hw6DDs3764WsHuauCpf3pW6JCatm0Zs0owd2ytN7
   iV4vU2Lt9PsbulnJl2UXPxY4K2w3/PmW0RZ5Uz3QI+QKUx/axiYP6nv8B
   zDlfSRJ4jDa4j4t1S2y/4f7xF+HCGbTA+LLNYv58LA9+iHbaIU+HuhdjF
   PFCPaHFca6bKsgUtvhSaPLG4tiCRfmbIb6v1jLCWO4bA4eZAT0KQh/ocQ
   xub6iXhyn2ijgkGrZ7WulADqtpOyA/k75DFSyHQgAjLYqGVZPSb3XrPFf
   ngbmrmhxRY5+cFfL4lYYOvedKHsIJrtrqWMdcJ7RCZ0jAxZ/4bwav/I02
   Q==;
X-CSE-ConnectionGUID: VH5UEbXLSiuZ5X01XZWPuw==
X-CSE-MsgGUID: PvJFtYejRtKYWGXSHLVSbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="29705123"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="29705123"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 22:05:58 -0700
X-CSE-ConnectionGUID: WQ83//a0SaOIJ2YUrx6s5Q==
X-CSE-MsgGUID: ZH1Q45jhSNys0NeNG57FmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="74547859"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jul 2024 22:05:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sV2I7-000ir0-0o;
	Sat, 20 Jul 2024 05:05:55 +0000
Date: Sat, 20 Jul 2024 13:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>
Subject: [chenhuacai-loongson:loongarch-next 5/18]
 arch/loongarch/kernel/syscall.o: warning: objtool: do_syscall+0x11c: return
 with modified stack frame
Message-ID: <202407201336.mW8dj1VB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   14c860e4d30d97502271d5c19474c8561ba06c98
commit: a196fe59bfa2120d0625afd2b3cc72050a7260fa [5/18] LoongArch: Add RANDOMIZE_KSTACK_OFFSET support
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240720/202407201336.mW8dj1VB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407201336.mW8dj1VB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407201336.mW8dj1VB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kernel/syscall.o: warning: objtool: do_syscall+0x11c: return with modified stack frame


objdump-func vmlinux.o do_syscall:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
