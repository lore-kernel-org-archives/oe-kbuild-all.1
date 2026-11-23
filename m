Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477619;
	b=kXxJP7j2vsKo0sLSf/iMdErUcH5NMTG8dMHXTeDXNx46nCB4cpXqfYteLzoDpMIXnMrv
	 8KMLmLWF0lxbnuKnMf1KSQg1edohaIPkGzp+Es5HfgApGE7+YSSN7J5NFI6VjvYlic+MK
	 dkxRNe96OoXscbJpW6gKTzHJr2v1JydJ2B7xj6YwLVU99kaxHO0k5wab2cj4ehUonX0Zi
	 ulYw5DpDEezPt0+XvbWLARs/d90MarJCJ2gmibrhemaX259tvYfHziQ4FZtmOi347L2lK
	 4vEC4eMy7rLVywIm2B6G0WOneJEjU0nXk7KxOxj/YQu9Ade89sXoqsrGu9vQBtbFicQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477619;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IHuFCjg6uGSROsHkeeuNgY7OHp6cCHydqB/Y+QGwRbo=;
	b=Z3BhJo71/BGI4UbNFlmqzvsf13TFrmHm+BcbByxPeQVHoLmjGlof6+W5zSoVAVraKG8D
	 c2fPUwDI+sz+PveRD+6j600ToDLqSp45Pkfh73p3RFx3RqwvLQMU0R0u5Xt3O4ZgOtmOB
	 /TvQj8jnemjHC8GzIpWGgZsnEKVwk5zld343ulqdN3xSKtLG/UFV/8qoapxuFPd1WqZ4+
	 J/BY5MEGC9XAZFnZoRvOjEld8g1FMXIK8iQPBWzwxATF0Fq7vMyxaWkS7lxr3qqF3Dfub
	 LvvJMjo/AOzsM4540VMxVHmhANISmOVKTcVbbxCp/61yAv3H5TDfHp/ITevpg1JsfmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jxN7nlFD;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4F9606A31E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 23:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D4F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jxN7nlFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795477618; x=1827013618;
  h=date:from:to:cc:subject:message-id;
  bh=8a3O12/LlSKNMKvcY3zsuImpmn6UNHNmcvsIopi2Uss=;
  b=jxN7nlFDj5yl5nsSH3dqsuNULtG9hguB54BUcJYq0S0NyAxJWyAA4XsR
   IMhUNYyEjVhqLHLPvzgDzOZBPeYKVlpJS38I9v0JD6epsnOAlYewuQJRh
   PHZfxpSdv1hN8IuEHT9lThxmWwB5cXmz98OA6hcMI9btEGiiupg92DSZh
   ent1hFThkGaI0Xj3YGewPVpxYpcOw2T6/hMqTMH0/qu7w3Sg9aXDrSMxP
   U0ap9hVK8wfPM4Udbq9Rqbc48bb0W5bDYZKEYlWzTAQtyFmokq3VOkceP
   ELlrtfMEKe/sLXtrUpTm4oLSesZ3WMjncsACTzwnd+MKMzSctZ2V0i5J9
   w==;
X-CSE-ConnectionGUID: vGJBCy2JSNi3JwGSrxgNNw==
X-CSE-MsgGUID: zcVHP61zTO+l+gY13Eo54w==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4284405"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4284405"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 15:46:57 -0800
X-CSE-ConnectionGUID: 4hNF1L1qSKG76KsU8XRd7Q==
X-CSE-MsgGUID: sM94m3itRO2vgZyKIohDTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="13108993"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 23 Nov 2026 15:46:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVdkM-000000004yz-1WWw;
	Mon, 23 Nov 2026 23:46:54 +0000
Date: Tue, 24 Nov 2026 00:46:18 +0100
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4a 18/18] ld.lld: error: relocation
 R_X86_64_32S cannot be used against symbol 'kunit_unary_assert_format';
 recompile with -fPIC
Message-ID: <20261124004010.dYEjobXx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4a
head:   855781708e7ffbbdf2b596e8a7edc75d51662bd8
commit: 855781708e7ffbbdf2b596e8a7edc75d51662bd8 [18/18] x86/kernel: Switch to PIE linking for the x86_64 KASLR kernel
config: x86_64-randconfig-2102-20261123 (https://download.01.org/0day-ci/archive/20261124/20261124004010.dYEjobXx-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124004010.dYEjobXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124004010.dYEjobXx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_X86_64_32S cannot be used against symbol 'kunit_unary_assert_format'; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by kunit.rs:140 (rust/kernel/kunit.rs:140)
   >>>               vmlinux.o:(kernel::bug::tests::kunit_rust_wrapper_test_warn_on)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
