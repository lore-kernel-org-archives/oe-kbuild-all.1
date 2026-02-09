Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559E137F8AD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770660536; cv=none; b=HG2+iUufI6FuvX0uwJpISAVdVOc0hHz/v5Pz7tFbBt9OSAVtUTpb4yW2CB3A0qRwejXdkxVus7yfVy4tyF7OwAaRxTo2VpY85yBA0nAbBTKTHLFzdPwNVZyQH/zW9OEzH5cxbzBd/T2W6XjgdpvmPU1Ao7xbPgWWOOuRMIywI28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770660536; c=relaxed/simple;
	bh=EJihyiUjv3sZa8SWW8qrEqbjNVTq0eeMchezXiOn7mg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QxcCt+igCl8tIX8pFc7+SxPrFsBtbda/N/F3IMfWXIEFLnYgn/wMSTqfIzvvmZX5cyw1u8z8owZavnaNYgsbnu6HnZTaJzdzXVKFXJbsNEGZd58iXDaNVmEP0LYbhsLVjTVt37hqc8HPuK2Gdx+vdEXqohgKuIeXKktDYCjtkrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGpA30+y; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGpA30+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770660535; x=1802196535;
  h=date:from:to:cc:subject:message-id;
  bh=EJihyiUjv3sZa8SWW8qrEqbjNVTq0eeMchezXiOn7mg=;
  b=BGpA30+yVdYmsLHOaf/xYTOuo/2ayeWc3uUa1/9jFoQ4wY+U7SCulFvC
   wNo/kIVsLBcDUHCpTTmj9gPzBUTN69gjbXYyRpZ+SV0EU4uiZoTDHqbgo
   e6rr/a7ncVt1577V2B+C1s8qnK4aAt7xfoJ1NacqfENc2aUOM2I2kvh4I
   vjkruhLeRCiC72KxD/OugqPyZemKBdMv+2XLSQ45fEXXt0EgOHeycaJWZ
   8KX0m2eAzGxXawvazkHyjZsN/xSmqD6lNh8QdOiPVmiOg9M+HA2BiYsXH
   3CoMrFd3zNokrwxz+fLCqvSkjxSbIjf6/26E9wKn8FR0ij1np0Co45GBV
   Q==;
X-CSE-ConnectionGUID: XS19dcjgRD+HxPDWbiYgDg==
X-CSE-MsgGUID: 3WJxQ5unRAWwUI3rpMB6og==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="70989119"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="70989119"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 10:08:54 -0800
X-CSE-ConnectionGUID: 74QvXElxRleF5sM2YDFvwQ==
X-CSE-MsgGUID: xNBUotMHQTyKI4VTr4wx3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="249287338"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Feb 2026 10:08:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpVgo-00000000oDe-2gup;
	Mon, 09 Feb 2026 18:08:50 +0000
Date: Tue, 10 Feb 2026 02:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 4/12]
 arch/arm64/net/bpf_jit_comp.c:2510:45: error: '((struct bpf_tramp_node
 *)fentry_nodes->nodes[0])->link' is a pointer; did you mean to use '->'?
Message-ID: <202602100230.aCzlYJ44-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   95bf1a3ff57efabf9b7c50b8a0d3583a6714f5d8
commit: 839b12f2dd3dd0be0a7321691ec25efca4132668 [4/12] bpf: Add struct bpf_tramp_node object
config: arm64-randconfig-002-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100230.aCzlYJ44-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100230.aCzlYJ44-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100230.aCzlYJ44-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/net/bpf_jit_comp.c: In function 'is_struct_ops_tramp':
>> arch/arm64/net/bpf_jit_comp.c:2510:45: error: '((struct bpf_tramp_node *)fentry_nodes->nodes[0])->link' is a pointer; did you mean to use '->'?
    2510 |                 fentry_nodes->nodes[0]->link.type == BPF_LINK_TYPE_STRUCT_OPS;
         |                                             ^
         |                                             ->


vim +2510 arch/arm64/net/bpf_jit_comp.c

  2506	
  2507	static bool is_struct_ops_tramp(const struct bpf_tramp_nodes *fentry_nodes)
  2508	{
  2509		return fentry_nodes->nr_nodes == 1 &&
> 2510			fentry_nodes->nodes[0]->link.type == BPF_LINK_TYPE_STRUCT_OPS;
  2511	}
  2512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
