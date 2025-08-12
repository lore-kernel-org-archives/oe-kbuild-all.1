Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E09D2475C2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 05:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977147; cv=none; b=gsaCjGjiCOQTTl1PfJK+eJWi3DzzGgbexqQwdO322lD15QW4Rc0hq9Ki6p7Irst8Hh3gOaoCKAFOHk4ormNNPr1ZPJRbydEjxafarIoeKsIXZtldWG2TObY02d6LAozV5/Wuo6XvwnVI+fy14/B8wswDWNGJ3L/1999VdrUWAIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977147; c=relaxed/simple;
	bh=V2AO4u60fXIClZ6YY3wt2TGm2k3JRzkIMwsVuq9kD0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AGg6cglEJYp9qEVBUozbuSfAiZ1Zqf1FUrSmh/oVefe/wA00krZ+URY/fcJsfbyump0IJnTLnvdymhpcSAFoeqWMpoTSgge5F9ZwOXwCDIs9eyg0OuTX7HFV+MBEetTRT1t7lN9a+Cd/HeJErByKETLP8QTTFLGzyODOoHjiGzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YggTF7QK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YggTF7QK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754977145; x=1786513145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V2AO4u60fXIClZ6YY3wt2TGm2k3JRzkIMwsVuq9kD0w=;
  b=YggTF7QK5NOn+fWrmGsPLfTVSJHF8p5Ryn99VDY30YtLbWxoCSLCj77y
   TDWZVPMwo/2WTdLaPNWnHwbqBxqFBM92LMeoH3TaW0yxaLh25Y8bWKowd
   aopxdHIuhI82t3+ceO9frb6/4joYSzqXGBKLqRbegNJ5pQsnRNgkvecQu
   WJBN3922oY1St8UvNdVqykemnY4u/qLUSzLVv/jGIprM7Iqq+nKMdAe3l
   0Aw25dOEqNecrU0x6lvRKLqHs+j6U/QDsPl2dRtm1EWtn6mm+TZKC1GoJ
   YTgN42LAPvMb9nSFEXSDbJn98mdFHQAcOkarJT+dLaio1mdxf6UiUyop0
   w==;
X-CSE-ConnectionGUID: TgjOEKszSbiK33xmAJAkGQ==
X-CSE-MsgGUID: zAIVuktZSoyyb7Sq1lQOIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="59854502"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="59854502"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 22:39:04 -0700
X-CSE-ConnectionGUID: 1UAwgLWqSCSB8OzgR8cUxw==
X-CSE-MsgGUID: sB1Ldb3oStGTez+EbeQ6ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="197106476"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 11 Aug 2025 22:39:03 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulhiv-0003F3-0w;
	Tue, 12 Aug 2025 05:39:01 +0000
Date: Tue, 12 Aug 2025 07:38:44 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1750/1750] arch/x86/mm/.tmp_maccess.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202508120725.n4YJFfFe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a7892155ca524e224cb2da85c85cc1bd4303179d
commit: 22058d2bdaf6b0526395ceec2736c72c3b5f435a [1750/1750] uaccess: Add strict non-pagefault kernel-space read function
config: x86_64-buildonly-randconfig-2004-20250805 (https://download.01.org/0day-ci/archive/20250812/202508120725.n4YJFfFe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120725.n4YJFfFe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120725.n4YJFfFe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/.tmp_maccess.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
