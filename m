Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDF723A0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 08:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682065691; x=1713601691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fNyVgMmX+ELu/ao0cCs28UNw/QFCm27EIbDq0tWZn+s=;
  b=lQydHZqVZpXRAu5rGHgv1aO8dMLrFLvc0IhYbCYqE1cNJOTr/x3vJku0
   6WGjvDNVS6+NPGIzOje5gjFYswHeUF0jRwskjTGPWB8HFS3XkRtXAtaSG
   gDaTHp4SLM4xGaOM3qUfBnb4gXDeLTf6KyBXrsJ+hQOejnElNPB78IEkB
   +GISIXIQ0v7p+F6uElegnj6mcar+2BSVAYsImYfyGyNLuMDBqnm8PPGN6
   ENRRZnM+GdDJY1sP8F3rAaAWVk485iuZYPP8bQteVmx9lkB5m9LvZ3l38
   rrAPSiOPrd0tpL97bAgDVXzknT1PXo6xa3E0fdRa39YhxvcQK1T61tu0n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="345961714"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="345961714"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 01:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="685659614"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="685659614"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Apr 2023 01:28:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppm7k-000gSA-1C;
	Fri, 21 Apr 2023 08:28:08 +0000
Date: Fri, 21 Apr 2023 16:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Colitti <lorenzo@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Amit Pundir <amit.pundir@linaro.org>,
	Hugo Benichi <hugobenichi@google.com>,
	Guenter Roeck <groeck@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 2874/9999]
 net/ipv6/route.c:2623:5: sparse: sparse: symbol 'rt6_addrconf_purge' was not
 declared. Should it be static?
Message-ID: <202304211637.MYwfelKT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: ba363662d10c7893123176454fed878d431c895e [2874/9999] ANDROID: net: ipv6: autoconf routes into per-device tables
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20230421/202304211637.MYwfelKT-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/ba363662d10c7893123176454fed878d431c895e
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout ba363662d10c7893123176454fed878d431c895e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  net/ipv6/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211637.MYwfelKT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv6/route.c:1253:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flow_label @@     got restricted __be32 @@
   net/ipv6/route.c:1253:31: sparse:     expected unsigned int [usertype] flow_label
   net/ipv6/route.c:1253:31: sparse:     got restricted __be32
>> net/ipv6/route.c:2623:5: sparse: sparse: symbol 'rt6_addrconf_purge' was not declared. Should it be static?
   net/ipv6/route.c:2623:5: warning: no previous declaration for 'rt6_addrconf_purge' [-Wmissing-declarations]
    int rt6_addrconf_purge(struct rt6_info *rt, void *arg) {
        ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/bitops.h: Assembler messages:
   arch/x86/include/asm/bitops.h:97: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'

vim +/rt6_addrconf_purge +2623 net/ipv6/route.c

  2622	
> 2623	int rt6_addrconf_purge(struct rt6_info *rt, void *arg) {
  2624		if (rt->rt6i_flags & (RTF_DEFAULT | RTF_ADDRCONF) &&
  2625		    (!rt->rt6i_idev || rt->rt6i_idev->cnf.accept_ra != 2))
  2626			return -1;
  2627		return 0;
  2628	}
  2629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
