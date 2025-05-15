Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C02E25D1EA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747334595; cv=none; b=ZVomcq+fSsSaQOHhQKL3Q/iXhzNV99j9FogGMUeXlR1CsQm2aWTIuKpZg8q1fE0dlBaHesVJ62DWaiIZP3oN6+P3AquyTxGA1ydVjWUcbk9wigDBh1CmNCVdLN1/CC1mEXvyLAZo4W2S15DjIQ3JrSLVyB6gwRh0tf9FtCm6KNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747334595; c=relaxed/simple;
	bh=yy/yKzs6ALJiLo+OvfI8jGw6P7vbAHpSZsQcdyK6w5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K6zLPrciTOh7ysT3H3WdMxaGI+e7O8YjVPBTblyeDMVQXWuNvosl7goVcPFCLZ2E59StgZtfroqKZpNKCCoRftBA1/6687w2T4JIHr1iNIhKtQG2UDkfUUz4bDrYa4mKRnp9uqXEPKxqz9rBfxcaHuse+lVYaNhce3dy5Umv8y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKlvs/Cg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKlvs/Cg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747334593; x=1778870593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yy/yKzs6ALJiLo+OvfI8jGw6P7vbAHpSZsQcdyK6w5A=;
  b=dKlvs/CgVS4CxHTibPrvl9X297QSkY0287VMy7qME0hV1YG6XXyimFCd
   wQ2RZU5h+aZZX6+tUodGgw5r8cWjC4o7SgD507u9K6AO0frDgOf/X4SaS
   +INW2Kc8xhrXerVdF397zHm47w4JNxCDv/tqpcg/DwRBtIPU+vAsGl7J4
   IcgbNLWm7UjIoPItRfHNKvP7Xgtt0TCfCR1NQzOHGiWFoY0RzdZ+OZpuu
   jJkJK+pPkZw+XBEolyQB2SCUP/6Kzp8pSfpRd6RFFOjAfZqKkF8hni6Z9
   6EnePkjdA7TDhv3YyuYCfv2KsgI99x6QwRBjLJPM6reE77q+SeRsf8WTO
   A==;
X-CSE-ConnectionGUID: 9m2LFR94S66d+v38vpCJFw==
X-CSE-MsgGUID: l8u4rOJKRzmVMNVVviBOOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60628599"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="60628599"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 11:43:12 -0700
X-CSE-ConnectionGUID: mXRIUAEnQ1mI0CRPgH4DFw==
X-CSE-MsgGUID: pVwLuxLPQyaGGOTU/JFsQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="169531170"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2025 11:43:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFdXx-000Iet-2V;
	Thu, 15 May 2025 18:43:09 +0000
Date: Fri, 16 May 2025 02:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.core/bugs 9/16] arch/loongarch/kernel/head.S:112:
 Error: junk at end of line, first unrecognized character is `W'
Message-ID: <202505160247.6K3N61vR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.core/bugs
head:   d48421441aaaf2c09d7310bb21c3c34d61f1a8d9
commit: 17fd4a446ef30eb9afc7d0f72f5bc94ecc4b5c39 [9/16] bugs/LoongArch: Concatenate 'cond_str' with '__FILE__' in __BUG_ENTRY(), to extend WARN_ON/BUG_ON output
config: loongarch-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250516/202505160247.6K3N61vR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160247.6K3N61vR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160247.6K3N61vR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kernel/head.S: Assembler messages:
>> arch/loongarch/kernel/head.S:112: Error: junk at end of line, first unrecognized character is `W'
   arch/loongarch/kernel/head.S:145: Error: junk at end of line, first unrecognized character is `W'


vim +112 arch/loongarch/kernel/head.S

5aa4ac64e6add3 Qing Zhang   2023-09-06  110  
628c3bb40e9a8c Huacai Chen  2022-05-31  111  	bl		start_kernel
2d2c395217d223 Youling Tang 2022-10-12 @112  	ASM_BUG()
628c3bb40e9a8c Huacai Chen  2022-05-31  113  

:::::: The code at line 112 was first introduced by commit
:::::: 2d2c395217d2233e752dbddcae3c5d94050b48c1 LoongArch: Use generic BUG() handler

:::::: TO: Youling Tang <tangyouling@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
