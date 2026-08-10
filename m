Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE95248896
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 01:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786326590; cv=none; b=CQfEd5XlH+AaIQBWwfzBiy5GxOyYPrhPrAdlXZA7UCshV3RTZFI0gOyoRx772pdXdwrrg8sWKvBMjPE27kdKzoh4PPR4N5dTaqO+vyQ6zuAJCKPwRVtJtoMzYwaao5D+cFPvLoVJ6bK0nO0MaBQ7ZNrgvy8tifCcoEPgnpnV4zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786326590; c=relaxed/simple;
	bh=M2hdB5OgNWgtS/VZw4gZc4cg7H9aoilsTr/zHFZ2dD8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kSBkp0gB4OWxUgE2Y7Ky8VIiBWvSHhbeH4ALXKpfJWEUhu6rn2gY1VUu5p6qESeVPGhEJ97QykBs6ipJ83Z/hGDcotdCqoKm6q1Pu84h2fPulehbE2Q1wkEm1sWsZE1yT4y7uSamX3tyYn9E7OwjeN+8LwRxARcaZSloYgo3+Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePpjy51D; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePpjy51D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786326587; x=1817862587;
  h=date:from:to:cc:subject:message-id;
  bh=M2hdB5OgNWgtS/VZw4gZc4cg7H9aoilsTr/zHFZ2dD8=;
  b=ePpjy51Dtdw+6CVC9F9OgcoE+e0RyqvE/kWUdih4518q1G66o3vXz5k/
   zW7dy8/vvFOnxG9NR+ZNtgxpkm/A0PoA40JKh+6nOwiiFcNCVnTM6pOVL
   m3o26WrJOhnUtqR0KRP3TREaejCWXKC/66NBb8keZz+lMS4VtVbqvFYNr
   +JZI4QVbqDNobAQbfAwp5y1cfldrAkUn/iO+aG5kkUkKoMOiOpYwRm3zj
   JFlMy7dCy/FZR7O59i4GXFKMzCpAWssYCaVFy97Sxuh+DaSgne6FqmGfp
   3DIXRBFWhCsiFFvKGruyPPR++0UWA2IZyTfhrHZxid2hBBBlkgjNa+yXt
   Q==;
X-CSE-ConnectionGUID: P4WfKDUpQy2yDhNIM0WJPg==
X-CSE-MsgGUID: BEfIAwIqTPWdTM1h3NHiYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97433025"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="97433025"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 18:49:46 -0700
X-CSE-ConnectionGUID: M6+3o+oJTkWSlGFOdd3fVg==
X-CSE-MsgGUID: bIu181UzT/G/L6VYkN08og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="261159213"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Aug 2026 18:49:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtF94-00000000MX4-2TwO;
	Mon, 10 Aug 2026 01:49:42 +0000
Date: Mon, 10 Aug 2026 09:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:atype 7/45] kernel/bpf/cgroup.c:2546:23: warning:
 unused variable 'atype'
Message-ID: <202608100749.y9M7hjlY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux atype
head:   5df289d7c4d635b11dcb0189c0ccd05c28d743c4
commit: 3dc38bbc8129a334d0172e7e3eaf878f8d76aa56 [7/45] bpf: Resolve freplace types in callback and fixup paths
config: arm-randconfig-004-20260810 (https://download.01.org/0day-ci/archive/20260810/202608100749.y9M7hjlY-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608100749.y9M7hjlY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608100749.y9M7hjlY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/cgroup.c:2546:23: warning: unused variable 'atype' [-Wunused-variable]
    2546 |         enum bpf_attach_type atype = resolve_attach_type(prog);
         |                              ^~~~~
   1 warning generated.


vim +/atype +2546 kernel/bpf/cgroup.c

  2541	
  2542	static const struct bpf_func_proto *
  2543	cg_sockopt_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
  2544	{
  2545		const struct bpf_func_proto *func_proto;
> 2546		enum bpf_attach_type atype = resolve_attach_type(prog);
  2547	
  2548		func_proto = cgroup_common_func_proto(func_id, prog);
  2549		if (func_proto)
  2550			return func_proto;
  2551	
  2552		switch (func_id) {
  2553	#ifdef CONFIG_NET
  2554		case BPF_FUNC_get_netns_cookie:
  2555			return &bpf_get_netns_cookie_sockopt_proto;
  2556		case BPF_FUNC_sk_storage_get:
  2557			return &bpf_sk_storage_get_proto;
  2558		case BPF_FUNC_sk_storage_delete:
  2559			return &bpf_sk_storage_delete_proto;
  2560		case BPF_FUNC_setsockopt:
  2561			if (atype == BPF_CGROUP_SETSOCKOPT)
  2562				return &bpf_sk_setsockopt_proto;
  2563			return NULL;
  2564		case BPF_FUNC_getsockopt:
  2565			if (atype == BPF_CGROUP_SETSOCKOPT)
  2566				return &bpf_sk_getsockopt_proto;
  2567			return NULL;
  2568	#endif
  2569	#ifdef CONFIG_INET
  2570		case BPF_FUNC_tcp_sock:
  2571			return &bpf_tcp_sock_proto;
  2572	#endif
  2573		case BPF_FUNC_perf_event_output:
  2574			return &bpf_event_output_data_proto;
  2575		default:
  2576			return bpf_base_func_proto(func_id, prog);
  2577		}
  2578	}
  2579	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
