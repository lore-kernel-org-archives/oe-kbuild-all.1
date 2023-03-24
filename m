Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A21519B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679677589; x=1711213589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oMhpbW95JIXnJW0a6vHScDbWzdU98egdJa4Ol49wsNI=;
  b=FJEfOFDeXUq8+DN/T+ySj3bHSuztzpBzMdgMvUc7x1VKScGhzrmuq0BV
   E3C2ouoLFiJjyZvhXHRfAjxJ/zapRNn0/ysnR0coMIm50zAzlHZjyTm3h
   a6yrJDZzXaSrNAUWXNsDA2Swjahcqx/Ci/lzM2gtywb/uVS7LZQ4Kqe5u
   sy3F+HUCn2jfXVFwWZCwSDxn7v1zOZGxeW1D2y7eAZ4dpcaU0gROAfCwI
   pWe4HMUSFYznBQlU/u680B+1fFaFvfob448Q7hmq4XvHo3EVfGsf+d9B7
   WH6BPQPBSsYIE5N830ujd8gahztB5NHFzYyepxmVlZbAiSGvK0PrdGkGS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="337334746"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="337334746"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 10:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="1012343604"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="1012343604"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2023 10:06:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfkrx-000FUt-0j;
	Fri, 24 Mar 2023 17:06:25 +0000
Date: Sat, 25 Mar 2023 01:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 6/7] net: ethernet: altera-tse: Convert to mdio-regmap and
 use PCS Lynx
Message-ID: <202303250021.qYlsLPIN-lkp@intel.com>
References: <20230324093644.464704-7-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324093644.464704-7-maxime.chevallier@bootlin.com>

Hi Maxime,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on broonie-regmap/for-next]
[also build test ERROR on lee-mfd/for-mfd-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.3-rc3 next-20230324]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/regmap-add-a-helper-to-translate-the-register-address/20230324-173909
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next
patch link:    https://lore.kernel.org/r/20230324093644.464704-7-maxime.chevallier%40bootlin.com
patch subject: [RFC 6/7] net: ethernet: altera-tse: Convert to mdio-regmap and use PCS Lynx
config: x86_64-randconfig-a002 (https://download.01.org/0day-ci/archive/20230325/202303250021.qYlsLPIN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/38972c069ffca67815b706f76938d49e7a8a48a6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Chevallier/regmap-add-a-helper-to-translate-the-register-address/20230324-173909
        git checkout 38972c069ffca67815b706f76938d49e7a8a48a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250021.qYlsLPIN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "lynx_pcs_create" [drivers/net/ethernet/altera/altera_tse.ko] undefined!
>> ERROR: modpost: "devm_mdio_regmap_register" [drivers/net/ethernet/altera/altera_tse.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
