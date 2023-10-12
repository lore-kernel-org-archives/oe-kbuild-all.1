Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB58420328
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 08:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euO9zaJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697099664; x=1728635664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fLr9JDuXGXEEBt3n9xMWLVFfRzozIXFEf73WvvxLFks=;
  b=euO9zaJS3/i9bNueWxY2x4HyRlcwT3DI4vSYnItUhGUCjM2WT+diN3QB
   sfg+/NK9DPxBYYWkosZy3HUwGZa23aDShOP+W33ZG5I+u8ZHW8jzh/ndQ
   LO1sJXqVeAGx+DNpmJZ9hvMjMnaxMgPb+0L5dljU7GzUSYgh0c1YxxfuB
   JY0Y3NNJNVEAZw+2op0ZjMpqKNfLxifCfi9zu0CCJWS3nX0ie5Do9HWVQ
   rbYbnvfnbHGAMKy66UxA1ltc/4RKfY/3uVF4T9tDPc9+7KfkjhPrVwDyj
   2qz/+fGOvboZA8G6zH6je4CIdXiXNomQCPrdB+W4b8iyid9C8a1hHZUh/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="387703202"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="387703202"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 01:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="783606148"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="783606148"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2023 01:34:23 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqr9A-0003Kb-2u;
	Thu, 12 Oct 2023 08:34:20 +0000
Date: Thu, 12 Oct 2023 16:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: iuncuim <iuncuim@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linusw-pinctrl:ib-no-global-numberspace 23/66] checkpatch: WARNING:
 please, no space before tabs
Message-ID: <202310121620.67Sd8Prj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-no-global-numberspace
head:   c341ac65bf2bf297a6e4db61c34c00971876fad6
commit: 44da5bf49bf4ea20028cda5a803de0a8421b309e [23/66] pinctrl: sunxi: h616: add extra gpio banks
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121620.67Sd8Prj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121620.67Sd8Prj-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#194: FILE: drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c:267:
+^I^I  SUNXI_FUNCTION(0x4, "ts0"), ^I^I/* D5 */$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#201: FILE: drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c:274:
+^I^I  SUNXI_FUNCTION(0x4, "ts0"), ^I^I/* D6 */$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#208: FILE: drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c:281:
+^I^I  SUNXI_FUNCTION(0x4, "ts0"), ^I^I/* D7 */$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#215: FILE: drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c:288:
+^I^I  SUNXI_FUNCTION(0x4, "sim"), ^I^I/* VPPEN */$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
