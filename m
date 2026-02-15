Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0941DE885
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771155299; cv=none; b=JFPjsQnyOwsro+SQytYMkZs8+sa2T9KS7ffB9UMLevwh94AO++V0pv+6agD5v/71Ld+g+hrWxUmJhRdjC1WwivAb4aHGWah7SiY0UWl3UY+Q2FnSZgFLPVukcZq5YNcjKDPB8l3VwtAo9FEyxtHwXb+35aeBRdfr/GmE4Cp/0uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771155299; c=relaxed/simple;
	bh=xtL4sJ/wPig48NuqGEHCuPGFPXx5Fdf20EIu6okp08k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X7MaYWLljdUWpo2tTPtQmLjl6ImRWkxIF6QmQCoXlHkZ3p4c0IiQrDlHBmg2mKXasejGIZXZ0ICNCt7mYPvDDg5vphsDkt2QGouMWEeO/JdxvDZX4RJhKo4Ke+qJFcr++nyAmIP75uBUmhRAMtwC1q/uTPWZcqRVKQXvNUv+lDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9Q4bEGw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9Q4bEGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771155297; x=1802691297;
  h=date:from:to:cc:subject:message-id;
  bh=xtL4sJ/wPig48NuqGEHCuPGFPXx5Fdf20EIu6okp08k=;
  b=P9Q4bEGwDxPuqbLsLyPtvskOZjohKskSQyanPv6Fz34OaQ8Wzc9Z8Pdh
   5zRywAfhO3UoROudLSKLR90KU6SyZqJ/0XTD4uG6PGmkVKAjUdCOcysJz
   j2oK3AwXtXUN3yzpIZ8PKVUGTgfncyFpMxlZkJTYcs0QSSMQG6KDvmISl
   eJKyz+3kI7w65512D2yfy1c3ubawOfNMdyzlDmyevnl2tQgKpDKSvfNNV
   DD3uOmYGH5Lf+ErmzPPn2NsxmaOFUD/l0qH3VZcoyGtOFcWdYlZG2FCSy
   UDYr8waaTiyEfnM1GB+KCcqTF0TDrDKr95Zd3QV6zlagSoCIA0G7h2iGr
   w==;
X-CSE-ConnectionGUID: IXGkTjTBTXm6PecPhgzRoQ==
X-CSE-MsgGUID: hI+xDKW6SrOx3cw8c3tL2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="72170828"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="72170828"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 03:34:57 -0800
X-CSE-ConnectionGUID: zYlv0dxlT3mkHlnC17ObXg==
X-CSE-MsgGUID: ib++I7oNSsC29oFUvk3voQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="236343714"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Feb 2026 03:34:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vraOr-00000000yQm-27jc;
	Sun, 15 Feb 2026 11:34:53 +0000
Date: Sun, 15 Feb 2026 19:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fengshui 9/10] kernel/bpf/helpers.c:2332:18:
 sparse: sparse: symbol 'bpf_coro_frame_free' was not declared. Should it be
 static?
Message-ID: <202602151913.r4uUWKBY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fengshui
head:   deb002811418a4474f90d6d372ca363328cad588
commit: 440bca6951413ab7fbd8f23f124d531066c5794a [9/10] bpf: add bpf_coro_frame_alloc() and bpf_coro_frame_free() kfuncs
config: m68k-randconfig-r111-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151913.r4uUWKBY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151913.r4uUWKBY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151913.r4uUWKBY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:1212:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long ( *[usertype] callback_fn )( ... ) @@     got void [noderef] __rcu * @@
   kernel/bpf/helpers.c:1212:21: sparse:     expected unsigned long long ( *[usertype] callback_fn )( ... )
   kernel/bpf/helpers.c:1212:21: sparse:     got void [noderef] __rcu *
>> kernel/bpf/helpers.c:2332:18: sparse: sparse: symbol 'bpf_coro_frame_free' was not declared. Should it be static?
   kernel/bpf/helpers.c:2614:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2644:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:3113:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c:3118:18: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +/bpf_coro_frame_free +2332 kernel/bpf/helpers.c

  2331	
> 2332	__bpf_kfunc void bpf_coro_frame_free(void *p, u64 size__k)
  2333	{
  2334		kfree_nolock(p);
  2335	}
  2336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
