Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264A53112C9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756386815; cv=none; b=q1+gOzplWG0YZqYjZzsjg9YNwcrlmL8YF5fvX/g+1Skus176pTlyYkFo1UVHKauv64t8t+VIfwurIYsn+ZAHEQSsv6xciccit+tCaQV2o/qAzAg5xmjGhNMQvCwKJvrhbW8kxfxF0Egyswp3qN2oJBkQXzNTPj6Txf2bFX6d2os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756386815; c=relaxed/simple;
	bh=WY1dZ6ZZY2bUYwP3VosUZIjcxxJScADqwcpA3SymxfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hhey7SZFxiJ81PH9oWABaD8qnusTJB1GbcKg2myxfP1D2yngQwBVzgImXVow5+QqSVnmWPi+5/2ed7oT+BhH/DY6lwjpjorLTQD/qTFeLEkCEEqJHLK5yaAe1bHdbS0k5Vb7tKL/d2SaCBWbL0K5lsNGX7YQ7os+FZRWFxiFWns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miueD5V/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miueD5V/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756386813; x=1787922813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WY1dZ6ZZY2bUYwP3VosUZIjcxxJScADqwcpA3SymxfY=;
  b=miueD5V/HdF5H4lxV44ol6GyJXdRzEGM7FABSeLNQdIEyl1ofuhAhuq6
   xiPKcP5AlglF77+VNNfC0xsdg97Ua1WaTa9k3LQ5jM0vk17KekAhfBH3X
   +WT9usC+ugakPmDLJ/pmnq21QqCax0MNoRscfkhtk9qcHvBbGrH21NH3G
   WvzlMh9b2RsayQo3MZjQ6ZwU56P4NnnzWbcChOArI2+A6FPEGqeiA1TW5
   Wz+kzcxF1agWjv+VIGx5C5pX8XnnNVoTB4x7dCR1Va+QJhRpk2suRVSut
   uyotRhIQmJjss0Kxkz2tEO3G2xuvjoNugDQ78FxrDkptMF0EGiABn6pSj
   g==;
X-CSE-ConnectionGUID: cLSIj9ShTpeNZVitUetBug==
X-CSE-MsgGUID: G29Ds5KSQ/G9wTU+k8cnOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58578709"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58578709"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 06:13:32 -0700
X-CSE-ConnectionGUID: /wJPuIcaRWm4EVlrJc+F5w==
X-CSE-MsgGUID: ISShn8xgQZScIjJMe8jlHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170280496"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Aug 2025 06:13:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urcQc-000TiJ-0W;
	Thu, 28 Aug 2025 13:12:55 +0000
Date: Thu, 28 Aug 2025 21:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Liang <wangliang74@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2784/2784] net/oenetcls/oenetcls_flow.c:18:6:
 warning: no previous prototype for function 'is_oecls_config_netdev'
Message-ID: <202508282115.FeEkHc1L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ed9bff77568b702badeef2b7c7776bb93d993768
commit: 4bed6ba0e88f50484fd5fb06bd993727b981b718 [2784/2784] net/oenetcls: introduce oenetcls for network optimization
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250828/202508282115.FeEkHc1L-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508282115.FeEkHc1L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508282115.FeEkHc1L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/oenetcls/oenetcls_flow.c:18:6: warning: no previous prototype for function 'is_oecls_config_netdev' [-Wmissing-prototypes]
      18 | bool is_oecls_config_netdev(const char *name)
         |      ^
   net/oenetcls/oenetcls_flow.c:18:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      18 | bool is_oecls_config_netdev(const char *name)
         | ^
         | static 
   1 warning generated.


vim +/is_oecls_config_netdev +18 net/oenetcls/oenetcls_flow.c

    17	
  > 18	bool is_oecls_config_netdev(const char *name)
    19	{
    20		struct oecls_netdev_info *netdev_info;
    21		int netdev_loop;
    22	
    23		for_each_oecls_netdev(netdev_loop, netdev_info)
    24			if (strcmp(netdev_info->dev_name, name) == 0)
    25				return true;
    26	
    27		return false;
    28	}
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
