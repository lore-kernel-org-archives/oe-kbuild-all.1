Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC161800D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 22:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687301884; x=1718837884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SXB6bmu2XCDCaJAgkbP/+73I/9hw2P9u01INyRWorpE=;
  b=TsB4SprAwgb7RzYWkMVjfFoIvfYAgP5Dt5KTFSoQNuxWGpeBKh10639v
   gWb4OivHsD02EhV6o27O9lV0dCAiPu+xcOGKF3s2yH4Bj9braP4cg+ejg
   4EfYkp5xbfOUp1oZwX2T3+3gzib1WPPmYbRbC3BFNK69zoUoAJBZnVPpg
   550NYR3+g+rP7A8wyxAO9UP/GOdPfhrZp95jwKSbUYaKnXlo686wFTU+/
   v4j3soHDq3AKPCRR1X3tfkNFugLvzhaqjl3KdVYXumGhzzu+iyxH6mI3k
   tU+W37fzeBWbevhIDhcCHq+jcLfE0eADyiwxrOIdfOhuP30PkpU+4OGzm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="357499036"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="357499036"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 15:57:43 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="748332208"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="748332208"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Jun 2023 15:57:42 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBkI9-0006JE-26;
	Tue, 20 Jun 2023 22:57:41 +0000
Date: Wed, 21 Jun 2023 06:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenz Bauer <lmb@isovalent.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:b4/so-reuseport 6/7] ERROR: modpost: "inet6_ehashfn"
 [net/ipv6/ipv6.ko] undefined!
Message-ID: <202306210645.LbZoab3Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git b4/so-reuseport
head:   901fb44d8be7b784593f6157b300bf496d4dea4a
commit: f8571d449cb2b318dd4ede6cdf1633380e30315c [6/7] bpf, net: Support SO_REUSEPORT sockets with bpf_sk_assign
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230621/202306210645.LbZoab3Z-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210645.LbZoab3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210645.LbZoab3Z-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "inet6_ehashfn" [net/ipv6/ipv6.ko] undefined!
>> ERROR: modpost: "inet6_ehashfn" [net/dccp/dccp_ipv6.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
