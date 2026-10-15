Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EBE2F39B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 03:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034280; cv=none; b=YmVmFbav3yEIZecioLZVt3FUHvCuSyB+uG1Pa3r2d840Woi2jAM4UYGDoz1ogLUhDDmF+TEeyvM8SOIOe4lgbRAti8geIphDk6yqJHZx8wc62E6S4KodfHrIW/XGpupTg+miMciIzAml24IbzLebSoPZFJp/9Gu6tMPS/YCce5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034280; c=relaxed/simple;
	bh=Pvpu1UnPSkluZ2aXXQDBoG3pthmNAbMwG/ymdMEAbp8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gvr9pYFmleiI2K4a3+jiapjAMzmlQwc23Crui98OkQ+LDFZ2NQTpURdexPy/ENAEwZa6GlPYhUeQZsyeYM4Xt/s8Q7PknwPnjeW4/LGIJkYF0JrXZl/VBx62zqaBG8aDpetlMiJ6fhbX/2Jdxs4C7uhhD6JzvSBVNAFaUV6c5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwWyJB4N; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwWyJB4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792034278; x=1823570278;
  h=date:from:to:cc:subject:message-id;
  bh=Pvpu1UnPSkluZ2aXXQDBoG3pthmNAbMwG/ymdMEAbp8=;
  b=bwWyJB4NGDgYKD0gCeSCa1Z5JdZl7ZcCwEqC9NNMDrGYKKVWaDxwp0ik
   2+w0LXYZk4bF22MUkQF6hnqg5z+XJGDUCLhSv3EcuUqhot933D1SdbxX2
   urN8o10FNuj1OO81rGdeESP5qH9Clg2flaK1lEK07XVzQG+7jWZr1lArK
   A4LINqIXui11EKREwiY0up6Nx7+S0E6KEzL5HepvFrxFH+w872RmB61ks
   ynQRw3B9GEITscy0AoxlldxoDUGq/RN1sk/bWjKzHPfDsyfyH67d5+if+
   SAMvbyqGlHguCeo9qWh5cOEciZHxpevWdQ3yZHddmJmNvPXnIxaA/h/i4
   g==;
X-CSE-ConnectionGUID: S/BygeC/SNuXjWk8pqMoMw==
X-CSE-MsgGUID: XhT7rBFuTiGp9cPKPn2otw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="823830"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="823830"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 20:17:58 -0700
X-CSE-ConnectionGUID: wA0wvrxeSh6pqTvkPaTaKA==
X-CSE-MsgGUID: GLNFAWeFQI2UsseLiMsF3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1666777"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Oct 2026 20:17:56 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHByb-00000000FiF-1mw9;
	Thu, 15 Oct 2026 03:17:53 +0000
Date: Thu, 15 Oct 2026 11:17:35 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>
Subject: [dwmw2:spinpark-arm64 10/20] WARNING: modpost: vmlinux:
 section mismatch in reference: arch_cpu_preserved_is_active+0x8 (section:
 .text.cpu_preserved) -> cpu_preserved_get_stack_context (section: .text)
Message-ID: <202610151002.aEfGXBBO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux spinpark-arm64
head:   c36bf9732ee79ac6311b2168966b2e4cd92688fc
commit: 4b856ff3c9e3e863a899ac513e41cd560d1a9fe6 [10/20] arm64: liveupdate: Add support for physical CPU preservation
config: arm64-randconfig-1002-20261014 (https://download.01.org/0day-ci/archive/20261015/202610151002.aEfGXBBO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610151002.aEfGXBBO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610151002.aEfGXBBO-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: arch_cpu_preserved_is_active+0x8 (section: .text.cpu_preserved) -> cpu_preserved_get_stack_context (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: arch_cpu_preserved_switch_pgd+0x20 (section: .text.cpu_preserved) -> arm64_flush_host_tlb_local (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: arch_cpu_preserved_park_init+0x14 (section: .text.cpu_preserved) -> cpu_preserved_get_stack_context (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: arch_cpu_preserved_park_init+0x94 (section: .text.cpu_preserved) -> arm64_flush_host_tlb_local (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_is_preserved+0x2c (section: .text.cpu_preserved) -> nr_cpu_ids (section: .data..read_mostly)
WARNING: modpost: vmlinux: section mismatch in reference: cpu_is_preserved+0x34 (section: .text.cpu_preserved) -> nr_cpu_ids (section: .data..read_mostly)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_is_preserved+0x38 (section: .text.cpu_preserved) -> __tsan_read4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cpu_is_preserved+0x3c (section: .text.cpu_preserved) -> nr_cpu_ids (section: .data..read_mostly)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_is_preserved+0x58 (section: .text.cpu_preserved) -> __tsan_volatile_read8 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_get_pcpu+0x38 (section: .text.cpu_preserved) -> __tsan_volatile_read8 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_get_pgd+0x28 (section: .text.cpu_preserved) -> __tsan_volatile_read8 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_get_pcpu_ser+0x34 (section: .text.cpu_preserved) -> __tsan_volatile_read8 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_should_exit+0x24 (section: .text.cpu_preserved) -> __tsan_volatile_read4 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_stack_va+0x24 (section: .text.cpu_preserved) -> __tsan_volatile_read8 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_stack_va+0x30 (section: .text.cpu_preserved) -> phys_to_virt (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_park_loop+0x34 (section: .text.cpu_preserved) -> __tsan_volatile_write4 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_park_loop+0x64 (section: .text.cpu_preserved) -> __tsan_volatile_read4 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_park_loop+0x98 (section: .text.cpu_preserved) -> __tsan_volatile_read8 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cpu_preserved_park_loop+0xa4 (section: .text.cpu_preserved) -> __tsan_volatile_read8 (section: .text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
