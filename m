Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2305818754F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 22:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727821752; cv=none; b=kuluNc/B3xKstu8bEKuTTesGHKa23DvOd2/lPJSPGV1Pc+Oam5RppVuJzNhmVXNtj8gap6nfXTt/TqfwzIcL9t/LaOSk3tqnAqTZ59uNUMI66uUH1+Xp6Kj+FcdIhqGf3QNH7dQmx7GbTMZU114E1YsjJKajp2UMrzRkNvl52n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727821752; c=relaxed/simple;
	bh=tKmQDvvw+EsvY0EKWFPU+Y82ltEzEWlIPne7uojDbQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vEXV2kaE5CPjYFQhlRmSL0f/DxduX7XrIN1YBhdDShrk1hntTE4MDWpoYLWHjf9gf//+UqVRmB+5Uchju7d7zu1gGWruO4YIjkFMd0kRe5Y5Rb8n1GheyNqNttBuQfYdzeO/kkoHuxHJ28MgdYS3kiDnjMlaFqhOaCL1cu+MtcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dE9N2bvn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dE9N2bvn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727821750; x=1759357750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tKmQDvvw+EsvY0EKWFPU+Y82ltEzEWlIPne7uojDbQc=;
  b=dE9N2bvnZHSbgu5OdIVyL//uQBtRy4Gfs3vBXmT/+/cKayWvz77EQ0m6
   jwVj4bd8W8w/SXg8gL7w9bWnYHowCWhS8yIPx2GPgeZ2lQYeDwZaOLrvT
   kvI7QKBly49IDKahfX7SrdslwjqRD50xhSA+TSkRUaSZSbkq0tsHOBJ5t
   TWFOjO9eTQiTqnXfqwSfavTRJ3/UHfebOiuJz0Ya0wAr7TBu8pKwEqnwN
   qAAP5lJWXS2NRJduVvAvcIOveNn4EzBA/4a7EOKOCqxNr5hVtlLIMlWUj
   VUIqzjswyFPrsUWYpki2bSIBgDojbsV3WFdSfYBGpQ6LDouzvOS4bOrCX
   g==;
X-CSE-ConnectionGUID: QJFaETpiQam9VMIBYE3h1w==
X-CSE-MsgGUID: 3HXWkhg3Q5KCN5BUxVTV7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27073848"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="27073848"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 15:29:10 -0700
X-CSE-ConnectionGUID: Lqf9QfjBSXq+rhGT3+vhpA==
X-CSE-MsgGUID: QYt5cz1WQEafRboQP+l0zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="74051850"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Oct 2024 15:29:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svlMg-000REn-2A;
	Tue, 01 Oct 2024 22:29:06 +0000
Date: Wed, 2 Oct 2024 06:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 754/1491] ld.lld: error:
 undefined symbol: topology_apply_cmdline_limits_early
Message-ID: <202410020619.klAdV8Yb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: b9d0120e64b91fdd9c8288c69025e2ce4622c683 [754/1491] UPSTREAM: x86/cpu/topology: Rework possible CPU management
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241002/202410020619.klAdV8Yb-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020619.klAdV8Yb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020619.klAdV8Yb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: topology_apply_cmdline_limits_early
   >>> referenced by setup.c
   >>>               arch/x86/kernel/setup.o:(setup_arch) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: topology_init_possible_cpus
   >>> referenced by setup.c
   >>>               arch/x86/kernel/setup.o:(setup_arch) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
