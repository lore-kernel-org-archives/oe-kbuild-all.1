Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4427C4C80
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 17:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPG1NGDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705166275; x=1736702275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QiC6m2Qa6XQdsXhen+edmBW/UUThG5hng8zp++UWkVI=;
  b=iPG1NGDWi2K15UjozLgSc12EAqx0fNegQPJ3WLZpMbaWTgU2g/pXSYyU
   XgV24GAFhrMylF9j00JW2oLvFJGr+8cdtYA4E/p3Vp4Evyid+BQcNxRPG
   cJt8MiUIlaMcvwb2vQfNlKMiMa0MDdhxjsd2LnNT8wm0TtD2R90iyGjYE
   x7nBGfz1iC0e8NtkdIDqaDv6TzjQSm94PEeW6CYIOX96pbsr6OtjBRgmt
   6qSMKPMrQeFg/KafpeURRCsaRTRr/CodAFWl6+DeO5kjnjuxENgUMFJ6o
   Ma53XRJ26IAn0Fy8T0mZv7i2ymDOxI0XUWF57jTB59ElvNr5iol+PeT1S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6749302"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6749302"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 09:17:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="1030232335"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="1030232335"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2024 09:17:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOhdm-000Ak6-39;
	Sat, 13 Jan 2024 17:17:50 +0000
Date: Sun, 14 Jan 2024 01:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18558/21544]
 drivers/gpio/gpio-dwapb.c:74:19: warning: 'enable_ascend_gpio_dwapb_setup'
 defined but not used
Message-ID: <202401140127.rrnVm88K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 98845af7200023d1f410ba8d39b847e236aec627 [18558/21544] GPIO : support ascend_gpio_dwapb_enable switch
config: x86_64-randconfig-001-20240112 (https://download.01.org/0day-ci/archive/20240114/202401140127.rrnVm88K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140127.rrnVm88K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140127.rrnVm88K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-dwapb.c:74:19: warning: 'enable_ascend_gpio_dwapb_setup' defined but not used [-Wunused-function]
      74 | static int __init enable_ascend_gpio_dwapb_setup(char *str)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/enable_ascend_gpio_dwapb_setup +74 drivers/gpio/gpio-dwapb.c

    73	
  > 74	static int __init enable_ascend_gpio_dwapb_setup(char *str)
    75	{
    76		enable_ascend_gpio_dwapb = true;
    77	
    78		return 1;
    79	}
    80	__setup("enable_ascend_gpio_dwapb", enable_ascend_gpio_dwapb_setup);
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
