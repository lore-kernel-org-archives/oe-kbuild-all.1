Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8112742AA3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 07:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733209796; cv=none; b=cYXE3kMMO9ZfwrvhlXL+/plRFWS7UIy/pD1IGYcRRz2GpXC/33cphkN9aYndrNeCPEKRoOYCoIcB/4dNJJdk4/N457WP2AHAAPHSgz6v326bIaNnMdAE0qcvLv+vJXhR+g3AekSjV6R4/L6oiJdnFMfzT+neREm+1vbwGRr0NNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733209796; c=relaxed/simple;
	bh=nWRVn2fO6QIPckg8KwW3zb6LMU3kSlbQ3NqIgHgI3Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P/XhDLkOb6naMCF2xqInVBhm4OBy20N0zW1L6qn3t/FCFwkhhfMtO50bzrSP1b185MzDH4ooMHZR2WecjFPZyEQ/0VxiT+rgfX2ewHtwcpE3BR8MQU6EZrPJ2AnxuKBc3WzGcOtG7GVAjIYG3yRWuVACTsAjyV0f1eKi3fMG7dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+E1qAmn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+E1qAmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733209795; x=1764745795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nWRVn2fO6QIPckg8KwW3zb6LMU3kSlbQ3NqIgHgI3Ts=;
  b=B+E1qAmnucYtH8VtOjh9y65t+sKGobJReqw4acRTcGDscT/kMRyfEfxM
   HxCnObr/UWF0KFg32RqmQ3X2Y0EnFU6SyMFdBXiAq/qZ1+MH0WQuzbsrp
   tpWuulSof6/ctqj+5v12CR23dfrrN0QOx+hZvGKTmYF6a4l/RdO3uNeBN
   m+ETvdUY3iOrnbT3gDt6NxIocmk39Jy2QgaiA97MCt45geJQ7vbzsHTUu
   wddKOfUu59VKZ2UVrCp6ZhKT7AWeTveNkopWpD5uCIRkhnJpeT/efNLkw
   6dnyNugUh2JKfIwQga6Ru/MBI7RBh0jeVjFOK4yFt2mb7Its8xXSpff+2
   A==;
X-CSE-ConnectionGUID: bvj9ugvPS42Z+jBkpFM9bw==
X-CSE-MsgGUID: WTJqMOBGQ3KV01HSYzT41g==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33465664"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33465664"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 23:09:54 -0800
X-CSE-ConnectionGUID: aC1IFwBCTcSZCWqITFzAcw==
X-CSE-MsgGUID: DvKXhqiHTc+cdobTzEP6tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="116603362"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Dec 2024 23:09:52 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIN2c-0000Fv-1I;
	Tue, 03 Dec 2024 07:09:50 +0000
Date: Tue, 3 Dec 2024 15:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1455/1455]
 arch/loongarch/kernel/legacy_boot.c:439:25-27: WARNING !A || A && B is
 equivalent to !A || B
Message-ID: <202412031534.dakPdx99-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4672b15ea0310686f657dc38c95b8c90663590c0
commit: db5bb24abc8dd120fd81b7ce21819e96578d011e [1455/1455] LoongArch: Old BPI compatibility
config: loongarch-randconfig-r053-20241112 (https://download.01.org/0day-ci/archive/20241203/202412031534.dakPdx99-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031534.dakPdx99-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/legacy_boot.c:439:25-27: WARNING !A || A && B is equivalent to !A || B

vim +439 arch/loongarch/kernel/legacy_boot.c

   423	
   424	static struct fwnode_handle * __init parse_isa_base(u64 *cpu_addr)
   425	{
   426		struct device_node *np;
   427		const __be32 *ranges = NULL;
   428		int len;
   429		struct device_node *node;
   430	
   431		for_each_node_by_name(np, "isa") {
   432			node = of_node_get(np);
   433	
   434			if (!node)
   435				break;
   436	
   437			ranges = of_get_property(node, "ranges", &len);
   438	
 > 439			if (!ranges || (ranges && len > 0))
   440				break;
   441		}
   442		if (ranges) {
   443			ranges += 2;
   444			*cpu_addr = of_translate_address(np, ranges);
   445			return &np->fwnode;
   446		}
   447	
   448		return NULL;
   449	}
   450	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
