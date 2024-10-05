Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6EF85947
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 07:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728113168; cv=none; b=hNz7MIvxJaS7aAFjYNTEcZEsl3bFM2stM8I/XdeBqd+ZBC/CcMrMlPCnnUp2pJjOUF9uH2WXIl2OB2AgY1caYQlb2LMiXm3hXDPKC+nSCbQoWb0jxzH9GJN9JGLIn++gtafHIUm61cmXLPDW71m3jz0jLMWoSx6oAKfZJWmp2Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728113168; c=relaxed/simple;
	bh=ej6ctAf7LEnbidS/IJfor64C2IZuflcNzOzxBCnt/f8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qQWp3qI6b2XnaEs8ZKmUn0CVX5hWbF5M6PMTKnVLl5hFjMkOQm8xcQMFdsO3ro90beKR8YVEBW7ixcvQsxOASQYxjKyv6HbjYGKl2LmrFHnLCnpLHSmqZMQgze2CjgTWX/wU4XWXb719Y9ufqPkNgxDqd2lXSGcji5N0hGWFplg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsr4Vvai; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsr4Vvai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728113166; x=1759649166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ej6ctAf7LEnbidS/IJfor64C2IZuflcNzOzxBCnt/f8=;
  b=nsr4VvaidPrxTgMeBpBRkGpu2REwYWt0r9ELSZ/9xR2E09J/ilitZ9IM
   0Ma+tKv2eOAMgmPfxLYxOf2ZmZl8AZCm8W5R+ZzL29MAx5oHDdJehFzuo
   8mMzrkmRIw4XChAgtNlaF96AouMGEmzANXbscTHe3RfM1ILvAgHoOVXpA
   7WBfh3jlX2/DtalmOh8SM+Hgui0iFYjRaCjGwL7dHrLqq234oa7hn9Ghj
   pDr7mv/Q1B7cIeFtREZxXDrZW0/TV5X1xqiA5zqkAv7Xby9+y+e+3WT5Z
   GvNr2KLlE0QQeeFv9FBPZO4SPUa1aSbBdqi+6nxWLzrmVizrB4dfhfpPk
   w==;
X-CSE-ConnectionGUID: w1sau8cdT+q7dGAfGbjbOQ==
X-CSE-MsgGUID: sLEvqz5iRmer1EYxA0PzqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27465816"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="27465816"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 00:26:05 -0700
X-CSE-ConnectionGUID: oso0PjKSSyOWgVrlRyF+KA==
X-CSE-MsgGUID: 7ycxFCv5TvW+uJABMMBCDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="112398328"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Oct 2024 00:26:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swzAt-0002jm-1j;
	Sat, 05 Oct 2024 07:25:59 +0000
Date: Sat, 5 Oct 2024 15:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 11988/12031] net/core/netclassid_cgroup.c:515:5:
 sparse: sparse: symbol 'bps_limit_dump' was not declared. Should it be
 static?
Message-ID: <202410051501.MfTJ8XRH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   6c7ba3824d4ec8a20ab384fa7b838eeb7e5b4e5f
commit: ca0f6ddd217803ae350424336308109cc6ca6fdc [11988/12031] rue/net: add rx && tx rate limit for per cgroup
config: x86_64-randconfig-122-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051501.MfTJ8XRH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051501.MfTJ8XRH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051501.MfTJ8XRH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/netclassid_cgroup.c:122:5: sparse: sparse: symbol 'cls_cgroup_stats_init' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:151:6: sparse: sparse: symbol 'cls_cgroup_stats_destroy' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:337:5: sparse: sparse: symbol 'net_cgroup_notify_prio_change' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:489:5: sparse: sparse: symbol 'read_class_stat' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:501:5: sparse: sparse: symbol 'rx_dump' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:508:5: sparse: sparse: symbol 'tx_dump' was not declared. Should it be static?
>> net/core/netclassid_cgroup.c:515:5: sparse: sparse: symbol 'bps_limit_dump' was not declared. Should it be static?

vim +/bps_limit_dump +515 net/core/netclassid_cgroup.c

   514	
 > 515	int bps_limit_dump(struct seq_file *sf, void *v)
   516	{
   517		struct cgroup_subsys_state *css = seq_css(sf);
   518	
   519		if (READ_ONCE(netcls_modfunc.dump_rx_bps_limit_tb) &&
   520		    READ_ONCE(netcls_modfunc.dump_tx_bps_limit_tb)) {
   521			netcls_modfunc.dump_rx_bps_limit_tb(css, sf);
   522			netcls_modfunc.dump_tx_bps_limit_tb(css, sf);
   523		}
   524		return 0;
   525	}
   526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
