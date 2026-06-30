Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4915148850
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 18:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782845594; cv=none; b=HQTXC0wYwYIX0nwj74IAcR+G+exn2YKf076aXq5lPVfVfQhh0O90AY8Cf4BlMZwuK1r7ehYNgBpxY3FxmEXlLOXr5j5zHSCKwlD82LEDxEokOBy36Pwi3NNJ0Zj5wRH+5l2OgtkBOYb5FdZfXKlucLNR1afzc0AVPI+pfmzvmWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782845594; c=relaxed/simple;
	bh=aiH5mhjZCaaP7Cj9/DKFxULtVjgYdPbq4CdkLWc5ACc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qHFhRYs1C7NOk5jX6UXNdOkO0doBnfgoa3l1un+m7Z4NKY3KFRssfevQ76GiOOcx9Fc0YGD3TnU7DHsJPraWfYTdtoFNQjEiPBktRjofCxvJKL58AL6Et/qDkz0B4vpbIUmE5ELoa5JxO7amA05+8svhvm9SAZbGc4GTwtnN6tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADwmHdSv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADwmHdSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782845592; x=1814381592;
  h=date:from:to:cc:subject:message-id;
  bh=aiH5mhjZCaaP7Cj9/DKFxULtVjgYdPbq4CdkLWc5ACc=;
  b=ADwmHdSvKRE2d4Rg3TzSwAzLFlpUIBbxbDymToxpT2V6gt/F8jfvtVon
   0lzQOfvME0jKWac6mcG3pwqoFBLR5yvE5AGofYKlQo+PDVpD25ybHs5gf
   cdE7WzchVSiRFAHu4sP8usRWxxmFheH0HogyZdlXHMZ8P6veGfPLtvM5t
   FwIsv2xSiFVcaD87GLcf6sgwW5ronmY8zZViSIgciYu/tOJlXfgWeOlEi
   sHD51EQ7EzeOo2jDBVfXtrrCO+dUsmVRrHhEOaIG89qV8FLSvxqkEhVSr
   X/d/pwSFsgUNLWc7Rdj0t+WOEeUAcur/o6DLTxSxCckESo8THnv4quJ8M
   w==;
X-CSE-ConnectionGUID: V8pMoOZCRb+VNfg2bQb9iQ==
X-CSE-MsgGUID: YIvZRLesSGmZs0/TUQDkXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83654268"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="83654268"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 11:53:11 -0700
X-CSE-ConnectionGUID: qmcDqs9fRfe9kqD1YZCTIA==
X-CSE-MsgGUID: Y9im60VqRlGgbsvHzL6YoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="251288758"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Jun 2026 11:53:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wedZy-000000008ah-2fYr;
	Tue, 30 Jun 2026 18:53:06 +0000
Date: Wed, 01 Jul 2026 02:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.4.rebased 11/29]
 net/ipv4/bpf_tcp_ops.c:88:29: sparse: sparse: symbol
 'bpf_tcp_ops_get_retval_proto' was not declared. Should it be static?
Message-ID: <202607010215.FxCPXyAt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.4.rebased
head:   702dfd9ab6849d59d3521f7c6542c1cf6aac217c
commit: 53fe101e32114ef6e2540cf6d74f277d9bea1c87 [11/29] bpf: tcp: Support selected sock_ops callbacks as struct_ops
config: arm64-randconfig-r134-20260625 (https://download.01.org/0day-ci/archive/20260701/202607010215.FxCPXyAt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010215.FxCPXyAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607010215.FxCPXyAt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/bpf_tcp_ops.c:88:29: sparse: sparse: symbol 'bpf_tcp_ops_get_retval_proto' was not declared. Should it be static?

vim +/bpf_tcp_ops_get_retval_proto +88 net/ipv4/bpf_tcp_ops.c

    87	
  > 88	const struct bpf_func_proto bpf_tcp_ops_get_retval_proto = {
    89		.func		= bpf_tcp_ops_get_retval,
    90		.gpl_only	= false,
    91		.ret_type	= RET_INTEGER,
    92	};
    93	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
