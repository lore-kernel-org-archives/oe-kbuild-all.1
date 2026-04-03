Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D7E1D6DB5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205730; cv=none; b=Ipq/l7kep6WsiutMlujn++aDodrl8aWpk/dxB7dQYjeiz4azcMtkiPDqVTS1fdBs6kXDGEZbr6sREaJnz1SxXOzw3ZLHPy1tKMYTAVOmx5L7wR6piyLjSUH3Enc1qugAPoY197EtIkIP7LfTASo9yW3NdCWcxNqUnEnaFZmCiPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205730; c=relaxed/simple;
	bh=pxc1GJ5BEbTD+ZN4ui8cObSqQ/K9/9+wAo+/FGxY3nI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LJSHqKIPbsmchnv+7PDtDK/Qgu177WE9oBlQSkP/9EM/khp4QwFMrgBB8hQbdmPVlYfQiCocODi5NVnjPAokepv6QwDgZLoMC1DFQK5SB79y74wG4mK0xDdOVCvEHSHghGnLqRHAWY9+C6hOKhjFd8wrWmVBtu6b7+HXh1KVpqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LySAzaQC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LySAzaQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205726; x=1806741726;
  h=date:from:to:cc:subject:message-id;
  bh=pxc1GJ5BEbTD+ZN4ui8cObSqQ/K9/9+wAo+/FGxY3nI=;
  b=LySAzaQCkHuBJG5m+48oiXzQRV/kQDuoyjorWqGsGyWPmMgs9ReUnpp0
   EUWtBhSezQRmDzLk87wn+QJyEzoAjIAOzQaQr+buhjbuCU0Wv3swq9zbJ
   JMjpTAB/p2CBx9liTc4dAhjfeQY34CX2JYsaLQMe+3VffPt3WaZYkU/l2
   o0zb6ViEmDrK8PGSOLSo5D0hF4m1DZVVY2J3KZo1NwqSVMH3h5pVojiCm
   W2GJgucGz7ORdPHW2hsWVXNmYapymhCnvMz8TWwzyczbhRwfPmqGzBMEU
   lV4kv64EREoeASbhnZxYDUc/rVN8V9+TKPWUuQlFV+F02YgK+9r9nQ3QG
   g==;
X-CSE-ConnectionGUID: LmkrSengTYyPip0pLmnJ0w==
X-CSE-MsgGUID: ACfQuf7kQIWEmmtTXcwBpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86973959"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86973959"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:41:58 -0700
X-CSE-ConnectionGUID: F2a1DXYpSC60B+aWNBaCPQ==
X-CSE-MsgGUID: x90I8OY7Qpyo4XqUdkYEtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="228834240"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 01:41:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a6E-0000000012z-2hwc;
	Fri, 03 Apr 2026 08:41:54 +0000
Date: Fri, 03 Apr 2026 16:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:deprecate-legacy-ip 5/6] net/core/filter.c:6087:12:
 warning: 'bpf_fib_set_fwd_params' defined but not used
Message-ID: <202604022158.JsHHVfOH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux deprecate-legacy-ip
head:   2d2acff90d1c42a747b3fed5ce9189622f49daa3
commit: 3f213df15191632a3cb32932955ee90bff8385a0 [5/6] net: Change CONFIG_INET to CONFIG_LEGACY_IP for IPv4-only code
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20260402/202604022158.JsHHVfOH-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022158.JsHHVfOH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022158.JsHHVfOH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/filter.c:6087:12: warning: 'bpf_fib_set_fwd_params' defined but not used [-Wunused-function]
    6087 | static int bpf_fib_set_fwd_params(struct bpf_fib_lookup *params, u32 mtu)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_fib_set_fwd_params +6087 net/core/filter.c

12bed760a78da6 Eyal Birger            2018-04-24  6085  
adc4a85026a541 David Woodhouse        2026-04-01  6086  #if IS_ENABLED(CONFIG_INET)
31de4105f00d64 Martin KaFai Lau       2023-02-17 @6087  static int bpf_fib_set_fwd_params(struct bpf_fib_lookup *params, u32 mtu)
87f5fc7e48dd31 David Ahern            2018-05-09  6088  {
87f5fc7e48dd31 David Ahern            2018-05-09  6089  	params->h_vlan_TCI = 0;
87f5fc7e48dd31 David Ahern            2018-05-09  6090  	params->h_vlan_proto = 0;
e1850ea9bd9eca Jesper Dangaard Brouer 2021-02-09  6091  	if (mtu)
e1850ea9bd9eca Jesper Dangaard Brouer 2021-02-09  6092  		params->mtu_result = mtu; /* union with tot_len */
87f5fc7e48dd31 David Ahern            2018-05-09  6093  
4c79579b44b187 David Ahern            2018-06-26  6094  	return 0;
87f5fc7e48dd31 David Ahern            2018-05-09  6095  }
87f5fc7e48dd31 David Ahern            2018-05-09  6096  #endif
87f5fc7e48dd31 David Ahern            2018-05-09  6097  

:::::: The code at line 6087 was first introduced by commit
:::::: 31de4105f00d64570139bc5494a201b0bd57349f bpf: Add BPF_FIB_LOOKUP_SKIP_NEIGH for bpf_fib_lookup

:::::: TO: Martin KaFai Lau <martin.lau@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
