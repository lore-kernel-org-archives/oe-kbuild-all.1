Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777A93FE358
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774967625; cv=none; b=tJJEv3JmSEiDMYD8vxAXlZKQOeMhFCftg8XckEA6Xa/WPt+bnMgtb9iAQghD/89VzPVnriWWA9lAhthFpP33ax2ayKcbfqkE9/wjy6QstBIhpvogbTTba5sctFfiGVcgFq7L9+Kk4G0LPuBxK1pPM+grSKKbhCdzZo8tcQ4BPHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774967625; c=relaxed/simple;
	bh=yZj/vSsYLZQ5CT+kZWRRqW1eztBQj43O6XaiXww5wX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hrIdci5211ib9ihIHcSCBQ33r47ifEELIw5DcJRMQn4hIzSt75pHUPnJdq59QQQvFv4he0n2roWAdSeOWKzYsJH9m0BPQZeyYg3Kq1gd5m6jQsVdeHgOZC/3oc0Kv+TWISu2NGif+VgnXGCI/IZATioQaHQbpqFzdVh0autTV/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpOy4dYK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpOy4dYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774967625; x=1806503625;
  h=date:from:to:cc:subject:message-id;
  bh=yZj/vSsYLZQ5CT+kZWRRqW1eztBQj43O6XaiXww5wX4=;
  b=jpOy4dYK+v9pmcDUbF1f1fK/4GXJ6k/wnZcm+EFgGvyindg4VpEiH/7i
   4Es/Xf4Rn3nnqkkHyixPf9ny4ZiftiEC0a0jmUoLaLLuvB5N32tq1W4hT
   Y8Xq5BoUYBD68YuA6WvN/YF8vQPBgCV2TF5TaaDk8usOHW/vn+RtSZHlj
   +d0v+Do6EohkOEUyPCWjAePEjTmnRy49Tyyj3znQYm8YJ61umz3gLlYvf
   2H+ZzowuM0xoWSRDboxS5lpux/rZkrvRPRDnNgPIkvWWnc6V7yUZWgolU
   IbeCMfij3cRVINi+iKH/tD81o1LY3tfqmE/3e2gsCfjaX8UdMiXLs3zNR
   Q==;
X-CSE-ConnectionGUID: AM+wQgZOS866gmKM0Xg70A==
X-CSE-MsgGUID: qlZ5/JroRyWomxsn1Oacpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93370621"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="93370621"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 07:33:45 -0700
X-CSE-ConnectionGUID: r1BgzHPLTrC6SYcU4vz47w==
X-CSE-MsgGUID: i3BQOoSARxu/us2p0QhGYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230448484"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2026 07:33:43 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7aA0-000000002ln-0Gjr;
	Tue, 31 Mar 2026 14:33:40 +0000
Date: Tue, 31 Mar 2026 22:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-09 0/1]
 kernel/sched/pelt.c:35:5: warning: no previous prototype for function
 'get_pelt_halflife'
Message-ID: <202603312234.oo8pPaYv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi JianMin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-09
head:   9e4026c962c3d8db024264b8c2c370a7e7941fc4
commit: 1efc36b815769cb8c7dae1d53373b190c017f5d1 [0/1] ANDROID: sched: add a helper function to change PELT half-life
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260331/202603312234.oo8pPaYv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312234.oo8pPaYv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312234.oo8pPaYv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/pelt.c:35:5: warning: no previous prototype for function 'get_pelt_halflife' [-Wmissing-prototypes]
      35 | int get_pelt_halflife(void)
         |     ^
   kernel/sched/pelt.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | int get_pelt_halflife(void)
         | ^
         | static 
>> kernel/sched/pelt.c:68:5: warning: no previous prototype for function 'set_pelt_halflife' [-Wmissing-prototypes]
      68 | int set_pelt_halflife(int num)
         |     ^
   kernel/sched/pelt.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      68 | int set_pelt_halflife(int num)
         | ^
         | static 
   2 warnings generated.


vim +/get_pelt_halflife +35 kernel/sched/pelt.c

    34	
  > 35	int get_pelt_halflife(void)
    36	{
    37		return pelt_load_avg_period;
    38	}
    39	EXPORT_SYMBOL_GPL(get_pelt_halflife);
    40	
    41	static int __set_pelt_halflife(void *data)
    42	{
    43		int rc = 0;
    44		int num = *(int *)data;
    45	
    46		switch (num) {
    47		case PELT8_LOAD_AVG_PERIOD:
    48			pelt_load_avg_period = PELT8_LOAD_AVG_PERIOD;
    49			pelt_load_avg_max = PELT8_LOAD_AVG_MAX;
    50			pelt_runnable_avg_yN_inv = pelt8_runnable_avg_yN_inv;
    51			pr_info("PELT half life is set to %dms\n", num);
    52			break;
    53		case PELT32_LOAD_AVG_PERIOD:
    54			pelt_load_avg_period = PELT32_LOAD_AVG_PERIOD;
    55			pelt_load_avg_max = PELT32_LOAD_AVG_MAX;
    56			pelt_runnable_avg_yN_inv = pelt32_runnable_avg_yN_inv;
    57			pr_info("PELT half life is set to %dms\n", num);
    58			break;
    59		default:
    60			rc = -EINVAL;
    61			pr_err("Failed to set PELT half life to %dms, the current value is %dms\n",
    62				num, pelt_load_avg_period);
    63		}
    64	
    65		return rc;
    66	}
    67	
  > 68	int set_pelt_halflife(int num)
    69	{
    70		return stop_machine(__set_pelt_halflife, &num, NULL);
    71	}
    72	EXPORT_SYMBOL_GPL(set_pelt_halflife);
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
