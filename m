Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FA239E18E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 09:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278804; cv=none; b=ST7GkIVdnuImOhQUgamIEyZZlb7SDKmpSus9sMALlEhPa2A64fAkFOnf7rG/VdA+vt39hVbM0Znjp1RfEIDuy6W+ehIL4uZbkeuuynQcQ+SanO8p3xaN0n0V/f35mAez6HQ6XQq9ePlKcsE14eXX7GOX/x0aNI4ONRM9czhAo5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278804; c=relaxed/simple;
	bh=kQI+KRGtdJCHQx2QNn6Z0hyVozz87nTHeVQ/fI35vRc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=io6BnKVzHSC7twkhT7t/O//HzVf5+CysW+adBogjLBfuMyrA8rO9Ev8px8ZIWVX+tUOqcNCLhEQi2OCuIVDYr33ohVYGXb7ceqU2x82gF7M9WizmcosPxwWdgzcmVLPDowIjIBNVhJ1CJYc4X4vYDIbpPhDzg9CuiSBu04QZS9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGMZvOE5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGMZvOE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791278802; x=1822814802;
  h=date:from:to:cc:subject:message-id;
  bh=kQI+KRGtdJCHQx2QNn6Z0hyVozz87nTHeVQ/fI35vRc=;
  b=CGMZvOE5pj7vekDMi36MOVDHz0cFLGCFzcGmnqKy6Zr9VVuBDlir3If7
   NbE+W9g7XdFyYzIylmYXm9hKqpJl31skiH76xvROFPRZ7yPBK94SDnSvB
   GDhYgS4Dq5BO3oRYM0v2ewjI6Asj2ZnH21Z7Zj0FKmCRXIcyAAXuI3zOp
   UcjKnXeYhLpcTTlDSnKKG5T+AlfTMWPLo0+j7fxWIRCy+YqO+xB2TKDiB
   7mPvNgOY4XzYcYErlBVpO+ty6tIGItMXWOsYIByQdW+JXAwWOuu+B8kI7
   zTnlFoCKGEptM/U5BXkuWV8BWTMmrnzRvjCOt4ywHTWh6aJyX2ETyiHHm
   Q==;
X-CSE-ConnectionGUID: qQa7QPLGSd6nGay1y4T1vw==
X-CSE-MsgGUID: E5pg1WOZSJipuEmKTpGALA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="19255"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="19255"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:24:51 -0700
X-CSE-ConnectionGUID: Gp5a5As4QKaCiVOE4sd1mw==
X-CSE-MsgGUID: mC1bRjS5T3y2jGwRQYGxbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1168018"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 06 Oct 2026 02:24:49 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE1Pi-0000000012f-1crj;
	Tue, 06 Oct 2026 09:24:46 +0000
Date: Tue, 06 Oct 2026 11:24:24 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp-round4-backup 38/42]
 net/ipv4/tcp_xdp.c:783:18: sparse: sparse: symbol 'bpf_xdp_tcp_sock_dtor' was
 not declared. Should it be static?
Message-ID: <202610061146.zK1lT3gd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux xdp-tcp-round4-backup
head:   63925314fb03ace1f3949a09d298cfdc0188bc8a
commit: a5480aa7398f2c908dd2be6c0b9fc93a1aa1689a [38/42] tcp: Receive retained XDP frames through the established connection
config: x86_64-randconfig-2301-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061146.zK1lT3gd-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061146.zK1lT3gd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061146.zK1lT3gd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/tcp_xdp.c:783:18: sparse: sparse: symbol 'bpf_xdp_tcp_sock_dtor' was not declared. Should it be static?

vim +/bpf_xdp_tcp_sock_dtor +783 net/ipv4/tcp_xdp.c

   782	
 > 783	__bpf_kfunc void bpf_xdp_tcp_sock_dtor(void *sk)
   784	{
   785		sock_put(sk);
   786	}
   787	CFI_NOSEAL(bpf_xdp_tcp_sock_dtor);
   788	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
