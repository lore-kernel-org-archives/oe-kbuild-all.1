Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD7F1102
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 04:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lql65WHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702785801; x=1734321801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Apujb/EqDh1ai87ma+E8sbaJrOStgVOewoP49wuhTzw=;
  b=Lql65WHfZ0OVNyEHRBvyiRk/WYvezgyzZvEx2r+8q0sjoA60sqB75YsO
   mmk33W03SvBpYsJmqZIFAieBL+iFvt9NHSv7zIeU6tSzjjqOCFQkmutss
   tODfCnKogmNmXCTCGsPKOqeFNMDnZNdgiSODKRxbkrOoeGnJNTa1T7N01
   Qubp46tOiMxP97U4/3LM/H9CnB4SS/RGX/7Beo8qpuVL3bnC2e3B0ycx1
   rJJBpq0RgdKCPyi3mBTKLZA0p8qn7BQxdtSmMzO2WDewIMtEh1bjTjsso
   DssdmQ979BKUsbU69x274uybY1nJJZp8XMxQS26+YfL0krFAFDJzyZLJQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="375551369"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="375551369"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 20:03:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768443180"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="768443180"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2023 20:03:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEiN2-0002c1-0D;
	Sun, 17 Dec 2023 04:03:16 +0000
Date: Sun, 17 Dec 2023 12:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3332/16025]
 ./usr/include/linux/imx_vpu.h:22:1: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202312171122.HRjyMx56-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: b82c78d77f16b30cffdd304eb2c6c1a3ab4f68ba [3332/16025] arm64: imx8mx: vpu: add vsi v4l2 decoder and encoder
config: i386-randconfig-015-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171122.HRjyMx56-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171122.HRjyMx56-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171122.HRjyMx56-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/imx_vpu.h:17,
                    from <command-line>:
   usr/include/linux/videodev2.h:2437:41: error: field 'timestamp' has incomplete type
    2437 |         struct timespec                 timestamp;
         |                                         ^~~~~~~~~
>> ./usr/include/linux/imx_vpu.h:22:1: error: C++ style comments are not allowed in ISO C90
      22 | //ctrls & extension ctrls definitions
         | ^
   ./usr/include/linux/imx_vpu.h:22:1: note: (this will be reported only once per input file)
   ./usr/include/linux/imx_vpu.h:111:9: warning: extra tokens at end of #endif directive [-Wendif-labels]
     111 | #endif  //#ifndef __LINUX_IMX_VPU_H
         |         ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
