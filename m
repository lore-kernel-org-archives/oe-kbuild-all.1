Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71D61FB7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 06:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675577361; x=1707113361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+EIyP2jewDCfedDmCPuywV5DtPx3VhsQcWxAPri4MPU=;
  b=jqraYIMGwWwREpweUmhNLMcy9hpTQpMV+4kEMITqCvfEr6me9NTiy8DE
   KvIsCSiac/K5+uo+NSNbfCRi5wgrxDhjaXu40Q9xrPv9/+WOMIrFOMOzm
   HLkxfu7bfy19SV8sJkzVnTFw+UbzspJOJkbOcNmjqfJK+8Q8ehqWqYJCt
   ClPARJeLSiScxneiHI9HW29DjPhM7rbfb93cUHGnVjD0rVfAHoYxV4otz
   TojDT9b+gUxmHzTTxNqVadoxj8pzOUCrro4UmNTDD+AHuN/0fLGnZhrT+
   lxPW1H71URZOo5k0VSIP2O2adHoGsyE7uiaylrUnFwTFINR2qwyV5xWwI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="312678441"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="312678441"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 22:09:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="754917432"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="754917432"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2023 22:09:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOYD8-0001mh-07;
	Sun, 05 Feb 2023 06:09:10 +0000
Date: Sun, 5 Feb 2023 14:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 3281/20208]
 drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous
 prototype for function 'max11801_read_adc'
Message-ID: <202302051344.sB2t76Wy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robin,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: a414ba2296620d52817e64d747124b9f8efd2507 [3281/20208] MLK-11703-1: input: touchscreen: max11801_ts: Add DCM mode for max11801 ADC
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230205/202302051344.sB2t76Wy-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/a414ba2296620d52817e64d747124b9f8efd2507
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout a414ba2296620d52817e64d747124b9f8efd2507
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/input/touchscreen/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous prototype for function 'max11801_read_adc' [-Wmissing-prototypes]
   u32 max11801_read_adc(void)
       ^
   drivers/input/touchscreen/max11801_ts.c:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 max11801_read_adc(void)
   ^
   static 
   1 warning generated.


vim +/max11801_read_adc +148 drivers/input/touchscreen/max11801_ts.c

   147	
 > 148	u32 max11801_read_adc(void)
   149	{
   150		u32 adc_data;
   151	
   152		if (!max11801_client) {
   153			pr_err("FAIL  max11801_client not initialize\n");
   154			return -1;
   155		}
   156		adc_data = max11801_dcm_sample_aux(max11801_client);
   157	
   158		return adc_data;
   159	}
   160	EXPORT_SYMBOL_GPL(max11801_read_adc);
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
