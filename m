Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5FA376473
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534320; cv=none; b=Tl7c2moSaUOu+u+5PRruzilHiqnZZRIBEGLNVyXSL5rCt05GLT6gCFeGmtKiKe83jyB6/xDg77FLSiAJW3X0bDV02Z7EoHYS2nJ4S30z+uROCR73Qo+rRw6LfLwHHojQn79DzEh5L1DKlvmf1Kei3nBhQjCD4i3hFfx21+89J4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534320; c=relaxed/simple;
	bh=iF8HM7As9QwIhc0qVW9Hmcg2pdxVM97ITd/bJKi/QWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iOgt2PpicyWO8lBXCq8MUaNxO6ipmai75eg47q4QHWyMB0cV+kClJSK9YwurQaLlhaYrVZqFDS5z0G5pSbmvl4+aYoU8BKkYRXj5NXhLVfpC6b4ePCNeETzZKkRJubkc3IlHpBxpTQsXQmH+SdyYS2jmmHeAsXwNJoRmXcs6re4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWbSJlsI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWbSJlsI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534319; x=1807070319;
  h=date:from:to:cc:subject:message-id;
  bh=iF8HM7As9QwIhc0qVW9Hmcg2pdxVM97ITd/bJKi/QWg=;
  b=UWbSJlsI5LQg+buZK43ue8xUoXV7Flnm/ALVjFJi2ifOFCOQmKiT1/Zf
   PwYQOUt8Pa7+y7eunQlufi7eLinCtoC3QEsKJZw3Vd+6oYwZbXnShitDG
   YkEGdhbTWMhVKEsHeayEdWSz+h/dMoqpTZHdgO6h6uxX9O69cG8RUWXK+
   1xAW/lM15yFvDxKQDXPBUxlD+mk2JlSGLHIoRS3LBJMSSxorFIpHuYSuk
   p0GZ3j1qDZ8kjlv5/Fd/92IYhgWVdgxpWI0gmkgxW9J+mV/OB9JnN+6L2
   2MWqOGQN1fdKX9jaGmmbAelmU1IkGfPIyRhqt32IQIoAwAjbEdy26kqzS
   A==;
X-CSE-ConnectionGUID: YUejPmjAQsirOmH4CvwreQ==
X-CSE-MsgGUID: kd1w7HOXSEedXkXBL//Kew==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87114190"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87114190"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:58:37 -0700
X-CSE-ConnectionGUID: XQ1rsEMgQxaIL7NtWS4dMg==
X-CSE-MsgGUID: yTKb7YMhQr2i8kgpTv1uUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223259671"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2026 20:58:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xaD-0000000006F-0sEa;
	Tue, 07 Apr 2026 03:58:33 +0000
Date: Tue, 07 Apr 2026 11:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Schrrefl <chrisi.schrefl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Alice Ryhl <aliceryhl@google.com>
Subject: error: kernel-address sanitizer is not supported for this
 target
Message-ID: <202604051027.NPt0H2Dy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3aae9383f42f687221c011d7ee87529398e826b3
commit: ccb8ce526807fcbd4578d6619100d8ec48769ea8 ARM: 9441/1: rust: Enable Rust support for ARMv7
date:   1 year ago
config: arm-randconfig-r061-20260405 (https://download.01.org/0day-ci/archive/20260405/202604051027.NPt0H2Dy-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051027.NPt0H2Dy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051027.NPt0H2Dy-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/dtc/dtc-lexer.lex.c:630:12: warning: variable 'dts_version' set but not used [-Wunused-but-set-global]
   630 | static int dts_version = 1;
   |            ^
   1 warning generated.
   scripts/sorttable.c:399:12: warning: variable 'long_size' set but not used [-Wunused-but-set-global]
   399 | static int long_size;
   |            ^
   1 warning generated.
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
   28 | #define __SANITIZE_ADDRESS__
   |         ^
   <built-in>:367:9: note: previous definition is here
   367 | #define __SANITIZE_ADDRESS__ 1
   |         ^
>> error: kernel-address sanitizer is not supported for this target

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
