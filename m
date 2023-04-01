Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EB62568
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 07:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680334834; x=1711870834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=so7Tv3PbOoCVg30sltNvrsn3ur5lYbJmpFhNM1zc+zI=;
  b=XEgP3cEBN8BjhZfTf1C31RF7cwNG/ppTdSkH20vtvyp56SuWGRuqquzj
   DegwJ+BwellEKUsLMkPKzAZ3IIOWqWS1kB6GBvicgePvW2/rtO+sFqdZr
   37C60Ri6YoaSQMmu5EMPaQqP0S23MqrHlrxYzP1eLWs0MM68Z2+UEvbeN
   uudjRseoTVjNJGeCfY5w64aLSr08Hf82V7prxJgBW86l86O7fJ7tJqte4
   +o6fHO8Zw17/V47B0Im3iy8bXggL3fZ6KkOnNh/GFclzEsYjN35u04d+O
   IhShFA02lBjmW5bBi+/DG3KVKSD1uvQ3nnR/eSypkHzTar41KCa5HwH1P
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="341647192"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="341647192"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 00:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="717982289"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="717982289"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Apr 2023 00:40:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piVqV-000MbX-0C;
	Sat, 01 Apr 2023 07:40:19 +0000
Date: Sat, 1 Apr 2023 15:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
	Grzegorz Bernacki <gjb@semihalf.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Felix Held <Felix.Held@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/6] i2c: designware: Use PCI PSP driver for
 communication
Message-ID: <202304011558.PgIDB9Fr-lkp@intel.com>
References: <20230329220753.7741-6-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329220753.7741-6-mario.limonciello@amd.com>

Hi Mario,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 9117e682b8b79f7b5e2517fd28d42757d3e8b860]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/crypto-ccp-Drop-extra-doorbell-checks/20230330-060959
base:   9117e682b8b79f7b5e2517fd28d42757d3e8b860
patch link:    https://lore.kernel.org/r/20230329220753.7741-6-mario.limonciello%40amd.com
patch subject: [PATCH v7 5/6] i2c: designware: Use PCI PSP driver for communication
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230401/202304011558.PgIDB9Fr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/0bb8c75c296f066a77162eacc6170c0d8fbcf0b6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mario-Limonciello/crypto-ccp-Drop-extra-doorbell-checks/20230330-060959
        git checkout 0bb8c75c296f066a77162eacc6170c0d8fbcf0b6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304011558.PgIDB9Fr-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `psp_send_i2c_req':
>> i2c-designware-amdpsp.c:(.text+0x77): undefined reference to `psp_send_platform_access_msg'
   ld: i2c-designware-amdpsp.c:(.text+0xbb): undefined reference to `psp_send_platform_access_msg'
   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `i2c_dw_amdpsp_probe_lock_support':
>> i2c-designware-amdpsp.c:(.text+0x400): undefined reference to `psp_check_platform_access_status'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
