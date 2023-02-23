Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FFB15CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 03:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677122746; x=1708658746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qEmfvLFkZpc0n6B4dO4WEsiB8copDwAp/pIr2RY0pQ0=;
  b=UhhwOUM3WVXHV4ynI9tyli/4FO9ZoVj8Ap58MxJXtiAMgWW2WFzJUWIO
   iPu6M/clcdVhDv0J0ScM8jJ+Ap+zvay+5Ah4Rzj7zEjqLlSYBuTnDeWrB
   vDpaoAQAalUO4ssnMQcZJEdSTAYk0S0JBTbRGZV0EkLHvppBLFiH3nFsC
   77ZTsKGjI6uUzP1GOdu+7nuNgmrcMp2djD8kh9B2bMQBdlnamQ7c9gj7R
   RJTnPsQJnJICbB7USQbhXfcNjaoqXjwoV4wXN8DxCz2UDINEkMot5kUgn
   JT5jJh/l1EnUgkEFf83EDc3XaeMPXLlMBiTzaGwDeAUYS2O8gYDidmc5B
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="331774184"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="331774184"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 19:25:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="672315709"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="672315709"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Feb 2023 19:25:43 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV2Eo-0000xB-2F;
	Thu, 23 Feb 2023 03:25:42 +0000
Date: Thu, 23 Feb 2023 11:24:48 +0800
From: kernel test robot <lkp@intel.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/6] iio: light: ROHM BU27034 Ambient Light Sensor
Message-ID: <202302231148.uCHHqvZW-lkp@intel.com>
References: <63a2dbedf54e2e00e3b63dd16aae190ff6596355.1677080089.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63a2dbedf54e2e00e3b63dd16aae190ff6596355.1677080089.git.mazziesaccount@gmail.com>

Hi Matti,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on 5dc4c995db9eb45f6373a956eb1f69460e69e6d4]

url:    https://github.com/intel-lab-lkp/linux/commits/Matti-Vaittinen/dt-bindings-iio-light-Support-ROHM-BU27034/20230223-001713
base:   5dc4c995db9eb45f6373a956eb1f69460e69e6d4
patch link:    https://lore.kernel.org/r/63a2dbedf54e2e00e3b63dd16aae190ff6596355.1677080089.git.mazziesaccount%40gmail.com
patch subject: [RFC PATCH 5/6] iio: light: ROHM BU27034 Ambient Light Sensor
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230223/202302231148.uCHHqvZW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/be18bb6dc4a00283449815d2ec581dfbf37661ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matti-Vaittinen/dt-bindings-iio-light-Support-ROHM-BU27034/20230223-001713
        git checkout be18bb6dc4a00283449815d2ec581dfbf37661ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/iio/light/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231148.uCHHqvZW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/light/rohm-bu27034.c:189:41: warning: 'bu27034_ro_regs' defined but not used [-Wunused-const-variable=]
     189 | static const struct regmap_access_table bu27034_ro_regs = {
         |                                         ^~~~~~~~~~~~~~~


vim +/bu27034_ro_regs +189 drivers/iio/light/rohm-bu27034.c

   188	
 > 189	static const struct regmap_access_table bu27034_ro_regs = {
   190		.no_ranges = &bu27034_read_only_ranges[0],
   191		.n_no_ranges = ARRAY_SIZE(bu27034_read_only_ranges),
   192	};
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
