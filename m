Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710AE25759
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705587022; cv=none; b=oUjKKiiOjZd0XIBXVPC/c4aQjKVpK+P+2gJOY7YOtPtjinWlUuPfLX++FdZdJeiwGPy1CyNiGnSyRfFbI+UrD0SwfTipvNb5+PrDbHX1TdyMoK5yy2/MX4Ibgyva188BjLsIhy19vUFz+UHNVSUzepBmVvPg/xv/bmm+VAm0Ks0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705587022; c=relaxed/simple;
	bh=9DIQOC0g+5jdB7MtAKw7Jneea2kSzmAwNIAm1g0csAE=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=MItt+hwktotMIC08T1hVWyS1AN0cwhoOXA+4+8O2l3JBI/u6jp2QqxGD1puHbN+5uOtbPXUrAcKGWNOzLlLGhoxAXEdIQHOnsAahkD270waBtxWrO0NcGBv40TnVzINNJf2dYrLY4GFEonD/HSXmDbTQtWjU9PprDCJf7WJSU4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYqhchRk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYqhchRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705587021; x=1737123021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9DIQOC0g+5jdB7MtAKw7Jneea2kSzmAwNIAm1g0csAE=;
  b=aYqhchRkjo6bV/8mL/CeqK8s0AGH7hC/PyFHDIUzSfsBVQ3CuOfTKf3R
   Z6L4KfKBns1m0nmNn48935rJFYIfaTGYJOtOk9+dMmjINUJq+6yD0wFaJ
   zpEUAGB40AhAekYq01A0+6K0DESX7QDXUOVR/Ro/2MHTEqvGx1uKonNwa
   cNsicDL6n/5eETqgJVYniZE0+dT38XcFhQL76c5GkOuGnrzzdqM6bi5La
   ++Ku59C6oXvFSlY+UvzorBgz542FfK7uBk6LAUv1WDB5SIZJ59AgbncQp
   STbCBehi7/VMpW9NZLBM/p4D9CfcVanLo6pTGuRDvYpSTq1EH0Pm1BWEu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="19049837"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="19049837"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 06:10:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="777730705"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="777730705"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Jan 2024 06:10:18 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQT60-00032e-0d;
	Thu, 18 Jan 2024 14:10:16 +0000
Date: Thu, 18 Jan 2024 22:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vishal:vv/dax_abi 4/5] warning: unsafe memchr() usage lacked
 '__read_overflow' warning in lib/test_fortify/read_overflow-memchr.c
Message-ID: <202401182256.KHj0YhKk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/linux.git vv/dax_abi
head:   d3de88ca301b687923a19a41d16a22afcd9c40a1
commit: 8c76ff6fca69d280f0a316831957accd9ded09b8 [4/5] mm/memory_hotplug: export mhp_supports_memmap_on_memory()
config: x86_64-randconfig-161-20240118 (https://download.01.org/0day-ci/archive/20240118/202401182256.KHj0YhKk-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401182256.KHj0YhKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401182256.KHj0YhKk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unsafe memchr() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memchr.c
--
>> warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memchr_inv.c
--
>> warning: unsafe memcmp() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memcmp.c
--
>> warning: unsafe memscan() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memscan.c
--
>> warning: unsafe memcmp() usage lacked '__read_overflow2' warning in lib/test_fortify/read_overflow2-memcmp.c
--
>> warning: unsafe memcpy() usage lacked '__read_overflow2' warning in lib/test_fortify/read_overflow2-memcpy.c
--
>> warning: unsafe memmove() usage lacked '__read_overflow2' warning in lib/test_fortify/read_overflow2-memmove.c
--
>> warning: unsafe memcpy() usage lacked '__read_overflow2_field' warning in lib/test_fortify/read_overflow2_field-memcpy.c
--
>> warning: unsafe memmove() usage lacked '__read_overflow2_field' warning in lib/test_fortify/read_overflow2_field-memmove.c
--
>> warning: unsafe memcpy() usage lacked '__write_overflow' warning in lib/test_fortify/write_overflow-memcpy.c
--
>> warning: unsafe memmove() usage lacked '__write_overflow' warning in lib/test_fortify/write_overflow-memmove.c
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
