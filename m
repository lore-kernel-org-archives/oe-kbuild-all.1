Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7432C7F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675242681; x=1706778681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uqXlT+Xg15k4VpWdD0CJpRQuzrNg5oTDihQukvjG8W0=;
  b=QV4yqRtHeoKhpt6SHHGASAv4lPV/7r/BT363pyaPg3Lad3Zr5mlJQrue
   QsTnDpLpInRQJE8/CUH6kN007tmwB0l0zQD6xB7VjGzvQVEoaI4jDdi0o
   zJwe98yvIh8bgsHPAXigq2cFCu013yadzlW5SdGoN6EF1mnGBbFBL+iOs
   WgAUD/wFLIp03Nwc7ghf+gridFiG1jLZyGwNXr6TEGvAuhQhfN4ePSYS1
   zqAOqq8jrUHU6ctVoHN3AkJKsTh7Om6b4pG+qeaOHu13NUO2JY/5DxHJP
   diTBPq3fTP7uXiqMW0C/nd3/3Wx9IYOVJP7hLhT+o4LSakQ9rmSweIyg6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="328103571"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="328103571"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 01:11:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="910264269"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="910264269"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2023 01:11:19 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN99C-0005IV-1e;
	Wed, 01 Feb 2023 09:11:18 +0000
Date: Wed, 1 Feb 2023 17:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org
Subject: [cxl:for-6.3/cxl-ram-region 17/18] port.c:undefined reference to
 `cxl_add_to_region'
Message-ID: <202302011700.R8sickqk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.3/cxl-ram-region
head:   c30a50b37b7808284c3796e0866e939017bb05b2
commit: f71922e583ef6b6e17575c87e496b17f91193d37 [17/18] cxl/region: Add region autodiscovery
config: arm-randconfig-c002-20230130 (https://download.01.org/0day-ci/archive/20230201/202302011700.R8sickqk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=f71922e583ef6b6e17575c87e496b17f91193d37
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl for-6.3/cxl-ram-region
        git checkout f71922e583ef6b6e17575c87e496b17f91193d37
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/cxl/port.o: in function `discover_region':
>> port.c:(.text+0x144): undefined reference to `cxl_add_to_region'
   `.exit.text' referenced in section `.alt.smp.init' of drivers/mtd/ubi/gluebi.o: defined in discarded section `.exit.text' of drivers/mtd/ubi/gluebi.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
