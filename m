Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B999A15C8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 03:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675568708; x=1707104708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BXaP6Vfzto2U8OYrz5fiNmQE6NijUYBL6Ay85x3ix0k=;
  b=OyxKZ15i6ZQ5m1kR+nTQjK/Yf4PFcKi4cqANE4qmGZYdiK28smf4TWqW
   N26xVN+eMlSjYiE8/v30vCo69p9cbvvGbk4YnZakT7+Ls5XOP97kH1ZSL
   ulR2DqmkvjaEFD+dst7TfJ/b+ZZMtBT6VRbYuMHi3MPKqbwovY86euZ/Q
   /jBUpnf33TyoP8WKtSwJVWedh6Xd8Eti2zBK20dkY4RqMiJpfXYaJlIqc
   3xRl0kXnka0yDp5sjWagFgXdpeD4DEFmOgKfyZd92SBIoaU2U1Vb/smAf
   GJ7Q04k9QaAOWPnvpHlCNfUsKfWZL6un9iJdZ+IZcl3NSwvmg0vaVXfQt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="317019080"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="317019080"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 19:45:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="774781894"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="774781894"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2023 19:45:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOVxi-0001iK-2N;
	Sun, 05 Feb 2023 03:45:06 +0000
Date: Sun, 5 Feb 2023 11:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 3281/20208]
 drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous
 prototype for 'max11801_read_adc'
Message-ID: <202302051154.XjASkwLm-lkp@intel.com>
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
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230205/202302051154.XjASkwLm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/a414ba2296620d52817e64d747124b9f8efd2507
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout a414ba2296620d52817e64d747124b9f8efd2507
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/input/touchscreen/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous prototype for 'max11801_read_adc' [-Wmissing-prototypes]
     148 | u32 max11801_read_adc(void)
         |     ^~~~~~~~~~~~~~~~~


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
