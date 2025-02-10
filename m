Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514411ADC8C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 05:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739167174; cv=none; b=KBBAQYCXuveun49nFDIHGNJ4FB4bzW3BtjpvCVSZhNjuols/5Rqi6D7teE+qK2E6yEDbFWmZWN6KuExZtH1TANt5wmyAM95bCRgecEDtYjBErKS3az6jRLayWosgbRlNNrOLtgWaCW6g+E0+b8mOPHhFMejM6WB1mWQ9iu6HFgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739167174; c=relaxed/simple;
	bh=PpmSQeoYKvT8oteDm+bsrMk+6sWdVLNpEflWL3onPq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DGLhiI+wCoyE+oiluKfCuoKIbGbL7T6hZr0wSDksAm1X5I5tOC59Cm8Zq1MGmnfBywqn6t5ClAvDqayAHLSrMHp/ZtHlANaIsDlAxKq39qKk/n94xP+PQanvytwSKyuYNvLDhG2NYFH6xn1zw/QEZg5ZfvSVLtxdtw12xxeV7Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gdq7Meuc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gdq7Meuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739167173; x=1770703173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PpmSQeoYKvT8oteDm+bsrMk+6sWdVLNpEflWL3onPq0=;
  b=Gdq7Meuc1abYhIlB8Me0xYTquR62lMG0PsIeDwrluwtsBEP8boA2kB7H
   IatL3fDN5XWn+bM81ruY7y28FBAOxGad9yzCdAi+Pmf9vj+52/v3rgODA
   FYo80v92S2mG9bRAoKdxsdzNctrX4UmkMYzuStmqu1WoqTZJnLV8lK+kJ
   upygQOpGFFqWyNjNmTCwwi7hrnxKB96w3ix8QKKT/LDtj0uu262xqPcwO
   fI5fQgoun7APTKgtKQnwzeSNnnNVD/XTWJ/iRhU1QHTgkY29xfxDlCBR3
   gJTaHHsWJmxi9HZPmDDeO85Rp5xYDcrfmIEIcjnWhpn1+UuXcCK8hwaHg
   g==;
X-CSE-ConnectionGUID: o7dxkWBtRz6Nl0AAk6Aa5A==
X-CSE-MsgGUID: lm5/QWyAQMqoOIPCuPuP8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="43495741"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="43495741"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 21:59:32 -0800
X-CSE-ConnectionGUID: s7ToiNH+Riqq8iubV3tV9A==
X-CSE-MsgGUID: PaEhpk5wQj+/K45+rwk1JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="112604239"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2025 21:59:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thMpM-0012Kp-06;
	Mon, 10 Feb 2025 05:59:28 +0000
Date: Mon, 10 Feb 2025 13:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 112/112] warning: unresolved link to
 `remove`
Message-ID: <202502101315.Zf0gbPNA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   fd3792ec2053672fb9359a570552a51ae48f4035
commit: fd3792ec2053672fb9359a570552a51ae48f4035 [112/112] rust: bindgen: Make snd_dec_flac opaque
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250210/202502101315.Zf0gbPNA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101315.Zf0gbPNA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101315.Zf0gbPNA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `remove`
   --> rust/kernel/alloc/kvec.rs:633:58
   |
   633 |     /// If you need to preserve the element order, use [`remove`] instead.
   |                                                          ^^^^^^ no item named `remove` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
