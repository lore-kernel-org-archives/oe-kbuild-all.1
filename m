Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5731624E0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 02:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740536542; cv=none; b=brIlbkZb7nYem6jXwiecw/PFyrtFeCoIT2qPmqM4WdkqsYEq2prfUMWn6uAgDQQsPci/vDDNhDVCvYwuE6G9MT3U7Y99XdjAHa2FjGubwqNV9WICifBN4gC7bPIDdmv3lOR/mXzUfctlv5aAJqczW7MYytYMuhWfO5orf2M2LIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740536542; c=relaxed/simple;
	bh=IA4BMcGsdi0SEzj65nZGc4w3+JsC4v0BCLw5vPSokFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O4Gyqz7sWlEjtkCOtxXrsRFjICDnzvnWTYK+TVEJsj4HjuSNfaHWjRzhdPoDYm11+4mcC2dJJvXjBzvFSYH9A0bmsmUxGhme0rTDYEURIfuFhNgpr0YvZOos37RXNdlxxapy26mSHjVNmkC90EHLwPZCe/AYUzGF8EHmukZfiH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xcpo4Xtb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xcpo4Xtb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740536541; x=1772072541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IA4BMcGsdi0SEzj65nZGc4w3+JsC4v0BCLw5vPSokFo=;
  b=Xcpo4XtbRAjRJerLZFqJfUZh3K/LynlFBl6yKtttzfoMqUxE6cwfX4pj
   spq8oATuNzO1jhuM/6X4T5G5I+8Sq3kZcDbClsidRDf+59zqtVM5DOrrx
   AqY2qjJQpdk182TkeE77M28LoIqQUCubQ7nSC3pjWKCTtKiRNyY740QfQ
   XxzcEhhAJXHzGdy3ox1j3q4OyuFTZBIGHo1EzvbnGBH0WQGgIi+y3pcU4
   v97OmwAPLDTDXvftIaYSSf7hEQfQHCYMvPIbPfWeuuF0pePjXtGdtetlT
   bIS/iH0LDoWhdLEbHhwDllkw+VHiPQi/930tGF2zmZdPXgf9EaH6jpTNe
   Q==;
X-CSE-ConnectionGUID: Mg3qSbcWSdqAvhu9+iRMEw==
X-CSE-MsgGUID: RevJQ8MzTBSG8HKM3eki2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40605220"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="40605220"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 18:22:16 -0800
X-CSE-ConnectionGUID: kHWJ5jlHSR2aHE+/9GUZFw==
X-CSE-MsgGUID: LwT7tTbqR8C/0ysKIPi2Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117501053"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Feb 2025 18:22:15 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn73m-000B19-2S;
	Wed, 26 Feb 2025 02:22:08 +0000
Date: Wed, 26 Feb 2025 10:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 2/2]
 arch/x86/include/asm/pkvm.h:151:39: warning: declaration of 'struct
 tdx_module_output' will not be visible outside of this function
Message-ID: <202502261003.oSgTw6h8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   1340b52753f1557497f8d399a5e8ec6bf6a76002
commit: 1cd69cd68d8470b2504c03c331dca866646cacff [2/2] Merge branch 'android15-6.6-2aa57daa75e0' into android15-6.6-desktop
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250226/202502261003.oSgTw6h8-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261003.oSgTw6h8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261003.oSgTw6h8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/coco/pkvm/pkvm.c:10:
>> arch/x86/include/asm/pkvm.h:151:39: warning: declaration of 'struct tdx_module_output' will not be visible outside of this function [-Wvisibility]
     151 | u64 __pkvm_module_call(u64 fn, struct tdx_module_output *out);
         |                                       ^
   arch/x86/coco/pkvm/pkvm.c:53:27: error: variable has incomplete type 'struct tdx_module_output'
      53 |         struct tdx_module_output out;
         |                                  ^
   arch/x86/coco/pkvm/pkvm.c:53:9: note: forward declaration of 'struct tdx_module_output'
      53 |         struct tdx_module_output out;
         |                ^
   1 warning and 1 error generated.
--
   In file included from arch/x86/kernel/cpu/pkvm.c:7:
>> arch/x86/include/asm/pkvm.h:151:39: warning: declaration of 'struct tdx_module_output' will not be visible outside of this function [-Wvisibility]
     151 | u64 __pkvm_module_call(u64 fn, struct tdx_module_output *out);
         |                                       ^
   1 warning generated.


vim +151 arch/x86/include/asm/pkvm.h

317d3034702744 Shaoqin Huang 2022-12-06  150  
0b97a4c41ed1bc Shaoqin Huang 2022-12-07 @151  u64 __pkvm_module_call(u64 fn, struct tdx_module_output *out);
0b97a4c41ed1bc Shaoqin Huang 2022-12-07  152  

:::::: The code at line 151 was first introduced by commit
:::::: 0b97a4c41ed1bcb8f14bd5c08e1714877bb0c2a8 ANDROID: pkvm: x86: Add pkvm guest virtualization exception (#VE)

:::::: TO: Shaoqin Huang <shaoqin.huang@intel.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
