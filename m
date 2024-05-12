Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738101EA91
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715515256; cv=none; b=dLRjDw/ibNaEAh/1ePnUCsM7qKyhSUXqF8A+KUedtV5EiVa3L1a3l1KJYLUPSf+cJiKcHYevcAtlFA0Xr+9AWRxuGuA453QpVE/P1f/Pfjxi/c/sYWitkO5bUP+bkZSkolvoE4g5E5kY9290sqqsMbtsfLOuIskTh0cxfqQwJtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715515256; c=relaxed/simple;
	bh=4EHShC7w96Mtwr8AssBWze1K1S2WySxB0DUQtgJpPw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHUB4piw1lO38rOicNn2kta3urg0zEzlN24IagYesfIIaOE28kliAZZT254V4AqmlAj3gpXiQZ/Qafpp3Vj7wvycBJM9J59n0CWv1di2V9RQHOGJ5bJJy0QZHH6OTJLK3j0lm4RzuhM/XP7dEnaDk+b9TIrPS1sgChNetVxzgV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUWRG3nY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUWRG3nY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715515255; x=1747051255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4EHShC7w96Mtwr8AssBWze1K1S2WySxB0DUQtgJpPw8=;
  b=YUWRG3nYMpK2yO2Mp8CXpgxhn0RIsWDcMAYvg6eR0NpMewUHs1x5eDlP
   vx/eEPQRFPJFZu2Fd1Zvk9USL5a/G4MH9HKxdWt+FcKt2p6wp8UJFGLXS
   /xoTVRMyabJHTtlh2fEGu2zFRgv5C0qRR8J4J54i2n7W3nXYWwR3OUBNI
   mwO1OaKXeqJLzkE2u1OuxuMcJ/YKh+2Lv+nrKK95oNxeFLsBpE5IkTlIv
   aEnwr7ykeemwkF0oZs/XRoSz0hONpldQ2eMFnGUI8UgfJPS2b6YDrUHPt
   77EvmpqG1dwT7zLMCi0LuMxletRNPL/YIlV4HDRSHBmbUutd6u3J0Hvvs
   Q==;
X-CSE-ConnectionGUID: 9xlpomOMS/WpROaGxiokDQ==
X-CSE-MsgGUID: kOrZVVmsQdqUtGx7j5NlhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11396218"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="11396218"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 05:00:54 -0700
X-CSE-ConnectionGUID: lvGmM9TpSs+0KUyepTzufw==
X-CSE-MsgGUID: pFDr5bIyQK+yQRNiSsS80w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="34593166"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 May 2024 05:00:53 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s67so-0008ZD-2r;
	Sun, 12 May 2024 12:00:50 +0000
Date: Sun, 12 May 2024 20:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next v1 2/4] netfilter: add bpf_xdp_flow_offload_lookup
 kfunc
Message-ID: <202405121919.iCgGQwE3-lkp@intel.com>
References: <6526cb192be96de940f2e281ca31843d74106ae0.1715348200.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6526cb192be96de940f2e281ca31843d74106ae0.1715348200.git.lorenzo@kernel.org>

Hi Lorenzo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/netfilter-nf_tables-add-flowtable-map-for-xdp-offload/20240510-220343
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/6526cb192be96de940f2e281ca31843d74106ae0.1715348200.git.lorenzo%40kernel.org
patch subject: [RFC bpf-next v1 2/4] netfilter: add bpf_xdp_flow_offload_lookup kfunc
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240512/202405121919.iCgGQwE3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405121919.iCgGQwE3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405121919.iCgGQwE3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/netfilter/nf_flow_table_bpf.c:90:5: error: redefinition of 'nf_flow_offload_register_bpf'
      90 | int nf_flow_offload_register_bpf(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/netfilter/nf_flow_table_bpf.c:13:
   include/net/netfilter/nf_flow_table.h:318:19: note: previous definition of 'nf_flow_offload_register_bpf' with type 'int(void)'
     318 | static inline int nf_flow_offload_register_bpf(void)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/nf_flow_offload_register_bpf +90 net/netfilter/nf_flow_table_bpf.c

    89	
  > 90	int nf_flow_offload_register_bpf(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
