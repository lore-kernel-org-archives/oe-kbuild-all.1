Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD564A0C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766141353; cv=none; b=r1ABBrZD3HhbJ0boy2Tas4DVW8e3sQrF+SOGEYDS1BjJ45C0OidXstFJPne4ULksxerhLj2niAItWt6M4c/pXYXZ+OTAaLGXL+B3KwxT31+fikK8f/GUn0XCh74nuknjrwe+Az5e5q0/F/DmaeWOHVdgserxy0RaaZj50kFeHxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766141353; c=relaxed/simple;
	bh=fPU+6uJrLmQcaDHpYqMDYI2EWHPDwlNY/B8Wkv9wRIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VPHVDVbj2JTm+x5TaEjoOlqY34CZoNStSLuvKI+thiq8VlktWwm4ks2HlA8GNmaFrtA0Q7bTVrLyZvqMB2GqLgRoJ4jtloDVafXgKp8wKEeqQciOidOnWuRNbV2NIPcSuMOGPwEKsj2oNC4kmP+dU1FVX0VCQQaaQCx4jnnDAuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoJMrPg/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoJMrPg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766141352; x=1797677352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fPU+6uJrLmQcaDHpYqMDYI2EWHPDwlNY/B8Wkv9wRIc=;
  b=VoJMrPg/LHHoxTkexslgQppmbp//VRfew0u0Yldl+ZZKUz7kFBYcEmIk
   CcDo36Tx/Ge69fqTgVbWATSo+lm+Z95H2NDqdAh4E+Egy0f7vwpqalLrz
   MzuVeqb0X8LiI7fLkrrrtpBAziJcRFw6l8ALVphtByx0McCFOuahBLunt
   LUruLwDn8kpKOA/pKfsnrr0eCjuYCWhR9CXIi//Tovl/CYKn0jzs6VlY8
   7OKDUXrT2rUN1YnfX+2KBMV9dXuArR2zf02ixwS4Syzj7K6TpKzoakY+Z
   zlnnFfhkTNjtoShZmJQS3wlJSO+G69RgBJeHm7jCGaeEZIB6U7e9eeuC1
   Q==;
X-CSE-ConnectionGUID: RKk6Q7CcTWqF9q2i41e0XQ==
X-CSE-MsgGUID: h2V1DpTFQQCu5wbey3jQTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79222385"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="79222385"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 02:49:11 -0800
X-CSE-ConnectionGUID: 09f7luqtR56wQTfe09YtdA==
X-CSE-MsgGUID: DxjLC5A6SJu8Gy1Jd6Yp+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="236258237"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Dec 2025 02:49:10 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWY2l-000000003NT-1VSs;
	Fri, 19 Dec 2025 10:49:07 +0000
Date: Fri, 19 Dec 2025 18:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] arch/x86/kernel/ftrace.c:691:6:
 warning: no previous prototype for function 'arch_foreign_patched'
Message-ID: <202512191859.x5I783Gi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yihao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   7d06d639106cda70074fdaa0e0910c92274e47fc
commit: 18978e3fb6aa251cfe4851c5249c427cc11d5344 [0/1] anolis: kprobes: fix ftrace conflict check for aarch64
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251219/202512191859.x5I783Gi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191859.x5I783Gi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191859.x5I783Gi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/ftrace.c:691:6: warning: no previous prototype for function 'arch_foreign_patched' [-Wmissing-prototypes]
     691 | bool arch_foreign_patched(unsigned long addr)
         |      ^
   arch/x86/kernel/ftrace.c:691:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     691 | bool arch_foreign_patched(unsigned long addr)
         | ^
         | static 
   1 warning generated.


vim +/arch_foreign_patched +691 arch/x86/kernel/ftrace.c

   690	
 > 691	bool arch_foreign_patched(unsigned long addr)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
