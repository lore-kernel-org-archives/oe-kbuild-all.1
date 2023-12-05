Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2815C8E4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKjFKgW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701787765; x=1733323765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5BfSPwtkFKNjf74wdkQaZdOU6EyNAbQucBZwvrv3qxg=;
  b=EKjFKgW6lKouoY+h5CWbKLFSROAsB7em8iOsbVYqKlFC//g37zSxevD/
   KIwk250h4zME4FhjRxxR0wTLJu5jrYZ5Ywhxl/0Ybi5nQYfUzsooZ/bd8
   Mriqr4hRuIgs22mB56VmjXiuL3wz6m/q0+62l7OFmINWGFjtMDoStac//
   e74i+IWRDJPet8YWvLWERupe8fQkNTE1pJK8qFGnKiP6AhReeP302bI3F
   klmzmivpCpYSBZSq7Goz0Cnr4AGrIM8kvJNFHvIlQ0frNF8hp3q9tDBj6
   zqMhBhgZ+PCoi6MCkNsCiA3zIam6pYyyeb3eYI8xUevvGZlB2lbiLhGq4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="966779"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="966779"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 06:49:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="770942108"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="770942108"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Dec 2023 06:49:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAWjg-0009Cc-3D;
	Tue, 05 Dec 2023 14:49:20 +0000
Date: Tue, 5 Dec 2023 22:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next v3 01/13] net: phy: Introduce ethernet link
 topology representation
Message-ID: <202312052242.clGBJHud-lkp@intel.com>
References: <20231201163704.1306431-2-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201163704.1306431-2-maxime.chevallier@bootlin.com>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-phy-Introduce-ethernet-link-topology-representation/20231202-003935
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231201163704.1306431-2-maxime.chevallier%40bootlin.com
patch subject: [RFC PATCH net-next v3 01/13] net: phy: Introduce ethernet link topology representation
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20231205/202312052242.clGBJHud-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052242.clGBJHud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052242.clGBJHud-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: net/core/dev.o: in function `alloc_netdev_mqs':
>> (.text+0x562a): undefined reference to `phy_link_topo_init'
>> csky-linux-ld: (.text+0x56fc): undefined reference to `phy_link_topo_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
