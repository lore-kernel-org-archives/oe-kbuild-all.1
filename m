Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8133E13C683
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 01:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727227375; cv=none; b=Dn9aepk93jE6B5aEU0wOO/gp8qoccsBT+H5ju4i4kNhlRUIMyLWHHNBCS8fQEDj/6rbB4NyFsgTe9HazUtxWqIhAUn6whsl+GZqulHasRV3rddhlc/kvos3O1QNaukK4goNJm5SH9ISXrKtB6lFPkWgP4juZ0b40GQUxi3dqdrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727227375; c=relaxed/simple;
	bh=FFKMU6F0q9cZmXVTxjdO9cOSrCUS1W2bo29vSZqN8J8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uAJTaEEZ00b2A/XgNDOB5z0qGxM8LMjYWndgt/mAviCqAvIco8RzA4MygaQIlptABUavuoFpxFlnYVPf2jEmVVVbOivOBwB5Bmjqief2BZk08NVrCYyE1hND22kGuLQk/BtVtyJAKBrKJRNLSv52ZSIpS/+4pVfuNP+82HSYttI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iexre26O; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iexre26O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727227373; x=1758763373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFKMU6F0q9cZmXVTxjdO9cOSrCUS1W2bo29vSZqN8J8=;
  b=iexre26O1TBxuh36r2YNSz3ncg/0Fbje2bmfp2V2Qgr5PmIiOu0tjsxi
   n2FKVqqg5BBgKpJl2n7vLNuZcgYHc0IV0d+xdCFue5f0FeQsXpUv9+/G2
   q8T37pf4hBoC0OkEphfpkC8FR5Aomz7L2xk5ayV6xYfGqSmKCnXMh7qQD
   Xj2ULAcZgze0U/8MoA5sWrZJSr1RzF3/5T1VLgRDu/xrZ9QkJhmH8Q0Dl
   JV/Em8AOKKdn8iSlY2C5LMjyYYFn91uHkwT1gfkyvEI2QiaiaUv6NNMys
   owfq6kslTdhZFpptwN+jugEWWPCA4X5nSkFTm3HnQxdjiWKmrGgfRDHXh
   g==;
X-CSE-ConnectionGUID: OD2BObr2SSes4F3YCQZnZA==
X-CSE-MsgGUID: q+7oIlMKRoK/EBkoT2J2nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="36920963"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="36920963"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 18:22:53 -0700
X-CSE-ConnectionGUID: mOMAL037S+aACS3SgLnuyQ==
X-CSE-MsgGUID: UhYI61/iRlGQc7E1BK2OzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="76364296"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Sep 2024 18:22:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stGjv-000J19-1Y;
	Wed, 25 Sep 2024 01:22:47 +0000
Date: Wed, 25 Sep 2024 09:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2213/2441]
 mm/mempolicy.c:137: warning: Function parameter or member 'node' not
 described in 'numa_map_to_online_node'
Message-ID: <202409250943.YA7ZdUrX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: a894358930999e6c2cbc7c2d6f2badbd91520c4c [2213/2441] ACPI: NUMA: Up-level "map to online node" functionality
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240925/202409250943.YA7ZdUrX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250943.YA7ZdUrX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250943.YA7ZdUrX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mempolicy.c:137: warning: Function parameter or member 'node' not described in 'numa_map_to_online_node'
>> mm/mempolicy.c:137: warning: Excess function parameter 'nid' description in 'numa_map_to_online_node'


vim +137 mm/mempolicy.c

   129	
   130	/**
   131	 * numa_map_to_online_node - Find closest online node
   132	 * @nid: Node id to start the search
   133	 *
   134	 * Lookup the next closest node by distance if @nid is not online.
   135	 */
   136	int numa_map_to_online_node(int node)
 > 137	{
   138		int min_node;
   139	
   140		if (node == NUMA_NO_NODE)
   141			node = 0;
   142	
   143		min_node = node;
   144		if (!node_online(node)) {
   145			int min_dist = INT_MAX, dist, n;
   146	
   147			for_each_online_node(n) {
   148				dist = node_distance(node, n);
   149				if (dist < min_dist) {
   150					min_dist = dist;
   151					min_node = n;
   152				}
   153			}
   154		}
   155	
   156		return min_node;
   157	}
   158	EXPORT_SYMBOL_GPL(numa_map_to_online_node);
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
