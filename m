Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E307C303A15
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080650; cv=none; b=GPPM+5hStCOdt1bQVe35Cj9ctNlMF1gUESwFbMyrXr4QeZZ7WmtjYqLjiy4ufotO9Da5Jc4eLEFPX7F2MBJxGwrPa7j5pFagkfFoS3CZD9mHGzd9SNX9fUDIbGCUH/9lmwxxgRxH8ybs872PClDaxUX7JXbL+lfAQzzKYrLtMVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080650; c=relaxed/simple;
	bh=6+wVlM3QZ3DWX6ICArLRAJb4mhK4kWsfDFh9YQyvGRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HN1UFfnC/bOC5ZTBbr0tTl0AvIJFy+rsAnb8MKCoRBe8lRhdKgotPKiY9XLf5NiUIuZ9MnOJrbTQ635y4UnsDJkljSYvP2AI7q0w568X+HwOwWvPAK0BOlo1TB0N+C9SJ5dn432Gj1q7uT+LC8VOV7TIFWkwy5+e5l6D/bah4tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dia/uz/D; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dia/uz/D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766080642; x=1797616642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6+wVlM3QZ3DWX6ICArLRAJb4mhK4kWsfDFh9YQyvGRM=;
  b=dia/uz/DasYromwWd2l8E7aDpVAHPaueqEcKFXlt/BDtYVTIJ8c+Tarp
   yDYN1LLd9FL82QpODcLyGaD3u4haPU8dT41wlM8XQbMdHMcYyZ0TFigfr
   9C+jJzUIjhj+96kYpyVbbYEVd79vr1lBF8vR1OHn6+XdaMEsWssroS1M+
   bnAXz2nq8Ev6dTEQVmUpa4TiC+msQ+XZppwjklz/PEWjZJnTHdPIG2WXH
   j0FeHy/nuAuzI6XKx2NDelICXueF5Q33ftLFf53ybUyTCUBLDqAkd/ght
   B1817JsUT3VlUaHptFBIUskkcCZO1RIrGPp0e3Yptxtbj9grvRPdHQy+o
   Q==;
X-CSE-ConnectionGUID: 673DHZgqS/mhJyd2DYdhLA==
X-CSE-MsgGUID: KEXxv5KJTzqWg2O7zi/S1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67920022"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67920022"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 09:57:21 -0800
X-CSE-ConnectionGUID: r0OqqdJGTMWg8GP8NctmZQ==
X-CSE-MsgGUID: LcstOJNlTni5/xMCXoaq1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="199476651"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Dec 2025 09:57:20 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWIFZ-000000002PH-2U1n;
	Thu, 18 Dec 2025 17:57:17 +0000
Date: Fri, 19 Dec 2025 01:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>
Subject: [linux-next:master 1388/2322] vmlinux.o: warning: objtool:
 lkdtm_PANIC_IN_HARDIRQ(): unexpected end of section
 .text.lkdtm_PANIC_IN_HARDIRQ
Message-ID: <202512190111.jxFSqxUH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1058ca9db0edaedcb16480cc74b78ed06f0d1f54
commit: eb972eab0794dedeef5b3b1845e5f9a78793f184 [1388/2322] lkdtm/bugs: Add cases for BUG and PANIC occurring in hardirq context
config: x86_64-randconfig-161-20251218 (https://download.01.org/0day-ci/archive/20251219/202512190111.jxFSqxUH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190111.jxFSqxUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190111.jxFSqxUH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: lkdtm_PANIC_IN_HARDIRQ(): unexpected end of section .text.lkdtm_PANIC_IN_HARDIRQ
>> vmlinux.o: warning: objtool: lkdtm_BUG_IN_HARDIRQ(): unexpected end of section .text.lkdtm_BUG_IN_HARDIRQ

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
