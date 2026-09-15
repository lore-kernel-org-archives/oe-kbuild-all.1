Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334FD1FB1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 03:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789444067; cv=none; b=bSxoqjDtn7YEE1AsLkAzQJfms2MM4n1TnifxzbeJ7gQ69yNbXMKGmcK5+qjCnl5P1S5a/l2gNiEk8XDfZJPQKHwKVKBh0wLTkYAx6qCtoXGQ4yvbk4lveNes1dgebywSO+GZIZFeF5tjz33zXLYEc8Ef7bsN/zRquC/XRZYHqV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789444067; c=relaxed/simple;
	bh=c1obhlGaRhzB+YbfQaRPF0KeiFTdq/S1kmaa1pNsGE0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t8+DMA9CZdpoPIFOjcIVKAevoBZ3HRtnDQzmsFlSwF9D1FQdPhZfzaF0emZENJzfK9ZTTQ6shNkOGORFDTwMyMG73xbbKQ0Bv6xTwAgYjyH5hC9Tme6mL5+zYOjK6dQTOmswrWybtNx/lbMDkNb3/ndpKZ/6+ZhCodvui1fWONc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3f0zX9N; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3f0zX9N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789444065; x=1820980065;
  h=date:from:to:cc:subject:message-id;
  bh=c1obhlGaRhzB+YbfQaRPF0KeiFTdq/S1kmaa1pNsGE0=;
  b=U3f0zX9N1NAoedWKxqfMVn+yUHM4P9VTc74PRPx+B0ON6Q1XYSHtHgu9
   ewxT/mXQoLhiJS0Z52n/4oukSFtBXYrB/1gaFZx3j5q4suKGKftPDoxkn
   SYHGcNM07jX4OvT14TNYu5PW+M/Sp7Th/wjBYlLtK6OHI/DaWptmFduKM
   s/FtKbotcTZAz5oC2n9ldZjCLec7yBebFU/9ARd5B8CXUHpoMn7lXWFN6
   qdiieC/jzR+P5yIT5ftRcts5ANdcWnIhR300JWc16PkA12nPc6jOjKXlk
   BUESsebCNpyvSYnt8S+yHmaV5r5vy0FBGmIzcV6/crvBEmE8UhUg+NnYW
   A==;
X-CSE-ConnectionGUID: fGAVZk14SvyaySv9SV0nyQ==
X-CSE-MsgGUID: IWLsInCCSUyFvaNYv05A4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100463876"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100463876"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 20:47:45 -0700
X-CSE-ConnectionGUID: JNsAPsjrQw6Gr5S3jmNBCQ==
X-CSE-MsgGUID: c+WCwsPATueoiMOjT7K1og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1035424"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 14 Sep 2026 20:47:44 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6K8z-000000000UF-2eoC;
	Tue, 15 Sep 2026 03:47:41 +0000
Date: Tue, 15 Sep 2026 05:47:25 +0200
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-complete
 8/67] Warning: mm/page_alloc.c:7345 function parameter 'pfn' not described in
 'contig_get_lru_folio'
Message-ID: <202609150520.MHYgSsFM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-complete
head:   0423df59f3f085592c3ff59834eeae067ee75158
commit: 4af770f6b4623768abd534b154c6d8136f601cac [8/67] mm/page_alloc: let alloc_contig_range() try harder
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260915/202609150520.MHYgSsFM-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150520.MHYgSsFM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150520.MHYgSsFM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/page_alloc.c:7345 function parameter 'pfn' not described in 'contig_get_lru_folio'
>> Warning: mm/page_alloc.c:7345 expecting prototype for alloc_contig_frozen_range(). Prototype was for contig_get_lru_folio() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
