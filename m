Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B61193
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 02:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679625359; x=1711161359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VBF+ycG5fs3k8LlNB8Gn3AJN3rz4Hd33qLkoXX/pOsk=;
  b=HpZ8nnZe05ClUVvg4zg09tw5KbvBQmkTvxM71GiPtTpO8Fxbcl+iq1dJ
   ckm7+oxP9bcXKcciAmtgt5lV9p3/FE1dzuBl94wRqmB128ATEYKSzCL1m
   U537Ri/dXTdRJioFtDfXF0H63uFryuD38qtl6931reEZy/PUmxF/o3OjP
   VSTLVPtRo3z4oiSQv3fD5chhWYCqpAOz5y37D/ABDbHTLx9SDuVRrLRva
   qr5TmU0eX9vLlqvhu9t2trH6bzwdqMWLHBy3oUWDQ2LImDOmLDMXG1NwW
   7v/zCo/TolULzt5LmLsfKDCCOxmO3gGOMMkNmDUrfMgaNqvM978plkl6P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="328089339"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="328089339"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 19:35:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="746990100"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="746990100"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 19:35:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfXHW-000Eui-1J;
	Fri, 24 Mar 2023 02:35:54 +0000
Date: Fri, 24 Mar 2023 10:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
	Grzegorz Bernacki <gjb@semihalf.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] i2c: designware: Use PCI PSP driver for
 communication
Message-ID: <202303241037.WtZWjxfx-lkp@intel.com>
References: <20230322210227.464-4-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322210227.464-4-mario.limonciello@amd.com>

Hi Mario,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on e6af5c0c4d32a27e04a56f29aad587e03ff427f1]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/crypto-ccp-Bump-up-doorbell-debug-messages-to-error/20230323-050710
base:   e6af5c0c4d32a27e04a56f29aad587e03ff427f1
patch link:    https://lore.kernel.org/r/20230322210227.464-4-mario.limonciello%40amd.com
patch subject: [PATCH v6 3/4] i2c: designware: Use PCI PSP driver for communication
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230324/202303241037.WtZWjxfx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/addff0f32acff3a5278cbbf6fffc9054ecb03e2f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mario-Limonciello/crypto-ccp-Bump-up-doorbell-debug-messages-to-error/20230323-050710
        git checkout addff0f32acff3a5278cbbf6fffc9054ecb03e2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303241037.WtZWjxfx-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `psp_send_i2c_req':
>> i2c-designware-amdpsp.c:(.text+0x77): undefined reference to `psp_send_platform_access_msg'
   ld: i2c-designware-amdpsp.c:(.text+0xbb): undefined reference to `psp_send_platform_access_msg'
   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `i2c_dw_amdpsp_probe_lock_support':
>> i2c-designware-amdpsp.c:(.text+0x400): undefined reference to `psp_check_platform_access_status'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
