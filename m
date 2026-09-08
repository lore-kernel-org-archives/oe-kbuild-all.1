Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9FC361968
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 07:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853215; cv=none; b=jGpREWM0xpH53HnDmzuUF/PdRubpVLR18Guy83gV7xFmf4YFizMzL7ygN5KXOTlxxcCFPX7XSwxL1OnwZZVTYyaVPzOcl3nDGNQo0XrkgJOetiudM3mvTc7MHRoct2TqVKQrSbmHHUAidkeqVbar5FaYy/uz6pp1/68KdTvXxLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853215; c=relaxed/simple;
	bh=bUvhtyi9e4lFC8m9eCcyp2a9GOWLEwj6WNm7MgXVWrA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hJkacvSfrn1xYNj3cTg1F5b77Sps/kvata1a8X3vzEYoH3yUFaO4c8iWPsNasT8PLmgMtwRvUpmk3iaVD+lRMUu3xgKX2Fpw+wXTPih84FyU5hWXm8xhsZbj3Vz8kChfPF0YUZhxiW4kUo1Td+zpzLb2CtKq2lRiOmEfQ4IVFxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ik5lK52C; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ik5lK52C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788853213; x=1820389213;
  h=date:from:to:cc:subject:message-id;
  bh=bUvhtyi9e4lFC8m9eCcyp2a9GOWLEwj6WNm7MgXVWrA=;
  b=ik5lK52CqA8B3viqGI+4RiKdG10VmS6ZoRju8PoWA5w+VUZz1u2ppLzY
   DXm2I+4JQ5DW2WufcvR+fxUX2jq7m/Q7EhVaawdse7taJTbulVBPP6YJy
   S7vQggBBvuuEeYAzvHmNhD08lqoHqLDwKn7KGema8YkjHAv7kK+RCbDBK
   8lOaTzJ/SOVigUYXbuvcIBA1wc4AVCFSm8043eBWkJXzSuznfyun5guKL
   fGKLBhmDjGvHk2DNBtkLNsiKJYDgP8+VYuEOBrnWExPBSYaVQ83A5S+Gi
   MnF8Ka0VKn0d87w5XCrKImBYOWDDsLVV4/9OkOCBMy+1a7xLxh4j0fRWZ
   A==;
X-CSE-ConnectionGUID: uvy1LKulRJCXRXIL3cFHYg==
X-CSE-MsgGUID: 11AJvzjrRsCi3aOF/9aHHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88396370"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="88396370"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 00:40:13 -0700
X-CSE-ConnectionGUID: P+YxPCbaTBy/7rgbRFii/Q==
X-CSE-MsgGUID: p1WtuBkNSeK53xvmwJgmQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="268347372"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Sep 2026 00:40:11 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3qR6-000000001pR-1kJn;
	Tue, 08 Sep 2026 07:40:08 +0000
Date: Tue, 08 Sep 2026 15:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 24/25] kernel/bpf/helpers.c:2417:18:
 sparse: sparse: symbol 'bpf_coro_suspend' was not declared. Should it be
 static?
Message-ID: <202609081543.8TDIBK0I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   0de8fbf4ea7faa920d77adc60e4388798226d425
commit: ad66b0bda534ef2d0d681a5675c32fc8e5ec140e [24/25] bpf: Add no-op bpf_coro_suspend() kfunc
config: openrisc-randconfig-r122-20260908 (https://download.01.org/0day-ci/archive/20260908/202609081543.8TDIBK0I-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081543.8TDIBK0I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081543.8TDIBK0I-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:1228:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long ( *[usertype] callback_fn )( ... ) @@     got void [noderef] __rcu * @@
   kernel/bpf/helpers.c:1228:21: sparse:     expected unsigned long long ( *[usertype] callback_fn )( ... )
   kernel/bpf/helpers.c:1228:21: sparse:     got void [noderef] __rcu *
>> kernel/bpf/helpers.c:2417:18: sparse: sparse: symbol 'bpf_coro_suspend' was not declared. Should it be static?
   kernel/bpf/helpers.c:2874:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?

vim +/bpf_coro_suspend +2417 kernel/bpf/helpers.c

  2416	
> 2417	__bpf_kfunc void bpf_coro_suspend(void *p__ign)
  2418	{
  2419	}
  2420	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
