Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4EC4652E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 12:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zw1K/pIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701347109; x=1732883109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iEJ1Tt6ERbcPGPmZIeBow8bm9jAVlrnOORNE1petXpM=;
  b=Zw1K/pIZQzg61aKhpKPJIC20C9cz3SvLNWuAqrUMsW9WYN1jOQomfVwQ
   PWoJk9P5JQ8dNxR7pfBZs0mqNkn6/Z5Fm5aPgJemtT5bQB5fvwDjPujYa
   CMLoerPbEE2htsQHY4qYkjWJP28H8grolcGfA0UOikL/3Pa0eJGTC6fBq
   7bFmsel1bTlVZp8Uo9HZkvXlMFv83VeIANdKSRCrosLpDPIozqAMgQDdv
   RWeLP4+nDU21B4Gf5grZFds/+1iWwISPzlsr+Gym47AFQ5FErXXexlQO/
   QoEH1zIbi9vO3bQ7hW+YINYTsxdpGjH0aPtyWC/Oa8nok0wE11d45ftLX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="393059318"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="393059318"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 04:25:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="942696270"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942696270"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 04:25:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8g6L-0001sW-2i;
	Thu, 30 Nov 2023 12:25:05 +0000
Date: Thu, 30 Nov 2023 20:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:rcu/dev 2/5] tree.c:undefined reference to
 `call_rcu_nocb'
Message-ID: <202311302035.y0RaMgz7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/dev
head:   747bcee76f689e850284b297c4174b9303445d1a
commit: cae6d648e4b784e345810ceb21dfdb9f9b5e7841 [2/5] rcu/nocb: Re-arrange call_rcu() NOCB specific code
config: x86_64-buildonly-randconfig-004-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302035.y0RaMgz7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302035.y0RaMgz7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302035.y0RaMgz7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/rcu/tree.o: in function `__call_rcu_common.constprop.0':
>> tree.c:(.text+0xf106): undefined reference to `call_rcu_nocb'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
