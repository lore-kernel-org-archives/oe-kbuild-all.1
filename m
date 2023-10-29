Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD28B6AAB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGXTvKUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698612099; x=1730148099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ksCQ21I5OpwAfu+exsHSZ33QXNTChfSlcitGTRKbjic=;
  b=mGXTvKUuUy/ZN8LUCXLHRSOx/5I57l6bwYA6mdWTsfeHpgHlG3qrkXd6
   8yZB0MSuNQMjb9oRAl8bD6ZPU80xKJEQEDI/frwoCx9n0rSYJUpJr0aBK
   xl3RyMsWpSqb3kVCJHPjUWliZTwuCINuMlqtxu6t9G/FuY4Src044n+kM
   JQ4/LI6AcTz8L+gXfCj1BeszA/gJm/XVqtllY+/1vNSY/trswhZkmJFzk
   cmvqlVkYea3rF4ZsxdVLaPb+dM6jav+CaNfjB0JXrkxEZ4ODA3SJT+HoI
   t4gdEkhoAa6aUPKd4Fk7aKoihEWu26Ah6krS53itMVFcKfwUbm9hXgbJf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="6613785"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="6613785"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 13:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="709924199"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="709924199"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Oct 2023 13:41:37 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxCbG-000CoF-2L;
	Sun, 29 Oct 2023 20:41:34 +0000
Date: Mon, 30 Oct 2023 04:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [omap-audio:peter/linux-next-wip 14/49]
 sound/soc/soc-utils.c:251:34: warning: 'soc_dummy_ids' defined but not used
Message-ID: <202310300429.Ha6RbfDX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   18d932095e7671a279370244699bdeb3fc8604de
commit: af5eb07cc05fb27b69939ccac265918a70792539 [14/49] ASoC: soc-utils: HACK: DT binding for snd-soc-dummy
config: x86_64-buildonly-randconfig-001-20231029 (https://download.01.org/0day-ci/archive/20231030/202310300429.Ha6RbfDX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310300429.Ha6RbfDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310300429.Ha6RbfDX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-utils.c:251:34: warning: 'soc_dummy_ids' defined but not used [-Wunused-const-variable=]
     251 | static const struct of_device_id soc_dummy_ids[] = {
         |                                  ^~~~~~~~~~~~~


vim +/soc_dummy_ids +251 sound/soc/soc-utils.c

   250	
 > 251	static const struct of_device_id soc_dummy_ids[] = {
   252		{ .compatible = "linux,snd-soc-dummy", },
   253		{ }
   254	};
   255	MODULE_DEVICE_TABLE(of, soc_dummy_ids);
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
